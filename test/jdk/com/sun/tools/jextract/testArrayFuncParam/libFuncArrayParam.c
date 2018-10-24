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
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include "funcArrayParam.h"

int f(int x[], int len) {
    int i = 0, res = 0;
    for (i = 0; i < len; i++) {
        res += x[i];
    }
    return res;
}

int g(IA x, int len) {
    return f(x, len);
}

int k(int x[3], int len) {
    return f(x, len);
}

int map_sum(int arr[], int len, int (*map)(int arr[], int idx, int val)) {
    int res = 0, idx = 0;
    for (; idx < len; idx++) {
        res += map(arr, idx, arr[idx]);
    }
    return res;
}

int map_sum2(int arr[], int len, struct FPPtrFieldStruct s) {
    return map_sum(arr, len, s.map);
}