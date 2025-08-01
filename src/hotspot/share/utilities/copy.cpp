/*
 * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
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
 *
 */

#include "runtime/sharedRuntime.hpp"
#include "utilities/align.hpp"
#include "utilities/byteswap.hpp"
#include "utilities/copy.hpp"


// Copy bytes; larger units are filled atomically if everything is aligned.
void Copy::conjoint_memory_atomic(const void* from, void* to, size_t size) {
  uintptr_t bits = (uintptr_t) from | (uintptr_t) to | (uintptr_t) size;

  // (Note:  We could improve performance by ignoring the low bits of size,
  // and putting a short cleanup loop after each bulk copy loop.
  // There are plenty of other ways to make this faster also,
  // and it's a slippery slope.  For now, let's keep this code simple
  // since the simplicity helps clarify the atomicity semantics of
  // this operation.  There are also CPU-specific assembly versions
  // which may or may not want to include such optimizations.)

  if (bits % sizeof(jlong) == 0) {
    Copy::conjoint_jlongs_atomic((const jlong*) from, (jlong*) to, size / sizeof(jlong));
  } else if (bits % sizeof(jint) == 0) {
    Copy::conjoint_jints_atomic((const jint*) from, (jint*) to, size / sizeof(jint));
  } else if (bits % sizeof(jshort) == 0) {
    Copy::conjoint_jshorts_atomic((const jshort*) from, (jshort*) to, size / sizeof(jshort));
  } else {
    // Not aligned, so no need to be atomic.
    Copy::conjoint_jbytes((const void*) from, (void*) to, size);
  }
}

class CopySwap : AllStatic {
public:
  /**
   * Copy and optionally byte swap elements
   *
   * <swap> - true if elements should be byte swapped
   *
   * @param src address of source
   * @param dst address of destination
   * @param byte_count number of bytes to copy
   * @param elem_size size of the elements to copy-swap
   */
  template<bool swap>
  static void conjoint_swap_if_needed(const void* src, void* dst, size_t byte_count, size_t elem_size) {
    assert(src != nullptr, "address must not be null");
    assert(dst != nullptr, "address must not be null");
    assert(elem_size == 2 || elem_size == 4 || elem_size == 8,
           "incorrect element size: %zu", elem_size);
    assert(is_aligned(byte_count, elem_size),
           "byte_count %zu must be multiple of element size %zu", byte_count, elem_size);

    address src_end = (address)src + byte_count;

    if (dst <= src || dst >= src_end) {
      do_conjoint_swap<RIGHT,swap>(src, dst, byte_count, elem_size);
    } else {
      do_conjoint_swap<LEFT,swap>(src, dst, byte_count, elem_size);
    }
  }

private:
  enum CopyDirection {
    RIGHT, // lower -> higher address
    LEFT   // higher -> lower address
  };

  /**
   * Copy and byte swap elements
   *
   * <T> - type of element to copy
   * <D> - copy direction
   * <is_src_aligned> - true if src argument is aligned to element size
   * <is_dst_aligned> - true if dst argument is aligned to element size
   *
   * @param src address of source
   * @param dst address of destination
   * @param byte_count number of bytes to copy
   */
  template <typename T, CopyDirection D, bool swap, bool is_src_aligned, bool is_dst_aligned>
  static void do_conjoint_swap(const void* src, void* dst, size_t byte_count) {
    const char* cur_src;
    char* cur_dst;

    switch (D) {
    case RIGHT:
      cur_src = (const char*)src;
      cur_dst = (char*)dst;
      break;
    case LEFT:
      cur_src = (const char*)src + byte_count - sizeof(T);
      cur_dst = (char*)dst + byte_count - sizeof(T);
      break;
    }

    for (size_t i = 0; i < byte_count / sizeof(T); i++) {
      T tmp;

      if (is_src_aligned) {
        tmp = *(T*)cur_src;
      } else {
        memcpy(&tmp, cur_src, sizeof(T));
      }

      if (swap) {
        tmp = byteswap(tmp);
      }

      if (is_dst_aligned) {
        *(T*)cur_dst = tmp;
      } else {
        memcpy(cur_dst, &tmp, sizeof(T));
      }

      switch (D) {
      case RIGHT:
        cur_src += sizeof(T);
        cur_dst += sizeof(T);
        break;
      case LEFT:
        cur_src -= sizeof(T);
        cur_dst -= sizeof(T);
        break;
      }
    }
  }

  /**
   * Copy and byte swap elements
   *
   * <T>    - type of element to copy
   * <D>    - copy direction
   * <swap> - true if elements should be byte swapped
   *
   * @param src address of source
   * @param dst address of destination
   * @param byte_count number of bytes to copy
   */
  template <typename T, CopyDirection direction, bool swap>
  static void do_conjoint_swap(const void* src, void* dst, size_t byte_count) {
    if (is_aligned(src, sizeof(T))) {
      if (is_aligned(dst, sizeof(T))) {
        do_conjoint_swap<T,direction,swap,true,true>(src, dst, byte_count);
      } else {
        do_conjoint_swap<T,direction,swap,true,false>(src, dst, byte_count);
      }
    } else {
      if (is_aligned(dst, sizeof(T))) {
        do_conjoint_swap<T,direction,swap,false,true>(src, dst, byte_count);
      } else {
        do_conjoint_swap<T,direction,swap,false,false>(src, dst, byte_count);
      }
    }
  }


  /**
   * Copy and byte swap elements
   *
   * <D>    - copy direction
   * <swap> - true if elements should be byte swapped
   *
   * @param src address of source
   * @param dst address of destination
   * @param byte_count number of bytes to copy
   * @param elem_size size of the elements to copy-swap
   */
  template <CopyDirection D, bool swap>
  static void do_conjoint_swap(const void* src, void* dst, size_t byte_count, size_t elem_size) {
    switch (elem_size) {
    case 2: do_conjoint_swap<uint16_t,D,swap>(src, dst, byte_count); break;
    case 4: do_conjoint_swap<uint32_t,D,swap>(src, dst, byte_count); break;
    case 8: do_conjoint_swap<uint64_t,D,swap>(src, dst, byte_count); break;
    default: guarantee(false, "do_conjoint_swap: Invalid elem_size %zu\n", elem_size);
    }
  }
};

void Copy::conjoint_copy(const void* src, void* dst, size_t byte_count, size_t elem_size) {
  CopySwap::conjoint_swap_if_needed<false>(src, dst, byte_count, elem_size);
}

void Copy::conjoint_swap(const void* src, void* dst, size_t byte_count, size_t elem_size) {
  CopySwap::conjoint_swap_if_needed<true>(src, dst, byte_count, elem_size);
}

// Fill bytes; larger units are filled atomically if everything is aligned.
void Copy::fill_to_memory_atomic(void* to, size_t size, jubyte value) {
  address dst = (address)to;
  uintptr_t bits = (uintptr_t)to | (uintptr_t)size;
  if (bits % sizeof(jlong) == 0) {
    jlong fill = (julong)((jubyte)value);  // zero-extend
    if (fill != 0) {
      fill += fill << 8;
      fill += fill << 16;
      fill += fill << 32;
    }
    // Copy::fill_to_jlongs_atomic((jlong*) dst, size / sizeof(jlong));
    for (uintptr_t off = 0; off < size; off += sizeof(jlong)) {
      *(jlong*)(dst + off) = fill;
    }
  } else if (bits % sizeof(jint) == 0) {
    jint fill = (juint)((jubyte)value);  // zero-extend
    if (fill != 0) {
      fill += fill << 8;
      fill += fill << 16;
    }
    // Copy::fill_to_jints_atomic((jint*) dst, size / sizeof(jint));
    for (uintptr_t off = 0; off < size; off += sizeof(jint)) {
      *(jint*)(dst + off) = fill;
    }
  } else if (bits % sizeof(jshort) == 0) {
    jshort fill = (jushort)((jubyte)value);  // zero-extend
    fill += (jshort)(fill << 8);
    // Copy::fill_to_jshorts_atomic((jshort*) dst, size / sizeof(jshort));
    for (uintptr_t off = 0; off < size; off += sizeof(jshort)) {
      *(jshort*)(dst + off) = fill;
    }
  } else {
    // Not aligned, so no need to be atomic.
#ifdef MUSL_LIBC
    // This code is used by Unsafe and may hit the next page after truncation
    // of mapped memory. Therefore, we use volatile to prevent compilers from
    // replacing the loop by memset which may not trigger SIGBUS as needed
    // (observed on Alpine Linux x86_64)
    jbyte fill = value;
    for (uintptr_t off = 0; off < size; off += sizeof(jbyte)) {
      *(volatile jbyte*)(dst + off) = fill;
    }
#else
    Copy::fill_to_bytes(dst, size, value);
#endif
  }
}
