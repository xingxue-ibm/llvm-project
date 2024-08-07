// RUN: not %clang_cc1 -triple aarch64-unknown-windows-msvc %s -emit-llvm \
// RUN:   -o - 2>&1 | FileCheck %s

template<typename T> struct S {};

// CHECK: cannot mangle this built-in type: __SVInt8_t yet
void f1(S<__SVInt8_t>) {}
