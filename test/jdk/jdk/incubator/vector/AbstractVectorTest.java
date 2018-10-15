/*
 * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
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
 * or visit www.oracle.com if you need additional information or have
 * questions.
 */

import java.lang.Integer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.Random;

public class AbstractVectorTest {

    static final Random RAND = new Random(Integer.getInteger("jdk.incubator.vector.test.random-seed", 1337));

    interface ToBoolF {
        boolean apply(int i);
    }

    static boolean[] fill_boolean(int s , ToBoolF f) {
        return fill_boolean(new boolean[s], f);
    }    

    static boolean[] fill_boolean(boolean[] a, ToBoolF f) {
        for (int i = 0; i < a.length; i++) {
            a[i] = f.apply(i);
        }
        return a;
    }

    static <R> IntFunction<R> withToString(String s, IntFunction<R> f) {
        return new IntFunction<R>() {
            @Override
            public R apply(int v) {
                return f.apply(v);
            }

            @Override
            public String toString() {
                return s;
            }
        };
    }

    static <R> BiFunction<Integer,Integer,R> withToStringBi(String s, BiFunction<Integer,Integer,R> f) {
        return new BiFunction<Integer,Integer,R>() {
            @Override
            public R apply(Integer v, Integer u) {
                return f.apply(v, u);
            }

            @Override
            public String toString() {
                return s;
            }
        };
    }

    static final List<IntFunction<ByteBuffer>> BYTE_BUFFER_GENERATORS = List.of(
            withToString("HB:RW:NE", (int s) -> {
                return ByteBuffer.allocate(s)
                        .order(ByteOrder.nativeOrder());
            }),
            withToString("DB:RW:NE", (int s) -> {
                return ByteBuffer.allocateDirect(s)
                        .order(ByteOrder.nativeOrder());
            })
            // @@@ Add when endianness design issues are resolved
//            , withToString("HB:RW:BE", (int s) -> {
//                return ByteBuffer.allocate(s)
//                        .order(ByteOrder.BIG_ENDIAN);
//            }),
//            withToString("DB:RW:BE", (int s) -> {
//                return ByteBuffer.allocateDirect(s)
//                        .order(ByteOrder.BIG_ENDIAN);
//            }),
//            withToString("HB:RW:LE", (int s) -> {
//                return ByteBuffer.allocate(s)
//                        .order(ByteOrder.LITTLE_ENDIAN);
//            }),
//            withToString("DB:RW:LE", (int s) -> {
//                return ByteBuffer.allocateDirect(s)
//                        .order(ByteOrder.LITTLE_ENDIAN);
//            })
    );

    static final List<IntFunction<boolean[]>> BOOL_ARRAY_GENERATORS = List.of(
            withToString("boolean[i % 2]", (int s) -> {
                return fill_boolean(s * 1000,
                            i -> ((i % 2) == 0));
            }),
            withToString("boolean[i % 5]", (int s) -> {
                return fill_boolean(s * 1000,
                            i -> ((i % 5) == 0));
            })
    );
    static final List<IntFunction<int[]>> INDEX_GENERATORS = List.of(
            withToString("index[i -> i]", (int s) -> {
                return fillInts(s,
                                i -> i);
            }),
            withToString("index[i -> size - i - 1]", (int s) -> {
                return fillInts(s,
                                i -> s - i - 1);
            }),
            withToString("index[i -> (i % 2) == 0 ? i : s - i - 1]", (int s) -> {
                return fillInts(s,
                                i -> (i % 2) == 0 ? i : s - i - 1);
            })
    );

    interface IntOp {
        int apply(int i);
    }

    static int[] fillInts(int s , IntOp f) {
        return fillInts(new int[s], f);
    }

    static int[] fillInts(int[] a, IntOp f) {
        for (int i = 0; i < a.length; i++) {
            a[i] = f.apply(i);
        }
        return a;
    }

    static final List<IntFunction<boolean[]>> BOOLEAN_MASK_GENERATORS = List.of(
            withToString("mask[i % 2]", (int l) -> {
                boolean[] a = new boolean[l];
                for (int i = 0; i < l; i++) {
                    a[i] = (i % 2 == 0);
                }
                return a;
            }),
            withToString("mask[true]", (int l) -> {
                boolean[] a = new boolean[l];
                Arrays.fill(a, true);
                return a;
            }),
            withToString("mask[false]", boolean[]::new)
    );
    
    static final List<BiFunction<Integer,Integer,int[]>> INT_SHUFFLE_GENERATORS = List.of(
            withToStringBi("shuffle[random]", (Integer l, Integer m) -> {
                return RAND.ints(l.intValue(), 0, m.intValue()).toArray();
            })
    );

    static int countTrailingFalse(boolean[] m) {
        int i;
        for (i = m.length - 1; i >= 0 && !m[i]; i--);
        return m.length - 1 - i;
    }
}