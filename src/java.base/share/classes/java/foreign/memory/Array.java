/*
 * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
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

package java.foreign.memory;

import jdk.internal.foreign.Util;
import jdk.internal.foreign.memory.BoundedArray;

import java.foreign.Scope;
import java.util.function.IntFunction;

/**
 * This interface models a native array. An array is composed by a base pointer and a size.
 * @param <X> the carrier type associated with the array element.
 */
public interface Array<X> extends Resource {

    /**
     * Obtain the array size.
     * @return the array size.
     */
    long length();

    /**
     * Obtain the base pointer associated with this array.
     * @return the base pointer.
     */
    Pointer<X> elementPointer();

    /**
     * Retrieves the {@code LayoutType} associated with the element type of this array.
     * @return the array element type's {@code LayoutType}.
     */
    LayoutType<X> type();

    @Override
    default Scope scope() {
        return elementPointer().scope();
    }

    /**
     * Cast the array to given {@code LayoutType}.
     * @param <Y> the target array type.
     * @param type the new {@code LayoutType} associated with the array.
     * @return a new array with desired type info.
     */
    default <Y> Array<Y> cast(LayoutType<Y> type) { return cast(type, length()); }

    /**
     * Cast the array to given {@code LayoutType} and size.
     * @param <Y> the target array type.
     * @param type the new {@code LayoutType} associated with the array.
     * @param size the new size associated with the array.
     * @return a new array with desired type and size info.
     */
    <Y> Array<Y> cast(LayoutType<Y> type, long size);

    /**
     * Load the value at given position in this array. This is roughly equivalent to:
     * <p>
     *     <code>
     *         basePointer().offset(index).get();
     *     </code>
     * </p>
     * @param index element position
     * @return the array element value.
     */
    @SuppressWarnings("unchecked")
    default X get(long index) {
        try {
            return (X)type().getter().invoke(elementPointer().offset(index));
        } catch (Throwable ex) {
            throw new IllegalStateException(ex);
        }
    }

    /**
     * Stores the value at given position in this array. This is roughly equivalent to:
     * <p>
     *     <code>
     *         basePointer().offset(index).set(x);
     *     </code>
      </p>
     * @param index element position
     * @param x the value to be stored.
     */
    default void set(long index, X x) {
        try {
            type().setter().invoke(elementPointer().offset(index), x);
        } catch (Throwable ex) {
            throw new IllegalStateException(ex);
        }
    }

    /**
     * Collect element values into a Java array.
     * @param arrFactory the factory for the Java array.
     * @param <Z> the Java array type.
     * @return a new instance of a Java array.
     * @throws IllegalArgumentException if the array created by the provided factory is not compatible with the required type.
     */
    default <Z> Z toArray(IntFunction<Z> arrFactory) {
        if (length() > Integer.MAX_VALUE) {
            throw new IllegalArgumentException("Native array is too big to fit into a Java array");
        }
        int size = (int)length();
        Z arr = arrFactory.apply((int)length());
        BoundedArray.copyTo(this, arr, size);
        return arr;
    }

    /**
     * Copy contents of source array into destination array.
     * @param src source array.
     * @param dst destination array.
     * @param <Z> the array carrier type.
     * @throws IllegalArgumentException if the two arrays have different layouts.
     */
    static <Z> void assign(Array<Z> src, Array<Z> dst) {
        if (!src.elementPointer().type().layout().equals(dst.type().layout()) ||
                src.length() != dst.length()) {
            throw new IllegalArgumentException("Arrays have different layouts!");
        }
        try {
            Util.copy(src.elementPointer(), dst.elementPointer(),
                            dst.elementPointer().bytesSize());
        } catch (IllegalAccessException ex) {
            throw new IllegalArgumentException(ex);
        }
    }
}