/*
 * Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
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
package jdk.internal.foreign.abi;

public class ShuffleRecipe {

    private final long[] recipe;

    private final int nArgumentPulls;
    private final int nReturnPulls;

    ShuffleRecipe(long[] recipe, int nArgumentPulls, int nReturnPulls) {
        this.recipe = recipe;
        this.nArgumentPulls = nArgumentPulls;
        this.nReturnPulls = nReturnPulls;
    }

    public static ShuffleRecipe make(CallingSequence callingSequence) {
        ShuffleRecipeBuilder builder = new ShuffleRecipeBuilder();

        // Arguments
        callingSequence.getBindings(StorageClass.STACK_ARGUMENT_SLOT).stream().forEach(binding -> {
            if (binding == null) {
                builder.getArgumentsCollector().add(ShuffleRecipeClass.STACK, ShuffleRecipeOperation.SKIP);
            } else {
                builder.getArgumentsCollector().addPull(ShuffleRecipeClass.STACK);
            }
        });

        callingSequence.getBindings(StorageClass.VECTOR_ARGUMENT_REGISTER).stream().forEach(binding -> {
            builder.getArgumentsCollector().addPulls(ShuffleRecipeClass.VECTOR, binding.getStorage().getSize() / 8);
        });

        builder.getArgumentsCollector().addPulls(ShuffleRecipeClass.INTEGER, callingSequence.getBindings(StorageClass.INTEGER_ARGUMENT_REGISTER).size());


        // Returns
        builder.getReturnsCollector().addPulls(ShuffleRecipeClass.INTEGER, callingSequence.getBindings(StorageClass.INTEGER_RETURN_REGISTER).size());

        callingSequence.getBindings(StorageClass.VECTOR_RETURN_REGISTER).stream().forEach(binding -> {
            builder.getReturnsCollector().addPulls(ShuffleRecipeClass.VECTOR, binding.getStorage().getSize() / 8);
        });

        return builder.build();
    }

    public long[] getRecipe() {
        return recipe;
    }

    public int getNoofArgumentPulls() {
        return nArgumentPulls;
    }

    public int getNoofReturnPulls() {
        return nReturnPulls;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append("ShuffleRecipe { nArgumentPulls: ").append(nArgumentPulls).append(" nReturnPulls: ").append(nReturnPulls).append("}\n");

        return sb.toString();
    }
}