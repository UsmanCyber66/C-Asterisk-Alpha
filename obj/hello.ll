; ModuleID = "cstar_module"
target triple = "x86_64-pc-windows-msvc"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare double @"exp"(double %".1")

declare double* @"load_csv_native"(i8* %".1", i32 %".2")

declare i8* @"malloc"(i32 %".1")

declare double @"sqrt"(double %".1")

declare double @"log"(double %".1")

declare double @"pow"(double %".1", double %".2")

declare i32 @"strlen"(i8* %".1")

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"strcmp"(i8* %".1", i8* %".2")

define i32 @"main"()
{
entry:
  %".2" = getelementptr [14 x i8], [14 x i8]* @"str_12", i32 0, i32 0
  %".3" = getelementptr [4 x i8], [4 x i8]* @"fmt_13", i32 0, i32 0
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  ret i32 0
}

@"str_12" = constant [14 x i8] c"Hello \22W\22orld\00"
@"fmt_13" = constant [4 x i8] c"%s\0a\00"