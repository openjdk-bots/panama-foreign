/*
 * Copyright (c) 1997, 2021, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

package sun.awt;

import java.awt.AWTException;
import java.awt.EventQueue;
import java.awt.event.InputMethodEvent;
import java.awt.font.TextAttribute;
import java.awt.font.TextHitInfo;
import java.awt.peer.ComponentPeer;
import java.text.AttributedString;

import sun.util.logging.PlatformLogger;

/**
 * Input Method Adapter for XIM for AIX
 *
 * @author JavaSoft International
 */
public abstract class X11InputMethod extends X11InputMethodBase {

    // to keep the instance of activating if IM resumed
    protected static X11InputMethod activatedInstance = null;

    /**
     * Constructs an X11InputMethod instance. It initializes the XIM
     * environment if it's not done yet.
     *
     * @throws AWTException if XOpenIM() failed.
     */
    public X11InputMethod() throws AWTException {
        super();
    }

    /**
     * Reset the composition state to the current composition state.
     */
    protected void resetCompositionState() {
        if (compositionEnableSupported && haveActiveClient()) {
            try {
                /* Restore the composition mode to the last saved composition
                   mode. */
                setCompositionEnabled(savedCompositionState);
            } catch (UnsupportedOperationException e) {
                compositionEnableSupported = false;
            }
        }
    }

    /**
     * Activate input method.
     */
    public synchronized void activate() {
        activatedInstance = this;
        clientComponentWindow = getClientComponentWindow();
        if (clientComponentWindow == null)
            return;

        if (lastXICFocussedComponent != null) {
            if (log.isLoggable(PlatformLogger.Level.FINE)) {
                log.fine("XICFocused {0}, AWTFocused {1}",
                         lastXICFocussedComponent, awtFocussedComponent);
            }
            if (lastXICFocussedComponent != awtFocussedComponent) {
                ComponentPeer lastXICFocussedComponentPeer = getPeer(lastXICFocussedComponent);
                if (lastXICFocussedComponentPeer != null) {
                    setXICFocus(lastXICFocussedComponentPeer, false, isLastXICActive);
                }
            }
            lastXICFocussedComponent = null;
        }

        if (pData == 0) {
            if (!createXIC()) {
                return;
            }
            disposed = false;
        }

        /*  reset input context if necessary and set the XIC focus
        */
        resetXICifneeded();
        ComponentPeer awtFocussedComponentPeer = getPeer(awtFocussedComponent);
        setStatusAreaVisible(true, pData);

        if (awtFocussedComponentPeer != null) {
            setXICFocus(awtFocussedComponentPeer, true, haveActiveClient());
        }
        lastXICFocussedComponent = awtFocussedComponent;
        isLastXICActive = haveActiveClient();
        isActive = true;
        if (savedCompositionState) {
            resetCompositionState();
        }
    }

    /**
     * Deactivate input method.
     */
    public synchronized void deactivate(boolean isTemporary) {
        boolean   isAc =  haveActiveClient();
        /* Usually as the client component, let's call it component A,
           loses the focus, this method is called. Then when another client
           component, let's call it component B,  gets the focus, activate is first called on
           the previous focused component which is A, then endComposition is called on A,
           deactivate is called on A again. And finally activate is called on the newly
           focused component B. Here is the call sequence.

           A loses focus               B gains focus
           -------------> deactivate A -------------> activate A -> endComposition A ->
           deactivate A -> activate B ----....

           So in order to carry the composition mode across the components sharing the same
           input context, we save it when deactivate is called so that when activate is
           called, it can be restored correctly till activate is called on the newly focused
           component. (See also sun/awt/im/InputContext and bug 6184471).
           Last note, getCompositionState should be called before setXICFocus since
           setXICFocus here sets the XIC to 0.
        */
        activatedInstance = null;
        savedCompositionState = getCompositionState();

        if (isTemporary) {
            //turn the status window off...
            turnoffStatusWindow();
            /* Delay resetting the XIC focus until activate is called and the newly
             * Focused component has a different peer as the last focused component.
             */
            lastXICFocussedComponent = awtFocussedComponent;
        } else {
            if (awtFocussedComponent != null ) {
                ComponentPeer awtFocussedComponentPeer = getPeer(awtFocussedComponent);
                if (awtFocussedComponentPeer != null) {
                    setXICFocus(awtFocussedComponentPeer, false, isAc);
                }
            }
            lastXICFocussedComponent = null;
        }

        isLastXICActive = isAc;
        isLastTemporary = isTemporary;
        isActive = false;
        setStatusAreaVisible(false, pData);
    }

    // implements java.awt.im.spi.InputMethod.hideWindows
    public void hideWindows() {
        if (pData != 0) {
            setStatusAreaVisible(false, pData);
            turnoffStatusWindow();
        }
    }

    /**
     * Updates composed text with XIM preedit information and
     * posts composed text to the awt event queue. The args of
     * this method correspond to the XIM preedit callback
     * information. The XIM highlight attributes are translated via
     * fixed mapping (i.e., independent from any underlying input
     * method engine). This method is invoked in the AWT Toolkit
     * (X event loop) thread context and thus inside the AWT Lock.
     */
    // NOTE: This method may be called by privileged threads.
    //       This functionality is implemented in a package-private method
    //       to insure that it cannot be overridden by client subclasses.
    //       DO NOT INVOKE CLIENT CODE ON THIS THREAD!
    void dispatchComposedText(String chgText,
                                           int[] chgStyles,
                                           int chgOffset,
                                           int chgLength,
                                           int caretPosition,
                                           long when) {
        if (disposed) {
            return;
        }

        // Workaround for deadlock bug on solaris2.6_zh bug#4170760
        if (chgText == null
            && chgStyles == null
            && chgOffset == 0
            && chgLength == 0
            && caretPosition == 0
            && composedText == null
            && committedText == null)
            return;

        // Recalculate chgOffset and chgLength for supplementary char
        if (composedText != null) {
            int tmpChgOffset=chgOffset;
            int tmpChgLength=chgLength;
            int index = 0;
            for (int i=0;i < tmpChgOffset; i++,index++){
                if (index < composedText.length()
                    && Character.charCount(composedText.codePointAt(index))==2){
                    index++;
                    chgOffset++;
                }
            }
            // The index keeps value
            for (int i=0;i < tmpChgLength; i++,index++){
                if (index < composedText.length()
                    && Character.charCount(composedText.codePointAt(index))==2){
                    index++;
                    chgLength++;
                }
            }
        }

        // Replace control character with a square box
        if (chgText != null) {
            StringBuilder newChgText = new StringBuilder();
            for (int i=0; i < chgText.length(); i++){
                char c = chgText.charAt(i);
                if (Character.isISOControl(c)){
                    c = '\u25A1';
                }
                newChgText.append(c);
            }
            chgText = new String(newChgText);
        }

        if (composedText == null) {
            // TODO: avoid reallocation of those buffers
            composedText = new StringBuffer(INITIAL_SIZE);
            rawFeedbacks = new IntBuffer(INITIAL_SIZE);
        }
        if (chgLength > 0) {
            if (chgText == null && chgStyles != null) {
                rawFeedbacks.replace(chgOffset, chgStyles);
            } else {
                if (chgLength == composedText.length()) {
                    // optimization for the special case to replace the
                    // entire previous text
                    composedText = new StringBuffer(INITIAL_SIZE);
                    rawFeedbacks = new IntBuffer(INITIAL_SIZE);
                } else {
                    if (composedText.length() > 0) {
                        if (chgOffset+chgLength < composedText.length()) {
                            String text;
                            text = composedText.toString().substring(chgOffset+chgLength,
                                                                     composedText.length());
                            composedText.setLength(chgOffset);
                            composedText.append(text);
                        } else {
                            // in case to remove substring from chgOffset
                            // to the end
                            composedText.setLength(chgOffset);
                        }
                        rawFeedbacks.remove(chgOffset, chgLength);
                    }
                }
            }
        }
        if (chgText != null) {
            composedText.insert(chgOffset, chgText);
            if (chgStyles != null) {
                // Recalculate chgStyles for supplementary char
                if (chgText.length() > chgStyles.length){
                    int index=0;
                    int[] newStyles = new int[chgText.length()];
                    for (int i=0; i < chgStyles.length; i++, index++){
                        newStyles[index]=chgStyles[i];
                        if (index < chgText.length()
                            && Character.charCount(chgText.codePointAt(index))==2){
                            newStyles[++index]=chgStyles[i];
                        }
                    }
                    chgStyles=newStyles;
                }
                rawFeedbacks.insert(chgOffset, chgStyles);
            }

        }

        else if (chgStyles != null) {
            // Recalculate chgStyles to support supplementary char
            int count=0;
            for (int i=0; i < chgStyles.length; i++){
                if (composedText.length() > chgOffset+i+count
                    && Character.charCount(composedText.codePointAt(chgOffset+i+count))==2){
                    count++;
                }
            }
            if (count>0){
                int index=0;
                int[] newStyles = new int[chgStyles.length+count];
                for (int i=0; i < chgStyles.length; i++, index++){
                    newStyles[index]=chgStyles[i];
                    if (composedText.length() > chgOffset+index
                        && Character.charCount(composedText.codePointAt(chgOffset+index))==2){
                        newStyles[++index]=chgStyles[i];
                    }
                }
                chgStyles=newStyles;
            }
            rawFeedbacks.replace(chgOffset, chgStyles);
        }

        if (composedText.length() == 0) {
            composedText = null;
            rawFeedbacks = null;

            // if there is any outstanding committed text stored by
            // dispatchCommittedText(), it has to be sent to the
            // client component.
            if (committedText != null) {
                dispatchCommittedText(committedText, when);
                committedText = null;
                return;
            }

            // otherwise, send null text to delete client's composed
            // text.
            postInputMethodEvent(InputMethodEvent.INPUT_METHOD_TEXT_CHANGED,
                                 null,
                                 0,
                                 null,
                                 null,
                                 when);

            return;
        }

        // Adjust caretPosition for supplementary char
        for (int i=0; i< caretPosition; i++){
            if (i < composedText.length()
                && Character.charCount(composedText.codePointAt(i))==2){
                caretPosition++;
                i++;
            }
        }

        // Now sending the composed text to the client
        int composedOffset;
        AttributedString inputText;

        // if there is any partially committed text, concatenate it to
        // the composed text.
        if (committedText != null) {
            composedOffset = committedText.length();
            inputText = new AttributedString(committedText + composedText);
            committedText = null;
        } else {
            composedOffset = 0;
            inputText = new AttributedString(composedText.toString());
        }

        int currentFeedback;
        int nextFeedback;
        int startOffset = 0;
        int currentOffset;
        int visiblePosition = 0;
        TextHitInfo visiblePositionInfo = null;

        rawFeedbacks.rewind();
        currentFeedback = rawFeedbacks.getNext();
        rawFeedbacks.unget();
        while ((nextFeedback = rawFeedbacks.getNext()) != -1) {
            if (visiblePosition == 0) {
                visiblePosition = nextFeedback & XIMVisibleMask;
                if (visiblePosition != 0) {
                    int index = rawFeedbacks.getOffset() - 1;

                    if (visiblePosition == XIMVisibleToBackward)
                        visiblePositionInfo = TextHitInfo.leading(index);
                    else
                        visiblePositionInfo = TextHitInfo.trailing(index);
                }
            }
            nextFeedback &= ~XIMVisibleMask;
            if (currentFeedback != nextFeedback) {
                rawFeedbacks.unget();
                currentOffset = rawFeedbacks.getOffset();
                inputText.addAttribute(TextAttribute.INPUT_METHOD_HIGHLIGHT,
                                       convertVisualFeedbackToHighlight(currentFeedback),
                                       composedOffset + startOffset,
                                       composedOffset + currentOffset);
                startOffset = currentOffset;
                currentFeedback = nextFeedback;
            }
        }
        currentOffset = rawFeedbacks.getOffset();
        if (currentOffset >= 0) {
            inputText.addAttribute(TextAttribute.INPUT_METHOD_HIGHLIGHT,
                                   convertVisualFeedbackToHighlight(currentFeedback),
                                   composedOffset + startOffset,
                                   composedOffset + currentOffset);
        }

        postInputMethodEvent(InputMethodEvent.INPUT_METHOD_TEXT_CHANGED,
                             inputText.getIterator(),
                             composedOffset,
                             TextHitInfo.leading(caretPosition),
                             visiblePositionInfo,
                             when);
    }

    /* Some IMs need forced Text clear */
    void clearComposedText(long when) {
        composedText = null;
        postInputMethodEvent(InputMethodEvent.INPUT_METHOD_TEXT_CHANGED,
                             null, 0, null, null,
                             when);
        if (committedText != null && committedText.length() > 0) {
            dispatchCommittedText(committedText, when);
        }
        committedText = null;
        rawFeedbacks = null;
    }

    void clearComposedText() {
        if (EventQueue.isDispatchThread()) {
            clearComposedText(EventQueue.getMostRecentEventTime());
        }
    }

    /*
     * Subclasses should override disposeImpl() instead of dispose(). Client
     * code should always invoke dispose(), never disposeImpl().
     */
    protected synchronized void disposeImpl() {
        disposeXIC();
        awtLock();
        try {
            clearComposedText();
        } finally {
            // Put awtUnlock into finally block in case an exception is thrown in clearComposedText.
            awtUnlock();
        }
        awtFocussedComponent = null;
        lastXICFocussedComponent = null;
        needResetXIC = false;
        savedCompositionState = false;
        compositionEnableSupported = true;
    }

    /**
     * @see java.awt.im.spi.InputMethod#setCompositionEnabled(boolean)
     */
    public void setCompositionEnabled(boolean enable) {
        /* If the composition state is successfully changed, set
           the savedCompositionState to 'enable'. Otherwise, simply
           return.
           setCompositionEnabledNative may throw UnsupportedOperationException.
           Don't try to catch it since the method may be called by clients.
           Use package private method 'resetCompositionState' if you want the
           exception to be caught.
        */
        boolean pre, post;
        pre=getCompositionState();

        if (setCompositionEnabledNative(enable)) {
            savedCompositionState = enable;
        }

        post=getCompositionState();
        if (pre != post && post == enable){
            if (enable == false) flushText();
            if (awtFocussedComponent != null && isActive){
                setXICFocus(getPeer(awtFocussedComponent),
                            true, haveActiveClient());
            }
        }
    }

    private native void setStatusAreaVisible(boolean value, long data);
}
