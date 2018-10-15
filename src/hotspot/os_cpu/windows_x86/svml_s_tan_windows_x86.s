;
; Copyright (c) 2018, Intel Corporation.
; Intel Short Vector Math Library (SVML) Source Code
;
; DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
;
; This code is free software; you can redistribute it and/or modify it
; under the terms of the GNU General Public License version 2 only, as
; published by the Free Software Foundation.
;
; This code is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
; version 2 for more details (a copy is included in the LICENSE file that
; accompanied this code).
;
; You should have received a copy of the GNU General Public License version
; 2 along with this work; if not, write to the Free Software Foundation,
; Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
;
; Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
; or visit www.oracle.com if you need additional information or have any
; questions.
;

INCLUDE globals_vectorApiSupport_windows.hpp
IFNB __VECTOR_API_MATH_INTRINSICS_WINDOWS

	OPTION DOTNAME

_TEXT	SEGMENT      'CODE'

TXTST0:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_tanf4_ha_ex

__svml_tanf4_ha_ex	PROC

_B1_1::

        DB        243
        DB        15
        DB        30
        DB        250
L1::

        sub       rsp, 584
        lea       r9, QWORD PTR [__ImageBase]
        movups    XMMWORD PTR [400+rsp], xmm15
        pxor      xmm3, xmm3
        movups    XMMWORD PTR [416+rsp], xmm14
        xor       r10d, r10d
        movups    XMMWORD PTR [432+rsp], xmm13
        movups    XMMWORD PTR [448+rsp], xmm12
        movups    XMMWORD PTR [464+rsp], xmm11
        movups    XMMWORD PTR [480+rsp], xmm10
        movups    XMMWORD PTR [544+rsp], xmm9
        movups    XMMWORD PTR [528+rsp], xmm8
        movups    XMMWORD PTR [512+rsp], xmm7
        movups    XMMWORD PTR [496+rsp], xmm6
        mov       QWORD PTR [560+rsp], r13
        lea       r13, QWORD PTR [319+rsp]
        movups    xmm2, XMMWORD PTR [rcx]
        and       r13, -64
        movups    xmm9, XMMWORD PTR [__svml_stan_ha_data_internal+960]
        movaps    xmm11, xmm2
        andps     xmm11, xmm9
        andnps    xmm9, xmm2
        movaps    xmm0, xmm11
        movaps    xmm1, xmm11
        cvtps2pd  xmm7, xmm11
        cmpnleps  xmm1, XMMWORD PTR [__svml_stan_ha_data_internal+1216]
        movhlps   xmm0, xmm11
        mulps     xmm11, XMMWORD PTR [__svml_stan_ha_data_internal+832]
        cvtps2pd  xmm6, xmm0
        movmskps  eax, xmm1
        movups    xmm4, XMMWORD PTR [__svml_stan_ha_data_internal+1088]
        movups    xmm13, XMMWORD PTR [__svml_stan_ha_data_internal+1280]
        addps     xmm11, xmm4
        movaps    xmm8, xmm11
        movaps    xmm12, xmm13
        movups    xmm10, XMMWORD PTR [__svml_stan_ha_data_internal+1344]
        pslld     xmm8, 31
        pcmpeqd   xmm3, xmm8
        pxor      xmm8, xmm9
        pshufd    xmm5, xmm3, 80
        subps     xmm11, xmm4
        cvtps2pd  xmm14, xmm11
        movhlps   xmm11, xmm11
        cvtps2pd  xmm15, xmm11
        mulpd     xmm12, xmm14
        mulpd     xmm13, xmm15
        mulpd     xmm14, xmm10
        mulpd     xmm15, xmm10
        subpd     xmm7, xmm12
        subpd     xmm6, xmm13
        subpd     xmm7, xmm14
        subpd     xmm6, xmm15
        pshufd    xmm4, xmm3, 250
        movaps    xmm3, xmm7
        mulpd     xmm3, xmm7
        movaps    xmm14, xmm6
        movdqa    xmm15, xmm4
        mulpd     xmm14, xmm6
        movups    xmm11, XMMWORD PTR [__svml_stan_ha_data_internal+1664]
        movaps    xmm12, xmm11
        mulpd     xmm12, xmm3
        mulpd     xmm11, xmm14
        movups    xmm10, XMMWORD PTR [__svml_stan_ha_data_internal+1472]
        movaps    xmm0, xmm10
        mulpd     xmm0, xmm7
        mulpd     xmm10, xmm6
        mulpd     xmm0, xmm3
        mulpd     xmm10, xmm14
        addpd     xmm7, xmm0
        addpd     xmm6, xmm10
        movups    xmm13, XMMWORD PTR [__svml_stan_ha_data_internal+1600]
        movdqa    xmm10, xmm5
        addpd     xmm12, xmm13
        addpd     xmm13, xmm11
        mulpd     xmm3, xmm12
        mulpd     xmm14, xmm13
        movups    xmm0, XMMWORD PTR [__svml_stan_ha_data_internal+1536]
        movdqa    xmm13, xmm5
        addpd     xmm3, xmm0
        addpd     xmm0, xmm14
        andnps    xmm13, xmm3
        movdqa    xmm11, xmm4
        movdqa    xmm12, xmm5
        andps     xmm3, xmm5
        movdqa    xmm5, xmm4
        andps     xmm10, xmm7
        andnps    xmm15, xmm0
        andps     xmm11, xmm6
        andnps    xmm12, xmm7
        andnps    xmm5, xmm6
        andps     xmm0, xmm4
        orps      xmm13, xmm10
        orps      xmm15, xmm11
        orps      xmm12, xmm3
        orps      xmm5, xmm0
        divpd     xmm13, xmm12
        divpd     xmm15, xmm5
        cvtpd2ps  xmm0, xmm13
        cvtpd2ps  xmm3, xmm15
        movlhps   xmm0, xmm3
        mov       QWORD PTR [568+rsp], r13
        pxor      xmm0, xmm8
        test      eax, eax
        jne       _B1_12

_B1_2::

        test      r10d, r10d
        jne       _B1_4

_B1_3::

        movups    xmm6, XMMWORD PTR [496+rsp]
        movups    xmm7, XMMWORD PTR [512+rsp]
        movups    xmm8, XMMWORD PTR [528+rsp]
        movups    xmm9, XMMWORD PTR [544+rsp]
        movups    xmm10, XMMWORD PTR [480+rsp]
        movups    xmm11, XMMWORD PTR [464+rsp]
        movups    xmm12, XMMWORD PTR [448+rsp]
        movups    xmm13, XMMWORD PTR [432+rsp]
        movups    xmm14, XMMWORD PTR [416+rsp]
        movups    xmm15, XMMWORD PTR [400+rsp]
        mov       r13, QWORD PTR [560+rsp]
        add       rsp, 584
        ret

_B1_4::

        movups    XMMWORD PTR [r13], xmm2
        movups    XMMWORD PTR [64+r13], xmm0
        je        _B1_3

_B1_7::

        xor       ecx, ecx
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, ecx
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r10d

_B1_8::

        mov       ecx, ebx
        mov       eax, 1
        shl       eax, cl
        test      esi, eax
        jne       _B1_11

_B1_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B1_8

_B1_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        movups    xmm0, XMMWORD PTR [64+r13]
        jmp       _B1_3

_B1_11::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_stan_ha_cout_rare_internal
        jmp       _B1_9

_B1_12::

        mov       r10d, 2139095040
        mov       r11d, -2147483648
        movaps    xmm6, xmm2
        movaps    xmm7, xmm2
        movups    XMMWORD PTR [80+rsp], xmm2
        movups    XMMWORD PTR [112+rsp], xmm0
        movd      xmm11, r10d
        movd      xmm15, r11d
        pshufd    xmm10, xmm11, 0
        mov       r11d, 8388607
        pshufd    xmm8, xmm15, 0
        andps     xmm6, xmm10
        movdqu    XMMWORD PTR [128+rsp], xmm8
        andps     xmm7, xmm8
        andnps    xmm8, xmm2
        cmpeqps   xmm6, xmm10
        pand      xmm10, xmm8
        psrld     xmm10, 23
        movdqa    xmm3, xmm10
        pslld     xmm3, 1
        paddd     xmm3, xmm10
        pslld     xmm3, 2
        movups    XMMWORD PTR [32+rsp], xmm7
        pshufd    xmm7, xmm3, 2
        movd      edx, xmm7
        pshufd    xmm10, xmm3, 3
        pshufd    xmm2, xmm3, 1
        movd      eax, xmm10
        movd      r8d, xmm3
        movd      ecx, xmm2
        movd      xmm2, r11d
        movd      xmm12, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rdx]
        movd      xmm14, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rdx]
        movd      xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rdx]
        mov       edx, 8388608
        movups    XMMWORD PTR [96+rsp], xmm1
        mov       r11d, 679477248
        movd      xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rax]
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rax]
        movd      xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rax]
        mov       eax, 65535
        movd      xmm9, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+r8]
        movd      xmm13, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rcx]
        punpcklqdq xmm9, xmm13
        pshufd    xmm13, xmm2, 0
        movd      xmm10, eax
        movups    XMMWORD PTR [144+rsp], xmm8
        pand      xmm13, xmm8
        movd      xmm8, edx
        mov       edx, 262143
        pshufd    xmm7, xmm8, 0
        mov       eax, 872415232
        punpcklqdq xmm12, xmm4
        paddd     xmm13, xmm7
        pshufd    xmm8, xmm10, 0
        movmskps  r10d, xmm6
        shufps    xmm9, xmm12, 136
        movdqa    xmm12, xmm13
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+r8]
        pand      xmm13, xmm8
        movd      xmm5, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rcx]
        movaps    xmm4, xmm9
        punpcklqdq xmm6, xmm5
        pand      xmm9, xmm8
        punpcklqdq xmm14, xmm11
        movdqa    xmm10, xmm13
        movd      xmm15, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rcx]
        psrlq     xmm10, 32
        shufps    xmm6, xmm14, 136
        movaps    xmm14, xmm9
        movd      xmm3, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+r8]
        psrlq     xmm14, 32
        punpcklqdq xmm3, xmm15
        movdqa    xmm7, xmm13
        movdqa    xmm15, xmm10
        psrld     xmm12, 16
        punpcklqdq xmm0, xmm1
        movdqa    xmm11, xmm12
        pmuludq   xmm7, xmm9
        psrlq     xmm11, 32
        pmuludq   xmm15, xmm14
        shufps    xmm3, xmm0, 136
        movaps    xmm0, xmm6
        psrld     xmm0, 16
        psllq     xmm15, 32
        movdqa    xmm1, xmm0
        movaps    xmm2, xmm3
        movups    XMMWORD PTR [176+rsp], xmm9
        psrlq     xmm1, 32
        movdqu    xmm9, XMMWORD PTR [_2il0floatpacket_26]
        pand      xmm3, xmm8
        movdqu    XMMWORD PTR [208+rsp], xmm14
        movdqa    xmm14, xmm10
        pand      xmm7, xmm9
        pand      xmm6, xmm8
        movdqu    XMMWORD PTR [224+rsp], xmm1
        por       xmm7, xmm15
        pmuludq   xmm14, xmm1
        movdqa    xmm1, xmm12
        pmuludq   xmm1, xmm3
        movdqu    XMMWORD PTR [240+rsp], xmm7
        movdqa    xmm7, xmm13
        psrlq     xmm3, 32
        psrld     xmm2, 16
        pmuludq   xmm7, xmm0
        movaps    xmm5, xmm6
        pmuludq   xmm3, xmm11
        psrld     xmm4, 16
        psrlq     xmm5, 32
        movdqu    XMMWORD PTR [160+rsp], xmm4
        movdqa    xmm4, xmm2
        movdqu    XMMWORD PTR [192+rsp], xmm0
        pand      xmm7, xmm9
        psllq     xmm14, 32
        movdqa    xmm0, xmm13
        movdqa    xmm15, xmm10
        pand      xmm1, xmm9
        psllq     xmm3, 32
        psrlq     xmm4, 32
        pmuludq   xmm0, xmm6
        por       xmm7, xmm14
        pmuludq   xmm15, xmm5
        pmuludq   xmm6, xmm12
        pmuludq   xmm5, xmm11
        por       xmm1, xmm3
        movdqa    xmm14, xmm12
        movdqa    xmm3, xmm11
        pand      xmm0, xmm9
        pmuludq   xmm14, xmm2
        psllq     xmm15, 32
        pmuludq   xmm3, xmm4
        pmuludq   xmm2, xmm13
        pmuludq   xmm4, xmm10
        por       xmm0, xmm15
        pand      xmm2, xmm9
        psllq     xmm4, 32
        pand      xmm6, xmm9
        psllq     xmm5, 32
        movdqa    xmm15, xmm0
        por       xmm2, xmm4
        movdqa    xmm4, xmm7
        por       xmm6, xmm5
        psrld     xmm0, 16
        pand      xmm14, xmm9
        psllq     xmm3, 32
        pand      xmm4, xmm8
        paddd     xmm6, xmm0
        por       xmm14, xmm3
        paddd     xmm4, xmm6
        movdqu    xmm3, XMMWORD PTR [192+rsp]
        psrld     xmm2, 16
        movdqu    xmm6, XMMWORD PTR [224+rsp]
        psrld     xmm7, 16
        pmuludq   xmm3, xmm12
        pand      xmm15, xmm8
        pmuludq   xmm6, xmm11
        pmuludq   xmm12, XMMWORD PTR [176+rsp]
        pmuludq   xmm11, XMMWORD PTR [208+rsp]
        pand      xmm3, xmm9
        psllq     xmm6, 32
        por       xmm3, xmm6
        paddd     xmm14, xmm2
        paddd     xmm3, xmm7
        psrld     xmm1, 16
        movdqu    xmm7, XMMWORD PTR [160+rsp]
        paddd     xmm15, xmm14
        pmuludq   xmm13, xmm7
        psrlq     xmm7, 32
        pmuludq   xmm10, xmm7
        paddd     xmm1, xmm15
        pand      xmm13, xmm9
        movdqa    xmm14, xmm1
        psllq     xmm10, 32
        movdqu    xmm15, XMMWORD PTR [240+rsp]
        psrld     xmm14, 16
        paddd     xmm14, xmm4
        movdqa    xmm4, xmm15
        movdqa    xmm0, xmm14
        pand      xmm4, xmm8
        psrld     xmm0, 16
        paddd     xmm4, xmm3
        pand      xmm12, xmm9
        psllq     xmm11, 32
        paddd     xmm0, xmm4
        por       xmm13, xmm10
        por       xmm12, xmm11
        psrld     xmm15, 16
        movdqa    xmm5, xmm0
        pand      xmm13, xmm8
        paddd     xmm12, xmm15
        mov       ecx, 1065353216
        psrld     xmm5, 16
        paddd     xmm13, xmm12
        paddd     xmm5, xmm13
        pand      xmm0, xmm8
        pslld     xmm5, 16
        mov       r8d, 1195376640
        movups    xmm9, XMMWORD PTR [144+rsp]
        paddd     xmm5, xmm0
        movdqu    xmm10, XMMWORD PTR [128+rsp]
        movd      xmm13, ecx
        pshufd    xmm12, xmm13, 0
        pand      xmm10, xmm9
        movdqa    xmm4, xmm5
        pxor      xmm12, xmm10
        psrld     xmm4, 9
        pand      xmm1, xmm8
        por       xmm4, xmm12
        movd      xmm8, r8d
        pshufd    xmm11, xmm8, 0
        movdqa    xmm12, xmm4
        mov       ecx, 511
        pslld     xmm14, 16
        paddd     xmm14, xmm1
        movd      xmm6, r11d
        pshufd    xmm3, xmm6, 0
        movd      xmm2, edx
        pshufd    xmm7, xmm2, 0
        movd      xmm13, eax
        pshufd    xmm8, xmm13, 0
        pand      xmm7, xmm14
        psrld     xmm14, 18
        pxor      xmm3, xmm10
        pxor      xmm10, xmm8
        mov       r8d, 1086918619
        mov       eax, -4096
        pslld     xmm7, 5
        por       xmm7, xmm3
        mov       r11d, 1086918656
        mov       edx, -1214941318
        addps     xmm12, xmm11
        subps     xmm7, xmm3
        movaps    xmm1, xmm12
        subps     xmm1, xmm11
        movd      xmm11, ecx
        pshufd    xmm6, xmm11, 0
        mov       ecx, 2147483647
        pand      xmm6, xmm5
        movd      xmm5, r11d
        pslld     xmm6, 14
        subps     xmm4, xmm1
        por       xmm6, xmm14
        movaps    xmm13, xmm4
        por       xmm6, xmm10
        movd      xmm14, edx
        pshufd    xmm3, xmm5, 0
        mov       edx, 127
        pshufd    xmm5, xmm14, 0
        movdqa    xmm11, xmm3
        mov       r11d, 255
        subps     xmm6, xmm10
        movd      xmm10, r8d
        mov       r8d, 897581056
        pshufd    xmm8, xmm10, 0
        movd      xmm10, eax
        pshufd    xmm15, xmm10, 0
        addps     xmm13, xmm6
        subps     xmm4, xmm13
        addps     xmm6, xmm4
        movdqa    xmm4, xmm15
        andps     xmm4, xmm13
        addps     xmm7, xmm6
        mulps     xmm11, xmm4
        subps     xmm13, xmm4
        mulps     xmm4, xmm5
        mulps     xmm8, xmm7
        mulps     xmm3, xmm13
        mulps     xmm5, xmm13
        addps     xmm3, xmm4
        addps     xmm8, xmm5
        movd      xmm7, ecx
        movd      xmm6, r8d
        pshufd    xmm7, xmm7, 0
        movd      xmm13, edx
        pshufd    xmm14, xmm6, 0
        andps     xmm7, xmm9
        movdqa    xmm10, xmm14
        addps     xmm3, xmm8
        cmpltps   xmm10, xmm7
        cmpleps   xmm7, xmm14
        movaps    xmm0, xmm3
        andps     xmm7, xmm9
        movd      xmm9, r11d
        addps     xmm0, xmm11
        pshufd    xmm4, xmm13, 0
        subps     xmm11, xmm0
        andps     xmm0, xmm10
        addps     xmm3, xmm11
        andps     xmm10, xmm3
        orps      xmm7, xmm0
        pshufd    xmm3, xmm9, 0
        pand      xmm12, xmm3
        pand      xmm12, xmm4
        movaps    xmm5, xmm12
        pslld     xmm5, 2
        paddd     xmm5, xmm12
        pslld     xmm5, 3
        pshufd    xmm12, xmm5, 1
        pshufd    xmm9, xmm5, 2
        pshufd    xmm8, xmm5, 3
        movd      edx, xmm5
        movd      eax, xmm12
        movd      ecx, xmm9
        movd      r8d, xmm8
        movd      xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rdx]
        movd      xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rdx]
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rax]
        movd      xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rax]
        movd      xmm14, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rcx]
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+r8]
        movd      xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+r8]
        movd      xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+r8]
        punpcklqdq xmm3, xmm11
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+r8]
        punpcklqdq xmm14, xmm6
        movd      xmm13, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rdx]
        movd      xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rax]
        movd      xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rax]
        movd      xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rcx]
        movd      xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rcx]
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rcx]
        punpcklqdq xmm4, xmm12
        movd      xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rdx]
        shufps    xmm3, xmm14, 136
        punpcklqdq xmm13, xmm0
        punpcklqdq xmm2, xmm1
        punpcklqdq xmm5, xmm9
        movd      xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rdx]
        punpcklqdq xmm12, xmm8
        punpcklqdq xmm6, xmm11
        movd      xmm14, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rax]
        movd      xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rcx]
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rcx]
        movd      xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+r8]
        movd      xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+r8]
        shufps    xmm12, xmm6, 136
        punpcklqdq xmm9, xmm14
        movd      xmm14, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+r8]
        punpcklqdq xmm1, xmm0
        punpcklqdq xmm11, xmm8
        movd      xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rdx]
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rax]
        movd      xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rcx]
        shufps    xmm13, xmm2, 136
        shufps    xmm4, xmm5, 136
        movd      xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rdx]
        movd      xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rax]
        punpcklqdq xmm8, xmm6
        punpcklqdq xmm0, xmm14
        punpcklqdq xmm5, xmm2
        shufps    xmm8, xmm0, 136
        movups    XMMWORD PTR [64+rsp], xmm8
        shufps    xmm9, xmm1, 136
        shufps    xmm5, xmm11, 136
        movd      xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rdx]
        movd      xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rax]
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rcx]
        movd      xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+r8]
        punpcklqdq xmm8, xmm1
        punpcklqdq xmm11, xmm2
        shufps    xmm8, xmm11, 136
        movd      xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rdx]
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rax]
        punpcklqdq xmm11, xmm6
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rcx]
        movd      xmm14, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+r8]
        punpcklqdq xmm6, xmm14
        movaps    xmm14, xmm3
        shufps    xmm11, xmm6, 136
        subps     xmm14, xmm7
        movd      xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rdx]
        subps     xmm3, xmm14
        movd      xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rax]
        subps     xmm3, xmm7
        punpcklqdq xmm6, xmm0
        movdqa    xmm0, xmm15
        andps     xmm0, xmm14
        subps     xmm3, xmm10
        subps     xmm14, xmm0
        movd      xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rcx]
        addps     xmm13, xmm14
        movd      xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+r8]
        addps     xmm3, xmm13
        rcpps     xmm13, xmm0
        andps     xmm13, xmm15
        mulps     xmm0, xmm13
        movaps    xmm14, xmm13
        movups    xmm15, XMMWORD PTR [__svml_stan_ha_data_internal+1152]
        punpcklqdq xmm2, xmm1
        subps     xmm15, xmm0
        mulps     xmm14, xmm15
        movaps    xmm0, xmm15
        mulps     xmm0, xmm15
        addps     xmm14, xmm13
        mulps     xmm0, xmm14
        shufps    xmm6, xmm2, 136
        addps     xmm14, xmm0
        movups    XMMWORD PTR [48+rsp], xmm15
        mulps     xmm3, xmm14
        movups    xmm0, XMMWORD PTR [112+rsp]
        movups    xmm1, XMMWORD PTR [96+rsp]
        movups    xmm2, XMMWORD PTR [80+rsp]

_B1_15::

        movaps    xmm15, xmm3
        mulps     xmm3, xmm3
        subps     xmm15, XMMWORD PTR [48+rsp]
        mulps     xmm13, xmm4
        mulps     xmm6, xmm7
        subps     xmm3, xmm15
        mulps     xmm8, xmm7
        addps     xmm11, xmm6
        mulps     xmm14, xmm3
        mulps     xmm4, xmm14
        movaps    xmm14, xmm7
        mulps     xmm14, xmm5
        movaps    xmm15, xmm12
        movaps    xmm6, xmm7
        mulps     xmm6, xmm7
        addps     xmm15, xmm14
        movaps    xmm3, xmm15
        subps     xmm12, xmm15
        mulps     xmm11, xmm6
        addps     xmm3, xmm13
        addps     xmm14, xmm12
        subps     xmm13, xmm3
        addps     xmm4, xmm14
        addps     xmm15, xmm13
        movups    xmm12, XMMWORD PTR [64+rsp]
        addps     xmm4, xmm15
        addps     xmm5, xmm12
        addps     xmm8, xmm12
        mulps     xmm10, xmm5
        addps     xmm8, xmm11
        addps     xmm4, xmm10
        mulps     xmm7, xmm8
        addps     xmm9, xmm4
        movaps    xmm4, xmm1
        addps     xmm9, xmm7
        andnps    xmm4, xmm0
        addps     xmm3, xmm9
        xorps     xmm3, XMMWORD PTR [32+rsp]
        movaps    xmm0, xmm4
        andps     xmm3, xmm1
        orps      xmm0, xmm3
        jmp       _B1_2
        ALIGN     16

_B1_13::

__svml_tanf4_ha_ex ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_ex_B1_B4:
	DD	1603841
	DD	4641913
	DD	2058353
	DD	2127977
	DD	2197601
	DD	2267224
	DD	2009167
	DD	1947718
	DD	1886269
	DD	1824820
	DD	1763368
	DD	1701915
	DD	4784395

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_1
	DD	imagerel _B1_7
	DD	imagerel _unwind___svml_tanf4_ha_ex_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_ex_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B1_1
	DD	imagerel _B1_7
	DD	imagerel _unwind___svml_tanf4_ha_ex_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_7
	DD	imagerel _B1_12
	DD	imagerel _unwind___svml_tanf4_ha_ex_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_ex_B12_B15:
	DD	33
	DD	imagerel _B1_1
	DD	imagerel _B1_7
	DD	imagerel _unwind___svml_tanf4_ha_ex_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_12
	DD	imagerel _B1_13
	DD	imagerel _unwind___svml_tanf4_ha_ex_B12_B15

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST1:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_tanf4_ha_e9

__svml_tanf4_ha_e9	PROC

_B2_1::

        DB        243
        DB        15
        DB        30
        DB        250
L56::

        sub       rsp, 408
        lea       r9, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [224+rsp], xmm15
        xor       r10d, r10d
        vmovups   XMMWORD PTR [240+rsp], xmm14
        vmovups   XMMWORD PTR [256+rsp], xmm13
        vmovups   XMMWORD PTR [272+rsp], xmm12
        vmovups   XMMWORD PTR [288+rsp], xmm11
        vmovups   XMMWORD PTR [304+rsp], xmm10
        vmovups   XMMWORD PTR [320+rsp], xmm9
        vmovups   XMMWORD PTR [368+rsp], xmm8
        vmovups   XMMWORD PTR [352+rsp], xmm7
        vpxor     xmm8, xmm8, xmm8
        vmovups   XMMWORD PTR [336+rsp], xmm6
        mov       QWORD PTR [384+rsp], r13
        lea       r13, QWORD PTR [143+rsp]
        vmovups   xmm5, XMMWORD PTR [rcx]
        and       r13, -64
        vmovups   xmm4, XMMWORD PTR [__svml_stan_ha_data_internal+960]
        vandps    xmm1, xmm5, xmm4
        vandnps   xmm3, xmm4, xmm5
        vmulps    xmm0, xmm1, XMMWORD PTR [__svml_stan_ha_data_internal+832]
        vcmpnleps xmm4, xmm1, XMMWORD PTR [__svml_stan_ha_data_internal+1216]
        vcvtps2pd ymm2, xmm1
        vmovups   xmm7, XMMWORD PTR [__svml_stan_ha_data_internal+1088]
        vmovmskps eax, xmm4
        vaddps    xmm6, xmm7, xmm0
        vpslld    xmm1, xmm6, 31
        vsubps    xmm12, xmm6, xmm7
        vcvtps2pd ymm14, xmm12
        vpcmpeqd  xmm10, xmm1, xmm8
        vpshufd   xmm9, xmm10, 80
        vxorps    xmm3, xmm1, xmm3
        vpshufd   xmm11, xmm10, 250
        vmulpd    ymm13, ymm14, YMMWORD PTR [__svml_stan_ha_data_internal+1280]
        vmulpd    ymm15, ymm14, YMMWORD PTR [__svml_stan_ha_data_internal+1344]
        vsubpd    ymm2, ymm2, ymm13
        vsubpd    ymm6, ymm2, ymm15
        vmulpd    ymm2, ymm6, YMMWORD PTR [__svml_stan_ha_data_internal+1472]
        mov       QWORD PTR [392+rsp], r13
        vinsertf128 ymm0, ymm9, xmm11, 1
        vmulpd    ymm9, ymm6, ymm6
        vmulpd    ymm8, ymm9, YMMWORD PTR [__svml_stan_ha_data_internal+1664]
        vmulpd    ymm7, ymm9, ymm2
        vaddpd    ymm10, ymm8, YMMWORD PTR [__svml_stan_ha_data_internal+1600]
        vaddpd    ymm12, ymm6, ymm7
        vmulpd    ymm11, ymm9, ymm10
        vaddpd    ymm13, ymm11, YMMWORD PTR [__svml_stan_ha_data_internal+1536]
        vblendvpd ymm14, ymm13, ymm12, ymm0
        vblendvpd ymm0, ymm12, ymm13, ymm0
        vdivpd    ymm15, ymm14, ymm0
        vcvtpd2ps xmm0, ymm15
        vxorps    xmm0, xmm0, xmm3
        test      eax, eax
        jne       _B2_12

_B2_2::

        test      r10d, r10d
        jne       _B2_4

_B2_3::

        vzeroupper
        vmovups   xmm6, XMMWORD PTR [336+rsp]
        vmovups   xmm7, XMMWORD PTR [352+rsp]
        vmovups   xmm8, XMMWORD PTR [368+rsp]
        vmovups   xmm9, XMMWORD PTR [320+rsp]
        vmovups   xmm10, XMMWORD PTR [304+rsp]
        vmovups   xmm11, XMMWORD PTR [288+rsp]
        vmovups   xmm12, XMMWORD PTR [272+rsp]
        vmovups   xmm13, XMMWORD PTR [256+rsp]
        vmovups   xmm14, XMMWORD PTR [240+rsp]
        vmovups   xmm15, XMMWORD PTR [224+rsp]
        mov       r13, QWORD PTR [384+rsp]
        add       rsp, 408
        ret

_B2_4::

        vmovups   XMMWORD PTR [r13], xmm5
        vmovups   XMMWORD PTR [64+r13], xmm0
        je        _B2_3

_B2_7::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r10d

_B2_8::

        bt        esi, ebx
        jc        _B2_11

_B2_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B2_8

_B2_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B2_3

_B2_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_stan_ha_cout_rare_internal
        jmp       _B2_9

_B2_12::

        vmovups   XMMWORD PTR [48+rsp], xmm0
        mov       r11d, 2139095040
        vmovups   xmm0, XMMWORD PTR [_2il0floatpacket_27]
        vandps    xmm12, xmm5, xmm0
        vcmpeqps  xmm12, xmm12, xmm0
        vmovups   xmm2, XMMWORD PTR [_2il0floatpacket_28]
        vmovups   XMMWORD PTR [64+rsp], xmm5
        vandnps   xmm0, xmm2, xmm5
        vmovmskps r10d, xmm12
        vandps    xmm12, xmm5, xmm2
        vmovd     xmm5, r11d
        vmovups   XMMWORD PTR [32+rsp], xmm4
        vpshufd   xmm4, xmm5, 0
        mov       r11d, 8388607
        vpand     xmm6, xmm4, xmm0
        vpsrld    xmm14, xmm6, 23
        vpslld    xmm10, xmm14, 1
        vpaddd    xmm15, xmm10, xmm14
        vpslld    xmm9, xmm15, 2
        vmovd     r8d, xmm9
        vpextrd   ecx, xmm9, 1
        vpextrd   edx, xmm9, 2
        vpextrd   eax, xmm9, 3
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+r8]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rcx]
        vpunpcklqdq xmm5, xmm7, xmm1
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rdx]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rdx]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rdx]
        mov       edx, 8388608
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+r9+rax]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rax]
        vpunpcklqdq xmm2, xmm8, xmm3
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rax]
        mov       eax, 65535
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+r8]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+r9+rcx]
        vpunpcklqdq xmm13, xmm4, xmm11
        vmovd     xmm4, r11d
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+rcx]
        mov       ecx, -2147483648
        vpunpcklqdq xmm15, xmm10, xmm14
        vmovd     xmm10, edx
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+r9+r8]
        mov       r8d, 1065353216
        vpshufd   xmm11, xmm4, 0
        mov       edx, 262143
        vshufps   xmm6, xmm5, xmm2, 136
        vpand     xmm14, xmm11, xmm0
        vshufps   xmm3, xmm13, xmm15, 136
        vmovd     xmm15, eax
        vpunpcklqdq xmm5, xmm9, xmm7
        vpsrld    xmm7, xmm3, 16
        vpunpcklqdq xmm2, xmm1, xmm8
        mov       r11d, 679477248
        vpshufd   xmm13, xmm10, 0
        mov       eax, 872415232
        vshufps   xmm1, xmm5, xmm2, 136
        vpaddd    xmm9, xmm14, xmm13
        vpshufd   xmm10, xmm15, 0
        vpsrld    xmm13, xmm1, 16
        vpand     xmm15, xmm3, xmm10
        vpsrld    xmm4, xmm9, 16
        vpand     xmm3, xmm9, xmm10
        vpand     xmm1, xmm1, xmm10
        vpmulld   xmm8, xmm4, xmm1
        vpand     xmm5, xmm6, xmm10
        vpmulld   xmm1, xmm4, xmm13
        vpsrld    xmm11, xmm8, 16
        vpmulld   xmm13, xmm3, xmm13
        vpsrld    xmm6, xmm6, 16
        vpmulld   xmm14, xmm3, xmm15
        vpsrld    xmm13, xmm13, 16
        vpand     xmm8, xmm14, xmm10
        vpaddd    xmm1, xmm1, xmm13
        vpmulld   xmm9, xmm3, xmm7
        vpaddd    xmm8, xmm8, xmm1
        vpmulld   xmm15, xmm4, xmm15
        vpsrld    xmm14, xmm14, 16
        vpaddd    xmm1, xmm11, xmm8
        vpand     xmm8, xmm9, xmm10
        vpaddd    xmm14, xmm15, xmm14
        vpsrld    xmm11, xmm1, 16
        vpmulld   xmm2, xmm3, xmm5
        vpaddd    xmm8, xmm8, xmm14
        vpmulld   xmm7, xmm4, xmm7
        vpsrld    xmm9, xmm9, 16
        vpaddd    xmm8, xmm11, xmm8
        vpand     xmm11, xmm2, xmm10
        vpaddd    xmm7, xmm7, xmm9
        vpsrld    xmm13, xmm8, 16
        vpmulld   xmm3, xmm3, xmm6
        vpaddd    xmm11, xmm11, xmm7
        vpmulld   xmm5, xmm4, xmm5
        vpsrld    xmm2, xmm2, 16
        vpaddd    xmm7, xmm13, xmm11
        vpand     xmm6, xmm3, xmm10
        vpaddd    xmm4, xmm5, xmm2
        vpsrld    xmm9, xmm7, 16
        vpaddd    xmm11, xmm6, xmm4
        vmovd     xmm3, ecx
        vpaddd    xmm9, xmm9, xmm11
        vpand     xmm7, xmm7, xmm10
        vpslld    xmm14, xmm9, 16
        vpand     xmm1, xmm1, xmm10
        vpshufd   xmm10, xmm3, 0
        vmovd     xmm9, r8d
        vpaddd    xmm6, xmm14, xmm7
        vpslld    xmm8, xmm8, 16
        vpshufd   xmm7, xmm9, 0
        vpand     xmm3, xmm10, xmm0
        vpaddd    xmm2, xmm8, xmm1
        vpsrld    xmm1, xmm6, 9
        vpxor     xmm8, xmm3, xmm7
        vmovd     xmm15, edx
        vmovups   xmm4, XMMWORD PTR [_2il0floatpacket_29]
        vpor      xmm11, xmm1, xmm8
        vpshufd   xmm9, xmm15, 0
        vmovd     xmm14, r11d
        mov       ecx, 511
        vpand     xmm7, xmm9, xmm2
        vpshufd   xmm13, xmm14, 0
        vpslld    xmm1, xmm7, 5
        vpsrld    xmm2, xmm2, 18
        mov       r8d, 255
        mov       r11d, 127
        vaddps    xmm5, xmm11, xmm4
        vsubps    xmm10, xmm5, xmm4
        vsubps    xmm8, xmm11, xmm10
        vpxor     xmm11, xmm3, xmm13
        vmovd     xmm10, eax
        vpor      xmm4, xmm1, xmm11
        vpshufd   xmm14, xmm10, 0
        vsubps    xmm7, xmm4, xmm11
        vpxor     xmm4, xmm3, xmm14
        vmovd     xmm3, ecx
        vpshufd   xmm13, xmm3, 0
        vpand     xmm6, xmm13, xmm6
        vpslld    xmm15, xmm6, 14
        vpor      xmm9, xmm15, xmm2
        vpor      xmm1, xmm9, xmm4
        vmovups   xmm11, XMMWORD PTR [_2il0floatpacket_33]
        vsubps    xmm3, xmm1, xmm4
        vaddps    xmm2, xmm8, xmm3
        vandps    xmm1, xmm2, xmm11
        vsubps    xmm8, xmm8, xmm2
        vsubps    xmm4, xmm2, xmm1
        vaddps    xmm9, xmm3, xmm8
        vmovups   xmm3, XMMWORD PTR [_2il0floatpacket_32]
        vaddps    xmm8, xmm7, xmm9
        vmulps    xmm10, xmm3, xmm1
        vmulps    xmm13, xmm3, xmm4
        vmulps    xmm14, xmm8, XMMWORD PTR [_2il0floatpacket_30]
        vmovups   xmm7, XMMWORD PTR [_2il0floatpacket_31]
        vmulps    xmm6, xmm7, xmm4
        vmulps    xmm9, xmm7, xmm1
        vaddps    xmm7, xmm14, xmm13
        vaddps    xmm15, xmm6, xmm10
        vmovups   xmm3, XMMWORD PTR [_2il0floatpacket_35]
        vaddps    xmm1, xmm15, xmm7
        vandps    xmm8, xmm0, XMMWORD PTR [_2il0floatpacket_34]
        vaddps    xmm4, xmm9, xmm1
        vcmpgtps  xmm6, xmm8, xmm3
        vcmpleps  xmm2, xmm8, xmm3
        vsubps    xmm9, xmm9, xmm4
        vandps    xmm0, xmm2, xmm0
        vaddps    xmm10, xmm1, xmm9
        vandps    xmm9, xmm6, xmm4
        vmovd     xmm1, r11d
        vorps     xmm9, xmm0, xmm9
        vmovd     xmm0, r8d
        vpshufd   xmm7, xmm0, 0
        vandps    xmm8, xmm6, xmm10
        vpand     xmm3, xmm5, xmm7
        vpshufd   xmm5, xmm1, 0
        vpand     xmm4, xmm3, xmm5
        vpslld    xmm2, xmm4, 2
        vpaddd    xmm14, xmm2, xmm4
        vpslld    xmm13, xmm14, 3
        vmovd     edx, xmm13
        vpextrd   eax, xmm13, 1
        vpextrd   ecx, xmm13, 2
        vpextrd   r8d, xmm13, 3
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rax]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+rcx]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+r9+r8]
        vpunpcklqdq xmm3, xmm15, xmm0
        vpunpcklqdq xmm5, xmm7, xmm1
        vmovd     xmm10, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+r8]
        vshufps   xmm14, xmm3, xmm5, 136
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+r8]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rdx]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rax]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rax]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+r9+rcx]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+r9+rcx]
        vpunpcklqdq xmm13, xmm2, xmm4
        vpunpcklqdq xmm15, xmm6, xmm10
        vpunpcklqdq xmm5, xmm0, xmm7
        vpunpcklqdq xmm2, xmm1, xmm3
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rdx]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rax]
        vshufps   xmm13, xmm13, xmm15, 136
        vshufps   xmm10, xmm5, xmm2, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rax]
        vpunpcklqdq xmm7, xmm4, xmm6
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+rcx]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rcx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+r9+r8]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+r8]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+r9+rdx]
        vpunpcklqdq xmm1, xmm15, xmm0
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rdx]
        vpunpcklqdq xmm6, xmm3, xmm5
        vpunpcklqdq xmm15, xmm2, xmm4
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rax]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+rcx]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+r9+r8]
        vshufps   xmm1, xmm7, xmm1, 136
        vshufps   xmm7, xmm6, xmm15, 136
        vpunpcklqdq xmm4, xmm0, xmm3
        vpunpcklqdq xmm6, xmm5, xmm2
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rax]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+r9+rcx]
        vshufps   xmm3, xmm4, xmm6, 136
        vpunpcklqdq xmm4, xmm15, xmm0
        vpunpcklqdq xmm6, xmm5, xmm2
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rcx]
        vshufps   xmm5, xmm4, xmm6, 136
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+rax]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+r9+r8]
        vpunpcklqdq xmm6, xmm15, xmm0
        vpunpcklqdq xmm15, xmm2, xmm4
        vshufps   xmm6, xmm6, xmm15, 136
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+r8]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rdx]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rax]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+r9+rcx]
        vpunpcklqdq xmm0, xmm0, xmm2
        vpunpcklqdq xmm2, xmm4, xmm15
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rax]
        vshufps   xmm2, xmm0, xmm2, 136
        vpunpcklqdq xmm4, xmm4, xmm15
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+rcx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+r9+r8]
        vpunpcklqdq xmm0, xmm0, xmm15
        vsubps    xmm15, xmm14, xmm9
        vmulps    xmm6, xmm9, xmm6
        vsubps    xmm14, xmm14, xmm15
        vaddps    xmm6, xmm5, xmm6
        vaddps    xmm5, xmm3, xmm5
        vsubps    xmm14, xmm14, xmm9
        vshufps   xmm4, xmm4, xmm0, 136
        vandps    xmm0, xmm15, xmm11
        vmulps    xmm4, xmm9, xmm4
        vsubps    xmm15, xmm15, xmm0
        vsubps    xmm14, xmm14, xmm8
        vmulps    xmm8, xmm8, xmm5
        vaddps    xmm13, xmm13, xmm15
        vaddps    xmm2, xmm2, xmm4
        vmulps    xmm4, xmm9, xmm9
        vaddps    xmm15, xmm14, xmm13
        vrcpps    xmm14, xmm0
        vandps    xmm13, xmm14, xmm11
        vmulps    xmm0, xmm0, xmm13
        vmovups   xmm11, XMMWORD PTR [__svml_stan_ha_data_internal+1152]
        vmovups   xmm5, XMMWORD PTR [64+rsp]
        vsubps    xmm11, xmm11, xmm0
        vmulps    xmm14, xmm13, xmm11
        vmulps    xmm0, xmm11, xmm11
        vaddps    xmm14, xmm13, xmm14
        vmulps    xmm0, xmm0, xmm14
        vaddps    xmm0, xmm14, xmm0
        vmulps    xmm15, xmm15, xmm0
        vsubps    xmm14, xmm15, xmm11
        vmulps    xmm11, xmm15, xmm15
        vsubps    xmm11, xmm11, xmm14
        vmulps    xmm14, xmm10, xmm13
        vmulps    xmm13, xmm9, xmm3
        vmulps    xmm3, xmm2, xmm4
        vmulps    xmm0, xmm0, xmm11
        vaddps    xmm11, xmm1, xmm13
        vaddps    xmm2, xmm6, xmm3
        vmulps    xmm10, xmm10, xmm0
        vsubps    xmm1, xmm1, xmm11
        vaddps    xmm0, xmm14, xmm11
        vmulps    xmm9, xmm9, xmm2
        vaddps    xmm1, xmm13, xmm1
        vsubps    xmm13, xmm14, xmm0
        vaddps    xmm10, xmm10, xmm1
        vaddps    xmm1, xmm11, xmm13
        vaddps    xmm1, xmm10, xmm1
        vaddps    xmm1, xmm1, xmm8
        vaddps    xmm3, xmm7, xmm1
        vaddps    xmm1, xmm3, xmm9
        vaddps    xmm0, xmm0, xmm1
        vmovups   xmm1, XMMWORD PTR [32+rsp]
        vxorps    xmm12, xmm0, xmm12
        vmovups   xmm0, XMMWORD PTR [48+rsp]
        vblendvps xmm0, xmm0, xmm12, xmm1
        jmp       _B2_2
        ALIGN     16

_B2_13::

__svml_tanf4_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_e9_B1_B4:
	DD	1604609
	DD	3200124
	DD	1402996
	DD	1472614
	DD	1542237
	DD	1349716
	DD	1288267
	DD	1226818
	DD	1165369
	DD	1103920
	DD	1042471
	DD	981019
	DD	3342603

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_tanf4_ha_e9_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_e9_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_tanf4_ha_e9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_7
	DD	imagerel _B2_12
	DD	imagerel _unwind___svml_tanf4_ha_e9_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_e9_B12_B12:
	DD	33
	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_tanf4_ha_e9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_12
	DD	imagerel _B2_13
	DD	imagerel _unwind___svml_tanf4_ha_e9_B12_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST2:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_tanf8_ha_e9

__svml_tanf8_ha_e9	PROC

_B3_1::

        DB        243
        DB        15
        DB        30
        DB        250
L89::

        push      rbp
        push      r12
        push      r14
        push      r15
        sub       rsp, 616
        lea       rbp, QWORD PTR [32+rsp]
        xor       r12d, r12d
        vmovups   XMMWORD PTR [400+rbp], xmm15
        vmovups   XMMWORD PTR [416+rbp], xmm14
        vmovups   XMMWORD PTR [432+rbp], xmm13
        vmovups   XMMWORD PTR [448+rbp], xmm12
        vmovups   XMMWORD PTR [464+rbp], xmm11
        vmovups   XMMWORD PTR [480+rbp], xmm10
        vmovups   XMMWORD PTR [496+rbp], xmm9
        vmovups   XMMWORD PTR [512+rbp], xmm8
        vmovups   XMMWORD PTR [528+rbp], xmm7
        vmovups   XMMWORD PTR [544+rbp], xmm6
        mov       QWORD PTR [560+rbp], r13
        lea       r13, QWORD PTR [239+rbp]
        vmovups   ymm1, YMMWORD PTR [rcx]
        and       r13, -64
        vmovups   ymm2, YMMWORD PTR [__svml_stan_ha_data_internal+960]
        vandps    ymm10, ymm1, ymm2
        vandnps   ymm9, ymm2, ymm1
        vcmpnle_uqps ymm2, ymm10, YMMWORD PTR [__svml_stan_ha_data_internal+1216]
        mov       QWORD PTR [568+rbp], r13
        vextractf128 xmm12, ymm10, 1
        vmulps    ymm0, ymm10, YMMWORD PTR [__svml_stan_ha_data_internal+832]
        vcvtps2pd ymm13, xmm12
        vcvtps2pd ymm3, xmm10
        vmovups   ymm12, YMMWORD PTR [__svml_stan_ha_data_internal+1088]
        vaddps    ymm4, ymm12, ymm0
        vpslld    xmm5, xmm4, 31
        vsubps    ymm6, ymm4, ymm12
        vextractf128 xmm8, ymm4, 1
        vpxor     xmm12, xmm12, xmm12
        vpslld    xmm7, xmm8, 31
        vpcmpeqd  xmm8, xmm7, xmm12
        vextractf128 xmm4, ymm6, 1
        vpcmpeqd  xmm15, xmm5, xmm12
        vpshufd   xmm14, xmm15, 80
        vpshufd   xmm0, xmm15, 250
        vinsertf128 ymm10, ymm5, xmm7, 1
        vcvtps2pd ymm5, xmm4
        vmovupd   ymm4, YMMWORD PTR [__svml_stan_ha_data_internal+1280]
        vxorps    ymm9, ymm10, ymm9
        vinsertf128 ymm7, ymm14, xmm0, 1
        vcvtps2pd ymm14, xmm6
        vpshufd   xmm0, xmm8, 80
        vpshufd   xmm8, xmm8, 250
        vmulpd    ymm15, ymm14, ymm4
        vinsertf128 ymm8, ymm0, xmm8, 1
        vsubpd    ymm0, ymm3, ymm15
        vmulpd    ymm3, ymm5, ymm4
        vsubpd    ymm6, ymm13, ymm3
        vmovupd   ymm3, YMMWORD PTR [__svml_stan_ha_data_internal+1344]
        vmulpd    ymm13, ymm14, ymm3
        vsubpd    ymm4, ymm0, ymm13
        vmulpd    ymm0, ymm5, ymm3
        vmovupd   ymm5, YMMWORD PTR [__svml_stan_ha_data_internal+1472]
        vmulpd    ymm14, ymm4, ymm4
        vmovupd   ymm3, YMMWORD PTR [__svml_stan_ha_data_internal+1600]
        vsubpd    ymm15, ymm6, ymm0
        vmulpd    ymm6, ymm5, ymm4
        vmulpd    ymm0, ymm15, ymm15
        vmulpd    ymm5, ymm5, ymm15
        vmulpd    ymm13, ymm14, ymm6
        vaddpd    ymm6, ymm4, ymm13
        vmovupd   ymm13, YMMWORD PTR [__svml_stan_ha_data_internal+1664]
        vmulpd    ymm4, ymm0, ymm5
        vaddpd    ymm5, ymm15, ymm4
        vmulpd    ymm15, ymm13, ymm14
        vmulpd    ymm4, ymm13, ymm0
        vaddpd    ymm15, ymm3, ymm15
        vaddpd    ymm3, ymm3, ymm4
        vmovupd   ymm4, YMMWORD PTR [__svml_stan_ha_data_internal+1536]
        vmulpd    ymm14, ymm14, ymm15
        vmulpd    ymm0, ymm0, ymm3
        vaddpd    ymm14, ymm4, ymm14
        vaddpd    ymm3, ymm4, ymm0
        vblendvpd ymm4, ymm14, ymm6, ymm7
        vblendvpd ymm7, ymm6, ymm14, ymm7
        vblendvpd ymm0, ymm3, ymm5, ymm8
        vblendvpd ymm8, ymm5, ymm3, ymm8
        vdivpd    ymm3, ymm4, ymm7
        vdivpd    ymm4, ymm0, ymm8
        vcvtpd2ps xmm0, ymm3
        vcvtpd2ps xmm5, ymm4
        vextractf128 xmm11, ymm2, 1
        vpackssdw xmm11, xmm2, xmm11
        vpacksswb xmm3, xmm11, xmm12
        vpmovmskb eax, xmm3
        vinsertf128 ymm6, ymm0, xmm5, 1
        vxorps    ymm0, ymm6, ymm9
        test      al, al
        jne       _B3_12

_B3_2::

        test      r12b, r12b
        jne       _B3_4

_B3_3::

        vmovups   xmm6, XMMWORD PTR [544+rbp]
        vmovups   xmm7, XMMWORD PTR [528+rbp]
        vmovups   xmm8, XMMWORD PTR [512+rbp]
        vmovups   xmm9, XMMWORD PTR [496+rbp]
        vmovups   xmm10, XMMWORD PTR [480+rbp]
        vmovups   xmm11, XMMWORD PTR [464+rbp]
        vmovups   xmm12, XMMWORD PTR [448+rbp]
        vmovups   xmm13, XMMWORD PTR [432+rbp]
        vmovups   xmm14, XMMWORD PTR [416+rbp]
        vmovups   xmm15, XMMWORD PTR [400+rbp]
        mov       r13, QWORD PTR [560+rbp]
        lea       rsp, QWORD PTR [584+rbp]
        pop       r15
        pop       r14
        pop       r12
        pop       rbp
        ret

_B3_4::

        vmovups   YMMWORD PTR [r13], ymm1
        vmovups   YMMWORD PTR [64+r13], ymm0
        test      r12d, r12d
        je        _B3_3

_B3_7::

        xor       r14d, r14d

_B3_8::

        bt        r12d, r14d
        jc        _B3_11

_B3_9::

        inc       r14d
        cmp       r14d, 8
        jl        _B3_8

_B3_10::

        vmovups   ymm0, YMMWORD PTR [64+r13]
        jmp       _B3_3

_B3_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+r14*4]
        lea       rdx, QWORD PTR [64+r13+r14*4]

        call      __svml_stan_ha_cout_rare_internal
        jmp       _B3_9

_B3_12::

        vmovups   ymm14, YMMWORD PTR [_2il0floatpacket_36]
        mov       edx, 2139095040
        vmovups   ymm4, YMMWORD PTR [_2il0floatpacket_37]
        vpxor     xmm15, xmm15, xmm15
        vmovups   YMMWORD PTR [32+r13], ymm1
        vmovups   YMMWORD PTR [96+r13], ymm0
        vmovups   YMMWORD PTR [64+r13], ymm2
        vandps    ymm13, ymm1, ymm14
        lea       rax, QWORD PTR [__ImageBase]
        vcmpeqps  ymm12, ymm13, ymm14
        vandps    ymm7, ymm1, ymm4
        vmovups   YMMWORD PTR [r13], ymm7
        vextractf128 xmm9, ymm12, 1
        vpackssdw xmm6, xmm12, xmm9
        vpacksswb xmm8, xmm6, xmm15
        vandnps   ymm15, ymm4, ymm1
        vmovd     xmm1, edx
        vmovups   YMMWORD PTR [128+r13], ymm15
        vpshufd   xmm5, xmm1, 0
        vpmovmskb r12d, xmm8
        vpand     xmm10, xmm5, xmm15
        vextractf128 xmm11, ymm15, 1
        vpsrld    xmm0, xmm10, 23
        vpslld    xmm2, xmm0, 1
        vpaddd    xmm13, xmm2, xmm0
        vpand     xmm3, xmm5, xmm11
        vpslld    xmm9, xmm13, 2
        vpsrld    xmm12, xmm3, 23
        vpslld    xmm14, xmm12, 1
        vpaddd    xmm1, xmm14, xmm12
        vpslld    xmm3, xmm1, 2
        vmovd     r11d, xmm3
        vmovd     ecx, xmm9
        vmovups   XMMWORD PTR [16+rbp], xmm11
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r11]
        vpextrd   r14d, xmm3, 1
        vpextrd   r15d, xmm3, 2
        vpextrd   edx, xmm3, 3
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r14]
        vmovd     xmm13, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r15]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+rdx]
        vpextrd   r8d, xmm9, 1
        vpextrd   r9d, xmm9, 2
        vpextrd   r10d, xmm9, 3
        vpunpcklqdq xmm1, xmm2, xmm0
        vpunpcklqdq xmm9, xmm13, xmm14
        vmovd     xmm14, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+rdx]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r11]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r14]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r15]
        vshufps   xmm13, xmm1, xmm9, 136
        vpunpcklqdq xmm1, xmm3, xmm2
        vpunpcklqdq xmm9, xmm0, xmm14
        vshufps   xmm9, xmm1, xmm9, 136
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r15]
        mov       r15d, 8388607
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+rcx]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r8]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r9]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r10]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r14]
        mov       r14d, 8388608
        vpunpcklqdq xmm10, xmm6, xmm8
        vpunpcklqdq xmm5, xmm7, xmm4
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+rcx]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r8]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r9]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r10]
        vshufps   xmm12, xmm10, xmm5, 136
        vpunpcklqdq xmm10, xmm6, xmm8
        vpunpcklqdq xmm5, xmm7, xmm4
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r10]
        mov       r10d, -2147483648
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+rcx]
        mov       ecx, 679477248
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r8]
        mov       r8d, 255
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r9]
        mov       r9d, 1065353216
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r11]
        mov       r11d, 65535
        vshufps   xmm10, xmm10, xmm5, 136
        vpunpcklqdq xmm5, xmm6, xmm8
        vpunpcklqdq xmm3, xmm7, xmm4
        vmovd     xmm4, r15d
        vshufps   xmm0, xmm5, xmm3, 136
        vmovd     xmm5, r14d
        vpunpcklqdq xmm8, xmm2, xmm14
        mov       r15d, 262143
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+rdx]
        mov       r14d, 872415232
        vpshufd   xmm2, xmm4, 0
        vpunpcklqdq xmm7, xmm1, xmm6
        vpand     xmm11, xmm2, xmm11
        vpshufd   xmm1, xmm5, 0
        vmovups   XMMWORD PTR [rbp], xmm15
        vpand     xmm15, xmm2, xmm15
        vpaddd    xmm6, xmm11, xmm1
        vmovd     xmm11, r11d
        vpaddd    xmm14, xmm15, xmm1
        vpsrld    xmm2, xmm0, 16
        vpshufd   xmm15, xmm11, 0
        mov       r11d, 511
        vmovups   XMMWORD PTR [32+rbp], xmm12
        vpand     xmm11, xmm12, xmm15
        vshufps   xmm3, xmm8, xmm7, 136
        vpand     xmm7, xmm13, xmm15
        vpsrld    xmm12, xmm10, 16
        vpsrld    xmm8, xmm9, 16
        vpand     xmm5, xmm10, xmm15
        vpand     xmm1, xmm9, xmm15
        vpsrld    xmm10, xmm14, 16
        vpand     xmm9, xmm14, xmm15
        vpand     xmm14, xmm6, xmm15
        vpand     xmm0, xmm0, xmm15
        vmovdqu   XMMWORD PTR [80+rbp], xmm7
        vpsrld    xmm4, xmm3, 16
        vpmulld   xmm7, xmm14, xmm7
        vpand     xmm3, xmm3, xmm15
        vmovdqu   XMMWORD PTR [160+rbp], xmm7
        vpmulld   xmm7, xmm10, xmm2
        vpmulld   xmm2, xmm9, xmm2
        vmovups   XMMWORD PTR [48+rbp], xmm13
        vpsrld    xmm13, xmm6, 16
        vpmulld   xmm6, xmm9, xmm11
        vpsrld    xmm2, xmm2, 16
        vmovdqu   XMMWORD PTR [64+rbp], xmm11
        vpaddd    xmm7, xmm7, xmm2
        vmovdqu   XMMWORD PTR [96+rbp], xmm12
        vmovdqu   XMMWORD PTR [112+rbp], xmm8
        vmovdqu   XMMWORD PTR [128+rbp], xmm1
        vmovdqu   XMMWORD PTR [144+rbp], xmm6
        vpmulld   xmm11, xmm9, xmm12
        vpmulld   xmm12, xmm14, xmm8
        vpmulld   xmm6, xmm9, xmm5
        vpmulld   xmm8, xmm14, xmm1
        vpmulld   xmm1, xmm10, xmm0
        vpmulld   xmm2, xmm13, xmm4
        vpsrld    xmm0, xmm1, 16
        vpmulld   xmm4, xmm14, xmm4
        vpand     xmm1, xmm6, xmm15
        vpaddd    xmm1, xmm1, xmm7
        vpsrld    xmm4, xmm4, 16
        vpaddd    xmm7, xmm0, xmm1
        vpand     xmm0, xmm8, xmm15
        vpmulld   xmm1, xmm13, xmm3
        vpaddd    xmm3, xmm2, xmm4
        vpmulld   xmm5, xmm10, xmm5
        vpsrld    xmm1, xmm1, 16
        vpaddd    xmm0, xmm0, xmm3
        vpsrld    xmm6, xmm6, 16
        vpaddd    xmm4, xmm1, xmm0
        vpand     xmm1, xmm11, xmm15
        vpaddd    xmm6, xmm5, xmm6
        vpsrld    xmm3, xmm7, 16
        vpmulld   xmm5, xmm13, XMMWORD PTR [128+rbp]
        vpaddd    xmm1, xmm1, xmm6
        vpsrld    xmm8, xmm8, 16
        vpaddd    xmm6, xmm3, xmm1
        vpand     xmm2, xmm12, xmm15
        vpaddd    xmm1, xmm5, xmm8
        vpsrld    xmm3, xmm4, 16
        vpaddd    xmm8, xmm2, xmm1
        vpmulld   xmm2, xmm10, XMMWORD PTR [96+rbp]
        vpaddd    xmm8, xmm3, xmm8
        vmovdqu   xmm3, XMMWORD PTR [144+rbp]
        vpsrld    xmm11, xmm11, 16
        vpand     xmm5, xmm3, xmm15
        vpaddd    xmm11, xmm2, xmm11
        vpsrld    xmm0, xmm6, 16
        vpaddd    xmm1, xmm5, xmm11
        vpaddd    xmm5, xmm0, xmm1
        vpsrld    xmm12, xmm12, 16
        vmovdqu   xmm0, XMMWORD PTR [160+rbp]
        vpsrld    xmm11, xmm8, 16
        vpmulld   xmm1, xmm13, XMMWORD PTR [112+rbp]
        vpand     xmm2, xmm0, xmm15
        vpaddd    xmm12, xmm1, xmm12
        vpslld    xmm6, xmm6, 16
        vpaddd    xmm1, xmm2, xmm12
        vpand     xmm7, xmm7, xmm15
        vmovups   xmm12, XMMWORD PTR [32+rbp]
        vpaddd    xmm2, xmm11, xmm1
        vpsrld    xmm1, xmm12, 16
        vpsrld    xmm11, xmm5, 16
        vpmulld   xmm10, xmm10, XMMWORD PTR [64+rbp]
        vpslld    xmm8, xmm8, 16
        vpmulld   xmm9, xmm9, xmm1
        vpsrld    xmm1, xmm3, 16
        vpand     xmm12, xmm9, xmm15
        vpaddd    xmm9, xmm10, xmm1
        vpaddd    xmm3, xmm12, xmm9
        vpand     xmm10, xmm5, xmm15
        vpaddd    xmm12, xmm11, xmm3
        vpsrld    xmm1, xmm2, 16
        vmovups   xmm5, XMMWORD PTR [48+rbp]
        vpslld    xmm11, xmm12, 16
        vpaddd    xmm12, xmm11, xmm10
        vpsrld    xmm11, xmm5, 16
        vpmulld   xmm14, xmm14, xmm11
        vpand     xmm5, xmm2, xmm15
        vpmulld   xmm13, xmm13, XMMWORD PTR [80+rbp]
        vpand     xmm11, xmm14, xmm15
        vpsrld    xmm14, xmm0, 16
        vpand     xmm15, xmm4, xmm15
        vpaddd    xmm13, xmm13, xmm14
        vpaddd    xmm9, xmm11, xmm13
        vmovd     xmm11, r10d
        vpaddd    xmm1, xmm1, xmm9
        vmovd     xmm9, r9d
        vpslld    xmm10, xmm1, 16
        vpaddd    xmm13, xmm8, xmm15
        vpshufd   xmm1, xmm11, 0
        vpaddd    xmm14, xmm10, xmm5
        vpshufd   xmm5, xmm9, 0
        vpaddd    xmm10, xmm6, xmm7
        vpand     xmm7, xmm1, XMMWORD PTR [rbp]
        vpsrld    xmm6, xmm12, 9
        vmovups   ymm11, YMMWORD PTR [_2il0floatpacket_38]
        vpxor     xmm15, xmm7, xmm5
        vpand     xmm8, xmm1, XMMWORD PTR [16+rbp]
        vpsrld    xmm3, xmm14, 9
        vpxor     xmm2, xmm8, xmm5
        vpor      xmm4, xmm6, xmm15
        vpor      xmm0, xmm3, xmm2
        vmovd     xmm5, ecx
        vpshufd   xmm2, xmm5, 0
        vpxor     xmm3, xmm7, xmm2
        vpxor     xmm5, xmm8, xmm2
        mov       r10d, 127
        vinsertf128 ymm1, ymm4, xmm0, 1
        vmovd     xmm0, r15d
        vaddps    ymm9, ymm1, ymm11
        vmovd     xmm4, r8d
        vpshufd   xmm0, xmm0, 0
        vsubps    ymm6, ymm9, ymm11
        vpshufd   xmm11, xmm4, 0
        vpand     xmm4, xmm0, xmm13
        vpsrld    xmm13, xmm13, 18
        vsubps    ymm15, ymm1, ymm6
        vpand     xmm6, xmm0, xmm10
        vpslld    xmm6, xmm6, 5
        vpslld    xmm0, xmm4, 5
        vpor      xmm2, xmm6, xmm3
        vpor      xmm6, xmm0, xmm5
        vmovd     xmm0, r14d
        vpsrld    xmm10, xmm10, 18
        vinsertf128 ymm4, ymm2, xmm6, 1
        vinsertf128 ymm6, ymm3, xmm5, 1
        vmovd     xmm3, r11d
        vsubps    ymm6, ymm4, ymm6
        vpshufd   xmm4, xmm3, 0
        vpand     xmm12, xmm4, xmm12
        vpand     xmm14, xmm4, xmm14
        vpshufd   xmm2, xmm0, 0
        vpslld    xmm12, xmm12, 14
        vpslld    xmm14, xmm14, 14
        vpxor     xmm7, xmm7, xmm2
        vpor      xmm12, xmm12, xmm10
        vpxor     xmm8, xmm8, xmm2
        vpor      xmm13, xmm14, xmm13
        vpor      xmm0, xmm12, xmm7
        vpor      xmm14, xmm13, xmm8
        vmovups   ymm2, YMMWORD PTR [_2il0floatpacket_40]
        vmovups   ymm5, YMMWORD PTR [_2il0floatpacket_41]
        vinsertf128 ymm12, ymm0, xmm14, 1
        vinsertf128 ymm8, ymm7, xmm8, 1
        vsubps    ymm13, ymm12, ymm8
        vaddps    ymm0, ymm15, ymm13
        vsubps    ymm14, ymm15, ymm0
        vaddps    ymm12, ymm13, ymm14
        vandps    ymm3, ymm0, YMMWORD PTR [_2il0floatpacket_42]
        vaddps    ymm4, ymm6, ymm12
        vsubps    ymm6, ymm0, ymm3
        vmulps    ymm8, ymm5, ymm3
        vmulps    ymm10, ymm4, YMMWORD PTR [_2il0floatpacket_39]
        vmulps    ymm7, ymm2, ymm6
        vmulps    ymm15, ymm5, ymm6
        vmulps    ymm13, ymm2, ymm3
        vmovups   ymm5, YMMWORD PTR [128+r13]
        vmovups   ymm3, YMMWORD PTR [_2il0floatpacket_44]
        vaddps    ymm14, ymm7, ymm8
        vaddps    ymm12, ymm10, ymm15
        vaddps    ymm0, ymm14, ymm12
        vmovd     xmm12, r10d
        vaddps    ymm6, ymm13, ymm0
        vsubps    ymm13, ymm13, ymm6
        vaddps    ymm15, ymm0, ymm13
        vpshufd   xmm0, xmm12, 0
        vandps    ymm2, ymm5, YMMWORD PTR [_2il0floatpacket_43]
        vcmpgt_oqps ymm10, ymm2, ymm3
        vcmple_oqps ymm4, ymm2, ymm3
        vandps    ymm14, ymm10, ymm15
        vandps    ymm7, ymm4, ymm5
        vandps    ymm8, ymm10, ymm6
        vorps     ymm13, ymm7, ymm8
        vextractf128 xmm1, ymm9, 1
        vpand     xmm9, xmm9, xmm11
        vpand     xmm12, xmm9, xmm0
        vpand     xmm11, xmm1, xmm11
        vpslld    xmm1, xmm12, 2
        vpand     xmm0, xmm11, xmm0
        vpaddd    xmm11, xmm1, xmm12
        vpslld    xmm1, xmm0, 2
        vpslld    xmm3, xmm11, 3
        vpaddd    xmm2, xmm1, xmm0
        vpslld    xmm15, xmm2, 3
        vmovd     r15d, xmm3
        vmovd     r9d, xmm15
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r15]
        vpextrd   r14d, xmm3, 1
        vpextrd   r11d, xmm3, 2
        vpextrd   r10d, xmm3, 3
        vpextrd   r8d, xmm15, 1
        vpextrd   ecx, xmm15, 2
        vpextrd   edx, xmm15, 3
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r14]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r11]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r10]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r9]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+rcx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1728+rax+rdx]
        vpunpcklqdq xmm8, xmm4, xmm5
        vpunpcklqdq xmm9, xmm6, xmm7
        vpunpcklqdq xmm1, xmm12, xmm11
        vpunpcklqdq xmm2, xmm15, xmm0
        vshufps   xmm10, xmm8, xmm9, 136
        vshufps   xmm3, xmm1, xmm2, 136
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r15]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r14]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r11]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r10]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r9]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+r8]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+rcx]
        vpunpcklqdq xmm8, xmm4, xmm5
        vpunpcklqdq xmm9, xmm6, xmm7
        vpunpcklqdq xmm4, xmm0, xmm1
        vshufps   xmm11, xmm8, xmm9, 136
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r15]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r14]
        vmovups   ymm0, YMMWORD PTR [96+r13]
        vmovups   ymm1, YMMWORD PTR [32+r13]
        vinsertf128 ymm12, ymm10, xmm3, 1
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1732+rax+rdx]
        vpunpcklqdq xmm5, xmm2, xmm3
        vshufps   xmm6, xmm4, xmm5, 136
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r11]
        vpunpcklqdq xmm4, xmm7, xmm8
        mov       eax, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r10]
        vmovups   ymm2, YMMWORD PTR [64+r13]
        vinsertf128 ymm11, ymm11, xmm6, 1

_B3_15::

        vmovd     xmm9, eax
        lea       rax, QWORD PTR [__ImageBase]
        vpunpcklqdq xmm5, xmm3, xmm9
        vshufps   xmm9, xmm4, xmm5, 136
        vmovups   YMMWORD PTR [96+r13], ymm0
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r9]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+r8]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+rcx]
        vpunpcklqdq xmm6, xmm3, xmm5
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1736+rax+rdx]
        vpunpcklqdq xmm8, xmm7, xmm4
        vmovups   YMMWORD PTR [32+r13], ymm1
        vshufps   xmm10, xmm6, xmm8, 136
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r15]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r14]
        vpunpcklqdq xmm3, xmm1, xmm0
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r11]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r9]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r8]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+rcx]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+rdx]
        vpunpcklqdq xmm0, xmm4, xmm6
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r14]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r11]
        vinsertf128 ymm10, ymm9, xmm10, 1
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1740+rax+r10]
        vpunpcklqdq xmm5, xmm15, xmm9
        vpunpcklqdq xmm15, xmm8, xmm1
        vshufps   xmm7, xmm3, xmm5, 136
        vshufps   xmm9, xmm0, xmm15, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r15]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r10]
        vpunpcklqdq xmm1, xmm5, xmm4
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r8]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+rdx]
        vpunpcklqdq xmm0, xmm6, xmm8
        vshufps   xmm15, xmm1, xmm0, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r15]
        vinsertf128 ymm3, ymm7, xmm9, 1
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+r9]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1744+rax+rcx]
        vpunpcklqdq xmm6, xmm9, xmm5
        vpunpcklqdq xmm8, xmm7, xmm4
        vshufps   xmm1, xmm6, xmm8, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r14]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r11]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r10]
        vpunpcklqdq xmm6, xmm0, xmm5
        vpunpcklqdq xmm8, xmm7, xmm4
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r9]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+rcx]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+rdx]
        vinsertf128 ymm9, ymm15, xmm1, 1
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1748+rax+r8]
        vshufps   xmm1, xmm6, xmm8, 136
        vpunpcklqdq xmm4, xmm0, xmm15
        vpunpcklqdq xmm6, xmm5, xmm7
        vshufps   xmm8, xmm4, xmm6, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r15]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r14]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r11]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r10]
        vpunpcklqdq xmm6, xmm0, xmm15
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+rcx]
        vinsertf128 ymm5, ymm1, xmm8, 1
        vpunpcklqdq xmm8, xmm7, xmm4
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+r9]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1752+rax+rdx]
        vshufps   xmm7, xmm6, xmm8, 136
        vpunpcklqdq xmm6, xmm1, xmm0
        vpunpcklqdq xmm8, xmm15, xmm4
        vshufps   xmm1, xmm6, xmm8, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r15]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r14]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r11]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r10]
        vpunpcklqdq xmm8, xmm0, xmm15
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r9]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+r8]
        vinsertf128 ymm7, ymm7, xmm1, 1
        vpunpcklqdq xmm1, xmm4, xmm6
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+rcx]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1756+rax+rdx]
        vshufps   xmm8, xmm8, xmm1, 136
        vpunpcklqdq xmm1, xmm0, xmm15
        vpunpcklqdq xmm0, xmm4, xmm6
        vshufps   xmm15, xmm1, xmm0, 136
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r15]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r14]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r11]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r10]
        vinsertf128 ymm8, ymm8, xmm15, 1
        vpunpcklqdq xmm15, xmm4, xmm6
        vpunpcklqdq xmm4, xmm1, xmm0
        vshufps   xmm4, xmm15, xmm4, 136
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r9]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+r8]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+rcx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1760+rax+rdx]
        vpunpcklqdq xmm6, xmm6, xmm1
        vpunpcklqdq xmm1, xmm0, xmm15
        vshufps   xmm0, xmm6, xmm1, 136
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r15]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r14]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r11]
        vpunpcklqdq xmm15, xmm15, xmm6
        vmulps    ymm8, ymm13, ymm8
        vinsertf128 ymm4, ymm4, xmm0, 1
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r10]
        vpunpcklqdq xmm6, xmm1, xmm0
        vshufps   xmm1, xmm15, xmm6, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r9]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+r8]
        vpunpcklqdq xmm6, xmm0, xmm15
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+rcx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+1764+rax+rdx]
        vpunpcklqdq xmm0, xmm0, xmm15
        vshufps   xmm6, xmm6, xmm0, 136
        vsubps    ymm15, ymm12, ymm13
        vmovups   ymm0, YMMWORD PTR [_2il0floatpacket_42]
        vsubps    ymm12, ymm12, ymm15
        vsubps    ymm12, ymm12, ymm13
        vsubps    ymm12, ymm12, ymm14
        vinsertf128 ymm6, ymm1, xmm6, 1
        vandps    ymm1, ymm15, ymm0
        vsubps    ymm15, ymm15, ymm1
        vmulps    ymm6, ymm13, ymm6
        vaddps    ymm11, ymm11, ymm15
        vaddps    ymm4, ymm4, ymm6
        vaddps    ymm15, ymm12, ymm11
        vrcpps    ymm11, ymm1
        vmulps    ymm6, ymm13, ymm13
        vandps    ymm12, ymm11, ymm0
        vmovups   ymm0, YMMWORD PTR [__svml_stan_ha_data_internal+1152]
        vmulps    ymm1, ymm1, ymm12
        vsubps    ymm11, ymm0, ymm1
        vmulps    ymm1, ymm12, ymm11
        vmulps    ymm0, ymm11, ymm11
        vaddps    ymm1, ymm12, ymm1
        vmulps    ymm0, ymm0, ymm1
        vaddps    ymm0, ymm1, ymm0
        vmulps    ymm15, ymm15, ymm0
        vsubps    ymm1, ymm15, ymm11
        vmulps    ymm11, ymm15, ymm15
        vsubps    ymm15, ymm11, ymm1
        vmulps    ymm1, ymm10, ymm12
        vmulps    ymm0, ymm0, ymm15
        vmulps    ymm10, ymm10, ymm0
        vmulps    ymm0, ymm13, ymm5
        vaddps    ymm12, ymm3, ymm0
        vsubps    ymm3, ymm3, ymm12
        vaddps    ymm11, ymm1, ymm12
        vaddps    ymm3, ymm0, ymm3
        vsubps    ymm0, ymm1, ymm11
        vaddps    ymm10, ymm10, ymm3
        vaddps    ymm3, ymm12, ymm0
        vaddps    ymm0, ymm7, ymm8
        vaddps    ymm7, ymm5, ymm7
        vaddps    ymm3, ymm10, ymm3
        vmulps    ymm5, ymm4, ymm6
        vmulps    ymm14, ymm14, ymm7
        vaddps    ymm0, ymm0, ymm5
        vaddps    ymm3, ymm3, ymm14
        vmulps    ymm13, ymm13, ymm0
        vaddps    ymm1, ymm9, ymm3
        vaddps    ymm0, ymm1, ymm13
        vaddps    ymm1, ymm11, ymm0
        vmovups   ymm0, YMMWORD PTR [96+r13]
        vxorps    ymm3, ymm1, YMMWORD PTR [r13]
        vmovups   ymm1, YMMWORD PTR [32+r13]
        vblendvps ymm0, ymm0, ymm3, ymm2
        jmp       _B3_2
        ALIGN     16

_B3_13::

__svml_tanf8_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf8_ha_e9_B1_B15:
	DD	622686465
	DD	4904049
	DD	2386026
	DD	2324578
	DD	2263130
	DD	2201682
	DD	2140234
	DD	2078786
	DD	2017338
	DD	1955890
	DD	1894442
	DD	1832994
	DD	17957655
	DD	4027252813
	DD	3221741577
	DD	20485

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_1
	DD	imagerel _B3_13
	DD	imagerel _unwind___svml_tanf8_ha_e9_B1_B15

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST3:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_tanf4_ha_l9

__svml_tanf4_ha_l9	PROC

_B4_1::

        DB        243
        DB        15
        DB        30
        DB        250
L148::

        sub       rsp, 408
        mov       r8, rcx
        vmovups   XMMWORD PTR [224+rsp], xmm15
        lea       rcx, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [240+rsp], xmm14
        vmovups   XMMWORD PTR [256+rsp], xmm13
        vmovups   XMMWORD PTR [272+rsp], xmm12
        vmovups   XMMWORD PTR [288+rsp], xmm11
        vmovups   XMMWORD PTR [304+rsp], xmm10
        vmovups   XMMWORD PTR [320+rsp], xmm9
        vmovups   XMMWORD PTR [336+rsp], xmm8
        vmovups   XMMWORD PTR [352+rsp], xmm7
        vmovups   XMMWORD PTR [368+rsp], xmm6
        mov       QWORD PTR [384+rsp], r13
        lea       r13, QWORD PTR [143+rsp]
        vmovups   xmm14, XMMWORD PTR [r8]
        and       r13, -64
        vmovups   xmm0, XMMWORD PTR [__svml_stan_ha_data_internal]
        xor       r8d, r8d
        vmovups   xmm2, XMMWORD PTR [__svml_stan_ha_data_internal+1088]
        vfmadd213ps xmm0, xmm14, xmm2
        vmovups   xmm1, XMMWORD PTR [__svml_stan_ha_data_internal+64]
        vmovups   xmm4, XMMWORD PTR [__svml_stan_ha_data_internal+256]
        vmovups   xmm5, XMMWORD PTR [__svml_stan_ha_data_internal+320]
        vandps    xmm7, xmm14, XMMWORD PTR [__svml_stan_ha_data_internal+960]
        vcmpnleps xmm13, xmm7, XMMWORD PTR [__svml_stan_ha_data_internal+768]
        vsubps    xmm6, xmm0, xmm2
        vmovmskps eax, xmm13
        vmovaps   xmm3, xmm6
        vmovaps   xmm2, xmm6
        vfnmadd213ps xmm1, xmm6, xmm14
        vfnmadd213ps xmm3, xmm4, xmm1
        vfnmadd213ps xmm2, xmm5, xmm3
        vsubps    xmm1, xmm1, xmm3
        vfnmadd231ps xmm1, xmm4, xmm6
        vsubps    xmm3, xmm2, xmm3
        vfmadd213ps xmm6, xmm5, xmm3
        mov       QWORD PTR [392+rsp], r13
        vsubps    xmm1, xmm1, xmm6
        test      eax, eax
        jne       _B4_12

_B4_2::

        vpslld    xmm7, xmm0, 2
        vpand     xmm8, xmm7, XMMWORD PTR [_2il0floatpacket_58]
        vmovd     edx, xmm8
        vpextrd   eax, xmm8, 1
        movsxd    rdx, edx
        movsxd    rax, eax
        vpextrd   r9d, xmm8, 2
        vpextrd   r10d, xmm8, 3
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rcx+rdx]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rcx+rax]
        vpunpcklqdq xmm13, xmm9, xmm10
        vmulps    xmm10, xmm2, xmm2
        vmovups   xmm9, XMMWORD PTR [__svml_stan_ha_data_internal+704]
        movsxd    r9, r9d
        movsxd    r10, r10d
        vfmadd213ps xmm9, xmm10, XMMWORD PTR [__svml_stan_ha_data_internal+640]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rcx+rdx]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rcx+r9]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rcx+r10]
        vpunpcklqdq xmm15, xmm11, xmm12
        vmulps    xmm11, xmm2, xmm9
        vfnmsub213ps xmm11, xmm10, xmm1
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rcx+r9]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rcx+r10]
        vpunpcklqdq xmm8, xmm0, xmm4
        vshufps   xmm6, xmm13, xmm15, 136
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rcx+rax]
        vmovaps   xmm10, xmm6
        vpunpcklqdq xmm7, xmm5, xmm3
        vsubps    xmm4, xmm2, xmm11
        vshufps   xmm5, xmm7, xmm8, 136
        vaddps    xmm3, xmm6, xmm4
        vmulps    xmm7, xmm6, xmm4
        vsubps    xmm1, xmm2, xmm4
        vsubps    xmm12, xmm3, xmm6
        vfnmadd213ps xmm10, xmm4, xmm7
        vsubps    xmm2, xmm1, xmm11
        vsubps    xmm13, xmm4, xmm12
        vmovups   xmm12, XMMWORD PTR [__svml_stan_ha_data_internal+1152]
        vaddps    xmm15, xmm5, xmm13
        vsubps    xmm1, xmm12, xmm7
        vaddps    xmm0, xmm2, xmm15
        vsubps    xmm8, xmm1, xmm12
        vaddps    xmm9, xmm7, xmm8
        vsubps    xmm11, xmm9, xmm10
        vfmadd213ps xmm6, xmm2, xmm11
        vrcpps    xmm2, xmm1
        vfmadd213ps xmm5, xmm4, xmm6
        vfnmadd231ps xmm12, xmm1, xmm2
        vfmadd231ps xmm12, xmm5, xmm2
        vfmadd213ps xmm2, xmm12, xmm2
        vmulps    xmm6, xmm3, xmm2
        vfmsub213ps xmm1, xmm6, xmm3
        vfnmadd213ps xmm5, xmm6, xmm1
        vsubps    xmm0, xmm5, xmm0
        vfnmadd213ps xmm0, xmm2, xmm6
        test      r8d, r8d
        jne       _B4_4

_B4_3::

        vmovups   xmm6, XMMWORD PTR [368+rsp]
        vmovups   xmm7, XMMWORD PTR [352+rsp]
        vmovups   xmm8, XMMWORD PTR [336+rsp]
        vmovups   xmm9, XMMWORD PTR [320+rsp]
        vmovups   xmm10, XMMWORD PTR [304+rsp]
        vmovups   xmm11, XMMWORD PTR [288+rsp]
        vmovups   xmm12, XMMWORD PTR [272+rsp]
        vmovups   xmm13, XMMWORD PTR [256+rsp]
        vmovups   xmm14, XMMWORD PTR [240+rsp]
        vmovups   xmm15, XMMWORD PTR [224+rsp]
        mov       r13, QWORD PTR [384+rsp]
        add       rsp, 408
        ret

_B4_4::

        vmovups   XMMWORD PTR [r13], xmm14
        vmovups   XMMWORD PTR [64+r13], xmm0
        je        _B4_3

_B4_7::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r8d

_B4_8::

        bt        esi, ebx
        jc        _B4_11

_B4_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B4_8

_B4_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B4_3

_B4_11::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_stan_ha_cout_rare_internal
        jmp       _B4_9

_B4_12::

        vmovups   XMMWORD PTR [32+rsp], xmm0
        vpand     xmm0, xmm14, XMMWORD PTR [_2il0floatpacket_27]
        vmovups   XMMWORD PTR [64+rsp], xmm1
        vpsrld    xmm1, xmm0, 23
        vmovups   XMMWORD PTR [48+rsp], xmm2
        vpslld    xmm2, xmm1, 1
        vmovups   xmm6, XMMWORD PTR [__svml_stan_ha_data_internal+1024]
        vpaddd    xmm15, xmm2, xmm1
        vandps    xmm9, xmm6, xmm7
        vpslld    xmm11, xmm15, 2
        vcmpeqps  xmm10, xmm9, xmm6
        vmovd     edx, xmm11
        vmovmskps r8d, xmm10
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rcx+rdx]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rcx+rdx]
        vpextrd   eax, xmm11, 1
        vpextrd   r9d, xmm11, 2
        vpextrd   r10d, xmm11, 3
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rcx+rax]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rcx+r9]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rcx+r10]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rcx+r10]
        vpunpcklqdq xmm4, xmm12, xmm5
        vpunpcklqdq xmm3, xmm7, xmm8
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rcx+r10]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rcx+rax]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rcx+rax]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rcx+r9]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rcx+r9]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rcx+rdx]
        vshufps   xmm10, xmm4, xmm3, 136
        vpunpcklqdq xmm1, xmm9, xmm6
        vpunpcklqdq xmm15, xmm0, xmm2
        vpunpcklqdq xmm8, xmm11, xmm12
        vpunpcklqdq xmm4, xmm5, xmm7
        vpand     xmm3, xmm14, XMMWORD PTR [_2il0floatpacket_45]
        vshufps   xmm9, xmm1, xmm15, 136
        vshufps   xmm11, xmm8, xmm4, 136
        vpsrld    xmm4, xmm9, 16
        vpaddd    xmm6, xmm3, XMMWORD PTR [_2il0floatpacket_46]
        vpsrld    xmm0, xmm11, 16
        vmovdqu   xmm12, XMMWORD PTR [_2il0floatpacket_47]
        vpand     xmm2, xmm9, xmm12
        vpsrld    xmm9, xmm6, 16
        vpand     xmm15, xmm11, xmm12
        vpand     xmm6, xmm6, xmm12
        vpmulld   xmm11, xmm9, xmm15
        vpand     xmm7, xmm10, xmm12
        vpsrld    xmm15, xmm11, 16
        vpsrld    xmm10, xmm10, 16
        vpmulld   xmm11, xmm9, xmm0
        vpmulld   xmm0, xmm6, xmm0
        vpmulld   xmm1, xmm6, xmm2
        vpsrld    xmm0, xmm0, 16
        vpand     xmm5, xmm1, xmm12
        vpaddd    xmm11, xmm11, xmm0
        vpmulld   xmm3, xmm6, xmm4
        vpaddd    xmm5, xmm5, xmm11
        vpmulld   xmm2, xmm9, xmm2
        vpsrld    xmm1, xmm1, 16
        vpaddd    xmm11, xmm15, xmm5
        vpand     xmm0, xmm3, xmm12
        vpaddd    xmm2, xmm2, xmm1
        vpsrld    xmm15, xmm11, 16
        vpmulld   xmm8, xmm6, xmm7
        vpaddd    xmm0, xmm0, xmm2
        vpmulld   xmm4, xmm9, xmm4
        vpsrld    xmm3, xmm3, 16
        vpaddd    xmm5, xmm15, xmm0
        vpand     xmm1, xmm8, xmm12
        vpaddd    xmm0, xmm4, xmm3
        vpsrld    xmm2, xmm5, 16
        vpaddd    xmm1, xmm1, xmm0
        vpand     xmm11, xmm11, xmm12
        vpmulld   xmm0, xmm6, xmm10
        vpaddd    xmm4, xmm2, xmm1
        vpmulld   xmm2, xmm9, xmm7
        vpsrld    xmm1, xmm8, 16
        vpand     xmm15, xmm0, xmm12
        vpaddd    xmm7, xmm2, xmm1
        vpsrld    xmm3, xmm4, 16
        vpaddd    xmm8, xmm15, xmm7
        vpaddd    xmm3, xmm3, xmm8
        vpand     xmm4, xmm4, xmm12
        vpslld    xmm6, xmm3, 16
        vpslld    xmm5, xmm5, 16
        vpand     xmm8, xmm14, XMMWORD PTR [_2il0floatpacket_28]
        vpaddd    xmm7, xmm6, xmm4
        vpxor     xmm9, xmm8, XMMWORD PTR [_2il0floatpacket_48]
        vpsrld    xmm12, xmm7, 9
        vmovups   xmm10, XMMWORD PTR [_2il0floatpacket_29]
        vpor      xmm0, xmm12, xmm9
        vpand     xmm7, xmm7, XMMWORD PTR [_2il0floatpacket_53]
        vpaddd    xmm5, xmm5, xmm11
        vpxor     xmm6, xmm8, XMMWORD PTR [_2il0floatpacket_50]
        vaddps    xmm1, xmm0, xmm10
        vpand     xmm15, xmm5, XMMWORD PTR [_2il0floatpacket_51]
        vpsrld    xmm5, xmm5, 18
        vpslld    xmm3, xmm15, 5
        vsubps    xmm2, xmm1, xmm10
        vpor      xmm4, xmm3, xmm6
        vsubps    xmm12, xmm0, xmm2
        vsubps    xmm15, xmm4, xmm6
        vpxor     xmm0, xmm8, XMMWORD PTR [_2il0floatpacket_52]
        vpslld    xmm8, xmm7, 14
        vpor      xmm9, xmm8, xmm5
        vpor      xmm10, xmm9, xmm0
        vpand     xmm11, xmm1, XMMWORD PTR [_2il0floatpacket_49]
        vsubps    xmm2, xmm10, xmm0
        vmovups   xmm1, XMMWORD PTR [_2il0floatpacket_30]
        vaddps    xmm3, xmm12, xmm2
        vmulps    xmm6, xmm1, xmm3
        vsubps    xmm12, xmm12, xmm3
        vmovups   xmm4, XMMWORD PTR [_2il0floatpacket_35]
        vaddps    xmm0, xmm2, xmm12
        vmovaps   xmm2, xmm1
        vaddps    xmm10, xmm15, xmm0
        vfmsub213ps xmm2, xmm3, xmm6
        vandps    xmm15, xmm14, XMMWORD PTR [_2il0floatpacket_34]
        vcmpgtps  xmm9, xmm15, xmm4
        vcmpleps  xmm5, xmm15, xmm4
        vfmadd132ps xmm3, xmm2, XMMWORD PTR [_2il0floatpacket_54]
        vandps    xmm7, xmm5, xmm14
        vandps    xmm8, xmm9, xmm6
        vorps     xmm0, xmm7, xmm8
        vmovdqu   xmm12, XMMWORD PTR [_2il0floatpacket_55]
        vpsrld    xmm2, xmm0, 31
        vfmadd213ps xmm10, xmm1, xmm3
        vpsubd    xmm1, xmm12, xmm2
        vpaddd    xmm3, xmm11, xmm1
        vpsrld    xmm5, xmm3, 2
        vmovaps   xmm3, xmm0
        vpslld    xmm4, xmm5, 2
        vpsubd    xmm11, xmm11, xmm4
        vcvtdq2ps xmm1, xmm11
        vmovups   xmm2, XMMWORD PTR [_2il0floatpacket_56]
        vandps    xmm15, xmm9, xmm10
        vfmadd231ps xmm3, xmm2, xmm1
        vfnmadd213ps xmm2, xmm1, xmm3
        vsubps    xmm0, xmm0, xmm2
        vmovups   xmm2, XMMWORD PTR [48+rsp]
        vblendvps xmm2, xmm2, xmm3, xmm13
        vfmadd132ps xmm1, xmm0, XMMWORD PTR [_2il0floatpacket_57]
        vmovups   xmm0, XMMWORD PTR [32+rsp]
        vblendvps xmm0, xmm0, xmm5, xmm13
        vaddps    xmm4, xmm15, xmm1
        vmovups   xmm1, XMMWORD PTR [64+rsp]
        vblendvps xmm1, xmm1, xmm4, xmm13
        jmp       _B4_2
        ALIGN     16

_B4_13::

__svml_tanf4_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_l9_B1_B4:
	DD	1603329
	DD	3200119
	DD	1534063
	DD	1472614
	DD	1411165
	DD	1349716
	DD	1288267
	DD	1226818
	DD	1165369
	DD	1103920
	DD	1042471
	DD	981015
	DD	3342603

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_tanf4_ha_l9_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_l9_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_tanf4_ha_l9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_7
	DD	imagerel _B4_12
	DD	imagerel _unwind___svml_tanf4_ha_l9_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf4_ha_l9_B12_B12:
	DD	33
	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_tanf4_ha_l9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_12
	DD	imagerel _B4_13
	DD	imagerel _unwind___svml_tanf4_ha_l9_B12_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST4:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_tanf8_ha_l9

__svml_tanf8_ha_l9	PROC

_B5_1::

        DB        243
        DB        15
        DB        30
        DB        250
L181::

        push      rbx
        push      r12
        push      rbp
        sub       rsp, 368
        lea       rax, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        xor       ebx, ebx
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm13
        vmovups   XMMWORD PTR [240+rsp], xmm12
        vmovups   XMMWORD PTR [256+rsp], xmm11
        vmovups   XMMWORD PTR [272+rsp], xmm10
        vmovups   XMMWORD PTR [288+rsp], xmm9
        vmovups   XMMWORD PTR [304+rsp], xmm8
        vmovups   XMMWORD PTR [320+rsp], xmm7
        vmovups   XMMWORD PTR [336+rsp], xmm6
        mov       QWORD PTR [352+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        vmovups   ymm14, YMMWORD PTR [rcx]
        and       r13, -64
        vmovups   ymm0, YMMWORD PTR [__svml_stan_ha_data_internal]
        vmovups   ymm2, YMMWORD PTR [__svml_stan_ha_data_internal+1088]
        vmovups   ymm1, YMMWORD PTR [__svml_stan_ha_data_internal+64]
        vmovups   ymm4, YMMWORD PTR [__svml_stan_ha_data_internal+256]
        vmovups   ymm5, YMMWORD PTR [__svml_stan_ha_data_internal+320]
        vfmadd213ps ymm0, ymm14, ymm2
        vsubps    ymm6, ymm0, ymm2
        vfnmadd213ps ymm1, ymm6, ymm14
        vmovaps   ymm3, ymm4
        vfnmadd213ps ymm3, ymm6, ymm1
        vmovaps   ymm2, ymm5
        vfnmadd213ps ymm2, ymm6, ymm3
        vsubps    ymm1, ymm1, ymm3
        vsubps    ymm3, ymm2, ymm3
        vfnmadd231ps ymm1, ymm4, ymm6
        vfmadd213ps ymm6, ymm5, ymm3
        vandps    ymm7, ymm14, YMMWORD PTR [__svml_stan_ha_data_internal+960]
        vcmpnle_uqps ymm13, ymm7, YMMWORD PTR [__svml_stan_ha_data_internal+768]
        vsubps    ymm1, ymm1, ymm6
        vmovmskps edx, ymm13
        mov       QWORD PTR [360+rsp], r13
        test      edx, edx
        jne       _B5_12

_B5_2::

        vpslld    ymm7, ymm0, 2
        vpand     ymm8, ymm7, YMMWORD PTR [_2il0floatpacket_74]
        vextracti128 xmm3, ymm8, 1
        vmovd     r11d, xmm8
        vmovd     ebp, xmm3
        vpextrd   r10d, xmm8, 1
        vpextrd   r9d, xmm8, 2
        vpextrd   r8d, xmm8, 3
        vpextrd   ecx, xmm3, 1
        vpextrd   edx, xmm3, 2
        vpextrd   r12d, xmm3, 3
        movsxd    r11, r11d
        movsxd    r10, r10d
        movsxd    r9, r9d
        movsxd    r8, r8d
        movsxd    rbp, ebp
        movsxd    rcx, ecx
        movsxd    rdx, edx
        movsxd    r12, r12d
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+r11]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+r10]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+r9]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+r8]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+rbp]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+rcx]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+rdx]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+384+rax+r12]
        vpunpcklqdq xmm13, xmm9, xmm10
        vpunpcklqdq xmm15, xmm11, xmm12
        vpunpcklqdq xmm9, xmm0, xmm6
        vpunpcklqdq xmm10, xmm4, xmm7
        vshufps   xmm5, xmm13, xmm15, 136
        vshufps   xmm11, xmm9, xmm10, 136
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+r11]
        vmovd     xmm13, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+r10]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+r9]
        vpunpcklqdq xmm3, xmm12, xmm13
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+rbp]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+rcx]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+rdx]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+r12]
        vpunpcklqdq xmm12, xmm9, xmm10
        vinsertf128 ymm6, ymm5, xmm11, 1
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_data_internal)+512+rax+r8]
        vpunpcklqdq xmm0, xmm15, xmm5
        vshufps   xmm4, xmm3, xmm0, 136
        vmulps    ymm15, ymm2, ymm2
        vmovups   ymm3, YMMWORD PTR [__svml_stan_ha_data_internal+704]
        vpunpcklqdq xmm11, xmm7, xmm8
        vshufps   xmm13, xmm11, xmm12, 136
        vfmadd213ps ymm3, ymm15, YMMWORD PTR [__svml_stan_ha_data_internal+640]
        vmulps    ymm0, ymm2, ymm3
        vfnmsub213ps ymm0, ymm15, ymm1
        vinsertf128 ymm5, ymm4, xmm13, 1
        vsubps    ymm4, ymm2, ymm0
        vmovups   ymm13, YMMWORD PTR [__svml_stan_ha_data_internal+1152]
        vmulps    ymm9, ymm6, ymm4
        vsubps    ymm1, ymm2, ymm4
        vaddps    ymm3, ymm6, ymm4
        vsubps    ymm2, ymm1, ymm0
        vsubps    ymm1, ymm3, ymm6
        vsubps    ymm7, ymm4, ymm1
        vsubps    ymm1, ymm13, ymm9
        vaddps    ymm8, ymm5, ymm7
        vsubps    ymm10, ymm1, ymm13
        vaddps    ymm0, ymm2, ymm8
        vaddps    ymm11, ymm9, ymm10
        vmovaps   ymm7, ymm6
        vfnmadd213ps ymm7, ymm4, ymm9
        vsubps    ymm12, ymm11, ymm7
        vfmadd213ps ymm6, ymm2, ymm12
        vrcpps    ymm2, ymm1
        vfmadd213ps ymm5, ymm4, ymm6
        vfnmadd231ps ymm13, ymm1, ymm2
        vfmadd231ps ymm13, ymm5, ymm2
        vfmadd213ps ymm2, ymm13, ymm2
        vmulps    ymm4, ymm3, ymm2
        vfmsub213ps ymm1, ymm4, ymm3
        vfnmadd213ps ymm5, ymm4, ymm1
        vsubps    ymm0, ymm5, ymm0
        vfnmadd213ps ymm0, ymm2, ymm4
        test      ebx, ebx
        jne       _B5_4

_B5_3::

        vmovups   xmm6, XMMWORD PTR [336+rsp]
        vmovups   xmm7, XMMWORD PTR [320+rsp]
        vmovups   xmm8, XMMWORD PTR [304+rsp]
        vmovups   xmm9, XMMWORD PTR [288+rsp]
        vmovups   xmm10, XMMWORD PTR [272+rsp]
        vmovups   xmm11, XMMWORD PTR [256+rsp]
        vmovups   xmm12, XMMWORD PTR [240+rsp]
        vmovups   xmm13, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [352+rsp]
        add       rsp, 368
        pop       rbp
        pop       r12
        pop       rbx
        ret

_B5_4::

        vmovups   YMMWORD PTR [r13], ymm14
        vmovups   YMMWORD PTR [64+r13], ymm0
        je        _B5_3

_B5_7::

        xor       ebp, ebp

_B5_8::

        bt        ebx, ebp
        jc        _B5_11

_B5_9::

        inc       ebp
        cmp       ebp, 8
        jl        _B5_8

_B5_10::

        vmovups   ymm0, YMMWORD PTR [64+r13]
        jmp       _B5_3

_B5_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbp*4]
        lea       rdx, QWORD PTR [64+r13+rbp*4]

        call      __svml_stan_ha_cout_rare_internal
        jmp       _B5_9

_B5_12::

        vmovups   YMMWORD PTR [32+r13], ymm2
        vmovups   YMMWORD PTR [64+r13], ymm1
        vmovups   ymm10, YMMWORD PTR [__svml_stan_ha_data_internal+1024]
        vmovups   YMMWORD PTR [r13], ymm0
        vpand     ymm2, ymm14, YMMWORD PTR [_2il0floatpacket_59]
        vpsrld    ymm15, ymm2, 23
        vpslld    ymm1, ymm15, 1
        vpaddd    ymm11, ymm1, ymm15
        vpslld    ymm12, ymm11, 2
        vandps    ymm6, ymm10, ymm7
        vcmpeqps  ymm0, ymm6, ymm10
        vmovmskps ebx, ymm0
        vextracti128 xmm10, ymm12, 1
        vmovd     r11d, xmm12
        vmovd     ebp, xmm10
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r11]
        vpextrd   r10d, xmm12, 1
        vpextrd   r9d, xmm12, 2
        vpextrd   r8d, xmm12, 3
        vpextrd   ecx, xmm10, 1
        vpextrd   edx, xmm10, 2
        vpextrd   r12d, xmm10, 3
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r10]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r9]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r8]
        vpunpcklqdq xmm3, xmm5, xmm7
        vpunpcklqdq xmm9, xmm8, xmm4
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+rbp]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+rcx]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+rax+r12]
        vshufps   xmm6, xmm3, xmm9, 136
        vpunpcklqdq xmm11, xmm0, xmm2
        vpunpcklqdq xmm12, xmm1, xmm15
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r11]
        vmovd     xmm8, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r10]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r9]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r8]
        vshufps   xmm5, xmm11, xmm12, 136
        vpunpcklqdq xmm9, xmm7, xmm8
        vpunpcklqdq xmm0, xmm4, xmm3
        vshufps   xmm2, xmm9, xmm0, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r8]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+rbp]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+rcx]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+rdx]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+4+rax+r12]
        vpunpcklqdq xmm7, xmm11, xmm12
        vmovd     xmm4, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r11]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r10]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+rbp]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+rcx]
        vinsertf128 ymm10, ymm6, xmm5, 1
        vmovd     xmm6, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r9]
        vpunpcklqdq xmm5, xmm1, xmm15
        vpunpcklqdq xmm1, xmm6, xmm0
        vpand     ymm6, ymm14, YMMWORD PTR [_2il0floatpacket_60]
        vshufps   xmm8, xmm5, xmm7, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+rdx]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_stan_ha_reduction_data_internal)+8+rax+r12]
        vinsertf128 ymm9, ymm2, xmm8, 1
        vpunpcklqdq xmm2, xmm4, xmm3
        vpunpcklqdq xmm8, xmm11, xmm12
        vmovdqu   ymm12, YMMWORD PTR [_2il0floatpacket_62]
        vshufps   xmm15, xmm2, xmm1, 136
        vpaddd    ymm1, ymm6, YMMWORD PTR [_2il0floatpacket_61]
        vpunpcklqdq xmm4, xmm5, xmm7
        vshufps   xmm3, xmm8, xmm4, 136
        vpsrld    ymm4, ymm9, 16
        vpand     ymm2, ymm9, ymm12
        vpsrld    ymm9, ymm1, 16
        vpand     ymm6, ymm1, ymm12
        vpand     ymm7, ymm10, ymm12
        vpsrld    ymm10, ymm10, 16
        vpmulld   ymm1, ymm6, ymm2
        vpmulld   ymm2, ymm9, ymm2
        vpmulld   ymm8, ymm6, ymm7
        vinsertf128 ymm11, ymm15, xmm3, 1
        vpsrld    ymm0, ymm11, 16
        vpand     ymm11, ymm11, ymm12
        vpmulld   ymm5, ymm9, ymm11
        vpmulld   ymm11, ymm9, ymm0
        vpmulld   ymm0, ymm6, ymm0
        vpsrld    ymm0, ymm0, 16
        vpsrld    ymm15, ymm5, 16
        vpand     ymm5, ymm1, ymm12
        vpsrld    ymm1, ymm1, 16
        vpaddd    ymm11, ymm11, ymm0
        vpaddd    ymm2, ymm2, ymm1
        vpaddd    ymm5, ymm5, ymm11
        vpand     ymm1, ymm8, ymm12
        vpaddd    ymm11, ymm15, ymm5
        vpmulld   ymm3, ymm6, ymm4
        vpand     ymm0, ymm3, ymm12
        vpsrld    ymm15, ymm11, 16
        vpand     ymm11, ymm11, ymm12
        vpaddd    ymm0, ymm0, ymm2
        vpaddd    ymm5, ymm15, ymm0
        vpsrld    ymm15, ymm3, 16
        vpsrld    ymm2, ymm5, 16
        vpslld    ymm5, ymm5, 16
        vpmulld   ymm4, ymm9, ymm4
        vpaddd    ymm3, ymm4, ymm15
        vpaddd    ymm5, ymm5, ymm11
        vpaddd    ymm0, ymm1, ymm3
        vpsrld    ymm1, ymm8, 16
        vpaddd    ymm4, ymm2, ymm0
        vpmulld   ymm0, ymm6, ymm10
        vpmulld   ymm2, ymm9, ymm7
        vpand     ymm15, ymm0, ymm12
        vpaddd    ymm7, ymm2, ymm1
        vpsrld    ymm3, ymm4, 16
        vpand     ymm4, ymm4, ymm12
        vmovups   ymm10, YMMWORD PTR [_2il0floatpacket_38]
        vpaddd    ymm8, ymm15, ymm7
        vpand     ymm15, ymm5, YMMWORD PTR [_2il0floatpacket_67]
        vpsrld    ymm5, ymm5, 18
        vpaddd    ymm3, ymm3, ymm8
        vpand     ymm8, ymm14, YMMWORD PTR [_2il0floatpacket_63]
        vpslld    ymm6, ymm3, 16
        vpxor     ymm9, ymm8, YMMWORD PTR [_2il0floatpacket_64]
        vpslld    ymm3, ymm15, 5
        vpaddd    ymm7, ymm6, ymm4
        vpxor     ymm6, ymm8, YMMWORD PTR [_2il0floatpacket_66]
        vpsrld    ymm12, ymm7, 9
        vpand     ymm7, ymm7, YMMWORD PTR [_2il0floatpacket_69]
        vpor      ymm4, ymm3, ymm6
        vpor      ymm0, ymm12, ymm9
        vsubps    ymm15, ymm4, ymm6
        vmovups   ymm4, YMMWORD PTR [_2il0floatpacket_44]
        vaddps    ymm1, ymm0, ymm10
        vsubps    ymm2, ymm1, ymm10
        vpand     ymm11, ymm1, YMMWORD PTR [_2il0floatpacket_65]
        vmovups   ymm1, YMMWORD PTR [_2il0floatpacket_39]
        vsubps    ymm12, ymm0, ymm2
        vpxor     ymm0, ymm8, YMMWORD PTR [_2il0floatpacket_68]
        vpslld    ymm8, ymm7, 14
        vpor      ymm9, ymm8, ymm5
        vpor      ymm10, ymm9, ymm0
        vsubps    ymm2, ymm10, ymm0
        vaddps    ymm3, ymm12, ymm2
        vsubps    ymm12, ymm12, ymm3
        vmulps    ymm6, ymm1, ymm3
        vaddps    ymm0, ymm2, ymm12
        vmovdqu   ymm12, YMMWORD PTR [_2il0floatpacket_71]
        vaddps    ymm10, ymm15, ymm0
        vmovaps   ymm2, ymm1
        vandps    ymm15, ymm14, YMMWORD PTR [_2il0floatpacket_43]
        vfmsub213ps ymm2, ymm3, ymm6
        vcmpgt_oqps ymm9, ymm15, ymm4
        vcmple_oqps ymm5, ymm15, ymm4
        vfmadd132ps ymm3, ymm2, YMMWORD PTR [_2il0floatpacket_70]
        vandps    ymm7, ymm5, ymm14
        vandps    ymm8, ymm9, ymm6
        vorps     ymm0, ymm7, ymm8
        vpsrld    ymm2, ymm0, 31
        vfmadd213ps ymm10, ymm1, ymm3
        vpsubd    ymm1, ymm12, ymm2
        vmovups   ymm2, YMMWORD PTR [_2il0floatpacket_72]
        vpaddd    ymm3, ymm11, ymm1
        vpsrld    ymm5, ymm3, 2
        vpslld    ymm4, ymm5, 2
        vpsubd    ymm11, ymm11, ymm4
        vcvtdq2ps ymm1, ymm11
        vmovaps   ymm3, ymm0
        vfmadd231ps ymm3, ymm2, ymm1
        vfnmadd213ps ymm2, ymm1, ymm3
        vsubps    ymm0, ymm0, ymm2
        vmovups   ymm2, YMMWORD PTR [32+r13]
        vfmadd132ps ymm1, ymm0, YMMWORD PTR [_2il0floatpacket_73]
        vmovups   ymm0, YMMWORD PTR [r13]
        vblendvps ymm2, ymm2, ymm3, ymm13
        vblendvps ymm0, ymm0, ymm5, ymm13
        vandps    ymm15, ymm9, ymm10
        vaddps    ymm4, ymm15, ymm1
        vmovups   ymm1, YMMWORD PTR [64+r13]
        vblendvps ymm1, ymm1, ymm4, ymm13
        jmp       _B5_2
        ALIGN     16

_B5_13::

__svml_tanf8_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_tanf8_ha_l9_B1_B12:
	DD	1800705
	DD	2937978
	DD	1402994
	DD	1341545
	DD	1280096
	DD	1218647
	DD	1157198
	DD	1095749
	DD	1034300
	DD	972851
	DD	911402
	DD	849951
	DD	3014927
	DD	3221704712
	DD	12293

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_1
	DD	imagerel _B5_13
	DD	imagerel _unwind___svml_tanf8_ha_l9_B1_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST5:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_stan_ha_cout_rare_internal

__svml_stan_ha_cout_rare_internal	PROC

_B6_1::

        DB        243
        DB        15
        DB        30
        DB        250
L210::

        sub       rsp, 40
        xor       eax, eax
        mov       r8d, DWORD PTR [rcx]
        movzx     r9d, WORD PTR [2+rcx]
        mov       DWORD PTR [32+rsp], r8d
        and       r9d, 32640
        shr       r8d, 24
        and       r8d, 127
        mov       BYTE PTR [35+rsp], r8b
        cmp       r9d, 32640
        je        _B6_3

_B6_2::

        add       rsp, 40
        ret

_B6_3::

        cmp       DWORD PTR [32+rsp], 2139095040
        jne       _B6_5

_B6_4::

        movss     xmm0, DWORD PTR [rcx]
        mov       eax, 1
        mulss     xmm0, DWORD PTR [_vmlsTanHATab]
        movss     DWORD PTR [rdx], xmm0
        add       rsp, 40
        ret

_B6_5::

        movss     xmm0, DWORD PTR [rcx]
        mulss     xmm0, DWORD PTR [rcx]
        movss     DWORD PTR [rdx], xmm0
        add       rsp, 40
        ret
        ALIGN     16

_B6_6::

__svml_stan_ha_cout_rare_internal ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_stan_ha_cout_rare_internal_B1_B5:
	DD	67585
	DD	16904

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_1
	DD	imagerel _B6_6
	DD	imagerel _unwind___svml_stan_ha_cout_rare_internal_B1_B5

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_RDATA	SEGMENT     READ PAGE   'DATA'
	ALIGN  32
	PUBLIC __svml_stan_ha_reduction_data_internal
__svml_stan_ha_reduction_data_internal	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	1
	DD	0
	DD	0
	DD	2
	DD	0
	DD	0
	DD	5
	DD	0
	DD	0
	DD	10
	DD	0
	DD	0
	DD	20
	DD	0
	DD	0
	DD	40
	DD	0
	DD	0
	DD	81
	DD	0
	DD	0
	DD	162
	DD	0
	DD	0
	DD	325
	DD	0
	DD	0
	DD	651
	DD	0
	DD	0
	DD	1303
	DD	0
	DD	0
	DD	2607
	DD	0
	DD	0
	DD	5215
	DD	0
	DD	0
	DD	10430
	DD	0
	DD	0
	DD	20860
	DD	0
	DD	0
	DD	41721
	DD	0
	DD	0
	DD	83443
	DD	0
	DD	0
	DD	166886
	DD	0
	DD	0
	DD	333772
	DD	0
	DD	0
	DD	667544
	DD	0
	DD	0
	DD	1335088
	DD	0
	DD	0
	DD	2670176
	DD	0
	DD	0
	DD	5340353
	DD	0
	DD	0
	DD	10680707
	DD	0
	DD	0
	DD	21361414
	DD	0
	DD	0
	DD	42722829
	DD	0
	DD	0
	DD	85445659
	DD	0
	DD	0
	DD	170891318
	DD	0
	DD	0
	DD	341782637
	DD	0
	DD	0
	DD	683565275
	DD	0
	DD	0
	DD	1367130551
	DD	0
	DD	0
	DD	2734261102
	DD	0
	DD	1
	DD	1173554908
	DD	0
	DD	2
	DD	2347109817
	DD	0
	DD	5
	DD	399252338
	DD	0
	DD	10
	DD	798504676
	DD	0
	DD	20
	DD	1597009353
	DD	0
	DD	40
	DD	3194018707
	DD	0
	DD	81
	DD	2093070119
	DD	0
	DD	162
	DD	4186140238
	DD	0
	DD	325
	DD	4077313180
	DD	0
	DD	651
	DD	3859659065
	DD	0
	DD	1303
	DD	3424350834
	DD	0
	DD	2607
	DD	2553734372
	DD	0
	DD	5215
	DD	812501448
	DD	0
	DD	10430
	DD	1625002897
	DD	0
	DD	20860
	DD	3250005794
	DD	0
	DD	41721
	DD	2205044292
	DD	0
	DD	83443
	DD	115121288
	DD	0
	DD	166886
	DD	230242576
	DD	0
	DD	333772
	DD	460485152
	DD	0
	DD	667544
	DD	920970305
	DD	0
	DD	1335088
	DD	1841940610
	DD	0
	DD	2670176
	DD	3683881221
	DD	0
	DD	5340353
	DD	3072795146
	DD	0
	DD	10680707
	DD	1850622997
	DD	0
	DD	21361414
	DD	3701245994
	DD	0
	DD	42722829
	DD	3107524692
	DD	0
	DD	85445659
	DD	1920082089
	DD	0
	DD	170891318
	DD	3840164178
	DD	0
	DD	341782637
	DD	3385361061
	DD	0
	DD	683565275
	DD	2475754826
	DD	0
	DD	1367130551
	DD	656542356
	DD	0
	DD	2734261102
	DD	1313084713
	DD	1
	DD	1173554908
	DD	2626169427
	DD	2
	DD	2347109817
	DD	957371559
	DD	5
	DD	399252338
	DD	1914743119
	DD	10
	DD	798504676
	DD	3829486239
	DD	20
	DD	1597009353
	DD	3364005183
	DD	40
	DD	3194018707
	DD	2433043071
	DD	81
	DD	2093070119
	DD	571118846
	DD	162
	DD	4186140238
	DD	1142237692
	DD	325
	DD	4077313180
	DD	2284475384
	DD	651
	DD	3859659065
	DD	273983472
	DD	1303
	DD	3424350834
	DD	547966945
	DD	2607
	DD	2553734372
	DD	1095933890
	DD	5215
	DD	812501448
	DD	2191867780
	DD	10430
	DD	1625002897
	DD	88768265
	DD	20860
	DD	3250005794
	DD	177536531
	DD	41721
	DD	2205044292
	DD	355073063
	DD	83443
	DD	115121288
	DD	710146126
	DD	166886
	DD	230242576
	DD	1420292253
	DD	333772
	DD	460485152
	DD	2840584506
	DD	667544
	DD	920970305
	DD	1386201717
	DD	1335088
	DD	1841940610
	DD	2772403434
	DD	2670176
	DD	3683881221
	DD	1249839573
	DD	5340353
	DD	3072795146
	DD	2499679147
	DD	10680707
	DD	1850622997
	DD	704390999
	DD	21361414
	DD	3701245994
	DD	1408781999
	DD	42722829
	DD	3107524692
	DD	2817563999
	DD	85445659
	DD	1920082089
	DD	1340160702
	DD	170891318
	DD	3840164178
	DD	2680321405
	DD	341782637
	DD	3385361061
	DD	1065675514
	DD	683565275
	DD	2475754826
	DD	2131351028
	DD	1367130551
	DD	656542356
	DD	4262702056
	DD	2734261102
	DD	1313084713
	DD	4230436817
	DD	1173554908
	DD	2626169427
	DD	4165906339
	DD	2347109817
	DD	957371559
	DD	4036845383
	DD	399252338
	DD	1914743119
	DD	3778723471
	DD	798504676
	DD	3829486239
	DD	3262479647
	DD	1597009353
	DD	3364005183
	DD	2229991998
	DD	3194018707
	DD	2433043071
	DD	165016701
	DD	2093070119
	DD	571118846
	DD	330033402
	DD	4186140238
	DD	1142237692
	DD	660066805
	DD	4077313180
	DD	2284475384
	DD	1320133610
	DD	3859659065
	DD	273983472
	DD	2640267220
	DD	3424350834
	DD	547966945
	DD	985567145
	DD	2553734372
	DD	1095933890
	DD	1971134291
	DD	812501448
	DD	2191867780
	DD	3942268582
	DD	1625002897
	DD	88768265
	DD	3589569869
	DD	3250005794
	DD	177536531
	DD	2884172442
	DD	2205044292
	DD	355073063
	DD	1473377588
	DD	115121288
	DD	710146126
	DD	2946755177
	DD	230242576
	DD	1420292253
	DD	1598543059
	DD	460485152
	DD	2840584506
	DD	3197086118
	DD	920970305
	DD	1386201717
	DD	2099204941
	DD	1841940610
	DD	2772403434
	DD	4198409883
	DD	3683881221
	DD	1249839573
	DD	4101852471
	DD	3072795146
	DD	2499679147
	DD	3908737646
	DD	1850622997
	DD	704390999
	DD	3522507997
	DD	3701245994
	DD	1408781999
	DD	2750048699
	DD	3107524692
	DD	2817563999
	DD	1205130103
	DD	1920082089
	DD	1340160702
	DD	2410260206
	DD	3840164178
	DD	2680321405
	DD	525553116
	DD	3385361061
	DD	1065675514
	DD	1051106232
	DD	2475754826
	DD	2131351028
	DD	2102212464
	DD	656542356
	DD	4262702056
	DD	4204424928
	DD	1313084713
	DD	4230436817
	DD	4113882560
	DD	2626169427
	DD	4165906339
	DD	3932797825
	DD	957371559
	DD	4036845383
	DD	3570628355
	DD	1914743119
	DD	3778723471
	DD	2846289414
	DD	3829486239
	DD	3262479647
	DD	1397611533
	DD	3364005183
	DD	2229991998
	DD	2795223067
	DD	2433043071
	DD	165016701
	DD	1295478838
	DD	571118846
	DD	330033402
	DD	2590957677
	DD	1142237692
	DD	660066805
	DD	886948059
	DD	2284475384
	DD	1320133610
	DD	1773896118
	DD	273983472
	DD	2640267220
	DD	3547792237
	DD	547966945
	DD	985567145
	DD	2800617179
	DD	1095933890
	DD	1971134291
	DD	1306267062
	DD	2191867780
	DD	3942268582
	DD	2612534124
	DD	88768265
	DD	3589569869
	DD	930100952
	DD	177536531
	DD	2884172442
	DD	1860201905
	DD	355073063
	DD	1473377588
	DD	3720403810
	DD	710146126
	DD	2946755177
	DD	3145840325
	DD	1420292253
	DD	1598543059
	DD	1996713354
	DD	2840584506
	DD	3197086118
	DD	3993426708
	DD	1386201717
	DD	2099204941
	DD	3691886121
	DD	2772403434
	DD	4198409883
	DD	3088804946
	DD	1249839573
	DD	4101852471
	DD	1882642597
	DD	2499679147
	DD	3908737646
	DD	3765285194
	DD	704390999
	DD	3522507997
	DD	3235603093
	DD	1408781999
	DD	2750048699
	DD	2176238891
	DD	2817563999
	DD	1205130103
	DD	57510486
	DD	1340160702
	DD	2410260206
	DD	115020972
	DD	2680321405
	DD	525553116
	DD	230041945
	DD	1065675514
	DD	1051106232
	DD	460083891
	DD	2131351028
	DD	2102212464
	DD	920167782
	DD	4262702056
	DD	4204424928
	DD	1840335564
	DD	4230436817
	DD	4113882560
	DD	3680671129
	DD	4165906339
	DD	3932797825
	DD	3066374962
	DD	4036845383
	DD	3570628355
	DD	1837782628
	DD	3778723471
	DD	2846289414
	DD	3675565257
	DD	3262479647
	DD	1397611533
	DD	3056163219
	DD	2229991998
	DD	2795223067
	DD	1817359143
	DD	165016701
	DD	1295478838
	DD	3634718287
	DD	330033402
	DD	2590957677
	DD	2974469278
	DD	660066805
	DD	886948059
	DD	1653971260
	DD	1320133610
	DD	1773896118
	DD	3307942520
	DD	2640267220
	DD	3547792237
	DD	2320917745
	DD	985567145
	DD	2800617179
	DD	346868194
	DD	1971134291
	DD	1306267062
	DD	693736388
	DD	3942268582
	DD	2612534124
	DD	1387472776
	DD	3589569869
	DD	930100952
	DD	2774945552
	DD	2884172442
	DD	1860201905
	DD	1254923809
	DD	1473377588
	DD	3720403810
	DD	2509847619
	DD	2946755177
	DD	3145840325
	DD	724727943
	DD	1598543059
	DD	1996713354
	DD	1449455886
	DD	3197086118
	DD	3993426708
	DD	2898911772
	DD	2099204941
	DD	3691886121
	DD	1502856249
	DD	4198409883
	DD	3088804946
	DD	3005712498
	DD	4101852471
	DD	1882642597
	DD	1716457700
	DD	3908737646
	DD	3765285194
	DD	3432915400
	DD	3522507997
	DD	3235603093
	DD	2570863504
	DD	2750048699
	DD	2176238891
	DD	846759712
	DD	1205130103
	DD	57510486
	DD	1693519425
	DD	2410260206
	DD	115020972
	DD	3387038850
	DD	525553116
	DD	230041945
	DD	2479110404
	DD	1051106232
	DD	460083891
	DD	663253512
	DD	2102212464
	DD	920167782
	DD	1326507024
	DD	4204424928
	DD	1840335564
	DD	2653014048
	DD	4113882560
	DD	3680671129
	DD	1011060801
	DD	3932797825
	DD	3066374962
	DD	2022121603
	DD	3570628355
	DD	1837782628
	DD	4044243207
	DD	2846289414
	DD	3675565257
	DD	3793519119
	DD	1397611533
	DD	3056163219
	DD	3292070943
	DD	2795223067
	DD	1817359143
	DD	2289174591
	DD	1295478838
	DD	3634718287
	DD	283381887
	DD	2590957677
	DD	2974469278
	DD	566763775
	PUBLIC __svml_stan_ha_data_internal
__svml_stan_ha_data_internal	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1092811139
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	1036586970
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	832708968
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	633484485
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	832708608
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	708075802
	DD	2147483648
	DD	1036629468
	DD	1045147567
	DD	1050366018
	DD	1054086093
	DD	1057543609
	DD	1059786177
	DD	1062344705
	DD	1065353216
	DD	1067186156
	DD	1069519047
	DD	1072658590
	DD	1075479162
	DD	1079179983
	DD	1084284919
	DD	1092776803
	DD	4286578687
	DD	3240260451
	DD	3231768567
	DD	3226663631
	DD	3222962810
	DD	3220142238
	DD	3217002695
	DD	3214669804
	DD	3212836864
	DD	3209828353
	DD	3207269825
	DD	3205027257
	DD	3201569741
	DD	3197849666
	DD	3192631215
	DD	3184113116
	DD	2147483648
	DD	826651354
	DD	791306928
	DD	2989111746
	DD	2982175258
	DD	2992568675
	DD	850100121
	DD	850281093
	DD	0
	DD	861435400
	DD	840342808
	DD	3003924160
	DD	3016492578
	DD	865099790
	DD	856723932
	DD	3025444934
	DD	4085252096
	DD	877961286
	DD	3004207580
	DD	3012583438
	DD	869008930
	DD	856440512
	DD	2987826456
	DD	3008919048
	DD	0
	DD	2997764741
	DD	2997583769
	DD	845085027
	DD	834691610
	DD	841628098
	DD	2938790576
	DD	2974135002
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1051372198
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1040758920
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1174470656
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	1059256707
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1413742592
	DD	1073291771
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	1280075305
	DD	1032227875
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	116221458
	DD	3216541303
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	3891301393
	DD	3218831093
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	2796173298
	DD	1065608814
	DD	1070141403
	DD	3007036718
	DD	0
	DD	0
	DD	0
	DD	1065353216
	DD	0
	DD	0
	DD	1051372765
	DD	0
	DD	1069935515
	DD	853435276
	DD	0
	DD	1019812401
	DD	797871386
	DD	1065353216
	DD	975043072
	DD	1019820333
	DD	1051400329
	DD	1015569723
	DD	1069729628
	DD	2999697034
	DD	0
	DD	1028208956
	DD	816029531
	DD	1065353216
	DD	991832832
	DD	1028240852
	DD	1051479824
	DD	1023251493
	DD	1069523740
	DD	860164016
	DD	0
	DD	1033310670
	DD	827321128
	DD	1065353216
	DD	1001540608
	DD	1033364538
	DD	1051617929
	DD	1028458464
	DD	1069317853
	DD	2977958621
	DD	0
	DD	1036629468
	DD	826649990
	DD	1065353216
	DD	1008660256
	DD	1036757738
	DD	1051807326
	DD	1032162226
	DD	1069111966
	DD	3009745511
	DD	0
	DD	1039964354
	DD	2964214364
	DD	1065353216
	DD	1014578464
	DD	1040201797
	DD	1052059423
	DD	1034708638
	DD	1068906078
	DD	848017692
	DD	0
	DD	1041753444
	DD	2982519524
	DD	1065353216
	DD	1018446032
	DD	1041972480
	DD	1052374628
	DD	1037453248
	DD	1068700191
	DD	3004118141
	DD	0
	DD	1043443277
	DD	2985501265
	DD	1065353216
	DD	1022797056
	DD	1043793882
	DD	1052746889
	DD	1039915463
	DD	1068494303
	DD	857455223
	DD	0
	DD	1045147567
	DD	791292384
	DD	1065353216
	DD	1025642520
	DD	1045675728
	DD	1053195814
	DD	1041590498
	DD	1068288416
	DD	2992986704
	DD	0
	DD	1046868583
	DD	833925599
	DD	1065353216
	DD	1028557712
	DD	1047628490
	DD	1053716836
	DD	1043186017
	DD	1068082528
	DD	863082593
	DD	0
	DD	1048592340
	DD	2988940902
	DD	1065353216
	DD	1031831496
	DD	1049119700
	DD	1054310701
	DD	1044788971
	DD	1067876641
	DD	837040812
	DD	0
	DD	1049473154
	DD	2972885556
	DD	1065353216
	DD	1033689040
	DD	1050184288
	DD	1054999523
	DD	1046698028
	DD	1067670754
	DD	3006826934
	DD	0
	DD	1050366018
	DD	2989112046
	DD	1065353216
	DD	1035760784
	DD	1051302645
	DD	1055777031
	DD	1048635818
	DD	1067464866
	DD	853854846
	DD	0
	DD	1051272279
	DD	817367088
	DD	1065353216
	DD	1038057984
	DD	1052482025
	DD	1056656040
	DD	1049723582
	DD	1067258979
	DD	2999277465
	DD	0
	DD	1052193360
	DD	2986510371
	DD	1065353216
	DD	1040390392
	DD	1053730424
	DD	1057307751
	DD	1050943059
	DD	1067053091
	DD	860373800
	DD	0
	DD	1053130765
	DD	2987705281
	DD	1065353216
	DD	1041784404
	DD	1055056706
	DD	1057868403
	DD	1052298273
	DD	1066847204
	DD	2974604846
	DD	0
	DD	1054086093
	DD	2982175058
	DD	1065353216
	DD	1043312844
	DD	1056470731
	DD	1058502663
	DD	1053852727
	DD	1066641317
	DD	3009535726
	DD	0
	DD	1055061049
	DD	2985572766
	DD	1065353216
	DD	1044984860
	DD	1057474074
	DD	1059214863
	DD	1055565854
	DD	1066435429
	DD	848437261
	DD	0
	DD	1056057456
	DD	844263924
	DD	1065353216
	DD	1046810746
	DD	1058286064
	DD	1060014844
	DD	1057227928
	DD	1066229542
	DD	3003908357
	DD	0
	DD	1057020941
	DD	2987700082
	DD	1065353216
	DD	1048689044
	DD	1059160627
	DD	1060914481
	DD	1058313864
	DD	1066023654
	DD	857665008
	DD	0
	DD	1057543609
	DD	2992568718
	DD	1065353216
	DD	1049773965
	DD	1060105673
	DD	1061932376
	DD	1059565214
	DD	1065817767
	DD	2992147565
	DD	0
	DD	1058080175
	DD	854607280
	DD	1065353216
	DD	1050955490
	DD	1061130203
	DD	1063075792
	DD	1060964899
	DD	1065611879
	DD	863292377
	DD	0
	DD	1058631876
	DD	848316488
	DD	1065353216
	DD	1052241912
	DD	1062244476
	DD	1064374250
	DD	1062608877
	DD	1065405992
	DD	838719090
	DD	0
	DD	1059200055
	DD	2987155932
	DD	1065353216
	DD	1053642609
	DD	1063460266
	DD	1065596017
	DD	1064468970
	DD	1065046993
	DD	848647046
	DD	0
	DD	1059786177
	DD	850099898
	DD	1065353216
	DD	1055168194
	DD	1064791104
	DD	1066427841
	DD	1065988022
	DD	1064635218
	DD	854274415
	DD	0
	DD	1060391849
	DD	2998448362
	DD	1065353216
	DD	1056830711
	DD	1065802920
	DD	1067373883
	DD	1067237086
	DD	1064223444
	DD	2998857895
	DD	0
	DD	1061018831
	DD	852661766
	DD	1073741824
	DD	3202769007
	DD	1066608086
	DD	1068453481
	DD	1068697612
	DD	1063811669
	DD	2991727995
	DD	0
	DD	1061669068
	DD	2986407194
	DD	1073741824
	DD	3200789612
	DD	1067498217
	DD	1069688111
	DD	1070408903
	DD	1063399894
	DD	2971248290
	DD	0
	DD	1062344705
	DD	850280824
	DD	1073741824
	DD	3198626104
	DD	1068485666
	DD	1071103306
	DD	1072410651
	DD	1062988119
	DD	839209514
	DD	0
	DD	1063048126
	DD	826671880
	DD	1073741824
	DD	3196257989
	DD	1069584946
	DD	1072731698
	DD	1074256640
	DD	1062576344
	DD	848856831
	DD	0
	DD	1063781982
	DD	845614362
	DD	1073741824
	DD	3191263702
	DD	1070813191
	DD	1074178145
	DD	1075661786
	DD	1062164569
	DD	854484200
	DD	0
	DD	1064549237
	DD	855412877
	DD	1073741824
	DD	3183449264
	DD	1072190735
	DD	1075269479
	DD	1077331464
	DD	1061752795
	DD	2998648110
	DD	1065353216
	DD	3196839438
	DD	839748996
	DD	1056964608
	DD	3187152817
	DD	3179496939
	DD	1025375660
	DD	3159543663
	DD	1061341020
	DD	2991308426
	DD	1065353216
	DD	3196528703
	DD	2993207654
	DD	1056964608
	DD	3187565865
	DD	3178961235
	DD	1025040649
	DD	3158667440
	DD	1060929245
	DD	2969570013
	DD	1065353216
	DD	3196220448
	DD	839617357
	DD	1048576000
	DD	1039897640
	DD	3178234548
	DD	1024731756
	DD	3157936127
	DD	1060517470
	DD	839629084
	DD	1065353216
	DD	3195769474
	DD	2972943314
	DD	1048576000
	DD	1039520273
	DD	3177530035
	DD	1024452069
	DD	3157392148
	DD	1060105695
	DD	849066615
	DD	1065353216
	DD	3195162227
	DD	824230882
	DD	1048576000
	DD	1039159939
	DD	3176846430
	DD	1024176063
	DD	3156719803
	DD	1059693920
	DD	854693985
	DD	1065353216
	DD	3194559300
	DD	837912886
	DD	1048576000
	DD	1038816139
	DD	3176182519
	DD	1023917626
	DD	3156100775
	DD	1059282146
	DD	2998438326
	DD	1065353216
	DD	3193960492
	DD	2976936506
	DD	1048576000
	DD	1038488404
	DD	3175537158
	DD	1023672824
	DD	3155484691
	DD	1058870371
	DD	2990888857
	DD	1065353216
	DD	3193365611
	DD	837021697
	DD	1048576000
	DD	1038176293
	DD	3174909264
	DD	1023428141
	DD	3154717848
	DD	1058458596
	DD	2966216238
	DD	1065353216
	DD	3192774465
	DD	2981011604
	DD	1048576000
	DD	1037879388
	DD	3174297790
	DD	1023026096
	DD	3154246903
	DD	1058046821
	DD	840048653
	DD	1065353216
	DD	3192186872
	DD	2982847435
	DD	1048576000
	DD	1037597300
	DD	3173701765
	DD	1022609285
	DD	3153191752
	DD	1057635046
	DD	849276400
	DD	1065353216
	DD	3191602652
	DD	2972865050
	DD	1048576000
	DD	1037329660
	DD	3173120241
	DD	1022242934
	DD	3152466531
	DD	1057223271
	DD	854903769
	DD	1065353216
	DD	3191021630
	DD	838792638
	DD	1048576000
	DD	1037076124
	DD	3172552332
	DD	1021893801
	DD	3151682133
	DD	1056658385
	DD	840258438
	DD	1065353216
	DD	3190443633
	DD	2979855596
	DD	1048576000
	DD	1036836369
	DD	3171997189
	DD	1021543079
	DD	3150495127
	DD	1055834836
	DD	2990469287
	DD	1065353216
	DD	3189868496
	DD	2981611511
	DD	1048576000
	DD	1036610091
	DD	3171453986
	DD	1021220110
	DD	3149437649
	DD	1055011286
	DD	2962859682
	DD	1065353216
	DD	3189296055
	DD	2950857776
	DD	1048576000
	DD	1036397006
	DD	3170921933
	DD	1020942892
	DD	3148919762
	DD	1054187736
	DD	840468223
	DD	1065353216
	DD	3188726149
	DD	2955915960
	DD	1048576000
	DD	1036196851
	DD	3169906765
	DD	1020660679
	DD	3147905210
	DD	1053364187
	DD	2990259502
	DD	1065353216
	DD	3188158621
	DD	2978622083
	DD	1048576000
	DD	1036009378
	DD	3168882838
	DD	1020421234
	DD	3147436656
	DD	1052540637
	DD	2961181405
	DD	1065353216
	DD	3187515595
	DD	789904544
	DD	1048576000
	DD	1035834359
	DD	3167876891
	DD	1020189995
	DD	3146799430
	DD	1051717087
	DD	840678007
	DD	1065353216
	DD	3186389132
	DD	2974324164
	DD	1048576000
	DD	1035671582
	DD	3166887590
	DD	1019957287
	DD	3145677161
	DD	1050893538
	DD	2990049718
	DD	1065353216
	DD	3185266517
	DD	821445502
	DD	1048576000
	DD	1035520850
	DD	3165913616
	DD	1019751749
	DD	3143905397
	DD	1050069988
	DD	2957827630
	DD	1065353216
	DD	3184147455
	DD	823956970
	DD	1048576000
	DD	1035381982
	DD	3164953691
	DD	1019591684
	DD	3143870825
	DD	1049246438
	DD	840887792
	DD	1065353216
	DD	3183031657
	DD	2948197632
	DD	1048576000
	DD	1035254815
	DD	3164006661
	DD	1019406069
	DD	3141406886
	DD	1048269777
	DD	831869830
	DD	1065353216
	DD	3181918839
	DD	829265530
	DD	1048576000
	DD	1035139196
	DD	3163071263
	DD	1019275107
	DD	3141473894
	DD	1046622678
	DD	2954471074
	DD	1065353216
	DD	3180808717
	DD	2974758491
	DD	1048576000
	DD	1035034991
	DD	3161787608
	DD	1019131285
	DD	3139614851
	DD	1044975579
	DD	2981870894
	DD	1065353216
	DD	3179701015
	DD	2951749952
	DD	1048576000
	DD	1034942077
	DD	3159956688
	DD	1019002541
	DD	3137649644
	DD	1043328479
	DD	832289399
	DD	1065353216
	DD	3177908479
	DD	2968441398
	DD	1048576000
	DD	1034860345
	DD	3158142289
	DD	1018906717
	DD	3137336762
	DD	1041681380
	DD	2949439022
	DD	1065353216
	DD	3175701100
	DD	2963548093
	DD	1048576000
	DD	1034789701
	DD	3156342344
	DD	1018810804
	DD	3133887847
	DD	1039881169
	DD	823481222
	DD	1065353216
	DD	3173496918
	DD	2969038481
	DD	1048576000
	DD	1034730062
	DD	3154554595
	DD	1018750428
	DD	3136028910
	DD	1036586971
	DD	2973482286
	DD	1065353216
	DD	3171295395
	DD	2968300352
	DD	1048576000
	DD	1034681361
	DD	3151437839
	DD	1018664053
	DD	3123383004
	DD	1033292772
	DD	2941050414
	DD	1065353216
	DD	3167298168
	DD	808398440
	DD	1048576000
	DD	1034643540
	DD	3147899215
	DD	1018610153
	DD	943964915
	DD	1028198363
	DD	2965093678
	DD	1065353216
	DD	3162902549
	DD	2950073902
	DD	1048576000
	DD	1034616555
	DD	3143016255
	DD	1018603598
	DD	3133555092
	DD	1019809755
	DD	2956705070
	DD	1065353216
	DD	3154512883
	DD	803361198
	DD	1048576000
	DD	1034600377
	DD	3134618720
	DD	1018580133
	DD	3134056577
	DD	0
	DD	0
	DD	1065353216
	DD	0
	DD	0
	DD	1048576000
	DD	1034594987
	DD	0
	DD	1018552971
	DD	0
	DD	3167293403
	DD	809221422
	DD	1065353216
	DD	1007029235
	DD	2950844846
	DD	1048576000
	DD	1034600377
	DD	987135072
	DD	1018580133
	DD	986572929
	DD	3175682011
	DD	817610030
	DD	1065353216
	DD	1015418901
	DD	802590254
	DD	1048576000
	DD	1034616555
	DD	995532607
	DD	1018603598
	DD	986071444
	DD	3180776420
	DD	793566766
	DD	1065353216
	DD	1019814520
	DD	2955882088
	DD	1048576000
	DD	1034643540
	DD	1000415567
	DD	1018610153
	DD	3091448562
	DD	3184070619
	DD	825998638
	DD	1065353216
	DD	1023811747
	DD	820816704
	DD	1048576000
	DD	1034681361
	DD	1003954191
	DD	1018664053
	DD	975899356
	DD	3187364817
	DD	2970964870
	DD	1065353216
	DD	1026013270
	DD	821554833
	DD	1048576000
	DD	1034730062
	DD	1007070947
	DD	1018750428
	DD	988545262
	DD	3189165028
	DD	801955374
	DD	1065353216
	DD	1028217452
	DD	816064445
	DD	1048576000
	DD	1034789701
	DD	1008858696
	DD	1018810804
	DD	986404199
	DD	3190812127
	DD	2979773047
	DD	1065353216
	DD	1030424831
	DD	820957750
	DD	1048576000
	DD	1034860345
	DD	1010658641
	DD	1018906717
	DD	989853114
	DD	3192459227
	DD	834387246
	DD	1065353216
	DD	1032217367
	DD	804266304
	DD	1048576000
	DD	1034942077
	DD	1012473040
	DD	1019002541
	DD	990165996
	DD	3194106326
	DD	806987426
	DD	1065353216
	DD	1033325069
	DD	827274843
	DD	1048576000
	DD	1035034991
	DD	1014303960
	DD	1019131285
	DD	992131203
	DD	3195753425
	DD	2979353478
	DD	1065353216
	DD	1034435191
	DD	2976749178
	DD	1048576000
	DD	1035139196
	DD	1015587615
	DD	1019275107
	DD	993990246
	DD	3196730086
	DD	2988371440
	DD	1065353216
	DD	1035548009
	DD	800713984
	DD	1048576000
	DD	1035254815
	DD	1016523013
	DD	1019406069
	DD	993923238
	DD	3197553636
	DD	810343982
	DD	1065353216
	DD	1036663807
	DD	2971440618
	DD	1048576000
	DD	1035381982
	DD	1017470043
	DD	1019591684
	DD	996387177
	DD	3198377186
	DD	842566070
	DD	1065353216
	DD	1037782869
	DD	2968929150
	DD	1048576000
	DD	1035520850
	DD	1018429968
	DD	1019751749
	DD	996421749
	DD	3199200735
	DD	2988161655
	DD	1065353216
	DD	1038905484
	DD	826840516
	DD	1048576000
	DD	1035671582
	DD	1019403942
	DD	1019957287
	DD	998193513
	DD	3200024285
	DD	813697757
	DD	1065353216
	DD	1040031947
	DD	2937388192
	DD	1048576000
	DD	1035834359
	DD	1020393243
	DD	1020189995
	DD	999315782
	DD	3200847835
	DD	842775854
	DD	1065353216
	DD	1040674973
	DD	831138435
	DD	1048576000
	DD	1036009378
	DD	1021399190
	DD	1020421234
	DD	999953008
	DD	3201671384
	DD	2987951871
	DD	1065353216
	DD	1041242501
	DD	808432312
	DD	1048576000
	DD	1036196851
	DD	1022423117
	DD	1020660679
	DD	1000421562
	DD	3202494934
	DD	815376034
	DD	1065353216
	DD	1041812407
	DD	803374128
	DD	1048576000
	DD	1036397006
	DD	1023438285
	DD	1020942892
	DD	1001436114
	DD	3203318484
	DD	842985639
	DD	1065353216
	DD	1042384848
	DD	834127863
	DD	1048576000
	DD	1036610091
	DD	1023970338
	DD	1021220110
	DD	1001954001
	DD	3204142033
	DD	2987742086
	DD	1065353216
	DD	1042959985
	DD	832371948
	DD	1048576000
	DD	1036836369
	DD	1024513541
	DD	1021543079
	DD	1003011479
	DD	3204706919
	DD	3002387417
	DD	1065353216
	DD	1043537982
	DD	2986276286
	DD	1048576000
	DD	1037076124
	DD	1025068684
	DD	1021893801
	DD	1004198485
	DD	3205118694
	DD	2996760048
	DD	1065353216
	DD	1044119004
	DD	825381402
	DD	1048576000
	DD	1037329660
	DD	1025636593
	DD	1022242934
	DD	1004982883
	DD	3205530469
	DD	2987532301
	DD	1065353216
	DD	1044703224
	DD	835363787
	DD	1048576000
	DD	1037597300
	DD	1026218117
	DD	1022609285
	DD	1005708104
	DD	3205942244
	DD	818732590
	DD	1065353216
	DD	1045290817
	DD	833527956
	DD	1048576000
	DD	1037879388
	DD	1026814142
	DD	1023026096
	DD	1006763255
	DD	3206354019
	DD	843405209
	DD	1065353216
	DD	1045881963
	DD	2984505345
	DD	1048576000
	DD	1038176293
	DD	1027425616
	DD	1023428141
	DD	1007234200
	DD	3206765794
	DD	850954678
	DD	1065353216
	DD	1046476844
	DD	829452858
	DD	1048576000
	DD	1038488404
	DD	1028053510
	DD	1023672824
	DD	1008001043
	DD	3207177568
	DD	3002177633
	DD	1065353216
	DD	1047075652
	DD	2985396534
	DD	1048576000
	DD	1038816139
	DD	1028698871
	DD	1023917626
	DD	1008617127
	DD	3207589343
	DD	2996550263
	DD	1065353216
	DD	1047678579
	DD	2971714530
	DD	1048576000
	DD	1039159939
	DD	1029362782
	DD	1024176063
	DD	1009236155
	DD	3208001118
	DD	2987112732
	DD	1065353216
	DD	1048285826
	DD	825459666
	DD	1048576000
	DD	1039520273
	DD	1030046387
	DD	1024452069
	DD	1009908500
	DD	3208412893
	DD	822086365
	DD	1065353216
	DD	1048736800
	DD	2987101005
	DD	1048576000
	DD	1039897640
	DD	1030750900
	DD	1024731756
	DD	1010452479
	DD	3208824668
	DD	843824778
	DD	1065353216
	DD	1049045055
	DD	845724006
	DD	1056964608
	DD	3187565865
	DD	1031477587
	DD	1025040649
	DD	1011183792
	DD	3209236443
	DD	851164462
	DD	0
	DD	3212836864
	DD	725680128
	DD	1073741824
	DD	3003121664
	DD	3221225472
	DD	1076541384
	DD	3226821083
	DD	3209648217
	DD	3001967848
	DD	0
	DD	3212032885
	DD	3002896525
	DD	1073741824
	DD	3183449264
	DD	3219674383
	DD	1075269479
	DD	3224815112
	DD	3210059992
	DD	2996340479
	DD	0
	DD	3211265630
	DD	2993098010
	DD	1073741824
	DD	3191263702
	DD	3218296839
	DD	1074178145
	DD	3223145434
	DD	3210471767
	DD	2986693162
	DD	0
	DD	3210531774
	DD	2974155528
	DD	1073741824
	DD	3196257989
	DD	3217068594
	DD	1072731698
	DD	3221740288
	DD	3210883542
	DD	823764642
	DD	0
	DD	3209828353
	DD	2997764472
	DD	1073741824
	DD	3198626104
	DD	3215969314
	DD	1071103306
	DD	3219894299
	DD	3211295317
	DD	844244347
	DD	0
	DD	3209152716
	DD	838923546
	DD	1073741824
	DD	3200789612
	DD	3214981865
	DD	1069688111
	DD	3217892551
	DD	3211707092
	DD	851374247
	DD	0
	DD	3208502479
	DD	3000145414
	DD	1073741824
	DD	3202769007
	DD	3214091734
	DD	1068453481
	DD	3216181260
	DD	3212118866
	DD	3001758063
	DD	0
	DD	3207875497
	DD	850964714
	DD	1065353216
	DD	1056830711
	DD	3213286568
	DD	1067373883
	DD	3214720734
	DD	3212530641
	DD	2996130694
	DD	0
	DD	3207269825
	DD	2997583546
	DD	1065353216
	DD	1055168194
	DD	3212274752
	DD	1066427841
	DD	3213471670
	DD	3212889640
	DD	2986202738
	DD	0
	DD	3206683703
	DD	839672284
	DD	1065353216
	DD	1053642609
	DD	3210943914
	DD	1065596017
	DD	3211952618
	DD	3213095527
	DD	3010776025
	DD	0
	DD	3206115524
	DD	2995800136
	DD	1065353216
	DD	1052241912
	DD	3209728124
	DD	1064374250
	DD	3210092525
	DD	3213301415
	DD	844663917
	DD	0
	DD	3205563823
	DD	3002090928
	DD	1065353216
	DD	1050955490
	DD	3208613851
	DD	1063075792
	DD	3208448547
	DD	3213507302
	DD	3005148656
	DD	0
	DD	3205027257
	DD	845085070
	DD	1065353216
	DD	1049773965
	DD	3207589321
	DD	1061932376
	DD	3207048862
	DD	3213713190
	DD	856424709
	DD	0
	DD	3204504589
	DD	840216434
	DD	1065353216
	DD	1048689044
	DD	3206644275
	DD	1060914481
	DD	3205797512
	DD	3213919077
	DD	2995920909
	DD	0
	DD	3203541104
	DD	2991747572
	DD	1065353216
	DD	1046810746
	DD	3205769712
	DD	1060014844
	DD	3204711576
	DD	3214124965
	DD	862052078
	DD	0
	DD	3202544697
	DD	838089118
	DD	1065353216
	DD	1044984860
	DD	3204957722
	DD	1059214863
	DD	3203049502
	DD	3214330852
	DD	827121198
	DD	0
	DD	3201569741
	DD	834691410
	DD	1065353216
	DD	1043312844
	DD	3203954379
	DD	1058502663
	DD	3201336375
	DD	3214536739
	DD	3007857448
	DD	0
	DD	3200614413
	DD	840221633
	DD	1065353216
	DD	1041784404
	DD	3202540354
	DD	1057868403
	DD	3199781921
	DD	3214742627
	DD	851793817
	DD	0
	DD	3199677008
	DD	839026723
	DD	1065353216
	DD	1040390392
	DD	3201214072
	DD	1057307751
	DD	3198426707
	DD	3214948514
	DD	3001338494
	DD	0
	DD	3198755927
	DD	2964850736
	DD	1065353216
	DD	1038057984
	DD	3199965673
	DD	1056656040
	DD	3197207230
	DD	3215154402
	DD	859343286
	DD	0
	DD	3197849666
	DD	841628398
	DD	1065353216
	DD	1035760784
	DD	3198786293
	DD	1055777031
	DD	3196119466
	DD	3215360289
	DD	2984524460
	DD	0
	DD	3196956802
	DD	825401908
	DD	1065353216
	DD	1033689040
	DD	3197667936
	DD	1054999523
	DD	3194181676
	DD	3215566176
	DD	3010566241
	DD	0
	DD	3196075988
	DD	841457254
	DD	1065353216
	DD	1031831496
	DD	3196603348
	DD	1054310701
	DD	3192272619
	DD	3215772064
	DD	845503056
	DD	0
	DD	3194352231
	DD	2981409247
	DD	1065353216
	DD	1028557712
	DD	3195112138
	DD	1053716836
	DD	3190669665
	DD	3215977951
	DD	3004938871
	DD	0
	DD	3192631215
	DD	2938776032
	DD	1065353216
	DD	1025642520
	DD	3193159376
	DD	1053195814
	DD	3189074146
	DD	3216183839
	DD	856634493
	DD	0
	DD	3190926925
	DD	838017617
	DD	1065353216
	DD	1022797056
	DD	3191277530
	DD	1052746889
	DD	3187399111
	DD	3216389726
	DD	2995501340
	DD	0
	DD	3189237092
	DD	835035876
	DD	1065353216
	DD	1018446032
	DD	3189456128
	DD	1052374628
	DD	3184936896
	DD	3216595614
	DD	862261863
	DD	0
	DD	3187448002
	DD	816730716
	DD	1065353216
	DD	1014578464
	DD	3187685445
	DD	1052059423
	DD	3182192286
	DD	3216801501
	DD	830474973
	DD	0
	DD	3184113116
	DD	2974133638
	DD	1065353216
	DD	1008660256
	DD	3184241386
	DD	1051807326
	DD	3179645874
	DD	3217007388
	DD	3007647664
	DD	0
	DD	3180794318
	DD	2974804776
	DD	1065353216
	DD	1001540608
	DD	3180848186
	DD	1051617929
	DD	3175942112
	DD	3217213276
	DD	852213386
	DD	0
	DD	3175692604
	DD	2963513179
	DD	1065353216
	DD	991832832
	DD	3175724500
	DD	1051479824
	DD	3170735141
	DD	3217419163
	DD	3000918924
	DD	0
	DD	3167296049
	DD	2945355034
	DD	1065353216
	DD	975043072
	DD	3167303981
	DD	1051400329
	DD	3163053371
_2il0floatpacket_36	DD	07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_37	DD	080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_38	DD	047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H
_2il0floatpacket_39	DD	040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH
_2il0floatpacket_40	DD	040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H
_2il0floatpacket_41	DD	0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH
_2il0floatpacket_42	DD	0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H
_2il0floatpacket_43	DD	07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH
_2il0floatpacket_44	DD	035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H
_2il0floatpacket_59	DD	07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_60	DD	0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH
_2il0floatpacket_61	DD	000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H
_2il0floatpacket_62	DD	00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH
_2il0floatpacket_63	DD	080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_64	DD	03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H
_2il0floatpacket_65	DD	0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH
_2il0floatpacket_66	DD	028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H
_2il0floatpacket_67	DD	00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH
_2il0floatpacket_68	DD	034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H
_2il0floatpacket_69	DD	0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH
_2il0floatpacket_70	DD	0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH
_2il0floatpacket_71	DD	000000002H,000000002H,000000002H,000000002H,000000002H,000000002H,000000002H,000000002H
_2il0floatpacket_72	DD	03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH
_2il0floatpacket_73	DD	0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH
_2il0floatpacket_74	DD	00000007cH,00000007cH,00000007cH,00000007cH,00000007cH,00000007cH,00000007cH,00000007cH
_2il0floatpacket_26	DD	0ffffffffH,000000000H,0ffffffffH,000000000H
_2il0floatpacket_27	DD	07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_28	DD	080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_29	DD	047400000H,047400000H,047400000H,047400000H
_2il0floatpacket_30	DD	040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH
_2il0floatpacket_31	DD	040c91000H,040c91000H,040c91000H,040c91000H
_2il0floatpacket_32	DD	0b795777aH,0b795777aH,0b795777aH,0b795777aH
_2il0floatpacket_33	DD	0fffff000H,0fffff000H,0fffff000H,0fffff000H
_2il0floatpacket_34	DD	07fffffffH,07fffffffH,07fffffffH,07fffffffH
_2il0floatpacket_35	DD	035800000H,035800000H,035800000H,035800000H
_2il0floatpacket_45	DD	0007fffffH,0007fffffH,0007fffffH,0007fffffH
_2il0floatpacket_46	DD	000800000H,000800000H,000800000H,000800000H
_2il0floatpacket_47	DD	00000ffffH,00000ffffH,00000ffffH,00000ffffH
_2il0floatpacket_48	DD	03f800000H,03f800000H,03f800000H,03f800000H
_2il0floatpacket_49	DD	0000000ffH,0000000ffH,0000000ffH,0000000ffH
_2il0floatpacket_50	DD	028800000H,028800000H,028800000H,028800000H
_2il0floatpacket_51	DD	00003ffffH,00003ffffH,00003ffffH,00003ffffH
_2il0floatpacket_52	DD	034000000H,034000000H,034000000H,034000000H
_2il0floatpacket_53	DD	0000001ffH,0000001ffH,0000001ffH,0000001ffH
_2il0floatpacket_54	DD	0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH
_2il0floatpacket_55	DD	000000002H,000000002H,000000002H,000000002H
_2il0floatpacket_56	DD	03cc90fdbH,03cc90fdbH,03cc90fdbH,03cc90fdbH
_2il0floatpacket_57	DD	0b03bbd2eH,0b03bbd2eH,0b03bbd2eH,0b03bbd2eH
_2il0floatpacket_58	DD	00000007cH,00000007cH,00000007cH,00000007cH
_vmlsTanHATab	DD	0
	DD	2139095040
_RDATA	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS
EXTRN	__ImageBase:PROC
EXTRN	_fltused:BYTE
	ENDIF
	END