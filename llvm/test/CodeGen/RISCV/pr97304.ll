; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -mtriple=riscv64 -verify-machineinstrs -stop-after=finalize-isel | FileCheck %s

define i32 @_ZNK2cv12LMSolverImpl3runERKNS_17_InputOutputArrayE(i1 %cmp436) {
  ; CHECK-LABEL: name: _ZNK2cv12LMSolverImpl3runERKNS_17_InputOutputArrayE
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT:   liveins: $x10
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gpr = COPY $x10
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gpr = COPY [[COPY]]
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.for.cond:
  ; CHECK-NEXT:   successors: %bb.2(0x40000000), %bb.3(0x40000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[ANDI:%[0-9]+]]:gpr = ANDI [[COPY1]], 1
  ; CHECK-NEXT:   ADJCALLSTACKDOWN 8, 0, implicit-def dead $x2, implicit $x2
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gpr = COPY $x2
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:gprjalr = COPY $x0
  ; CHECK-NEXT:   SD [[COPY3]], [[COPY2]], 0 :: (store (s64) into stack)
  ; CHECK-NEXT:   [[ADDI:%[0-9]+]]:gpr = ADDI $x0, 1
  ; CHECK-NEXT:   [[ADDI1:%[0-9]+]]:gpr = ADDI $x0, 32
  ; CHECK-NEXT:   BNE [[ANDI]], $x0, %bb.3
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.for.cond (call-frame-size 8):
  ; CHECK-NEXT:   successors: %bb.3(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.3.for.cond (call-frame-size 8):
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gpr = PHI [[ADDI1]], %bb.1, [[ADDI]], %bb.2
  ; CHECK-NEXT:   $x10 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x11 = COPY [[PHI]]
  ; CHECK-NEXT:   $x12 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x13 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x14 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x15 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x16 = COPY [[COPY3]]
  ; CHECK-NEXT:   $x17 = COPY [[COPY3]]
  ; CHECK-NEXT:   PseudoCALLIndirect [[COPY3]], csr_ilp32_lp64, implicit-def dead $x1, implicit $x10, implicit $x11, implicit $x12, implicit $x13, implicit $x14, implicit $x15, implicit $x16, implicit $x17, implicit-def $x2, implicit-def $x10
  ; CHECK-NEXT:   ADJCALLSTACKUP 8, 0, implicit-def dead $x2, implicit $x2
  ; CHECK-NEXT:   [[COPY4:%[0-9]+]]:gpr = COPY $x10
  ; CHECK-NEXT:   PseudoBR %bb.1
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %conv = select i1 %cmp436, i32 32, i32 1
  %call479 = call i32 (ptr, ...) null(ptr null, i32 %conv, i32 0, i32 0, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  br label %for.cond
}
