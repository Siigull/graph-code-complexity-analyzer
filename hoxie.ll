; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx26.0.0"

%struct.stack_item = type { i32, i32 }
%struct.code_list = type { ptr, ptr }
%struct.String = type { ptr, i64, i64 }
%struct.args = type { i32, ptr, ptr, ptr, i32, ptr }
%struct.item_var = type { ptr, ptr, i8 }
%struct.Variable = type { ptr, i32, ptr, i8, i8, i8, i8 }
%struct.TrackValues = type { i32, i32, i8, i8, i32, ptr, %struct.args, i8, ptr, ptr }
%struct.Function = type { ptr, i8, i32, ptr, i32, ptr, i32, i8, i8 }
%struct.ast = type { i32, %struct.Token, ptr, ptr }
%struct.Token = type { i32, ptr }
%struct.ast_stack = type { [512 x ptr], i32 }
%struct.Stack = type { [256 x %struct.stack_item], i32 }
%struct.Exp_numbers_stack = type { ptr, i32 }
%struct.SymtStack = type { [127 x ptr], i32 }
%struct.s_global = type { i32, i32, ptr }

@.str = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"string\00", align 1
@VariableType = global [3 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2], align 8
@.str.3 = private unnamed_addr constant [5 x i8] c"MOVE\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"CREATEFRAME\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"PUSHFRAME\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"POPFRAME\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"DEFVAR\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"CALL\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"PUSHS\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"POPS\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"CLEARS\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"ADD\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"SUB\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"MUL\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"DIV\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"IDIV\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"ADDS\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"SUBS\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"MULS\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"DIVS\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"IDIVS\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"LT\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"GT\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"EQ\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"LTS\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"GTS\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"EQS\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"AND\00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"OR\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"NOT\00", align 1
@.str.32 = private unnamed_addr constant [5 x i8] c"ANDS\00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c"ORS\00", align 1
@.str.34 = private unnamed_addr constant [5 x i8] c"NOTS\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"INT2FLOAT\00", align 1
@.str.36 = private unnamed_addr constant [10 x i8] c"FLOAT2INT\00", align 1
@.str.37 = private unnamed_addr constant [9 x i8] c"INT2CHAR\00", align 1
@.str.38 = private unnamed_addr constant [9 x i8] c"STRI2INT\00", align 1
@.str.39 = private unnamed_addr constant [11 x i8] c"INT2FLOATS\00", align 1
@.str.40 = private unnamed_addr constant [11 x i8] c"FLOAT2INTS\00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c"INT2CHARS\00", align 1
@.str.42 = private unnamed_addr constant [10 x i8] c"STRI2INTS\00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"READ\00", align 1
@.str.44 = private unnamed_addr constant [6 x i8] c"WRITE\00", align 1
@.str.45 = private unnamed_addr constant [7 x i8] c"CONCAT\00", align 1
@.str.46 = private unnamed_addr constant [7 x i8] c"STRLEN\00", align 1
@.str.47 = private unnamed_addr constant [8 x i8] c"GETCHAR\00", align 1
@.str.48 = private unnamed_addr constant [8 x i8] c"SETCHAR\00", align 1
@.str.49 = private unnamed_addr constant [5 x i8] c"TYPE\00", align 1
@.str.50 = private unnamed_addr constant [6 x i8] c"LABEL\00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c"JUMP\00", align 1
@.str.52 = private unnamed_addr constant [9 x i8] c"JUMPIFEQ\00", align 1
@.str.53 = private unnamed_addr constant [10 x i8] c"JUMPIFNEQ\00", align 1
@.str.54 = private unnamed_addr constant [10 x i8] c"JUMPIFEQS\00", align 1
@.str.55 = private unnamed_addr constant [11 x i8] c"JUMPIFNEQS\00", align 1
@.str.56 = private unnamed_addr constant [5 x i8] c"EXIT\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"BREAK\00", align 1
@.str.58 = private unnamed_addr constant [7 x i8] c"DPRINT\00", align 1
@CmdT = global [56 x ptr] [ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11, ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17, ptr @.str.18, ptr @.str.19, ptr @.str.20, ptr @.str.21, ptr @.str.22, ptr @.str.23, ptr @.str.24, ptr @.str.25, ptr @.str.26, ptr @.str.27, ptr @.str.28, ptr @.str.29, ptr @.str.30, ptr @.str.31, ptr @.str.32, ptr @.str.33, ptr @.str.34, ptr @.str.35, ptr @.str.36, ptr @.str.37, ptr @.str.38, ptr @.str.39, ptr @.str.40, ptr @.str.41, ptr @.str.42, ptr @.str.43, ptr @.str.44, ptr @.str.45, ptr @.str.46, ptr @.str.47, ptr @.str.48, ptr @.str.49, ptr @.str.50, ptr @.str.51, ptr @.str.52, ptr @.str.53, ptr @.str.54, ptr @.str.55, ptr @.str.56, ptr @.str.57, ptr @.str.58], align 8
@.str.59 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.60 = private unnamed_addr constant [6 x i8] c"MOVE \00", align 1
@.str.61 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.62 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.63 = private unnamed_addr constant [8 x i8] c"DEFVAR \00", align 1
@.str.64 = private unnamed_addr constant [6 x i8] c"CALL \00", align 1
@.str.65 = private unnamed_addr constant [8 x i8] c"RETURN\0A\00", align 1
@.str.66 = private unnamed_addr constant [7 x i8] c"PUSHS \00", align 1
@.str.67 = private unnamed_addr constant [6 x i8] c"POPS \00", align 1
@.str.68 = private unnamed_addr constant [8 x i8] c"CLEARS\0A\00", align 1
@.str.69 = private unnamed_addr constant [5 x i8] c"NOT \00", align 1
@.str.70 = private unnamed_addr constant [10 x i8] c"STRI2INT \00", align 1
@.str.71 = private unnamed_addr constant [12 x i8] c"INT2FLOATS \00", align 1
@.str.72 = private unnamed_addr constant [12 x i8] c"FLOAT2INTS \00", align 1
@.str.73 = private unnamed_addr constant [11 x i8] c"INT2CHARS \00", align 1
@.str.74 = private unnamed_addr constant [11 x i8] c"STRI2INTS \00", align 1
@.str.75 = private unnamed_addr constant [6 x i8] c"READ \00", align 1
@.str.76 = private unnamed_addr constant [7 x i8] c"WRITE \00", align 1
@.str.77 = private unnamed_addr constant [8 x i8] c"CONCAT \00", align 1
@.str.78 = private unnamed_addr constant [8 x i8] c"STRLEN \00", align 1
@.str.79 = private unnamed_addr constant [9 x i8] c"GETCHAR \00", align 1
@.str.80 = private unnamed_addr constant [9 x i8] c"SETCHAR \00", align 1
@.str.81 = private unnamed_addr constant [6 x i8] c"TYPE \00", align 1
@.str.82 = private unnamed_addr constant [10 x i8] c"JUMPIFEQ \00", align 1
@.str.83 = private unnamed_addr constant [11 x i8] c"JUMPIFNEQ \00", align 1
@.str.84 = private unnamed_addr constant [11 x i8] c"JUMPIFEQS \00", align 1
@.str.85 = private unnamed_addr constant [12 x i8] c"JUMPIFNEQS \00", align 1
@.str.86 = private unnamed_addr constant [6 x i8] c"EXIT \00", align 1
@.str.87 = private unnamed_addr constant [7 x i8] c"BREAK\0A\00", align 1
@.str.88 = private unnamed_addr constant [8 x i8] c"DPRINT \00", align 1
@.str.89 = private unnamed_addr constant [42 x i8] c"\1B[38;5;214mDEBUG: Unknown command %d\1B[0m\0A\00", align 1
@cnt = global i32 0, align 4
@.str.90 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.91 = private unnamed_addr constant [63 x i8] c"\1B[38;5;214mDEBUG: undef var '%s' in LF - trying to define\1B[0m\0A\00", align 1
@.str.92 = private unnamed_addr constant [35 x i8] c"\1B[38;5;214mDEBUG: var is NULL\1B[0m\0A\00", align 1
@.str.93 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@.str.94 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.95 = private unnamed_addr constant [8 x i8] c"string@\00", align 1
@.str.96 = private unnamed_addr constant [5 x i8] c"\\010\00", align 1
@.str.97 = private unnamed_addr constant [6 x i8] c"\\%03d\00", align 1
@.str.98 = private unnamed_addr constant [5 x i8] c"int@\00", align 1
@.str.99 = private unnamed_addr constant [7 x i8] c"float@\00", align 1
@.str.100 = private unnamed_addr constant [47 x i8] c"\1B[38;5;214mDEBUG: converting %s to float@\1B[0m\0A\00", align 1
@.str.101 = private unnamed_addr constant [3 x i8] c"%a\00", align 1
@.str.102 = private unnamed_addr constant [39 x i8] c"\1B[38;5;214mDEBUG: Unknown type %d\1B[0m\0A\00", align 1
@.str.103 = private unnamed_addr constant [10 x i8] c"No error\0A\00", align 1
@.str.1.104 = private unnamed_addr constant [15 x i8] c"Lexical error\0A\00", align 1
@.str.2.105 = private unnamed_addr constant [14 x i8] c"Syntax error\0A\00", align 1
@.str.3.106 = private unnamed_addr constant [48 x i8] c"Semantic error: Undefined function or variable\0A\00", align 1
@.str.4.107 = private unnamed_addr constant [52 x i8] c"Semantic error: Wrong number or type of parameters\0A\00", align 1
@.str.5.108 = private unnamed_addr constant [54 x i8] c"Semantic error: Redefinition of variable or function\0A\00", align 1
@.str.6.109 = private unnamed_addr constant [62 x i8] c"Semantic error: Missing/extra expression in return statement\0A\00", align 1
@.str.7.110 = private unnamed_addr constant [42 x i8] c"Semantic error: Type compatibility error\0A\00", align 1
@.str.8.111 = private unnamed_addr constant [38 x i8] c"Semantic error: Type deduction error\0A\00", align 1
@.str.9.112 = private unnamed_addr constant [33 x i8] c"Semantic error: Unused variable\0A\00", align 1
@.str.10.113 = private unnamed_addr constant [29 x i8] c"Semantic error: Other error\0A\00", align 1
@.str.11.114 = private unnamed_addr constant [16 x i8] c"Internal error\0A\00", align 1
@.str.12.115 = private unnamed_addr constant [15 x i8] c"Unknown error\0A\00", align 1
@.str.116 = private unnamed_addr constant [40 x i8] c"\1B[38;5;214mDEBUG: searching for %s\1B[0m\0A\00", align 1
@.str.1.117 = private unnamed_addr constant [45 x i8] c"\1B[38;5;214mDEBUG: Function %s not found\1B[0m\0A\00", align 1
@.str.2.118 = private unnamed_addr constant [41 x i8] c"\1B[38;5;214mDEBUG: [%s] used == true\1B[0m\0A\00", align 1
@.str.3.119 = private unnamed_addr constant [45 x i8] c"\1B[38;5;214mDEBUG: Variable %s not found\1B[0m\0A\00", align 1
@.str.4.120 = private unnamed_addr constant [50 x i8] c"\1B[38;5;214mDEBUG: [detected] IFJ function %s\1B[0m\0A\00", align 1
@.str.5.121 = private unnamed_addr constant [34 x i8] c"\1B[38;5;214mDEBUG: [?] ifj %s\1B[0m\0A\00", align 1
@.str.6.122 = private unnamed_addr constant [41 x i8] c"\1B[38;5;214mDEBUG: %s wasnt in local\1B[0m\0A\00", align 1
@.str.7.123 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.8.124 = private unnamed_addr constant [31 x i8] c"\1B[38;5;214mDEBUG: type %s\1B[0m\0A\00", align 1
@.str.9.125 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.10.126 = private unnamed_addr constant [3 x i8] c"TF\00", align 1
@.str.11.127 = private unnamed_addr constant [4 x i8] c"ptr\00", align 1
@.str.12.128 = private unnamed_addr constant [5 x i8] c"len1\00", align 1
@.str.13.129 = private unnamed_addr constant [5 x i8] c"len2\00", align 1
@.str.14.130 = private unnamed_addr constant [6 x i8] c"char1\00", align 1
@.str.15.131 = private unnamed_addr constant [6 x i8] c"char2\00", align 1
@.str.16.132 = private unnamed_addr constant [7 x i8] c"cmpres\00", align 1
@.str.17.133 = private unnamed_addr constant [4 x i8] c"end\00", align 1
@.str.18.134 = private unnamed_addr constant [5 x i8] c"loop\00", align 1
@.str.19.135 = private unnamed_addr constant [3 x i8] c"eq\00", align 1
@.str.20.136 = private unnamed_addr constant [5 x i8] c"less\00", align 1
@.str.21.137 = private unnamed_addr constant [5 x i8] c"more\00", align 1
@.str.22.138 = private unnamed_addr constant [10 x i8] c"bool@true\00", align 1
@.str.23.139 = private unnamed_addr constant [3 x i8] c"-1\00", align 1
@.str.24.140 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.25.141 = private unnamed_addr constant [8 x i8] c"nil@nil\00", align 1
@.str.26.142 = private unnamed_addr constant [6 x i8] c"start\00", align 1
@.str.27.143 = private unnamed_addr constant [8 x i8] c"str_len\00", align 1
@.str.28.144 = private unnamed_addr constant [5 x i8] c"curr\00", align 1
@.str.29.145 = private unnamed_addr constant [4 x i8] c"err\00", align 1
@.str.30.146 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@.str.31.147 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.32.148 = private unnamed_addr constant [35 x i8] c"\1B[38;5;214mDEBUG: type was %s\1B[0m\0A\00", align 1
@.str.33.149 = private unnamed_addr constant [37 x i8] c"\1B[38;5;214mDEBUG: idType was %d\1B[0m\0A\00", align 1
@.str.34.150 = private unnamed_addr constant [46 x i8] c"\1B[38;5;214mDEBUG: idType for arg1 was %d\1B[0m\0A\00", align 1
@.str.35.151 = private unnamed_addr constant [40 x i8] c"\1B[38;5;214mDEBUG: not ifj function\1B[0m\0A\00", align 1
@.str.36.152 = private unnamed_addr constant [37 x i8] c"\1B[38;5;214mDEBUG: evaluating %s\1B[0m\0A\00", align 1
@.str.37.153 = private unnamed_addr constant [7 x i8] c"LF@tmp\00", align 1
@.str.38.154 = private unnamed_addr constant [52 x i8] c"\1B[38;5;214mDEBUG: [return converted to f64] %s\1B[0m\0A\00", align 1
@.str.39.155 = private unnamed_addr constant [36 x i8] c"\1B[38;5;214mDEBUG: stack add %s\1B[0m\0A\00", align 1
@.str.40.156 = private unnamed_addr constant [62 x i8] c"\1B[38;5;214mDEBUG: [convert was set to TRUE by parser] %s\1B[0m\0A\00", align 1
@.str.41.157 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.42.158 = private unnamed_addr constant [43 x i8] c"\1B[38;5;214mDEBUG: T_ID '%s' not found\1B[0m\0A\00", align 1
@.str.43.159 = private unnamed_addr constant [78 x i8] c"\1B[38;5;214mDEBUG: ERROR: Cannot use a nullable variable in an expression\1B[0m\0A\00", align 1
@.str.44.160 = private unnamed_addr constant [49 x i8] c"\1B[38;5;214mDEBUG: T_ID '%s' found in global\1B[0m\0A\00", align 1
@.str.45.161 = private unnamed_addr constant [31 x i8] c"\1B[38;5;214mDEBUG: throw _\1B[0m\0A\00", align 1
@.str.46.162 = private unnamed_addr constant [40 x i8] c"\1B[38;5;214mDEBUG: not_defined type\1B[0m\0A\00", align 1
@.str.47.163 = private unnamed_addr constant [39 x i8] c"\1B[38;5;214mDEBUG: Unknown type %d\1B[0m\0A\00", align 1
@.str.48.164 = private unnamed_addr constant [28 x i8] c"\1B[38;5;214mDEBUG: ADDS\1B[0m\0A\00", align 1
@.str.49.165 = private unnamed_addr constant [28 x i8] c"\1B[38;5;214mDEBUG: SUBS\1B[0m\0A\00", align 1
@.str.50.166 = private unnamed_addr constant [28 x i8] c"\1B[38;5;214mDEBUG: MULS\1B[0m\0A\00", align 1
@.str.51.167 = private unnamed_addr constant [28 x i8] c"\1B[38;5;214mDEBUG: DIVS\1B[0m\0A\00", align 1
@.str.52.168 = private unnamed_addr constant [27 x i8] c"\1B[38;5;214mDEBUG: EQS\1B[0m\0A\00", align 1
@.str.53.169 = private unnamed_addr constant [32 x i8] c"\1B[38;5;214mDEBUG: EQS\0ANOTS\1B[0m\0A\00", align 1
@.str.54.170 = private unnamed_addr constant [27 x i8] c"\1B[38;5;214mDEBUG: LTS\1B[0m\0A\00", align 1
@.str.55.171 = private unnamed_addr constant [27 x i8] c"\1B[38;5;214mDEBUG: GTS\1B[0m\0A\00", align 1
@.str.56.172 = private unnamed_addr constant [26 x i8] c"\1B[38;5;214mDEBUG: <=\1B[0m\0A\00", align 1
@.str.57.173 = private unnamed_addr constant [26 x i8] c"\1B[38;5;214mDEBUG: >=\1B[0m\0A\00", align 1
@.str.58.174 = private unnamed_addr constant [40 x i8] c"\1B[38;5;214mDEBUG: Unknown token %s\1B[0m\0A\00", align 1
@.str.59.175 = private unnamed_addr constant [3 x i8] c"GF\00", align 1
@.str.60.176 = private unnamed_addr constant [55 x i8] c"\1B[38;5;214mDEBUG: missing params in eval function\1B[0m\0A\00", align 1
@.str.61.177 = private unnamed_addr constant [49 x i8] c"\1B[38;5;214mDEBUG: wrong number of arguments\1B[0m\0A\00", align 1
@.str.62.178 = private unnamed_addr constant [46 x i8] c"\1B[38;5;214mDEBUG: required %d != used %d\1B[0m\0A\00", align 1
@.str.63.179 = private unnamed_addr constant [38 x i8] c"\1B[38;5;214mDEBUG: args ok, %d %d\1B[0m\0A\00", align 1
@.str.64.180 = private unnamed_addr constant [3 x i8] c"__\00", align 1
@.str.181 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.1.182 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.2.183 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str.3.184 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.4.185 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.5.186 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.6.187 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.7.188 = private unnamed_addr constant [3 x i8] c"id\00", align 1
@.str.8.189 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@.str.9.190 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.10.191 = private unnamed_addr constant [6 x i8] c"shift\00", align 1
@.str.11.192 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@terminal_to_string = global [12 x ptr] [ptr @.str.181, ptr @.str.1.182, ptr @.str.2.183, ptr @.str.3.184, ptr @.str.4.185, ptr @.str.5.186, ptr @.str.6.187, ptr @.str.7.188, ptr @.str.8.189, ptr @.str.9.190, ptr @.str.10.191, ptr @.str.11.192], align 8
@precedence_table = constant <{ <{ [8 x i32], [11 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [10 x i32], [9 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [8 x i32], [11 x i32] }>, <{ [10 x i32], [9 x i32] }>, <{ [9 x i32], [10 x i32] }>, [9 x [19 x i32]] }> <{ <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], [11 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], [11 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 1, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], [11 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 1, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], [11 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 1, i32 1, i32 1, i32 1, i32 3, i32 1, i32 0, i32 1], [11 x i32] zeroinitializer }>, <{ [10 x i32], [9 x i32] }> <{ [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2, i32 1, i32 3, i32 1], [9 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 3, i32 0, i32 3], [11 x i32] zeroinitializer }>, <{ [8 x i32], [11 x i32] }> <{ [8 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 3], [11 x i32] zeroinitializer }>, <{ [10 x i32], [9 x i32] }> <{ [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 3, i32 1, i32 4, i32 3], [9 x i32] zeroinitializer }>, <{ [9 x i32], [10 x i32] }> <{ [9 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 3], [10 x i32] zeroinitializer }>, [9 x [19 x i32]] zeroinitializer }>, align 4
@.str.12.195 = private unnamed_addr constant [18 x i8] c"Invalid position\0A\00", align 1
@.str.13.196 = private unnamed_addr constant [31 x i8] c"Error: Shift marker not found\0A\00", align 1
@.str.14.197 = private unnamed_addr constant [41 x i8] c"Error: Stack underflow during reduction\0A\00", align 1
@__const.find_rule.new_item = private unnamed_addr constant %struct.stack_item { i32 0, i32 11 }, align 4
@.str.15.193 = private unnamed_addr constant [4 x i8] c"  |\00", align 1
@subtree_prefix = global ptr @.str.15.193, align 8
@.str.16.194 = private unnamed_addr constant [4 x i8] c"   \00", align 1
@space_prefix = global ptr @.str.16.194, align 8
@.str.17.198 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.18.199 = private unnamed_addr constant [8 x i8] c"\E2\94\9C\E2\94\80 \00", align 1
@.str.19.200 = private unnamed_addr constant [8 x i8] c"\E2\94\94\E2\94\80 \00", align 1
@.str.20.201 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.21.203 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.22.202 = private unnamed_addr constant [6 x i8] c"\E2\94\82  \00", align 1
@parsing_result = global i32 0, align 4
@instructions = global ptr null, align 8
@.str.214 = private unnamed_addr constant [12 x i8] c".IFJcode24\0A\00", align 1
@gb_table = global ptr null, align 8
@__stdinp = external global ptr, align 8
@curr_token = global ptr null, align 8
@__stdoutp = external global ptr, align 8
@.str.1.219 = private unnamed_addr constant [10 x i8] c"ifj24.zig\00", align 1
@.str.2.215 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.3.216 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.4.217 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.5.218 = private unnamed_addr constant [3 x i8] c"__\00", align 1
@.str.220 = private unnamed_addr constant [6 x i8] c"T_EOF\00", align 1
@.str.1.221 = private unnamed_addr constant [5 x i8] c"T_ID\00", align 1
@.str.2.222 = private unnamed_addr constant [10 x i8] c"T_KEYWORD\00", align 1
@.str.3.223 = private unnamed_addr constant [6 x i8] c"T_I32\00", align 1
@.str.4.224 = private unnamed_addr constant [6 x i8] c"T_F64\00", align 1
@.str.5.225 = private unnamed_addr constant [10 x i8] c"T_I32_EXP\00", align 1
@.str.6.226 = private unnamed_addr constant [10 x i8] c"T_F64_EXP\00", align 1
@.str.7.227 = private unnamed_addr constant [9 x i8] c"T_STRING\00", align 1
@.str.8.228 = private unnamed_addr constant [7 x i8] c"T_PLUS\00", align 1
@.str.9.229 = private unnamed_addr constant [8 x i8] c"T_MINUS\00", align 1
@.str.10.230 = private unnamed_addr constant [6 x i8] c"T_MUL\00", align 1
@.str.11.231 = private unnamed_addr constant [6 x i8] c"T_DIV\00", align 1
@.str.12.232 = private unnamed_addr constant [9 x i8] c"T_ASSIGN\00", align 1
@.str.13.233 = private unnamed_addr constant [6 x i8] c"T_NOT\00", align 1
@.str.14.234 = private unnamed_addr constant [11 x i8] c"T_EQUAL_TO\00", align 1
@.str.15.235 = private unnamed_addr constant [8 x i8] c"T_NOTEQ\00", align 1
@.str.16.236 = private unnamed_addr constant [15 x i8] c"T_QUESTIONMARK\00", align 1
@.str.17.237 = private unnamed_addr constant [6 x i8] c"T_BAR\00", align 1
@.str.18.238 = private unnamed_addr constant [17 x i8] c"T_OP_PARENTHESES\00", align 1
@.str.19.239 = private unnamed_addr constant [17 x i8] c"T_CL_PARENTHESES\00", align 1
@.str.20.240 = private unnamed_addr constant [13 x i8] c"T_OP_BRACKET\00", align 1
@.str.21.241 = private unnamed_addr constant [13 x i8] c"T_CL_BRACKET\00", align 1
@.str.22.242 = private unnamed_addr constant [12 x i8] c"T_OP_BRACES\00", align 1
@.str.23.243 = private unnamed_addr constant [12 x i8] c"T_CL_BRACES\00", align 1
@.str.24.244 = private unnamed_addr constant [7 x i8] c"T_LESS\00", align 1
@.str.25.245 = private unnamed_addr constant [7 x i8] c"T_MORE\00", align 1
@.str.26.246 = private unnamed_addr constant [9 x i8] c"T_LESSEQ\00", align 1
@.str.27.247 = private unnamed_addr constant [9 x i8] c"T_MOREEQ\00", align 1
@.str.28.248 = private unnamed_addr constant [12 x i8] c"T_SEMICOLON\00", align 1
@.str.29.249 = private unnamed_addr constant [8 x i8] c"T_COLON\00", align 1
@.str.30.250 = private unnamed_addr constant [6 x i8] c"T_DOT\00", align 1
@.str.31.251 = private unnamed_addr constant [8 x i8] c"T_COMMA\00", align 1
@.str.32.252 = private unnamed_addr constant [5 x i8] c"T_AT\00", align 1
@.str.33.253 = private unnamed_addr constant [14 x i8] c"KEYWORD_CONST\00", align 1
@.str.34.254 = private unnamed_addr constant [13 x i8] c"KEYWORD_ELSE\00", align 1
@.str.35.255 = private unnamed_addr constant [11 x i8] c"KEYWORD_IF\00", align 1
@.str.36.256 = private unnamed_addr constant [11 x i8] c"KEYWORD_FN\00", align 1
@.str.37.257 = private unnamed_addr constant [12 x i8] c"KEYWORD_I32\00", align 1
@.str.38.258 = private unnamed_addr constant [12 x i8] c"KEYWORD_F64\00", align 1
@.str.39.259 = private unnamed_addr constant [13 x i8] c"KEYWORD_NULL\00", align 1
@.str.40.260 = private unnamed_addr constant [12 x i8] c"KEYWORD_PUB\00", align 1
@.str.41.261 = private unnamed_addr constant [15 x i8] c"KEYWORD_RETURN\00", align 1
@.str.42.262 = private unnamed_addr constant [11 x i8] c"KEYWORD_U8\00", align 1
@.str.43.263 = private unnamed_addr constant [12 x i8] c"KEYWORD_VAR\00", align 1
@.str.44.264 = private unnamed_addr constant [13 x i8] c"KEYWORD_VOID\00", align 1
@.str.45.265 = private unnamed_addr constant [14 x i8] c"KEYWORD_WHILE\00", align 1
@.str.46.266 = private unnamed_addr constant [14 x i8] c"PROLOG_IMPORT\00", align 1
@.str.47.267 = private unnamed_addr constant [10 x i8] c"I_READSTR\00", align 1
@.str.48.268 = private unnamed_addr constant [10 x i8] c"I_READI32\00", align 1
@.str.49.269 = private unnamed_addr constant [10 x i8] c"I_READF64\00", align 1
@.str.50.270 = private unnamed_addr constant [8 x i8] c"I_WRITE\00", align 1
@.str.51.271 = private unnamed_addr constant [6 x i8] c"I_I2F\00", align 1
@.str.52.272 = private unnamed_addr constant [6 x i8] c"I_F2I\00", align 1
@.str.53.273 = private unnamed_addr constant [9 x i8] c"I_STRING\00", align 1
@.str.54.274 = private unnamed_addr constant [9 x i8] c"I_LENGTH\00", align 1
@.str.55.275 = private unnamed_addr constant [9 x i8] c"I_CONCAT\00", align 1
@.str.56.276 = private unnamed_addr constant [12 x i8] c"I_SUBSTRING\00", align 1
@.str.57.277 = private unnamed_addr constant [9 x i8] c"I_STRCMP\00", align 1
@.str.58.278 = private unnamed_addr constant [6 x i8] c"I_ORD\00", align 1
@.str.59.279 = private unnamed_addr constant [6 x i8] c"I_CHR\00", align 1
@.str.60.280 = private unnamed_addr constant [6 x i8] c"I_IFJ\00", align 1
@TypeTokenNames = global [61 x ptr] [ptr @.str.220, ptr @.str.1.221, ptr @.str.2.222, ptr @.str.3.223, ptr @.str.4.224, ptr @.str.5.225, ptr @.str.6.226, ptr @.str.7.227, ptr @.str.8.228, ptr @.str.9.229, ptr @.str.10.230, ptr @.str.11.231, ptr @.str.12.232, ptr @.str.13.233, ptr @.str.14.234, ptr @.str.15.235, ptr @.str.16.236, ptr @.str.17.237, ptr @.str.18.238, ptr @.str.19.239, ptr @.str.20.240, ptr @.str.21.241, ptr @.str.22.242, ptr @.str.23.243, ptr @.str.24.244, ptr @.str.25.245, ptr @.str.26.246, ptr @.str.27.247, ptr @.str.28.248, ptr @.str.29.249, ptr @.str.30.250, ptr @.str.31.251, ptr @.str.32.252, ptr @.str.33.253, ptr @.str.34.254, ptr @.str.35.255, ptr @.str.36.256, ptr @.str.37.257, ptr @.str.38.258, ptr @.str.39.259, ptr @.str.40.260, ptr @.str.41.261, ptr @.str.42.262, ptr @.str.43.263, ptr @.str.44.264, ptr @.str.45.265, ptr @.str.46.266, ptr @.str.47.267, ptr @.str.48.268, ptr @.str.49.269, ptr @.str.50.270, ptr @.str.51.271, ptr @.str.52.272, ptr @.str.53.273, ptr @.str.54.274, ptr @.str.55.275, ptr @.str.56.276, ptr @.str.57.277, ptr @.str.58.278, ptr @.str.59.279, ptr @.str.60.280], align 8
@.str.61.281 = private unnamed_addr constant [4 x i8] c"EOF\00", align 1
@.str.62.282 = private unnamed_addr constant [3 x i8] c"ID\00", align 1
@.str.63.283 = private unnamed_addr constant [8 x i8] c"KEYWORD\00", align 1
@.str.64.284 = private unnamed_addr constant [4 x i8] c"I32\00", align 1
@.str.65.285 = private unnamed_addr constant [4 x i8] c"F64\00", align 1
@.str.66.286 = private unnamed_addr constant [8 x i8] c"I32_EXP\00", align 1
@.str.67.287 = private unnamed_addr constant [8 x i8] c"F64_EXP\00", align 1
@.str.68.288 = private unnamed_addr constant [7 x i8] c"STRING\00", align 1
@.str.69.289 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str.70.290 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.71.291 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.72.292 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.73.293 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@.str.74.294 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@.str.75.295 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@.str.76.296 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@.str.77.297 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@.str.78.298 = private unnamed_addr constant [2 x i8] c"|\00", align 1
@.str.79.299 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.80.300 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.81.301 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.82.302 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.83.303 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.84.304 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.85.305 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.86.306 = private unnamed_addr constant [2 x i8] c">\00", align 1
@.str.87.307 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@.str.88.308 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@.str.89.309 = private unnamed_addr constant [2 x i8] c";\00", align 1
@.str.90.310 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.91.311 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.92.312 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.93.313 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@.str.94.314 = private unnamed_addr constant [6 x i8] c"const\00", align 1
@.str.95.315 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.96.316 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.97.317 = private unnamed_addr constant [3 x i8] c"fn\00", align 1
@.str.98.318 = private unnamed_addr constant [4 x i8] c"i32\00", align 1
@.str.99.319 = private unnamed_addr constant [4 x i8] c"f64\00", align 1
@.str.100.320 = private unnamed_addr constant [5 x i8] c"null\00", align 1
@.str.101.321 = private unnamed_addr constant [4 x i8] c"pub\00", align 1
@.str.102.322 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.103.323 = private unnamed_addr constant [3 x i8] c"u8\00", align 1
@.str.104 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@.str.105 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@.str.106 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.107 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@.str.108 = private unnamed_addr constant [9 x i8] c"ifj.read\00", align 1
@.str.109 = private unnamed_addr constant [12 x i8] c"ifj.readi32\00", align 1
@.str.110 = private unnamed_addr constant [12 x i8] c"ifj.readf64\00", align 1
@.str.111 = private unnamed_addr constant [10 x i8] c"ifj.write\00", align 1
@.str.112 = private unnamed_addr constant [8 x i8] c"ifj.i2f\00", align 1
@.str.113 = private unnamed_addr constant [8 x i8] c"ifj.f2i\00", align 1
@.str.114 = private unnamed_addr constant [11 x i8] c"ifj.string\00", align 1
@.str.115 = private unnamed_addr constant [11 x i8] c"ifj.length\00", align 1
@.str.116.324 = private unnamed_addr constant [11 x i8] c"ifj.concat\00", align 1
@.str.117 = private unnamed_addr constant [14 x i8] c"ifj.substring\00", align 1
@.str.118 = private unnamed_addr constant [11 x i8] c"ifj.strcmp\00", align 1
@.str.119 = private unnamed_addr constant [8 x i8] c"ifj.ord\00", align 1
@.str.120 = private unnamed_addr constant [8 x i8] c"ifj.chr\00", align 1
@.str.121 = private unnamed_addr constant [5 x i8] c"iifj\00", align 1
@TypeToeknSymbols = global [61 x ptr] [ptr @.str.61.281, ptr @.str.62.282, ptr @.str.63.283, ptr @.str.64.284, ptr @.str.65.285, ptr @.str.66.286, ptr @.str.67.287, ptr @.str.68.288, ptr @.str.69.289, ptr @.str.70.290, ptr @.str.71.291, ptr @.str.72.292, ptr @.str.73.293, ptr @.str.74.294, ptr @.str.75.295, ptr @.str.76.296, ptr @.str.77.297, ptr @.str.78.298, ptr @.str.79.299, ptr @.str.80.300, ptr @.str.81.301, ptr @.str.82.302, ptr @.str.83.303, ptr @.str.84.304, ptr @.str.85.305, ptr @.str.86.306, ptr @.str.87.307, ptr @.str.88.308, ptr @.str.89.309, ptr @.str.90.310, ptr @.str.91.311, ptr @.str.92.312, ptr @.str.93.313, ptr @.str.94.314, ptr @.str.95.315, ptr @.str.96.316, ptr @.str.97.317, ptr @.str.98.318, ptr @.str.99.319, ptr @.str.100.320, ptr @.str.101.321, ptr @.str.102.322, ptr @.str.103.323, ptr @.str.104, ptr @.str.105, ptr @.str.106, ptr @.str.107, ptr @.str.108, ptr @.str.109, ptr @.str.110, ptr @.str.111, ptr @.str.112, ptr @.str.113, ptr @.str.114, ptr @.str.115, ptr @.str.116.324, ptr @.str.117, ptr @.str.118, ptr @.str.119, ptr @.str.120, ptr @.str.121], align 8
@TypeTokenNamesCount = constant i32 61, align 4
@.str.122 = private unnamed_addr constant [3 x i8] c"\\\22\00", align 1
@.str.123 = private unnamed_addr constant [3 x i8] c"\\n\00", align 1
@.str.124 = private unnamed_addr constant [3 x i8] c"\\r\00", align 1
@.str.125 = private unnamed_addr constant [3 x i8] c"\\t\00", align 1
@.str.126 = private unnamed_addr constant [2 x i8] c"\\\00", align 1
@.str.127 = private unnamed_addr constant [4 x i8] c"ifj\00", align 1
@.str.128 = private unnamed_addr constant [8 x i8] c"readstr\00", align 1
@.str.129 = private unnamed_addr constant [8 x i8] c"readi32\00", align 1
@.str.130 = private unnamed_addr constant [8 x i8] c"readf64\00", align 1
@.str.131 = private unnamed_addr constant [6 x i8] c"write\00", align 1
@.str.132 = private unnamed_addr constant [4 x i8] c"i2f\00", align 1
@.str.133 = private unnamed_addr constant [4 x i8] c"f2i\00", align 1
@.str.134 = private unnamed_addr constant [7 x i8] c"string\00", align 1
@.str.135 = private unnamed_addr constant [7 x i8] c"length\00", align 1
@.str.136 = private unnamed_addr constant [7 x i8] c"concat\00", align 1
@.str.137 = private unnamed_addr constant [10 x i8] c"substring\00", align 1
@.str.138 = private unnamed_addr constant [7 x i8] c"strcmp\00", align 1
@.str.139 = private unnamed_addr constant [4 x i8] c"ord\00", align 1
@.str.140 = private unnamed_addr constant [4 x i8] c"chr\00", align 1
@__stderrp = external global ptr, align 8
@.str.349 = private unnamed_addr constant [18 x i8] c"Invalid position\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @get_name(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds nuw [56 x ptr], ptr @CmdT, i64 0, i64 %4
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @code_list_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.code_list, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.code_list, ptr %5, i32 0, i32 1
  store ptr null, ptr %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @code_list_insert(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call ptr @malloc(i64 noundef 16) #10
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @print_error(i32 noundef 99)
  br label %10

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.code_list, ptr %12, i32 0, i32 0
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.code_list, ptr %14, i32 0, i32 1
  store ptr null, ptr %15, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.code_list, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %27

20:                                               ; preds = %10
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.code_list, ptr %22, i32 0, i32 0
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.code_list, ptr %25, i32 0, i32 1
  store ptr %24, ptr %26, align 8
  br label %36

27:                                               ; preds = %10
  %28 = load ptr, ptr %5, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.code_list, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds nuw %struct.code_list, ptr %31, i32 0, i32 1
  store ptr %28, ptr %32, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.code_list, ptr %34, i32 0, i32 1
  store ptr %33, ptr %35, align 8
  br label %36

36:                                               ; preds = %27, %20
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @code_list_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.code_list, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  br label %8

8:                                                ; preds = %11, %1
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.code_list, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.code_list, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  call void @string_free(ptr noundef %17)
  %18 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %18)
  %19 = load ptr, ptr %4, align 8
  store ptr %19, ptr %3, align 8
  br label %8, !llvm.loop !6

20:                                               ; preds = %8
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.code_list, ptr %21, i32 0, i32 0
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.code_list, ptr %23, i32 0, i32 1
  store ptr null, ptr %24, align 8
  ret void
}

declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @code_to_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds nuw %struct.code_list, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  br label %9

9:                                                ; preds = %12, %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %23

12:                                               ; preds = %9
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.code_list, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds nuw %struct.String, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.59, ptr noundef %18) #11
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.code_list, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %5, align 8
  br label %9, !llvm.loop !8

23:                                               ; preds = %9
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @generate_code(ptr noundef %0, ptr dead_on_return noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call ptr @malloc(i64 noundef 24) #10
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @print_error(i32 noundef 99)
  br label %10

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %5, align 8
  call void @string_init(ptr noundef %11)
  %12 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  switch i32 %13, label %401 [
    i32 0, label %14
    i32 1, label %26
    i32 2, label %26
    i32 3, label %26
    i32 4, label %34
    i32 5, label %42
    i32 6, label %50
    i32 7, label %54
    i32 8, label %62
    i32 9, label %70
    i32 10, label %74
    i32 11, label %74
    i32 12, label %74
    i32 13, label %74
    i32 14, label %74
    i32 15, label %94
    i32 16, label %94
    i32 17, label %94
    i32 18, label %94
    i32 19, label %94
    i32 20, label %102
    i32 21, label %102
    i32 22, label %102
    i32 26, label %102
    i32 27, label %102
    i32 28, label %122
    i32 23, label %134
    i32 24, label %134
    i32 25, label %134
    i32 29, label %134
    i32 30, label %134
    i32 31, label %134
    i32 32, label %142
    i32 33, label %142
    i32 34, label %142
    i32 35, label %158
    i32 36, label %174
    i32 37, label %186
    i32 38, label %198
    i32 39, label %210
    i32 40, label %226
    i32 41, label %241
    i32 42, label %249
    i32 43, label %265
    i32 44, label %277
    i32 45, label %293
    i32 46, label %309
    i32 47, label %321
    i32 48, label %321
    i32 49, label %333
    i32 50, label %349
    i32 51, label %365
    i32 52, label %373
    i32 53, label %381
    i32 54, label %389
    i32 55, label %393
  ]

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %15, ptr noundef @.str.60)
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  call void @string_concat(ptr noundef %16, ptr noundef %18)
  %19 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %19, ptr noundef @.str.61)
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  call void @string_concat(ptr noundef %20, ptr noundef %22)
  %23 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %23, ptr noundef @.str.62)
  %24 = load ptr, ptr %3, align 8
  %25 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %24, ptr noundef %25)
  br label %406

26:                                               ; preds = %10, %10, %10
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = call ptr @get_name(i32 noundef %29)
  call void @string_concat(ptr noundef %27, ptr noundef %30)
  %31 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %31, ptr noundef @.str.62)
  %32 = load ptr, ptr %3, align 8
  %33 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %32, ptr noundef %33)
  br label %406

34:                                               ; preds = %10
  %35 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %35, ptr noundef @.str.63)
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  call void @string_concat(ptr noundef %36, ptr noundef %38)
  %39 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %39, ptr noundef @.str.62)
  %40 = load ptr, ptr %3, align 8
  %41 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %40, ptr noundef %41)
  br label %406

42:                                               ; preds = %10
  %43 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %43, ptr noundef @.str.64)
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %46 = load ptr, ptr %45, align 8
  call void @string_concat(ptr noundef %44, ptr noundef %46)
  %47 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %47, ptr noundef @.str.62)
  %48 = load ptr, ptr %3, align 8
  %49 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %48, ptr noundef %49)
  br label %406

50:                                               ; preds = %10
  %51 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %51, ptr noundef @.str.65)
  %52 = load ptr, ptr %3, align 8
  %53 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %52, ptr noundef %53)
  br label %406

54:                                               ; preds = %10
  %55 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %55, ptr noundef @.str.66)
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %58 = load ptr, ptr %57, align 8
  call void @string_concat(ptr noundef %56, ptr noundef %58)
  %59 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %59, ptr noundef @.str.62)
  %60 = load ptr, ptr %3, align 8
  %61 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %60, ptr noundef %61)
  br label %406

62:                                               ; preds = %10
  %63 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %63, ptr noundef @.str.67)
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  call void @string_concat(ptr noundef %64, ptr noundef %66)
  %67 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %67, ptr noundef @.str.62)
  %68 = load ptr, ptr %3, align 8
  %69 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %68, ptr noundef %69)
  br label %406

70:                                               ; preds = %10
  %71 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %71, ptr noundef @.str.68)
  %72 = load ptr, ptr %3, align 8
  %73 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %72, ptr noundef %73)
  br label %406

74:                                               ; preds = %10, %10, %10, %10, %10
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = call ptr @get_name(i32 noundef %77)
  call void @string_concat(ptr noundef %75, ptr noundef %78)
  %79 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %79, ptr noundef @.str.61)
  %80 = load ptr, ptr %5, align 8
  %81 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  call void @string_concat(ptr noundef %80, ptr noundef %82)
  %83 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %83, ptr noundef @.str.61)
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %86 = load ptr, ptr %85, align 8
  call void @string_concat(ptr noundef %84, ptr noundef %86)
  %87 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %87, ptr noundef @.str.61)
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %90 = load ptr, ptr %89, align 8
  call void @string_concat(ptr noundef %88, ptr noundef %90)
  %91 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %91, ptr noundef @.str.62)
  %92 = load ptr, ptr %3, align 8
  %93 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %92, ptr noundef %93)
  br label %406

94:                                               ; preds = %10, %10, %10, %10, %10
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = call ptr @get_name(i32 noundef %97)
  call void @string_concat(ptr noundef %95, ptr noundef %98)
  %99 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %99, ptr noundef @.str.62)
  %100 = load ptr, ptr %3, align 8
  %101 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %100, ptr noundef %101)
  br label %406

102:                                              ; preds = %10, %10, %10, %10, %10
  %103 = load ptr, ptr %5, align 8
  %104 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %105 = load i32, ptr %104, align 8
  %106 = call ptr @get_name(i32 noundef %105)
  call void @string_concat(ptr noundef %103, ptr noundef %106)
  %107 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %107, ptr noundef @.str.61)
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  call void @string_concat(ptr noundef %108, ptr noundef %110)
  %111 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %111, ptr noundef @.str.61)
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %114 = load ptr, ptr %113, align 8
  call void @string_concat(ptr noundef %112, ptr noundef %114)
  %115 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %115, ptr noundef @.str.61)
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %118 = load ptr, ptr %117, align 8
  call void @string_concat(ptr noundef %116, ptr noundef %118)
  %119 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %119, ptr noundef @.str.62)
  %120 = load ptr, ptr %3, align 8
  %121 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %120, ptr noundef %121)
  br label %406

122:                                              ; preds = %10
  %123 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %123, ptr noundef @.str.69)
  %124 = load ptr, ptr %5, align 8
  %125 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %126 = load ptr, ptr %125, align 8
  call void @string_concat(ptr noundef %124, ptr noundef %126)
  %127 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %127, ptr noundef @.str.61)
  %128 = load ptr, ptr %5, align 8
  %129 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  call void @string_concat(ptr noundef %128, ptr noundef %130)
  %131 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %131, ptr noundef @.str.62)
  %132 = load ptr, ptr %3, align 8
  %133 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %132, ptr noundef %133)
  br label %406

134:                                              ; preds = %10, %10, %10, %10, %10, %10
  %135 = load ptr, ptr %5, align 8
  %136 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = call ptr @get_name(i32 noundef %137)
  call void @string_concat(ptr noundef %135, ptr noundef %138)
  %139 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %139, ptr noundef @.str.62)
  %140 = load ptr, ptr %3, align 8
  %141 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %140, ptr noundef %141)
  br label %406

142:                                              ; preds = %10, %10, %10
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = call ptr @get_name(i32 noundef %145)
  call void @string_concat(ptr noundef %143, ptr noundef %146)
  %147 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %147, ptr noundef @.str.61)
  %148 = load ptr, ptr %5, align 8
  %149 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %150 = load ptr, ptr %149, align 8
  call void @string_concat(ptr noundef %148, ptr noundef %150)
  %151 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %151, ptr noundef @.str.61)
  %152 = load ptr, ptr %5, align 8
  %153 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %154 = load ptr, ptr %153, align 8
  call void @string_concat(ptr noundef %152, ptr noundef %154)
  %155 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %155, ptr noundef @.str.62)
  %156 = load ptr, ptr %3, align 8
  %157 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %156, ptr noundef %157)
  br label %406

158:                                              ; preds = %10
  %159 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %159, ptr noundef @.str.70)
  %160 = load ptr, ptr %5, align 8
  %161 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %162 = load ptr, ptr %161, align 8
  call void @string_concat(ptr noundef %160, ptr noundef %162)
  %163 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %163, ptr noundef @.str.61)
  %164 = load ptr, ptr %5, align 8
  %165 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %166 = load ptr, ptr %165, align 8
  call void @string_concat(ptr noundef %164, ptr noundef %166)
  %167 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %167, ptr noundef @.str.61)
  %168 = load ptr, ptr %5, align 8
  %169 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %170 = load ptr, ptr %169, align 8
  call void @string_concat(ptr noundef %168, ptr noundef %170)
  %171 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %171, ptr noundef @.str.62)
  %172 = load ptr, ptr %3, align 8
  %173 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %172, ptr noundef %173)
  br label %406

174:                                              ; preds = %10
  %175 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %175, ptr noundef @.str.71)
  %176 = load ptr, ptr %5, align 8
  %177 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  call void @string_concat(ptr noundef %176, ptr noundef %178)
  %179 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %179, ptr noundef @.str.61)
  %180 = load ptr, ptr %5, align 8
  %181 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %182 = load ptr, ptr %181, align 8
  call void @string_concat(ptr noundef %180, ptr noundef %182)
  %183 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %183, ptr noundef @.str.62)
  %184 = load ptr, ptr %3, align 8
  %185 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %184, ptr noundef %185)
  br label %406

186:                                              ; preds = %10
  %187 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %187, ptr noundef @.str.72)
  %188 = load ptr, ptr %5, align 8
  %189 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %190 = load ptr, ptr %189, align 8
  call void @string_concat(ptr noundef %188, ptr noundef %190)
  %191 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %191, ptr noundef @.str.61)
  %192 = load ptr, ptr %5, align 8
  %193 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %194 = load ptr, ptr %193, align 8
  call void @string_concat(ptr noundef %192, ptr noundef %194)
  %195 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %195, ptr noundef @.str.62)
  %196 = load ptr, ptr %3, align 8
  %197 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %196, ptr noundef %197)
  br label %406

198:                                              ; preds = %10
  %199 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %199, ptr noundef @.str.73)
  %200 = load ptr, ptr %5, align 8
  %201 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %202 = load ptr, ptr %201, align 8
  call void @string_concat(ptr noundef %200, ptr noundef %202)
  %203 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %203, ptr noundef @.str.61)
  %204 = load ptr, ptr %5, align 8
  %205 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %206 = load ptr, ptr %205, align 8
  call void @string_concat(ptr noundef %204, ptr noundef %206)
  %207 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %207, ptr noundef @.str.62)
  %208 = load ptr, ptr %3, align 8
  %209 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %208, ptr noundef %209)
  br label %406

210:                                              ; preds = %10
  %211 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %211, ptr noundef @.str.74)
  %212 = load ptr, ptr %5, align 8
  %213 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %214 = load ptr, ptr %213, align 8
  call void @string_concat(ptr noundef %212, ptr noundef %214)
  %215 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %215, ptr noundef @.str.61)
  %216 = load ptr, ptr %5, align 8
  %217 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %218 = load ptr, ptr %217, align 8
  call void @string_concat(ptr noundef %216, ptr noundef %218)
  %219 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %219, ptr noundef @.str.61)
  %220 = load ptr, ptr %5, align 8
  %221 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %222 = load ptr, ptr %221, align 8
  call void @string_concat(ptr noundef %220, ptr noundef %222)
  %223 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %223, ptr noundef @.str.62)
  %224 = load ptr, ptr %3, align 8
  %225 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %224, ptr noundef %225)
  br label %406

226:                                              ; preds = %10
  %227 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %227, ptr noundef @.str.75)
  %228 = load ptr, ptr %5, align 8
  %229 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %230 = load ptr, ptr %229, align 8
  call void @string_concat(ptr noundef %228, ptr noundef %230)
  %231 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %231, ptr noundef @.str.61)
  %232 = load ptr, ptr %5, align 8
  %233 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 4
  %234 = load i32, ptr %233, align 8
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds nuw [3 x ptr], ptr @VariableType, i64 0, i64 %235
  %237 = load ptr, ptr %236, align 8
  call void @string_concat(ptr noundef %232, ptr noundef %237)
  %238 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %238, ptr noundef @.str.62)
  %239 = load ptr, ptr %3, align 8
  %240 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %239, ptr noundef %240)
  br label %406

241:                                              ; preds = %10
  %242 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %242, ptr noundef @.str.76)
  %243 = load ptr, ptr %5, align 8
  %244 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %245 = load ptr, ptr %244, align 8
  call void @string_concat(ptr noundef %243, ptr noundef %245)
  %246 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %246, ptr noundef @.str.62)
  %247 = load ptr, ptr %3, align 8
  %248 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %247, ptr noundef %248)
  br label %406

249:                                              ; preds = %10
  %250 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %250, ptr noundef @.str.77)
  %251 = load ptr, ptr %5, align 8
  %252 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %253 = load ptr, ptr %252, align 8
  call void @string_concat(ptr noundef %251, ptr noundef %253)
  %254 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %254, ptr noundef @.str.61)
  %255 = load ptr, ptr %5, align 8
  %256 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %257 = load ptr, ptr %256, align 8
  call void @string_concat(ptr noundef %255, ptr noundef %257)
  %258 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %258, ptr noundef @.str.61)
  %259 = load ptr, ptr %5, align 8
  %260 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %261 = load ptr, ptr %260, align 8
  call void @string_concat(ptr noundef %259, ptr noundef %261)
  %262 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %262, ptr noundef @.str.62)
  %263 = load ptr, ptr %3, align 8
  %264 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %263, ptr noundef %264)
  br label %406

265:                                              ; preds = %10
  %266 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %266, ptr noundef @.str.78)
  %267 = load ptr, ptr %5, align 8
  %268 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %269 = load ptr, ptr %268, align 8
  call void @string_concat(ptr noundef %267, ptr noundef %269)
  %270 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %270, ptr noundef @.str.61)
  %271 = load ptr, ptr %5, align 8
  %272 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %273 = load ptr, ptr %272, align 8
  call void @string_concat(ptr noundef %271, ptr noundef %273)
  %274 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %274, ptr noundef @.str.62)
  %275 = load ptr, ptr %3, align 8
  %276 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %275, ptr noundef %276)
  br label %406

277:                                              ; preds = %10
  %278 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %278, ptr noundef @.str.79)
  %279 = load ptr, ptr %5, align 8
  %280 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %281 = load ptr, ptr %280, align 8
  call void @string_concat(ptr noundef %279, ptr noundef %281)
  %282 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %282, ptr noundef @.str.61)
  %283 = load ptr, ptr %5, align 8
  %284 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %285 = load ptr, ptr %284, align 8
  call void @string_concat(ptr noundef %283, ptr noundef %285)
  %286 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %286, ptr noundef @.str.61)
  %287 = load ptr, ptr %5, align 8
  %288 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %289 = load ptr, ptr %288, align 8
  call void @string_concat(ptr noundef %287, ptr noundef %289)
  %290 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %290, ptr noundef @.str.62)
  %291 = load ptr, ptr %3, align 8
  %292 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %291, ptr noundef %292)
  br label %406

293:                                              ; preds = %10
  %294 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %294, ptr noundef @.str.80)
  %295 = load ptr, ptr %5, align 8
  %296 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %297 = load ptr, ptr %296, align 8
  call void @string_concat(ptr noundef %295, ptr noundef %297)
  %298 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %298, ptr noundef @.str.61)
  %299 = load ptr, ptr %5, align 8
  %300 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %301 = load ptr, ptr %300, align 8
  call void @string_concat(ptr noundef %299, ptr noundef %301)
  %302 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %302, ptr noundef @.str.61)
  %303 = load ptr, ptr %5, align 8
  %304 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %305 = load ptr, ptr %304, align 8
  call void @string_concat(ptr noundef %303, ptr noundef %305)
  %306 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %306, ptr noundef @.str.62)
  %307 = load ptr, ptr %3, align 8
  %308 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %307, ptr noundef %308)
  br label %406

309:                                              ; preds = %10
  %310 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %310, ptr noundef @.str.81)
  %311 = load ptr, ptr %5, align 8
  %312 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 1
  %313 = load ptr, ptr %312, align 8
  call void @string_concat(ptr noundef %311, ptr noundef %313)
  %314 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %314, ptr noundef @.str.61)
  %315 = load ptr, ptr %5, align 8
  %316 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %317 = load ptr, ptr %316, align 8
  call void @string_concat(ptr noundef %315, ptr noundef %317)
  %318 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %318, ptr noundef @.str.62)
  %319 = load ptr, ptr %3, align 8
  %320 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %319, ptr noundef %320)
  br label %406

321:                                              ; preds = %10, %10
  %322 = load ptr, ptr %5, align 8
  %323 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %324 = load i32, ptr %323, align 8
  %325 = call ptr @get_name(i32 noundef %324)
  call void @string_concat(ptr noundef %322, ptr noundef %325)
  %326 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %326, ptr noundef @.str.61)
  %327 = load ptr, ptr %5, align 8
  %328 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %329 = load ptr, ptr %328, align 8
  call void @string_concat(ptr noundef %327, ptr noundef %329)
  %330 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %330, ptr noundef @.str.62)
  %331 = load ptr, ptr %3, align 8
  %332 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %331, ptr noundef %332)
  br label %406

333:                                              ; preds = %10
  %334 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %334, ptr noundef @.str.82)
  %335 = load ptr, ptr %5, align 8
  %336 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %337 = load ptr, ptr %336, align 8
  call void @string_concat(ptr noundef %335, ptr noundef %337)
  %338 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %338, ptr noundef @.str.61)
  %339 = load ptr, ptr %5, align 8
  %340 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %341 = load ptr, ptr %340, align 8
  call void @string_concat(ptr noundef %339, ptr noundef %341)
  %342 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %342, ptr noundef @.str.61)
  %343 = load ptr, ptr %5, align 8
  %344 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %345 = load ptr, ptr %344, align 8
  call void @string_concat(ptr noundef %343, ptr noundef %345)
  %346 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %346, ptr noundef @.str.62)
  %347 = load ptr, ptr %3, align 8
  %348 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %347, ptr noundef %348)
  br label %406

349:                                              ; preds = %10
  %350 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %350, ptr noundef @.str.83)
  %351 = load ptr, ptr %5, align 8
  %352 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %353 = load ptr, ptr %352, align 8
  call void @string_concat(ptr noundef %351, ptr noundef %353)
  %354 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %354, ptr noundef @.str.61)
  %355 = load ptr, ptr %5, align 8
  %356 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %357 = load ptr, ptr %356, align 8
  call void @string_concat(ptr noundef %355, ptr noundef %357)
  %358 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %358, ptr noundef @.str.61)
  %359 = load ptr, ptr %5, align 8
  %360 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 3
  %361 = load ptr, ptr %360, align 8
  call void @string_concat(ptr noundef %359, ptr noundef %361)
  %362 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %362, ptr noundef @.str.62)
  %363 = load ptr, ptr %3, align 8
  %364 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %363, ptr noundef %364)
  br label %406

365:                                              ; preds = %10
  %366 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %366, ptr noundef @.str.84)
  %367 = load ptr, ptr %5, align 8
  %368 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %369 = load ptr, ptr %368, align 8
  call void @string_concat(ptr noundef %367, ptr noundef %369)
  %370 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %370, ptr noundef @.str.62)
  %371 = load ptr, ptr %3, align 8
  %372 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %371, ptr noundef %372)
  br label %406

373:                                              ; preds = %10
  %374 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %374, ptr noundef @.str.85)
  %375 = load ptr, ptr %5, align 8
  %376 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 5
  %377 = load ptr, ptr %376, align 8
  call void @string_concat(ptr noundef %375, ptr noundef %377)
  %378 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %378, ptr noundef @.str.62)
  %379 = load ptr, ptr %3, align 8
  %380 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %379, ptr noundef %380)
  br label %406

381:                                              ; preds = %10
  %382 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %382, ptr noundef @.str.86)
  %383 = load ptr, ptr %5, align 8
  %384 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %385 = load ptr, ptr %384, align 8
  call void @string_concat(ptr noundef %383, ptr noundef %385)
  %386 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %386, ptr noundef @.str.62)
  %387 = load ptr, ptr %3, align 8
  %388 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %387, ptr noundef %388)
  br label %406

389:                                              ; preds = %10
  %390 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %390, ptr noundef @.str.87)
  %391 = load ptr, ptr %3, align 8
  %392 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %391, ptr noundef %392)
  br label %406

393:                                              ; preds = %10
  %394 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %394, ptr noundef @.str.88)
  %395 = load ptr, ptr %5, align 8
  %396 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 2
  %397 = load ptr, ptr %396, align 8
  call void @string_concat(ptr noundef %395, ptr noundef %397)
  %398 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %398, ptr noundef @.str.62)
  %399 = load ptr, ptr %3, align 8
  %400 = load ptr, ptr %5, align 8
  call void @code_list_insert(ptr noundef %399, ptr noundef %400)
  br label %406

401:                                              ; preds = %10
  %402 = load ptr, ptr @__stderrp, align 8
  %403 = getelementptr inbounds nuw %struct.args, ptr %1, i32 0, i32 0
  %404 = load i32, ptr %403, align 8
  %405 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %402, ptr noundef @.str.89, i32 noundef %404) #11
  call void @print_error(i32 noundef 99)
  br label %406

406:                                              ; preds = %401, %393, %389, %381, %373, %365, %349, %333, %321, %309, %293, %277, %265, %249, %241, %226, %210, %198, %186, %174, %158, %142, %134, %122, %102, %94, %74, %70, %62, %54, %50, %42, %34, %26, %14
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @counter() #0 {
  %1 = load i32, ptr @cnt, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, ptr @cnt, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @defVar(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca %struct.args, align 8
  %12 = alloca %struct.String, align 8
  %13 = alloca [5 x i8], align 1
  %14 = alloca %struct.args, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = call i32 @strcmp(ptr noundef %15, ptr noundef @.str.90) #11
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %47

18:                                               ; preds = %4
  %19 = load ptr, ptr %8, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %47

21:                                               ; preds = %18
  %22 = load ptr, ptr %9, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = call ptr @search_scope(ptr noundef %22, ptr noundef %23)
  store ptr %24, ptr %10, align 8
  %25 = load ptr, ptr %10, align 8
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %31

27:                                               ; preds = %21
  %28 = load ptr, ptr @__stderrp, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %28, ptr noundef @.str.91, ptr noundef %29) #11
  call void @print_error(i32 noundef 3)
  br label %31

31:                                               ; preds = %27, %21
  %32 = load ptr, ptr %10, align 8
  %33 = getelementptr inbounds nuw %struct.item_var, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds nuw %struct.Variable, ptr %34, i32 0, i32 6
  %36 = load i8, ptr %35, align 1
  %37 = trunc i8 %36 to i1
  br i1 %37, label %38, label %42

38:                                               ; preds = %31
  %39 = load ptr, ptr %7, align 8
  %40 = load ptr, ptr %8, align 8
  %41 = call ptr @addFramePrefix(ptr noundef %39, ptr noundef %40)
  store ptr %41, ptr %5, align 8
  br label %70

42:                                               ; preds = %31
  %43 = load ptr, ptr %10, align 8
  %44 = getelementptr inbounds nuw %struct.item_var, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds nuw %struct.Variable, ptr %45, i32 0, i32 6
  store i8 1, ptr %46, align 1
  br label %47

47:                                               ; preds = %42, %18, %4
  %48 = load ptr, ptr %8, align 8
  %49 = icmp eq ptr %48, null
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load ptr, ptr @__stderrp, align 8
  %52 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %51, ptr noundef @.str.92) #11
  call void @print_error(i32 noundef 99)
  br label %53

53:                                               ; preds = %50, %47
  call void @string_init(ptr noundef %12)
  %54 = load ptr, ptr %7, align 8
  call void @string_concat(ptr noundef %12, ptr noundef %54)
  call void @string_concat(ptr noundef %12, ptr noundef @.str.93)
  %55 = load ptr, ptr %8, align 8
  call void @string_concat(ptr noundef %12, ptr noundef %55)
  %56 = load i32, ptr @cnt, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %53
  %59 = getelementptr inbounds [5 x i8], ptr %13, i64 0, i64 0
  %60 = call i32 @counter()
  %61 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %59, i32 noundef 0, i64 noundef 5, ptr noundef @.str.94, i32 noundef %60)
  %62 = getelementptr inbounds [5 x i8], ptr %13, i64 0, i64 0
  call void @string_concat(ptr noundef %12, ptr noundef %62)
  br label %63

63:                                               ; preds = %58, %53
  %64 = call ptr @string_token_to_string(ptr noundef %12)
  %65 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 1
  store ptr %64, ptr %65, align 8
  %66 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 0
  store i32 4, ptr %66, align 8
  %67 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %11, i64 48, i1 false)
  call void @generate_code(ptr noundef %67, ptr dead_on_return noundef %14)
  %68 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %5, align 8
  br label %70

70:                                               ; preds = %63, %38
  %71 = load ptr, ptr %5, align 8
  ret ptr %71
}

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @addFramePrefix(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.String, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  call void @string_init(ptr noundef %5)
  %6 = load ptr, ptr %3, align 8
  call void @string_concat(ptr noundef %5, ptr noundef %6)
  call void @string_concat(ptr noundef %5, ptr noundef @.str.93)
  %7 = load ptr, ptr %4, align 8
  call void @string_concat(ptr noundef %5, ptr noundef %7)
  %8 = call ptr @string_token_to_string(ptr noundef %5)
  ret ptr %8
}

declare i32 @__sprintf_chk(ptr noundef, i32 noundef, i64 noundef, ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @stringToIFJstring(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.String, align 8
  %5 = alloca [5 x i8], align 1
  store ptr %0, ptr %3, align 8
  call void @string_init(ptr noundef %4)
  call void @string_concat(ptr noundef %4, ptr noundef @.str.95)
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = call ptr @string_token_to_string(ptr noundef %4)
  store ptr %9, ptr %2, align 8
  br label %69

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %62, %53, %27, %10
  %12 = load ptr, ptr %3, align 8
  %13 = load i8, ptr %12, align 1
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %67

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 92
  br i1 %19, label %20, label %33

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 1
  store ptr %22, ptr %3, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 110
  br i1 %26, label %27, label %30

27:                                               ; preds = %20
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 1
  store ptr %29, ptr %3, align 8
  call void @string_concat(ptr noundef %4, ptr noundef @.str.96)
  br label %11, !llvm.loop !9

30:                                               ; preds = %20
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds i8, ptr %31, i32 -1
  store ptr %32, ptr %3, align 8
  br label %33

33:                                               ; preds = %30, %15
  %34 = load ptr, ptr %3, align 8
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %43

38:                                               ; preds = %33
  %39 = load ptr, ptr %3, align 8
  %40 = load i8, ptr %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp sle i32 %41, 32
  br i1 %42, label %53, label %43

43:                                               ; preds = %38, %33
  %44 = load ptr, ptr %3, align 8
  %45 = load i8, ptr %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 35
  br i1 %47, label %53, label %48

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 92
  br i1 %52, label %53, label %62

53:                                               ; preds = %48, %43, %38
  %54 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %55 = load ptr, ptr %3, align 8
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %54, i32 noundef 0, i64 noundef 5, ptr noundef @.str.97, i32 noundef %57)
  %59 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  call void @string_concat(ptr noundef %4, ptr noundef %59)
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds nuw i8, ptr %60, i32 1
  store ptr %61, ptr %3, align 8
  br label %11, !llvm.loop !9

62:                                               ; preds = %48
  %63 = load ptr, ptr %3, align 8
  %64 = load i8, ptr %63, align 1
  call void @string_append(ptr noundef %4, i8 noundef signext %64)
  %65 = load ptr, ptr %3, align 8
  %66 = getelementptr inbounds nuw i8, ptr %65, i32 1
  store ptr %66, ptr %3, align 8
  br label %11, !llvm.loop !9

67:                                               ; preds = %11
  %68 = call ptr @string_token_to_string(ptr noundef %4)
  store ptr %68, ptr %2, align 8
  br label %69

69:                                               ; preds = %67, %8
  %70 = load ptr, ptr %2, align 8
  ret ptr %70
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @numberToIFJstring(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.String, align 8
  %6 = alloca [50 x i8], align 1
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  call void @string_init(ptr noundef %5)
  %7 = load i32, ptr %4, align 4
  switch i32 %7, label %19 [
    i32 0, label %8
    i32 1, label %10
  ]

8:                                                ; preds = %2
  call void @string_concat(ptr noundef %5, ptr noundef @.str.98)
  %9 = load ptr, ptr %3, align 8
  call void @string_concat(ptr noundef %5, ptr noundef %9)
  br label %23

10:                                               ; preds = %2
  call void @string_concat(ptr noundef %5, ptr noundef @.str.99)
  %11 = load ptr, ptr @__stderrp, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.100, ptr noundef %12) #11
  %14 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %15 = load ptr, ptr %3, align 8
  %16 = call double @atof(ptr noundef %15)
  %17 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %14, i32 noundef 0, i64 noundef 50, ptr noundef @.str.101, double noundef %16)
  %18 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  call void @string_concat(ptr noundef %5, ptr noundef %18)
  br label %23

19:                                               ; preds = %2
  %20 = load ptr, ptr @__stderrp, align 8
  %21 = load i32, ptr %4, align 4
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.102, i32 noundef %21) #11
  call void @print_error(i32 noundef 99)
  br label %23

23:                                               ; preds = %19, %10, %8
  %24 = call ptr @string_token_to_string(ptr noundef %5)
  ret ptr %24
}

declare double @atof(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @getLabel(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.String, align 8
  %4 = alloca [5 x i8], align 1
  store ptr %0, ptr %2, align 8
  call void @string_init(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  call void @string_concat(ptr noundef %3, ptr noundef %5)
  %6 = getelementptr inbounds [5 x i8], ptr %4, i64 0, i64 0
  %7 = call i32 @counter()
  %8 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %6, i32 noundef 0, i64 noundef 5, ptr noundef @.str.94, i32 noundef %7)
  %9 = getelementptr inbounds [5 x i8], ptr %4, i64 0, i64 0
  call void @string_concat(ptr noundef %3, ptr noundef %9)
  %10 = call ptr @string_token_to_string(ptr noundef %3)
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @print_error(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  switch i32 %3, label %40 [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %19
    i32 6, label %22
    i32 7, label %25
    i32 8, label %28
    i32 9, label %31
    i32 10, label %34
    i32 99, label %37
  ]

4:                                                ; preds = %1
  %5 = load ptr, ptr @__stderrp, align 8
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.103) #11
  br label %43

7:                                                ; preds = %1
  %8 = load ptr, ptr @__stderrp, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.1.104) #11
  br label %43

10:                                               ; preds = %1
  %11 = load ptr, ptr @__stderrp, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.2.105) #11
  br label %43

13:                                               ; preds = %1
  %14 = load ptr, ptr @__stderrp, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.3.106) #11
  br label %43

16:                                               ; preds = %1
  %17 = load ptr, ptr @__stderrp, align 8
  %18 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef @.str.4.107) #11
  br label %43

19:                                               ; preds = %1
  %20 = load ptr, ptr @__stderrp, align 8
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.5.108) #11
  br label %43

22:                                               ; preds = %1
  %23 = load ptr, ptr @__stderrp, align 8
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.6.109) #11
  br label %43

25:                                               ; preds = %1
  %26 = load ptr, ptr @__stderrp, align 8
  %27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.7.110) #11
  br label %43

28:                                               ; preds = %1
  %29 = load ptr, ptr @__stderrp, align 8
  %30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %29, ptr noundef @.str.8.111) #11
  br label %43

31:                                               ; preds = %1
  %32 = load ptr, ptr @__stderrp, align 8
  %33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.9.112) #11
  br label %43

34:                                               ; preds = %1
  %35 = load ptr, ptr @__stderrp, align 8
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.10.113) #11
  br label %43

37:                                               ; preds = %1
  %38 = load ptr, ptr @__stderrp, align 8
  %39 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.11.114) #11
  br label %43

40:                                               ; preds = %1
  %41 = load ptr, ptr @__stderrp, align 8
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.12.115) #11
  br label %43

43:                                               ; preds = %40, %37, %34, %31, %28, %25, %22, %19, %16, %13, %10, %7, %4
  %44 = load i32, ptr %2, align 4
  call void @exit(i32 noundef %44) #12
  unreachable
}

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @init_data(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds nuw %struct.TrackValues, ptr %11, i32 0, i32 0
  store i32 -1, ptr %12, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds nuw %struct.TrackValues, ptr %13, i32 0, i32 1
  store i32 0, ptr %14, align 4
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 2
  store i8 1, ptr %16, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds nuw %struct.TrackValues, ptr %17, i32 0, i32 3
  store i8 0, ptr %18, align 1
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds nuw %struct.TrackValues, ptr %19, i32 0, i32 4
  store i32 0, ptr %20, align 4
  %21 = load ptr, ptr %8, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds nuw %struct.TrackValues, ptr %22, i32 0, i32 5
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds nuw %struct.TrackValues, ptr %24, i32 0, i32 7
  store i8 0, ptr %25, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds nuw %struct.TrackValues, ptr %27, i32 0, i32 8
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %10, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds nuw %struct.TrackValues, ptr %30, i32 0, i32 9
  store ptr %29, ptr %31, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds nuw %struct.TrackValues, ptr %32, i32 0, i32 6
  %34 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 2
  store ptr null, ptr %34, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds nuw %struct.TrackValues, ptr %35, i32 0, i32 6
  %37 = getelementptr inbounds nuw %struct.args, ptr %36, i32 0, i32 3
  store ptr null, ptr %37, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds nuw %struct.TrackValues, ptr %38, i32 0, i32 6
  %40 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 1
  store ptr null, ptr %40, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds nuw %struct.TrackValues, ptr %41, i32 0, i32 6
  %43 = getelementptr inbounds nuw %struct.args, ptr %42, i32 0, i32 5
  store ptr null, ptr %43, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @searchID(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr @__stderrp, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.116, ptr noundef %11) #11
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.TrackValues, ptr %13, i32 0, i32 9
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %37

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.TrackValues, ptr %18, i32 0, i32 9
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = call ptr @global_search(ptr noundef %20, ptr noundef %21)
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %33

25:                                               ; preds = %17
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds nuw %struct.item_var, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds nuw %struct.Function, ptr %28, i32 0, i32 4
  %30 = load i32, ptr %29, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.TrackValues, ptr %31, i32 0, i32 0
  store i32 %30, ptr %32, align 8
  store i32 1, ptr %4, align 4
  br label %83

33:                                               ; preds = %17
  %34 = load ptr, ptr @__stderrp, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %34, ptr noundef @.str.1.117, ptr noundef %35) #11
  br label %37

37:                                               ; preds = %33, %3
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds nuw %struct.TrackValues, ptr %38, i32 0, i32 8
  %40 = load ptr, ptr %39, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %82

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds nuw %struct.TrackValues, ptr %43, i32 0, i32 8
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr %6, align 8
  %47 = call ptr @search_scope(ptr noundef %45, ptr noundef %46)
  store ptr %47, ptr %9, align 8
  %48 = load ptr, ptr %9, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %78

50:                                               ; preds = %42
  %51 = load ptr, ptr %9, align 8
  %52 = getelementptr inbounds nuw %struct.item_var, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds nuw %struct.Variable, ptr %53, i32 0, i32 3
  %55 = load i8, ptr %54, align 8
  %56 = trunc i8 %55 to i1
  br i1 %56, label %57, label %58

57:                                               ; preds = %50
  store i32 2, ptr %4, align 4
  br label %83

58:                                               ; preds = %50
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds nuw %struct.TrackValues, ptr %59, i32 0, i32 7
  %61 = load i8, ptr %60, align 8
  %62 = trunc i8 %61 to i1
  br i1 %62, label %71, label %63

63:                                               ; preds = %58
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds nuw %struct.item_var, ptr %64, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds nuw %struct.Variable, ptr %66, i32 0, i32 5
  store i8 1, ptr %67, align 2
  %68 = load ptr, ptr @__stderrp, align 8
  %69 = load ptr, ptr %6, align 8
  %70 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %68, ptr noundef @.str.2.118, ptr noundef %69) #11
  br label %71

71:                                               ; preds = %63, %58
  %72 = load ptr, ptr %9, align 8
  %73 = getelementptr inbounds nuw %struct.item_var, ptr %72, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds nuw %struct.Variable, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 8
  %77 = load ptr, ptr %7, align 8
  store i32 %76, ptr %77, align 4
  store i32 0, ptr %4, align 4
  br label %83

78:                                               ; preds = %42
  %79 = load ptr, ptr @__stderrp, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %79, ptr noundef @.str.3.119, ptr noundef %80) #11
  br label %82

82:                                               ; preds = %78, %37
  store i32 3, ptr %4, align 4
  br label %83

83:                                               ; preds = %82, %71, %57, %25
  %84 = load i32, ptr %4, align 4
  ret i32 %84
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @isRootIFJfunction(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca %struct.args, align 8
  %11 = alloca %struct.args, align 8
  %12 = alloca %struct.args, align 8
  %13 = alloca %struct.args, align 8
  %14 = alloca %struct.args, align 8
  %15 = alloca %struct.args, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %4
  br label %126

19:                                               ; preds = %4
  store i8 1, ptr %9, align 1
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.ast, ptr %20, i32 0, i32 1
  %22 = getelementptr inbounds nuw %struct.Token, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  switch i32 %23, label %104 [
    i32 47, label %24
    i32 48, label %40
    i32 49, label %56
    i32 51, label %72
    i32 52, label %76
    i32 54, label %80
    i32 53, label %84
    i32 59, label %88
    i32 55, label %91
    i32 57, label %91
    i32 58, label %95
    i32 56, label %99
    i32 50, label %103
  ]

24:                                               ; preds = %19
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds nuw %struct.TrackValues, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 0
  store i32 40, ptr %28, align 8
  %29 = getelementptr i8, ptr %10, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %29, i8 0, i64 4, i1 false)
  %30 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 1
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr inbounds nuw %struct.TrackValues, ptr %31, i32 0, i32 5
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %30, align 8
  %34 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 2
  store ptr null, ptr %34, align 8
  %35 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 3
  store ptr null, ptr %35, align 8
  %36 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 4
  store i32 2, ptr %36, align 8
  %37 = getelementptr i8, ptr %10, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %37, i8 0, i64 4, i1 false)
  %38 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 5
  store ptr null, ptr %38, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %10, i64 48, i1 false)
  call void @generate_code(ptr noundef %27, ptr dead_on_return noundef %11)
  %39 = load ptr, ptr %8, align 8
  store i32 2, ptr %39, align 4
  br label %105

40:                                               ; preds = %19
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds nuw %struct.TrackValues, ptr %41, i32 0, i32 0
  store i32 0, ptr %42, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 0
  store i32 40, ptr %44, align 8
  %45 = getelementptr i8, ptr %12, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %45, i8 0, i64 4, i1 false)
  %46 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 1
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.TrackValues, ptr %47, i32 0, i32 5
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %46, align 8
  %50 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 2
  store ptr null, ptr %50, align 8
  %51 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 3
  store ptr null, ptr %51, align 8
  %52 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 4
  store i32 0, ptr %52, align 8
  %53 = getelementptr i8, ptr %12, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %53, i8 0, i64 4, i1 false)
  %54 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 5
  store ptr null, ptr %54, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 48, i1 false)
  call void @generate_code(ptr noundef %43, ptr dead_on_return noundef %13)
  %55 = load ptr, ptr %8, align 8
  store i32 0, ptr %55, align 4
  br label %105

56:                                               ; preds = %19
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds nuw %struct.TrackValues, ptr %57, i32 0, i32 0
  store i32 0, ptr %58, align 8
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 0
  store i32 40, ptr %60, align 8
  %61 = getelementptr i8, ptr %14, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %61, i8 0, i64 4, i1 false)
  %62 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 1
  %63 = load ptr, ptr %7, align 8
  %64 = getelementptr inbounds nuw %struct.TrackValues, ptr %63, i32 0, i32 5
  %65 = load ptr, ptr %64, align 8
  store ptr %65, ptr %62, align 8
  %66 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 2
  store ptr null, ptr %66, align 8
  %67 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 3
  store ptr null, ptr %67, align 8
  %68 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 4
  store i32 1, ptr %68, align 8
  %69 = getelementptr i8, ptr %14, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %69, i8 0, i64 4, i1 false)
  %70 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 5
  store ptr null, ptr %70, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %14, i64 48, i1 false)
  call void @generate_code(ptr noundef %59, ptr dead_on_return noundef %15)
  %71 = load ptr, ptr %8, align 8
  store i32 1, ptr %71, align 4
  br label %105

72:                                               ; preds = %19
  %73 = load ptr, ptr %7, align 8
  %74 = getelementptr inbounds nuw %struct.TrackValues, ptr %73, i32 0, i32 0
  store i32 1, ptr %74, align 8
  %75 = load ptr, ptr %8, align 8
  store i32 1, ptr %75, align 4
  br label %105

76:                                               ; preds = %19
  %77 = load ptr, ptr %7, align 8
  %78 = getelementptr inbounds nuw %struct.TrackValues, ptr %77, i32 0, i32 0
  store i32 1, ptr %78, align 8
  %79 = load ptr, ptr %8, align 8
  store i32 0, ptr %79, align 4
  br label %105

80:                                               ; preds = %19
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds nuw %struct.TrackValues, ptr %81, i32 0, i32 0
  store i32 1, ptr %82, align 8
  %83 = load ptr, ptr %8, align 8
  store i32 0, ptr %83, align 4
  br label %105

84:                                               ; preds = %19
  %85 = load ptr, ptr %7, align 8
  %86 = getelementptr inbounds nuw %struct.TrackValues, ptr %85, i32 0, i32 0
  store i32 1, ptr %86, align 8
  %87 = load ptr, ptr %8, align 8
  store i32 2, ptr %87, align 4
  br label %105

88:                                               ; preds = %19
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds nuw %struct.TrackValues, ptr %89, i32 0, i32 0
  store i32 1, ptr %90, align 8
  br label %105

91:                                               ; preds = %19, %19
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr inbounds nuw %struct.TrackValues, ptr %92, i32 0, i32 0
  store i32 2, ptr %93, align 8
  %94 = load ptr, ptr %8, align 8
  store i32 0, ptr %94, align 4
  br label %105

95:                                               ; preds = %19
  %96 = load ptr, ptr %7, align 8
  %97 = getelementptr inbounds nuw %struct.TrackValues, ptr %96, i32 0, i32 0
  store i32 2, ptr %97, align 8
  %98 = load ptr, ptr %8, align 8
  store i32 0, ptr %98, align 4
  br label %105

99:                                               ; preds = %19
  %100 = load ptr, ptr %7, align 8
  %101 = getelementptr inbounds nuw %struct.TrackValues, ptr %100, i32 0, i32 0
  store i32 3, ptr %101, align 8
  %102 = load ptr, ptr %8, align 8
  store i32 2, ptr %102, align 4
  br label %105

103:                                              ; preds = %19
  call void @print_error(i32 noundef 1)
  br label %105

104:                                              ; preds = %19
  store i8 0, ptr %9, align 1
  br label %105

105:                                              ; preds = %104, %103, %99, %95, %91, %88, %84, %80, %76, %72, %56, %40, %24
  %106 = load i8, ptr %9, align 1
  %107 = trunc i8 %106 to i1
  br i1 %107, label %108, label %126

108:                                              ; preds = %105
  %109 = load ptr, ptr %5, align 8
  %110 = getelementptr inbounds nuw %struct.ast, ptr %109, i32 0, i32 1
  %111 = getelementptr inbounds nuw %struct.Token, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = load ptr, ptr %7, align 8
  %114 = getelementptr inbounds nuw %struct.TrackValues, ptr %113, i32 0, i32 4
  store i32 %112, ptr %114, align 4
  %115 = load ptr, ptr %7, align 8
  %116 = getelementptr inbounds nuw %struct.TrackValues, ptr %115, i32 0, i32 3
  store i8 1, ptr %116, align 1
  %117 = load ptr, ptr %7, align 8
  %118 = getelementptr inbounds nuw %struct.TrackValues, ptr %117, i32 0, i32 2
  store i8 0, ptr %118, align 8
  %119 = load ptr, ptr @__stderrp, align 8
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds nuw %struct.ast, ptr %120, i32 0, i32 1
  %122 = getelementptr inbounds nuw %struct.Token, ptr %121, i32 0, i32 0
  %123 = load i32, ptr %122, align 8
  %124 = call ptr @getTypeTokenSymbol(i32 noundef %123)
  %125 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %119, ptr noundef @.str.4.120, ptr noundef %124) #11
  br label %126

126:                                              ; preds = %108, %105, %18
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @addArgsToIFJFunction(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca %struct.args, align 8
  %12 = alloca %struct.args, align 8
  %13 = alloca %struct.args, align 8
  %14 = alloca %struct.args, align 8
  %15 = alloca %struct.args, align 8
  %16 = alloca %struct.args, align 8
  %17 = alloca %struct.args, align 8
  %18 = alloca %struct.args, align 8
  %19 = alloca %struct.args, align 8
  %20 = alloca %struct.args, align 8
  %21 = alloca %struct.args, align 8
  %22 = alloca ptr, align 8
  %23 = alloca %struct.args, align 8
  %24 = alloca %struct.args, align 8
  %25 = alloca %struct.args, align 8
  %26 = alloca %struct.args, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca %struct.args, align 8
  %34 = alloca %struct.args, align 8
  %35 = alloca %struct.args, align 8
  %36 = alloca %struct.args, align 8
  %37 = alloca %struct.args, align 8
  %38 = alloca %struct.args, align 8
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca %struct.args, align 8
  %45 = alloca %struct.args, align 8
  %46 = alloca %struct.args, align 8
  %47 = alloca %struct.args, align 8
  %48 = alloca %struct.args, align 8
  %49 = alloca %struct.args, align 8
  %50 = alloca %struct.args, align 8
  %51 = alloca %struct.args, align 8
  %52 = alloca %struct.args, align 8
  %53 = alloca %struct.args, align 8
  %54 = alloca %struct.args, align 8
  %55 = alloca %struct.args, align 8
  %56 = alloca %struct.args, align 8
  %57 = alloca %struct.args, align 8
  %58 = alloca %struct.args, align 8
  %59 = alloca %struct.args, align 8
  %60 = alloca %struct.args, align 8
  %61 = alloca %struct.args, align 8
  %62 = alloca %struct.args, align 8
  %63 = alloca %struct.args, align 8
  %64 = alloca %struct.args, align 8
  %65 = alloca %struct.args, align 8
  %66 = alloca %struct.args, align 8
  %67 = alloca %struct.args, align 8
  %68 = alloca %struct.args, align 8
  %69 = alloca %struct.args, align 8
  %70 = alloca %struct.args, align 8
  %71 = alloca %struct.args, align 8
  %72 = alloca %struct.args, align 8
  %73 = alloca %struct.args, align 8
  %74 = alloca %struct.args, align 8
  %75 = alloca %struct.args, align 8
  %76 = alloca %struct.args, align 8
  %77 = alloca %struct.args, align 8
  %78 = alloca %struct.args, align 8
  %79 = alloca %struct.args, align 8
  %80 = alloca ptr, align 8
  %81 = alloca %struct.args, align 8
  %82 = alloca %struct.args, align 8
  %83 = alloca %struct.args, align 8
  %84 = alloca %struct.args, align 8
  %85 = alloca ptr, align 8
  %86 = alloca ptr, align 8
  %87 = alloca ptr, align 8
  %88 = alloca ptr, align 8
  %89 = alloca ptr, align 8
  %90 = alloca ptr, align 8
  %91 = alloca %struct.args, align 8
  %92 = alloca %struct.args, align 8
  %93 = alloca %struct.args, align 8
  %94 = alloca %struct.args, align 8
  %95 = alloca %struct.args, align 8
  %96 = alloca %struct.args, align 8
  %97 = alloca %struct.args, align 8
  %98 = alloca %struct.args, align 8
  %99 = alloca ptr, align 8
  %100 = alloca ptr, align 8
  %101 = alloca ptr, align 8
  %102 = alloca %struct.args, align 8
  %103 = alloca %struct.args, align 8
  %104 = alloca %struct.args, align 8
  %105 = alloca %struct.args, align 8
  %106 = alloca %struct.args, align 8
  %107 = alloca %struct.args, align 8
  %108 = alloca %struct.args, align 8
  %109 = alloca %struct.args, align 8
  %110 = alloca %struct.args, align 8
  %111 = alloca %struct.args, align 8
  %112 = alloca %struct.args, align 8
  %113 = alloca %struct.args, align 8
  %114 = alloca %struct.args, align 8
  %115 = alloca %struct.args, align 8
  %116 = alloca %struct.args, align 8
  %117 = alloca %struct.args, align 8
  %118 = alloca %struct.args, align 8
  %119 = alloca %struct.args, align 8
  %120 = alloca %struct.args, align 8
  %121 = alloca %struct.args, align 8
  %122 = alloca %struct.args, align 8
  %123 = alloca %struct.args, align 8
  %124 = alloca %struct.args, align 8
  %125 = alloca %struct.args, align 8
  %126 = alloca %struct.args, align 8
  %127 = alloca %struct.args, align 8
  %128 = alloca %struct.args, align 8
  %129 = alloca %struct.args, align 8
  %130 = alloca %struct.args, align 8
  %131 = alloca %struct.args, align 8
  %132 = alloca %struct.args, align 8
  %133 = alloca %struct.args, align 8
  %134 = alloca %struct.args, align 8
  %135 = alloca %struct.args, align 8
  %136 = alloca %struct.args, align 8
  %137 = alloca %struct.args, align 8
  %138 = alloca %struct.args, align 8
  %139 = alloca %struct.args, align 8
  %140 = alloca %struct.args, align 8
  %141 = alloca %struct.args, align 8
  %142 = alloca %struct.args, align 8
  %143 = alloca %struct.args, align 8
  %144 = alloca %struct.args, align 8
  %145 = alloca %struct.args, align 8
  %146 = alloca %struct.args, align 8
  %147 = alloca %struct.args, align 8
  %148 = alloca %struct.args, align 8
  %149 = alloca %struct.args, align 8
  %150 = alloca %struct.args, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %151 = load ptr, ptr @__stderrp, align 8
  %152 = load ptr, ptr %4, align 8
  %153 = getelementptr inbounds nuw %struct.Token, ptr %152, i32 0, i32 0
  %154 = load i32, ptr %153, align 8
  %155 = call ptr @getTypeTokenSymbol(i32 noundef %154)
  %156 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %151, ptr noundef @.str.5.121, ptr noundef %155) #11
  %157 = load ptr, ptr %4, align 8
  %158 = getelementptr inbounds nuw %struct.Token, ptr %157, i32 0, i32 0
  %159 = load i32, ptr %158, align 8
  store i32 %159, ptr %7, align 4
  %160 = load i32, ptr %7, align 4
  %161 = icmp eq i32 %160, 31
  br i1 %161, label %162, label %163

162:                                              ; preds = %3
  br label %1307

163:                                              ; preds = %3
  store i32 4, ptr %8, align 4
  %164 = load i32, ptr %7, align 4
  %165 = icmp eq i32 %164, 1
  br i1 %165, label %166, label %181

166:                                              ; preds = %163
  %167 = load ptr, ptr %5, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = getelementptr inbounds nuw %struct.Token, ptr %168, i32 0, i32 1
  %170 = load ptr, ptr %169, align 8
  %171 = call i32 @searchID(ptr noundef %167, ptr noundef %170, ptr noundef %8)
  store i32 %171, ptr %9, align 4
  %172 = load i32, ptr %9, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %180

174:                                              ; preds = %166
  %175 = load ptr, ptr @__stderrp, align 8
  %176 = load ptr, ptr %4, align 8
  %177 = getelementptr inbounds nuw %struct.Token, ptr %176, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  %179 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %175, ptr noundef @.str.6.122, ptr noundef %178) #11
  call void @print_error(i32 noundef 3)
  br label %180

180:                                              ; preds = %174, %166
  br label %181

181:                                              ; preds = %180, %163
  %182 = load ptr, ptr %4, align 8
  %183 = getelementptr inbounds nuw %struct.Token, ptr %182, i32 0, i32 1
  %184 = load ptr, ptr %183, align 8
  store ptr %184, ptr %10, align 8
  %185 = load ptr, ptr %5, align 8
  %186 = getelementptr inbounds nuw %struct.TrackValues, ptr %185, i32 0, i32 4
  %187 = load i32, ptr %186, align 4
  switch i32 %187, label %1304 [
    i32 47, label %188
    i32 48, label %188
    i32 49, label %188
    i32 51, label %193
    i32 52, label %230
    i32 54, label %271
    i32 53, label %301
    i32 59, label %336
    i32 55, label %372
    i32 57, label %445
    i32 56, label %793
    i32 58, label %1235
  ]

188:                                              ; preds = %181, %181, %181
  %189 = load ptr, ptr %5, align 8
  %190 = getelementptr inbounds nuw %struct.TrackValues, ptr %189, i32 0, i32 1
  %191 = load i32, ptr %190, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, ptr %190, align 4
  br label %1307

193:                                              ; preds = %181
  %194 = load i32, ptr %8, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %203

196:                                              ; preds = %193
  %197 = load i32, ptr %7, align 4
  %198 = icmp ne i32 %197, 3
  br i1 %198, label %199, label %203

199:                                              ; preds = %196
  %200 = load i32, ptr %7, align 4
  %201 = icmp ne i32 %200, 5
  br i1 %201, label %202, label %203

202:                                              ; preds = %199
  call void @print_error(i32 noundef 4)
  br label %203

203:                                              ; preds = %202, %199, %196, %193
  %204 = load ptr, ptr %6, align 8
  %205 = load ptr, ptr %5, align 8
  %206 = getelementptr inbounds nuw %struct.TrackValues, ptr %205, i32 0, i32 5
  %207 = load ptr, ptr %206, align 8
  %208 = load ptr, ptr %5, align 8
  %209 = getelementptr inbounds nuw %struct.TrackValues, ptr %208, i32 0, i32 8
  %210 = load ptr, ptr %209, align 8
  %211 = call ptr @defVar(ptr noundef %204, ptr noundef @.str.7.123, ptr noundef %207, ptr noundef %210)
  %212 = load ptr, ptr %6, align 8
  %213 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 0
  store i32 32, ptr %213, align 8
  %214 = getelementptr i8, ptr %11, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %214, i8 0, i64 4, i1 false)
  %215 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 1
  %216 = load ptr, ptr %5, align 8
  %217 = getelementptr inbounds nuw %struct.TrackValues, ptr %216, i32 0, i32 5
  %218 = load ptr, ptr %217, align 8
  store ptr %218, ptr %215, align 8
  %219 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 2
  %220 = load ptr, ptr %10, align 8
  %221 = call ptr @numberToIFJstring(ptr noundef %220, i32 noundef 0)
  store ptr %221, ptr %219, align 8
  %222 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 3
  store ptr null, ptr %222, align 8
  %223 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 4
  store i32 0, ptr %223, align 8
  %224 = getelementptr i8, ptr %11, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %224, i8 0, i64 4, i1 false)
  %225 = getelementptr inbounds nuw %struct.args, ptr %11, i32 0, i32 5
  store ptr null, ptr %225, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %11, i64 48, i1 false)
  call void @generate_code(ptr noundef %212, ptr dead_on_return noundef %12)
  %226 = load ptr, ptr %5, align 8
  %227 = getelementptr inbounds nuw %struct.TrackValues, ptr %226, i32 0, i32 1
  %228 = load i32, ptr %227, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, ptr %227, align 4
  br label %1307

230:                                              ; preds = %181
  %231 = load i32, ptr %8, align 4
  %232 = icmp ne i32 %231, 1
  br i1 %232, label %233, label %244

233:                                              ; preds = %230
  %234 = load i32, ptr %7, align 4
  %235 = icmp ne i32 %234, 4
  br i1 %235, label %236, label %244

236:                                              ; preds = %233
  %237 = load i32, ptr %7, align 4
  %238 = icmp ne i32 %237, 6
  br i1 %238, label %239, label %244

239:                                              ; preds = %236
  %240 = load ptr, ptr @__stderrp, align 8
  %241 = load i32, ptr %7, align 4
  %242 = call ptr @getTypeTokenSymbol(i32 noundef %241)
  %243 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %240, ptr noundef @.str.8.124, ptr noundef %242) #11
  call void @print_error(i32 noundef 4)
  br label %244

244:                                              ; preds = %239, %236, %233, %230
  %245 = load ptr, ptr %6, align 8
  %246 = load ptr, ptr %5, align 8
  %247 = getelementptr inbounds nuw %struct.TrackValues, ptr %246, i32 0, i32 5
  %248 = load ptr, ptr %247, align 8
  %249 = load ptr, ptr %5, align 8
  %250 = getelementptr inbounds nuw %struct.TrackValues, ptr %249, i32 0, i32 8
  %251 = load ptr, ptr %250, align 8
  %252 = call ptr @defVar(ptr noundef %245, ptr noundef @.str.7.123, ptr noundef %248, ptr noundef %251)
  %253 = load ptr, ptr %6, align 8
  %254 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 0
  store i32 33, ptr %254, align 8
  %255 = getelementptr i8, ptr %13, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %255, i8 0, i64 4, i1 false)
  %256 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 1
  %257 = load ptr, ptr %5, align 8
  %258 = getelementptr inbounds nuw %struct.TrackValues, ptr %257, i32 0, i32 5
  %259 = load ptr, ptr %258, align 8
  store ptr %259, ptr %256, align 8
  %260 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 2
  %261 = load ptr, ptr %10, align 8
  %262 = call ptr @numberToIFJstring(ptr noundef %261, i32 noundef 1)
  store ptr %262, ptr %260, align 8
  %263 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 3
  store ptr null, ptr %263, align 8
  %264 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 4
  store i32 0, ptr %264, align 8
  %265 = getelementptr i8, ptr %13, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %265, i8 0, i64 4, i1 false)
  %266 = getelementptr inbounds nuw %struct.args, ptr %13, i32 0, i32 5
  store ptr null, ptr %266, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %13, i64 48, i1 false)
  call void @generate_code(ptr noundef %253, ptr dead_on_return noundef %14)
  %267 = load ptr, ptr %5, align 8
  %268 = getelementptr inbounds nuw %struct.TrackValues, ptr %267, i32 0, i32 1
  %269 = load i32, ptr %268, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, ptr %268, align 4
  br label %1307

271:                                              ; preds = %181
  %272 = load i32, ptr %8, align 4
  %273 = icmp ne i32 %272, 2
  br i1 %273, label %274, label %275

274:                                              ; preds = %271
  call void @print_error(i32 noundef 4)
  br label %275

275:                                              ; preds = %274, %271
  %276 = load ptr, ptr %6, align 8
  %277 = load ptr, ptr %5, align 8
  %278 = getelementptr inbounds nuw %struct.TrackValues, ptr %277, i32 0, i32 5
  %279 = load ptr, ptr %278, align 8
  %280 = load ptr, ptr %5, align 8
  %281 = getelementptr inbounds nuw %struct.TrackValues, ptr %280, i32 0, i32 8
  %282 = load ptr, ptr %281, align 8
  %283 = call ptr @defVar(ptr noundef %276, ptr noundef @.str.7.123, ptr noundef %279, ptr noundef %282)
  %284 = load ptr, ptr %6, align 8
  %285 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 0
  store i32 43, ptr %285, align 8
  %286 = getelementptr i8, ptr %15, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %286, i8 0, i64 4, i1 false)
  %287 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 1
  %288 = load ptr, ptr %5, align 8
  %289 = getelementptr inbounds nuw %struct.TrackValues, ptr %288, i32 0, i32 5
  %290 = load ptr, ptr %289, align 8
  store ptr %290, ptr %287, align 8
  %291 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 2
  %292 = load ptr, ptr %10, align 8
  store ptr %292, ptr %291, align 8
  %293 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 3
  store ptr null, ptr %293, align 8
  %294 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 4
  store i32 0, ptr %294, align 8
  %295 = getelementptr i8, ptr %15, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %295, i8 0, i64 4, i1 false)
  %296 = getelementptr inbounds nuw %struct.args, ptr %15, i32 0, i32 5
  store ptr null, ptr %296, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 %15, i64 48, i1 false)
  call void @generate_code(ptr noundef %284, ptr dead_on_return noundef %16)
  %297 = load ptr, ptr %5, align 8
  %298 = getelementptr inbounds nuw %struct.TrackValues, ptr %297, i32 0, i32 1
  %299 = load i32, ptr %298, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, ptr %298, align 4
  br label %1307

301:                                              ; preds = %181
  %302 = load i32, ptr %8, align 4
  %303 = icmp ne i32 %302, 2
  br i1 %303, label %304, label %308

304:                                              ; preds = %301
  %305 = load i32, ptr %7, align 4
  %306 = icmp ne i32 %305, 7
  br i1 %306, label %307, label %308

307:                                              ; preds = %304
  call void @print_error(i32 noundef 4)
  br label %308

308:                                              ; preds = %307, %304, %301
  %309 = load ptr, ptr %6, align 8
  %310 = load ptr, ptr %5, align 8
  %311 = getelementptr inbounds nuw %struct.TrackValues, ptr %310, i32 0, i32 5
  %312 = load ptr, ptr %311, align 8
  %313 = load ptr, ptr %5, align 8
  %314 = getelementptr inbounds nuw %struct.TrackValues, ptr %313, i32 0, i32 8
  %315 = load ptr, ptr %314, align 8
  %316 = call ptr @defVar(ptr noundef %309, ptr noundef @.str.7.123, ptr noundef %312, ptr noundef %315)
  %317 = load ptr, ptr %6, align 8
  %318 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 0
  store i32 0, ptr %318, align 8
  %319 = getelementptr i8, ptr %17, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %319, i8 0, i64 4, i1 false)
  %320 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 1
  %321 = load ptr, ptr %5, align 8
  %322 = getelementptr inbounds nuw %struct.TrackValues, ptr %321, i32 0, i32 5
  %323 = load ptr, ptr %322, align 8
  %324 = call ptr @addFramePrefix(ptr noundef @.str.7.123, ptr noundef %323)
  store ptr %324, ptr %320, align 8
  %325 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 2
  %326 = load ptr, ptr %10, align 8
  %327 = call ptr @stringToIFJstring(ptr noundef %326)
  store ptr %327, ptr %325, align 8
  %328 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 3
  store ptr null, ptr %328, align 8
  %329 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 4
  store i32 0, ptr %329, align 8
  %330 = getelementptr i8, ptr %17, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %330, i8 0, i64 4, i1 false)
  %331 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 5
  store ptr null, ptr %331, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %18, ptr align 8 %17, i64 48, i1 false)
  call void @generate_code(ptr noundef %317, ptr dead_on_return noundef %18)
  %332 = load ptr, ptr %5, align 8
  %333 = getelementptr inbounds nuw %struct.TrackValues, ptr %332, i32 0, i32 1
  %334 = load i32, ptr %333, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, ptr %333, align 4
  br label %1307

336:                                              ; preds = %181
  %337 = load i32, ptr %8, align 4
  %338 = icmp ne i32 %337, 0
  br i1 %338, label %339, label %346

339:                                              ; preds = %336
  %340 = load i32, ptr %7, align 4
  %341 = icmp ne i32 %340, 3
  br i1 %341, label %342, label %346

342:                                              ; preds = %339
  %343 = load i32, ptr %7, align 4
  %344 = icmp ne i32 %343, 5
  br i1 %344, label %345, label %346

345:                                              ; preds = %342
  call void @print_error(i32 noundef 4)
  br label %346

346:                                              ; preds = %345, %342, %339, %336
  %347 = load ptr, ptr %6, align 8
  %348 = load ptr, ptr %5, align 8
  %349 = getelementptr inbounds nuw %struct.TrackValues, ptr %348, i32 0, i32 5
  %350 = load ptr, ptr %349, align 8
  %351 = load ptr, ptr %5, align 8
  %352 = getelementptr inbounds nuw %struct.TrackValues, ptr %351, i32 0, i32 8
  %353 = load ptr, ptr %352, align 8
  %354 = call ptr @defVar(ptr noundef %347, ptr noundef @.str.7.123, ptr noundef %350, ptr noundef %353)
  %355 = load ptr, ptr %6, align 8
  %356 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 0
  store i32 34, ptr %356, align 8
  %357 = getelementptr i8, ptr %19, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %357, i8 0, i64 4, i1 false)
  %358 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 1
  %359 = load ptr, ptr %5, align 8
  %360 = getelementptr inbounds nuw %struct.TrackValues, ptr %359, i32 0, i32 5
  %361 = load ptr, ptr %360, align 8
  store ptr %361, ptr %358, align 8
  %362 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 2
  %363 = load ptr, ptr %10, align 8
  store ptr %363, ptr %362, align 8
  %364 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 3
  store ptr null, ptr %364, align 8
  %365 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 4
  store i32 0, ptr %365, align 8
  %366 = getelementptr i8, ptr %19, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %366, i8 0, i64 4, i1 false)
  %367 = getelementptr inbounds nuw %struct.args, ptr %19, i32 0, i32 5
  store ptr null, ptr %367, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %20, ptr align 8 %19, i64 48, i1 false)
  call void @generate_code(ptr noundef %355, ptr dead_on_return noundef %20)
  %368 = load ptr, ptr %5, align 8
  %369 = getelementptr inbounds nuw %struct.TrackValues, ptr %368, i32 0, i32 1
  %370 = load i32, ptr %369, align 4
  %371 = add nsw i32 %370, 1
  store i32 %371, ptr %369, align 4
  br label %1307

372:                                              ; preds = %181
  %373 = load i32, ptr %8, align 4
  %374 = icmp ne i32 %373, 2
  br i1 %374, label %375, label %376

375:                                              ; preds = %372
  call void @print_error(i32 noundef 4)
  br label %376

376:                                              ; preds = %375, %372
  %377 = load ptr, ptr %5, align 8
  %378 = getelementptr inbounds nuw %struct.TrackValues, ptr %377, i32 0, i32 1
  %379 = load i32, ptr %378, align 4
  %380 = add nsw i32 %379, 1
  store i32 %380, ptr %378, align 4
  %381 = load ptr, ptr %5, align 8
  %382 = getelementptr inbounds nuw %struct.TrackValues, ptr %381, i32 0, i32 6
  %383 = getelementptr inbounds nuw %struct.args, ptr %382, i32 0, i32 3
  %384 = load ptr, ptr %383, align 8
  %385 = icmp eq ptr %384, null
  br i1 %385, label %386, label %391

386:                                              ; preds = %376
  %387 = load ptr, ptr %10, align 8
  %388 = load ptr, ptr %5, align 8
  %389 = getelementptr inbounds nuw %struct.TrackValues, ptr %388, i32 0, i32 6
  %390 = getelementptr inbounds nuw %struct.args, ptr %389, i32 0, i32 3
  store ptr %387, ptr %390, align 8
  br label %1307

391:                                              ; preds = %376
  %392 = load ptr, ptr %10, align 8
  %393 = load ptr, ptr %5, align 8
  %394 = getelementptr inbounds nuw %struct.TrackValues, ptr %393, i32 0, i32 6
  %395 = getelementptr inbounds nuw %struct.args, ptr %394, i32 0, i32 2
  store ptr %392, ptr %395, align 8
  %396 = load ptr, ptr %5, align 8
  %397 = getelementptr inbounds nuw %struct.TrackValues, ptr %396, i32 0, i32 6
  %398 = getelementptr inbounds nuw %struct.args, ptr %397, i32 0, i32 0
  store i32 42, ptr %398, align 8
  %399 = load ptr, ptr %5, align 8
  %400 = getelementptr inbounds nuw %struct.TrackValues, ptr %399, i32 0, i32 5
  %401 = load ptr, ptr %400, align 8
  %402 = load ptr, ptr %5, align 8
  %403 = getelementptr inbounds nuw %struct.TrackValues, ptr %402, i32 0, i32 6
  %404 = getelementptr inbounds nuw %struct.args, ptr %403, i32 0, i32 1
  store ptr %401, ptr %404, align 8
  %405 = load ptr, ptr %5, align 8
  %406 = getelementptr inbounds nuw %struct.TrackValues, ptr %405, i32 0, i32 6
  %407 = getelementptr inbounds nuw %struct.args, ptr %406, i32 0, i32 2
  %408 = load ptr, ptr %407, align 8
  %409 = icmp eq ptr %408, null
  br i1 %409, label %416, label %410

410:                                              ; preds = %391
  %411 = load ptr, ptr %5, align 8
  %412 = getelementptr inbounds nuw %struct.TrackValues, ptr %411, i32 0, i32 6
  %413 = getelementptr inbounds nuw %struct.args, ptr %412, i32 0, i32 3
  %414 = load ptr, ptr %413, align 8
  %415 = icmp eq ptr %414, null
  br i1 %415, label %416, label %417

416:                                              ; preds = %410, %391
  call void @print_error(i32 noundef 4)
  br label %417

417:                                              ; preds = %416, %410
  %418 = load ptr, ptr %5, align 8
  %419 = getelementptr inbounds nuw %struct.TrackValues, ptr %418, i32 0, i32 6
  %420 = getelementptr inbounds nuw %struct.args, ptr %419, i32 0, i32 2
  %421 = load ptr, ptr %420, align 8
  %422 = call ptr @stringToIFJstring(ptr noundef %421)
  %423 = load ptr, ptr %5, align 8
  %424 = getelementptr inbounds nuw %struct.TrackValues, ptr %423, i32 0, i32 6
  %425 = getelementptr inbounds nuw %struct.args, ptr %424, i32 0, i32 2
  store ptr %422, ptr %425, align 8
  %426 = load ptr, ptr %5, align 8
  %427 = getelementptr inbounds nuw %struct.TrackValues, ptr %426, i32 0, i32 6
  %428 = getelementptr inbounds nuw %struct.args, ptr %427, i32 0, i32 3
  %429 = load ptr, ptr %428, align 8
  %430 = call ptr @stringToIFJstring(ptr noundef %429)
  %431 = load ptr, ptr %5, align 8
  %432 = getelementptr inbounds nuw %struct.TrackValues, ptr %431, i32 0, i32 6
  %433 = getelementptr inbounds nuw %struct.args, ptr %432, i32 0, i32 3
  store ptr %430, ptr %433, align 8
  %434 = load ptr, ptr %6, align 8
  %435 = load ptr, ptr %5, align 8
  %436 = getelementptr inbounds nuw %struct.TrackValues, ptr %435, i32 0, i32 5
  %437 = load ptr, ptr %436, align 8
  %438 = load ptr, ptr %5, align 8
  %439 = getelementptr inbounds nuw %struct.TrackValues, ptr %438, i32 0, i32 8
  %440 = load ptr, ptr %439, align 8
  %441 = call ptr @defVar(ptr noundef %434, ptr noundef @.str.7.123, ptr noundef %437, ptr noundef %440)
  %442 = load ptr, ptr %6, align 8
  %443 = load ptr, ptr %5, align 8
  %444 = getelementptr inbounds nuw %struct.TrackValues, ptr %443, i32 0, i32 6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %21, ptr align 8 %444, i64 48, i1 false)
  call void @generate_code(ptr noundef %442, ptr dead_on_return noundef %21)
  br label %1307

445:                                              ; preds = %181
  %446 = load i32, ptr %8, align 4
  %447 = icmp ne i32 %446, 2
  br i1 %447, label %448, label %449

448:                                              ; preds = %445
  call void @print_error(i32 noundef 4)
  br label %449

449:                                              ; preds = %448, %445
  %450 = load ptr, ptr %5, align 8
  %451 = getelementptr inbounds nuw %struct.TrackValues, ptr %450, i32 0, i32 1
  %452 = load i32, ptr %451, align 4
  %453 = add nsw i32 %452, 1
  store i32 %453, ptr %451, align 4
  %454 = load ptr, ptr %5, align 8
  %455 = getelementptr inbounds nuw %struct.TrackValues, ptr %454, i32 0, i32 6
  %456 = getelementptr inbounds nuw %struct.args, ptr %455, i32 0, i32 3
  %457 = load ptr, ptr %456, align 8
  %458 = icmp eq ptr %457, null
  br i1 %458, label %459, label %464

459:                                              ; preds = %449
  %460 = load ptr, ptr %10, align 8
  %461 = load ptr, ptr %5, align 8
  %462 = getelementptr inbounds nuw %struct.TrackValues, ptr %461, i32 0, i32 6
  %463 = getelementptr inbounds nuw %struct.args, ptr %462, i32 0, i32 3
  store ptr %460, ptr %463, align 8
  br label %1307

464:                                              ; preds = %449
  %465 = load ptr, ptr %10, align 8
  %466 = load ptr, ptr %5, align 8
  %467 = getelementptr inbounds nuw %struct.TrackValues, ptr %466, i32 0, i32 6
  %468 = getelementptr inbounds nuw %struct.args, ptr %467, i32 0, i32 2
  store ptr %465, ptr %468, align 8
  %469 = load ptr, ptr %5, align 8
  %470 = getelementptr inbounds nuw %struct.TrackValues, ptr %469, i32 0, i32 6
  %471 = getelementptr inbounds nuw %struct.args, ptr %470, i32 0, i32 0
  store i32 42, ptr %471, align 8
  %472 = load ptr, ptr %5, align 8
  %473 = getelementptr inbounds nuw %struct.TrackValues, ptr %472, i32 0, i32 5
  %474 = load ptr, ptr %473, align 8
  %475 = load ptr, ptr %5, align 8
  %476 = getelementptr inbounds nuw %struct.TrackValues, ptr %475, i32 0, i32 6
  %477 = getelementptr inbounds nuw %struct.args, ptr %476, i32 0, i32 1
  store ptr %474, ptr %477, align 8
  %478 = load ptr, ptr %5, align 8
  %479 = getelementptr inbounds nuw %struct.TrackValues, ptr %478, i32 0, i32 6
  %480 = getelementptr inbounds nuw %struct.args, ptr %479, i32 0, i32 2
  %481 = load ptr, ptr %480, align 8
  %482 = icmp eq ptr %481, null
  br i1 %482, label %489, label %483

483:                                              ; preds = %464
  %484 = load ptr, ptr %5, align 8
  %485 = getelementptr inbounds nuw %struct.TrackValues, ptr %484, i32 0, i32 6
  %486 = getelementptr inbounds nuw %struct.args, ptr %485, i32 0, i32 3
  %487 = load ptr, ptr %486, align 8
  %488 = icmp eq ptr %487, null
  br i1 %488, label %489, label %490

489:                                              ; preds = %483, %464
  call void @print_error(i32 noundef 4)
  br label %490

490:                                              ; preds = %489, %483
  %491 = load ptr, ptr %5, align 8
  %492 = getelementptr inbounds nuw %struct.TrackValues, ptr %491, i32 0, i32 6
  %493 = getelementptr inbounds nuw %struct.args, ptr %492, i32 0, i32 2
  %494 = load ptr, ptr %493, align 8
  %495 = call ptr @addFramePrefix(ptr noundef @.str.7.123, ptr noundef %494)
  %496 = load ptr, ptr %5, align 8
  %497 = getelementptr inbounds nuw %struct.TrackValues, ptr %496, i32 0, i32 6
  %498 = getelementptr inbounds nuw %struct.args, ptr %497, i32 0, i32 2
  store ptr %495, ptr %498, align 8
  %499 = load ptr, ptr %5, align 8
  %500 = getelementptr inbounds nuw %struct.TrackValues, ptr %499, i32 0, i32 6
  %501 = getelementptr inbounds nuw %struct.args, ptr %500, i32 0, i32 3
  %502 = load ptr, ptr %501, align 8
  %503 = call ptr @addFramePrefix(ptr noundef @.str.7.123, ptr noundef %502)
  %504 = load ptr, ptr %5, align 8
  %505 = getelementptr inbounds nuw %struct.TrackValues, ptr %504, i32 0, i32 6
  %506 = getelementptr inbounds nuw %struct.args, ptr %505, i32 0, i32 3
  store ptr %503, ptr %506, align 8
  %507 = load ptr, ptr %6, align 8
  %508 = load ptr, ptr %5, align 8
  %509 = getelementptr inbounds nuw %struct.TrackValues, ptr %508, i32 0, i32 5
  %510 = load ptr, ptr %509, align 8
  %511 = load ptr, ptr %5, align 8
  %512 = getelementptr inbounds nuw %struct.TrackValues, ptr %511, i32 0, i32 8
  %513 = load ptr, ptr %512, align 8
  %514 = call ptr @defVar(ptr noundef %507, ptr noundef @.str.7.123, ptr noundef %510, ptr noundef %513)
  store ptr %514, ptr %22, align 8
  %515 = load ptr, ptr %6, align 8
  %516 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 0
  store i32 0, ptr %516, align 8
  %517 = getelementptr i8, ptr %23, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %517, i8 0, i64 4, i1 false)
  %518 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 1
  %519 = load ptr, ptr %22, align 8
  store ptr %519, ptr %518, align 8
  %520 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 2
  %521 = call ptr @numberToIFJstring(ptr noundef @.str.9.125, i32 noundef 0)
  store ptr %521, ptr %520, align 8
  %522 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 3
  store ptr null, ptr %522, align 8
  %523 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 4
  store i32 0, ptr %523, align 8
  %524 = getelementptr i8, ptr %23, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %524, i8 0, i64 4, i1 false)
  %525 = getelementptr inbounds nuw %struct.args, ptr %23, i32 0, i32 5
  store ptr null, ptr %525, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %23, i64 48, i1 false)
  call void @generate_code(ptr noundef %515, ptr dead_on_return noundef %24)
  %526 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %25, i8 0, i64 48, i1 false)
  %527 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 0
  store i32 1, ptr %527, align 8
  %528 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 1
  %529 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 2
  %530 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 3
  %531 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 4
  %532 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %26, ptr align 8 %25, i64 48, i1 false)
  call void @generate_code(ptr noundef %526, ptr dead_on_return noundef %26)
  %533 = load ptr, ptr %6, align 8
  %534 = load ptr, ptr %5, align 8
  %535 = getelementptr inbounds nuw %struct.TrackValues, ptr %534, i32 0, i32 8
  %536 = load ptr, ptr %535, align 8
  %537 = call ptr @defVar(ptr noundef %533, ptr noundef @.str.10.126, ptr noundef @.str.11.127, ptr noundef %536)
  store ptr %537, ptr %27, align 8
  %538 = load ptr, ptr %6, align 8
  %539 = load ptr, ptr %5, align 8
  %540 = getelementptr inbounds nuw %struct.TrackValues, ptr %539, i32 0, i32 8
  %541 = load ptr, ptr %540, align 8
  %542 = call ptr @defVar(ptr noundef %538, ptr noundef @.str.10.126, ptr noundef @.str.12.128, ptr noundef %541)
  store ptr %542, ptr %28, align 8
  %543 = load ptr, ptr %6, align 8
  %544 = load ptr, ptr %5, align 8
  %545 = getelementptr inbounds nuw %struct.TrackValues, ptr %544, i32 0, i32 8
  %546 = load ptr, ptr %545, align 8
  %547 = call ptr @defVar(ptr noundef %543, ptr noundef @.str.10.126, ptr noundef @.str.13.129, ptr noundef %546)
  store ptr %547, ptr %29, align 8
  %548 = load ptr, ptr %6, align 8
  %549 = load ptr, ptr %5, align 8
  %550 = getelementptr inbounds nuw %struct.TrackValues, ptr %549, i32 0, i32 8
  %551 = load ptr, ptr %550, align 8
  %552 = call ptr @defVar(ptr noundef %548, ptr noundef @.str.10.126, ptr noundef @.str.14.130, ptr noundef %551)
  store ptr %552, ptr %30, align 8
  %553 = load ptr, ptr %6, align 8
  %554 = load ptr, ptr %5, align 8
  %555 = getelementptr inbounds nuw %struct.TrackValues, ptr %554, i32 0, i32 8
  %556 = load ptr, ptr %555, align 8
  %557 = call ptr @defVar(ptr noundef %553, ptr noundef @.str.10.126, ptr noundef @.str.15.131, ptr noundef %556)
  store ptr %557, ptr %31, align 8
  %558 = load ptr, ptr %6, align 8
  %559 = load ptr, ptr %5, align 8
  %560 = getelementptr inbounds nuw %struct.TrackValues, ptr %559, i32 0, i32 8
  %561 = load ptr, ptr %560, align 8
  %562 = call ptr @defVar(ptr noundef %558, ptr noundef @.str.10.126, ptr noundef @.str.16.132, ptr noundef %561)
  store ptr %562, ptr %32, align 8
  %563 = load ptr, ptr %6, align 8
  %564 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 0
  store i32 43, ptr %564, align 8
  %565 = getelementptr i8, ptr %33, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %565, i8 0, i64 4, i1 false)
  %566 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 1
  %567 = load ptr, ptr %28, align 8
  store ptr %567, ptr %566, align 8
  %568 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 2
  %569 = load ptr, ptr %5, align 8
  %570 = getelementptr inbounds nuw %struct.TrackValues, ptr %569, i32 0, i32 6
  %571 = getelementptr inbounds nuw %struct.args, ptr %570, i32 0, i32 2
  %572 = load ptr, ptr %571, align 8
  store ptr %572, ptr %568, align 8
  %573 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 3
  store ptr null, ptr %573, align 8
  %574 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 4
  store i32 0, ptr %574, align 8
  %575 = getelementptr i8, ptr %33, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %575, i8 0, i64 4, i1 false)
  %576 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 5
  store ptr null, ptr %576, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %34, ptr align 8 %33, i64 48, i1 false)
  call void @generate_code(ptr noundef %563, ptr dead_on_return noundef %34)
  %577 = load ptr, ptr %6, align 8
  %578 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 0
  store i32 43, ptr %578, align 8
  %579 = getelementptr i8, ptr %35, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %579, i8 0, i64 4, i1 false)
  %580 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 1
  %581 = load ptr, ptr %29, align 8
  store ptr %581, ptr %580, align 8
  %582 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 2
  %583 = load ptr, ptr %5, align 8
  %584 = getelementptr inbounds nuw %struct.TrackValues, ptr %583, i32 0, i32 6
  %585 = getelementptr inbounds nuw %struct.args, ptr %584, i32 0, i32 3
  %586 = load ptr, ptr %585, align 8
  store ptr %586, ptr %582, align 8
  %587 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 3
  store ptr null, ptr %587, align 8
  %588 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 4
  store i32 0, ptr %588, align 8
  %589 = getelementptr i8, ptr %35, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %589, i8 0, i64 4, i1 false)
  %590 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 5
  store ptr null, ptr %590, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %36, ptr align 8 %35, i64 48, i1 false)
  call void @generate_code(ptr noundef %577, ptr dead_on_return noundef %36)
  %591 = load ptr, ptr %6, align 8
  %592 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 0
  store i32 0, ptr %592, align 8
  %593 = getelementptr i8, ptr %37, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %593, i8 0, i64 4, i1 false)
  %594 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 1
  %595 = load ptr, ptr %27, align 8
  store ptr %595, ptr %594, align 8
  %596 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 2
  %597 = call ptr @numberToIFJstring(ptr noundef @.str.9.125, i32 noundef 0)
  store ptr %597, ptr %596, align 8
  %598 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 3
  store ptr null, ptr %598, align 8
  %599 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 4
  store i32 0, ptr %599, align 8
  %600 = getelementptr i8, ptr %37, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %600, i8 0, i64 4, i1 false)
  %601 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 5
  store ptr null, ptr %601, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %38, ptr align 8 %37, i64 48, i1 false)
  call void @generate_code(ptr noundef %591, ptr dead_on_return noundef %38)
  %602 = call ptr @getLabel(ptr noundef @.str.17.133)
  store ptr %602, ptr %39, align 8
  %603 = call ptr @getLabel(ptr noundef @.str.18.134)
  store ptr %603, ptr %40, align 8
  %604 = call ptr @getLabel(ptr noundef @.str.19.135)
  store ptr %604, ptr %41, align 8
  %605 = call ptr @getLabel(ptr noundef @.str.20.136)
  store ptr %605, ptr %42, align 8
  %606 = call ptr @getLabel(ptr noundef @.str.21.137)
  store ptr %606, ptr %43, align 8
  %607 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %44, i8 0, i64 48, i1 false)
  %608 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 0
  store i32 47, ptr %608, align 8
  %609 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 1
  %610 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 2
  %611 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 3
  %612 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 4
  %613 = getelementptr inbounds nuw %struct.args, ptr %44, i32 0, i32 5
  %614 = load ptr, ptr %40, align 8
  store ptr %614, ptr %613, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %45, ptr align 8 %44, i64 48, i1 false)
  call void @generate_code(ptr noundef %607, ptr dead_on_return noundef %45)
  %615 = load ptr, ptr %6, align 8
  %616 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 0
  store i32 49, ptr %616, align 8
  %617 = getelementptr i8, ptr %46, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %617, i8 0, i64 4, i1 false)
  %618 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 1
  store ptr null, ptr %618, align 8
  %619 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 2
  %620 = load ptr, ptr %28, align 8
  store ptr %620, ptr %619, align 8
  %621 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 3
  %622 = load ptr, ptr %27, align 8
  store ptr %622, ptr %621, align 8
  %623 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 4
  store i32 0, ptr %623, align 8
  %624 = getelementptr i8, ptr %46, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %624, i8 0, i64 4, i1 false)
  %625 = getelementptr inbounds nuw %struct.args, ptr %46, i32 0, i32 5
  %626 = load ptr, ptr %39, align 8
  store ptr %626, ptr %625, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %47, ptr align 8 %46, i64 48, i1 false)
  call void @generate_code(ptr noundef %615, ptr dead_on_return noundef %47)
  %627 = load ptr, ptr %6, align 8
  %628 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 0
  store i32 44, ptr %628, align 8
  %629 = getelementptr i8, ptr %48, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %629, i8 0, i64 4, i1 false)
  %630 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 1
  %631 = load ptr, ptr %30, align 8
  store ptr %631, ptr %630, align 8
  %632 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 2
  %633 = load ptr, ptr %5, align 8
  %634 = getelementptr inbounds nuw %struct.TrackValues, ptr %633, i32 0, i32 6
  %635 = getelementptr inbounds nuw %struct.args, ptr %634, i32 0, i32 2
  %636 = load ptr, ptr %635, align 8
  store ptr %636, ptr %632, align 8
  %637 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 3
  %638 = load ptr, ptr %27, align 8
  store ptr %638, ptr %637, align 8
  %639 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 4
  store i32 0, ptr %639, align 8
  %640 = getelementptr i8, ptr %48, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %640, i8 0, i64 4, i1 false)
  %641 = getelementptr inbounds nuw %struct.args, ptr %48, i32 0, i32 5
  store ptr null, ptr %641, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %49, ptr align 8 %48, i64 48, i1 false)
  call void @generate_code(ptr noundef %627, ptr dead_on_return noundef %49)
  %642 = load ptr, ptr %6, align 8
  %643 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 0
  store i32 44, ptr %643, align 8
  %644 = getelementptr i8, ptr %50, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %644, i8 0, i64 4, i1 false)
  %645 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 1
  %646 = load ptr, ptr %31, align 8
  store ptr %646, ptr %645, align 8
  %647 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 2
  %648 = load ptr, ptr %5, align 8
  %649 = getelementptr inbounds nuw %struct.TrackValues, ptr %648, i32 0, i32 6
  %650 = getelementptr inbounds nuw %struct.args, ptr %649, i32 0, i32 3
  %651 = load ptr, ptr %650, align 8
  store ptr %651, ptr %647, align 8
  %652 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 3
  %653 = load ptr, ptr %27, align 8
  store ptr %653, ptr %652, align 8
  %654 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 4
  store i32 0, ptr %654, align 8
  %655 = getelementptr i8, ptr %50, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %655, i8 0, i64 4, i1 false)
  %656 = getelementptr inbounds nuw %struct.args, ptr %50, i32 0, i32 5
  store ptr null, ptr %656, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %51, ptr align 8 %50, i64 48, i1 false)
  call void @generate_code(ptr noundef %642, ptr dead_on_return noundef %51)
  %657 = load ptr, ptr %6, align 8
  %658 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 0
  store i32 49, ptr %658, align 8
  %659 = getelementptr i8, ptr %52, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %659, i8 0, i64 4, i1 false)
  %660 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 1
  store ptr null, ptr %660, align 8
  %661 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 2
  %662 = load ptr, ptr %30, align 8
  store ptr %662, ptr %661, align 8
  %663 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 3
  %664 = load ptr, ptr %31, align 8
  store ptr %664, ptr %663, align 8
  %665 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 4
  store i32 0, ptr %665, align 8
  %666 = getelementptr i8, ptr %52, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %666, i8 0, i64 4, i1 false)
  %667 = getelementptr inbounds nuw %struct.args, ptr %52, i32 0, i32 5
  %668 = load ptr, ptr %41, align 8
  store ptr %668, ptr %667, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %53, ptr align 8 %52, i64 48, i1 false)
  call void @generate_code(ptr noundef %657, ptr dead_on_return noundef %53)
  %669 = load ptr, ptr %6, align 8
  %670 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 0
  store i32 20, ptr %670, align 8
  %671 = getelementptr i8, ptr %54, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %671, i8 0, i64 4, i1 false)
  %672 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 1
  %673 = load ptr, ptr %32, align 8
  store ptr %673, ptr %672, align 8
  %674 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 2
  %675 = load ptr, ptr %30, align 8
  store ptr %675, ptr %674, align 8
  %676 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 3
  %677 = load ptr, ptr %31, align 8
  store ptr %677, ptr %676, align 8
  %678 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 4
  store i32 0, ptr %678, align 8
  %679 = getelementptr i8, ptr %54, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %679, i8 0, i64 4, i1 false)
  %680 = getelementptr inbounds nuw %struct.args, ptr %54, i32 0, i32 5
  store ptr null, ptr %680, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %55, ptr align 8 %54, i64 48, i1 false)
  call void @generate_code(ptr noundef %669, ptr dead_on_return noundef %55)
  %681 = load ptr, ptr %6, align 8
  %682 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 0
  store i32 49, ptr %682, align 8
  %683 = getelementptr i8, ptr %56, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %683, i8 0, i64 4, i1 false)
  %684 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 1
  store ptr null, ptr %684, align 8
  %685 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 2
  %686 = load ptr, ptr %32, align 8
  store ptr %686, ptr %685, align 8
  %687 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 3
  store ptr @.str.22.138, ptr %687, align 8
  %688 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 4
  store i32 0, ptr %688, align 8
  %689 = getelementptr i8, ptr %56, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %689, i8 0, i64 4, i1 false)
  %690 = getelementptr inbounds nuw %struct.args, ptr %56, i32 0, i32 5
  %691 = load ptr, ptr %42, align 8
  store ptr %691, ptr %690, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %57, ptr align 8 %56, i64 48, i1 false)
  call void @generate_code(ptr noundef %681, ptr dead_on_return noundef %57)
  %692 = load ptr, ptr %6, align 8
  %693 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 0
  store i32 50, ptr %693, align 8
  %694 = getelementptr i8, ptr %58, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %694, i8 0, i64 4, i1 false)
  %695 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 1
  store ptr null, ptr %695, align 8
  %696 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 2
  %697 = load ptr, ptr %32, align 8
  store ptr %697, ptr %696, align 8
  %698 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 3
  store ptr @.str.22.138, ptr %698, align 8
  %699 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 4
  store i32 0, ptr %699, align 8
  %700 = getelementptr i8, ptr %58, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %700, i8 0, i64 4, i1 false)
  %701 = getelementptr inbounds nuw %struct.args, ptr %58, i32 0, i32 5
  %702 = load ptr, ptr %43, align 8
  store ptr %702, ptr %701, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %59, ptr align 8 %58, i64 48, i1 false)
  call void @generate_code(ptr noundef %692, ptr dead_on_return noundef %59)
  %703 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %60, i8 0, i64 48, i1 false)
  %704 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 0
  store i32 47, ptr %704, align 8
  %705 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 1
  %706 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 2
  %707 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 3
  %708 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 4
  %709 = getelementptr inbounds nuw %struct.args, ptr %60, i32 0, i32 5
  %710 = load ptr, ptr %42, align 8
  store ptr %710, ptr %709, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %61, ptr align 8 %60, i64 48, i1 false)
  call void @generate_code(ptr noundef %703, ptr dead_on_return noundef %61)
  %711 = load ptr, ptr %6, align 8
  %712 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 0
  store i32 0, ptr %712, align 8
  %713 = getelementptr i8, ptr %62, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %713, i8 0, i64 4, i1 false)
  %714 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 1
  %715 = load ptr, ptr %22, align 8
  store ptr %715, ptr %714, align 8
  %716 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 2
  %717 = call ptr @numberToIFJstring(ptr noundef @.str.23.139, i32 noundef 0)
  store ptr %717, ptr %716, align 8
  %718 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 3
  store ptr null, ptr %718, align 8
  %719 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 4
  store i32 0, ptr %719, align 8
  %720 = getelementptr i8, ptr %62, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %720, i8 0, i64 4, i1 false)
  %721 = getelementptr inbounds nuw %struct.args, ptr %62, i32 0, i32 5
  store ptr null, ptr %721, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %63, ptr align 8 %62, i64 48, i1 false)
  call void @generate_code(ptr noundef %711, ptr dead_on_return noundef %63)
  %722 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %64, i8 0, i64 48, i1 false)
  %723 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 0
  store i32 48, ptr %723, align 8
  %724 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 1
  %725 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 2
  %726 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 3
  %727 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 4
  %728 = getelementptr inbounds nuw %struct.args, ptr %64, i32 0, i32 5
  %729 = load ptr, ptr %39, align 8
  store ptr %729, ptr %728, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %65, ptr align 8 %64, i64 48, i1 false)
  call void @generate_code(ptr noundef %722, ptr dead_on_return noundef %65)
  %730 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %66, i8 0, i64 48, i1 false)
  %731 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 0
  store i32 47, ptr %731, align 8
  %732 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 1
  %733 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 2
  %734 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 3
  %735 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 4
  %736 = getelementptr inbounds nuw %struct.args, ptr %66, i32 0, i32 5
  %737 = load ptr, ptr %43, align 8
  store ptr %737, ptr %736, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %67, ptr align 8 %66, i64 48, i1 false)
  call void @generate_code(ptr noundef %730, ptr dead_on_return noundef %67)
  %738 = load ptr, ptr %6, align 8
  %739 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 0
  store i32 0, ptr %739, align 8
  %740 = getelementptr i8, ptr %68, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %740, i8 0, i64 4, i1 false)
  %741 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 1
  %742 = load ptr, ptr %22, align 8
  store ptr %742, ptr %741, align 8
  %743 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 2
  %744 = call ptr @numberToIFJstring(ptr noundef @.str.24.140, i32 noundef 0)
  store ptr %744, ptr %743, align 8
  %745 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 3
  store ptr null, ptr %745, align 8
  %746 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 4
  store i32 0, ptr %746, align 8
  %747 = getelementptr i8, ptr %68, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %747, i8 0, i64 4, i1 false)
  %748 = getelementptr inbounds nuw %struct.args, ptr %68, i32 0, i32 5
  store ptr null, ptr %748, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %69, ptr align 8 %68, i64 48, i1 false)
  call void @generate_code(ptr noundef %738, ptr dead_on_return noundef %69)
  %749 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %70, i8 0, i64 48, i1 false)
  %750 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 0
  store i32 48, ptr %750, align 8
  %751 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 1
  %752 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 2
  %753 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 3
  %754 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 4
  %755 = getelementptr inbounds nuw %struct.args, ptr %70, i32 0, i32 5
  %756 = load ptr, ptr %39, align 8
  store ptr %756, ptr %755, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %71, ptr align 8 %70, i64 48, i1 false)
  call void @generate_code(ptr noundef %749, ptr dead_on_return noundef %71)
  %757 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %72, i8 0, i64 48, i1 false)
  %758 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 0
  store i32 47, ptr %758, align 8
  %759 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 1
  %760 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 2
  %761 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 3
  %762 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 4
  %763 = getelementptr inbounds nuw %struct.args, ptr %72, i32 0, i32 5
  %764 = load ptr, ptr %41, align 8
  store ptr %764, ptr %763, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %73, ptr align 8 %72, i64 48, i1 false)
  call void @generate_code(ptr noundef %757, ptr dead_on_return noundef %73)
  %765 = load ptr, ptr %6, align 8
  %766 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 0
  store i32 10, ptr %766, align 8
  %767 = getelementptr i8, ptr %74, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %767, i8 0, i64 4, i1 false)
  %768 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 1
  %769 = load ptr, ptr %27, align 8
  store ptr %769, ptr %768, align 8
  %770 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 2
  %771 = load ptr, ptr %27, align 8
  store ptr %771, ptr %770, align 8
  %772 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 3
  %773 = call ptr @numberToIFJstring(ptr noundef @.str.24.140, i32 noundef 0)
  store ptr %773, ptr %772, align 8
  %774 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 4
  store i32 0, ptr %774, align 8
  %775 = getelementptr i8, ptr %74, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %775, i8 0, i64 4, i1 false)
  %776 = getelementptr inbounds nuw %struct.args, ptr %74, i32 0, i32 5
  store ptr null, ptr %776, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %75, ptr align 8 %74, i64 48, i1 false)
  call void @generate_code(ptr noundef %765, ptr dead_on_return noundef %75)
  %777 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %76, i8 0, i64 48, i1 false)
  %778 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 0
  store i32 48, ptr %778, align 8
  %779 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 1
  %780 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 2
  %781 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 3
  %782 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 4
  %783 = getelementptr inbounds nuw %struct.args, ptr %76, i32 0, i32 5
  %784 = load ptr, ptr %40, align 8
  store ptr %784, ptr %783, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %77, ptr align 8 %76, i64 48, i1 false)
  call void @generate_code(ptr noundef %777, ptr dead_on_return noundef %77)
  %785 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %78, i8 0, i64 48, i1 false)
  %786 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 0
  store i32 47, ptr %786, align 8
  %787 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 1
  %788 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 2
  %789 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 3
  %790 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 4
  %791 = getelementptr inbounds nuw %struct.args, ptr %78, i32 0, i32 5
  %792 = load ptr, ptr %39, align 8
  store ptr %792, ptr %791, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %79, ptr align 8 %78, i64 48, i1 false)
  call void @generate_code(ptr noundef %785, ptr dead_on_return noundef %79)
  br label %1307

793:                                              ; preds = %181
  %794 = load ptr, ptr %5, align 8
  %795 = getelementptr inbounds nuw %struct.TrackValues, ptr %794, i32 0, i32 1
  %796 = load i32, ptr %795, align 4
  %797 = add nsw i32 %796, 1
  store i32 %797, ptr %795, align 4
  %798 = load ptr, ptr %5, align 8
  %799 = getelementptr inbounds nuw %struct.TrackValues, ptr %798, i32 0, i32 6
  %800 = getelementptr inbounds nuw %struct.args, ptr %799, i32 0, i32 3
  %801 = load ptr, ptr %800, align 8
  %802 = icmp eq ptr %801, null
  br i1 %802, label %803, label %818

803:                                              ; preds = %793
  %804 = load i32, ptr %8, align 4
  %805 = icmp ne i32 %804, 0
  br i1 %805, label %806, label %813

806:                                              ; preds = %803
  %807 = load i32, ptr %7, align 4
  %808 = icmp ne i32 %807, 3
  br i1 %808, label %809, label %813

809:                                              ; preds = %806
  %810 = load i32, ptr %7, align 4
  %811 = icmp ne i32 %810, 5
  br i1 %811, label %812, label %813

812:                                              ; preds = %809
  call void @print_error(i32 noundef 4)
  br label %813

813:                                              ; preds = %812, %809, %806, %803
  %814 = load ptr, ptr %10, align 8
  %815 = load ptr, ptr %5, align 8
  %816 = getelementptr inbounds nuw %struct.TrackValues, ptr %815, i32 0, i32 6
  %817 = getelementptr inbounds nuw %struct.args, ptr %816, i32 0, i32 3
  store ptr %814, ptr %817, align 8
  br label %1307

818:                                              ; preds = %793
  %819 = load ptr, ptr %5, align 8
  %820 = getelementptr inbounds nuw %struct.TrackValues, ptr %819, i32 0, i32 6
  %821 = getelementptr inbounds nuw %struct.args, ptr %820, i32 0, i32 2
  %822 = load ptr, ptr %821, align 8
  %823 = icmp eq ptr %822, null
  br i1 %823, label %824, label %839

824:                                              ; preds = %818
  %825 = load i32, ptr %8, align 4
  %826 = icmp ne i32 %825, 0
  br i1 %826, label %827, label %834

827:                                              ; preds = %824
  %828 = load i32, ptr %7, align 4
  %829 = icmp ne i32 %828, 3
  br i1 %829, label %830, label %834

830:                                              ; preds = %827
  %831 = load i32, ptr %7, align 4
  %832 = icmp ne i32 %831, 5
  br i1 %832, label %833, label %834

833:                                              ; preds = %830
  call void @print_error(i32 noundef 4)
  br label %834

834:                                              ; preds = %833, %830, %827, %824
  %835 = load ptr, ptr %10, align 8
  %836 = load ptr, ptr %5, align 8
  %837 = getelementptr inbounds nuw %struct.TrackValues, ptr %836, i32 0, i32 6
  %838 = getelementptr inbounds nuw %struct.args, ptr %837, i32 0, i32 2
  store ptr %835, ptr %838, align 8
  br label %1307

839:                                              ; preds = %818
  %840 = load i32, ptr %8, align 4
  %841 = icmp ne i32 %840, 2
  br i1 %841, label %842, label %843

842:                                              ; preds = %839
  call void @print_error(i32 noundef 4)
  br label %843

843:                                              ; preds = %842, %839
  %844 = load ptr, ptr %5, align 8
  %845 = getelementptr inbounds nuw %struct.TrackValues, ptr %844, i32 0, i32 6
  %846 = getelementptr inbounds nuw %struct.args, ptr %845, i32 0, i32 0
  store i32 42, ptr %846, align 8
  %847 = load ptr, ptr %5, align 8
  %848 = getelementptr inbounds nuw %struct.TrackValues, ptr %847, i32 0, i32 5
  %849 = load ptr, ptr %848, align 8
  %850 = load ptr, ptr %5, align 8
  %851 = getelementptr inbounds nuw %struct.TrackValues, ptr %850, i32 0, i32 6
  %852 = getelementptr inbounds nuw %struct.args, ptr %851, i32 0, i32 1
  store ptr %849, ptr %852, align 8
  %853 = load ptr, ptr %5, align 8
  %854 = getelementptr inbounds nuw %struct.TrackValues, ptr %853, i32 0, i32 6
  %855 = getelementptr inbounds nuw %struct.args, ptr %854, i32 0, i32 2
  %856 = load ptr, ptr %855, align 8
  %857 = icmp eq ptr %856, null
  br i1 %857, label %864, label %858

858:                                              ; preds = %843
  %859 = load ptr, ptr %5, align 8
  %860 = getelementptr inbounds nuw %struct.TrackValues, ptr %859, i32 0, i32 6
  %861 = getelementptr inbounds nuw %struct.args, ptr %860, i32 0, i32 3
  %862 = load ptr, ptr %861, align 8
  %863 = icmp eq ptr %862, null
  br i1 %863, label %864, label %865

864:                                              ; preds = %858, %843
  call void @print_error(i32 noundef 4)
  br label %865

865:                                              ; preds = %864, %858
  %866 = load ptr, ptr %10, align 8
  %867 = call ptr @addFramePrefix(ptr noundef @.str.7.123, ptr noundef %866)
  store ptr %867, ptr %10, align 8
  %868 = load ptr, ptr %6, align 8
  %869 = load ptr, ptr %5, align 8
  %870 = getelementptr inbounds nuw %struct.TrackValues, ptr %869, i32 0, i32 5
  %871 = load ptr, ptr %870, align 8
  %872 = load ptr, ptr %5, align 8
  %873 = getelementptr inbounds nuw %struct.TrackValues, ptr %872, i32 0, i32 8
  %874 = load ptr, ptr %873, align 8
  %875 = call ptr @defVar(ptr noundef %868, ptr noundef @.str.7.123, ptr noundef %871, ptr noundef %874)
  store ptr %875, ptr %80, align 8
  %876 = load ptr, ptr %6, align 8
  %877 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 0
  store i32 0, ptr %877, align 8
  %878 = getelementptr i8, ptr %81, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %878, i8 0, i64 4, i1 false)
  %879 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 1
  %880 = load ptr, ptr %80, align 8
  store ptr %880, ptr %879, align 8
  %881 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 2
  store ptr @.str.25.141, ptr %881, align 8
  %882 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 3
  store ptr null, ptr %882, align 8
  %883 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 4
  store i32 0, ptr %883, align 8
  %884 = getelementptr i8, ptr %81, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %884, i8 0, i64 4, i1 false)
  %885 = getelementptr inbounds nuw %struct.args, ptr %81, i32 0, i32 5
  store ptr null, ptr %885, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %82, ptr align 8 %81, i64 48, i1 false)
  call void @generate_code(ptr noundef %876, ptr dead_on_return noundef %82)
  %886 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %83, i8 0, i64 48, i1 false)
  %887 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 0
  store i32 1, ptr %887, align 8
  %888 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 1
  %889 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 2
  %890 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 3
  %891 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 4
  %892 = getelementptr inbounds nuw %struct.args, ptr %83, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %84, ptr align 8 %83, i64 48, i1 false)
  call void @generate_code(ptr noundef %886, ptr dead_on_return noundef %84)
  %893 = load ptr, ptr %6, align 8
  %894 = load ptr, ptr %5, align 8
  %895 = getelementptr inbounds nuw %struct.TrackValues, ptr %894, i32 0, i32 8
  %896 = load ptr, ptr %895, align 8
  %897 = call ptr @defVar(ptr noundef %893, ptr noundef @.str.10.126, ptr noundef @.str.26.142, ptr noundef %896)
  store ptr %897, ptr %85, align 8
  %898 = load ptr, ptr %6, align 8
  %899 = load ptr, ptr %5, align 8
  %900 = getelementptr inbounds nuw %struct.TrackValues, ptr %899, i32 0, i32 8
  %901 = load ptr, ptr %900, align 8
  %902 = call ptr @defVar(ptr noundef %898, ptr noundef @.str.10.126, ptr noundef @.str.17.133, ptr noundef %901)
  store ptr %902, ptr %86, align 8
  %903 = load ptr, ptr %6, align 8
  %904 = load ptr, ptr %5, align 8
  %905 = getelementptr inbounds nuw %struct.TrackValues, ptr %904, i32 0, i32 8
  %906 = load ptr, ptr %905, align 8
  %907 = call ptr @defVar(ptr noundef %903, ptr noundef @.str.10.126, ptr noundef @.str.27.143, ptr noundef %906)
  store ptr %907, ptr %87, align 8
  %908 = load ptr, ptr %6, align 8
  %909 = load ptr, ptr %5, align 8
  %910 = getelementptr inbounds nuw %struct.TrackValues, ptr %909, i32 0, i32 8
  %911 = load ptr, ptr %910, align 8
  %912 = call ptr @defVar(ptr noundef %908, ptr noundef @.str.10.126, ptr noundef @.str.11.127, ptr noundef %911)
  store ptr %912, ptr %88, align 8
  %913 = load ptr, ptr %6, align 8
  %914 = load ptr, ptr %5, align 8
  %915 = getelementptr inbounds nuw %struct.TrackValues, ptr %914, i32 0, i32 8
  %916 = load ptr, ptr %915, align 8
  %917 = call ptr @defVar(ptr noundef %913, ptr noundef @.str.10.126, ptr noundef @.str.28.144, ptr noundef %916)
  store ptr %917, ptr %89, align 8
  %918 = load ptr, ptr %6, align 8
  %919 = load ptr, ptr %5, align 8
  %920 = getelementptr inbounds nuw %struct.TrackValues, ptr %919, i32 0, i32 8
  %921 = load ptr, ptr %920, align 8
  %922 = call ptr @defVar(ptr noundef %918, ptr noundef @.str.10.126, ptr noundef @.str.16.132, ptr noundef %921)
  store ptr %922, ptr %90, align 8
  %923 = load ptr, ptr %6, align 8
  %924 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 0
  store i32 0, ptr %924, align 8
  %925 = getelementptr i8, ptr %91, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %925, i8 0, i64 4, i1 false)
  %926 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 1
  %927 = load ptr, ptr %85, align 8
  store ptr %927, ptr %926, align 8
  %928 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 2
  %929 = load ptr, ptr %5, align 8
  %930 = getelementptr inbounds nuw %struct.TrackValues, ptr %929, i32 0, i32 6
  %931 = getelementptr inbounds nuw %struct.args, ptr %930, i32 0, i32 2
  %932 = load ptr, ptr %931, align 8
  %933 = call ptr @numberToIFJstring(ptr noundef %932, i32 noundef 0)
  store ptr %933, ptr %928, align 8
  %934 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 3
  store ptr null, ptr %934, align 8
  %935 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 4
  store i32 0, ptr %935, align 8
  %936 = getelementptr i8, ptr %91, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %936, i8 0, i64 4, i1 false)
  %937 = getelementptr inbounds nuw %struct.args, ptr %91, i32 0, i32 5
  store ptr null, ptr %937, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %92, ptr align 8 %91, i64 48, i1 false)
  call void @generate_code(ptr noundef %923, ptr dead_on_return noundef %92)
  %938 = load ptr, ptr %6, align 8
  %939 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 0
  store i32 0, ptr %939, align 8
  %940 = getelementptr i8, ptr %93, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %940, i8 0, i64 4, i1 false)
  %941 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 1
  %942 = load ptr, ptr %86, align 8
  store ptr %942, ptr %941, align 8
  %943 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 2
  %944 = load ptr, ptr %5, align 8
  %945 = getelementptr inbounds nuw %struct.TrackValues, ptr %944, i32 0, i32 6
  %946 = getelementptr inbounds nuw %struct.args, ptr %945, i32 0, i32 3
  %947 = load ptr, ptr %946, align 8
  %948 = call ptr @numberToIFJstring(ptr noundef %947, i32 noundef 0)
  store ptr %948, ptr %943, align 8
  %949 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 3
  store ptr null, ptr %949, align 8
  %950 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 4
  store i32 0, ptr %950, align 8
  %951 = getelementptr i8, ptr %93, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %951, i8 0, i64 4, i1 false)
  %952 = getelementptr inbounds nuw %struct.args, ptr %93, i32 0, i32 5
  store ptr null, ptr %952, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %94, ptr align 8 %93, i64 48, i1 false)
  call void @generate_code(ptr noundef %938, ptr dead_on_return noundef %94)
  %953 = load ptr, ptr %6, align 8
  %954 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 0
  store i32 0, ptr %954, align 8
  %955 = getelementptr i8, ptr %95, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %955, i8 0, i64 4, i1 false)
  %956 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 1
  %957 = load ptr, ptr %88, align 8
  store ptr %957, ptr %956, align 8
  %958 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 2
  %959 = call ptr @numberToIFJstring(ptr noundef @.str.9.125, i32 noundef 0)
  store ptr %959, ptr %958, align 8
  %960 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 3
  store ptr null, ptr %960, align 8
  %961 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 4
  store i32 0, ptr %961, align 8
  %962 = getelementptr i8, ptr %95, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %962, i8 0, i64 4, i1 false)
  %963 = getelementptr inbounds nuw %struct.args, ptr %95, i32 0, i32 5
  store ptr null, ptr %963, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %96, ptr align 8 %95, i64 48, i1 false)
  call void @generate_code(ptr noundef %953, ptr dead_on_return noundef %96)
  %964 = load ptr, ptr %6, align 8
  %965 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 0
  store i32 43, ptr %965, align 8
  %966 = getelementptr i8, ptr %97, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %966, i8 0, i64 4, i1 false)
  %967 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 1
  %968 = load ptr, ptr %87, align 8
  store ptr %968, ptr %967, align 8
  %969 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 2
  %970 = load ptr, ptr %10, align 8
  store ptr %970, ptr %969, align 8
  %971 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 3
  store ptr null, ptr %971, align 8
  %972 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 4
  store i32 0, ptr %972, align 8
  %973 = getelementptr i8, ptr %97, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %973, i8 0, i64 4, i1 false)
  %974 = getelementptr inbounds nuw %struct.args, ptr %97, i32 0, i32 5
  store ptr null, ptr %974, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %98, ptr align 8 %97, i64 48, i1 false)
  call void @generate_code(ptr noundef %964, ptr dead_on_return noundef %98)
  %975 = call ptr @getLabel(ptr noundef @.str.18.134)
  store ptr %975, ptr %99, align 8
  %976 = call ptr @getLabel(ptr noundef @.str.29.145)
  store ptr %976, ptr %100, align 8
  %977 = call ptr @getLabel(ptr noundef @.str.30.146)
  store ptr %977, ptr %101, align 8
  %978 = load ptr, ptr %6, align 8
  %979 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 0
  store i32 20, ptr %979, align 8
  %980 = getelementptr i8, ptr %102, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %980, i8 0, i64 4, i1 false)
  %981 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 1
  %982 = load ptr, ptr %90, align 8
  store ptr %982, ptr %981, align 8
  %983 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 2
  %984 = load ptr, ptr %85, align 8
  store ptr %984, ptr %983, align 8
  %985 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 3
  %986 = call ptr @numberToIFJstring(ptr noundef @.str.9.125, i32 noundef 0)
  store ptr %986, ptr %985, align 8
  %987 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 4
  store i32 0, ptr %987, align 8
  %988 = getelementptr i8, ptr %102, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %988, i8 0, i64 4, i1 false)
  %989 = getelementptr inbounds nuw %struct.args, ptr %102, i32 0, i32 5
  store ptr null, ptr %989, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %103, ptr align 8 %102, i64 48, i1 false)
  call void @generate_code(ptr noundef %978, ptr dead_on_return noundef %103)
  %990 = load ptr, ptr %6, align 8
  %991 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 0
  store i32 49, ptr %991, align 8
  %992 = getelementptr i8, ptr %104, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %992, i8 0, i64 4, i1 false)
  %993 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 1
  store ptr null, ptr %993, align 8
  %994 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 2
  %995 = load ptr, ptr %90, align 8
  store ptr %995, ptr %994, align 8
  %996 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 3
  store ptr @.str.22.138, ptr %996, align 8
  %997 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 4
  store i32 0, ptr %997, align 8
  %998 = getelementptr i8, ptr %104, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %998, i8 0, i64 4, i1 false)
  %999 = getelementptr inbounds nuw %struct.args, ptr %104, i32 0, i32 5
  %1000 = load ptr, ptr %101, align 8
  store ptr %1000, ptr %999, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %105, ptr align 8 %104, i64 48, i1 false)
  call void @generate_code(ptr noundef %990, ptr dead_on_return noundef %105)
  %1001 = load ptr, ptr %6, align 8
  %1002 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 0
  store i32 20, ptr %1002, align 8
  %1003 = getelementptr i8, ptr %106, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1003, i8 0, i64 4, i1 false)
  %1004 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 1
  %1005 = load ptr, ptr %90, align 8
  store ptr %1005, ptr %1004, align 8
  %1006 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 2
  %1007 = load ptr, ptr %86, align 8
  store ptr %1007, ptr %1006, align 8
  %1008 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 3
  %1009 = call ptr @numberToIFJstring(ptr noundef @.str.9.125, i32 noundef 0)
  store ptr %1009, ptr %1008, align 8
  %1010 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 4
  store i32 0, ptr %1010, align 8
  %1011 = getelementptr i8, ptr %106, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1011, i8 0, i64 4, i1 false)
  %1012 = getelementptr inbounds nuw %struct.args, ptr %106, i32 0, i32 5
  store ptr null, ptr %1012, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %107, ptr align 8 %106, i64 48, i1 false)
  call void @generate_code(ptr noundef %1001, ptr dead_on_return noundef %107)
  %1013 = load ptr, ptr %6, align 8
  %1014 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 0
  store i32 49, ptr %1014, align 8
  %1015 = getelementptr i8, ptr %108, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1015, i8 0, i64 4, i1 false)
  %1016 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 1
  store ptr null, ptr %1016, align 8
  %1017 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 2
  %1018 = load ptr, ptr %90, align 8
  store ptr %1018, ptr %1017, align 8
  %1019 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 3
  store ptr @.str.22.138, ptr %1019, align 8
  %1020 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 4
  store i32 0, ptr %1020, align 8
  %1021 = getelementptr i8, ptr %108, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1021, i8 0, i64 4, i1 false)
  %1022 = getelementptr inbounds nuw %struct.args, ptr %108, i32 0, i32 5
  %1023 = load ptr, ptr %101, align 8
  store ptr %1023, ptr %1022, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %109, ptr align 8 %108, i64 48, i1 false)
  call void @generate_code(ptr noundef %1013, ptr dead_on_return noundef %109)
  %1024 = load ptr, ptr %6, align 8
  %1025 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 0
  store i32 21, ptr %1025, align 8
  %1026 = getelementptr i8, ptr %110, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1026, i8 0, i64 4, i1 false)
  %1027 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 1
  %1028 = load ptr, ptr %90, align 8
  store ptr %1028, ptr %1027, align 8
  %1029 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 2
  %1030 = load ptr, ptr %85, align 8
  store ptr %1030, ptr %1029, align 8
  %1031 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 3
  %1032 = load ptr, ptr %86, align 8
  store ptr %1032, ptr %1031, align 8
  %1033 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 4
  store i32 0, ptr %1033, align 8
  %1034 = getelementptr i8, ptr %110, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1034, i8 0, i64 4, i1 false)
  %1035 = getelementptr inbounds nuw %struct.args, ptr %110, i32 0, i32 5
  store ptr null, ptr %1035, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %111, ptr align 8 %110, i64 48, i1 false)
  call void @generate_code(ptr noundef %1024, ptr dead_on_return noundef %111)
  %1036 = load ptr, ptr %6, align 8
  %1037 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 0
  store i32 49, ptr %1037, align 8
  %1038 = getelementptr i8, ptr %112, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1038, i8 0, i64 4, i1 false)
  %1039 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 1
  store ptr null, ptr %1039, align 8
  %1040 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 2
  %1041 = load ptr, ptr %90, align 8
  store ptr %1041, ptr %1040, align 8
  %1042 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 3
  store ptr @.str.22.138, ptr %1042, align 8
  %1043 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 4
  store i32 0, ptr %1043, align 8
  %1044 = getelementptr i8, ptr %112, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1044, i8 0, i64 4, i1 false)
  %1045 = getelementptr inbounds nuw %struct.args, ptr %112, i32 0, i32 5
  %1046 = load ptr, ptr %101, align 8
  store ptr %1046, ptr %1045, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %113, ptr align 8 %112, i64 48, i1 false)
  call void @generate_code(ptr noundef %1036, ptr dead_on_return noundef %113)
  %1047 = load ptr, ptr %6, align 8
  %1048 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 0
  store i32 21, ptr %1048, align 8
  %1049 = getelementptr i8, ptr %114, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1049, i8 0, i64 4, i1 false)
  %1050 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 1
  %1051 = load ptr, ptr %90, align 8
  store ptr %1051, ptr %1050, align 8
  %1052 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 2
  %1053 = load ptr, ptr %85, align 8
  store ptr %1053, ptr %1052, align 8
  %1054 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 3
  %1055 = load ptr, ptr %87, align 8
  store ptr %1055, ptr %1054, align 8
  %1056 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 4
  store i32 0, ptr %1056, align 8
  %1057 = getelementptr i8, ptr %114, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1057, i8 0, i64 4, i1 false)
  %1058 = getelementptr inbounds nuw %struct.args, ptr %114, i32 0, i32 5
  store ptr null, ptr %1058, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %115, ptr align 8 %114, i64 48, i1 false)
  call void @generate_code(ptr noundef %1047, ptr dead_on_return noundef %115)
  %1059 = load ptr, ptr %6, align 8
  %1060 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 0
  store i32 49, ptr %1060, align 8
  %1061 = getelementptr i8, ptr %116, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1061, i8 0, i64 4, i1 false)
  %1062 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 1
  store ptr null, ptr %1062, align 8
  %1063 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 2
  %1064 = load ptr, ptr %85, align 8
  store ptr %1064, ptr %1063, align 8
  %1065 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 3
  %1066 = load ptr, ptr %87, align 8
  store ptr %1066, ptr %1065, align 8
  %1067 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 4
  store i32 0, ptr %1067, align 8
  %1068 = getelementptr i8, ptr %116, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1068, i8 0, i64 4, i1 false)
  %1069 = getelementptr inbounds nuw %struct.args, ptr %116, i32 0, i32 5
  %1070 = load ptr, ptr %101, align 8
  store ptr %1070, ptr %1069, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %117, ptr align 8 %116, i64 48, i1 false)
  call void @generate_code(ptr noundef %1059, ptr dead_on_return noundef %117)
  %1071 = load ptr, ptr %6, align 8
  %1072 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 0
  store i32 49, ptr %1072, align 8
  %1073 = getelementptr i8, ptr %118, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1073, i8 0, i64 4, i1 false)
  %1074 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 1
  store ptr null, ptr %1074, align 8
  %1075 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 2
  %1076 = load ptr, ptr %90, align 8
  store ptr %1076, ptr %1075, align 8
  %1077 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 3
  store ptr @.str.22.138, ptr %1077, align 8
  %1078 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 4
  store i32 0, ptr %1078, align 8
  %1079 = getelementptr i8, ptr %118, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1079, i8 0, i64 4, i1 false)
  %1080 = getelementptr inbounds nuw %struct.args, ptr %118, i32 0, i32 5
  %1081 = load ptr, ptr %101, align 8
  store ptr %1081, ptr %1080, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %119, ptr align 8 %118, i64 48, i1 false)
  call void @generate_code(ptr noundef %1071, ptr dead_on_return noundef %119)
  %1082 = load ptr, ptr %6, align 8
  %1083 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 0
  store i32 21, ptr %1083, align 8
  %1084 = getelementptr i8, ptr %120, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1084, i8 0, i64 4, i1 false)
  %1085 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 1
  %1086 = load ptr, ptr %90, align 8
  store ptr %1086, ptr %1085, align 8
  %1087 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 2
  %1088 = load ptr, ptr %86, align 8
  store ptr %1088, ptr %1087, align 8
  %1089 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 3
  %1090 = load ptr, ptr %87, align 8
  store ptr %1090, ptr %1089, align 8
  %1091 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 4
  store i32 0, ptr %1091, align 8
  %1092 = getelementptr i8, ptr %120, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1092, i8 0, i64 4, i1 false)
  %1093 = getelementptr inbounds nuw %struct.args, ptr %120, i32 0, i32 5
  store ptr null, ptr %1093, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %121, ptr align 8 %120, i64 48, i1 false)
  call void @generate_code(ptr noundef %1082, ptr dead_on_return noundef %121)
  %1094 = load ptr, ptr %6, align 8
  %1095 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 0
  store i32 49, ptr %1095, align 8
  %1096 = getelementptr i8, ptr %122, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1096, i8 0, i64 4, i1 false)
  %1097 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 1
  store ptr null, ptr %1097, align 8
  %1098 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 2
  %1099 = load ptr, ptr %86, align 8
  store ptr %1099, ptr %1098, align 8
  %1100 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 3
  %1101 = load ptr, ptr %87, align 8
  store ptr %1101, ptr %1100, align 8
  %1102 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 4
  store i32 0, ptr %1102, align 8
  %1103 = getelementptr i8, ptr %122, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1103, i8 0, i64 4, i1 false)
  %1104 = getelementptr inbounds nuw %struct.args, ptr %122, i32 0, i32 5
  %1105 = load ptr, ptr %101, align 8
  store ptr %1105, ptr %1104, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %123, ptr align 8 %122, i64 48, i1 false)
  call void @generate_code(ptr noundef %1094, ptr dead_on_return noundef %123)
  %1106 = load ptr, ptr %6, align 8
  %1107 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 0
  store i32 0, ptr %1107, align 8
  %1108 = getelementptr i8, ptr %124, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1108, i8 0, i64 4, i1 false)
  %1109 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 1
  %1110 = load ptr, ptr %80, align 8
  store ptr %1110, ptr %1109, align 8
  %1111 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 2
  %1112 = call ptr @stringToIFJstring(ptr noundef @.str.31.147)
  store ptr %1112, ptr %1111, align 8
  %1113 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 3
  store ptr null, ptr %1113, align 8
  %1114 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 4
  store i32 0, ptr %1114, align 8
  %1115 = getelementptr i8, ptr %124, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1115, i8 0, i64 4, i1 false)
  %1116 = getelementptr inbounds nuw %struct.args, ptr %124, i32 0, i32 5
  store ptr null, ptr %1116, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %125, ptr align 8 %124, i64 48, i1 false)
  call void @generate_code(ptr noundef %1106, ptr dead_on_return noundef %125)
  %1117 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %126, i8 0, i64 48, i1 false)
  %1118 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 0
  store i32 48, ptr %1118, align 8
  %1119 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 1
  %1120 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 2
  %1121 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 3
  %1122 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 4
  %1123 = getelementptr inbounds nuw %struct.args, ptr %126, i32 0, i32 5
  %1124 = load ptr, ptr %99, align 8
  store ptr %1124, ptr %1123, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %127, ptr align 8 %126, i64 48, i1 false)
  call void @generate_code(ptr noundef %1117, ptr dead_on_return noundef %127)
  %1125 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %128, i8 0, i64 48, i1 false)
  %1126 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 0
  store i32 47, ptr %1126, align 8
  %1127 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 1
  %1128 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 2
  %1129 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 3
  %1130 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 4
  %1131 = getelementptr inbounds nuw %struct.args, ptr %128, i32 0, i32 5
  %1132 = load ptr, ptr %99, align 8
  store ptr %1132, ptr %1131, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %129, ptr align 8 %128, i64 48, i1 false)
  call void @generate_code(ptr noundef %1125, ptr dead_on_return noundef %129)
  %1133 = load ptr, ptr %6, align 8
  %1134 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 0
  store i32 49, ptr %1134, align 8
  %1135 = getelementptr i8, ptr %130, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1135, i8 0, i64 4, i1 false)
  %1136 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 1
  store ptr null, ptr %1136, align 8
  %1137 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 2
  %1138 = load ptr, ptr %85, align 8
  store ptr %1138, ptr %1137, align 8
  %1139 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 3
  %1140 = load ptr, ptr %86, align 8
  store ptr %1140, ptr %1139, align 8
  %1141 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 4
  store i32 0, ptr %1141, align 8
  %1142 = getelementptr i8, ptr %130, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1142, i8 0, i64 4, i1 false)
  %1143 = getelementptr inbounds nuw %struct.args, ptr %130, i32 0, i32 5
  %1144 = load ptr, ptr %101, align 8
  store ptr %1144, ptr %1143, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %131, ptr align 8 %130, i64 48, i1 false)
  call void @generate_code(ptr noundef %1133, ptr dead_on_return noundef %131)
  %1145 = load ptr, ptr %6, align 8
  %1146 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 0
  store i32 44, ptr %1146, align 8
  %1147 = getelementptr i8, ptr %132, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1147, i8 0, i64 4, i1 false)
  %1148 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 1
  %1149 = load ptr, ptr %89, align 8
  store ptr %1149, ptr %1148, align 8
  %1150 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 2
  %1151 = load ptr, ptr %10, align 8
  store ptr %1151, ptr %1150, align 8
  %1152 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 3
  %1153 = load ptr, ptr %85, align 8
  store ptr %1153, ptr %1152, align 8
  %1154 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 4
  store i32 0, ptr %1154, align 8
  %1155 = getelementptr i8, ptr %132, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1155, i8 0, i64 4, i1 false)
  %1156 = getelementptr inbounds nuw %struct.args, ptr %132, i32 0, i32 5
  store ptr null, ptr %1156, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %133, ptr align 8 %132, i64 48, i1 false)
  call void @generate_code(ptr noundef %1145, ptr dead_on_return noundef %133)
  %1157 = load ptr, ptr %6, align 8
  %1158 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 0
  store i32 42, ptr %1158, align 8
  %1159 = getelementptr i8, ptr %134, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1159, i8 0, i64 4, i1 false)
  %1160 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 1
  %1161 = load ptr, ptr %80, align 8
  store ptr %1161, ptr %1160, align 8
  %1162 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 2
  %1163 = load ptr, ptr %80, align 8
  store ptr %1163, ptr %1162, align 8
  %1164 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 3
  %1165 = load ptr, ptr %89, align 8
  store ptr %1165, ptr %1164, align 8
  %1166 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 4
  store i32 0, ptr %1166, align 8
  %1167 = getelementptr i8, ptr %134, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1167, i8 0, i64 4, i1 false)
  %1168 = getelementptr inbounds nuw %struct.args, ptr %134, i32 0, i32 5
  store ptr null, ptr %1168, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %135, ptr align 8 %134, i64 48, i1 false)
  call void @generate_code(ptr noundef %1157, ptr dead_on_return noundef %135)
  %1169 = load ptr, ptr %6, align 8
  %1170 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 0
  store i32 10, ptr %1170, align 8
  %1171 = getelementptr i8, ptr %136, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1171, i8 0, i64 4, i1 false)
  %1172 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 1
  %1173 = load ptr, ptr %88, align 8
  store ptr %1173, ptr %1172, align 8
  %1174 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 2
  %1175 = load ptr, ptr %88, align 8
  store ptr %1175, ptr %1174, align 8
  %1176 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 3
  %1177 = call ptr @numberToIFJstring(ptr noundef @.str.24.140, i32 noundef 0)
  store ptr %1177, ptr %1176, align 8
  %1178 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 4
  store i32 0, ptr %1178, align 8
  %1179 = getelementptr i8, ptr %136, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1179, i8 0, i64 4, i1 false)
  %1180 = getelementptr inbounds nuw %struct.args, ptr %136, i32 0, i32 5
  store ptr null, ptr %1180, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %137, ptr align 8 %136, i64 48, i1 false)
  call void @generate_code(ptr noundef %1169, ptr dead_on_return noundef %137)
  %1181 = load ptr, ptr %6, align 8
  %1182 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 0
  store i32 10, ptr %1182, align 8
  %1183 = getelementptr i8, ptr %138, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1183, i8 0, i64 4, i1 false)
  %1184 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 1
  %1185 = load ptr, ptr %85, align 8
  store ptr %1185, ptr %1184, align 8
  %1186 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 2
  %1187 = load ptr, ptr %85, align 8
  store ptr %1187, ptr %1186, align 8
  %1188 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 3
  %1189 = call ptr @numberToIFJstring(ptr noundef @.str.24.140, i32 noundef 0)
  store ptr %1189, ptr %1188, align 8
  %1190 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 4
  store i32 0, ptr %1190, align 8
  %1191 = getelementptr i8, ptr %138, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1191, i8 0, i64 4, i1 false)
  %1192 = getelementptr inbounds nuw %struct.args, ptr %138, i32 0, i32 5
  store ptr null, ptr %1192, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %139, ptr align 8 %138, i64 48, i1 false)
  call void @generate_code(ptr noundef %1181, ptr dead_on_return noundef %139)
  %1193 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %140, i8 0, i64 48, i1 false)
  %1194 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 0
  store i32 48, ptr %1194, align 8
  %1195 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 1
  %1196 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 2
  %1197 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 3
  %1198 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 4
  %1199 = getelementptr inbounds nuw %struct.args, ptr %140, i32 0, i32 5
  %1200 = load ptr, ptr %99, align 8
  store ptr %1200, ptr %1199, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %141, ptr align 8 %140, i64 48, i1 false)
  call void @generate_code(ptr noundef %1193, ptr dead_on_return noundef %141)
  %1201 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %142, i8 0, i64 48, i1 false)
  %1202 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 0
  store i32 47, ptr %1202, align 8
  %1203 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 1
  %1204 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 2
  %1205 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 3
  %1206 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 4
  %1207 = getelementptr inbounds nuw %struct.args, ptr %142, i32 0, i32 5
  %1208 = load ptr, ptr %100, align 8
  store ptr %1208, ptr %1207, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %143, ptr align 8 %142, i64 48, i1 false)
  call void @generate_code(ptr noundef %1201, ptr dead_on_return noundef %143)
  %1209 = load ptr, ptr %6, align 8
  %1210 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 0
  store i32 0, ptr %1210, align 8
  %1211 = getelementptr i8, ptr %144, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %1211, i8 0, i64 4, i1 false)
  %1212 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 1
  %1213 = load ptr, ptr %80, align 8
  store ptr %1213, ptr %1212, align 8
  %1214 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 2
  store ptr @.str.25.141, ptr %1214, align 8
  %1215 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 3
  store ptr null, ptr %1215, align 8
  %1216 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 4
  store i32 0, ptr %1216, align 8
  %1217 = getelementptr i8, ptr %144, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %1217, i8 0, i64 4, i1 false)
  %1218 = getelementptr inbounds nuw %struct.args, ptr %144, i32 0, i32 5
  store ptr null, ptr %1218, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %145, ptr align 8 %144, i64 48, i1 false)
  call void @generate_code(ptr noundef %1209, ptr dead_on_return noundef %145)
  %1219 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %146, i8 0, i64 48, i1 false)
  %1220 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 0
  store i32 48, ptr %1220, align 8
  %1221 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 1
  %1222 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 2
  %1223 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 3
  %1224 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 4
  %1225 = getelementptr inbounds nuw %struct.args, ptr %146, i32 0, i32 5
  %1226 = load ptr, ptr %101, align 8
  store ptr %1226, ptr %1225, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %147, ptr align 8 %146, i64 48, i1 false)
  call void @generate_code(ptr noundef %1219, ptr dead_on_return noundef %147)
  %1227 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %148, i8 0, i64 48, i1 false)
  %1228 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 0
  store i32 47, ptr %1228, align 8
  %1229 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 1
  %1230 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 2
  %1231 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 3
  %1232 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 4
  %1233 = getelementptr inbounds nuw %struct.args, ptr %148, i32 0, i32 5
  %1234 = load ptr, ptr %101, align 8
  store ptr %1234, ptr %1233, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %149, ptr align 8 %148, i64 48, i1 false)
  call void @generate_code(ptr noundef %1227, ptr dead_on_return noundef %149)
  br label %1307

1235:                                             ; preds = %181
  %1236 = load ptr, ptr %5, align 8
  %1237 = getelementptr inbounds nuw %struct.TrackValues, ptr %1236, i32 0, i32 1
  %1238 = load i32, ptr %1237, align 4
  %1239 = add nsw i32 %1238, 1
  store i32 %1239, ptr %1237, align 4
  %1240 = load ptr, ptr %5, align 8
  %1241 = getelementptr inbounds nuw %struct.TrackValues, ptr %1240, i32 0, i32 6
  %1242 = getelementptr inbounds nuw %struct.args, ptr %1241, i32 0, i32 3
  %1243 = load ptr, ptr %1242, align 8
  %1244 = icmp eq ptr %1243, null
  br i1 %1244, label %1245, label %1267

1245:                                             ; preds = %1235
  %1246 = load i32, ptr %8, align 4
  %1247 = icmp ne i32 %1246, 0
  br i1 %1247, label %1248, label %1262

1248:                                             ; preds = %1245
  %1249 = load i32, ptr %7, align 4
  %1250 = icmp ne i32 %1249, 3
  br i1 %1250, label %1251, label %1262

1251:                                             ; preds = %1248
  %1252 = load i32, ptr %7, align 4
  %1253 = icmp ne i32 %1252, 5
  br i1 %1253, label %1254, label %1262

1254:                                             ; preds = %1251
  %1255 = load ptr, ptr @__stderrp, align 8
  %1256 = load i32, ptr %7, align 4
  %1257 = call ptr @getTypeTokenSymbol(i32 noundef %1256)
  %1258 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1255, ptr noundef @.str.32.148, ptr noundef %1257) #11
  %1259 = load ptr, ptr @__stderrp, align 8
  %1260 = load i32, ptr %8, align 4
  %1261 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1259, ptr noundef @.str.33.149, i32 noundef %1260) #11
  call void @print_error(i32 noundef 4)
  br label %1262

1262:                                             ; preds = %1254, %1251, %1248, %1245
  %1263 = load ptr, ptr %10, align 8
  %1264 = load ptr, ptr %5, align 8
  %1265 = getelementptr inbounds nuw %struct.TrackValues, ptr %1264, i32 0, i32 6
  %1266 = getelementptr inbounds nuw %struct.args, ptr %1265, i32 0, i32 3
  store ptr %1263, ptr %1266, align 8
  br label %1307

1267:                                             ; preds = %1235
  %1268 = load i32, ptr %8, align 4
  %1269 = icmp ne i32 %1268, 2
  br i1 %1269, label %1270, label %1274

1270:                                             ; preds = %1267
  %1271 = load ptr, ptr @__stderrp, align 8
  %1272 = load i32, ptr %8, align 4
  %1273 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1271, ptr noundef @.str.34.150, i32 noundef %1272) #11
  call void @print_error(i32 noundef 4)
  br label %1274

1274:                                             ; preds = %1270, %1267
  %1275 = load ptr, ptr %10, align 8
  %1276 = load ptr, ptr %5, align 8
  %1277 = getelementptr inbounds nuw %struct.TrackValues, ptr %1276, i32 0, i32 6
  %1278 = getelementptr inbounds nuw %struct.args, ptr %1277, i32 0, i32 2
  store ptr %1275, ptr %1278, align 8
  %1279 = load ptr, ptr %5, align 8
  %1280 = getelementptr inbounds nuw %struct.TrackValues, ptr %1279, i32 0, i32 6
  %1281 = getelementptr inbounds nuw %struct.args, ptr %1280, i32 0, i32 0
  store i32 35, ptr %1281, align 8
  %1282 = load ptr, ptr %5, align 8
  %1283 = getelementptr inbounds nuw %struct.TrackValues, ptr %1282, i32 0, i32 5
  %1284 = load ptr, ptr %1283, align 8
  %1285 = load ptr, ptr %5, align 8
  %1286 = getelementptr inbounds nuw %struct.TrackValues, ptr %1285, i32 0, i32 6
  %1287 = getelementptr inbounds nuw %struct.args, ptr %1286, i32 0, i32 1
  store ptr %1284, ptr %1287, align 8
  %1288 = load ptr, ptr %5, align 8
  %1289 = getelementptr inbounds nuw %struct.TrackValues, ptr %1288, i32 0, i32 6
  %1290 = getelementptr inbounds nuw %struct.args, ptr %1289, i32 0, i32 2
  %1291 = load ptr, ptr %1290, align 8
  %1292 = icmp eq ptr %1291, null
  br i1 %1292, label %1299, label %1293

1293:                                             ; preds = %1274
  %1294 = load ptr, ptr %5, align 8
  %1295 = getelementptr inbounds nuw %struct.TrackValues, ptr %1294, i32 0, i32 6
  %1296 = getelementptr inbounds nuw %struct.args, ptr %1295, i32 0, i32 3
  %1297 = load ptr, ptr %1296, align 8
  %1298 = icmp eq ptr %1297, null
  br i1 %1298, label %1299, label %1300

1299:                                             ; preds = %1293, %1274
  call void @print_error(i32 noundef 4)
  br label %1300

1300:                                             ; preds = %1299, %1293
  %1301 = load ptr, ptr %6, align 8
  %1302 = load ptr, ptr %5, align 8
  %1303 = getelementptr inbounds nuw %struct.TrackValues, ptr %1302, i32 0, i32 6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %150, ptr align 8 %1303, i64 48, i1 false)
  call void @generate_code(ptr noundef %1301, ptr dead_on_return noundef %150)
  br label %1307

1304:                                             ; preds = %181
  %1305 = load ptr, ptr @__stderrp, align 8
  %1306 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1305, ptr noundef @.str.35.151) #11
  br label %1307

1307:                                             ; preds = %1304, %1300, %1262, %865, %834, %813, %490, %459, %417, %386, %346, %308, %275, %244, %203, %188, %162
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @evaluate(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.args, align 8
  %13 = alloca %struct.args, align 8
  %14 = alloca %struct.args, align 8
  %15 = alloca %struct.args, align 8
  %16 = alloca %struct.args, align 8
  %17 = alloca %struct.args, align 8
  %18 = alloca %struct.args, align 8
  %19 = alloca %struct.args, align 8
  %20 = alloca %struct.args, align 8
  %21 = alloca %struct.args, align 8
  %22 = alloca %struct.args, align 8
  %23 = alloca %struct.args, align 8
  %24 = alloca ptr, align 8
  %25 = alloca %struct.args, align 8
  %26 = alloca %struct.args, align 8
  %27 = alloca %struct.args, align 8
  %28 = alloca %struct.args, align 8
  %29 = alloca %struct.args, align 8
  %30 = alloca %struct.args, align 8
  %31 = alloca %struct.args, align 8
  %32 = alloca %struct.args, align 8
  %33 = alloca %struct.args, align 8
  %34 = alloca %struct.args, align 8
  %35 = alloca %struct.args, align 8
  %36 = alloca %struct.args, align 8
  %37 = alloca %struct.args, align 8
  %38 = alloca %struct.args, align 8
  %39 = alloca %struct.args, align 8
  %40 = alloca %struct.args, align 8
  %41 = alloca %struct.args, align 8
  %42 = alloca %struct.args, align 8
  %43 = alloca %struct.args, align 8
  %44 = alloca %struct.args, align 8
  %45 = alloca %struct.args, align 8
  %46 = alloca %struct.args, align 8
  %47 = alloca %struct.args, align 8
  %48 = alloca %struct.args, align 8
  %49 = alloca %struct.args, align 8
  %50 = alloca %struct.args, align 8
  %51 = alloca %struct.args, align 8
  %52 = alloca %struct.args, align 8
  %53 = alloca %struct.args, align 8
  %54 = alloca %struct.args, align 8
  %55 = alloca %struct.args, align 8
  %56 = alloca %struct.args, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = icmp eq ptr %57, null
  br i1 %58, label %59, label %60

59:                                               ; preds = %4
  br label %450

60:                                               ; preds = %4
  %61 = load ptr, ptr %5, align 8
  %62 = getelementptr inbounds nuw %struct.ast, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = load ptr, ptr %7, align 8
  %66 = load ptr, ptr %8, align 8
  call void @evaluate(ptr noundef %63, ptr noundef %64, ptr noundef %65, ptr noundef %66)
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds nuw %struct.ast, ptr %67, i32 0, i32 3
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %6, align 8
  %71 = load ptr, ptr %7, align 8
  %72 = load ptr, ptr %8, align 8
  call void @evaluate(ptr noundef %69, ptr noundef %70, ptr noundef %71, ptr noundef %72)
  %73 = load ptr, ptr @__stderrp, align 8
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds nuw %struct.ast, ptr %74, i32 0, i32 1
  %76 = getelementptr inbounds nuw %struct.Token, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = call ptr @getTypeTokenName(i32 noundef %77)
  %79 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %73, ptr noundef @.str.36.152, ptr noundef %78) #11
  %80 = load ptr, ptr %5, align 8
  %81 = getelementptr inbounds nuw %struct.ast, ptr %80, i32 0, i32 1
  %82 = getelementptr inbounds nuw %struct.Token, ptr %81, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  store ptr %83, ptr %9, align 8
  store i32 4, ptr %10, align 4
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds nuw %struct.TrackValues, ptr %84, i32 0, i32 3
  %86 = load i8, ptr %85, align 1
  %87 = trunc i8 %86 to i1
  br i1 %87, label %88, label %93

88:                                               ; preds = %60
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds nuw %struct.ast, ptr %89, i32 0, i32 1
  %91 = load ptr, ptr %8, align 8
  %92 = load ptr, ptr %7, align 8
  call void @addArgsToIFJFunction(ptr noundef %90, ptr noundef %91, ptr noundef %92)
  br label %450

93:                                               ; preds = %60
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds nuw %struct.ast, ptr %94, i32 0, i32 1
  %96 = getelementptr inbounds nuw %struct.Token, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  switch i32 %97, label %441 [
    i32 39, label %98
    i32 3, label %107
    i32 5, label %107
    i32 4, label %107
    i32 6, label %107
    i32 1, label %215
    i32 8, label %326
    i32 9, label %336
    i32 10, label %346
    i32 11, label %356
    i32 14, label %366
    i32 15, label %376
    i32 24, label %386
    i32 25, label %396
    i32 26, label %406
    i32 27, label %423
    i32 31, label %440
  ]

98:                                               ; preds = %93
  %99 = load ptr, ptr %6, align 8
  store i32 4, ptr %99, align 4
  %100 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 48, i1 false)
  %101 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 0
  store i32 7, ptr %101, align 8
  %102 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 1
  %103 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 2
  store ptr @.str.25.141, ptr %103, align 8
  %104 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 3
  %105 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 4
  %106 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 48, i1 false)
  call void @generate_code(ptr noundef %100, ptr dead_on_return noundef %13)
  br label %449

107:                                              ; preds = %93, %93, %93, %93
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr inbounds nuw %struct.TrackValues, ptr %108, i32 0, i32 1
  %110 = load i32, ptr %109, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %109, align 4
  %112 = load ptr, ptr %6, align 8
  %113 = load i32, ptr %112, align 4
  %114 = icmp ne i32 %113, 1
  br i1 %114, label %115, label %155

115:                                              ; preds = %107
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds nuw %struct.ast, ptr %116, i32 0, i32 1
  %118 = getelementptr inbounds nuw %struct.Token, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 4
  br i1 %120, label %127, label %121

121:                                              ; preds = %115
  %122 = load ptr, ptr %5, align 8
  %123 = getelementptr inbounds nuw %struct.ast, ptr %122, i32 0, i32 1
  %124 = getelementptr inbounds nuw %struct.Token, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = icmp eq i32 %125, 6
  br i1 %126, label %127, label %155

127:                                              ; preds = %121, %115
  %128 = load ptr, ptr %7, align 8
  %129 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 0
  store i32 32, ptr %129, align 8
  %130 = getelementptr i8, ptr %14, i64 4
  call void @llvm.memset.p0.i64(ptr align 4 %130, i8 0, i64 4, i1 false)
  %131 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 1
  store ptr @.str.37.153, ptr %131, align 8
  %132 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 2
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds nuw %struct.ast, ptr %133, i32 0, i32 1
  %135 = getelementptr inbounds nuw %struct.Token, ptr %134, i32 0, i32 1
  %136 = load ptr, ptr %135, align 8
  store ptr %136, ptr %132, align 8
  %137 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 3
  store ptr null, ptr %137, align 8
  %138 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 4
  store i32 0, ptr %138, align 8
  %139 = getelementptr i8, ptr %14, i64 36
  call void @llvm.memset.p0.i64(ptr align 4 %139, i8 0, i64 4, i1 false)
  %140 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 5
  store ptr null, ptr %140, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %14, i64 48, i1 false)
  call void @generate_code(ptr noundef %128, ptr dead_on_return noundef %15)
  %141 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 48, i1 false)
  %142 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 0
  store i32 7, ptr %142, align 8
  %143 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 1
  %144 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 2
  store ptr @.str.37.153, ptr %144, align 8
  %145 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 3
  %146 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 4
  %147 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %17, ptr align 8 %16, i64 48, i1 false)
  call void @generate_code(ptr noundef %141, ptr dead_on_return noundef %17)
  %148 = load ptr, ptr @__stderrp, align 8
  %149 = load ptr, ptr %5, align 8
  %150 = getelementptr inbounds nuw %struct.ast, ptr %149, i32 0, i32 1
  %151 = getelementptr inbounds nuw %struct.Token, ptr %150, i32 0, i32 1
  %152 = load ptr, ptr %151, align 8
  %153 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %148, ptr noundef @.str.38.154, ptr noundef %152) #11
  %154 = load ptr, ptr %6, align 8
  store i32 1, ptr %154, align 4
  br label %449

155:                                              ; preds = %121, %107
  %156 = load ptr, ptr @__stderrp, align 8
  %157 = load ptr, ptr %5, align 8
  %158 = getelementptr inbounds nuw %struct.ast, ptr %157, i32 0, i32 1
  %159 = getelementptr inbounds nuw %struct.Token, ptr %158, i32 0, i32 1
  %160 = load ptr, ptr %159, align 8
  %161 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %156, ptr noundef @.str.39.155, ptr noundef %160) #11
  %162 = load ptr, ptr %6, align 8
  %163 = load i32, ptr %162, align 4
  %164 = icmp eq i32 %163, 1
  br i1 %164, label %165, label %196

165:                                              ; preds = %155
  %166 = load ptr, ptr %5, align 8
  %167 = getelementptr inbounds nuw %struct.ast, ptr %166, i32 0, i32 1
  %168 = getelementptr inbounds nuw %struct.Token, ptr %167, i32 0, i32 0
  %169 = load i32, ptr %168, align 8
  %170 = icmp eq i32 %169, 3
  br i1 %170, label %177, label %171

171:                                              ; preds = %165
  %172 = load ptr, ptr %5, align 8
  %173 = getelementptr inbounds nuw %struct.ast, ptr %172, i32 0, i32 1
  %174 = getelementptr inbounds nuw %struct.Token, ptr %173, i32 0, i32 0
  %175 = load i32, ptr %174, align 8
  %176 = icmp eq i32 %175, 5
  br i1 %176, label %177, label %196

177:                                              ; preds = %171, %165
  %178 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %18, i8 0, i64 48, i1 false)
  %179 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 0
  store i32 7, ptr %179, align 8
  %180 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 1
  %181 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 2
  %182 = load ptr, ptr %5, align 8
  %183 = getelementptr inbounds nuw %struct.ast, ptr %182, i32 0, i32 1
  %184 = getelementptr inbounds nuw %struct.Token, ptr %183, i32 0, i32 1
  %185 = load ptr, ptr %184, align 8
  %186 = call ptr @numberToIFJstring(ptr noundef %185, i32 noundef 1)
  store ptr %186, ptr %181, align 8
  %187 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 3
  %188 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 4
  %189 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %19, ptr align 8 %18, i64 48, i1 false)
  call void @generate_code(ptr noundef %178, ptr dead_on_return noundef %19)
  %190 = load ptr, ptr @__stderrp, align 8
  %191 = load ptr, ptr %5, align 8
  %192 = getelementptr inbounds nuw %struct.ast, ptr %191, i32 0, i32 1
  %193 = getelementptr inbounds nuw %struct.Token, ptr %192, i32 0, i32 1
  %194 = load ptr, ptr %193, align 8
  %195 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %190, ptr noundef @.str.40.156, ptr noundef %194) #11
  br label %449

196:                                              ; preds = %171, %155
  %197 = load ptr, ptr %6, align 8
  %198 = load i32, ptr %197, align 4
  %199 = icmp eq i32 %198, 4
  br i1 %199, label %200, label %202

200:                                              ; preds = %196
  %201 = load ptr, ptr %6, align 8
  store i32 0, ptr %201, align 4
  br label %202

202:                                              ; preds = %200, %196
  %203 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %20, i8 0, i64 48, i1 false)
  %204 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 0
  store i32 7, ptr %204, align 8
  %205 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 1
  %206 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 2
  %207 = load ptr, ptr %5, align 8
  %208 = getelementptr inbounds nuw %struct.ast, ptr %207, i32 0, i32 1
  %209 = getelementptr inbounds nuw %struct.Token, ptr %208, i32 0, i32 1
  %210 = load ptr, ptr %209, align 8
  %211 = call ptr @numberToIFJstring(ptr noundef %210, i32 noundef 0)
  store ptr %211, ptr %206, align 8
  %212 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 3
  %213 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 4
  %214 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %21, ptr align 8 %20, i64 48, i1 false)
  call void @generate_code(ptr noundef %203, ptr dead_on_return noundef %21)
  br label %449

215:                                              ; preds = %93
  %216 = load ptr, ptr %8, align 8
  %217 = getelementptr inbounds nuw %struct.TrackValues, ptr %216, i32 0, i32 5
  %218 = load ptr, ptr %217, align 8
  %219 = call i32 @strcmp(ptr noundef %218, ptr noundef @.str.41.157) #11
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %221, label %224

221:                                              ; preds = %215
  %222 = load ptr, ptr %8, align 8
  %223 = getelementptr inbounds nuw %struct.TrackValues, ptr %222, i32 0, i32 7
  store i8 1, ptr %223, align 8
  br label %224

224:                                              ; preds = %221, %215
  %225 = load ptr, ptr %8, align 8
  %226 = load ptr, ptr %9, align 8
  %227 = call i32 @searchID(ptr noundef %225, ptr noundef %226, ptr noundef %10)
  store i32 %227, ptr %11, align 4
  %228 = load i32, ptr %11, align 4
  %229 = icmp eq i32 %228, 3
  br i1 %229, label %230, label %234

230:                                              ; preds = %224
  %231 = load ptr, ptr @__stderrp, align 8
  %232 = load ptr, ptr %9, align 8
  %233 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %231, ptr noundef @.str.42.158, ptr noundef %232) #11
  call void @print_error(i32 noundef 3)
  br label %234

234:                                              ; preds = %230, %224
  %235 = load i32, ptr %11, align 4
  %236 = icmp eq i32 %235, 2
  br i1 %236, label %237, label %240

237:                                              ; preds = %234
  %238 = load ptr, ptr @__stderrp, align 8
  %239 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %238, ptr noundef @.str.43.159) #11
  call void @print_error(i32 noundef 7)
  br label %240

240:                                              ; preds = %237, %234
  %241 = load i32, ptr %11, align 4
  %242 = icmp eq i32 %241, 1
  br i1 %242, label %243, label %257

243:                                              ; preds = %240
  %244 = load ptr, ptr @__stderrp, align 8
  %245 = load ptr, ptr %9, align 8
  %246 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %244, ptr noundef @.str.44.160, ptr noundef %245) #11
  %247 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %22, i8 0, i64 48, i1 false)
  %248 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 0
  store i32 5, ptr %248, align 8
  %249 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 1
  %250 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 2
  %251 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 3
  %252 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 4
  %253 = getelementptr inbounds nuw %struct.args, ptr %22, i32 0, i32 5
  %254 = load ptr, ptr %9, align 8
  store ptr %254, ptr %253, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %22, i64 48, i1 false)
  call void @generate_code(ptr noundef %247, ptr dead_on_return noundef %23)
  %255 = load ptr, ptr %8, align 8
  %256 = getelementptr inbounds nuw %struct.TrackValues, ptr %255, i32 0, i32 2
  store i8 0, ptr %256, align 8
  br label %449

257:                                              ; preds = %240
  %258 = load ptr, ptr %8, align 8
  %259 = getelementptr inbounds nuw %struct.TrackValues, ptr %258, i32 0, i32 5
  %260 = load ptr, ptr %259, align 8
  %261 = call i32 @strcmp(ptr noundef %260, ptr noundef @.str.41.157) #11
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %268

263:                                              ; preds = %257
  %264 = load ptr, ptr @__stderrp, align 8
  %265 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %264, ptr noundef @.str.45.161) #11
  %266 = load ptr, ptr %8, align 8
  %267 = getelementptr inbounds nuw %struct.TrackValues, ptr %266, i32 0, i32 2
  store i8 0, ptr %267, align 8
  br label %449

268:                                              ; preds = %257
  %269 = load ptr, ptr %9, align 8
  %270 = call ptr @addFramePrefix(ptr noundef @.str.7.123, ptr noundef %269)
  store ptr %270, ptr %24, align 8
  %271 = load ptr, ptr %6, align 8
  %272 = load i32, ptr %271, align 4
  %273 = icmp eq i32 %272, 4
  br i1 %273, label %274, label %277

274:                                              ; preds = %268
  %275 = load i32, ptr %10, align 4
  %276 = load ptr, ptr %6, align 8
  store i32 %275, ptr %276, align 4
  br label %277

277:                                              ; preds = %274, %268
  %278 = load i32, ptr %10, align 4
  switch i32 %278, label %317 [
    i32 0, label %279
    i32 1, label %288
    i32 2, label %297
    i32 4, label %306
  ]

279:                                              ; preds = %277
  %280 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %25, i8 0, i64 48, i1 false)
  %281 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 0
  store i32 7, ptr %281, align 8
  %282 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 1
  %283 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 2
  %284 = load ptr, ptr %24, align 8
  store ptr %284, ptr %283, align 8
  %285 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 3
  %286 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 4
  %287 = getelementptr inbounds nuw %struct.args, ptr %25, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %26, ptr align 8 %25, i64 48, i1 false)
  call void @generate_code(ptr noundef %280, ptr dead_on_return noundef %26)
  br label %321

288:                                              ; preds = %277
  %289 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %27, i8 0, i64 48, i1 false)
  %290 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 0
  store i32 7, ptr %290, align 8
  %291 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 1
  %292 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 2
  %293 = load ptr, ptr %24, align 8
  store ptr %293, ptr %292, align 8
  %294 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 3
  %295 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 4
  %296 = getelementptr inbounds nuw %struct.args, ptr %27, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %28, ptr align 8 %27, i64 48, i1 false)
  call void @generate_code(ptr noundef %289, ptr dead_on_return noundef %28)
  br label %321

297:                                              ; preds = %277
  %298 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %29, i8 0, i64 48, i1 false)
  %299 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 0
  store i32 7, ptr %299, align 8
  %300 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 1
  %301 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 2
  %302 = load ptr, ptr %24, align 8
  store ptr %302, ptr %301, align 8
  %303 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 3
  %304 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 4
  %305 = getelementptr inbounds nuw %struct.args, ptr %29, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %30, ptr align 8 %29, i64 48, i1 false)
  call void @generate_code(ptr noundef %298, ptr dead_on_return noundef %30)
  br label %321

306:                                              ; preds = %277
  %307 = load ptr, ptr @__stderrp, align 8
  %308 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %307, ptr noundef @.str.46.162) #11
  %309 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %31, i8 0, i64 48, i1 false)
  %310 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 0
  store i32 7, ptr %310, align 8
  %311 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 1
  %312 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 2
  %313 = load ptr, ptr %24, align 8
  store ptr %313, ptr %312, align 8
  %314 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 3
  %315 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 4
  %316 = getelementptr inbounds nuw %struct.args, ptr %31, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %32, ptr align 8 %31, i64 48, i1 false)
  call void @generate_code(ptr noundef %309, ptr dead_on_return noundef %32)
  br label %321

317:                                              ; preds = %277
  %318 = load ptr, ptr @__stderrp, align 8
  %319 = load i32, ptr %10, align 4
  %320 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %318, ptr noundef @.str.47.163, i32 noundef %319) #11
  call void @print_error(i32 noundef 2)
  br label %321

321:                                              ; preds = %317, %306, %297, %288, %279
  %322 = load ptr, ptr %8, align 8
  %323 = getelementptr inbounds nuw %struct.TrackValues, ptr %322, i32 0, i32 1
  %324 = load i32, ptr %323, align 4
  %325 = add nsw i32 %324, 1
  store i32 %325, ptr %323, align 4
  br label %449

326:                                              ; preds = %93
  %327 = load ptr, ptr @__stderrp, align 8
  %328 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %327, ptr noundef @.str.48.164) #11
  %329 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %33, i8 0, i64 48, i1 false)
  %330 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 0
  store i32 15, ptr %330, align 8
  %331 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 1
  %332 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 2
  %333 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 3
  %334 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 4
  %335 = getelementptr inbounds nuw %struct.args, ptr %33, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %34, ptr align 8 %33, i64 48, i1 false)
  call void @generate_code(ptr noundef %329, ptr dead_on_return noundef %34)
  br label %449

336:                                              ; preds = %93
  %337 = load ptr, ptr @__stderrp, align 8
  %338 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %337, ptr noundef @.str.49.165) #11
  %339 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %35, i8 0, i64 48, i1 false)
  %340 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 0
  store i32 16, ptr %340, align 8
  %341 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 1
  %342 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 2
  %343 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 3
  %344 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 4
  %345 = getelementptr inbounds nuw %struct.args, ptr %35, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %36, ptr align 8 %35, i64 48, i1 false)
  call void @generate_code(ptr noundef %339, ptr dead_on_return noundef %36)
  br label %449

346:                                              ; preds = %93
  %347 = load ptr, ptr @__stderrp, align 8
  %348 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %347, ptr noundef @.str.50.166) #11
  %349 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %37, i8 0, i64 48, i1 false)
  %350 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 0
  store i32 17, ptr %350, align 8
  %351 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 1
  %352 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 2
  %353 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 3
  %354 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 4
  %355 = getelementptr inbounds nuw %struct.args, ptr %37, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %38, ptr align 8 %37, i64 48, i1 false)
  call void @generate_code(ptr noundef %349, ptr dead_on_return noundef %38)
  br label %449

356:                                              ; preds = %93
  %357 = load ptr, ptr @__stderrp, align 8
  %358 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %357, ptr noundef @.str.51.167) #11
  %359 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %39, i8 0, i64 48, i1 false)
  %360 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 0
  store i32 19, ptr %360, align 8
  %361 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 1
  %362 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 2
  %363 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 3
  %364 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 4
  %365 = getelementptr inbounds nuw %struct.args, ptr %39, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %40, ptr align 8 %39, i64 48, i1 false)
  call void @generate_code(ptr noundef %359, ptr dead_on_return noundef %40)
  br label %449

366:                                              ; preds = %93
  %367 = load ptr, ptr @__stderrp, align 8
  %368 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %367, ptr noundef @.str.52.168) #11
  %369 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %41, i8 0, i64 48, i1 false)
  %370 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 0
  store i32 25, ptr %370, align 8
  %371 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 1
  %372 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 2
  %373 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 3
  %374 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 4
  %375 = getelementptr inbounds nuw %struct.args, ptr %41, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %42, ptr align 8 %41, i64 48, i1 false)
  call void @generate_code(ptr noundef %369, ptr dead_on_return noundef %42)
  br label %449

376:                                              ; preds = %93
  %377 = load ptr, ptr @__stderrp, align 8
  %378 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %377, ptr noundef @.str.53.169) #11
  %379 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %43, i8 0, i64 48, i1 false)
  %380 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 0
  store i32 31, ptr %380, align 8
  %381 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 1
  %382 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 2
  %383 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 3
  %384 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 4
  %385 = getelementptr inbounds nuw %struct.args, ptr %43, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %44, ptr align 8 %43, i64 48, i1 false)
  call void @generate_code(ptr noundef %379, ptr dead_on_return noundef %44)
  br label %449

386:                                              ; preds = %93
  %387 = load ptr, ptr @__stderrp, align 8
  %388 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %387, ptr noundef @.str.54.170) #11
  %389 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %45, i8 0, i64 48, i1 false)
  %390 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 0
  store i32 23, ptr %390, align 8
  %391 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 1
  %392 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 2
  %393 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 3
  %394 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 4
  %395 = getelementptr inbounds nuw %struct.args, ptr %45, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %46, ptr align 8 %45, i64 48, i1 false)
  call void @generate_code(ptr noundef %389, ptr dead_on_return noundef %46)
  br label %449

396:                                              ; preds = %93
  %397 = load ptr, ptr @__stderrp, align 8
  %398 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %397, ptr noundef @.str.55.171) #11
  %399 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %47, i8 0, i64 48, i1 false)
  %400 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 0
  store i32 24, ptr %400, align 8
  %401 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 1
  %402 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 2
  %403 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 3
  %404 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 4
  %405 = getelementptr inbounds nuw %struct.args, ptr %47, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %48, ptr align 8 %47, i64 48, i1 false)
  call void @generate_code(ptr noundef %399, ptr dead_on_return noundef %48)
  br label %449

406:                                              ; preds = %93
  %407 = load ptr, ptr @__stderrp, align 8
  %408 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %407, ptr noundef @.str.56.172) #11
  %409 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %49, i8 0, i64 48, i1 false)
  %410 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 0
  store i32 24, ptr %410, align 8
  %411 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 1
  %412 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 2
  %413 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 3
  %414 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 4
  %415 = getelementptr inbounds nuw %struct.args, ptr %49, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %50, ptr align 8 %49, i64 48, i1 false)
  call void @generate_code(ptr noundef %409, ptr dead_on_return noundef %50)
  %416 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %51, i8 0, i64 48, i1 false)
  %417 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 0
  store i32 31, ptr %417, align 8
  %418 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 1
  %419 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 2
  %420 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 3
  %421 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 4
  %422 = getelementptr inbounds nuw %struct.args, ptr %51, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %52, ptr align 8 %51, i64 48, i1 false)
  call void @generate_code(ptr noundef %416, ptr dead_on_return noundef %52)
  br label %449

423:                                              ; preds = %93
  %424 = load ptr, ptr @__stderrp, align 8
  %425 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %424, ptr noundef @.str.57.173) #11
  %426 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %53, i8 0, i64 48, i1 false)
  %427 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 0
  store i32 23, ptr %427, align 8
  %428 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 1
  %429 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 2
  %430 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 3
  %431 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 4
  %432 = getelementptr inbounds nuw %struct.args, ptr %53, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %54, ptr align 8 %53, i64 48, i1 false)
  call void @generate_code(ptr noundef %426, ptr dead_on_return noundef %54)
  %433 = load ptr, ptr %7, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %55, i8 0, i64 48, i1 false)
  %434 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 0
  store i32 31, ptr %434, align 8
  %435 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 1
  %436 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 2
  %437 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 3
  %438 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 4
  %439 = getelementptr inbounds nuw %struct.args, ptr %55, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %56, ptr align 8 %55, i64 48, i1 false)
  call void @generate_code(ptr noundef %433, ptr dead_on_return noundef %56)
  br label %449

440:                                              ; preds = %93
  br label %449

441:                                              ; preds = %93
  %442 = load ptr, ptr @__stderrp, align 8
  %443 = load ptr, ptr %5, align 8
  %444 = getelementptr inbounds nuw %struct.ast, ptr %443, i32 0, i32 1
  %445 = getelementptr inbounds nuw %struct.Token, ptr %444, i32 0, i32 0
  %446 = load i32, ptr %445, align 8
  %447 = call ptr @getTypeTokenName(i32 noundef %446)
  %448 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %442, ptr noundef @.str.58.174, ptr noundef %447) #11
  call void @print_error(i32 noundef 2)
  br label %449

449:                                              ; preds = %441, %440, %423, %406, %396, %386, %376, %366, %356, %346, %336, %326, %321, %263, %243, %202, %177, %127, %98
  br label %450

450:                                              ; preds = %449, %88, %59
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @eval_wrapper(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca %struct.TrackValues, align 8
  %16 = alloca ptr, align 8
  %17 = alloca %struct.args, align 8
  %18 = alloca %struct.args, align 8
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  %19 = load ptr, ptr %11, align 8
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @.str.59.175) #11
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %7
  %23 = load ptr, ptr %11, align 8
  %24 = call i32 @strcmp(ptr noundef %23, ptr noundef @.str.7.123) #11
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %38, label %26

26:                                               ; preds = %22, %7
  %27 = load ptr, ptr %9, align 8
  %28 = icmp eq ptr %27, null
  br i1 %28, label %38, label %29

29:                                               ; preds = %26
  %30 = load ptr, ptr %10, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %38, label %32

32:                                               ; preds = %29
  %33 = load ptr, ptr %13, align 8
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %41

35:                                               ; preds = %32
  %36 = load ptr, ptr %14, align 8
  %37 = icmp eq ptr %36, null
  br i1 %37, label %38, label %41

38:                                               ; preds = %35, %29, %26, %22
  %39 = load ptr, ptr @__stderrp, align 8
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.60.176) #11
  call void @print_error(i32 noundef 99)
  br label %41

41:                                               ; preds = %38, %35, %32
  %42 = load ptr, ptr %11, align 8
  %43 = load ptr, ptr %12, align 8
  %44 = load ptr, ptr %13, align 8
  %45 = load ptr, ptr %14, align 8
  call void @init_data(ptr noundef %15, ptr noundef %42, ptr noundef %43, ptr noundef %44, ptr noundef %45)
  %46 = load ptr, ptr %8, align 8
  %47 = load ptr, ptr %9, align 8
  %48 = load ptr, ptr %10, align 8
  call void @isRootIFJfunction(ptr noundef %46, ptr noundef %47, ptr noundef %15, ptr noundef %48)
  %49 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 3
  %50 = load i8, ptr %49, align 1
  %51 = trunc i8 %50 to i1
  br i1 %51, label %52, label %56

52:                                               ; preds = %41
  %53 = load ptr, ptr %8, align 8
  %54 = getelementptr inbounds nuw %struct.ast, ptr %53, i32 0, i32 3
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %8, align 8
  br label %56

56:                                               ; preds = %52, %41
  %57 = load ptr, ptr %8, align 8
  %58 = load ptr, ptr %10, align 8
  %59 = load ptr, ptr %9, align 8
  call void @evaluate(ptr noundef %57, ptr noundef %58, ptr noundef %59, ptr noundef %15)
  %60 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = icmp ne i32 %61, -1
  br i1 %62, label %63, label %78

63:                                               ; preds = %56
  %64 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 1
  %67 = load i32, ptr %66, align 4
  %68 = icmp ne i32 %65, %67
  br i1 %68, label %69, label %78

69:                                               ; preds = %63
  %70 = load ptr, ptr @__stderrp, align 8
  %71 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %70, ptr noundef @.str.61.177) #11
  %72 = load ptr, ptr @__stderrp, align 8
  %73 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 0
  %74 = load i32, ptr %73, align 8
  %75 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 1
  %76 = load i32, ptr %75, align 4
  %77 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %72, ptr noundef @.str.62.178, i32 noundef %74, i32 noundef %76) #11
  call void @print_error(i32 noundef 4)
  br label %85

78:                                               ; preds = %63, %56
  %79 = load ptr, ptr @__stderrp, align 8
  %80 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 1
  %83 = load i32, ptr %82, align 4
  %84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %79, ptr noundef @.str.63.179, i32 noundef %81, i32 noundef %83) #11
  br label %85

85:                                               ; preds = %78, %69
  %86 = getelementptr inbounds nuw %struct.TrackValues, ptr %15, i32 0, i32 2
  %87 = load i8, ptr %86, align 8
  %88 = trunc i8 %87 to i1
  br i1 %88, label %89, label %106

89:                                               ; preds = %85
  %90 = load ptr, ptr %12, align 8
  %91 = call i32 @strcmp(ptr noundef %90, ptr noundef @.str.64.180) #11
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %106

93:                                               ; preds = %89
  %94 = load ptr, ptr %9, align 8
  %95 = load ptr, ptr %12, align 8
  %96 = load ptr, ptr %13, align 8
  %97 = call ptr @defVar(ptr noundef %94, ptr noundef @.str.7.123, ptr noundef %95, ptr noundef %96)
  store ptr %97, ptr %16, align 8
  %98 = load ptr, ptr %9, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %17, i8 0, i64 48, i1 false)
  %99 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 0
  store i32 8, ptr %99, align 8
  %100 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 1
  %101 = load ptr, ptr %16, align 8
  store ptr %101, ptr %100, align 8
  %102 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 2
  %103 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 3
  %104 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 4
  %105 = getelementptr inbounds nuw %struct.args, ptr %17, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %18, ptr align 8 %17, i64 48, i1 false)
  call void @generate_code(ptr noundef %98, ptr dead_on_return noundef %18)
  br label %106

106:                                              ; preds = %93, %89, %85
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @ast_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.ast_stack, ptr %3, i32 0, i32 1
  store i32 -1, ptr %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @ast_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.ast_stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, -1
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @ast_full(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.ast_stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 511
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @ast_push(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @ast_full(ptr noundef %6)
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i1 false, ptr %3, align 1
  br label %19

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.ast_stack, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.ast_stack, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [512 x ptr], ptr %12, i64 0, i64 %17
  store ptr %10, ptr %18, align 8
  store i1 true, ptr %3, align 1
  br label %19

19:                                               ; preds = %9, %8
  %20 = load i1, ptr %3, align 1
  ret i1 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @ast_pop(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call zeroext i1 @ast_empty(ptr noundef %4)
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %17

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.ast_stack, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.ast_stack, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = add nsw i32 %12, -1
  store i32 %13, ptr %11, align 8
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds [512 x ptr], ptr %9, i64 0, i64 %14
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %2, align 8
  br label %17

17:                                               ; preds = %7, %6
  %18 = load ptr, ptr %2, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @ast_top(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call zeroext i1 @ast_empty(ptr noundef %4)
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %16

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.ast_stack, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.ast_stack, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [512 x ptr], ptr %9, i64 0, i64 %13
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %2, align 8
  br label %16

16:                                               ; preds = %7, %6
  %17 = load ptr, ptr %2, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @ast_peak(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.ast_stack, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp sgt i32 %8, %11
  br i1 %12, label %13, label %16

13:                                               ; preds = %7, %2
  %14 = load ptr, ptr @__stderrp, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.12.195) #11
  br label %16

16:                                               ; preds = %13, %7
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.ast_stack, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [512 x ptr], ptr %18, i64 0, i64 %20
  %22 = load ptr, ptr %21, align 8
  ret ptr %22
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @ast_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %7, %1
  %4 = load ptr, ptr %2, align 8
  %5 = call zeroext i1 @ast_empty(ptr noundef %4)
  %6 = xor i1 %5, true
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = load ptr, ptr %2, align 8
  %9 = call ptr @ast_pop(ptr noundef %8)
  call void @free(ptr noundef %9)
  br label %3, !llvm.loop !10

10:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @init_stack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Stack, ptr %3, i32 0, i32 1
  store i32 -1, ptr %4, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp eq i32 %5, -1
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_full(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp eq i32 %5, 255
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @items_count(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = add nsw i32 %5, 1
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @push(ptr noundef %0, i64 %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca %struct.stack_item, align 4
  %5 = alloca ptr, align 8
  store i64 %1, ptr %4, align 4
  store ptr %0, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = call zeroext i1 @is_full(ptr noundef %6)
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i1 false, ptr %3, align 1
  br label %18

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.Stack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %13, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [256 x %struct.stack_item], ptr %11, i64 0, i64 %16
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %4, i64 8, i1 false)
  store i1 true, ptr %3, align 1
  br label %18

18:                                               ; preds = %9, %8
  %19 = load i1, ptr %3, align 1
  ret i1 %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @pop(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @is_empty(ptr noundef %6)
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i1 false, ptr %3, align 1
  br label %22

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.Stack, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.Stack, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [256 x %struct.stack_item], ptr %12, i64 0, i64 %16
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %17, i64 8, i1 false)
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.Stack, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %19, align 4
  store i1 true, ptr %3, align 1
  br label %22

22:                                               ; preds = %9, %8
  %23 = load i1, ptr %3, align 1
  ret i1 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @stack_has_comp(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %22, %1
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Stack, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp sle i32 %6, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %5
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x %struct.stack_item], ptr %13, i64 0, i64 %15
  %17 = getelementptr inbounds nuw %struct.stack_item, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, 4
  br i1 %19, label %20, label %21

20:                                               ; preds = %11
  store i1 true, ptr %2, align 1
  br label %26

21:                                               ; preds = %11
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %5, !llvm.loop !11

25:                                               ; preds = %5
  store i1 false, ptr %2, align 1
  br label %26

26:                                               ; preds = %25, %20
  %27 = load i1, ptr %2, align 1
  ret i1 %27
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @stack_has_math_op(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %49, %1
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Stack, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp sle i32 %6, %9
  br i1 %10, label %11, label %52

11:                                               ; preds = %5
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x %struct.stack_item], ptr %13, i64 0, i64 %15
  %17 = getelementptr inbounds nuw %struct.stack_item, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %47, label %20

20:                                               ; preds = %11
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.Stack, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [256 x %struct.stack_item], ptr %22, i64 0, i64 %24
  %26 = getelementptr inbounds nuw %struct.stack_item, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %47, label %29

29:                                               ; preds = %20
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.Stack, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [256 x %struct.stack_item], ptr %31, i64 0, i64 %33
  %35 = getelementptr inbounds nuw %struct.stack_item, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %47, label %38

38:                                               ; preds = %29
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.Stack, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [256 x %struct.stack_item], ptr %40, i64 0, i64 %42
  %44 = getelementptr inbounds nuw %struct.stack_item, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %48

47:                                               ; preds = %38, %29, %20, %11
  store i1 true, ptr %2, align 1
  br label %53

48:                                               ; preds = %38
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %4, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %4, align 4
  br label %5, !llvm.loop !12

52:                                               ; preds = %5
  store i1 false, ptr %2, align 1
  br label %53

53:                                               ; preds = %52, %47
  %54 = load i1, ptr %2, align 1
  ret i1 %54
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @stack_top_is_just_e(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds nuw %struct.Stack, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %33

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Stack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x %struct.stack_item], ptr %11, i64 0, i64 %15
  %17 = getelementptr inbounds nuw %struct.stack_item, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %9
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.Stack, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.Stack, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [256 x %struct.stack_item], ptr %22, i64 0, i64 %26
  %28 = getelementptr inbounds nuw %struct.stack_item, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = icmp eq i32 %29, 11
  br label %31

31:                                               ; preds = %20, %9
  %32 = phi i1 [ false, %9 ], [ %30, %20 ]
  store i1 %32, ptr %2, align 1
  br label %33

33:                                               ; preds = %31, %8
  %34 = load i1, ptr %2, align 1
  ret i1 %34
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @stack_peak(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.stack_item, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %14, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.Stack, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp sgt i32 %9, %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %8, %2
  %15 = load ptr, ptr @__stderrp, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.12.195) #11
  br label %17

17:                                               ; preds = %14, %8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.Stack, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [256 x %struct.stack_item], ptr %19, i64 0, i64 %21
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %22, i64 8, i1 false)
  %23 = load i64, ptr %3, align 4
  ret i64 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @top_terminal(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Stack, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr %3, align 4
  br label %7

7:                                                ; preds = %52, %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %50

10:                                               ; preds = %7
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.Stack, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [256 x %struct.stack_item], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds nuw %struct.stack_item, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %17, 11
  br i1 %18, label %48, label %19

19:                                               ; preds = %10
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.Stack, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [256 x %struct.stack_item], ptr %21, i64 0, i64 %23
  %25 = getelementptr inbounds nuw %struct.stack_item, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = icmp eq i32 %26, 10
  br i1 %27, label %48, label %28

28:                                               ; preds = %19
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.Stack, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [256 x %struct.stack_item], ptr %30, i64 0, i64 %32
  %34 = getelementptr inbounds nuw %struct.stack_item, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %46

37:                                               ; preds = %28
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.Stack, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [256 x %struct.stack_item], ptr %39, i64 0, i64 %41
  %43 = getelementptr inbounds nuw %struct.stack_item, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, 11
  br label %46

46:                                               ; preds = %37, %28
  %47 = phi i1 [ false, %28 ], [ %45, %37 ]
  br label %48

48:                                               ; preds = %46, %19, %10
  %49 = phi i1 [ true, %19 ], [ true, %10 ], [ %47, %46 ]
  br label %50

50:                                               ; preds = %48, %7
  %51 = phi i1 [ false, %7 ], [ %49, %48 ]
  br i1 %51, label %52, label %55

52:                                               ; preds = %50
  %53 = load i32, ptr %3, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, ptr %3, align 4
  br label %7, !llvm.loop !13

55:                                               ; preds = %50
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds nuw %struct.Stack, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %3, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [256 x %struct.stack_item], ptr %57, i64 0, i64 %59
  %61 = getelementptr inbounds nuw %struct.stack_item, ptr %60, i32 0, i32 1
  %62 = load i32, ptr %61, align 4
  ret i32 %62
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @token_to_terminal(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds nuw %struct.Token, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  switch i32 %6, label %18 [
    i32 8, label %7
    i32 9, label %8
    i32 10, label %9
    i32 11, label %10
    i32 14, label %11
    i32 15, label %11
    i32 24, label %11
    i32 25, label %11
    i32 26, label %11
    i32 27, label %11
    i32 18, label %12
    i32 19, label %13
    i32 1, label %14
    i32 3, label %14
    i32 4, label %14
    i32 5, label %14
    i32 6, label %14
    i32 47, label %14
    i32 48, label %14
    i32 49, label %14
    i32 53, label %14
    i32 51, label %14
    i32 52, label %14
    i32 54, label %14
    i32 59, label %14
    i32 55, label %14
    i32 57, label %14
    i32 58, label %14
    i32 56, label %14
    i32 39, label %14
    i32 28, label %15
    i32 31, label %16
    i32 7, label %17
  ]

7:                                                ; preds = %1
  store i32 2, ptr %2, align 4
  br label %19

8:                                                ; preds = %1
  store i32 3, ptr %2, align 4
  br label %19

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %19

10:                                               ; preds = %1
  store i32 1, ptr %2, align 4
  br label %19

11:                                               ; preds = %1, %1, %1, %1, %1, %1
  store i32 4, ptr %2, align 4
  br label %19

12:                                               ; preds = %1
  store i32 5, ptr %2, align 4
  br label %19

13:                                               ; preds = %1
  store i32 6, ptr %2, align 4
  br label %19

14:                                               ; preds = %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1
  store i32 7, ptr %2, align 4
  br label %19

15:                                               ; preds = %1
  store i32 8, ptr %2, align 4
  br label %19

16:                                               ; preds = %1
  store i32 9, ptr %2, align 4
  br label %19

17:                                               ; preds = %1
  store i32 7, ptr %2, align 4
  br label %19

18:                                               ; preds = %1
  call void @print_error(i32 noundef 2)
  store i32 11, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @find_rule(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.stack_item, align 4
  %11 = alloca %struct.stack_item, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 -1, ptr %5, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %6, align 4
  br label %15

15:                                               ; preds = %30, %2
  %16 = load i32, ptr %6, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.Stack, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [256 x %struct.stack_item], ptr %20, i64 0, i64 %22
  %24 = getelementptr inbounds nuw %struct.stack_item, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = icmp eq i32 %25, 10
  br i1 %26, label %27, label %29

27:                                               ; preds = %18
  %28 = load i32, ptr %6, align 4
  store i32 %28, ptr %5, align 4
  br label %33

29:                                               ; preds = %18
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, ptr %6, align 4
  br label %15, !llvm.loop !14

33:                                               ; preds = %27, %15
  %34 = load i32, ptr %5, align 4
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = load ptr, ptr @__stderrp, align 8
  %38 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %37, ptr noundef @.str.13.196) #11
  br label %359

39:                                               ; preds = %33
  store i32 0, ptr %7, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.Stack, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %5, align 4
  %44 = sub nsw i32 %42, %43
  store i32 %44, ptr %8, align 4
  %45 = load i32, ptr %8, align 4
  %46 = icmp eq i32 %45, 3
  br i1 %46, label %47, label %104

47:                                               ; preds = %39
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds nuw %struct.Stack, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [256 x %struct.stack_item], ptr %49, i64 0, i64 %52
  %54 = getelementptr inbounds nuw %struct.stack_item, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %54, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %104

57:                                               ; preds = %47
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds nuw %struct.Stack, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [256 x %struct.stack_item], ptr %59, i64 0, i64 %62
  %64 = getelementptr inbounds nuw %struct.stack_item, ptr %63, i32 0, i32 1
  %65 = load i32, ptr %64, align 4
  %66 = icmp eq i32 %65, 2
  br i1 %66, label %77, label %67

67:                                               ; preds = %57
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds nuw %struct.Stack, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %5, align 4
  %71 = add nsw i32 %70, 2
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [256 x %struct.stack_item], ptr %69, i64 0, i64 %72
  %74 = getelementptr inbounds nuw %struct.stack_item, ptr %73, i32 0, i32 1
  %75 = load i32, ptr %74, align 4
  %76 = icmp eq i32 %75, 3
  br i1 %76, label %77, label %104

77:                                               ; preds = %67, %57
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds nuw %struct.Stack, ptr %78, i32 0, i32 0
  %80 = load i32, ptr %5, align 4
  %81 = add nsw i32 %80, 3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [256 x %struct.stack_item], ptr %79, i64 0, i64 %82
  %84 = getelementptr inbounds nuw %struct.stack_item, ptr %83, i32 0, i32 0
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %104

87:                                               ; preds = %77
  store i32 4, ptr %7, align 4
  %88 = load ptr, ptr %3, align 8
  %89 = getelementptr inbounds nuw %struct.Stack, ptr %88, i32 0, i32 0
  %90 = load i32, ptr %5, align 4
  %91 = add nsw i32 %90, 2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [256 x %struct.stack_item], ptr %89, i64 0, i64 %92
  %94 = getelementptr inbounds nuw %struct.stack_item, ptr %93, i32 0, i32 1
  %95 = load i32, ptr %94, align 4
  %96 = icmp eq i32 %95, 2
  br i1 %96, label %97, label %100

97:                                               ; preds = %87
  %98 = load ptr, ptr %4, align 8
  %99 = call zeroext i1 @exps_push(ptr noundef %98, i32 noundef 1)
  br label %103

100:                                              ; preds = %87
  %101 = load ptr, ptr %4, align 8
  %102 = call zeroext i1 @exps_push(ptr noundef %101, i32 noundef 2)
  br label %103

103:                                              ; preds = %100, %97
  br label %338

104:                                              ; preds = %77, %67, %47, %39
  %105 = load i32, ptr %8, align 4
  %106 = icmp eq i32 %105, 3
  br i1 %106, label %107, label %164

107:                                              ; preds = %104
  %108 = load ptr, ptr %3, align 8
  %109 = getelementptr inbounds nuw %struct.Stack, ptr %108, i32 0, i32 0
  %110 = load i32, ptr %5, align 4
  %111 = add nsw i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [256 x %struct.stack_item], ptr %109, i64 0, i64 %112
  %114 = getelementptr inbounds nuw %struct.stack_item, ptr %113, i32 0, i32 0
  %115 = load i32, ptr %114, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %164

117:                                              ; preds = %107
  %118 = load ptr, ptr %3, align 8
  %119 = getelementptr inbounds nuw %struct.Stack, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %5, align 4
  %121 = add nsw i32 %120, 2
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [256 x %struct.stack_item], ptr %119, i64 0, i64 %122
  %124 = getelementptr inbounds nuw %struct.stack_item, ptr %123, i32 0, i32 1
  %125 = load i32, ptr %124, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %137, label %127

127:                                              ; preds = %117
  %128 = load ptr, ptr %3, align 8
  %129 = getelementptr inbounds nuw %struct.Stack, ptr %128, i32 0, i32 0
  %130 = load i32, ptr %5, align 4
  %131 = add nsw i32 %130, 2
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [256 x %struct.stack_item], ptr %129, i64 0, i64 %132
  %134 = getelementptr inbounds nuw %struct.stack_item, ptr %133, i32 0, i32 1
  %135 = load i32, ptr %134, align 4
  %136 = icmp eq i32 %135, 1
  br i1 %136, label %137, label %164

137:                                              ; preds = %127, %117
  %138 = load ptr, ptr %3, align 8
  %139 = getelementptr inbounds nuw %struct.Stack, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %5, align 4
  %141 = add nsw i32 %140, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [256 x %struct.stack_item], ptr %139, i64 0, i64 %142
  %144 = getelementptr inbounds nuw %struct.stack_item, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 4
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %164

147:                                              ; preds = %137
  store i32 4, ptr %7, align 4
  %148 = load ptr, ptr %3, align 8
  %149 = getelementptr inbounds nuw %struct.Stack, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %5, align 4
  %151 = add nsw i32 %150, 2
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [256 x %struct.stack_item], ptr %149, i64 0, i64 %152
  %154 = getelementptr inbounds nuw %struct.stack_item, ptr %153, i32 0, i32 1
  %155 = load i32, ptr %154, align 4
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %160

157:                                              ; preds = %147
  %158 = load ptr, ptr %4, align 8
  %159 = call zeroext i1 @exps_push(ptr noundef %158, i32 noundef 3)
  br label %163

160:                                              ; preds = %147
  %161 = load ptr, ptr %4, align 8
  %162 = call zeroext i1 @exps_push(ptr noundef %161, i32 noundef 4)
  br label %163

163:                                              ; preds = %160, %157
  br label %337

164:                                              ; preds = %137, %127, %107, %104
  %165 = load i32, ptr %8, align 4
  %166 = icmp eq i32 %165, 3
  br i1 %166, label %167, label %200

167:                                              ; preds = %164
  %168 = load ptr, ptr %3, align 8
  %169 = getelementptr inbounds nuw %struct.Stack, ptr %168, i32 0, i32 0
  %170 = load i32, ptr %5, align 4
  %171 = add nsw i32 %170, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [256 x %struct.stack_item], ptr %169, i64 0, i64 %172
  %174 = getelementptr inbounds nuw %struct.stack_item, ptr %173, i32 0, i32 1
  %175 = load i32, ptr %174, align 4
  %176 = icmp eq i32 %175, 5
  br i1 %176, label %177, label %200

177:                                              ; preds = %167
  %178 = load ptr, ptr %3, align 8
  %179 = getelementptr inbounds nuw %struct.Stack, ptr %178, i32 0, i32 0
  %180 = load i32, ptr %5, align 4
  %181 = add nsw i32 %180, 2
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [256 x %struct.stack_item], ptr %179, i64 0, i64 %182
  %184 = getelementptr inbounds nuw %struct.stack_item, ptr %183, i32 0, i32 0
  %185 = load i32, ptr %184, align 4
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %200

187:                                              ; preds = %177
  %188 = load ptr, ptr %3, align 8
  %189 = getelementptr inbounds nuw %struct.Stack, ptr %188, i32 0, i32 0
  %190 = load i32, ptr %5, align 4
  %191 = add nsw i32 %190, 3
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [256 x %struct.stack_item], ptr %189, i64 0, i64 %192
  %194 = getelementptr inbounds nuw %struct.stack_item, ptr %193, i32 0, i32 1
  %195 = load i32, ptr %194, align 4
  %196 = icmp eq i32 %195, 6
  br i1 %196, label %197, label %200

197:                                              ; preds = %187
  store i32 4, ptr %7, align 4
  %198 = load ptr, ptr %4, align 8
  %199 = call zeroext i1 @exps_push(ptr noundef %198, i32 noundef 6)
  br label %336

200:                                              ; preds = %187, %177, %167, %164
  %201 = load i32, ptr %8, align 4
  %202 = icmp eq i32 %201, 1
  br i1 %202, label %203, label %216

203:                                              ; preds = %200
  %204 = load ptr, ptr %3, align 8
  %205 = getelementptr inbounds nuw %struct.Stack, ptr %204, i32 0, i32 0
  %206 = load i32, ptr %5, align 4
  %207 = add nsw i32 %206, 1
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [256 x %struct.stack_item], ptr %205, i64 0, i64 %208
  %210 = getelementptr inbounds nuw %struct.stack_item, ptr %209, i32 0, i32 1
  %211 = load i32, ptr %210, align 4
  %212 = icmp eq i32 %211, 7
  br i1 %212, label %213, label %216

213:                                              ; preds = %203
  store i32 2, ptr %7, align 4
  %214 = load ptr, ptr %4, align 8
  %215 = call zeroext i1 @exps_push(ptr noundef %214, i32 noundef 0)
  br label %335

216:                                              ; preds = %203, %200
  %217 = load i32, ptr %8, align 4
  %218 = icmp sgt i32 %217, 2
  br i1 %218, label %219, label %259

219:                                              ; preds = %216
  %220 = load ptr, ptr %3, align 8
  %221 = getelementptr inbounds nuw %struct.Stack, ptr %220, i32 0, i32 0
  %222 = load i32, ptr %5, align 4
  %223 = add nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [256 x %struct.stack_item], ptr %221, i64 0, i64 %224
  %226 = getelementptr inbounds nuw %struct.stack_item, ptr %225, i32 0, i32 1
  %227 = load i32, ptr %226, align 4
  %228 = icmp eq i32 %227, 7
  br i1 %228, label %229, label %259

229:                                              ; preds = %219
  %230 = load ptr, ptr %3, align 8
  %231 = getelementptr inbounds nuw %struct.Stack, ptr %230, i32 0, i32 0
  %232 = load i32, ptr %5, align 4
  %233 = add nsw i32 %232, 2
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [256 x %struct.stack_item], ptr %231, i64 0, i64 %234
  %236 = getelementptr inbounds nuw %struct.stack_item, ptr %235, i32 0, i32 1
  %237 = load i32, ptr %236, align 4
  %238 = icmp eq i32 %237, 5
  br i1 %238, label %239, label %259

239:                                              ; preds = %229
  %240 = load ptr, ptr %3, align 8
  %241 = getelementptr inbounds nuw %struct.Stack, ptr %240, i32 0, i32 0
  %242 = load ptr, ptr %3, align 8
  %243 = getelementptr inbounds nuw %struct.Stack, ptr %242, i32 0, i32 1
  %244 = load i32, ptr %243, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [256 x %struct.stack_item], ptr %241, i64 0, i64 %245
  %247 = getelementptr inbounds nuw %struct.stack_item, ptr %246, i32 0, i32 1
  %248 = load i32, ptr %247, align 4
  %249 = icmp eq i32 %248, 6
  br i1 %249, label %250, label %259

250:                                              ; preds = %239
  %251 = load ptr, ptr %3, align 8
  %252 = getelementptr inbounds nuw %struct.Stack, ptr %251, i32 0, i32 1
  %253 = load i32, ptr %252, align 4
  %254 = add nsw i32 %253, 1
  %255 = load i32, ptr %5, align 4
  %256 = sub nsw i32 %254, %255
  store i32 %256, ptr %7, align 4
  %257 = load ptr, ptr %4, align 8
  %258 = call zeroext i1 @exps_push(ptr noundef %257, i32 noundef 7)
  br label %334

259:                                              ; preds = %239, %229, %219, %216
  %260 = load i32, ptr %8, align 4
  %261 = icmp eq i32 %260, 3
  br i1 %261, label %262, label %295

262:                                              ; preds = %259
  %263 = load ptr, ptr %3, align 8
  %264 = getelementptr inbounds nuw %struct.Stack, ptr %263, i32 0, i32 0
  %265 = load i32, ptr %5, align 4
  %266 = add nsw i32 %265, 1
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [256 x %struct.stack_item], ptr %264, i64 0, i64 %267
  %269 = getelementptr inbounds nuw %struct.stack_item, ptr %268, i32 0, i32 0
  %270 = load i32, ptr %269, align 4
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %272, label %295

272:                                              ; preds = %262
  %273 = load ptr, ptr %3, align 8
  %274 = getelementptr inbounds nuw %struct.Stack, ptr %273, i32 0, i32 0
  %275 = load i32, ptr %5, align 4
  %276 = add nsw i32 %275, 2
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [256 x %struct.stack_item], ptr %274, i64 0, i64 %277
  %279 = getelementptr inbounds nuw %struct.stack_item, ptr %278, i32 0, i32 1
  %280 = load i32, ptr %279, align 4
  %281 = icmp eq i32 %280, 9
  br i1 %281, label %282, label %295

282:                                              ; preds = %272
  %283 = load ptr, ptr %3, align 8
  %284 = getelementptr inbounds nuw %struct.Stack, ptr %283, i32 0, i32 0
  %285 = load i32, ptr %5, align 4
  %286 = add nsw i32 %285, 3
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [256 x %struct.stack_item], ptr %284, i64 0, i64 %287
  %289 = getelementptr inbounds nuw %struct.stack_item, ptr %288, i32 0, i32 0
  %290 = load i32, ptr %289, align 4
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %292, label %295

292:                                              ; preds = %282
  store i32 4, ptr %7, align 4
  %293 = load ptr, ptr %4, align 8
  %294 = call zeroext i1 @exps_push(ptr noundef %293, i32 noundef 8)
  br label %333

295:                                              ; preds = %282, %272, %262, %259
  %296 = load i32, ptr %8, align 4
  %297 = icmp eq i32 %296, 3
  br i1 %297, label %298, label %331

298:                                              ; preds = %295
  %299 = load ptr, ptr %3, align 8
  %300 = getelementptr inbounds nuw %struct.Stack, ptr %299, i32 0, i32 0
  %301 = load i32, ptr %5, align 4
  %302 = add nsw i32 %301, 1
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [256 x %struct.stack_item], ptr %300, i64 0, i64 %303
  %305 = getelementptr inbounds nuw %struct.stack_item, ptr %304, i32 0, i32 0
  %306 = load i32, ptr %305, align 4
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %308, label %331

308:                                              ; preds = %298
  %309 = load ptr, ptr %3, align 8
  %310 = getelementptr inbounds nuw %struct.Stack, ptr %309, i32 0, i32 0
  %311 = load i32, ptr %5, align 4
  %312 = add nsw i32 %311, 2
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [256 x %struct.stack_item], ptr %310, i64 0, i64 %313
  %315 = getelementptr inbounds nuw %struct.stack_item, ptr %314, i32 0, i32 1
  %316 = load i32, ptr %315, align 4
  %317 = icmp eq i32 %316, 4
  br i1 %317, label %318, label %331

318:                                              ; preds = %308
  %319 = load ptr, ptr %3, align 8
  %320 = getelementptr inbounds nuw %struct.Stack, ptr %319, i32 0, i32 0
  %321 = load i32, ptr %5, align 4
  %322 = add nsw i32 %321, 3
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds [256 x %struct.stack_item], ptr %320, i64 0, i64 %323
  %325 = getelementptr inbounds nuw %struct.stack_item, ptr %324, i32 0, i32 0
  %326 = load i32, ptr %325, align 4
  %327 = icmp eq i32 %326, 0
  br i1 %327, label %328, label %331

328:                                              ; preds = %318
  store i32 4, ptr %7, align 4
  %329 = load ptr, ptr %4, align 8
  %330 = call zeroext i1 @exps_push(ptr noundef %329, i32 noundef 5)
  br label %332

331:                                              ; preds = %318, %308, %298, %295
  call void @print_error(i32 noundef 2)
  br label %359

332:                                              ; preds = %328
  br label %333

333:                                              ; preds = %332, %292
  br label %334

334:                                              ; preds = %333, %250
  br label %335

335:                                              ; preds = %334, %213
  br label %336

336:                                              ; preds = %335, %197
  br label %337

337:                                              ; preds = %336, %163
  br label %338

338:                                              ; preds = %337, %103
  store i32 0, ptr %9, align 4
  br label %339

339:                                              ; preds = %350, %338
  %340 = load i32, ptr %9, align 4
  %341 = load i32, ptr %7, align 4
  %342 = icmp slt i32 %340, %341
  br i1 %342, label %343, label %353

343:                                              ; preds = %339
  %344 = load ptr, ptr %3, align 8
  %345 = call zeroext i1 @pop(ptr noundef %344, ptr noundef %10)
  br i1 %345, label %349, label %346

346:                                              ; preds = %343
  %347 = load ptr, ptr @__stderrp, align 8
  %348 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %347, ptr noundef @.str.14.197) #11
  call void @print_error(i32 noundef 99)
  br label %359

349:                                              ; preds = %343
  br label %350

350:                                              ; preds = %349
  %351 = load i32, ptr %9, align 4
  %352 = add nsw i32 %351, 1
  store i32 %352, ptr %9, align 4
  br label %339, !llvm.loop !15

353:                                              ; preds = %339
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 @__const.find_rule.new_item, i64 8, i1 false)
  %354 = load ptr, ptr %3, align 8
  %355 = load i64, ptr %11, align 4
  %356 = call zeroext i1 @push(ptr noundef %354, i64 %355)
  br i1 %356, label %358, label %357

357:                                              ; preds = %353
  call void @print_error(i32 noundef 99)
  br label %359

358:                                              ; preds = %353
  br label %359

359:                                              ; preds = %358, %357, %346, %331, %36
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_just_br_and_e(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.Stack, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp sgt i32 %7, 2
  br i1 %8, label %9, label %35

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Stack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Stack, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [256 x %struct.stack_item], ptr %11, i64 0, i64 %16
  %18 = getelementptr inbounds nuw %struct.stack_item, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp eq i32 %19, 5
  br i1 %20, label %21, label %35

21:                                               ; preds = %9
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.Stack, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.Stack, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [256 x %struct.stack_item], ptr %23, i64 0, i64 %27
  %29 = getelementptr inbounds nuw %struct.stack_item, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %21
  %33 = load i32, ptr %4, align 4
  %34 = icmp eq i32 %33, 6
  br label %35

35:                                               ; preds = %32, %21, %9, %2
  %36 = phi i1 [ false, %21 ], [ false, %9 ], [ false, %2 ], [ %34, %32 ]
  ret i1 %36
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @was_e_on_top(ptr noundef %0, i1 noundef zeroext %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca %struct.stack_item, align 4
  %7 = alloca %struct.stack_item, align 4
  %8 = alloca %struct.stack_item, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.stack_item, align 4
  %11 = alloca %struct.stack_item, align 4
  %12 = alloca %struct.stack_item, align 4
  store ptr %0, ptr %4, align 8
  %13 = zext i1 %1 to i8
  store i8 %13, ptr %5, align 1
  %14 = load i8, ptr %5, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  store i1 true, ptr %3, align 1
  br label %150

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.Stack, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %50

22:                                               ; preds = %17
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.Stack, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = call i64 @stack_peak(ptr noundef %23, i32 noundef %26)
  store i64 %27, ptr %6, align 4
  %28 = getelementptr inbounds nuw %struct.stack_item, ptr %6, i32 0, i32 0
  %29 = load i32, ptr %28, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %50

31:                                               ; preds = %22
  %32 = load ptr, ptr %4, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.Stack, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 4
  %36 = call i64 @stack_peak(ptr noundef %32, i32 noundef %35)
  store i64 %36, ptr %7, align 4
  %37 = getelementptr inbounds nuw %struct.stack_item, ptr %7, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = icmp eq i32 %38, 11
  br i1 %39, label %40, label %50

40:                                               ; preds = %31
  %41 = load ptr, ptr %4, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.Stack, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = sub nsw i32 %44, 1
  %46 = call i64 @stack_peak(ptr noundef %41, i32 noundef %45)
  store i64 %46, ptr %8, align 4
  %47 = getelementptr inbounds nuw %struct.stack_item, ptr %8, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = icmp eq i32 %48, 10
  br label %50

50:                                               ; preds = %40, %31, %22, %17
  %51 = phi i1 [ false, %31 ], [ false, %22 ], [ false, %17 ], [ %49, %40 ]
  br i1 %51, label %52, label %53

52:                                               ; preds = %50
  store i1 true, ptr %3, align 1
  br label %150

53:                                               ; preds = %50
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds nuw %struct.Stack, ptr %54, i32 0, i32 1
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %9, align 4
  br label %57

57:                                               ; preds = %81, %53
  %58 = load i32, ptr %9, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %69

60:                                               ; preds = %57
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds nuw %struct.Stack, ptr %61, i32 0, i32 0
  %63 = load i32, ptr %9, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [256 x %struct.stack_item], ptr %62, i64 0, i64 %64
  %66 = getelementptr inbounds nuw %struct.stack_item, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 4
  %68 = icmp ne i32 %67, 5
  br label %69

69:                                               ; preds = %60, %57
  %70 = phi i1 [ false, %57 ], [ %68, %60 ]
  br i1 %70, label %71, label %84

71:                                               ; preds = %69
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds nuw %struct.Stack, ptr %72, i32 0, i32 0
  %74 = load i32, ptr %9, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [256 x %struct.stack_item], ptr %73, i64 0, i64 %75
  %77 = getelementptr inbounds nuw %struct.stack_item, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %77, align 4
  %79 = icmp eq i32 %78, 6
  br i1 %79, label %80, label %81

80:                                               ; preds = %71
  store i1 true, ptr %3, align 1
  br label %150

81:                                               ; preds = %71
  %82 = load i32, ptr %9, align 4
  %83 = add nsw i32 %82, -1
  store i32 %83, ptr %9, align 4
  br label %57, !llvm.loop !16

84:                                               ; preds = %69
  %85 = load ptr, ptr %4, align 8
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds nuw %struct.Stack, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 4
  %89 = call i64 @stack_peak(ptr noundef %85, i32 noundef %88)
  store i64 %89, ptr %10, align 4
  %90 = load i32, ptr %9, align 4
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %128

92:                                               ; preds = %84
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds nuw %struct.Stack, ptr %93, i32 0, i32 1
  %95 = load i32, ptr %94, align 4
  %96 = icmp sgt i32 %95, 1
  br i1 %96, label %97, label %128

97:                                               ; preds = %92
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds nuw %struct.Stack, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %9, align 4
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [256 x %struct.stack_item], ptr %99, i64 0, i64 %102
  %104 = getelementptr inbounds nuw %struct.stack_item, ptr %103, i32 0, i32 1
  %105 = load i32, ptr %104, align 4
  %106 = icmp eq i32 %105, 10
  br i1 %106, label %107, label %128

107:                                              ; preds = %97
  %108 = load ptr, ptr %4, align 8
  %109 = getelementptr inbounds nuw %struct.Stack, ptr %108, i32 0, i32 0
  %110 = load i32, ptr %9, align 4
  %111 = add nsw i32 %110, 2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [256 x %struct.stack_item], ptr %109, i64 0, i64 %112
  %114 = getelementptr inbounds nuw %struct.stack_item, ptr %113, i32 0, i32 0
  %115 = load i32, ptr %114, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %128

117:                                              ; preds = %107
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds nuw %struct.Stack, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %9, align 4
  %121 = add nsw i32 %120, 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [256 x %struct.stack_item], ptr %119, i64 0, i64 %122
  %124 = getelementptr inbounds nuw %struct.stack_item, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %128

127:                                              ; preds = %117
  store i1 false, ptr %3, align 1
  br label %150

128:                                              ; preds = %117, %107, %97, %92, %84
  %129 = getelementptr inbounds nuw %struct.stack_item, ptr %10, i32 0, i32 1
  %130 = load i32, ptr %129, align 4
  %131 = icmp eq i32 %130, 11
  br i1 %131, label %132, label %149

132:                                              ; preds = %128
  %133 = getelementptr inbounds nuw %struct.stack_item, ptr %10, i32 0, i32 0
  %134 = load i32, ptr %133, align 4
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %149

136:                                              ; preds = %132
  %137 = load ptr, ptr %4, align 8
  %138 = call zeroext i1 @pop(ptr noundef %137, ptr noundef %10)
  %139 = load ptr, ptr %4, align 8
  %140 = getelementptr inbounds nuw %struct.stack_item, ptr %11, i32 0, i32 0
  store i32 0, ptr %140, align 4
  %141 = getelementptr inbounds nuw %struct.stack_item, ptr %11, i32 0, i32 1
  store i32 10, ptr %141, align 4
  %142 = load i64, ptr %11, align 4
  %143 = call zeroext i1 @push(ptr noundef %139, i64 %142)
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds nuw %struct.stack_item, ptr %12, i32 0, i32 0
  store i32 0, ptr %145, align 4
  %146 = getelementptr inbounds nuw %struct.stack_item, ptr %12, i32 0, i32 1
  store i32 11, ptr %146, align 4
  %147 = load i64, ptr %12, align 4
  %148 = call zeroext i1 @push(ptr noundef %144, i64 %147)
  store i1 true, ptr %3, align 1
  br label %150

149:                                              ; preds = %132, %128
  store i1 false, ptr %3, align 1
  br label %150

150:                                              ; preds = %149, %136, %127, %80, %52, %16
  %151 = load i1, ptr %3, align 1
  ret i1 %151
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_last_step(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca %struct.stack_item, align 4
  %5 = alloca %struct.stack_item, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.Stack, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store i1 false, ptr %2, align 1
  br label %32

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.Stack, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = call i64 @stack_peak(ptr noundef %12, i32 noundef %15)
  store i64 %16, ptr %4, align 4
  %17 = getelementptr inbounds nuw %struct.stack_item, ptr %4, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %30

20:                                               ; preds = %11
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.Stack, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = sub nsw i32 %24, 1
  %26 = call i64 @stack_peak(ptr noundef %21, i32 noundef %25)
  store i64 %26, ptr %5, align 4
  %27 = getelementptr inbounds nuw %struct.stack_item, ptr %5, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = icmp eq i32 %28, 8
  br label %30

30:                                               ; preds = %20, %11
  %31 = phi i1 [ false, %11 ], [ %29, %20 ]
  store i1 %31, ptr %2, align 1
  br label %32

32:                                               ; preds = %30, %10
  %33 = load i1, ptr %2, align 1
  ret i1 %33
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @ast_reverse(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.ast_stack, align 8
  store ptr %0, ptr %2, align 8
  call void @ast_init(ptr noundef %3)
  br label %4

4:                                                ; preds = %8, %1
  %5 = load ptr, ptr %2, align 8
  %6 = call zeroext i1 @ast_empty(ptr noundef %5)
  %7 = xor i1 %6, true
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 8
  %10 = call ptr @ast_pop(ptr noundef %9)
  %11 = call zeroext i1 @ast_push(ptr noundef %3, ptr noundef %10)
  br label %4, !llvm.loop !17

12:                                               ; preds = %4
  %13 = load ptr, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %3, i64 4104, i1 false)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isNum(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Token, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 3
  br i1 %6, label %22, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Token, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp eq i32 %10, 5
  br i1 %11, label %22, label %12

12:                                               ; preds = %7
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Token, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 4
  br i1 %16, label %22, label %17

17:                                               ; preds = %12
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.Token, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 6
  br label %22

22:                                               ; preds = %17, %12, %7, %1
  %23 = phi i1 [ true, %12 ], [ true, %7 ], [ true, %1 ], [ %21, %17 ]
  ret i1 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @checkIfValidIF(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.Token, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call zeroext i1 @ast_empty(ptr noundef %9)
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %38

12:                                               ; preds = %3
  %13 = load i32, ptr %5, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %38

16:                                               ; preds = %12
  %17 = load ptr, ptr %4, align 8
  %18 = call ptr @ast_top(ptr noundef %17)
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds nuw %struct.ast, ptr %19, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %20, i64 16, i1 false)
  %21 = load ptr, ptr %6, align 8
  %22 = call zeroext i1 @stack_has_comp(ptr noundef %21)
  br i1 %22, label %34, label %23

23:                                               ; preds = %16
  %24 = call zeroext i1 @isNum(ptr noundef %8)
  br i1 %24, label %34, label %25

25:                                               ; preds = %23
  %26 = getelementptr inbounds nuw %struct.Token, ptr %8, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp ne i32 %27, 1
  br i1 %28, label %29, label %34

29:                                               ; preds = %25
  %30 = getelementptr inbounds nuw %struct.Token, ptr %8, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 39
  br i1 %32, label %33, label %34

33:                                               ; preds = %29
  call void @print_error(i32 noundef 7)
  br label %34

34:                                               ; preds = %33, %29, %25, %23, %16
  %35 = load ptr, ptr %6, align 8
  %36 = call zeroext i1 @stack_has_math_op(ptr noundef %35)
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  call void @print_error(i32 noundef 7)
  br label %38

38:                                               ; preds = %37, %34, %15, %11
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @endIF(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds nuw %struct.Stack, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store i1 false, ptr %4, align 1
  br label %28

13:                                               ; preds = %3
  %14 = load ptr, ptr %7, align 8
  %15 = call zeroext i1 @stack_has_comp(ptr noundef %14)
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i1 true, ptr %4, align 1
  br label %28

17:                                               ; preds = %13
  %18 = load ptr, ptr %7, align 8
  %19 = call zeroext i1 @stack_top_is_just_e(ptr noundef %18)
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i1 true, ptr %4, align 1
  br label %28

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.ast_stack, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %21
  store i1 false, ptr %4, align 1
  br label %28

27:                                               ; preds = %21
  store i1 false, ptr %4, align 1
  br label %28

28:                                               ; preds = %27, %26, %20, %16, %12
  %29 = load i1, ptr %4, align 1
  ret i1 %29
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @printTree(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [256 x i8], align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %64

11:                                               ; preds = %3
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.17.198, ptr noundef %12)
  %14 = load i32, ptr %6, align 4
  %15 = icmp ne i32 %14, 0
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, ptr @.str.18.199, ptr @.str.19.200
  %18 = call i32 (ptr, ...) @printf(ptr noundef %17)
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.ast, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds nuw %struct.Token, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %30

24:                                               ; preds = %11
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds nuw %struct.ast, ptr %25, i32 0, i32 1
  %27 = getelementptr inbounds nuw %struct.Token, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.20.201, ptr noundef %28)
  br label %37

30:                                               ; preds = %11
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.ast, ptr %31, i32 0, i32 1
  %33 = getelementptr inbounds nuw %struct.Token, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = call ptr @getTypeTokenSymbol(i32 noundef %34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.20.201, ptr noundef %35)
  br label %37

37:                                               ; preds = %30, %24
  %38 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %6, align 4
  %41 = icmp ne i32 %40, 0
  %42 = zext i1 %41 to i64
  %43 = select i1 %41, ptr @.str.22.202, ptr @.str.16.194
  %44 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %38, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.21.203, ptr noundef %39, ptr noundef %43)
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds nuw %struct.ast, ptr %45, i32 0, i32 2
  %47 = load ptr, ptr %46, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %54

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.ast, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  call void @printTree(ptr noundef %52, ptr noundef %53, i32 noundef 1)
  br label %54

54:                                               ; preds = %49, %37
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.ast, ptr %55, i32 0, i32 3
  %57 = load ptr, ptr %56, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %64

59:                                               ; preds = %54
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.ast, ptr %60, i32 0, i32 3
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  call void @printTree(ptr noundef %62, ptr noundef %63, i32 noundef 0)
  br label %64

64:                                               ; preds = %59, %54, %10
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @abstract_syntax_tree(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.Token, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.ast_stack, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca %struct.Token, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = call [2 x i64] @exps_top(ptr noundef %13)
  store [2 x i64] %14, ptr %5, align 8
  store ptr %5, ptr %6, align 8
  br label %15

15:                                               ; preds = %30, %2
  %16 = load ptr, ptr %6, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %34

18:                                               ; preds = %15
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds nuw %struct.Token, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 8
  br i1 %22, label %28, label %23

23:                                               ; preds = %18
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds nuw %struct.Token, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 7
  br i1 %27, label %28, label %30

28:                                               ; preds = %23, %18
  %29 = load ptr, ptr %4, align 8
  call void @ast_reverse(ptr noundef %29)
  br label %34

30:                                               ; preds = %23
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds nuw %struct.Token, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %6, align 8
  br label %15, !llvm.loop !18

34:                                               ; preds = %28, %15
  call void @ast_init(ptr noundef %7)
  store ptr null, ptr %8, align 8
  store ptr null, ptr %9, align 8
  store ptr null, ptr %10, align 8
  br label %35

35:                                               ; preds = %189, %34
  %36 = load ptr, ptr %3, align 8
  %37 = call zeroext i1 @exps_empty(ptr noundef %36)
  %38 = xor i1 %37, true
  br i1 %38, label %39, label %190

39:                                               ; preds = %35
  %40 = load ptr, ptr %3, align 8
  %41 = call [2 x i64] @exps_top(ptr noundef %40)
  store [2 x i64] %41, ptr %11, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = call zeroext i1 @exps_pop(ptr noundef %42)
  %44 = getelementptr inbounds nuw %struct.Token, ptr %11, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  switch i32 %45, label %188 [
    i32 0, label %46
    i32 1, label %50
    i32 2, label %65
    i32 3, label %80
    i32 4, label %95
    i32 5, label %110
    i32 6, label %130
    i32 7, label %131
    i32 9, label %149
    i32 8, label %172
    i32 10, label %187
  ]

46:                                               ; preds = %39
  %47 = load ptr, ptr %4, align 8
  %48 = call ptr @ast_pop(ptr noundef %47)
  %49 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %48)
  br label %189

50:                                               ; preds = %39
  %51 = call ptr @ast_pop(ptr noundef %7)
  store ptr %51, ptr %10, align 8
  %52 = call ptr @ast_pop(ptr noundef %7)
  store ptr %52, ptr %9, align 8
  %53 = call ptr @malloc(i64 noundef 40) #10
  store ptr %53, ptr %8, align 8
  %54 = load ptr, ptr %8, align 8
  %55 = getelementptr inbounds nuw %struct.ast, ptr %54, i32 0, i32 1
  %56 = getelementptr inbounds nuw %struct.Token, ptr %55, i32 0, i32 0
  store i32 8, ptr %56, align 8
  %57 = load ptr, ptr %9, align 8
  %58 = load ptr, ptr %8, align 8
  %59 = getelementptr inbounds nuw %struct.ast, ptr %58, i32 0, i32 2
  store ptr %57, ptr %59, align 8
  %60 = load ptr, ptr %10, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = getelementptr inbounds nuw %struct.ast, ptr %61, i32 0, i32 3
  store ptr %60, ptr %62, align 8
  %63 = load ptr, ptr %8, align 8
  %64 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %63)
  br label %189

65:                                               ; preds = %39
  %66 = call ptr @ast_pop(ptr noundef %7)
  store ptr %66, ptr %10, align 8
  %67 = call ptr @ast_pop(ptr noundef %7)
  store ptr %67, ptr %9, align 8
  %68 = call ptr @malloc(i64 noundef 40) #10
  store ptr %68, ptr %8, align 8
  %69 = load ptr, ptr %8, align 8
  %70 = getelementptr inbounds nuw %struct.ast, ptr %69, i32 0, i32 1
  %71 = getelementptr inbounds nuw %struct.Token, ptr %70, i32 0, i32 0
  store i32 9, ptr %71, align 8
  %72 = load ptr, ptr %9, align 8
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds nuw %struct.ast, ptr %73, i32 0, i32 2
  store ptr %72, ptr %74, align 8
  %75 = load ptr, ptr %10, align 8
  %76 = load ptr, ptr %8, align 8
  %77 = getelementptr inbounds nuw %struct.ast, ptr %76, i32 0, i32 3
  store ptr %75, ptr %77, align 8
  %78 = load ptr, ptr %8, align 8
  %79 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %78)
  br label %189

80:                                               ; preds = %39
  %81 = call ptr @ast_pop(ptr noundef %7)
  store ptr %81, ptr %10, align 8
  %82 = call ptr @ast_pop(ptr noundef %7)
  store ptr %82, ptr %9, align 8
  %83 = call ptr @malloc(i64 noundef 40) #10
  store ptr %83, ptr %8, align 8
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds nuw %struct.ast, ptr %84, i32 0, i32 1
  %86 = getelementptr inbounds nuw %struct.Token, ptr %85, i32 0, i32 0
  store i32 10, ptr %86, align 8
  %87 = load ptr, ptr %9, align 8
  %88 = load ptr, ptr %8, align 8
  %89 = getelementptr inbounds nuw %struct.ast, ptr %88, i32 0, i32 2
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %10, align 8
  %91 = load ptr, ptr %8, align 8
  %92 = getelementptr inbounds nuw %struct.ast, ptr %91, i32 0, i32 3
  store ptr %90, ptr %92, align 8
  %93 = load ptr, ptr %8, align 8
  %94 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %93)
  br label %189

95:                                               ; preds = %39
  %96 = call ptr @ast_pop(ptr noundef %7)
  store ptr %96, ptr %10, align 8
  %97 = call ptr @ast_pop(ptr noundef %7)
  store ptr %97, ptr %9, align 8
  %98 = call ptr @malloc(i64 noundef 40) #10
  store ptr %98, ptr %8, align 8
  %99 = load ptr, ptr %8, align 8
  %100 = getelementptr inbounds nuw %struct.ast, ptr %99, i32 0, i32 1
  %101 = getelementptr inbounds nuw %struct.Token, ptr %100, i32 0, i32 0
  store i32 11, ptr %101, align 8
  %102 = load ptr, ptr %9, align 8
  %103 = load ptr, ptr %8, align 8
  %104 = getelementptr inbounds nuw %struct.ast, ptr %103, i32 0, i32 2
  store ptr %102, ptr %104, align 8
  %105 = load ptr, ptr %10, align 8
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds nuw %struct.ast, ptr %106, i32 0, i32 3
  store ptr %105, ptr %107, align 8
  %108 = load ptr, ptr %8, align 8
  %109 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %108)
  br label %189

110:                                              ; preds = %39
  %111 = call ptr @ast_pop(ptr noundef %7)
  store ptr %111, ptr %10, align 8
  %112 = call ptr @ast_pop(ptr noundef %7)
  store ptr %112, ptr %9, align 8
  %113 = call ptr @malloc(i64 noundef 40) #10
  store ptr %113, ptr %8, align 8
  %114 = load ptr, ptr %4, align 8
  %115 = call ptr @ast_pop(ptr noundef %114)
  %116 = getelementptr inbounds nuw %struct.ast, ptr %115, i32 0, i32 1
  %117 = getelementptr inbounds nuw %struct.Token, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 8
  %119 = load ptr, ptr %8, align 8
  %120 = getelementptr inbounds nuw %struct.ast, ptr %119, i32 0, i32 1
  %121 = getelementptr inbounds nuw %struct.Token, ptr %120, i32 0, i32 0
  store i32 %118, ptr %121, align 8
  %122 = load ptr, ptr %9, align 8
  %123 = load ptr, ptr %8, align 8
  %124 = getelementptr inbounds nuw %struct.ast, ptr %123, i32 0, i32 2
  store ptr %122, ptr %124, align 8
  %125 = load ptr, ptr %10, align 8
  %126 = load ptr, ptr %8, align 8
  %127 = getelementptr inbounds nuw %struct.ast, ptr %126, i32 0, i32 3
  store ptr %125, ptr %127, align 8
  %128 = load ptr, ptr %8, align 8
  %129 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %128)
  br label %189

130:                                              ; preds = %39
  br label %189

131:                                              ; preds = %39
  %132 = call ptr @ast_pop(ptr noundef %7)
  store ptr %132, ptr %10, align 8
  %133 = call ptr @ast_pop(ptr noundef %7)
  store ptr %133, ptr %9, align 8
  %134 = call ptr @malloc(i64 noundef 40) #10
  store ptr %134, ptr %8, align 8
  %135 = load ptr, ptr %4, align 8
  %136 = call ptr @ast_pop(ptr noundef %135)
  store ptr %136, ptr %12, align 8
  %137 = load ptr, ptr %8, align 8
  %138 = getelementptr inbounds nuw %struct.ast, ptr %137, i32 0, i32 1
  %139 = load ptr, ptr %12, align 8
  %140 = getelementptr inbounds nuw %struct.ast, ptr %139, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %138, ptr align 8 %140, i64 16, i1 false)
  %141 = load ptr, ptr %9, align 8
  %142 = load ptr, ptr %8, align 8
  %143 = getelementptr inbounds nuw %struct.ast, ptr %142, i32 0, i32 2
  store ptr %141, ptr %143, align 8
  %144 = load ptr, ptr %10, align 8
  %145 = load ptr, ptr %8, align 8
  %146 = getelementptr inbounds nuw %struct.ast, ptr %145, i32 0, i32 3
  store ptr %144, ptr %146, align 8
  %147 = load ptr, ptr %8, align 8
  %148 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %147)
  br label %189

149:                                              ; preds = %39
  %150 = call ptr @ast_pop(ptr noundef %7)
  store ptr %150, ptr %10, align 8
  %151 = call ptr @ast_pop(ptr noundef %7)
  store ptr %151, ptr %9, align 8
  %152 = call ptr @malloc(i64 noundef 40) #10
  store ptr %152, ptr %8, align 8
  %153 = load ptr, ptr %8, align 8
  %154 = getelementptr inbounds nuw %struct.ast, ptr %153, i32 0, i32 1
  %155 = getelementptr inbounds nuw %struct.Token, ptr %154, i32 0, i32 1
  store ptr null, ptr %155, align 8
  %156 = load ptr, ptr %4, align 8
  %157 = call ptr @ast_pop(ptr noundef %156)
  %158 = getelementptr inbounds nuw %struct.ast, ptr %157, i32 0, i32 1
  %159 = getelementptr inbounds nuw %struct.Token, ptr %158, i32 0, i32 0
  %160 = load i32, ptr %159, align 8
  %161 = load ptr, ptr %8, align 8
  %162 = getelementptr inbounds nuw %struct.ast, ptr %161, i32 0, i32 1
  %163 = getelementptr inbounds nuw %struct.Token, ptr %162, i32 0, i32 0
  store i32 %160, ptr %163, align 8
  %164 = load ptr, ptr %9, align 8
  %165 = load ptr, ptr %8, align 8
  %166 = getelementptr inbounds nuw %struct.ast, ptr %165, i32 0, i32 2
  store ptr %164, ptr %166, align 8
  %167 = load ptr, ptr %10, align 8
  %168 = load ptr, ptr %8, align 8
  %169 = getelementptr inbounds nuw %struct.ast, ptr %168, i32 0, i32 3
  store ptr %167, ptr %169, align 8
  %170 = load ptr, ptr %8, align 8
  %171 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %170)
  br label %189

172:                                              ; preds = %39
  %173 = call ptr @ast_pop(ptr noundef %7)
  store ptr %173, ptr %10, align 8
  %174 = call ptr @ast_pop(ptr noundef %7)
  store ptr %174, ptr %9, align 8
  %175 = call ptr @malloc(i64 noundef 40) #10
  store ptr %175, ptr %8, align 8
  %176 = load ptr, ptr %8, align 8
  %177 = getelementptr inbounds nuw %struct.ast, ptr %176, i32 0, i32 1
  %178 = getelementptr inbounds nuw %struct.Token, ptr %177, i32 0, i32 0
  store i32 31, ptr %178, align 8
  %179 = load ptr, ptr %9, align 8
  %180 = load ptr, ptr %8, align 8
  %181 = getelementptr inbounds nuw %struct.ast, ptr %180, i32 0, i32 2
  store ptr %179, ptr %181, align 8
  %182 = load ptr, ptr %10, align 8
  %183 = load ptr, ptr %8, align 8
  %184 = getelementptr inbounds nuw %struct.ast, ptr %183, i32 0, i32 3
  store ptr %182, ptr %184, align 8
  %185 = load ptr, ptr %8, align 8
  %186 = call zeroext i1 @ast_push(ptr noundef %7, ptr noundef %185)
  br label %189

187:                                              ; preds = %39
  call void @print_error(i32 noundef 2)
  br label %189

188:                                              ; preds = %39
  call void @print_error(i32 noundef 99)
  br label %189

189:                                              ; preds = %188, %187, %172, %149, %131, %130, %110, %95, %80, %65, %50, %46
  br label %35, !llvm.loop !19

190:                                              ; preds = %35
  %191 = call ptr @ast_pop(ptr noundef %7)
  ret ptr %191
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @add_to_tree(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = call ptr @malloc(i64 noundef 40) #10
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.ast, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %11, i64 16, i1 false)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.ast_stack, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %40

16:                                               ; preds = %2
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.ast_stack, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.ast_stack, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [512 x ptr], ptr %18, i64 0, i64 %22
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds nuw %struct.ast, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds nuw %struct.Token, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %6, align 4
  switch i32 %28, label %38 [
    i32 14, label %29
    i32 15, label %29
    i32 24, label %29
    i32 25, label %29
    i32 26, label %29
    i32 27, label %29
  ]

29:                                               ; preds = %16, %16, %16, %16, %16, %16
  %30 = load ptr, ptr %3, align 8
  %31 = call ptr @ast_pop(ptr noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = call zeroext i1 @ast_push(ptr noundef %32, ptr noundef %33)
  %35 = load ptr, ptr %3, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = call zeroext i1 @ast_push(ptr noundef %35, ptr noundef %36)
  br label %44

38:                                               ; preds = %16
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39, %2
  %41 = load ptr, ptr %3, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = call zeroext i1 @ast_push(ptr noundef %41, ptr noundef %42)
  br label %44

44:                                               ; preds = %40, %29
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @parse_expression(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.Exp_numbers_stack, align 8
  %5 = alloca %struct.Stack, align 4
  %6 = alloca %struct.ast_stack, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.stack_item, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.stack_item, align 4
  %18 = alloca i8, align 1
  %19 = alloca %struct.stack_item, align 4
  %20 = alloca %struct.stack_item, align 4
  %21 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @exps_init(ptr noundef %4)
  call void @init_stack(ptr noundef %5)
  call void @ast_init(ptr noundef %6)
  store ptr null, ptr %8, align 8
  %22 = getelementptr inbounds nuw %struct.stack_item, ptr %9, i32 0, i32 0
  store i32 0, ptr %22, align 4
  %23 = getelementptr inbounds nuw %struct.stack_item, ptr %9, i32 0, i32 1
  store i32 8, ptr %23, align 4
  %24 = load i64, ptr %9, align 4
  %25 = call zeroext i1 @push(ptr noundef %5, i64 %24)
  store i8 1, ptr %10, align 1
  store i8 1, ptr %11, align 1
  store i8 0, ptr %12, align 1
  store i8 1, ptr %13, align 1
  store i32 0, ptr %14, align 4
  br label %26

26:                                               ; preds = %165, %1
  %27 = load i8, ptr %10, align 1
  %28 = trunc i8 %27 to i1
  br i1 %28, label %33, label %29

29:                                               ; preds = %26
  %30 = call zeroext i1 @is_last_step(ptr noundef %5)
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  br label %168

32:                                               ; preds = %29
  call void @find_rule(ptr noundef %5, ptr noundef %4)
  br label %165

33:                                               ; preds = %26
  %34 = load i8, ptr %12, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %56, label %36

36:                                               ; preds = %33
  %37 = load ptr, ptr %3, align 8
  %38 = call ptr @read_token(ptr noundef %37)
  store ptr %38, ptr %7, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds nuw %struct.Token, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = icmp eq i32 %41, 18
  br i1 %42, label %43, label %46

43:                                               ; preds = %36
  %44 = load i32, ptr %14, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %14, align 4
  br label %46

46:                                               ; preds = %43, %36
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.Token, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 19
  br i1 %50, label %51, label %55

51:                                               ; preds = %46
  %52 = load i32, ptr %14, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, ptr %14, align 4
  %54 = load i32, ptr %14, align 4
  call void @checkIfValidIF(ptr noundef %6, i32 noundef %54, ptr noundef %5)
  br label %55

55:                                               ; preds = %51, %46
  br label %58

56:                                               ; preds = %33
  %57 = load ptr, ptr %8, align 8
  store ptr %57, ptr %7, align 8
  store i8 0, ptr %12, align 1
  br label %58

58:                                               ; preds = %56, %55
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds nuw %struct.Token, ptr %59, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = icmp eq i32 %61, 19
  br i1 %62, label %63, label %67

63:                                               ; preds = %58
  %64 = load i32, ptr %14, align 4
  %65 = call zeroext i1 @endIF(ptr noundef %6, i32 noundef %64, ptr noundef %5)
  br i1 %65, label %66, label %67

66:                                               ; preds = %63
  store i8 0, ptr %10, align 1
  br label %68

67:                                               ; preds = %63, %58
  br label %68

68:                                               ; preds = %67, %66
  %69 = load ptr, ptr %7, align 8
  %70 = call i32 @token_to_terminal(ptr noundef %69)
  %71 = icmp eq i32 %70, 7
  br i1 %71, label %72, label %74

72:                                               ; preds = %68
  %73 = load ptr, ptr %7, align 8
  call void @add_to_tree(ptr noundef %6, ptr noundef %73)
  br label %74

74:                                               ; preds = %72, %68
  %75 = load ptr, ptr %7, align 8
  %76 = getelementptr inbounds nuw %struct.Token, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 28
  br i1 %78, label %79, label %84

79:                                               ; preds = %74
  %80 = load i8, ptr %11, align 1
  %81 = trunc i8 %80 to i1
  br i1 %81, label %82, label %83

82:                                               ; preds = %79
  store ptr null, ptr %2, align 8
  br label %171

83:                                               ; preds = %79
  store i8 0, ptr %10, align 1
  br label %84

84:                                               ; preds = %83, %74
  store i8 0, ptr %11, align 1
  %85 = call i32 @top_terminal(ptr noundef %5)
  store i32 %85, ptr %15, align 4
  %86 = load ptr, ptr %7, align 8
  %87 = call i32 @token_to_terminal(ptr noundef %86)
  store i32 %87, ptr %16, align 4
  %88 = load i32, ptr %15, align 4
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds nuw [19 x [19 x i32]], ptr @precedence_table, i64 0, i64 %89
  %91 = load i32, ptr %16, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds nuw [19 x i32], ptr %90, i64 0, i64 %92
  %94 = load i32, ptr %93, align 4
  switch i32 %94, label %139 [
    i32 2, label %95
    i32 1, label %102
    i32 0, label %127
    i32 4, label %138
  ]

95:                                               ; preds = %84
  %96 = getelementptr inbounds nuw %struct.stack_item, ptr %17, i32 0, i32 0
  store i32 0, ptr %96, align 4
  %97 = getelementptr inbounds nuw %struct.stack_item, ptr %17, i32 0, i32 1
  %98 = load ptr, ptr %7, align 8
  %99 = call i32 @token_to_terminal(ptr noundef %98)
  store i32 %99, ptr %97, align 4
  %100 = load i64, ptr %17, align 4
  %101 = call zeroext i1 @push(ptr noundef %5, i64 %100)
  br label %163

102:                                              ; preds = %84
  %103 = load i32, ptr %16, align 4
  %104 = call zeroext i1 @is_just_br_and_e(ptr noundef %5, i32 noundef %103)
  %105 = zext i1 %104 to i8
  store i8 %105, ptr %18, align 1
  %106 = load i8, ptr %18, align 1
  %107 = trunc i8 %106 to i1
  %108 = call zeroext i1 @was_e_on_top(ptr noundef %5, i1 noundef zeroext %107)
  br i1 %108, label %114, label %109

109:                                              ; preds = %102
  %110 = getelementptr inbounds nuw %struct.stack_item, ptr %19, i32 0, i32 0
  store i32 0, ptr %110, align 4
  %111 = getelementptr inbounds nuw %struct.stack_item, ptr %19, i32 0, i32 1
  store i32 10, ptr %111, align 4
  %112 = load i64, ptr %19, align 4
  %113 = call zeroext i1 @push(ptr noundef %5, i64 %112)
  br label %114

114:                                              ; preds = %109, %102
  %115 = getelementptr inbounds nuw %struct.stack_item, ptr %20, i32 0, i32 0
  store i32 0, ptr %115, align 4
  %116 = getelementptr inbounds nuw %struct.stack_item, ptr %20, i32 0, i32 1
  %117 = load ptr, ptr %7, align 8
  %118 = call i32 @token_to_terminal(ptr noundef %117)
  store i32 %118, ptr %116, align 4
  %119 = load i64, ptr %20, align 4
  %120 = call zeroext i1 @push(ptr noundef %5, i64 %119)
  %121 = load ptr, ptr %7, align 8
  %122 = call i32 @token_to_terminal(ptr noundef %121)
  %123 = icmp eq i32 %122, 4
  br i1 %123, label %124, label %126

124:                                              ; preds = %114
  %125 = load ptr, ptr %7, align 8
  call void @add_to_tree(ptr noundef %6, ptr noundef %125)
  br label %126

126:                                              ; preds = %124, %114
  br label %163

127:                                              ; preds = %84
  call void @find_rule(ptr noundef %5, ptr noundef %4)
  %128 = load ptr, ptr %7, align 8
  %129 = getelementptr inbounds nuw %struct.Token, ptr %128, i32 0, i32 0
  %130 = load i32, ptr %129, align 8
  %131 = icmp eq i32 %130, 28
  br i1 %131, label %132, label %133

132:                                              ; preds = %127
  br label %163

133:                                              ; preds = %127
  %134 = call i32 @items_count(ptr noundef %5)
  %135 = icmp sgt i32 %134, 1
  br i1 %135, label %136, label %137

136:                                              ; preds = %133
  store i8 1, ptr %12, align 1
  br label %137

137:                                              ; preds = %136, %133
  br label %163

138:                                              ; preds = %84
  br label %163

139:                                              ; preds = %84
  %140 = load ptr, ptr %7, align 8
  %141 = call zeroext i1 @isNum(ptr noundef %140)
  br i1 %141, label %142, label %145

142:                                              ; preds = %139
  %143 = load ptr, ptr %8, align 8
  %144 = call zeroext i1 @isNum(ptr noundef %143)
  br i1 %144, label %161, label %145

145:                                              ; preds = %142, %139
  %146 = load ptr, ptr %7, align 8
  %147 = call zeroext i1 @isNum(ptr noundef %146)
  br i1 %147, label %148, label %153

148:                                              ; preds = %145
  %149 = load ptr, ptr %8, align 8
  %150 = getelementptr inbounds nuw %struct.Token, ptr %149, i32 0, i32 0
  %151 = load i32, ptr %150, align 8
  %152 = icmp eq i32 %151, 1
  br i1 %152, label %161, label %153

153:                                              ; preds = %148, %145
  %154 = load ptr, ptr %7, align 8
  %155 = getelementptr inbounds nuw %struct.Token, ptr %154, i32 0, i32 0
  %156 = load i32, ptr %155, align 8
  %157 = icmp eq i32 %156, 1
  br i1 %157, label %158, label %162

158:                                              ; preds = %153
  %159 = load ptr, ptr %8, align 8
  %160 = call zeroext i1 @isNum(ptr noundef %159)
  br i1 %160, label %161, label %162

161:                                              ; preds = %158, %148, %142
  call void @print_error(i32 noundef 2)
  br label %162

162:                                              ; preds = %161, %158, %153
  br label %163

163:                                              ; preds = %162, %138, %137, %132, %126, %95
  %164 = load ptr, ptr %7, align 8
  store ptr %164, ptr %8, align 8
  br label %165

165:                                              ; preds = %163, %32
  %166 = load i8, ptr %13, align 1
  %167 = trunc i8 %166 to i1
  br i1 %167, label %26, label %168, !llvm.loop !20

168:                                              ; preds = %165, %31
  call void @exps_reverse(ptr noundef %4)
  call void @ast_reverse(ptr noundef %6)
  %169 = call ptr @abstract_syntax_tree(ptr noundef %4, ptr noundef %6)
  store ptr %169, ptr %21, align 8
  %170 = load ptr, ptr %21, align 8
  store ptr %170, ptr %2, align 8
  br label %171

171:                                              ; preds = %168, %82
  %172 = load ptr, ptr %2, align 8
  ret ptr %172
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @string_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.String, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 1
  store i64 0, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.String, ptr %7, i32 0, i32 2
  store i64 0, ptr %8, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @string_append(ptr noundef %0, i8 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = add i64 %7, 1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.String, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = icmp uge i64 %8, %11
  br i1 %12, label %13, label %36

13:                                               ; preds = %2
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.String, ptr %14, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = mul i64 %16, 2
  %18 = add i64 %17, 2
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.String, ptr %19, i32 0, i32 2
  store i64 %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.String, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.String, ptr %24, i32 0, i32 2
  %26 = load i64, ptr %25, align 8
  %27 = call ptr @realloc(ptr noundef %23, i64 noundef %26) #13
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.String, ptr %28, i32 0, i32 0
  store ptr %27, ptr %29, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.String, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %35

34:                                               ; preds = %13
  call void @print_error(i32 noundef 99)
  br label %35

35:                                               ; preds = %34, %13
  br label %36

36:                                               ; preds = %35, %2
  %37 = load i8, ptr %4, align 1
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.String, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds nuw %struct.String, ptr %41, i32 0, i32 1
  %43 = load i64, ptr %42, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr %42, align 8
  %45 = getelementptr inbounds nuw i8, ptr %40, i64 %43
  store i8 %37, ptr %45, align 1
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.String, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.String, ptr %49, i32 0, i32 1
  %51 = load i64, ptr %50, align 8
  %52 = getelementptr inbounds nuw i8, ptr %48, i64 %51
  store i8 0, ptr %52, align 1
  ret void
}

; Function Attrs: allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #7

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @string_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.String, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.String, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  br label %11

11:                                               ; preds = %7, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.String, ptr %12, i32 0, i32 0
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.String, ptr %14, i32 0, i32 1
  store i64 0, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.String, ptr %16, i32 0, i32 2
  store i64 0, ptr %17, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @string_concat(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %81

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @strlen(ptr noundef %11) #11
  store i64 %12, ptr %5, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.String, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = load i64, ptr %5, align 8
  %17 = add i64 %15, %16
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.String, ptr %18, i32 0, i32 2
  %20 = load i64, ptr %19, align 8
  %21 = icmp uge i64 %17, %20
  br i1 %21, label %22, label %46

22:                                               ; preds = %10
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.String, ptr %23, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = load i64, ptr %5, align 8
  %27 = add i64 %25, %26
  %28 = add i64 %27, 1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.String, ptr %29, i32 0, i32 2
  store i64 %28, ptr %30, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.String, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.String, ptr %34, i32 0, i32 2
  %36 = load i64, ptr %35, align 8
  %37 = call ptr @realloc(ptr noundef %33, i64 noundef %36) #13
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.String, ptr %38, i32 0, i32 0
  store ptr %37, ptr %39, align 8
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.String, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %45

44:                                               ; preds = %22
  call void @print_error(i32 noundef 99)
  br label %45

45:                                               ; preds = %44, %22
  br label %46

46:                                               ; preds = %45, %10
  store i64 0, ptr %6, align 8
  br label %47

47:                                               ; preds = %65, %46
  %48 = load i64, ptr %6, align 8
  %49 = load i64, ptr %5, align 8
  %50 = icmp ult i64 %48, %49
  br i1 %50, label %51, label %68

51:                                               ; preds = %47
  %52 = load ptr, ptr %4, align 8
  %53 = load i64, ptr %6, align 8
  %54 = getelementptr inbounds nuw i8, ptr %52, i64 %53
  %55 = load i8, ptr %54, align 1
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds nuw %struct.String, ptr %56, i32 0, i32 0
  %58 = load ptr, ptr %57, align 8
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds nuw %struct.String, ptr %59, i32 0, i32 1
  %61 = load i64, ptr %60, align 8
  %62 = load i64, ptr %6, align 8
  %63 = add i64 %61, %62
  %64 = getelementptr inbounds nuw i8, ptr %58, i64 %63
  store i8 %55, ptr %64, align 1
  br label %65

65:                                               ; preds = %51
  %66 = load i64, ptr %6, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr %6, align 8
  br label %47, !llvm.loop !21

68:                                               ; preds = %47
  %69 = load i64, ptr %5, align 8
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds nuw %struct.String, ptr %70, i32 0, i32 1
  %72 = load i64, ptr %71, align 8
  %73 = add i64 %72, %69
  store i64 %73, ptr %71, align 8
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds nuw %struct.String, ptr %74, i32 0, i32 0
  %76 = load ptr, ptr %75, align 8
  %77 = load ptr, ptr %3, align 8
  %78 = getelementptr inbounds nuw %struct.String, ptr %77, i32 0, i32 1
  %79 = load i64, ptr %78, align 8
  %80 = getelementptr inbounds nuw i8, ptr %76, i64 %79
  store i8 0, ptr %80, align 1
  br label %81

81:                                               ; preds = %68, %9
  ret void
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @string_token_to_string(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.String, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @handle_escape_sequences(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %5

5:                                                ; preds = %100, %66, %1
  %6 = load i64, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.String, ptr %7, i32 0, i32 1
  %9 = load i64, ptr %8, align 8
  %10 = icmp ult i64 %6, %9
  br i1 %10, label %11, label %103

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.String, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load i64, ptr %3, align 8
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 92
  br i1 %19, label %20, label %100

20:                                               ; preds = %11
  %21 = load i64, ptr %3, align 8
  %22 = add i64 %21, 1
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.String, ptr %23, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = icmp ult i64 %22, %25
  br i1 %26, label %27, label %99

27:                                               ; preds = %20
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.String, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = load i64, ptr %3, align 8
  %32 = add i64 %31, 1
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  switch i32 %35, label %66 [
    i32 110, label %36
    i32 116, label %42
    i32 114, label %48
    i32 92, label %54
    i32 34, label %60
  ]

36:                                               ; preds = %27
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.String, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = load i64, ptr %3, align 8
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 %40
  store i8 10, ptr %41, align 1
  br label %69

42:                                               ; preds = %27
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds nuw %struct.String, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %3, align 8
  %47 = getelementptr inbounds nuw i8, ptr %45, i64 %46
  store i8 9, ptr %47, align 1
  br label %69

48:                                               ; preds = %27
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds nuw %struct.String, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  %52 = load i64, ptr %3, align 8
  %53 = getelementptr inbounds nuw i8, ptr %51, i64 %52
  store i8 13, ptr %53, align 1
  br label %69

54:                                               ; preds = %27
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds nuw %struct.String, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load i64, ptr %3, align 8
  %59 = getelementptr inbounds nuw i8, ptr %57, i64 %58
  store i8 92, ptr %59, align 1
  br label %69

60:                                               ; preds = %27
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds nuw %struct.String, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load i64, ptr %3, align 8
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 %64
  store i8 34, ptr %65, align 1
  br label %69

66:                                               ; preds = %27
  %67 = load i64, ptr %3, align 8
  %68 = add i64 %67, 1
  store i64 %68, ptr %3, align 8
  br label %5, !llvm.loop !22

69:                                               ; preds = %60, %54, %48, %42, %36
  %70 = load i64, ptr %3, align 8
  %71 = add i64 %70, 1
  store i64 %71, ptr %4, align 8
  br label %72

72:                                               ; preds = %91, %69
  %73 = load i64, ptr %4, align 8
  %74 = load ptr, ptr %2, align 8
  %75 = getelementptr inbounds nuw %struct.String, ptr %74, i32 0, i32 1
  %76 = load i64, ptr %75, align 8
  %77 = icmp ult i64 %73, %76
  br i1 %77, label %78, label %94

78:                                               ; preds = %72
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr inbounds nuw %struct.String, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = load i64, ptr %4, align 8
  %83 = add i64 %82, 1
  %84 = getelementptr inbounds nuw i8, ptr %81, i64 %83
  %85 = load i8, ptr %84, align 1
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds nuw %struct.String, ptr %86, i32 0, i32 0
  %88 = load ptr, ptr %87, align 8
  %89 = load i64, ptr %4, align 8
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 %89
  store i8 %85, ptr %90, align 1
  br label %91

91:                                               ; preds = %78
  %92 = load i64, ptr %4, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr %4, align 8
  br label %72, !llvm.loop !23

94:                                               ; preds = %72
  %95 = load ptr, ptr %2, align 8
  %96 = getelementptr inbounds nuw %struct.String, ptr %95, i32 0, i32 1
  %97 = load i64, ptr %96, align 8
  %98 = add i64 %97, -1
  store i64 %98, ptr %96, align 8
  br label %99

99:                                               ; preds = %94, %20
  br label %100

100:                                              ; preds = %99, %11
  %101 = load i64, ptr %3, align 8
  %102 = add i64 %101, 1
  store i64 %102, ptr %3, align 8
  br label %5, !llvm.loop !22

103:                                              ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @TypeMatchError(i32 noundef %0, i32 noundef %1, i1 noundef zeroext %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  %8 = zext i1 %2 to i8
  store i8 %8, ptr %7, align 1
  %9 = load i32, ptr %5, align 4
  %10 = icmp eq i32 %9, 4
  br i1 %10, label %11, label %15

11:                                               ; preds = %3
  %12 = load i32, ptr %6, align 4
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  call void @print_error(i32 noundef 8)
  br label %15

15:                                               ; preds = %14, %11, %3
  %16 = load i32, ptr %5, align 4
  %17 = icmp eq i32 %16, 4
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i1 false, ptr %4, align 1
  br label %64

19:                                               ; preds = %15
  %20 = load i8, ptr %7, align 1
  %21 = trunc i8 %20 to i1
  br i1 %21, label %27, label %22

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp ne i32 %23, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  store i1 true, ptr %4, align 1
  br label %64

27:                                               ; preds = %22, %19
  %28 = load i32, ptr %5, align 4
  switch i32 %28, label %62 [
    i32 0, label %29
    i32 1, label %40
    i32 2, label %51
  ]

29:                                               ; preds = %27
  %30 = load i32, ptr %6, align 4
  %31 = icmp eq i32 %30, 4
  br i1 %31, label %38, label %32

32:                                               ; preds = %29
  %33 = load i32, ptr %6, align 4
  %34 = icmp eq i32 %33, 2
  br i1 %34, label %38, label %35

35:                                               ; preds = %32
  %36 = load i32, ptr %6, align 4
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %39

38:                                               ; preds = %35, %32, %29
  store i1 true, ptr %4, align 1
  br label %64

39:                                               ; preds = %35
  br label %63

40:                                               ; preds = %27
  %41 = load i32, ptr %6, align 4
  %42 = icmp eq i32 %41, 4
  br i1 %42, label %49, label %43

43:                                               ; preds = %40
  %44 = load i32, ptr %6, align 4
  %45 = icmp eq i32 %44, 2
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = load i32, ptr %6, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %46, %43, %40
  store i1 true, ptr %4, align 1
  br label %64

50:                                               ; preds = %46
  br label %63

51:                                               ; preds = %27
  %52 = load i32, ptr %6, align 4
  %53 = icmp eq i32 %52, 4
  br i1 %53, label %60, label %54

54:                                               ; preds = %51
  %55 = load i32, ptr %6, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %60, label %57

57:                                               ; preds = %54
  %58 = load i32, ptr %6, align 4
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %61

60:                                               ; preds = %57, %54, %51
  store i1 true, ptr %4, align 1
  br label %64

61:                                               ; preds = %57
  br label %63

62:                                               ; preds = %27
  br label %63

63:                                               ; preds = %62, %61, %50, %39
  store i1 false, ptr %4, align 1
  br label %64

64:                                               ; preds = %63, %60, %49, %38, %26, %18
  %65 = load i1, ptr %4, align 1
  ret i1 %65
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @begin_parsing() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @malloc(i64 noundef 16) #10
  store ptr %2, ptr @instructions, align 8
  %3 = load ptr, ptr @instructions, align 8
  call void @code_list_init(ptr noundef %3)
  %4 = call ptr @malloc(i64 noundef 24) #10
  store ptr %4, ptr %1, align 8
  %5 = load ptr, ptr %1, align 8
  call void @string_concat(ptr noundef %5, ptr noundef @.str.214)
  %6 = load ptr, ptr @instructions, align 8
  %7 = load ptr, ptr %1, align 8
  call void @code_list_insert(ptr noundef %6, ptr noundef %7)
  %8 = call ptr @malloc(i64 noundef 16) #10
  store ptr %8, ptr @gb_table, align 8
  %9 = load ptr, ptr @gb_table, align 8
  call void @global_init(ptr noundef %9)
  %10 = load ptr, ptr @__stdinp, align 8
  %11 = call ptr @read_token(ptr noundef %10)
  store ptr %11, ptr @curr_token, align 8
  %12 = load ptr, ptr @curr_token, align 8
  %13 = call i32 @program()
  store i32 %13, ptr @parsing_result, align 4
  %14 = load i32, ptr @parsing_result, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %0
  %17 = load ptr, ptr @__stdoutp, align 8
  %18 = load ptr, ptr @instructions, align 8
  call void @code_to_file(ptr noundef %17, ptr noundef %18)
  br label %19

19:                                               ; preds = %16, %0
  %20 = load i32, ptr @parsing_result, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @program() #0 {
  %1 = alloca i32, align 4
  %2 = load ptr, ptr @curr_token, align 8
  %3 = call i32 @prolog()
  store i32 %3, ptr @parsing_result, align 4
  %4 = load i32, ptr @parsing_result, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %0
  %7 = load i32, ptr @parsing_result, align 4
  store i32 %7, ptr %1, align 4
  br label %22

8:                                                ; preds = %0
  %9 = load ptr, ptr @curr_token, align 8
  %10 = call i32 @fn_list()
  store i32 %10, ptr @parsing_result, align 4
  %11 = load i32, ptr @parsing_result, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = load i32, ptr @parsing_result, align 4
  store i32 %14, ptr %1, align 4
  br label %22

15:                                               ; preds = %8
  %16 = load ptr, ptr @curr_token, align 8
  %17 = getelementptr inbounds nuw %struct.Token, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %15
  store i32 2, ptr %1, align 4
  br label %22

21:                                               ; preds = %15
  store i32 0, ptr %1, align 4
  br label %22

22:                                               ; preds = %21, %20, %13, %6
  %23 = load i32, ptr %1, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @prolog() #0 {
  %1 = alloca i32, align 4
  %2 = load ptr, ptr @curr_token, align 8
  %3 = getelementptr inbounds nuw %struct.Token, ptr %2, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = icmp ne i32 %4, 33
  br i1 %5, label %6, label %7

6:                                                ; preds = %0
  store i32 2, ptr %1, align 4
  br label %90

7:                                                ; preds = %0
  %8 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %8)
  %9 = load ptr, ptr @__stdinp, align 8
  %10 = call ptr @read_token(ptr noundef %9)
  store ptr %10, ptr @curr_token, align 8
  %11 = load ptr, ptr @curr_token, align 8
  %12 = getelementptr inbounds nuw %struct.Token, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp ne i32 %13, 60
  br i1 %14, label %15, label %16

15:                                               ; preds = %7
  store i32 2, ptr %1, align 4
  br label %90

16:                                               ; preds = %7
  %17 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr @__stdinp, align 8
  %19 = call ptr @read_token(ptr noundef %18)
  store ptr %19, ptr @curr_token, align 8
  %20 = load ptr, ptr @curr_token, align 8
  %21 = getelementptr inbounds nuw %struct.Token, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp ne i32 %22, 12
  br i1 %23, label %24, label %25

24:                                               ; preds = %16
  store i32 2, ptr %1, align 4
  br label %90

25:                                               ; preds = %16
  %26 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %26)
  %27 = load ptr, ptr @__stdinp, align 8
  %28 = call ptr @read_token(ptr noundef %27)
  store ptr %28, ptr @curr_token, align 8
  %29 = load ptr, ptr @curr_token, align 8
  %30 = getelementptr inbounds nuw %struct.Token, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 32
  br i1 %32, label %33, label %34

33:                                               ; preds = %25
  store i32 2, ptr %1, align 4
  br label %90

34:                                               ; preds = %25
  %35 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %35)
  %36 = load ptr, ptr @__stdinp, align 8
  %37 = call ptr @read_token(ptr noundef %36)
  store ptr %37, ptr @curr_token, align 8
  %38 = load ptr, ptr @curr_token, align 8
  %39 = getelementptr inbounds nuw %struct.Token, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp ne i32 %40, 46
  br i1 %41, label %42, label %43

42:                                               ; preds = %34
  store i32 2, ptr %1, align 4
  br label %90

43:                                               ; preds = %34
  %44 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %44)
  %45 = load ptr, ptr @__stdinp, align 8
  %46 = call ptr @read_token(ptr noundef %45)
  store ptr %46, ptr @curr_token, align 8
  %47 = load ptr, ptr @curr_token, align 8
  %48 = getelementptr inbounds nuw %struct.Token, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp ne i32 %49, 18
  br i1 %50, label %51, label %52

51:                                               ; preds = %43
  store i32 2, ptr %1, align 4
  br label %90

52:                                               ; preds = %43
  %53 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %53)
  %54 = load ptr, ptr @__stdinp, align 8
  %55 = call ptr @read_token(ptr noundef %54)
  store ptr %55, ptr @curr_token, align 8
  %56 = load ptr, ptr @curr_token, align 8
  %57 = getelementptr inbounds nuw %struct.Token, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %57, align 8
  %59 = icmp ne i32 %58, 7
  br i1 %59, label %60, label %61

60:                                               ; preds = %52
  store i32 2, ptr %1, align 4
  br label %90

61:                                               ; preds = %52
  %62 = load ptr, ptr @curr_token, align 8
  %63 = getelementptr inbounds nuw %struct.Token, ptr %62, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  %65 = call i32 @strcmp(ptr noundef %64, ptr noundef @.str.1.219) #11
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %61
  store i32 0, ptr %1, align 4
  br label %90

68:                                               ; preds = %61
  %69 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %69)
  %70 = load ptr, ptr @__stdinp, align 8
  %71 = call ptr @read_token(ptr noundef %70)
  store ptr %71, ptr @curr_token, align 8
  %72 = load ptr, ptr @curr_token, align 8
  %73 = getelementptr inbounds nuw %struct.Token, ptr %72, i32 0, i32 0
  %74 = load i32, ptr %73, align 8
  %75 = icmp ne i32 %74, 19
  br i1 %75, label %76, label %77

76:                                               ; preds = %68
  store i32 2, ptr %1, align 4
  br label %90

77:                                               ; preds = %68
  %78 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %78)
  %79 = load ptr, ptr @__stdinp, align 8
  %80 = call ptr @read_token(ptr noundef %79)
  store ptr %80, ptr @curr_token, align 8
  %81 = load ptr, ptr @curr_token, align 8
  %82 = getelementptr inbounds nuw %struct.Token, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %82, align 8
  %84 = icmp ne i32 %83, 28
  br i1 %84, label %85, label %86

85:                                               ; preds = %77
  store i32 2, ptr %1, align 4
  br label %90

86:                                               ; preds = %77
  %87 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %87)
  %88 = load ptr, ptr @__stdinp, align 8
  %89 = call ptr @read_token(ptr noundef %88)
  store ptr %89, ptr @curr_token, align 8
  store i32 0, ptr %1, align 4
  br label %90

90:                                               ; preds = %86, %85, %76, %67, %60, %51, %42, %33, %24, %15, %6
  %91 = load i32, ptr %1, align 4
  ret i32 %91
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @fn_list() #0 {
  %1 = alloca i32, align 4
  %2 = load ptr, ptr @curr_token, align 8
  %3 = getelementptr inbounds nuw %struct.Token, ptr %2, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %0
  store i32 3, ptr %1, align 4
  br label %32

7:                                                ; preds = %0
  %8 = load ptr, ptr @curr_token, align 8
  %9 = getelementptr inbounds nuw %struct.Token, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp ne i32 %10, 40
  br i1 %11, label %12, label %13

12:                                               ; preds = %7
  store i32 2, ptr %1, align 4
  br label %32

13:                                               ; preds = %7
  %14 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr @__stdinp, align 8
  %16 = call ptr @read_token(ptr noundef %15)
  store ptr %16, ptr @curr_token, align 8
  %17 = load ptr, ptr @curr_token, align 8
  %18 = getelementptr inbounds nuw %struct.Token, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp ne i32 %19, 36
  br i1 %20, label %21, label %22

21:                                               ; preds = %13
  store i32 2, ptr %1, align 4
  br label %32

22:                                               ; preds = %13
  %23 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %23)
  %24 = load ptr, ptr @__stdinp, align 8
  %25 = call ptr @read_token(ptr noundef %24)
  store ptr %25, ptr @curr_token, align 8
  %26 = call i32 @fn_name()
  store i32 %26, ptr @parsing_result, align 4
  %27 = load i32, ptr @parsing_result, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %22
  %30 = load i32, ptr @parsing_result, align 4
  store i32 %30, ptr %1, align 4
  br label %32

31:                                               ; preds = %22
  store i32 0, ptr %1, align 4
  br label %32

32:                                               ; preds = %31, %29, %21, %12, %6
  %33 = load i32, ptr %1, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @fn_name() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.args, align 8
  %5 = alloca %struct.args, align 8
  %6 = alloca %struct.args, align 8
  %7 = alloca %struct.args, align 8
  %8 = alloca %struct.args, align 8
  %9 = alloca %struct.args, align 8
  %10 = alloca %struct.args, align 8
  %11 = alloca %struct.args, align 8
  %12 = alloca %struct.args, align 8
  %13 = alloca %struct.args, align 8
  %14 = load ptr, ptr @curr_token, align 8
  %15 = getelementptr inbounds nuw %struct.Token, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %0
  store i32 2, ptr %1, align 4
  br label %251

19:                                               ; preds = %0
  %20 = load ptr, ptr @gb_table, align 8
  %21 = load ptr, ptr @curr_token, align 8
  %22 = getelementptr inbounds nuw %struct.Token, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = call ptr @global_search(ptr noundef %20, ptr noundef %23)
  store ptr %24, ptr %2, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %28

27:                                               ; preds = %19
  store i32 5, ptr %1, align 4
  br label %251

28:                                               ; preds = %19
  %29 = load ptr, ptr @gb_table, align 8
  %30 = load ptr, ptr @curr_token, align 8
  %31 = getelementptr inbounds nuw %struct.Token, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = call ptr @create_func(ptr noundef %29, ptr noundef %32)
  store ptr %33, ptr %3, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %37

36:                                               ; preds = %28
  store i32 99, ptr %1, align 4
  br label %251

37:                                               ; preds = %28
  %38 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %4, i8 0, i64 48, i1 false)
  %39 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 0
  store i32 47, ptr %39, align 8
  %40 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 1
  %41 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 2
  %42 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 3
  %43 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 4
  %44 = getelementptr inbounds nuw %struct.args, ptr %4, i32 0, i32 5
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.Function, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.String, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %44, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %4, i64 48, i1 false)
  call void @generate_code(ptr noundef %38, ptr dead_on_return noundef %5)
  %50 = load ptr, ptr @curr_token, align 8
  %51 = getelementptr inbounds nuw %struct.Token, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = call i32 @strcmp(ptr noundef %52, ptr noundef @.str.2.215) #11
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %163, label %55

55:                                               ; preds = %37
  %56 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 48, i1 false)
  %57 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 0
  store i32 1, ptr %57, align 8
  %58 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 1
  %59 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 2
  %60 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 3
  %61 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 4
  %62 = getelementptr inbounds nuw %struct.args, ptr %6, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %6, i64 48, i1 false)
  call void @generate_code(ptr noundef %56, ptr dead_on_return noundef %7)
  %63 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %8, i8 0, i64 48, i1 false)
  %64 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 0
  store i32 2, ptr %64, align 8
  %65 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 1
  %66 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 2
  %67 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 3
  %68 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 4
  %69 = getelementptr inbounds nuw %struct.args, ptr %8, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %8, i64 48, i1 false)
  call void @generate_code(ptr noundef %63, ptr dead_on_return noundef %9)
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds nuw %struct.Function, ptr %70, i32 0, i32 7
  store i8 1, ptr %71, align 4
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds nuw %struct.Function, ptr %72, i32 0, i32 2
  store i32 3, ptr %73, align 4
  %74 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %74)
  %75 = load ptr, ptr @__stdinp, align 8
  %76 = call ptr @read_token(ptr noundef %75)
  store ptr %76, ptr @curr_token, align 8
  %77 = load ptr, ptr @curr_token, align 8
  %78 = getelementptr inbounds nuw %struct.Token, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %78, align 8
  %80 = icmp ne i32 %79, 18
  br i1 %80, label %81, label %82

81:                                               ; preds = %55
  store i32 2, ptr %1, align 4
  br label %251

82:                                               ; preds = %55
  %83 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %83)
  %84 = load ptr, ptr @__stdinp, align 8
  %85 = call ptr @read_token(ptr noundef %84)
  store ptr %85, ptr @curr_token, align 8
  %86 = load ptr, ptr @curr_token, align 8
  %87 = getelementptr inbounds nuw %struct.Token, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = icmp eq i32 %88, 1
  br i1 %89, label %90, label %91

90:                                               ; preds = %82
  store i32 4, ptr %1, align 4
  br label %251

91:                                               ; preds = %82
  %92 = load ptr, ptr @curr_token, align 8
  %93 = getelementptr inbounds nuw %struct.Token, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = icmp ne i32 %94, 19
  br i1 %95, label %96, label %97

96:                                               ; preds = %91
  store i32 2, ptr %1, align 4
  br label %251

97:                                               ; preds = %91
  %98 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %98)
  %99 = load ptr, ptr @__stdinp, align 8
  %100 = call ptr @read_token(ptr noundef %99)
  store ptr %100, ptr @curr_token, align 8
  %101 = load ptr, ptr @curr_token, align 8
  %102 = getelementptr inbounds nuw %struct.Token, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp eq i32 %103, 38
  br i1 %104, label %115, label %105

105:                                              ; preds = %97
  %106 = load ptr, ptr @curr_token, align 8
  %107 = getelementptr inbounds nuw %struct.Token, ptr %106, i32 0, i32 0
  %108 = load i32, ptr %107, align 8
  %109 = icmp eq i32 %108, 37
  br i1 %109, label %115, label %110

110:                                              ; preds = %105
  %111 = load ptr, ptr @curr_token, align 8
  %112 = getelementptr inbounds nuw %struct.Token, ptr %111, i32 0, i32 0
  %113 = load i32, ptr %112, align 8
  %114 = icmp eq i32 %113, 42
  br i1 %114, label %115, label %116

115:                                              ; preds = %110, %105, %97
  store i32 4, ptr %1, align 4
  br label %251

116:                                              ; preds = %110
  %117 = load ptr, ptr @curr_token, align 8
  %118 = getelementptr inbounds nuw %struct.Token, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp ne i32 %119, 44
  br i1 %120, label %121, label %122

121:                                              ; preds = %116
  store i32 2, ptr %1, align 4
  br label %251

122:                                              ; preds = %116
  %123 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %123)
  %124 = load ptr, ptr @__stdinp, align 8
  %125 = call ptr @read_token(ptr noundef %124)
  store ptr %125, ptr @curr_token, align 8
  %126 = load ptr, ptr @curr_token, align 8
  %127 = getelementptr inbounds nuw %struct.Token, ptr %126, i32 0, i32 0
  %128 = load i32, ptr %127, align 8
  %129 = icmp ne i32 %128, 22
  br i1 %129, label %130, label %131

130:                                              ; preds = %122
  store i32 2, ptr %1, align 4
  br label %251

131:                                              ; preds = %122
  %132 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %132)
  %133 = load ptr, ptr @__stdinp, align 8
  %134 = call ptr @read_token(ptr noundef %133)
  store ptr %134, ptr @curr_token, align 8
  %135 = load ptr, ptr %3, align 8
  %136 = call i32 @statement_list(ptr noundef %135)
  store i32 %136, ptr @parsing_result, align 4
  %137 = load i32, ptr @parsing_result, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %141

139:                                              ; preds = %131
  %140 = load i32, ptr @parsing_result, align 4
  store i32 %140, ptr %1, align 4
  br label %251

141:                                              ; preds = %131
  %142 = load ptr, ptr %3, align 8
  %143 = getelementptr inbounds nuw %struct.Function, ptr %142, i32 0, i32 5
  %144 = load ptr, ptr %143, align 8
  %145 = getelementptr inbounds nuw %struct.SymtStack, ptr %144, i32 0, i32 0
  %146 = load ptr, ptr %3, align 8
  %147 = getelementptr inbounds nuw %struct.Function, ptr %146, i32 0, i32 5
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds nuw %struct.SymtStack, ptr %148, i32 0, i32 1
  %150 = load i32, ptr %149, align 8
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [127 x ptr], ptr %145, i64 0, i64 %151
  %153 = load ptr, ptr %152, align 8
  %154 = call zeroext i1 @all_vars_used(ptr noundef %153)
  br i1 %154, label %156, label %155

155:                                              ; preds = %141
  store i32 9, ptr %1, align 4
  br label %251

156:                                              ; preds = %141
  %157 = load ptr, ptr %3, align 8
  %158 = getelementptr inbounds nuw %struct.Function, ptr %157, i32 0, i32 5
  %159 = load ptr, ptr %158, align 8
  %160 = call zeroext i1 @dispose_local_table(ptr noundef %159)
  br i1 %160, label %162, label %161

161:                                              ; preds = %156
  store i32 99, ptr %1, align 4
  br label %251

162:                                              ; preds = %156
  store i32 0, ptr %1, align 4
  br label %251

163:                                              ; preds = %37
  %164 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %164)
  %165 = load ptr, ptr @__stdinp, align 8
  %166 = call ptr @read_token(ptr noundef %165)
  store ptr %166, ptr @curr_token, align 8
  %167 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 48, i1 false)
  %168 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 0
  store i32 2, ptr %168, align 8
  %169 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 1
  %170 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 2
  %171 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 3
  %172 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 4
  %173 = getelementptr inbounds nuw %struct.args, ptr %10, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %10, i64 48, i1 false)
  call void @generate_code(ptr noundef %167, ptr dead_on_return noundef %11)
  %174 = load ptr, ptr @curr_token, align 8
  %175 = getelementptr inbounds nuw %struct.Token, ptr %174, i32 0, i32 0
  %176 = load i32, ptr %175, align 8
  %177 = icmp ne i32 %176, 18
  br i1 %177, label %178, label %179

178:                                              ; preds = %163
  store i32 2, ptr %1, align 4
  br label %251

179:                                              ; preds = %163
  %180 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %180)
  %181 = load ptr, ptr @__stdinp, align 8
  %182 = call ptr @read_token(ptr noundef %181)
  store ptr %182, ptr @curr_token, align 8
  %183 = load ptr, ptr %3, align 8
  %184 = call i32 @param_list(ptr noundef %183, ptr noundef null)
  store i32 %184, ptr @parsing_result, align 4
  %185 = load i32, ptr @parsing_result, align 4
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %189

187:                                              ; preds = %179
  %188 = load i32, ptr @parsing_result, align 4
  store i32 %188, ptr %1, align 4
  br label %251

189:                                              ; preds = %179
  %190 = load ptr, ptr @curr_token, align 8
  %191 = getelementptr inbounds nuw %struct.Token, ptr %190, i32 0, i32 0
  %192 = load i32, ptr %191, align 8
  %193 = icmp ne i32 %192, 19
  br i1 %193, label %194, label %195

194:                                              ; preds = %189
  store i32 2, ptr %1, align 4
  br label %251

195:                                              ; preds = %189
  %196 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %196)
  %197 = load ptr, ptr @__stdinp, align 8
  %198 = call ptr @read_token(ptr noundef %197)
  store ptr %198, ptr @curr_token, align 8
  %199 = load ptr, ptr %3, align 8
  %200 = call i32 @fn_return_type(ptr noundef %199)
  store i32 %200, ptr @parsing_result, align 4
  %201 = load ptr, ptr @curr_token, align 8
  %202 = getelementptr inbounds nuw %struct.Token, ptr %201, i32 0, i32 0
  %203 = load i32, ptr %202, align 8
  %204 = icmp ne i32 %203, 22
  br i1 %204, label %205, label %206

205:                                              ; preds = %195
  store i32 2, ptr %1, align 4
  br label %251

206:                                              ; preds = %195
  %207 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %207)
  %208 = load ptr, ptr @__stdinp, align 8
  %209 = call ptr @read_token(ptr noundef %208)
  store ptr %209, ptr @curr_token, align 8
  %210 = load ptr, ptr %3, align 8
  %211 = call i32 @statement_list(ptr noundef %210)
  store i32 %211, ptr @parsing_result, align 4
  %212 = load i32, ptr @parsing_result, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %216

214:                                              ; preds = %206
  %215 = load i32, ptr @parsing_result, align 4
  store i32 %215, ptr %1, align 4
  br label %251

216:                                              ; preds = %206
  %217 = load ptr, ptr %3, align 8
  %218 = getelementptr inbounds nuw %struct.Function, ptr %217, i32 0, i32 5
  %219 = load ptr, ptr %218, align 8
  %220 = getelementptr inbounds nuw %struct.SymtStack, ptr %219, i32 0, i32 0
  %221 = load ptr, ptr %3, align 8
  %222 = getelementptr inbounds nuw %struct.Function, ptr %221, i32 0, i32 5
  %223 = load ptr, ptr %222, align 8
  %224 = getelementptr inbounds nuw %struct.SymtStack, ptr %223, i32 0, i32 1
  %225 = load i32, ptr %224, align 8
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [127 x ptr], ptr %220, i64 0, i64 %226
  %228 = load ptr, ptr %227, align 8
  %229 = call zeroext i1 @all_vars_used(ptr noundef %228)
  br i1 %229, label %231, label %230

230:                                              ; preds = %216
  store i32 9, ptr %1, align 4
  br label %251

231:                                              ; preds = %216
  %232 = load ptr, ptr %3, align 8
  %233 = getelementptr inbounds nuw %struct.Function, ptr %232, i32 0, i32 5
  %234 = load ptr, ptr %233, align 8
  %235 = call zeroext i1 @dispose_local_table(ptr noundef %234)
  br i1 %235, label %237, label %236

236:                                              ; preds = %231
  store i32 99, ptr %1, align 4
  br label %251

237:                                              ; preds = %231
  %238 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 48, i1 false)
  %239 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 0
  store i32 3, ptr %239, align 8
  %240 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 1
  %241 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 2
  %242 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 3
  %243 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 4
  %244 = getelementptr inbounds nuw %struct.args, ptr %12, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 48, i1 false)
  call void @generate_code(ptr noundef %238, ptr dead_on_return noundef %13)
  %245 = call i32 @fn_list()
  store i32 %245, ptr @parsing_result, align 4
  %246 = load i32, ptr @parsing_result, align 4
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %248, label %250

248:                                              ; preds = %237
  %249 = load i32, ptr @parsing_result, align 4
  store i32 %249, ptr %1, align 4
  br label %251

250:                                              ; preds = %237
  store i32 0, ptr %1, align 4
  br label %251

251:                                              ; preds = %250, %248, %236, %230, %214, %205, %194, %187, %178, %162, %161, %155, %139, %130, %121, %115, %96, %90, %81, %36, %27, %18
  %252 = load i32, ptr %1, align 4
  ret i32 %252
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @statement_list(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr @curr_token, align 8
  %5 = getelementptr inbounds nuw %struct.Token, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 23
  br i1 %7, label %8, label %18

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Function, ptr %9, i32 0, i32 7
  %11 = load i8, ptr %10, align 4
  %12 = trunc i8 %11 to i1
  br i1 %12, label %14, label %13

13:                                               ; preds = %8
  store i32 6, ptr %2, align 4
  br label %33

14:                                               ; preds = %8
  %15 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr @__stdinp, align 8
  %17 = call ptr @read_token(ptr noundef %16)
  store ptr %17, ptr @curr_token, align 8
  store i32 0, ptr %2, align 4
  br label %33

18:                                               ; preds = %1
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @statement(ptr noundef %19)
  store i32 %20, ptr @parsing_result, align 4
  %21 = load i32, ptr @parsing_result, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %18
  %24 = load i32, ptr @parsing_result, align 4
  store i32 %24, ptr %2, align 4
  br label %33

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 8
  %27 = call i32 @statement_list(ptr noundef %26)
  store i32 %27, ptr @parsing_result, align 4
  %28 = load i32, ptr @parsing_result, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %25
  %31 = load i32, ptr @parsing_result, align 4
  store i32 %31, ptr %2, align 4
  br label %33

32:                                               ; preds = %25
  store i32 0, ptr %2, align 4
  br label %33

33:                                               ; preds = %32, %30, %23, %14, %13
  %34 = load i32, ptr %2, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @param_list(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr @curr_token, align 8
  %11 = getelementptr inbounds nuw %struct.Token, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 19
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  store i32 0, ptr %3, align 4
  br label %124

15:                                               ; preds = %2
  %16 = load ptr, ptr @curr_token, align 8
  %17 = getelementptr inbounds nuw %struct.Token, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %21

20:                                               ; preds = %15
  store i32 2, ptr %3, align 4
  br label %124

21:                                               ; preds = %15
  %22 = load ptr, ptr @gb_table, align 8
  %23 = load ptr, ptr @curr_token, align 8
  %24 = getelementptr inbounds nuw %struct.Token, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = call ptr @global_search(ptr noundef %22, ptr noundef %25)
  store ptr %26, ptr %6, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %30

29:                                               ; preds = %21
  store i32 5, ptr %3, align 4
  br label %124

30:                                               ; preds = %21
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.Function, ptr %31, i32 0, i32 5
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds nuw %struct.SymtStack, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %struct.Function, ptr %35, i32 0, i32 5
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds nuw %struct.SymtStack, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [127 x ptr], ptr %34, i64 0, i64 %40
  %42 = load ptr, ptr %41, align 8
  %43 = load ptr, ptr @curr_token, align 8
  %44 = getelementptr inbounds nuw %struct.Token, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = call ptr @local_search(ptr noundef %42, ptr noundef %45)
  store ptr %46, ptr %7, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %50

49:                                               ; preds = %30
  store i32 5, ptr %3, align 4
  br label %124

50:                                               ; preds = %30
  %51 = call ptr @malloc(i64 noundef 16) #10
  store ptr %51, ptr %8, align 8
  %52 = load ptr, ptr %8, align 8
  %53 = icmp eq ptr %52, null
  br i1 %53, label %54, label %55

54:                                               ; preds = %50
  store i32 99, ptr %3, align 4
  br label %124

55:                                               ; preds = %50
  %56 = load ptr, ptr %5, align 8
  %57 = icmp eq ptr %56, null
  br i1 %57, label %58, label %62

58:                                               ; preds = %55
  %59 = load ptr, ptr %8, align 8
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.Function, ptr %60, i32 0, i32 3
  store ptr %59, ptr %61, align 8
  br label %66

62:                                               ; preds = %55
  %63 = load ptr, ptr %8, align 8
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds nuw %struct.code_list, ptr %64, i32 0, i32 1
  store ptr %63, ptr %65, align 8
  br label %66

66:                                               ; preds = %62, %58
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds nuw %struct.Function, ptr %67, i32 0, i32 5
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds nuw %struct.SymtStack, ptr %69, i32 0, i32 0
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds nuw %struct.Function, ptr %71, i32 0, i32 5
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds nuw %struct.SymtStack, ptr %73, i32 0, i32 1
  %75 = load i32, ptr %74, align 8
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [127 x ptr], ptr %70, i64 0, i64 %76
  %78 = load ptr, ptr %77, align 8
  %79 = load ptr, ptr @curr_token, align 8
  %80 = getelementptr inbounds nuw %struct.Token, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  %82 = call ptr @create_var(ptr noundef %78, ptr noundef %81, i1 noundef zeroext false)
  store ptr %82, ptr %9, align 8
  %83 = load ptr, ptr %9, align 8
  %84 = icmp eq ptr %83, null
  br i1 %84, label %85, label %86

85:                                               ; preds = %66
  store i32 99, ptr %3, align 4
  br label %124

86:                                               ; preds = %66
  %87 = load ptr, ptr %9, align 8
  %88 = load ptr, ptr %8, align 8
  %89 = getelementptr inbounds nuw %struct.code_list, ptr %88, i32 0, i32 0
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %90)
  %91 = load ptr, ptr @__stdinp, align 8
  %92 = call ptr @read_token(ptr noundef %91)
  store ptr %92, ptr @curr_token, align 8
  %93 = load ptr, ptr @curr_token, align 8
  %94 = getelementptr inbounds nuw %struct.Token, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = icmp ne i32 %95, 29
  br i1 %96, label %97, label %98

97:                                               ; preds = %86
  store i32 2, ptr %3, align 4
  br label %124

98:                                               ; preds = %86
  %99 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %99)
  %100 = load ptr, ptr @__stdinp, align 8
  %101 = call ptr @read_token(ptr noundef %100)
  store ptr %101, ptr @curr_token, align 8
  %102 = load ptr, ptr %9, align 8
  %103 = call i32 @opt_nul(ptr noundef %102, ptr noundef null)
  store i32 %103, ptr @parsing_result, align 4
  %104 = load i32, ptr @parsing_result, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %108

106:                                              ; preds = %98
  %107 = load i32, ptr @parsing_result, align 4
  store i32 %107, ptr %3, align 4
  br label %124

108:                                              ; preds = %98
  %109 = load ptr, ptr %9, align 8
  %110 = call i32 @data_type(ptr noundef %109, ptr noundef null)
  store i32 %110, ptr @parsing_result, align 4
  %111 = load i32, ptr @parsing_result, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %115

113:                                              ; preds = %108
  %114 = load i32, ptr @parsing_result, align 4
  store i32 %114, ptr %3, align 4
  br label %124

115:                                              ; preds = %108
  %116 = load ptr, ptr %4, align 8
  %117 = load ptr, ptr %8, align 8
  %118 = call i32 @more_params(ptr noundef %116, ptr noundef %117)
  store i32 %118, ptr @parsing_result, align 4
  %119 = load i32, ptr @parsing_result, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %123

121:                                              ; preds = %115
  %122 = load i32, ptr @parsing_result, align 4
  store i32 %122, ptr %3, align 4
  br label %124

123:                                              ; preds = %115
  store i32 0, ptr %3, align 4
  br label %124

124:                                              ; preds = %123, %121, %113, %106, %97, %85, %54, %49, %29, %20, %14
  %125 = load i32, ptr %3, align 4
  ret i32 %125
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @fn_return_type(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr @curr_token, align 8
  %5 = getelementptr inbounds nuw %struct.Token, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 44
  br i1 %7, label %8, label %16

8:                                                ; preds = %1
  %9 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %9)
  %10 = load ptr, ptr @__stdinp, align 8
  %11 = call ptr @read_token(ptr noundef %10)
  store ptr %11, ptr @curr_token, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Function, ptr %12, i32 0, i32 2
  store i32 3, ptr %13, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.Function, ptr %14, i32 0, i32 7
  store i8 1, ptr %15, align 4
  store i32 0, ptr %2, align 4
  br label %26

16:                                               ; preds = %1
  %17 = load ptr, ptr %3, align 8
  %18 = call i32 @opt_nul(ptr noundef null, ptr noundef %17)
  store i32 %18, ptr @parsing_result, align 4
  %19 = load i32, ptr @parsing_result, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %16
  %22 = load i32, ptr @parsing_result, align 4
  store i32 %22, ptr %2, align 4
  br label %26

23:                                               ; preds = %16
  %24 = load ptr, ptr %3, align 8
  %25 = call i32 @data_type(ptr noundef null, ptr noundef %24)
  store i32 %25, ptr @parsing_result, align 4
  store i32 0, ptr %2, align 4
  br label %26

26:                                               ; preds = %23, %21, %8
  %27 = load i32, ptr %2, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @opt_nul(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr @curr_token, align 8
  %6 = getelementptr inbounds nuw %struct.Token, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, 16
  br i1 %8, label %9, label %26

9:                                                ; preds = %2
  %10 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr @__stdinp, align 8
  %12 = call ptr @read_token(ptr noundef %11)
  store ptr %12, ptr @curr_token, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %18

15:                                               ; preds = %9
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Variable, ptr %16, i32 0, i32 3
  store i8 1, ptr %17, align 8
  br label %25

18:                                               ; preds = %9
  %19 = load ptr, ptr %4, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %18
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds nuw %struct.Function, ptr %22, i32 0, i32 1
  store i8 1, ptr %23, align 8
  br label %24

24:                                               ; preds = %21, %18
  br label %25

25:                                               ; preds = %24, %15
  br label %26

26:                                               ; preds = %25, %2
  ret i32 0
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @data_type(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr @curr_token, align 8
  %7 = getelementptr inbounds nuw %struct.Token, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  switch i32 %8, label %60 [
    i32 37, label %9
    i32 38, label %26
    i32 42, label %43
  ]

9:                                                ; preds = %2
  %10 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr @__stdinp, align 8
  %12 = call ptr @read_token(ptr noundef %11)
  store ptr %12, ptr @curr_token, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %18

15:                                               ; preds = %9
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.Variable, ptr %16, i32 0, i32 1
  store i32 0, ptr %17, align 8
  br label %25

18:                                               ; preds = %9
  %19 = load ptr, ptr %5, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %18
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.Function, ptr %22, i32 0, i32 2
  store i32 0, ptr %23, align 4
  br label %24

24:                                               ; preds = %21, %18
  br label %25

25:                                               ; preds = %24, %15
  store i32 0, ptr %3, align 4
  br label %61

26:                                               ; preds = %2
  %27 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %27)
  %28 = load ptr, ptr @__stdinp, align 8
  %29 = call ptr @read_token(ptr noundef %28)
  store ptr %29, ptr @curr_token, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %35

32:                                               ; preds = %26
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.Variable, ptr %33, i32 0, i32 1
  store i32 1, ptr %34, align 8
  br label %42

35:                                               ; preds = %26
  %36 = load ptr, ptr %5, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.Function, ptr %39, i32 0, i32 2
  store i32 1, ptr %40, align 4
  br label %41

41:                                               ; preds = %38, %35
  br label %42

42:                                               ; preds = %41, %32
  store i32 0, ptr %3, align 4
  br label %61

43:                                               ; preds = %2
  %44 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %44)
  %45 = load ptr, ptr @__stdinp, align 8
  %46 = call ptr @read_token(ptr noundef %45)
  store ptr %46, ptr @curr_token, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %52

49:                                               ; preds = %43
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.Variable, ptr %50, i32 0, i32 1
  store i32 2, ptr %51, align 8
  br label %59

52:                                               ; preds = %43
  %53 = load ptr, ptr %5, align 8
  %54 = icmp ne ptr %53, null
  br i1 %54, label %55, label %58

55:                                               ; preds = %52
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds nuw %struct.Function, ptr %56, i32 0, i32 2
  store i32 2, ptr %57, align 4
  br label %58

58:                                               ; preds = %55, %52
  br label %59

59:                                               ; preds = %58, %49
  store i32 0, ptr %3, align 4
  br label %61

60:                                               ; preds = %2
  store i32 2, ptr %3, align 4
  br label %61

61:                                               ; preds = %60, %59, %42, %25
  %62 = load i32, ptr %3, align 4
  ret i32 %62
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @more_params(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr @curr_token, align 8
  %7 = getelementptr inbounds nuw %struct.Token, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp eq i32 %8, 19
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store i32 0, ptr %3, align 4
  br label %29

11:                                               ; preds = %2
  %12 = load ptr, ptr @curr_token, align 8
  %13 = getelementptr inbounds nuw %struct.Token, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp ne i32 %14, 31
  br i1 %15, label %16, label %17

16:                                               ; preds = %11
  store i32 2, ptr %3, align 4
  br label %29

17:                                               ; preds = %11
  %18 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %18)
  %19 = load ptr, ptr @__stdinp, align 8
  %20 = call ptr @read_token(ptr noundef %19)
  store ptr %20, ptr @curr_token, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = call i32 @param_list(ptr noundef %21, ptr noundef %22)
  store i32 %23, ptr @parsing_result, align 4
  %24 = load i32, ptr @parsing_result, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %17
  %27 = load i32, ptr @parsing_result, align 4
  store i32 %27, ptr %3, align 4
  br label %29

28:                                               ; preds = %17
  store i32 0, ptr %3, align 4
  br label %29

29:                                               ; preds = %28, %26, %16, %10
  %30 = load i32, ptr %3, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @statement(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.args, align 8
  %15 = alloca %struct.args, align 8
  %16 = alloca %struct.args, align 8
  %17 = alloca %struct.args, align 8
  %18 = alloca %struct.args, align 8
  %19 = alloca %struct.args, align 8
  %20 = alloca %struct.args, align 8
  %21 = alloca %struct.args, align 8
  store ptr %0, ptr %3, align 8
  store i8 1, ptr %4, align 1
  %22 = load ptr, ptr @curr_token, align 8
  %23 = getelementptr inbounds nuw %struct.Token, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  switch i32 %24, label %755 [
    i32 43, label %25
    i32 33, label %141
    i32 1, label %257
    i32 35, label %351
    i32 45, label %485
    i32 41, label %563
    i32 50, label %607
  ]

25:                                               ; preds = %1
  %26 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %26)
  %27 = load ptr, ptr @__stdinp, align 8
  %28 = call ptr @read_token(ptr noundef %27)
  store ptr %28, ptr @curr_token, align 8
  %29 = load ptr, ptr @curr_token, align 8
  %30 = getelementptr inbounds nuw %struct.Token, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 1
  br i1 %32, label %33, label %34

33:                                               ; preds = %25
  store i32 2, ptr %2, align 4
  br label %757

34:                                               ; preds = %25
  %35 = load ptr, ptr @gb_table, align 8
  %36 = load ptr, ptr @curr_token, align 8
  %37 = getelementptr inbounds nuw %struct.Token, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = call ptr @global_search(ptr noundef %35, ptr noundef %38)
  store ptr %39, ptr %7, align 8
  %40 = load ptr, ptr %7, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %43

42:                                               ; preds = %34
  store i32 5, ptr %2, align 4
  br label %757

43:                                               ; preds = %34
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.Function, ptr %44, i32 0, i32 5
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds nuw %struct.SymtStack, ptr %46, i32 0, i32 1
  %48 = load i32, ptr %47, align 8
  store i32 %48, ptr %10, align 4
  br label %49

49:                                               ; preds = %69, %43
  %50 = load i32, ptr %10, align 4
  %51 = icmp sge i32 %50, 0
  br i1 %51, label %52, label %72

52:                                               ; preds = %49
  %53 = load ptr, ptr %3, align 8
  %54 = getelementptr inbounds nuw %struct.Function, ptr %53, i32 0, i32 5
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds nuw %struct.SymtStack, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [127 x ptr], ptr %56, i64 0, i64 %58
  %60 = load ptr, ptr %59, align 8
  %61 = load ptr, ptr @curr_token, align 8
  %62 = getelementptr inbounds nuw %struct.Token, ptr %61, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = call ptr @local_search(ptr noundef %60, ptr noundef %63)
  store ptr %64, ptr %6, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %67, label %68

67:                                               ; preds = %52
  store i32 5, ptr %2, align 4
  br label %757

68:                                               ; preds = %52
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %10, align 4
  %71 = add nsw i32 %70, -1
  store i32 %71, ptr %10, align 4
  br label %49, !llvm.loop !24

72:                                               ; preds = %49
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds nuw %struct.Function, ptr %73, i32 0, i32 5
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds nuw %struct.SymtStack, ptr %75, i32 0, i32 0
  %77 = load ptr, ptr %3, align 8
  %78 = getelementptr inbounds nuw %struct.Function, ptr %77, i32 0, i32 5
  %79 = load ptr, ptr %78, align 8
  %80 = getelementptr inbounds nuw %struct.SymtStack, ptr %79, i32 0, i32 1
  %81 = load i32, ptr %80, align 8
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [127 x ptr], ptr %76, i64 0, i64 %82
  %84 = load ptr, ptr %83, align 8
  %85 = load ptr, ptr @curr_token, align 8
  %86 = getelementptr inbounds nuw %struct.Token, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = call ptr @create_var(ptr noundef %84, ptr noundef %87, i1 noundef zeroext true)
  store ptr %88, ptr %8, align 8
  %89 = load ptr, ptr %8, align 8
  %90 = icmp eq ptr %89, null
  br i1 %90, label %91, label %92

91:                                               ; preds = %72
  store i32 99, ptr %2, align 4
  br label %757

92:                                               ; preds = %72
  %93 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %93)
  %94 = load ptr, ptr @__stdinp, align 8
  %95 = call ptr @read_token(ptr noundef %94)
  store ptr %95, ptr @curr_token, align 8
  %96 = load ptr, ptr %8, align 8
  %97 = call i32 @type(ptr noundef %96)
  store i32 %97, ptr @parsing_result, align 4
  %98 = load i32, ptr @parsing_result, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %102

100:                                              ; preds = %92
  %101 = load i32, ptr @parsing_result, align 4
  store i32 %101, ptr %2, align 4
  br label %757

102:                                              ; preds = %92
  %103 = load ptr, ptr @curr_token, align 8
  %104 = getelementptr inbounds nuw %struct.Token, ptr %103, i32 0, i32 0
  %105 = load i32, ptr %104, align 8
  %106 = icmp ne i32 %105, 12
  br i1 %106, label %107, label %108

107:                                              ; preds = %102
  store i32 2, ptr %2, align 4
  br label %757

108:                                              ; preds = %102
  %109 = load ptr, ptr @__stdinp, align 8
  %110 = call ptr @parse_expression(ptr noundef %109)
  store ptr %110, ptr %5, align 8
  %111 = load ptr, ptr %8, align 8
  %112 = getelementptr inbounds nuw %struct.Variable, ptr %111, i32 0, i32 1
  %113 = load i32, ptr %112, align 8
  store i32 %113, ptr %9, align 4
  %114 = load ptr, ptr %5, align 8
  %115 = load ptr, ptr @instructions, align 8
  %116 = load ptr, ptr %8, align 8
  %117 = getelementptr inbounds nuw %struct.Variable, ptr %116, i32 0, i32 1
  %118 = load ptr, ptr %8, align 8
  %119 = getelementptr inbounds nuw %struct.Variable, ptr %118, i32 0, i32 0
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds nuw %struct.String, ptr %120, i32 0, i32 0
  %122 = load ptr, ptr %121, align 8
  %123 = load ptr, ptr %3, align 8
  %124 = getelementptr inbounds nuw %struct.Function, ptr %123, i32 0, i32 5
  %125 = load ptr, ptr %124, align 8
  %126 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %114, ptr noundef %115, ptr noundef %117, ptr noundef @.str.3.216, ptr noundef %122, ptr noundef %125, ptr noundef %126)
  %127 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %127)
  %128 = load ptr, ptr @__stdinp, align 8
  %129 = call ptr @read_token(ptr noundef %128)
  store ptr %129, ptr @curr_token, align 8
  %130 = load i32, ptr %9, align 4
  %131 = load ptr, ptr %8, align 8
  %132 = getelementptr inbounds nuw %struct.Variable, ptr %131, i32 0, i32 1
  %133 = load i32, ptr %132, align 8
  %134 = load ptr, ptr %8, align 8
  %135 = getelementptr inbounds nuw %struct.Variable, ptr %134, i32 0, i32 4
  %136 = load i8, ptr %135, align 1
  %137 = trunc i8 %136 to i1
  %138 = call zeroext i1 @TypeMatchError(i32 noundef %130, i32 noundef %133, i1 noundef zeroext %137)
  br i1 %138, label %139, label %140

139:                                              ; preds = %108
  store i32 7, ptr %2, align 4
  br label %757

140:                                              ; preds = %108
  store i32 0, ptr %2, align 4
  br label %757

141:                                              ; preds = %1
  %142 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %142)
  %143 = load ptr, ptr @__stdinp, align 8
  %144 = call ptr @read_token(ptr noundef %143)
  store ptr %144, ptr @curr_token, align 8
  %145 = load ptr, ptr @curr_token, align 8
  %146 = getelementptr inbounds nuw %struct.Token, ptr %145, i32 0, i32 0
  %147 = load i32, ptr %146, align 8
  %148 = icmp ne i32 %147, 1
  br i1 %148, label %149, label %150

149:                                              ; preds = %141
  store i32 2, ptr %2, align 4
  br label %757

150:                                              ; preds = %141
  %151 = load ptr, ptr @gb_table, align 8
  %152 = load ptr, ptr @curr_token, align 8
  %153 = getelementptr inbounds nuw %struct.Token, ptr %152, i32 0, i32 1
  %154 = load ptr, ptr %153, align 8
  %155 = call ptr @global_search(ptr noundef %151, ptr noundef %154)
  store ptr %155, ptr %7, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = icmp ne ptr %156, null
  br i1 %157, label %158, label %159

158:                                              ; preds = %150
  store i32 5, ptr %2, align 4
  br label %757

159:                                              ; preds = %150
  %160 = load ptr, ptr %3, align 8
  %161 = getelementptr inbounds nuw %struct.Function, ptr %160, i32 0, i32 5
  %162 = load ptr, ptr %161, align 8
  %163 = getelementptr inbounds nuw %struct.SymtStack, ptr %162, i32 0, i32 1
  %164 = load i32, ptr %163, align 8
  store i32 %164, ptr %11, align 4
  br label %165

165:                                              ; preds = %185, %159
  %166 = load i32, ptr %11, align 4
  %167 = icmp sge i32 %166, 0
  br i1 %167, label %168, label %188

168:                                              ; preds = %165
  %169 = load ptr, ptr %3, align 8
  %170 = getelementptr inbounds nuw %struct.Function, ptr %169, i32 0, i32 5
  %171 = load ptr, ptr %170, align 8
  %172 = getelementptr inbounds nuw %struct.SymtStack, ptr %171, i32 0, i32 0
  %173 = load i32, ptr %11, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [127 x ptr], ptr %172, i64 0, i64 %174
  %176 = load ptr, ptr %175, align 8
  %177 = load ptr, ptr @curr_token, align 8
  %178 = getelementptr inbounds nuw %struct.Token, ptr %177, i32 0, i32 1
  %179 = load ptr, ptr %178, align 8
  %180 = call ptr @local_search(ptr noundef %176, ptr noundef %179)
  store ptr %180, ptr %6, align 8
  %181 = load ptr, ptr %6, align 8
  %182 = icmp ne ptr %181, null
  br i1 %182, label %183, label %184

183:                                              ; preds = %168
  store i32 5, ptr %2, align 4
  br label %757

184:                                              ; preds = %168
  br label %185

185:                                              ; preds = %184
  %186 = load i32, ptr %11, align 4
  %187 = add nsw i32 %186, -1
  store i32 %187, ptr %11, align 4
  br label %165, !llvm.loop !25

188:                                              ; preds = %165
  %189 = load ptr, ptr %3, align 8
  %190 = getelementptr inbounds nuw %struct.Function, ptr %189, i32 0, i32 5
  %191 = load ptr, ptr %190, align 8
  %192 = getelementptr inbounds nuw %struct.SymtStack, ptr %191, i32 0, i32 0
  %193 = load ptr, ptr %3, align 8
  %194 = getelementptr inbounds nuw %struct.Function, ptr %193, i32 0, i32 5
  %195 = load ptr, ptr %194, align 8
  %196 = getelementptr inbounds nuw %struct.SymtStack, ptr %195, i32 0, i32 1
  %197 = load i32, ptr %196, align 8
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [127 x ptr], ptr %192, i64 0, i64 %198
  %200 = load ptr, ptr %199, align 8
  %201 = load ptr, ptr @curr_token, align 8
  %202 = getelementptr inbounds nuw %struct.Token, ptr %201, i32 0, i32 1
  %203 = load ptr, ptr %202, align 8
  %204 = call ptr @create_var(ptr noundef %200, ptr noundef %203, i1 noundef zeroext false)
  store ptr %204, ptr %8, align 8
  %205 = load ptr, ptr %8, align 8
  %206 = icmp eq ptr %205, null
  br i1 %206, label %207, label %208

207:                                              ; preds = %188
  store i32 99, ptr %2, align 4
  br label %757

208:                                              ; preds = %188
  %209 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %209)
  %210 = load ptr, ptr @__stdinp, align 8
  %211 = call ptr @read_token(ptr noundef %210)
  store ptr %211, ptr @curr_token, align 8
  %212 = load ptr, ptr %8, align 8
  %213 = call i32 @type(ptr noundef %212)
  store i32 %213, ptr @parsing_result, align 4
  %214 = load i32, ptr @parsing_result, align 4
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %218

216:                                              ; preds = %208
  %217 = load i32, ptr @parsing_result, align 4
  store i32 %217, ptr %2, align 4
  br label %757

218:                                              ; preds = %208
  %219 = load ptr, ptr @curr_token, align 8
  %220 = getelementptr inbounds nuw %struct.Token, ptr %219, i32 0, i32 0
  %221 = load i32, ptr %220, align 8
  %222 = icmp ne i32 %221, 12
  br i1 %222, label %223, label %224

223:                                              ; preds = %218
  store i32 2, ptr %2, align 4
  br label %757

224:                                              ; preds = %218
  %225 = load ptr, ptr @__stdinp, align 8
  %226 = call ptr @parse_expression(ptr noundef %225)
  store ptr %226, ptr %5, align 8
  %227 = load ptr, ptr %8, align 8
  %228 = getelementptr inbounds nuw %struct.Variable, ptr %227, i32 0, i32 1
  %229 = load i32, ptr %228, align 8
  store i32 %229, ptr %9, align 4
  %230 = load ptr, ptr %5, align 8
  %231 = load ptr, ptr @instructions, align 8
  %232 = load ptr, ptr %8, align 8
  %233 = getelementptr inbounds nuw %struct.Variable, ptr %232, i32 0, i32 1
  %234 = load ptr, ptr %8, align 8
  %235 = getelementptr inbounds nuw %struct.Variable, ptr %234, i32 0, i32 0
  %236 = load ptr, ptr %235, align 8
  %237 = getelementptr inbounds nuw %struct.String, ptr %236, i32 0, i32 0
  %238 = load ptr, ptr %237, align 8
  %239 = load ptr, ptr %3, align 8
  %240 = getelementptr inbounds nuw %struct.Function, ptr %239, i32 0, i32 5
  %241 = load ptr, ptr %240, align 8
  %242 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %230, ptr noundef %231, ptr noundef %233, ptr noundef @.str.3.216, ptr noundef %238, ptr noundef %241, ptr noundef %242)
  %243 = load i32, ptr %9, align 4
  %244 = load ptr, ptr %8, align 8
  %245 = getelementptr inbounds nuw %struct.Variable, ptr %244, i32 0, i32 1
  %246 = load i32, ptr %245, align 8
  %247 = load ptr, ptr %8, align 8
  %248 = getelementptr inbounds nuw %struct.Variable, ptr %247, i32 0, i32 4
  %249 = load i8, ptr %248, align 1
  %250 = trunc i8 %249 to i1
  %251 = call zeroext i1 @TypeMatchError(i32 noundef %243, i32 noundef %246, i1 noundef zeroext %250)
  br i1 %251, label %252, label %253

252:                                              ; preds = %224
  store i32 7, ptr %2, align 4
  br label %757

253:                                              ; preds = %224
  %254 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %254)
  %255 = load ptr, ptr @__stdinp, align 8
  %256 = call ptr @read_token(ptr noundef %255)
  store ptr %256, ptr @curr_token, align 8
  store i32 0, ptr %2, align 4
  br label %757

257:                                              ; preds = %1
  %258 = load ptr, ptr @curr_token, align 8
  %259 = getelementptr inbounds nuw %struct.Token, ptr %258, i32 0, i32 1
  %260 = load ptr, ptr %259, align 8
  %261 = call i32 @strcmp(ptr noundef %260, ptr noundef @.str.4.217) #11
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %293

263:                                              ; preds = %257
  store i8 0, ptr %4, align 1
  %264 = load ptr, ptr %3, align 8
  %265 = getelementptr inbounds nuw %struct.Function, ptr %264, i32 0, i32 5
  %266 = load ptr, ptr %265, align 8
  %267 = load ptr, ptr @curr_token, align 8
  %268 = getelementptr inbounds nuw %struct.Token, ptr %267, i32 0, i32 1
  %269 = load ptr, ptr %268, align 8
  %270 = call ptr @search_scope(ptr noundef %266, ptr noundef %269)
  store ptr %270, ptr %6, align 8
  %271 = load ptr, ptr %6, align 8
  %272 = icmp eq ptr %271, null
  br i1 %272, label %273, label %274

273:                                              ; preds = %263
  store i32 3, ptr %2, align 4
  br label %757

274:                                              ; preds = %263
  %275 = load ptr, ptr %6, align 8
  %276 = getelementptr inbounds nuw %struct.item_var, ptr %275, i32 0, i32 1
  %277 = load ptr, ptr %276, align 8
  %278 = getelementptr inbounds nuw %struct.Variable, ptr %277, i32 0, i32 4
  %279 = load i8, ptr %278, align 1
  %280 = trunc i8 %279 to i1
  br i1 %280, label %282, label %281

281:                                              ; preds = %274
  store i32 5, ptr %2, align 4
  br label %757

282:                                              ; preds = %274
  br label %283

283:                                              ; preds = %282
  %284 = load ptr, ptr %6, align 8
  %285 = getelementptr inbounds nuw %struct.item_var, ptr %284, i32 0, i32 1
  %286 = load ptr, ptr %285, align 8
  %287 = getelementptr inbounds nuw %struct.Variable, ptr %286, i32 0, i32 5
  store i8 1, ptr %287, align 2
  %288 = load ptr, ptr %6, align 8
  %289 = getelementptr inbounds nuw %struct.item_var, ptr %288, i32 0, i32 1
  %290 = load ptr, ptr %289, align 8
  %291 = getelementptr inbounds nuw %struct.Variable, ptr %290, i32 0, i32 1
  %292 = load i32, ptr %291, align 8
  store i32 %292, ptr %9, align 4
  br label %293

293:                                              ; preds = %283, %257
  %294 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %294)
  %295 = load ptr, ptr @__stdinp, align 8
  %296 = call ptr @read_token(ptr noundef %295)
  store ptr %296, ptr @curr_token, align 8
  %297 = load ptr, ptr @curr_token, align 8
  %298 = getelementptr inbounds nuw %struct.Token, ptr %297, i32 0, i32 0
  %299 = load i32, ptr %298, align 8
  %300 = icmp ne i32 %299, 12
  br i1 %300, label %301, label %302

301:                                              ; preds = %293
  store i32 2, ptr %2, align 4
  br label %757

302:                                              ; preds = %293
  %303 = load ptr, ptr @__stdinp, align 8
  %304 = call ptr @parse_expression(ptr noundef %303)
  store ptr %304, ptr %5, align 8
  %305 = load i8, ptr %4, align 1
  %306 = trunc i8 %305 to i1
  br i1 %306, label %340, label %307

307:                                              ; preds = %302
  %308 = load ptr, ptr %5, align 8
  %309 = load ptr, ptr @instructions, align 8
  %310 = load ptr, ptr %6, align 8
  %311 = getelementptr inbounds nuw %struct.item_var, ptr %310, i32 0, i32 1
  %312 = load ptr, ptr %311, align 8
  %313 = getelementptr inbounds nuw %struct.Variable, ptr %312, i32 0, i32 1
  %314 = load ptr, ptr %6, align 8
  %315 = getelementptr inbounds nuw %struct.item_var, ptr %314, i32 0, i32 1
  %316 = load ptr, ptr %315, align 8
  %317 = getelementptr inbounds nuw %struct.Variable, ptr %316, i32 0, i32 0
  %318 = load ptr, ptr %317, align 8
  %319 = getelementptr inbounds nuw %struct.String, ptr %318, i32 0, i32 0
  %320 = load ptr, ptr %319, align 8
  %321 = load ptr, ptr %3, align 8
  %322 = getelementptr inbounds nuw %struct.Function, ptr %321, i32 0, i32 5
  %323 = load ptr, ptr %322, align 8
  %324 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %308, ptr noundef %309, ptr noundef %313, ptr noundef @.str.3.216, ptr noundef %320, ptr noundef %323, ptr noundef %324)
  %325 = load i32, ptr %9, align 4
  %326 = load ptr, ptr %6, align 8
  %327 = getelementptr inbounds nuw %struct.item_var, ptr %326, i32 0, i32 1
  %328 = load ptr, ptr %327, align 8
  %329 = getelementptr inbounds nuw %struct.Variable, ptr %328, i32 0, i32 1
  %330 = load i32, ptr %329, align 8
  %331 = load ptr, ptr %6, align 8
  %332 = getelementptr inbounds nuw %struct.item_var, ptr %331, i32 0, i32 1
  %333 = load ptr, ptr %332, align 8
  %334 = getelementptr inbounds nuw %struct.Variable, ptr %333, i32 0, i32 4
  %335 = load i8, ptr %334, align 1
  %336 = trunc i8 %335 to i1
  %337 = call zeroext i1 @TypeMatchError(i32 noundef %325, i32 noundef %330, i1 noundef zeroext %336)
  br i1 %337, label %338, label %339

338:                                              ; preds = %307
  store i32 7, ptr %2, align 4
  br label %757

339:                                              ; preds = %307
  br label %347

340:                                              ; preds = %302
  %341 = load ptr, ptr %5, align 8
  %342 = load ptr, ptr @instructions, align 8
  %343 = load ptr, ptr %3, align 8
  %344 = getelementptr inbounds nuw %struct.Function, ptr %343, i32 0, i32 5
  %345 = load ptr, ptr %344, align 8
  %346 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %341, ptr noundef %342, ptr noundef %9, ptr noundef @.str.3.216, ptr noundef @.str.4.217, ptr noundef %345, ptr noundef %346)
  br label %347

347:                                              ; preds = %340, %339
  %348 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %348)
  %349 = load ptr, ptr @__stdinp, align 8
  %350 = call ptr @read_token(ptr noundef %349)
  store ptr %350, ptr @curr_token, align 8
  store i32 0, ptr %2, align 4
  br label %757

351:                                              ; preds = %1
  %352 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %352)
  %353 = load ptr, ptr @__stdinp, align 8
  %354 = call ptr @read_token(ptr noundef %353)
  store ptr %354, ptr @curr_token, align 8
  %355 = load ptr, ptr @curr_token, align 8
  %356 = getelementptr inbounds nuw %struct.Token, ptr %355, i32 0, i32 0
  %357 = load i32, ptr %356, align 8
  %358 = icmp ne i32 %357, 18
  br i1 %358, label %359, label %360

359:                                              ; preds = %351
  store i32 2, ptr %2, align 4
  br label %757

360:                                              ; preds = %351
  %361 = load ptr, ptr @__stdinp, align 8
  %362 = call ptr @parse_expression(ptr noundef %361)
  store ptr %362, ptr %5, align 8
  store i32 4, ptr %12, align 4
  %363 = load ptr, ptr %5, align 8
  %364 = load ptr, ptr @instructions, align 8
  %365 = load ptr, ptr %3, align 8
  %366 = getelementptr inbounds nuw %struct.Function, ptr %365, i32 0, i32 5
  %367 = load ptr, ptr %366, align 8
  %368 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %363, ptr noundef %364, ptr noundef %12, ptr noundef @.str.3.216, ptr noundef @.str.5.218, ptr noundef %367, ptr noundef %368)
  %369 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %369)
  %370 = load ptr, ptr @__stdinp, align 8
  %371 = call ptr @read_token(ptr noundef %370)
  store ptr %371, ptr @curr_token, align 8
  %372 = load ptr, ptr %3, align 8
  %373 = getelementptr inbounds nuw %struct.Function, ptr %372, i32 0, i32 5
  %374 = load ptr, ptr %373, align 8
  %375 = getelementptr inbounds nuw %struct.SymtStack, ptr %374, i32 0, i32 0
  %376 = load ptr, ptr %3, align 8
  %377 = getelementptr inbounds nuw %struct.Function, ptr %376, i32 0, i32 5
  %378 = load ptr, ptr %377, align 8
  %379 = getelementptr inbounds nuw %struct.SymtStack, ptr %378, i32 0, i32 1
  %380 = load i32, ptr %379, align 8
  %381 = sext i32 %380 to i64
  %382 = getelementptr inbounds [127 x ptr], ptr %375, i64 0, i64 %381
  %383 = load ptr, ptr %382, align 8
  %384 = call i32 @statement_null(ptr noundef %383, i32 noundef 0)
  store i32 %384, ptr @parsing_result, align 4
  %385 = load i32, ptr @parsing_result, align 4
  %386 = icmp ne i32 %385, 0
  br i1 %386, label %387, label %389

387:                                              ; preds = %360
  %388 = load i32, ptr @parsing_result, align 4
  store i32 %388, ptr %2, align 4
  br label %757

389:                                              ; preds = %360
  %390 = load ptr, ptr @curr_token, align 8
  %391 = getelementptr inbounds nuw %struct.Token, ptr %390, i32 0, i32 0
  %392 = load i32, ptr %391, align 8
  %393 = icmp ne i32 %392, 22
  br i1 %393, label %394, label %395

394:                                              ; preds = %389
  store i32 2, ptr %2, align 4
  br label %757

395:                                              ; preds = %389
  %396 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %396)
  %397 = load ptr, ptr @__stdinp, align 8
  %398 = call ptr @read_token(ptr noundef %397)
  store ptr %398, ptr @curr_token, align 8
  %399 = load ptr, ptr %3, align 8
  %400 = getelementptr inbounds nuw %struct.Function, ptr %399, i32 0, i32 5
  %401 = load ptr, ptr %400, align 8
  %402 = call zeroext i1 @create_local_table(ptr noundef %401)
  br i1 %402, label %404, label %403

403:                                              ; preds = %395
  store i32 99, ptr %2, align 4
  br label %757

404:                                              ; preds = %395
  %405 = load ptr, ptr %3, align 8
  %406 = call i32 @statement_list(ptr noundef %405)
  store i32 %406, ptr @parsing_result, align 4
  %407 = load i32, ptr @parsing_result, align 4
  %408 = icmp ne i32 %407, 0
  br i1 %408, label %409, label %411

409:                                              ; preds = %404
  %410 = load i32, ptr @parsing_result, align 4
  store i32 %410, ptr %2, align 4
  br label %757

411:                                              ; preds = %404
  %412 = load ptr, ptr %3, align 8
  %413 = getelementptr inbounds nuw %struct.Function, ptr %412, i32 0, i32 5
  %414 = load ptr, ptr %413, align 8
  %415 = getelementptr inbounds nuw %struct.SymtStack, ptr %414, i32 0, i32 0
  %416 = load ptr, ptr %3, align 8
  %417 = getelementptr inbounds nuw %struct.Function, ptr %416, i32 0, i32 5
  %418 = load ptr, ptr %417, align 8
  %419 = getelementptr inbounds nuw %struct.SymtStack, ptr %418, i32 0, i32 1
  %420 = load i32, ptr %419, align 8
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [127 x ptr], ptr %415, i64 0, i64 %421
  %423 = load ptr, ptr %422, align 8
  %424 = call zeroext i1 @all_vars_used(ptr noundef %423)
  br i1 %424, label %426, label %425

425:                                              ; preds = %411
  store i32 9, ptr %2, align 4
  br label %757

426:                                              ; preds = %411
  %427 = load ptr, ptr %3, align 8
  %428 = getelementptr inbounds nuw %struct.Function, ptr %427, i32 0, i32 5
  %429 = load ptr, ptr %428, align 8
  %430 = call zeroext i1 @dispose_local_table(ptr noundef %429)
  br i1 %430, label %432, label %431

431:                                              ; preds = %426
  store i32 99, ptr %2, align 4
  br label %757

432:                                              ; preds = %426
  %433 = load ptr, ptr @curr_token, align 8
  %434 = getelementptr inbounds nuw %struct.Token, ptr %433, i32 0, i32 0
  %435 = load i32, ptr %434, align 8
  %436 = icmp ne i32 %435, 34
  br i1 %436, label %437, label %438

437:                                              ; preds = %432
  store i32 2, ptr %2, align 4
  br label %757

438:                                              ; preds = %432
  %439 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %439)
  %440 = load ptr, ptr @__stdinp, align 8
  %441 = call ptr @read_token(ptr noundef %440)
  store ptr %441, ptr @curr_token, align 8
  %442 = load ptr, ptr %3, align 8
  %443 = getelementptr inbounds nuw %struct.Function, ptr %442, i32 0, i32 5
  %444 = load ptr, ptr %443, align 8
  %445 = call zeroext i1 @create_local_table(ptr noundef %444)
  br i1 %445, label %447, label %446

446:                                              ; preds = %438
  store i32 99, ptr %2, align 4
  br label %757

447:                                              ; preds = %438
  %448 = load ptr, ptr @curr_token, align 8
  %449 = getelementptr inbounds nuw %struct.Token, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = icmp ne i32 %450, 22
  br i1 %451, label %452, label %453

452:                                              ; preds = %447
  store i32 2, ptr %2, align 4
  br label %757

453:                                              ; preds = %447
  %454 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %454)
  %455 = load ptr, ptr @__stdinp, align 8
  %456 = call ptr @read_token(ptr noundef %455)
  store ptr %456, ptr @curr_token, align 8
  %457 = load ptr, ptr %3, align 8
  %458 = call i32 @statement_list(ptr noundef %457)
  store i32 %458, ptr @parsing_result, align 4
  %459 = load i32, ptr @parsing_result, align 4
  %460 = icmp ne i32 %459, 0
  br i1 %460, label %461, label %463

461:                                              ; preds = %453
  %462 = load i32, ptr @parsing_result, align 4
  store i32 %462, ptr %2, align 4
  br label %757

463:                                              ; preds = %453
  %464 = load ptr, ptr %3, align 8
  %465 = getelementptr inbounds nuw %struct.Function, ptr %464, i32 0, i32 5
  %466 = load ptr, ptr %465, align 8
  %467 = getelementptr inbounds nuw %struct.SymtStack, ptr %466, i32 0, i32 0
  %468 = load ptr, ptr %3, align 8
  %469 = getelementptr inbounds nuw %struct.Function, ptr %468, i32 0, i32 5
  %470 = load ptr, ptr %469, align 8
  %471 = getelementptr inbounds nuw %struct.SymtStack, ptr %470, i32 0, i32 1
  %472 = load i32, ptr %471, align 8
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds [127 x ptr], ptr %467, i64 0, i64 %473
  %475 = load ptr, ptr %474, align 8
  %476 = call zeroext i1 @all_vars_used(ptr noundef %475)
  br i1 %476, label %478, label %477

477:                                              ; preds = %463
  store i32 9, ptr %2, align 4
  br label %757

478:                                              ; preds = %463
  %479 = load ptr, ptr %3, align 8
  %480 = getelementptr inbounds nuw %struct.Function, ptr %479, i32 0, i32 5
  %481 = load ptr, ptr %480, align 8
  %482 = call zeroext i1 @dispose_local_table(ptr noundef %481)
  br i1 %482, label %484, label %483

483:                                              ; preds = %478
  store i32 99, ptr %2, align 4
  br label %757

484:                                              ; preds = %478
  store i32 0, ptr %2, align 4
  br label %757

485:                                              ; preds = %1
  %486 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %486)
  %487 = load ptr, ptr @__stdinp, align 8
  %488 = call ptr @read_token(ptr noundef %487)
  store ptr %488, ptr @curr_token, align 8
  %489 = load ptr, ptr @curr_token, align 8
  %490 = getelementptr inbounds nuw %struct.Token, ptr %489, i32 0, i32 0
  %491 = load i32, ptr %490, align 8
  %492 = icmp ne i32 %491, 18
  br i1 %492, label %493, label %494

493:                                              ; preds = %485
  store i32 2, ptr %2, align 4
  br label %757

494:                                              ; preds = %485
  %495 = load ptr, ptr @__stdinp, align 8
  %496 = call ptr @parse_expression(ptr noundef %495)
  store ptr %496, ptr %5, align 8
  %497 = load ptr, ptr %3, align 8
  %498 = getelementptr inbounds nuw %struct.Function, ptr %497, i32 0, i32 5
  %499 = load ptr, ptr %498, align 8
  %500 = getelementptr inbounds nuw %struct.SymtStack, ptr %499, i32 0, i32 0
  %501 = load ptr, ptr %3, align 8
  %502 = getelementptr inbounds nuw %struct.Function, ptr %501, i32 0, i32 5
  %503 = load ptr, ptr %502, align 8
  %504 = getelementptr inbounds nuw %struct.SymtStack, ptr %503, i32 0, i32 1
  %505 = load i32, ptr %504, align 8
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds [127 x ptr], ptr %500, i64 0, i64 %506
  %508 = load ptr, ptr %507, align 8
  %509 = call i32 @statement_null(ptr noundef %508, i32 noundef 0)
  store i32 %509, ptr @parsing_result, align 4
  %510 = load i32, ptr @parsing_result, align 4
  %511 = icmp ne i32 %510, 0
  br i1 %511, label %512, label %514

512:                                              ; preds = %494
  %513 = load i32, ptr @parsing_result, align 4
  store i32 %513, ptr %2, align 4
  br label %757

514:                                              ; preds = %494
  %515 = load ptr, ptr @curr_token, align 8
  %516 = getelementptr inbounds nuw %struct.Token, ptr %515, i32 0, i32 0
  %517 = load i32, ptr %516, align 8
  %518 = icmp ne i32 %517, 22
  br i1 %518, label %519, label %520

519:                                              ; preds = %514
  store i32 2, ptr %2, align 4
  br label %757

520:                                              ; preds = %514
  %521 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %521)
  %522 = load ptr, ptr @__stdinp, align 8
  %523 = call ptr @read_token(ptr noundef %522)
  store ptr %523, ptr @curr_token, align 8
  %524 = load ptr, ptr %3, align 8
  %525 = getelementptr inbounds nuw %struct.Function, ptr %524, i32 0, i32 5
  %526 = load ptr, ptr %525, align 8
  %527 = call zeroext i1 @create_local_table(ptr noundef %526)
  br i1 %527, label %529, label %528

528:                                              ; preds = %520
  store i32 99, ptr %2, align 4
  br label %757

529:                                              ; preds = %520
  %530 = load ptr, ptr %3, align 8
  %531 = call i32 @statement_list(ptr noundef %530)
  store i32 %531, ptr @parsing_result, align 4
  %532 = load i32, ptr @parsing_result, align 4
  %533 = icmp ne i32 %532, 0
  br i1 %533, label %534, label %536

534:                                              ; preds = %529
  %535 = load i32, ptr @parsing_result, align 4
  store i32 %535, ptr %2, align 4
  br label %757

536:                                              ; preds = %529
  %537 = load ptr, ptr %3, align 8
  %538 = getelementptr inbounds nuw %struct.Function, ptr %537, i32 0, i32 5
  %539 = load ptr, ptr %538, align 8
  %540 = getelementptr inbounds nuw %struct.SymtStack, ptr %539, i32 0, i32 0
  %541 = load ptr, ptr %3, align 8
  %542 = getelementptr inbounds nuw %struct.Function, ptr %541, i32 0, i32 5
  %543 = load ptr, ptr %542, align 8
  %544 = getelementptr inbounds nuw %struct.SymtStack, ptr %543, i32 0, i32 1
  %545 = load i32, ptr %544, align 8
  %546 = sext i32 %545 to i64
  %547 = getelementptr inbounds [127 x ptr], ptr %540, i64 0, i64 %546
  %548 = load ptr, ptr %547, align 8
  %549 = call zeroext i1 @all_vars_used(ptr noundef %548)
  br i1 %549, label %551, label %550

550:                                              ; preds = %536
  store i32 9, ptr %2, align 4
  br label %757

551:                                              ; preds = %536
  %552 = load ptr, ptr %3, align 8
  %553 = getelementptr inbounds nuw %struct.Function, ptr %552, i32 0, i32 5
  %554 = load ptr, ptr %553, align 8
  %555 = call zeroext i1 @dispose_local_table(ptr noundef %554)
  br i1 %555, label %557, label %556

556:                                              ; preds = %551
  store i32 99, ptr %2, align 4
  br label %757

557:                                              ; preds = %551
  %558 = load i32, ptr @parsing_result, align 4
  %559 = icmp ne i32 %558, 0
  br i1 %559, label %560, label %562

560:                                              ; preds = %557
  %561 = load i32, ptr @parsing_result, align 4
  store i32 %561, ptr %2, align 4
  br label %757

562:                                              ; preds = %557
  store i32 0, ptr %2, align 4
  br label %757

563:                                              ; preds = %1
  %564 = load ptr, ptr @__stdinp, align 8
  %565 = call ptr @parse_expression(ptr noundef %564)
  store ptr %565, ptr %5, align 8
  %566 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %566)
  %567 = load ptr, ptr @__stdinp, align 8
  %568 = call ptr @read_token(ptr noundef %567)
  store ptr %568, ptr @curr_token, align 8
  %569 = load ptr, ptr %3, align 8
  %570 = getelementptr inbounds nuw %struct.Function, ptr %569, i32 0, i32 2
  %571 = load i32, ptr %570, align 4
  store i32 %571, ptr %9, align 4
  %572 = load ptr, ptr %5, align 8
  %573 = load ptr, ptr @instructions, align 8
  %574 = load ptr, ptr %3, align 8
  %575 = getelementptr inbounds nuw %struct.Function, ptr %574, i32 0, i32 2
  %576 = load ptr, ptr %3, align 8
  %577 = getelementptr inbounds nuw %struct.Function, ptr %576, i32 0, i32 5
  %578 = load ptr, ptr %577, align 8
  %579 = load ptr, ptr @gb_table, align 8
  call void @eval_wrapper(ptr noundef %572, ptr noundef %573, ptr noundef %575, ptr noundef @.str.3.216, ptr noundef @.str.5.218, ptr noundef %578, ptr noundef %579)
  %580 = load ptr, ptr %3, align 8
  %581 = getelementptr inbounds nuw %struct.Function, ptr %580, i32 0, i32 2
  %582 = load i32, ptr %581, align 4
  %583 = icmp eq i32 %582, 3
  br i1 %583, label %584, label %588

584:                                              ; preds = %563
  %585 = load ptr, ptr %5, align 8
  %586 = icmp ne ptr %585, null
  br i1 %586, label %587, label %588

587:                                              ; preds = %584
  store i32 6, ptr %2, align 4
  br label %757

588:                                              ; preds = %584, %563
  %589 = load ptr, ptr %3, align 8
  %590 = getelementptr inbounds nuw %struct.Function, ptr %589, i32 0, i32 2
  %591 = load i32, ptr %590, align 4
  %592 = icmp ne i32 %591, 3
  br i1 %592, label %593, label %597

593:                                              ; preds = %588
  %594 = load ptr, ptr %5, align 8
  %595 = icmp eq ptr %594, null
  br i1 %595, label %596, label %597

596:                                              ; preds = %593
  store i32 6, ptr %2, align 4
  br label %757

597:                                              ; preds = %593, %588
  %598 = load i32, ptr %9, align 4
  %599 = load ptr, ptr %3, align 8
  %600 = getelementptr inbounds nuw %struct.Function, ptr %599, i32 0, i32 2
  %601 = load i32, ptr %600, align 4
  %602 = call zeroext i1 @TypeMatchError(i32 noundef %598, i32 noundef %601, i1 noundef zeroext false)
  br i1 %602, label %603, label %604

603:                                              ; preds = %597
  store i32 4, ptr %2, align 4
  br label %757

604:                                              ; preds = %597
  %605 = load ptr, ptr %3, align 8
  %606 = getelementptr inbounds nuw %struct.Function, ptr %605, i32 0, i32 7
  store i8 1, ptr %606, align 4
  store i32 0, ptr %2, align 4
  br label %757

607:                                              ; preds = %1
  %608 = load ptr, ptr @curr_token, align 8
  %609 = getelementptr inbounds nuw %struct.Token, ptr %608, i32 0, i32 0
  %610 = load i32, ptr %609, align 8
  %611 = icmp ne i32 %610, 50
  br i1 %611, label %612, label %613

612:                                              ; preds = %607
  store i32 2, ptr %2, align 4
  br label %757

613:                                              ; preds = %607
  %614 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %614)
  %615 = load ptr, ptr @__stdinp, align 8
  %616 = call ptr @read_token(ptr noundef %615)
  store ptr %616, ptr @curr_token, align 8
  %617 = load ptr, ptr @curr_token, align 8
  %618 = getelementptr inbounds nuw %struct.Token, ptr %617, i32 0, i32 0
  %619 = load i32, ptr %618, align 8
  %620 = icmp ne i32 %619, 18
  br i1 %620, label %621, label %622

621:                                              ; preds = %613
  store i32 2, ptr %2, align 4
  br label %757

622:                                              ; preds = %613
  %623 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %623)
  %624 = load ptr, ptr @__stdinp, align 8
  %625 = call ptr @read_token(ptr noundef %624)
  store ptr %625, ptr @curr_token, align 8
  %626 = load ptr, ptr @curr_token, align 8
  %627 = getelementptr inbounds nuw %struct.Token, ptr %626, i32 0, i32 0
  %628 = load i32, ptr %627, align 8
  %629 = icmp eq i32 %628, 1
  br i1 %629, label %630, label %685

630:                                              ; preds = %622
  %631 = load ptr, ptr %3, align 8
  %632 = getelementptr inbounds nuw %struct.Function, ptr %631, i32 0, i32 5
  %633 = load ptr, ptr %632, align 8
  %634 = load ptr, ptr @curr_token, align 8
  %635 = getelementptr inbounds nuw %struct.Token, ptr %634, i32 0, i32 1
  %636 = load ptr, ptr %635, align 8
  %637 = call ptr @search_scope(ptr noundef %633, ptr noundef %636)
  store ptr %637, ptr %13, align 8
  %638 = load ptr, ptr %13, align 8
  %639 = icmp eq ptr %638, null
  br i1 %639, label %640, label %641

640:                                              ; preds = %630
  store i32 3, ptr %2, align 4
  br label %757

641:                                              ; preds = %630
  %642 = load ptr, ptr %13, align 8
  %643 = getelementptr inbounds nuw %struct.item_var, ptr %642, i32 0, i32 1
  %644 = load ptr, ptr %643, align 8
  %645 = getelementptr inbounds nuw %struct.Variable, ptr %644, i32 0, i32 5
  store i8 1, ptr %645, align 2
  %646 = load ptr, ptr %13, align 8
  %647 = getelementptr inbounds nuw %struct.item_var, ptr %646, i32 0, i32 1
  %648 = load ptr, ptr %647, align 8
  %649 = getelementptr inbounds nuw %struct.Variable, ptr %648, i32 0, i32 1
  %650 = load i32, ptr %649, align 8
  switch i32 %650, label %683 [
    i32 0, label %651
    i32 1, label %651
    i32 2, label %667
  ]

651:                                              ; preds = %641, %641
  %652 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 48, i1 false)
  %653 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 0
  store i32 41, ptr %653, align 8
  %654 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 1
  %655 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 2
  %656 = load ptr, ptr %13, align 8
  %657 = getelementptr inbounds nuw %struct.item_var, ptr %656, i32 0, i32 1
  %658 = load ptr, ptr %657, align 8
  %659 = getelementptr inbounds nuw %struct.Variable, ptr %658, i32 0, i32 0
  %660 = load ptr, ptr %659, align 8
  %661 = getelementptr inbounds nuw %struct.String, ptr %660, i32 0, i32 0
  %662 = load ptr, ptr %661, align 8
  %663 = call ptr @addFramePrefix(ptr noundef @.str.3.216, ptr noundef %662)
  store ptr %663, ptr %655, align 8
  %664 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 3
  %665 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 4
  %666 = getelementptr inbounds nuw %struct.args, ptr %14, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %14, i64 48, i1 false)
  call void @generate_code(ptr noundef %652, ptr dead_on_return noundef %15)
  br label %684

667:                                              ; preds = %641
  %668 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 48, i1 false)
  %669 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 0
  store i32 41, ptr %669, align 8
  %670 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 1
  %671 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 2
  %672 = load ptr, ptr %13, align 8
  %673 = getelementptr inbounds nuw %struct.item_var, ptr %672, i32 0, i32 1
  %674 = load ptr, ptr %673, align 8
  %675 = getelementptr inbounds nuw %struct.Variable, ptr %674, i32 0, i32 0
  %676 = load ptr, ptr %675, align 8
  %677 = getelementptr inbounds nuw %struct.String, ptr %676, i32 0, i32 0
  %678 = load ptr, ptr %677, align 8
  %679 = call ptr @addFramePrefix(ptr noundef @.str.3.216, ptr noundef %678)
  store ptr %679, ptr %671, align 8
  %680 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 3
  %681 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 4
  %682 = getelementptr inbounds nuw %struct.args, ptr %16, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %17, ptr align 8 %16, i64 48, i1 false)
  call void @generate_code(ptr noundef %668, ptr dead_on_return noundef %17)
  br label %684

683:                                              ; preds = %641
  br label %684

684:                                              ; preds = %683, %667, %651
  br label %733

685:                                              ; preds = %622
  %686 = load ptr, ptr @curr_token, align 8
  %687 = getelementptr inbounds nuw %struct.Token, ptr %686, i32 0, i32 0
  %688 = load i32, ptr %687, align 8
  %689 = icmp eq i32 %688, 7
  br i1 %689, label %690, label %702

690:                                              ; preds = %685
  %691 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %18, i8 0, i64 48, i1 false)
  %692 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 0
  store i32 41, ptr %692, align 8
  %693 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 1
  %694 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 2
  %695 = load ptr, ptr @curr_token, align 8
  %696 = getelementptr inbounds nuw %struct.Token, ptr %695, i32 0, i32 1
  %697 = load ptr, ptr %696, align 8
  %698 = call ptr @stringToIFJstring(ptr noundef %697)
  store ptr %698, ptr %694, align 8
  %699 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 3
  %700 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 4
  %701 = getelementptr inbounds nuw %struct.args, ptr %18, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %19, ptr align 8 %18, i64 48, i1 false)
  call void @generate_code(ptr noundef %691, ptr dead_on_return noundef %19)
  br label %732

702:                                              ; preds = %685
  %703 = load ptr, ptr @curr_token, align 8
  %704 = getelementptr inbounds nuw %struct.Token, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = icmp eq i32 %705, 3
  br i1 %706, label %712, label %707

707:                                              ; preds = %702
  %708 = load ptr, ptr @curr_token, align 8
  %709 = getelementptr inbounds nuw %struct.Token, ptr %708, i32 0, i32 0
  %710 = load i32, ptr %709, align 8
  %711 = icmp eq i32 %710, 4
  br i1 %711, label %712, label %730

712:                                              ; preds = %707, %702
  %713 = load ptr, ptr @instructions, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %20, i8 0, i64 48, i1 false)
  %714 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 0
  store i32 41, ptr %714, align 8
  %715 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 1
  %716 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 2
  %717 = load ptr, ptr @curr_token, align 8
  %718 = getelementptr inbounds nuw %struct.Token, ptr %717, i32 0, i32 1
  %719 = load ptr, ptr %718, align 8
  %720 = load ptr, ptr @curr_token, align 8
  %721 = getelementptr inbounds nuw %struct.Token, ptr %720, i32 0, i32 0
  %722 = load i32, ptr %721, align 8
  %723 = icmp eq i32 %722, 3
  %724 = zext i1 %723 to i64
  %725 = select i1 %723, i32 0, i32 1
  %726 = call ptr @numberToIFJstring(ptr noundef %719, i32 noundef %725)
  store ptr %726, ptr %716, align 8
  %727 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 3
  %728 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 4
  %729 = getelementptr inbounds nuw %struct.args, ptr %20, i32 0, i32 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %21, ptr align 8 %20, i64 48, i1 false)
  call void @generate_code(ptr noundef %713, ptr dead_on_return noundef %21)
  br label %731

730:                                              ; preds = %707
  store i32 4, ptr %2, align 4
  br label %757

731:                                              ; preds = %712
  br label %732

732:                                              ; preds = %731, %690
  br label %733

733:                                              ; preds = %732, %684
  %734 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %734)
  %735 = load ptr, ptr @__stdinp, align 8
  %736 = call ptr @read_token(ptr noundef %735)
  store ptr %736, ptr @curr_token, align 8
  %737 = load ptr, ptr @curr_token, align 8
  %738 = getelementptr inbounds nuw %struct.Token, ptr %737, i32 0, i32 0
  %739 = load i32, ptr %738, align 8
  %740 = icmp ne i32 %739, 19
  br i1 %740, label %741, label %742

741:                                              ; preds = %733
  store i32 2, ptr %2, align 4
  br label %757

742:                                              ; preds = %733
  %743 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %743)
  %744 = load ptr, ptr @__stdinp, align 8
  %745 = call ptr @read_token(ptr noundef %744)
  store ptr %745, ptr @curr_token, align 8
  %746 = load ptr, ptr @curr_token, align 8
  %747 = getelementptr inbounds nuw %struct.Token, ptr %746, i32 0, i32 0
  %748 = load i32, ptr %747, align 8
  %749 = icmp ne i32 %748, 28
  br i1 %749, label %750, label %751

750:                                              ; preds = %742
  store i32 2, ptr %2, align 4
  br label %757

751:                                              ; preds = %742
  %752 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %752)
  %753 = load ptr, ptr @__stdinp, align 8
  %754 = call ptr @read_token(ptr noundef %753)
  store ptr %754, ptr @curr_token, align 8
  store i32 0, ptr %2, align 4
  br label %757

755:                                              ; preds = %1
  br label %756

756:                                              ; preds = %755
  store i32 2, ptr %2, align 4
  br label %757

757:                                              ; preds = %756, %751, %750, %741, %730, %640, %621, %612, %604, %603, %596, %587, %562, %560, %556, %550, %534, %528, %519, %512, %493, %484, %483, %477, %461, %452, %446, %437, %431, %425, %409, %403, %394, %387, %359, %347, %338, %301, %281, %273, %253, %252, %223, %216, %207, %183, %158, %149, %140, %139, %107, %100, %91, %67, %42, %33
  %758 = load i32, ptr %2, align 4
  ret i32 %758
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @type(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr @curr_token, align 8
  %5 = getelementptr inbounds nuw %struct.Token, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 29
  br i1 %7, label %8, label %26

8:                                                ; preds = %1
  %9 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %9)
  %10 = load ptr, ptr @__stdinp, align 8
  %11 = call ptr @read_token(ptr noundef %10)
  store ptr %11, ptr @curr_token, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @opt_nul(ptr noundef %12, ptr noundef null)
  store i32 %13, ptr @parsing_result, align 4
  %14 = load i32, ptr @parsing_result, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %8
  %17 = load i32, ptr @parsing_result, align 4
  store i32 %17, ptr %2, align 4
  br label %27

18:                                               ; preds = %8
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @data_type(ptr noundef %19, ptr noundef null)
  store i32 %20, ptr @parsing_result, align 4
  %21 = load i32, ptr @parsing_result, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %18
  %24 = load i32, ptr @parsing_result, align 4
  store i32 %24, ptr %2, align 4
  br label %27

25:                                               ; preds = %18
  store i32 0, ptr %2, align 4
  br label %27

26:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %27

27:                                               ; preds = %26, %25, %23, %16
  %28 = load i32, ptr %2, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @statement_null(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr @curr_token, align 8
  %8 = getelementptr inbounds nuw %struct.Token, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp eq i32 %9, 17
  br i1 %10, label %11, label %41

11:                                               ; preds = %2
  %12 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %12)
  %13 = load ptr, ptr @__stdinp, align 8
  %14 = call ptr @read_token(ptr noundef %13)
  store ptr %14, ptr @curr_token, align 8
  %15 = load ptr, ptr @curr_token, align 8
  %16 = getelementptr inbounds nuw %struct.Token, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %19, label %20

19:                                               ; preds = %11
  store i32 2, ptr %3, align 4
  br label %42

20:                                               ; preds = %11
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr @curr_token, align 8
  %23 = getelementptr inbounds nuw %struct.Token, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = call ptr @create_var(ptr noundef %21, ptr noundef %24, i1 noundef zeroext false)
  store ptr %25, ptr %6, align 8
  %26 = load i32, ptr %5, align 4
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds nuw %struct.Variable, ptr %27, i32 0, i32 1
  store i32 %26, ptr %28, align 8
  %29 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %29)
  %30 = load ptr, ptr @__stdinp, align 8
  %31 = call ptr @read_token(ptr noundef %30)
  store ptr %31, ptr @curr_token, align 8
  %32 = load ptr, ptr @curr_token, align 8
  %33 = getelementptr inbounds nuw %struct.Token, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = icmp ne i32 %34, 17
  br i1 %35, label %36, label %37

36:                                               ; preds = %20
  store i32 2, ptr %3, align 4
  br label %42

37:                                               ; preds = %20
  %38 = load ptr, ptr @curr_token, align 8
  call void @free(ptr noundef %38)
  %39 = load ptr, ptr @__stdinp, align 8
  %40 = call ptr @read_token(ptr noundef %39)
  store ptr %40, ptr @curr_token, align 8
  br label %41

41:                                               ; preds = %37, %2
  store i32 0, ptr %3, align 4
  br label %42

42:                                               ; preds = %41, %36, %19
  %43 = load i32, ptr %3, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isAlpha(i8 noundef signext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp sge i32 %4, 97
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load i8, ptr %2, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp sle i32 %8, 122
  br i1 %9, label %20, label %10

10:                                               ; preds = %6, %1
  %11 = load i8, ptr %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp sge i32 %12, 65
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = load i8, ptr %2, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp sle i32 %16, 90
  br label %18

18:                                               ; preds = %14, %10
  %19 = phi i1 [ false, %10 ], [ %17, %14 ]
  br label %20

20:                                               ; preds = %18, %6
  %21 = phi i1 [ true, %6 ], [ %19, %18 ]
  ret i1 %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isDigit(i8 noundef signext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp sge i32 %4, 48
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load i8, ptr %2, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp sle i32 %8, 57
  br label %10

10:                                               ; preds = %6, %1
  %11 = phi i1 [ false, %1 ], [ %9, %6 ]
  ret i1 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @create_token(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = call ptr @malloc(i64 noundef 16) #10
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @print_error(i32 noundef 99)
  br label %10

10:                                               ; preds = %9, %2
  %11 = load i32, ptr %3, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.Token, ptr %12, i32 0, i32 0
  store i32 %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.Token, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %42

18:                                               ; preds = %10
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.Token, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp ne i32 %21, 3
  br i1 %22, label %23, label %42

23:                                               ; preds = %18
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.Token, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp ne i32 %26, 4
  br i1 %27, label %28, label %42

28:                                               ; preds = %23
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.Token, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 5
  br i1 %32, label %33, label %42

33:                                               ; preds = %28
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.Token, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = icmp ne i32 %36, 6
  br i1 %37, label %38, label %42

38:                                               ; preds = %33
  %39 = load ptr, ptr %4, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds nuw %struct.Token, ptr %40, i32 0, i32 1
  store ptr %39, ptr %41, align 8
  br label %64

42:                                               ; preds = %33, %28, %23, %18, %10
  %43 = load ptr, ptr %4, align 8
  %44 = call i64 @strlen(ptr noundef %43) #11
  %45 = add i64 %44, 1
  %46 = call ptr @malloc(i64 noundef %45) #10
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds nuw %struct.Token, ptr %47, i32 0, i32 1
  store ptr %46, ptr %48, align 8
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds nuw %struct.Token, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = icmp eq ptr %51, null
  br i1 %52, label %53, label %54

53:                                               ; preds = %42
  call void @print_error(i32 noundef 99)
  br label %54

54:                                               ; preds = %53, %42
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds nuw %struct.Token, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = load ptr, ptr %4, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds nuw %struct.Token, ptr %59, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = call i64 @llvm.objectsize.i64.p0(ptr %61, i1 false, i1 true, i1 false)
  %63 = call ptr @__strcpy_chk(ptr noundef %57, ptr noundef %58, i64 noundef %62) #11
  br label %64

64:                                               ; preds = %54, %38
  %65 = load ptr, ptr %5, align 8
  ret ptr %65
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #8

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @read_token(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.String, align 8
  %6 = alloca [3 x i8], align 1
  %7 = alloca i8, align 1
  %8 = alloca [3 x i8], align 1
  %9 = alloca i8, align 1
  %10 = alloca %struct.String, align 8
  store ptr %0, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 @fgetc(ptr noundef %11)
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %17

15:                                               ; preds = %1
  %16 = call ptr @create_token(i32 noundef 0, ptr noundef null)
  store ptr %16, ptr %2, align 8
  br label %948

17:                                               ; preds = %1
  br label %18

18:                                               ; preds = %29, %17
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 32
  br i1 %20, label %27, label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %4, align 4
  %23 = icmp eq i32 %22, 10
  br i1 %23, label %27, label %24

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = icmp eq i32 %25, 9
  br label %27

27:                                               ; preds = %24, %21, %18
  %28 = phi i1 [ true, %21 ], [ true, %18 ], [ %26, %24 ]
  br i1 %28, label %29, label %32

29:                                               ; preds = %27
  %30 = load ptr, ptr %3, align 8
  %31 = call i32 @fgetc(ptr noundef %30)
  store i32 %31, ptr %4, align 4
  br label %18, !llvm.loop !26

32:                                               ; preds = %27
  call void @string_init(ptr noundef %5)
  %33 = load i32, ptr %4, align 4
  switch i32 %33, label %409 [
    i32 33, label %34
    i32 61, label %46
    i32 62, label %57
    i32 60, label %69
    i32 43, label %81
    i32 45, label %83
    i32 42, label %85
    i32 59, label %87
    i32 58, label %89
    i32 46, label %91
    i32 44, label %105
    i32 40, label %107
    i32 41, label %109
    i32 91, label %111
    i32 123, label %169
    i32 125, label %171
    i32 63, label %173
    i32 124, label %175
    i32 64, label %177
    i32 34, label %179
    i32 92, label %269
    i32 47, label %375
    i32 -1, label %407
  ]

34:                                               ; preds = %32
  %35 = load ptr, ptr %3, align 8
  %36 = call i32 @fgetc(ptr noundef %35)
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  %38 = icmp eq i32 %37, 61
  br i1 %38, label %39, label %41

39:                                               ; preds = %34
  %40 = call ptr @create_token(i32 noundef 15, ptr noundef null)
  store ptr %40, ptr %2, align 8
  br label %948

41:                                               ; preds = %34
  %42 = load i32, ptr %4, align 4
  %43 = load ptr, ptr %3, align 8
  %44 = call i32 @ungetc(i32 noundef %42, ptr noundef %43)
  %45 = call ptr @create_token(i32 noundef 13, ptr noundef null)
  store ptr %45, ptr %2, align 8
  br label %948

46:                                               ; preds = %32
  %47 = load ptr, ptr %3, align 8
  %48 = call i32 @fgetc(ptr noundef %47)
  store i32 %48, ptr %4, align 4
  %49 = icmp eq i32 %48, 61
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = call ptr @create_token(i32 noundef 14, ptr noundef null)
  store ptr %51, ptr %2, align 8
  br label %948

52:                                               ; preds = %46
  %53 = load i32, ptr %4, align 4
  %54 = load ptr, ptr %3, align 8
  %55 = call i32 @ungetc(i32 noundef %53, ptr noundef %54)
  %56 = call ptr @create_token(i32 noundef 12, ptr noundef null)
  store ptr %56, ptr %2, align 8
  br label %948

57:                                               ; preds = %32
  %58 = load ptr, ptr %3, align 8
  %59 = call i32 @fgetc(ptr noundef %58)
  store i32 %59, ptr %4, align 4
  %60 = load i32, ptr %4, align 4
  %61 = icmp eq i32 %60, 61
  br i1 %61, label %62, label %64

62:                                               ; preds = %57
  %63 = call ptr @create_token(i32 noundef 27, ptr noundef null)
  store ptr %63, ptr %2, align 8
  br label %948

64:                                               ; preds = %57
  %65 = load i32, ptr %4, align 4
  %66 = load ptr, ptr %3, align 8
  %67 = call i32 @ungetc(i32 noundef %65, ptr noundef %66)
  %68 = call ptr @create_token(i32 noundef 25, ptr noundef null)
  store ptr %68, ptr %2, align 8
  br label %948

69:                                               ; preds = %32
  %70 = load ptr, ptr %3, align 8
  %71 = call i32 @fgetc(ptr noundef %70)
  store i32 %71, ptr %4, align 4
  %72 = load i32, ptr %4, align 4
  %73 = icmp eq i32 %72, 61
  br i1 %73, label %74, label %76

74:                                               ; preds = %69
  %75 = call ptr @create_token(i32 noundef 26, ptr noundef null)
  store ptr %75, ptr %2, align 8
  br label %948

76:                                               ; preds = %69
  %77 = load i32, ptr %4, align 4
  %78 = load ptr, ptr %3, align 8
  %79 = call i32 @ungetc(i32 noundef %77, ptr noundef %78)
  %80 = call ptr @create_token(i32 noundef 24, ptr noundef null)
  store ptr %80, ptr %2, align 8
  br label %948

81:                                               ; preds = %32
  %82 = call ptr @create_token(i32 noundef 8, ptr noundef null)
  store ptr %82, ptr %2, align 8
  br label %948

83:                                               ; preds = %32
  %84 = call ptr @create_token(i32 noundef 9, ptr noundef null)
  store ptr %84, ptr %2, align 8
  br label %948

85:                                               ; preds = %32
  %86 = call ptr @create_token(i32 noundef 10, ptr noundef null)
  store ptr %86, ptr %2, align 8
  br label %948

87:                                               ; preds = %32
  %88 = call ptr @create_token(i32 noundef 28, ptr noundef null)
  store ptr %88, ptr %2, align 8
  br label %948

89:                                               ; preds = %32
  %90 = call ptr @create_token(i32 noundef 29, ptr noundef null)
  store ptr %90, ptr %2, align 8
  br label %948

91:                                               ; preds = %32
  br label %92

92:                                               ; preds = %97, %91
  %93 = load ptr, ptr %3, align 8
  %94 = call i32 @fgetc(ptr noundef %93)
  store i32 %94, ptr %4, align 4
  %95 = call i32 @isspace(i32 noundef %94) #14
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %98

97:                                               ; preds = %92
  br label %92, !llvm.loop !27

98:                                               ; preds = %92
  %99 = load i32, ptr %4, align 4
  %100 = call i32 @isdigit(i32 noundef %99) #14
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %103

102:                                              ; preds = %98
  call void @print_error(i32 noundef 1)
  br label %103

103:                                              ; preds = %102, %98
  %104 = call ptr @create_token(i32 noundef 30, ptr noundef null)
  store ptr %104, ptr %2, align 8
  br label %948

105:                                              ; preds = %32
  %106 = call ptr @create_token(i32 noundef 31, ptr noundef null)
  store ptr %106, ptr %2, align 8
  br label %948

107:                                              ; preds = %32
  %108 = call ptr @create_token(i32 noundef 18, ptr noundef null)
  store ptr %108, ptr %2, align 8
  br label %948

109:                                              ; preds = %32
  %110 = call ptr @create_token(i32 noundef 19, ptr noundef null)
  store ptr %110, ptr %2, align 8
  br label %948

111:                                              ; preds = %32
  br label %112

112:                                              ; preds = %117, %111
  %113 = load ptr, ptr %3, align 8
  %114 = call i32 @fgetc(ptr noundef %113)
  store i32 %114, ptr %4, align 4
  %115 = call i32 @isspace(i32 noundef %114) #14
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %118

117:                                              ; preds = %112
  br label %112, !llvm.loop !28

118:                                              ; preds = %112
  %119 = load i32, ptr %4, align 4
  %120 = icmp eq i32 %119, 93
  br i1 %120, label %121, label %167

121:                                              ; preds = %118
  br label %122

122:                                              ; preds = %127, %121
  %123 = load ptr, ptr %3, align 8
  %124 = call i32 @fgetc(ptr noundef %123)
  store i32 %124, ptr %4, align 4
  %125 = call i32 @isspace(i32 noundef %124) #14
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %128

127:                                              ; preds = %122
  br label %122, !llvm.loop !29

128:                                              ; preds = %122
  br label %129

129:                                              ; preds = %150, %128
  %130 = load i32, ptr %4, align 4
  %131 = trunc i32 %130 to i8
  %132 = call zeroext i1 @isAlpha(i8 noundef signext %131)
  br i1 %132, label %140, label %133

133:                                              ; preds = %129
  %134 = load i32, ptr %4, align 4
  %135 = icmp eq i32 %134, 95
  br i1 %135, label %140, label %136

136:                                              ; preds = %133
  %137 = load i32, ptr %4, align 4
  %138 = trunc i32 %137 to i8
  %139 = call zeroext i1 @isDigit(i8 noundef signext %138)
  br i1 %139, label %140, label %148

140:                                              ; preds = %136, %133, %129
  %141 = load i32, ptr %4, align 4
  %142 = icmp ne i32 %141, -1
  br i1 %142, label %146, label %143

143:                                              ; preds = %140
  %144 = load i32, ptr %4, align 4
  %145 = icmp eq i32 %144, 32
  br label %146

146:                                              ; preds = %143, %140
  %147 = phi i1 [ true, %140 ], [ %145, %143 ]
  br label %148

148:                                              ; preds = %146, %136
  %149 = phi i1 [ false, %136 ], [ %147, %146 ]
  br i1 %149, label %150, label %155

150:                                              ; preds = %148
  %151 = load i32, ptr %4, align 4
  %152 = trunc i32 %151 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %152)
  %153 = load ptr, ptr %3, align 8
  %154 = call i32 @fgetc(ptr noundef %153)
  store i32 %154, ptr %4, align 4
  br label %129, !llvm.loop !30

155:                                              ; preds = %148
  %156 = load i32, ptr %4, align 4
  %157 = load ptr, ptr %3, align 8
  %158 = call i32 @ungetc(i32 noundef %156, ptr noundef %157)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %159 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %160 = load ptr, ptr %159, align 8
  %161 = call i32 @strcmp(ptr noundef %160, ptr noundef @.str.103.323) #11
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %163, label %165

163:                                              ; preds = %155
  %164 = call ptr @create_token(i32 noundef 42, ptr noundef null)
  store ptr %164, ptr %2, align 8
  br label %948

165:                                              ; preds = %155
  call void @print_error(i32 noundef 1)
  br label %166

166:                                              ; preds = %165
  br label %168

167:                                              ; preds = %118
  call void @print_error(i32 noundef 1)
  br label %168

168:                                              ; preds = %167, %166
  br label %169

169:                                              ; preds = %168, %32
  %170 = call ptr @create_token(i32 noundef 22, ptr noundef null)
  store ptr %170, ptr %2, align 8
  br label %948

171:                                              ; preds = %32
  %172 = call ptr @create_token(i32 noundef 23, ptr noundef null)
  store ptr %172, ptr %2, align 8
  br label %948

173:                                              ; preds = %32
  %174 = call ptr @create_token(i32 noundef 16, ptr noundef null)
  store ptr %174, ptr %2, align 8
  br label %948

175:                                              ; preds = %32
  %176 = call ptr @create_token(i32 noundef 17, ptr noundef null)
  store ptr %176, ptr %2, align 8
  br label %948

177:                                              ; preds = %32
  %178 = call ptr @create_token(i32 noundef 32, ptr noundef null)
  store ptr %178, ptr %2, align 8
  br label %948

179:                                              ; preds = %32
  br label %180

180:                                              ; preds = %264, %179
  %181 = load ptr, ptr %3, align 8
  %182 = call i32 @fgetc(ptr noundef %181)
  store i32 %182, ptr %4, align 4
  %183 = icmp ne i32 %182, 34
  br i1 %183, label %184, label %265

184:                                              ; preds = %180
  %185 = load i32, ptr %4, align 4
  %186 = icmp eq i32 %185, -1
  br i1 %186, label %187, label %188

187:                                              ; preds = %184
  call void @print_error(i32 noundef 1)
  br label %264

188:                                              ; preds = %184
  %189 = load i32, ptr %4, align 4
  %190 = icmp eq i32 %189, 10
  br i1 %190, label %191, label %192

191:                                              ; preds = %188
  call void @print_error(i32 noundef 1)
  br label %263

192:                                              ; preds = %188
  %193 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 1
  %194 = load i64, ptr %193, align 8
  %195 = icmp uge i64 %194, 256
  br i1 %195, label %196, label %197

196:                                              ; preds = %192
  call void @print_error(i32 noundef 99)
  br label %262

197:                                              ; preds = %192
  %198 = load i32, ptr %4, align 4
  %199 = icmp eq i32 %198, 92
  br i1 %199, label %200, label %258

200:                                              ; preds = %197
  %201 = load ptr, ptr %3, align 8
  %202 = call i32 @fgetc(ptr noundef %201)
  store i32 %202, ptr %4, align 4
  %203 = load i32, ptr %4, align 4
  %204 = icmp eq i32 %203, 34
  br i1 %204, label %205, label %206

205:                                              ; preds = %200
  call void @string_concat(ptr noundef %5, ptr noundef @.str.122)
  br label %257

206:                                              ; preds = %200
  %207 = load i32, ptr %4, align 4
  %208 = icmp eq i32 %207, 110
  br i1 %208, label %209, label %210

209:                                              ; preds = %206
  call void @string_concat(ptr noundef %5, ptr noundef @.str.123)
  br label %256

210:                                              ; preds = %206
  %211 = load i32, ptr %4, align 4
  %212 = icmp eq i32 %211, 114
  br i1 %212, label %213, label %214

213:                                              ; preds = %210
  call void @string_concat(ptr noundef %5, ptr noundef @.str.124)
  br label %255

214:                                              ; preds = %210
  %215 = load i32, ptr %4, align 4
  %216 = icmp eq i32 %215, 116
  br i1 %216, label %217, label %218

217:                                              ; preds = %214
  call void @string_concat(ptr noundef %5, ptr noundef @.str.125)
  br label %254

218:                                              ; preds = %214
  %219 = load i32, ptr %4, align 4
  %220 = icmp eq i32 %219, 120
  br i1 %220, label %221, label %247

221:                                              ; preds = %218
  call void @llvm.memset.p0.i64(ptr align 1 %6, i8 0, i64 3, i1 false)
  %222 = load ptr, ptr %3, align 8
  %223 = call i32 @fgetc(ptr noundef %222)
  %224 = trunc i32 %223 to i8
  %225 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 0
  store i8 %224, ptr %225, align 1
  %226 = load ptr, ptr %3, align 8
  %227 = call i32 @fgetc(ptr noundef %226)
  %228 = trunc i32 %227 to i8
  %229 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 1
  store i8 %228, ptr %229, align 1
  %230 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 0
  %231 = load i8, ptr %230, align 1
  %232 = sext i8 %231 to i32
  %233 = call i32 @isxdigit(i32 noundef %232) #14
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %235, label %241

235:                                              ; preds = %221
  %236 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 1
  %237 = load i8, ptr %236, align 1
  %238 = sext i8 %237 to i32
  %239 = call i32 @isxdigit(i32 noundef %238) #14
  %240 = icmp ne i32 %239, 0
  br i1 %240, label %242, label %241

241:                                              ; preds = %235, %221
  call void @print_error(i32 noundef 1)
  br label %242

242:                                              ; preds = %241, %235
  %243 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 0
  %244 = call i64 @strtol(ptr noundef %243, ptr noundef null, i32 noundef 16)
  %245 = trunc i64 %244 to i8
  store i8 %245, ptr %7, align 1
  %246 = load i8, ptr %7, align 1
  call void @string_append(ptr noundef %5, i8 noundef signext %246)
  br label %253

247:                                              ; preds = %218
  %248 = load i32, ptr %4, align 4
  %249 = icmp eq i32 %248, 92
  br i1 %249, label %250, label %251

250:                                              ; preds = %247
  call void @string_concat(ptr noundef %5, ptr noundef @.str.126)
  br label %252

251:                                              ; preds = %247
  call void @print_error(i32 noundef 1)
  br label %252

252:                                              ; preds = %251, %250
  br label %253

253:                                              ; preds = %252, %242
  br label %254

254:                                              ; preds = %253, %217
  br label %255

255:                                              ; preds = %254, %213
  br label %256

256:                                              ; preds = %255, %209
  br label %257

257:                                              ; preds = %256, %205
  br label %261

258:                                              ; preds = %197
  %259 = load i32, ptr %4, align 4
  %260 = trunc i32 %259 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %260)
  br label %261

261:                                              ; preds = %258, %257
  br label %262

262:                                              ; preds = %261, %196
  br label %263

263:                                              ; preds = %262, %191
  br label %264

264:                                              ; preds = %263, %187
  br label %180, !llvm.loop !31

265:                                              ; preds = %180
  %266 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %267 = load ptr, ptr %266, align 8
  %268 = call ptr @create_token(i32 noundef 7, ptr noundef %267)
  store ptr %268, ptr %2, align 8
  br label %948

269:                                              ; preds = %32
  %270 = load ptr, ptr %3, align 8
  %271 = call i32 @fgetc(ptr noundef %270)
  store i32 %271, ptr %4, align 4
  %272 = load i32, ptr %4, align 4
  %273 = icmp ne i32 %272, 92
  br i1 %273, label %274, label %275

274:                                              ; preds = %269
  call void @print_error(i32 noundef 1)
  br label %275

275:                                              ; preds = %274, %269
  br label %276

276:                                              ; preds = %368, %359, %333, %325, %300, %296, %292, %288, %275
  %277 = load ptr, ptr %3, align 8
  %278 = call i32 @fgetc(ptr noundef %277)
  store i32 %278, ptr %4, align 4
  %279 = icmp ne i32 %278, -1
  br i1 %279, label %280, label %371

280:                                              ; preds = %276
  %281 = load i32, ptr %4, align 4
  %282 = icmp eq i32 %281, 92
  br i1 %282, label %283, label %341

283:                                              ; preds = %280
  %284 = load ptr, ptr %3, align 8
  %285 = call i32 @fgetc(ptr noundef %284)
  store i32 %285, ptr %4, align 4
  %286 = load i32, ptr %4, align 4
  %287 = icmp eq i32 %286, 34
  br i1 %287, label %288, label %289

288:                                              ; preds = %283
  call void @string_concat(ptr noundef %5, ptr noundef @.str.122)
  br label %276, !llvm.loop !32

289:                                              ; preds = %283
  %290 = load i32, ptr %4, align 4
  %291 = icmp eq i32 %290, 110
  br i1 %291, label %292, label %293

292:                                              ; preds = %289
  call void @string_concat(ptr noundef %5, ptr noundef @.str.123)
  br label %276, !llvm.loop !32

293:                                              ; preds = %289
  %294 = load i32, ptr %4, align 4
  %295 = icmp eq i32 %294, 114
  br i1 %295, label %296, label %297

296:                                              ; preds = %293
  call void @string_concat(ptr noundef %5, ptr noundef @.str.124)
  br label %276, !llvm.loop !32

297:                                              ; preds = %293
  %298 = load i32, ptr %4, align 4
  %299 = icmp eq i32 %298, 116
  br i1 %299, label %300, label %301

300:                                              ; preds = %297
  call void @string_concat(ptr noundef %5, ptr noundef @.str.125)
  br label %276, !llvm.loop !32

301:                                              ; preds = %297
  %302 = load i32, ptr %4, align 4
  %303 = icmp eq i32 %302, 120
  br i1 %303, label %304, label %330

304:                                              ; preds = %301
  call void @llvm.memset.p0.i64(ptr align 1 %8, i8 0, i64 3, i1 false)
  %305 = load ptr, ptr %3, align 8
  %306 = call i32 @fgetc(ptr noundef %305)
  %307 = trunc i32 %306 to i8
  %308 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 0
  store i8 %307, ptr %308, align 1
  %309 = load ptr, ptr %3, align 8
  %310 = call i32 @fgetc(ptr noundef %309)
  %311 = trunc i32 %310 to i8
  %312 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 1
  store i8 %311, ptr %312, align 1
  %313 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 0
  %314 = load i8, ptr %313, align 1
  %315 = sext i8 %314 to i32
  %316 = call i32 @isxdigit(i32 noundef %315) #14
  %317 = icmp ne i32 %316, 0
  br i1 %317, label %318, label %324

318:                                              ; preds = %304
  %319 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 1
  %320 = load i8, ptr %319, align 1
  %321 = sext i8 %320 to i32
  %322 = call i32 @isxdigit(i32 noundef %321) #14
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %325, label %324

324:                                              ; preds = %318, %304
  call void @print_error(i32 noundef 1)
  br label %325

325:                                              ; preds = %324, %318
  %326 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 0
  %327 = call i64 @strtol(ptr noundef %326, ptr noundef null, i32 noundef 16)
  %328 = trunc i64 %327 to i8
  store i8 %328, ptr %9, align 1
  %329 = load i8, ptr %9, align 1
  call void @string_append(ptr noundef %5, i8 noundef signext %329)
  br label %276, !llvm.loop !32

330:                                              ; preds = %301
  %331 = load i32, ptr %4, align 4
  %332 = icmp eq i32 %331, 92
  br i1 %332, label %333, label %334

333:                                              ; preds = %330
  call void @string_concat(ptr noundef %5, ptr noundef @.str.126)
  br label %276, !llvm.loop !32

334:                                              ; preds = %330
  call void @print_error(i32 noundef 1)
  br label %335

335:                                              ; preds = %334
  br label %336

336:                                              ; preds = %335
  br label %337

337:                                              ; preds = %336
  br label %338

338:                                              ; preds = %337
  br label %339

339:                                              ; preds = %338
  br label %340

340:                                              ; preds = %339
  br label %341

341:                                              ; preds = %340, %280
  %342 = load i32, ptr %4, align 4
  %343 = icmp eq i32 %342, 10
  br i1 %343, label %344, label %368

344:                                              ; preds = %341
  br label %345

345:                                              ; preds = %350, %344
  %346 = load ptr, ptr %3, align 8
  %347 = call i32 @fgetc(ptr noundef %346)
  store i32 %347, ptr %4, align 4
  %348 = call i32 @isspace(i32 noundef %347) #14
  %349 = icmp ne i32 %348, 0
  br i1 %349, label %350, label %351

350:                                              ; preds = %345
  br label %345, !llvm.loop !33

351:                                              ; preds = %345
  %352 = load i32, ptr %4, align 4
  %353 = icmp eq i32 %352, 92
  br i1 %353, label %354, label %364

354:                                              ; preds = %351
  %355 = load ptr, ptr %3, align 8
  %356 = call i32 @fgetc(ptr noundef %355)
  store i32 %356, ptr %4, align 4
  %357 = load i32, ptr %4, align 4
  %358 = icmp eq i32 %357, 92
  br i1 %358, label %359, label %360

359:                                              ; preds = %354
  call void @string_concat(ptr noundef %5, ptr noundef @.str.123)
  br label %276, !llvm.loop !32

360:                                              ; preds = %354
  %361 = load i32, ptr %4, align 4
  %362 = load ptr, ptr %3, align 8
  %363 = call i32 @ungetc(i32 noundef %361, ptr noundef %362)
  br label %371

364:                                              ; preds = %351
  %365 = load i32, ptr %4, align 4
  %366 = load ptr, ptr %3, align 8
  %367 = call i32 @ungetc(i32 noundef %365, ptr noundef %366)
  br label %371

368:                                              ; preds = %341
  %369 = load i32, ptr %4, align 4
  %370 = trunc i32 %369 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %370)
  br label %276, !llvm.loop !32

371:                                              ; preds = %364, %360, %276
  %372 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %373 = load ptr, ptr %372, align 8
  %374 = call ptr @create_token(i32 noundef 7, ptr noundef %373)
  store ptr %374, ptr %2, align 8
  br label %948

375:                                              ; preds = %32
  %376 = load ptr, ptr %3, align 8
  %377 = call i32 @fgetc(ptr noundef %376)
  store i32 %377, ptr %4, align 4
  %378 = load i32, ptr %4, align 4
  %379 = icmp eq i32 %378, 47
  br i1 %379, label %380, label %402

380:                                              ; preds = %375
  br label %381

381:                                              ; preds = %396, %380
  %382 = load i32, ptr %4, align 4
  %383 = icmp ne i32 %382, 10
  br i1 %383, label %384, label %387

384:                                              ; preds = %381
  %385 = load i32, ptr %4, align 4
  %386 = icmp ne i32 %385, -1
  br label %387

387:                                              ; preds = %384, %381
  %388 = phi i1 [ false, %381 ], [ %386, %384 ]
  br i1 %388, label %389, label %399

389:                                              ; preds = %387
  %390 = load i32, ptr %4, align 4
  %391 = icmp eq i32 %390, -1
  br i1 %391, label %392, label %396

392:                                              ; preds = %389
  %393 = load i32, ptr %4, align 4
  %394 = load ptr, ptr %3, align 8
  %395 = call i32 @ungetc(i32 noundef %393, ptr noundef %394)
  br label %399

396:                                              ; preds = %389
  %397 = load ptr, ptr %3, align 8
  %398 = call i32 @fgetc(ptr noundef %397)
  store i32 %398, ptr %4, align 4
  br label %381, !llvm.loop !34

399:                                              ; preds = %392, %387
  %400 = load ptr, ptr %3, align 8
  %401 = call ptr @read_token(ptr noundef %400)
  store ptr %401, ptr %2, align 8
  br label %948

402:                                              ; preds = %375
  %403 = load i32, ptr %4, align 4
  %404 = load ptr, ptr %3, align 8
  %405 = call i32 @ungetc(i32 noundef %403, ptr noundef %404)
  %406 = call ptr @create_token(i32 noundef 11, ptr noundef null)
  store ptr %406, ptr %2, align 8
  br label %948

407:                                              ; preds = %32
  %408 = call ptr @create_token(i32 noundef 0, ptr noundef null)
  store ptr %408, ptr %2, align 8
  br label %948

409:                                              ; preds = %32
  br label %410

410:                                              ; preds = %409
  %411 = load i32, ptr %4, align 4
  %412 = trunc i32 %411 to i8
  %413 = call zeroext i1 @isDigit(i8 noundef signext %412)
  br i1 %413, label %414, label %639

414:                                              ; preds = %410
  br label %415

415:                                              ; preds = %424, %414
  %416 = load i32, ptr %4, align 4
  %417 = trunc i32 %416 to i8
  %418 = call zeroext i1 @isDigit(i8 noundef signext %417)
  br i1 %418, label %419, label %422

419:                                              ; preds = %415
  %420 = load i32, ptr %4, align 4
  %421 = icmp ne i32 %420, -1
  br label %422

422:                                              ; preds = %419, %415
  %423 = phi i1 [ false, %415 ], [ %421, %419 ]
  br i1 %423, label %424, label %429

424:                                              ; preds = %422
  %425 = load i32, ptr %4, align 4
  %426 = trunc i32 %425 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %426)
  %427 = load ptr, ptr %3, align 8
  %428 = call i32 @fgetc(ptr noundef %427)
  store i32 %428, ptr %4, align 4
  br label %415, !llvm.loop !35

429:                                              ; preds = %422
  %430 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 1
  %431 = load i64, ptr %430, align 8
  %432 = icmp ugt i64 %431, 1
  br i1 %432, label %433, label %447

433:                                              ; preds = %429
  %434 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %435 = load ptr, ptr %434, align 8
  %436 = getelementptr inbounds i8, ptr %435, i64 0
  %437 = load i8, ptr %436, align 1
  %438 = sext i8 %437 to i32
  %439 = icmp eq i32 %438, 48
  br i1 %439, label %440, label %447

440:                                              ; preds = %433
  %441 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %442 = load ptr, ptr %441, align 8
  %443 = getelementptr inbounds i8, ptr %442, i64 1
  %444 = load i8, ptr %443, align 1
  %445 = call zeroext i1 @isDigit(i8 noundef signext %444)
  br i1 %445, label %446, label %447

446:                                              ; preds = %440
  call void @print_error(i32 noundef 1)
  br label %447

447:                                              ; preds = %446, %440, %433, %429
  %448 = load i32, ptr %4, align 4
  %449 = icmp eq i32 %448, 95
  br i1 %449, label %450, label %451

450:                                              ; preds = %447
  call void @print_error(i32 noundef 1)
  br label %451

451:                                              ; preds = %450, %447
  %452 = load i32, ptr %4, align 4
  %453 = icmp eq i32 %452, 101
  br i1 %453, label %457, label %454

454:                                              ; preds = %451
  %455 = load i32, ptr %4, align 4
  %456 = icmp eq i32 %455, 69
  br i1 %456, label %457, label %501

457:                                              ; preds = %454, %451
  %458 = load i32, ptr %4, align 4
  %459 = trunc i32 %458 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %459)
  %460 = load ptr, ptr %3, align 8
  %461 = call i32 @fgetc(ptr noundef %460)
  store i32 %461, ptr %4, align 4
  %462 = load i32, ptr %4, align 4
  %463 = icmp eq i32 %462, 43
  br i1 %463, label %467, label %464

464:                                              ; preds = %457
  %465 = load i32, ptr %4, align 4
  %466 = icmp eq i32 %465, 45
  br i1 %466, label %467, label %472

467:                                              ; preds = %464, %457
  %468 = load i32, ptr %4, align 4
  %469 = trunc i32 %468 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %469)
  %470 = load ptr, ptr %3, align 8
  %471 = call i32 @fgetc(ptr noundef %470)
  store i32 %471, ptr %4, align 4
  br label %472

472:                                              ; preds = %467, %464
  %473 = load i32, ptr %4, align 4
  %474 = call i32 @isdigit(i32 noundef %473) #14
  %475 = icmp ne i32 %474, 0
  br i1 %475, label %477, label %476

476:                                              ; preds = %472
  call void @print_error(i32 noundef 1)
  br label %477

477:                                              ; preds = %476, %472
  br label %478

478:                                              ; preds = %493, %477
  %479 = load i32, ptr %4, align 4
  %480 = call i32 @isdigit(i32 noundef %479) #14
  %481 = icmp ne i32 %480, 0
  br i1 %481, label %482, label %494

482:                                              ; preds = %478
  %483 = load i32, ptr %4, align 4
  %484 = trunc i32 %483 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %484)
  %485 = load ptr, ptr %3, align 8
  %486 = call i32 @fgetc(ptr noundef %485)
  store i32 %486, ptr %4, align 4
  %487 = load i32, ptr %4, align 4
  %488 = icmp eq i32 %487, 101
  br i1 %488, label %492, label %489

489:                                              ; preds = %482
  %490 = load i32, ptr %4, align 4
  %491 = icmp eq i32 %490, 69
  br i1 %491, label %492, label %493

492:                                              ; preds = %489, %482
  call void @print_error(i32 noundef 1)
  br label %493

493:                                              ; preds = %492, %489
  br label %478, !llvm.loop !36

494:                                              ; preds = %478
  %495 = load i32, ptr %4, align 4
  %496 = load ptr, ptr %3, align 8
  %497 = call i32 @ungetc(i32 noundef %495, ptr noundef %496)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %498 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %499 = load ptr, ptr %498, align 8
  %500 = call ptr @create_token(i32 noundef 5, ptr noundef %499)
  store ptr %500, ptr %2, align 8
  br label %948

501:                                              ; preds = %454
  %502 = load i32, ptr %4, align 4
  %503 = call i32 @isalpha(i32 noundef %502) #14
  %504 = icmp ne i32 %503, 0
  br i1 %504, label %505, label %506

505:                                              ; preds = %501
  call void @print_error(i32 noundef 1)
  br label %506

506:                                              ; preds = %505, %501
  br label %507

507:                                              ; preds = %506
  %508 = load i32, ptr %4, align 4
  %509 = icmp eq i32 %508, 46
  br i1 %509, label %510, label %614

510:                                              ; preds = %507
  %511 = load i32, ptr %4, align 4
  %512 = trunc i32 %511 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %512)
  %513 = load ptr, ptr %3, align 8
  %514 = call i32 @fgetc(ptr noundef %513)
  store i32 %514, ptr %4, align 4
  %515 = load i32, ptr %4, align 4
  %516 = trunc i32 %515 to i8
  %517 = call zeroext i1 @isDigit(i8 noundef signext %516)
  br i1 %517, label %519, label %518

518:                                              ; preds = %510
  call void @print_error(i32 noundef 1)
  br label %519

519:                                              ; preds = %518, %510
  br label %520

520:                                              ; preds = %524, %519
  %521 = load i32, ptr %4, align 4
  %522 = trunc i32 %521 to i8
  %523 = call zeroext i1 @isDigit(i8 noundef signext %522)
  br i1 %523, label %524, label %529

524:                                              ; preds = %520
  %525 = load i32, ptr %4, align 4
  %526 = trunc i32 %525 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %526)
  %527 = load ptr, ptr %3, align 8
  %528 = call i32 @fgetc(ptr noundef %527)
  store i32 %528, ptr %4, align 4
  br label %520, !llvm.loop !37

529:                                              ; preds = %520
  %530 = load i32, ptr %4, align 4
  %531 = icmp eq i32 %530, 46
  br i1 %531, label %532, label %533

532:                                              ; preds = %529
  call void @print_error(i32 noundef 1)
  br label %533

533:                                              ; preds = %532, %529
  %534 = load i32, ptr %4, align 4
  %535 = icmp eq i32 %534, 101
  br i1 %535, label %539, label %536

536:                                              ; preds = %533
  %537 = load i32, ptr %4, align 4
  %538 = icmp eq i32 %537, 69
  br i1 %538, label %539, label %601

539:                                              ; preds = %536, %533
  %540 = load i32, ptr %4, align 4
  %541 = trunc i32 %540 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %541)
  %542 = load ptr, ptr %3, align 8
  %543 = call i32 @fgetc(ptr noundef %542)
  store i32 %543, ptr %4, align 4
  %544 = load i32, ptr %4, align 4
  %545 = icmp eq i32 %544, 43
  br i1 %545, label %549, label %546

546:                                              ; preds = %539
  %547 = load i32, ptr %4, align 4
  %548 = icmp eq i32 %547, 45
  br i1 %548, label %549, label %554

549:                                              ; preds = %546, %539
  %550 = load i32, ptr %4, align 4
  %551 = trunc i32 %550 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %551)
  %552 = load ptr, ptr %3, align 8
  %553 = call i32 @fgetc(ptr noundef %552)
  store i32 %553, ptr %4, align 4
  br label %554

554:                                              ; preds = %549, %546
  %555 = load i32, ptr %4, align 4
  %556 = call i32 @isdigit(i32 noundef %555) #14
  %557 = icmp ne i32 %556, 0
  br i1 %557, label %559, label %558

558:                                              ; preds = %554
  call void @print_error(i32 noundef 1)
  br label %559

559:                                              ; preds = %558, %554
  br label %560

560:                                              ; preds = %575, %559
  %561 = load i32, ptr %4, align 4
  %562 = call i32 @isdigit(i32 noundef %561) #14
  %563 = icmp ne i32 %562, 0
  br i1 %563, label %564, label %576

564:                                              ; preds = %560
  %565 = load i32, ptr %4, align 4
  %566 = trunc i32 %565 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %566)
  %567 = load ptr, ptr %3, align 8
  %568 = call i32 @fgetc(ptr noundef %567)
  store i32 %568, ptr %4, align 4
  %569 = load i32, ptr %4, align 4
  %570 = icmp eq i32 %569, 101
  br i1 %570, label %574, label %571

571:                                              ; preds = %564
  %572 = load i32, ptr %4, align 4
  %573 = icmp eq i32 %572, 69
  br i1 %573, label %574, label %575

574:                                              ; preds = %571, %564
  call void @print_error(i32 noundef 1)
  br label %575

575:                                              ; preds = %574, %571
  br label %560, !llvm.loop !38

576:                                              ; preds = %560
  %577 = load i32, ptr %4, align 4
  %578 = call i32 @isspace(i32 noundef %577) #14
  %579 = icmp ne i32 %578, 0
  br i1 %579, label %592, label %580

580:                                              ; preds = %576
  %581 = load i32, ptr %4, align 4
  %582 = icmp eq i32 %581, 10
  br i1 %582, label %592, label %583

583:                                              ; preds = %580
  %584 = load i32, ptr %4, align 4
  %585 = icmp eq i32 %584, 9
  br i1 %585, label %592, label %586

586:                                              ; preds = %583
  %587 = load i32, ptr %4, align 4
  %588 = icmp eq i32 %587, 59
  br i1 %588, label %592, label %589

589:                                              ; preds = %586
  %590 = load i32, ptr %4, align 4
  %591 = icmp eq i32 %590, -1
  br i1 %591, label %592, label %599

592:                                              ; preds = %589, %586, %583, %580, %576
  %593 = load i32, ptr %4, align 4
  %594 = load ptr, ptr %3, align 8
  %595 = call i32 @ungetc(i32 noundef %593, ptr noundef %594)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %596 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %597 = load ptr, ptr %596, align 8
  %598 = call ptr @create_token(i32 noundef 6, ptr noundef %597)
  store ptr %598, ptr %2, align 8
  br label %948

599:                                              ; preds = %589
  call void @print_error(i32 noundef 1)
  br label %600

600:                                              ; preds = %599
  br label %607

601:                                              ; preds = %536
  %602 = load i32, ptr %4, align 4
  %603 = call i32 @isalpha(i32 noundef %602) #14
  %604 = icmp ne i32 %603, 0
  br i1 %604, label %605, label %606

605:                                              ; preds = %601
  call void @print_error(i32 noundef 1)
  br label %606

606:                                              ; preds = %605, %601
  br label %607

607:                                              ; preds = %606, %600
  %608 = load i32, ptr %4, align 4
  %609 = load ptr, ptr %3, align 8
  %610 = call i32 @ungetc(i32 noundef %608, ptr noundef %609)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %611 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %612 = load ptr, ptr %611, align 8
  %613 = call ptr @create_token(i32 noundef 4, ptr noundef %612)
  store ptr %613, ptr %2, align 8
  br label %948

614:                                              ; preds = %507
  %615 = load i32, ptr %4, align 4
  %616 = call i32 @isspace(i32 noundef %615) #14
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %618, label %625

618:                                              ; preds = %614
  %619 = load i32, ptr %4, align 4
  %620 = load ptr, ptr %3, align 8
  %621 = call i32 @ungetc(i32 noundef %619, ptr noundef %620)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %622 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %623 = load ptr, ptr %622, align 8
  %624 = call ptr @create_token(i32 noundef 3, ptr noundef %623)
  store ptr %624, ptr %2, align 8
  br label %948

625:                                              ; preds = %614
  %626 = load i32, ptr %4, align 4
  %627 = call i32 @isalpha(i32 noundef %626) #14
  %628 = icmp ne i32 %627, 0
  br i1 %628, label %629, label %630

629:                                              ; preds = %625
  call void @print_error(i32 noundef 1)
  br label %637

630:                                              ; preds = %625
  %631 = load i32, ptr %4, align 4
  %632 = load ptr, ptr %3, align 8
  %633 = call i32 @ungetc(i32 noundef %631, ptr noundef %632)
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %634 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %635 = load ptr, ptr %634, align 8
  %636 = call ptr @create_token(i32 noundef 3, ptr noundef %635)
  store ptr %636, ptr %2, align 8
  br label %948

637:                                              ; preds = %629
  br label %638

638:                                              ; preds = %637
  br label %639

639:                                              ; preds = %638, %410
  %640 = load i32, ptr %4, align 4
  %641 = trunc i32 %640 to i8
  %642 = call zeroext i1 @isAlpha(i8 noundef signext %641)
  br i1 %642, label %646, label %643

643:                                              ; preds = %639
  %644 = load i32, ptr %4, align 4
  %645 = icmp eq i32 %644, 95
  br i1 %645, label %646, label %947

646:                                              ; preds = %643, %639
  br label %647

647:                                              ; preds = %663, %646
  %648 = load i32, ptr %4, align 4
  %649 = trunc i32 %648 to i8
  %650 = call zeroext i1 @isAlpha(i8 noundef signext %649)
  br i1 %650, label %658, label %651

651:                                              ; preds = %647
  %652 = load i32, ptr %4, align 4
  %653 = icmp eq i32 %652, 95
  br i1 %653, label %658, label %654

654:                                              ; preds = %651
  %655 = load i32, ptr %4, align 4
  %656 = trunc i32 %655 to i8
  %657 = call zeroext i1 @isDigit(i8 noundef signext %656)
  br i1 %657, label %658, label %661

658:                                              ; preds = %654, %651, %647
  %659 = load i32, ptr %4, align 4
  %660 = icmp ne i32 %659, -1
  br label %661

661:                                              ; preds = %658, %654
  %662 = phi i1 [ false, %654 ], [ %660, %658 ]
  br i1 %662, label %663, label %668

663:                                              ; preds = %661
  %664 = load i32, ptr %4, align 4
  %665 = trunc i32 %664 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %665)
  %666 = load ptr, ptr %3, align 8
  %667 = call i32 @fgetc(ptr noundef %666)
  store i32 %667, ptr %4, align 4
  br label %647, !llvm.loop !39

668:                                              ; preds = %661
  %669 = load i32, ptr %4, align 4
  %670 = load ptr, ptr %3, align 8
  %671 = call i32 @ungetc(i32 noundef %669, ptr noundef %670)
  %672 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %673 = load ptr, ptr %672, align 8
  %674 = call i32 @strcmp(ptr noundef %673, ptr noundef @.str.94.314) #11
  %675 = icmp eq i32 %674, 0
  br i1 %675, label %676, label %678

676:                                              ; preds = %668
  %677 = call ptr @create_token(i32 noundef 33, ptr noundef null)
  store ptr %677, ptr %2, align 8
  br label %948

678:                                              ; preds = %668
  %679 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %680 = load ptr, ptr %679, align 8
  %681 = call i32 @strcmp(ptr noundef %680, ptr noundef @.str.95.315) #11
  %682 = icmp eq i32 %681, 0
  br i1 %682, label %683, label %685

683:                                              ; preds = %678
  %684 = call ptr @create_token(i32 noundef 34, ptr noundef null)
  store ptr %684, ptr %2, align 8
  br label %948

685:                                              ; preds = %678
  %686 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %687 = load ptr, ptr %686, align 8
  %688 = call i32 @strcmp(ptr noundef %687, ptr noundef @.str.96.316) #11
  %689 = icmp eq i32 %688, 0
  br i1 %689, label %690, label %692

690:                                              ; preds = %685
  %691 = call ptr @create_token(i32 noundef 35, ptr noundef null)
  store ptr %691, ptr %2, align 8
  br label %948

692:                                              ; preds = %685
  %693 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %694 = load ptr, ptr %693, align 8
  %695 = call i32 @strcmp(ptr noundef %694, ptr noundef @.str.97.317) #11
  %696 = icmp eq i32 %695, 0
  br i1 %696, label %697, label %699

697:                                              ; preds = %692
  %698 = call ptr @create_token(i32 noundef 36, ptr noundef null)
  store ptr %698, ptr %2, align 8
  br label %948

699:                                              ; preds = %692
  %700 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %701 = load ptr, ptr %700, align 8
  %702 = call i32 @strcmp(ptr noundef %701, ptr noundef @.str.98.318) #11
  %703 = icmp eq i32 %702, 0
  br i1 %703, label %704, label %706

704:                                              ; preds = %699
  %705 = call ptr @create_token(i32 noundef 37, ptr noundef null)
  store ptr %705, ptr %2, align 8
  br label %948

706:                                              ; preds = %699
  %707 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %708 = load ptr, ptr %707, align 8
  %709 = call i32 @strcmp(ptr noundef %708, ptr noundef @.str.99.319) #11
  %710 = icmp eq i32 %709, 0
  br i1 %710, label %711, label %713

711:                                              ; preds = %706
  %712 = call ptr @create_token(i32 noundef 38, ptr noundef null)
  store ptr %712, ptr %2, align 8
  br label %948

713:                                              ; preds = %706
  %714 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %715 = load ptr, ptr %714, align 8
  %716 = call i32 @strcmp(ptr noundef %715, ptr noundef @.str.100.320) #11
  %717 = icmp eq i32 %716, 0
  br i1 %717, label %718, label %720

718:                                              ; preds = %713
  %719 = call ptr @create_token(i32 noundef 39, ptr noundef null)
  store ptr %719, ptr %2, align 8
  br label %948

720:                                              ; preds = %713
  %721 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %722 = load ptr, ptr %721, align 8
  %723 = call i32 @strcmp(ptr noundef %722, ptr noundef @.str.101.321) #11
  %724 = icmp eq i32 %723, 0
  br i1 %724, label %725, label %727

725:                                              ; preds = %720
  %726 = call ptr @create_token(i32 noundef 40, ptr noundef null)
  store ptr %726, ptr %2, align 8
  br label %948

727:                                              ; preds = %720
  %728 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %729 = load ptr, ptr %728, align 8
  %730 = call i32 @strcmp(ptr noundef %729, ptr noundef @.str.102.322) #11
  %731 = icmp eq i32 %730, 0
  br i1 %731, label %732, label %734

732:                                              ; preds = %727
  %733 = call ptr @create_token(i32 noundef 41, ptr noundef null)
  store ptr %733, ptr %2, align 8
  br label %948

734:                                              ; preds = %727
  %735 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %736 = load ptr, ptr %735, align 8
  %737 = call i32 @strcmp(ptr noundef %736, ptr noundef @.str.104) #11
  %738 = icmp eq i32 %737, 0
  br i1 %738, label %739, label %741

739:                                              ; preds = %734
  %740 = call ptr @create_token(i32 noundef 43, ptr noundef null)
  store ptr %740, ptr %2, align 8
  br label %948

741:                                              ; preds = %734
  %742 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %743 = load ptr, ptr %742, align 8
  %744 = call i32 @strcmp(ptr noundef %743, ptr noundef @.str.105) #11
  %745 = icmp eq i32 %744, 0
  br i1 %745, label %746, label %748

746:                                              ; preds = %741
  %747 = call ptr @create_token(i32 noundef 44, ptr noundef null)
  store ptr %747, ptr %2, align 8
  br label %948

748:                                              ; preds = %741
  %749 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %750 = load ptr, ptr %749, align 8
  %751 = call i32 @strcmp(ptr noundef %750, ptr noundef @.str.106) #11
  %752 = icmp eq i32 %751, 0
  br i1 %752, label %753, label %755

753:                                              ; preds = %748
  %754 = call ptr @create_token(i32 noundef 45, ptr noundef null)
  store ptr %754, ptr %2, align 8
  br label %948

755:                                              ; preds = %748
  %756 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %757 = load ptr, ptr %756, align 8
  %758 = call i32 @strcmp(ptr noundef %757, ptr noundef @.str.107) #11
  %759 = icmp eq i32 %758, 0
  br i1 %759, label %760, label %762

760:                                              ; preds = %755
  %761 = call ptr @create_token(i32 noundef 46, ptr noundef null)
  store ptr %761, ptr %2, align 8
  br label %948

762:                                              ; preds = %755
  %763 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %764 = load ptr, ptr %763, align 8
  %765 = call i32 @strcmp(ptr noundef %764, ptr noundef @.str.127) #11
  %766 = icmp eq i32 %765, 0
  br i1 %766, label %767, label %929

767:                                              ; preds = %762
  br label %768

768:                                              ; preds = %773, %767
  %769 = load ptr, ptr %3, align 8
  %770 = call i32 @fgetc(ptr noundef %769)
  store i32 %770, ptr %4, align 4
  %771 = call i32 @isspace(i32 noundef %770) #14
  %772 = icmp ne i32 %771, 0
  br i1 %772, label %773, label %774

773:                                              ; preds = %768
  br label %768, !llvm.loop !40

774:                                              ; preds = %768
  %775 = load i32, ptr %4, align 4
  %776 = icmp eq i32 %775, 46
  br i1 %776, label %777, label %918

777:                                              ; preds = %774
  %778 = load i32, ptr %4, align 4
  %779 = trunc i32 %778 to i8
  call void @string_append(ptr noundef %5, i8 noundef signext %779)
  br label %780

780:                                              ; preds = %785, %777
  %781 = load ptr, ptr %3, align 8
  %782 = call i32 @fgetc(ptr noundef %781)
  store i32 %782, ptr %4, align 4
  %783 = call i32 @isspace(i32 noundef %782) #14
  %784 = icmp ne i32 %783, 0
  br i1 %784, label %785, label %786

785:                                              ; preds = %780
  br label %780, !llvm.loop !41

786:                                              ; preds = %780
  call void @string_init(ptr noundef %10)
  br label %787

787:                                              ; preds = %805, %786
  %788 = load i32, ptr %4, align 4
  %789 = trunc i32 %788 to i8
  %790 = call zeroext i1 @isAlpha(i8 noundef signext %789)
  br i1 %790, label %795, label %791

791:                                              ; preds = %787
  %792 = load i32, ptr %4, align 4
  %793 = trunc i32 %792 to i8
  %794 = call zeroext i1 @isDigit(i8 noundef signext %793)
  br i1 %794, label %795, label %803

795:                                              ; preds = %791, %787
  %796 = load i32, ptr %4, align 4
  %797 = icmp ne i32 %796, -1
  br i1 %797, label %801, label %798

798:                                              ; preds = %795
  %799 = load i32, ptr %4, align 4
  %800 = icmp ne i32 %799, 32
  br label %801

801:                                              ; preds = %798, %795
  %802 = phi i1 [ true, %795 ], [ %800, %798 ]
  br label %803

803:                                              ; preds = %801, %791
  %804 = phi i1 [ false, %791 ], [ %802, %801 ]
  br i1 %804, label %805, label %810

805:                                              ; preds = %803
  %806 = load i32, ptr %4, align 4
  %807 = trunc i32 %806 to i8
  call void @string_append(ptr noundef %10, i8 noundef signext %807)
  %808 = load ptr, ptr %3, align 8
  %809 = call i32 @fgetc(ptr noundef %808)
  store i32 %809, ptr %4, align 4
  br label %787, !llvm.loop !42

810:                                              ; preds = %803
  %811 = load i32, ptr %4, align 4
  %812 = load ptr, ptr %3, align 8
  %813 = call i32 @ungetc(i32 noundef %811, ptr noundef %812)
  call void @string_append(ptr noundef %10, i8 noundef signext 0)
  %814 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %815 = load ptr, ptr %814, align 8
  %816 = call i32 @strcmp(ptr noundef %815, ptr noundef @.str.128) #11
  %817 = icmp eq i32 %816, 0
  br i1 %817, label %818, label %820

818:                                              ; preds = %810
  %819 = call ptr @create_token(i32 noundef 47, ptr noundef null)
  store ptr %819, ptr %2, align 8
  br label %948

820:                                              ; preds = %810
  %821 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %822 = load ptr, ptr %821, align 8
  %823 = call i32 @strcmp(ptr noundef %822, ptr noundef @.str.129) #11
  %824 = icmp eq i32 %823, 0
  br i1 %824, label %825, label %827

825:                                              ; preds = %820
  %826 = call ptr @create_token(i32 noundef 48, ptr noundef null)
  store ptr %826, ptr %2, align 8
  br label %948

827:                                              ; preds = %820
  %828 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %829 = load ptr, ptr %828, align 8
  %830 = call i32 @strcmp(ptr noundef %829, ptr noundef @.str.130) #11
  %831 = icmp eq i32 %830, 0
  br i1 %831, label %832, label %834

832:                                              ; preds = %827
  %833 = call ptr @create_token(i32 noundef 49, ptr noundef null)
  store ptr %833, ptr %2, align 8
  br label %948

834:                                              ; preds = %827
  %835 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %836 = load ptr, ptr %835, align 8
  %837 = call i32 @strcmp(ptr noundef %836, ptr noundef @.str.131) #11
  %838 = icmp eq i32 %837, 0
  br i1 %838, label %839, label %841

839:                                              ; preds = %834
  %840 = call ptr @create_token(i32 noundef 50, ptr noundef null)
  store ptr %840, ptr %2, align 8
  br label %948

841:                                              ; preds = %834
  %842 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %843 = load ptr, ptr %842, align 8
  %844 = call i32 @strcmp(ptr noundef %843, ptr noundef @.str.132) #11
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %848

846:                                              ; preds = %841
  %847 = call ptr @create_token(i32 noundef 51, ptr noundef null)
  store ptr %847, ptr %2, align 8
  br label %948

848:                                              ; preds = %841
  %849 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %850 = load ptr, ptr %849, align 8
  %851 = call i32 @strcmp(ptr noundef %850, ptr noundef @.str.133) #11
  %852 = icmp eq i32 %851, 0
  br i1 %852, label %853, label %855

853:                                              ; preds = %848
  %854 = call ptr @create_token(i32 noundef 52, ptr noundef null)
  store ptr %854, ptr %2, align 8
  br label %948

855:                                              ; preds = %848
  %856 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %857 = load ptr, ptr %856, align 8
  %858 = call i32 @strcmp(ptr noundef %857, ptr noundef @.str.134) #11
  %859 = icmp eq i32 %858, 0
  br i1 %859, label %860, label %862

860:                                              ; preds = %855
  %861 = call ptr @create_token(i32 noundef 53, ptr noundef null)
  store ptr %861, ptr %2, align 8
  br label %948

862:                                              ; preds = %855
  %863 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %864 = load ptr, ptr %863, align 8
  %865 = call i32 @strcmp(ptr noundef %864, ptr noundef @.str.135) #11
  %866 = icmp eq i32 %865, 0
  br i1 %866, label %867, label %869

867:                                              ; preds = %862
  %868 = call ptr @create_token(i32 noundef 54, ptr noundef null)
  store ptr %868, ptr %2, align 8
  br label %948

869:                                              ; preds = %862
  %870 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %871 = load ptr, ptr %870, align 8
  %872 = call i32 @strcmp(ptr noundef %871, ptr noundef @.str.136) #11
  %873 = icmp eq i32 %872, 0
  br i1 %873, label %874, label %876

874:                                              ; preds = %869
  %875 = call ptr @create_token(i32 noundef 55, ptr noundef null)
  store ptr %875, ptr %2, align 8
  br label %948

876:                                              ; preds = %869
  %877 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %878 = load ptr, ptr %877, align 8
  %879 = call i32 @strcmp(ptr noundef %878, ptr noundef @.str.137) #11
  %880 = icmp eq i32 %879, 0
  br i1 %880, label %881, label %883

881:                                              ; preds = %876
  %882 = call ptr @create_token(i32 noundef 56, ptr noundef null)
  store ptr %882, ptr %2, align 8
  br label %948

883:                                              ; preds = %876
  %884 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %885 = load ptr, ptr %884, align 8
  %886 = call i32 @strcmp(ptr noundef %885, ptr noundef @.str.138) #11
  %887 = icmp eq i32 %886, 0
  br i1 %887, label %888, label %890

888:                                              ; preds = %883
  %889 = call ptr @create_token(i32 noundef 57, ptr noundef null)
  store ptr %889, ptr %2, align 8
  br label %948

890:                                              ; preds = %883
  %891 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %892 = load ptr, ptr %891, align 8
  %893 = call i32 @strcmp(ptr noundef %892, ptr noundef @.str.139) #11
  %894 = icmp eq i32 %893, 0
  br i1 %894, label %895, label %897

895:                                              ; preds = %890
  %896 = call ptr @create_token(i32 noundef 58, ptr noundef null)
  store ptr %896, ptr %2, align 8
  br label %948

897:                                              ; preds = %890
  %898 = getelementptr inbounds nuw %struct.String, ptr %10, i32 0, i32 0
  %899 = load ptr, ptr %898, align 8
  %900 = call i32 @strcmp(ptr noundef %899, ptr noundef @.str.140) #11
  %901 = icmp eq i32 %900, 0
  br i1 %901, label %902, label %904

902:                                              ; preds = %897
  %903 = call ptr @create_token(i32 noundef 59, ptr noundef null)
  store ptr %903, ptr %2, align 8
  br label %948

904:                                              ; preds = %897
  call void @print_error(i32 noundef 1)
  br label %905

905:                                              ; preds = %904
  br label %906

906:                                              ; preds = %905
  br label %907

907:                                              ; preds = %906
  br label %908

908:                                              ; preds = %907
  br label %909

909:                                              ; preds = %908
  br label %910

910:                                              ; preds = %909
  br label %911

911:                                              ; preds = %910
  br label %912

912:                                              ; preds = %911
  br label %913

913:                                              ; preds = %912
  br label %914

914:                                              ; preds = %913
  br label %915

915:                                              ; preds = %914
  br label %916

916:                                              ; preds = %915
  br label %917

917:                                              ; preds = %916
  br label %928

918:                                              ; preds = %774
  %919 = load i32, ptr %4, align 4
  %920 = icmp eq i32 %919, 61
  br i1 %920, label %921, label %926

921:                                              ; preds = %918
  %922 = load i32, ptr %4, align 4
  %923 = load ptr, ptr %3, align 8
  %924 = call i32 @ungetc(i32 noundef %922, ptr noundef %923)
  %925 = call ptr @create_token(i32 noundef 60, ptr noundef null)
  store ptr %925, ptr %2, align 8
  br label %948

926:                                              ; preds = %918
  call void @print_error(i32 noundef 1)
  br label %927

927:                                              ; preds = %926
  br label %928

928:                                              ; preds = %927, %917
  br label %933

929:                                              ; preds = %762
  call void @string_append(ptr noundef %5, i8 noundef signext 0)
  %930 = getelementptr inbounds nuw %struct.String, ptr %5, i32 0, i32 0
  %931 = load ptr, ptr %930, align 8
  %932 = call ptr @create_token(i32 noundef 1, ptr noundef %931)
  store ptr %932, ptr %2, align 8
  br label %948

933:                                              ; preds = %928
  br label %934

934:                                              ; preds = %933
  br label %935

935:                                              ; preds = %934
  br label %936

936:                                              ; preds = %935
  br label %937

937:                                              ; preds = %936
  br label %938

938:                                              ; preds = %937
  br label %939

939:                                              ; preds = %938
  br label %940

940:                                              ; preds = %939
  br label %941

941:                                              ; preds = %940
  br label %942

942:                                              ; preds = %941
  br label %943

943:                                              ; preds = %942
  br label %944

944:                                              ; preds = %943
  br label %945

945:                                              ; preds = %944
  br label %946

946:                                              ; preds = %945
  br label %947

947:                                              ; preds = %946, %643
  call void @print_error(i32 noundef 1)
  store ptr null, ptr %2, align 8
  br label %948

948:                                              ; preds = %947, %929, %921, %902, %895, %888, %881, %874, %867, %860, %853, %846, %839, %832, %825, %818, %760, %753, %746, %739, %732, %725, %718, %711, %704, %697, %690, %683, %676, %630, %618, %607, %592, %494, %407, %402, %399, %371, %265, %177, %175, %173, %171, %169, %163, %109, %107, %105, %103, %89, %87, %85, %83, %81, %76, %74, %64, %62, %52, %50, %41, %39, %15
  %949 = load ptr, ptr %2, align 8
  ret ptr %949
}

declare i32 @fgetc(ptr noundef) #2

declare i32 @ungetc(i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isspace(i32 noundef) #9

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isdigit(i32 noundef) #9

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isxdigit(i32 noundef) #9

declare i64 @strtol(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isalpha(i32 noundef) #9

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @getTypeTokenName(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds nuw [61 x ptr], ptr @TypeTokenNames, i64 0, i64 %4
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @getTypeTokenSymbol(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds nuw [61 x ptr], ptr @TypeToeknSymbols, i64 0, i64 %4
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @exps_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %5, i32 0, i32 1
  store i32 0, ptr %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @exps_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 0
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @exps_full(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 512
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @exps_push(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = call ptr @malloc(i64 noundef 16) #10
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  call void @print_error(i32 noundef 99)
  br label %11

11:                                               ; preds = %10, %2
  %12 = load ptr, ptr %4, align 8
  %13 = call zeroext i1 @exps_full(ptr noundef %12)
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i1 false, ptr %3, align 1
  br label %31

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds nuw %struct.Token, ptr %17, i32 0, i32 0
  store i32 %16, ptr %18, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds nuw %struct.Token, ptr %22, i32 0, i32 1
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %25, i32 0, i32 0
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %28, align 8
  store i1 true, ptr %3, align 1
  br label %31

31:                                               ; preds = %15, %14
  %32 = load i1, ptr %3, align 1
  ret i1 %32
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @exps_pop(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call zeroext i1 @exps_empty(ptr noundef %5)
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %24

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %4, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds nuw %struct.Token, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %17, i32 0, i32 0
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %19)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 8
  %23 = add nsw i32 %22, -1
  store i32 %23, ptr %21, align 8
  store i1 true, ptr %2, align 1
  br label %24

24:                                               ; preds = %8, %7
  %25 = load i1, ptr %2, align 1
  ret i1 %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define [2 x i64] @exps_top(ptr noundef %0) #0 {
  %2 = alloca %struct.Token, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds nuw %struct.Exp_numbers_stack, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %6, i64 16, i1 false)
  %7 = load [2 x i64], ptr %2, align 8
  ret [2 x i64] %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @exps_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %7, %1
  %4 = load ptr, ptr %2, align 8
  %5 = call zeroext i1 @exps_empty(ptr noundef %4)
  %6 = xor i1 %5, true
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = load ptr, ptr %2, align 8
  %9 = call zeroext i1 @exps_pop(ptr noundef %8)
  br label %3, !llvm.loop !43

10:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @exps_reverse(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.Exp_numbers_stack, align 8
  %4 = alloca %struct.Token, align 8
  store ptr %0, ptr %2, align 8
  call void @exps_init(ptr noundef %3)
  br label %5

5:                                                ; preds = %9, %1
  %6 = load ptr, ptr %2, align 8
  %7 = call zeroext i1 @exps_empty(ptr noundef %6)
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %17

9:                                                ; preds = %5
  %10 = load ptr, ptr %2, align 8
  %11 = call [2 x i64] @exps_top(ptr noundef %10)
  store [2 x i64] %11, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.Token, ptr %4, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = call zeroext i1 @exps_push(ptr noundef %3, i32 noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = call zeroext i1 @exps_pop(ptr noundef %15)
  br label %5, !llvm.loop !44

17:                                               ; preds = %5
  %18 = load ptr, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %18, ptr align 8 %3, i64 16, i1 false)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @ht_hash(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %5, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = call i64 @strlen(ptr noundef %8) #11
  %10 = trunc i64 %9 to i32
  store i32 %10, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %11

11:                                               ; preds = %24, %2
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %27

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %7, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  br label %24

24:                                               ; preds = %15
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  br label %11, !llvm.loop !45

27:                                               ; preds = %11
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %28, %29
  %31 = srem i32 %30, 1000
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @global_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.s_global, ptr %4, i32 0, i32 0
  store i32 1000, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.s_global, ptr %6, i32 0, i32 1
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.s_global, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = sext i32 %10 to i64
  %12 = mul i64 %11, 24
  %13 = call ptr @malloc(i64 noundef %12) #10
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.s_global, ptr %14, i32 0, i32 2
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.s_global, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %1
  call void @print_error(i32 noundef 99)
  br label %21

21:                                               ; preds = %20, %1
  store i32 0, ptr %3, align 4
  br label %22

22:                                               ; preds = %36, %21
  %23 = load i32, ptr %3, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.s_global, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %39

28:                                               ; preds = %22
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.s_global, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item_var, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.item_var, ptr %34, i32 0, i32 2
  store i8 1, ptr %35, align 8
  br label %36

36:                                               ; preds = %28
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  br label %22, !llvm.loop !46

39:                                               ; preds = %22
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @local_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.s_global, ptr %4, i32 0, i32 0
  store i32 1000, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.s_global, ptr %6, i32 0, i32 1
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.s_global, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = sext i32 %10 to i64
  %12 = mul i64 %11, 24
  %13 = call ptr @malloc(i64 noundef %12) #10
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.s_global, ptr %14, i32 0, i32 2
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.s_global, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %1
  call void @print_error(i32 noundef 99)
  br label %21

21:                                               ; preds = %20, %1
  store i32 0, ptr %3, align 4
  br label %22

22:                                               ; preds = %36, %21
  %23 = load i32, ptr %3, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.s_global, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %39

28:                                               ; preds = %22
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.s_global, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item_var, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.item_var, ptr %34, i32 0, i32 2
  store i8 1, ptr %35, align 8
  br label %36

36:                                               ; preds = %28
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  br label %22, !llvm.loop !47

39:                                               ; preds = %22
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @global_search(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %69, %2
  %9 = load i32, ptr %7, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.s_global, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %72

14:                                               ; preds = %8
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %7, align 4
  %17 = call i32 @ht_hash(ptr noundef %15, i32 noundef %16)
  store i32 %17, ptr %6, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.s_global, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.item_var, ptr %20, i64 %22
  %24 = getelementptr inbounds nuw %struct.item_var, ptr %23, i32 0, i32 2
  %25 = load i8, ptr %24, align 8
  %26 = trunc i8 %25 to i1
  br i1 %26, label %68, label %27

27:                                               ; preds = %14
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds nuw %struct.s_global, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.item_var, ptr %30, i64 %32
  %34 = getelementptr inbounds nuw %struct.item_var, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %67

37:                                               ; preds = %27
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds nuw %struct.s_global, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.item_var, ptr %40, i64 %42
  %44 = getelementptr inbounds nuw %struct.item_var, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = call i32 @strcmp(ptr noundef %45, ptr noundef %46) #11
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %67

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.s_global, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.item_var, ptr %52, i64 %54
  %56 = getelementptr inbounds nuw %struct.item_var, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %66

59:                                               ; preds = %49
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.s_global, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.item_var, ptr %62, i64 %64
  store ptr %65, ptr %3, align 8
  br label %73

66:                                               ; preds = %49
  br label %67

67:                                               ; preds = %66, %37, %27
  br label %69

68:                                               ; preds = %14
  br label %72

69:                                               ; preds = %67
  %70 = load i32, ptr %7, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %7, align 4
  br label %8, !llvm.loop !48

72:                                               ; preds = %68, %8
  store ptr null, ptr %3, align 8
  br label %73

73:                                               ; preds = %72, %59
  %74 = load ptr, ptr %3, align 8
  ret ptr %74
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @local_search(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %69, %2
  %9 = load i32, ptr %7, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.s_global, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %72

14:                                               ; preds = %8
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %7, align 4
  %17 = call i32 @ht_hash(ptr noundef %15, i32 noundef %16)
  store i32 %17, ptr %6, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.s_global, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.item_var, ptr %20, i64 %22
  %24 = getelementptr inbounds nuw %struct.item_var, ptr %23, i32 0, i32 2
  %25 = load i8, ptr %24, align 8
  %26 = trunc i8 %25 to i1
  br i1 %26, label %68, label %27

27:                                               ; preds = %14
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds nuw %struct.s_global, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.item_var, ptr %30, i64 %32
  %34 = getelementptr inbounds nuw %struct.item_var, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %67

37:                                               ; preds = %27
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds nuw %struct.s_global, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.item_var, ptr %40, i64 %42
  %44 = getelementptr inbounds nuw %struct.item_var, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = call i32 @strcmp(ptr noundef %45, ptr noundef %46) #11
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %67

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.s_global, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.item_var, ptr %52, i64 %54
  %56 = getelementptr inbounds nuw %struct.item_var, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %66

59:                                               ; preds = %49
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.s_global, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.item_var, ptr %62, i64 %64
  store ptr %65, ptr %3, align 8
  br label %73

66:                                               ; preds = %49
  br label %67

67:                                               ; preds = %66, %37, %27
  br label %69

68:                                               ; preds = %14
  br label %72

69:                                               ; preds = %67
  %70 = load i32, ptr %7, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %7, align 4
  br label %8, !llvm.loop !49

72:                                               ; preds = %68, %8
  store ptr null, ptr %3, align 8
  br label %73

73:                                               ; preds = %72, %59
  %74 = load ptr, ptr %3, align 8
  ret ptr %74
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @global_insert(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 0, ptr %9, align 4
  br label %11

11:                                               ; preds = %77, %3
  %12 = load i32, ptr %9, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.s_global, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %80

17:                                               ; preds = %11
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %9, align 4
  %20 = call i32 @ht_hash(ptr noundef %18, i32 noundef %19)
  store i32 %20, ptr %8, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.s_global, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.item_var, ptr %23, i64 %25
  store ptr %26, ptr %10, align 8
  %27 = load ptr, ptr %10, align 8
  %28 = getelementptr inbounds nuw %struct.item_var, ptr %27, i32 0, i32 2
  %29 = load i8, ptr %28, align 8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %60

31:                                               ; preds = %17
  %32 = load ptr, ptr %6, align 8
  %33 = call i64 @strlen(ptr noundef %32) #11
  %34 = add i64 %33, 1
  %35 = call ptr @malloc(i64 noundef %34) #10
  %36 = load ptr, ptr %10, align 8
  %37 = getelementptr inbounds nuw %struct.item_var, ptr %36, i32 0, i32 0
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = getelementptr inbounds nuw %struct.item_var, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = load ptr, ptr %10, align 8
  %43 = getelementptr inbounds nuw %struct.item_var, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = call i64 @llvm.objectsize.i64.p0(ptr %44, i1 false, i1 true, i1 false)
  %46 = call ptr @__strcpy_chk(ptr noundef %40, ptr noundef %41, i64 noundef %45) #11
  %47 = load ptr, ptr %7, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %53

49:                                               ; preds = %31
  %50 = load ptr, ptr %7, align 8
  %51 = load ptr, ptr %10, align 8
  %52 = getelementptr inbounds nuw %struct.item_var, ptr %51, i32 0, i32 1
  store ptr %50, ptr %52, align 8
  br label %53

53:                                               ; preds = %49, %31
  %54 = load ptr, ptr %10, align 8
  %55 = getelementptr inbounds nuw %struct.item_var, ptr %54, i32 0, i32 2
  store i8 0, ptr %55, align 8
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds nuw %struct.s_global, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %57, align 4
  store i1 true, ptr %4, align 1
  br label %81

60:                                               ; preds = %17
  %61 = load ptr, ptr %10, align 8
  %62 = getelementptr inbounds nuw %struct.item_var, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = call i32 @strcmp(ptr noundef %63, ptr noundef %64) #11
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %75

67:                                               ; preds = %60
  %68 = load ptr, ptr %7, align 8
  %69 = icmp ne ptr %68, null
  br i1 %69, label %70, label %74

70:                                               ; preds = %67
  %71 = load ptr, ptr %7, align 8
  %72 = load ptr, ptr %10, align 8
  %73 = getelementptr inbounds nuw %struct.item_var, ptr %72, i32 0, i32 1
  store ptr %71, ptr %73, align 8
  br label %74

74:                                               ; preds = %70, %67
  store i1 true, ptr %4, align 1
  br label %81

75:                                               ; preds = %60
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %9, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %9, align 4
  br label %11, !llvm.loop !50

80:                                               ; preds = %11
  store i1 false, ptr %4, align 1
  br label %81

81:                                               ; preds = %80, %74, %53
  %82 = load i1, ptr %4, align 1
  ret i1 %82
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @local_insert(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 0, ptr %9, align 4
  br label %11

11:                                               ; preds = %77, %3
  %12 = load i32, ptr %9, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.s_global, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %80

17:                                               ; preds = %11
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %9, align 4
  %20 = call i32 @ht_hash(ptr noundef %18, i32 noundef %19)
  store i32 %20, ptr %8, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.s_global, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.item_var, ptr %23, i64 %25
  store ptr %26, ptr %10, align 8
  %27 = load ptr, ptr %10, align 8
  %28 = getelementptr inbounds nuw %struct.item_var, ptr %27, i32 0, i32 2
  %29 = load i8, ptr %28, align 8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %60

31:                                               ; preds = %17
  %32 = load ptr, ptr %6, align 8
  %33 = call i64 @strlen(ptr noundef %32) #11
  %34 = add i64 %33, 1
  %35 = call ptr @malloc(i64 noundef %34) #10
  %36 = load ptr, ptr %10, align 8
  %37 = getelementptr inbounds nuw %struct.item_var, ptr %36, i32 0, i32 0
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = getelementptr inbounds nuw %struct.item_var, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = load ptr, ptr %10, align 8
  %43 = getelementptr inbounds nuw %struct.item_var, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = call i64 @llvm.objectsize.i64.p0(ptr %44, i1 false, i1 true, i1 false)
  %46 = call ptr @__strcpy_chk(ptr noundef %40, ptr noundef %41, i64 noundef %45) #11
  %47 = load ptr, ptr %7, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %53

49:                                               ; preds = %31
  %50 = load ptr, ptr %7, align 8
  %51 = load ptr, ptr %10, align 8
  %52 = getelementptr inbounds nuw %struct.item_var, ptr %51, i32 0, i32 1
  store ptr %50, ptr %52, align 8
  br label %53

53:                                               ; preds = %49, %31
  %54 = load ptr, ptr %10, align 8
  %55 = getelementptr inbounds nuw %struct.item_var, ptr %54, i32 0, i32 2
  store i8 0, ptr %55, align 8
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds nuw %struct.s_global, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %57, align 4
  store i1 true, ptr %4, align 1
  br label %81

60:                                               ; preds = %17
  %61 = load ptr, ptr %10, align 8
  %62 = getelementptr inbounds nuw %struct.item_var, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = call i32 @strcmp(ptr noundef %63, ptr noundef %64) #11
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %75

67:                                               ; preds = %60
  %68 = load ptr, ptr %7, align 8
  %69 = icmp ne ptr %68, null
  br i1 %69, label %70, label %74

70:                                               ; preds = %67
  %71 = load ptr, ptr %7, align 8
  %72 = load ptr, ptr %10, align 8
  %73 = getelementptr inbounds nuw %struct.item_var, ptr %72, i32 0, i32 1
  store ptr %71, ptr %73, align 8
  br label %74

74:                                               ; preds = %70, %67
  store i1 true, ptr %4, align 1
  br label %81

75:                                               ; preds = %60
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %9, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %9, align 4
  br label %11, !llvm.loop !51

80:                                               ; preds = %11
  store i1 false, ptr %4, align 1
  br label %81

81:                                               ; preds = %80, %74, %53
  %82 = load i1, ptr %4, align 1
  ret i1 %82
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @global_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %37, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.s_global, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %40

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.s_global, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.item_var, ptr %13, i64 %15
  %17 = getelementptr inbounds nuw %struct.item_var, ptr %16, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %36, label %20

20:                                               ; preds = %10
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.s_global, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.item_var, ptr %23, i64 %25
  %27 = getelementptr inbounds nuw %struct.item_var, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.s_global, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item_var, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.item_var, ptr %34, i32 0, i32 2
  store i8 1, ptr %35, align 8
  br label %36

36:                                               ; preds = %20, %10
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %4, !llvm.loop !52

40:                                               ; preds = %4
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.s_global, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds nuw %struct.s_global, ptr %44, i32 0, i32 2
  store ptr null, ptr %45, align 8
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds nuw %struct.s_global, ptr %46, i32 0, i32 0
  store i32 0, ptr %47, align 8
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds nuw %struct.s_global, ptr %48, i32 0, i32 1
  store i32 0, ptr %49, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @local_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %37, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.s_global, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %40

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.s_global, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.item_var, ptr %13, i64 %15
  %17 = getelementptr inbounds nuw %struct.item_var, ptr %16, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %36, label %20

20:                                               ; preds = %10
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.s_global, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.item_var, ptr %23, i64 %25
  %27 = getelementptr inbounds nuw %struct.item_var, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.s_global, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item_var, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.item_var, ptr %34, i32 0, i32 2
  store i8 1, ptr %35, align 8
  br label %36

36:                                               ; preds = %20, %10
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %4, !llvm.loop !53

40:                                               ; preds = %4
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.s_global, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds nuw %struct.s_global, ptr %44, i32 0, i32 2
  store ptr null, ptr %45, align 8
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds nuw %struct.s_global, ptr %46, i32 0, i32 0
  store i32 0, ptr %47, align 8
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds nuw %struct.s_global, ptr %48, i32 0, i32 1
  store i32 0, ptr %49, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @symt_stack_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SymtStack, ptr %3, i32 0, i32 1
  store i32 -1, ptr %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symt_stack_is_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SymtStack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, -1
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symt_stack_is_full(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SymtStack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 126
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @symt_stack_items_count(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SymtStack, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = add nsw i32 %5, 1
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symt_stack_push(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @symt_stack_is_full(ptr noundef %6)
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i1 false, ptr %3, align 1
  br label %19

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.SymtStack, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.SymtStack, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [127 x ptr], ptr %12, i64 0, i64 %17
  store ptr %10, ptr %18, align 8
  store i1 true, ptr %3, align 1
  br label %19

19:                                               ; preds = %9, %8
  %20 = load i1, ptr %3, align 1
  ret i1 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symt_stack_pop(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call zeroext i1 @symt_stack_is_empty(ptr noundef %4)
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.SymtStack, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = add nsw i32 %10, -1
  store i32 %11, ptr %9, align 8
  store i1 true, ptr %2, align 1
  br label %12

12:                                               ; preds = %7, %6
  %13 = load i1, ptr %2, align 1
  ret i1 %13
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @symt_stack_peak(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.SymtStack, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp sgt i32 %8, %11
  br i1 %12, label %13, label %16

13:                                               ; preds = %7, %2
  %14 = load ptr, ptr @__stderrp, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.349) #11
  br label %16

16:                                               ; preds = %13, %7
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.SymtStack, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [127 x ptr], ptr %18, i64 0, i64 %20
  %22 = load ptr, ptr %21, align 8
  ret ptr %22
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @create_local_table(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = call ptr @malloc(i64 noundef 16) #10
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %17

9:                                                ; preds = %1
  %10 = load ptr, ptr %4, align 8
  call void @local_init(ptr noundef %10)
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call zeroext i1 @symt_stack_push(ptr noundef %11, ptr noundef %12)
  br i1 %13, label %16, label %14

14:                                               ; preds = %9
  %15 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %15)
  store i1 false, ptr %2, align 1
  br label %17

16:                                               ; preds = %9
  store i1 true, ptr %2, align 1
  br label %17

17:                                               ; preds = %16, %14, %8
  %18 = load i1, ptr %2, align 1
  ret i1 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @dispose_local_table(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SymtStack, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.SymtStack, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [127 x ptr], ptr %4, i64 0, i64 %8
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = call zeroext i1 @symt_stack_pop(ptr noundef %11)
  ret i1 %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @create_func(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = call ptr @malloc(i64 noundef 24) #10
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %12, %2
  %14 = load ptr, ptr %6, align 8
  call void @string_init(ptr noundef %14)
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %5, align 8
  call void @string_concat(ptr noundef %15, ptr noundef %16)
  %17 = call ptr @malloc(i64 noundef 48) #10
  store ptr %17, ptr %7, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  store ptr null, ptr %3, align 8
  br label %61

21:                                               ; preds = %13
  %22 = call ptr @malloc(i64 noundef 1024) #10
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %21
  store ptr null, ptr %3, align 8
  br label %61

26:                                               ; preds = %21
  %27 = load ptr, ptr %8, align 8
  call void @symt_stack_init(ptr noundef %27)
  %28 = load ptr, ptr %8, align 8
  %29 = call zeroext i1 @create_local_table(ptr noundef %28)
  br i1 %29, label %31, label %30

30:                                               ; preds = %26
  store ptr null, ptr %3, align 8
  br label %61

31:                                               ; preds = %26
  %32 = load ptr, ptr %6, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds nuw %struct.Function, ptr %33, i32 0, i32 0
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr %8, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds nuw %struct.Function, ptr %36, i32 0, i32 5
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds nuw %struct.Function, ptr %38, i32 0, i32 4
  store i32 0, ptr %39, align 8
  %40 = load ptr, ptr %7, align 8
  %41 = getelementptr inbounds nuw %struct.Function, ptr %40, i32 0, i32 6
  store i32 0, ptr %41, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.Function, ptr %42, i32 0, i32 6
  store i32 0, ptr %43, align 8
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds nuw %struct.Function, ptr %44, i32 0, i32 1
  store i8 0, ptr %45, align 8
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds nuw %struct.Function, ptr %46, i32 0, i32 3
  store ptr null, ptr %47, align 8
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds nuw %struct.Function, ptr %48, i32 0, i32 7
  store i8 0, ptr %49, align 4
  %50 = load ptr, ptr %7, align 8
  %51 = getelementptr inbounds nuw %struct.Function, ptr %50, i32 0, i32 8
  store i8 1, ptr %51, align 1
  %52 = load ptr, ptr %4, align 8
  %53 = load ptr, ptr %7, align 8
  %54 = getelementptr inbounds nuw %struct.Function, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds nuw %struct.String, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load ptr, ptr %7, align 8
  %59 = call zeroext i1 @global_insert(ptr noundef %52, ptr noundef %57, ptr noundef %58)
  %60 = load ptr, ptr %7, align 8
  store ptr %60, ptr %3, align 8
  br label %61

61:                                               ; preds = %31, %30, %25, %20
  %62 = load ptr, ptr %3, align 8
  ret ptr %62
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @create_var(ptr noundef %0, ptr noundef %1, i1 noundef zeroext %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  %11 = zext i1 %2 to i8
  store i8 %11, ptr %7, align 1
  %12 = call ptr @malloc(i64 noundef 24) #10
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %53

16:                                               ; preds = %3
  %17 = load ptr, ptr %8, align 8
  call void @string_init(ptr noundef %17)
  %18 = load ptr, ptr %8, align 8
  %19 = load ptr, ptr %6, align 8
  call void @string_concat(ptr noundef %18, ptr noundef %19)
  %20 = call ptr @malloc(i64 noundef 32) #10
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %16
  store ptr null, ptr %4, align 8
  br label %53

24:                                               ; preds = %16
  %25 = load ptr, ptr %8, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = getelementptr inbounds nuw %struct.Variable, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  %28 = load i8, ptr %7, align 1
  %29 = trunc i8 %28 to i1
  %30 = load ptr, ptr %9, align 8
  %31 = getelementptr inbounds nuw %struct.Variable, ptr %30, i32 0, i32 4
  %32 = zext i1 %29 to i8
  store i8 %32, ptr %31, align 1
  %33 = load ptr, ptr %9, align 8
  %34 = getelementptr inbounds nuw %struct.Variable, ptr %33, i32 0, i32 3
  store i8 0, ptr %34, align 8
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds nuw %struct.Variable, ptr %35, i32 0, i32 1
  store i32 4, ptr %36, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds nuw %struct.Variable, ptr %37, i32 0, i32 5
  store i8 0, ptr %38, align 2
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr inbounds nuw %struct.Variable, ptr %39, i32 0, i32 6
  store i8 0, ptr %40, align 1
  %41 = load ptr, ptr %5, align 8
  %42 = load ptr, ptr %8, align 8
  %43 = getelementptr inbounds nuw %struct.String, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = call zeroext i1 @local_insert(ptr noundef %41, ptr noundef %44, ptr noundef %45)
  %47 = zext i1 %46 to i8
  store i8 %47, ptr %10, align 1
  %48 = load i8, ptr %10, align 1
  %49 = trunc i8 %48 to i1
  br i1 %49, label %51, label %50

50:                                               ; preds = %24
  store ptr null, ptr %4, align 8
  br label %53

51:                                               ; preds = %24
  %52 = load ptr, ptr %9, align 8
  store ptr %52, ptr %4, align 8
  br label %53

53:                                               ; preds = %51, %50, %23, %15
  %54 = load ptr, ptr %4, align 8
  ret ptr %54
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @search_scope(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SymtStack, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %6, align 4
  br label %10

10:                                               ; preds = %26, %2
  %11 = load i32, ptr %6, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.SymtStack, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [127 x ptr], ptr %15, i64 0, i64 %17
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = call ptr @local_search(ptr noundef %19, ptr noundef %20)
  store ptr %21, ptr %5, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %13
  br label %29

25:                                               ; preds = %13
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, -1
  store i32 %28, ptr %6, align 4
  br label %10, !llvm.loop !54

29:                                               ; preds = %24, %10
  %30 = load ptr, ptr %5, align 8
  ret ptr %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @all_vars_used(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %38, %1
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.s_global, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %41

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.s_global, ptr %13, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.item_var, ptr %15, i64 %17
  store ptr %18, ptr %5, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.item_var, ptr %19, i32 0, i32 2
  %21 = load i8, ptr %20, align 8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %24, label %23

23:                                               ; preds = %12
  br label %24

24:                                               ; preds = %23, %12
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.item_var, ptr %25, i32 0, i32 2
  %27 = load i8, ptr %26, align 8
  %28 = trunc i8 %27 to i1
  br i1 %28, label %37, label %29

29:                                               ; preds = %24
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds nuw %struct.item_var, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds nuw %struct.Variable, ptr %32, i32 0, i32 5
  %34 = load i8, ptr %33, align 2
  %35 = trunc i8 %34 to i1
  br i1 %35, label %37, label %36

36:                                               ; preds = %29
  store i1 false, ptr %2, align 1
  br label %42

37:                                               ; preds = %29, %24
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %4, align 4
  br label %6, !llvm.loop !55

41:                                               ; preds = %6
  store i1 true, ptr %2, align 1
  br label %42

42:                                               ; preds = %41, %36
  %43 = load i1, ptr %2, align 1
  ret i1 %43
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #1 = { allocsize(0) "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #2 = { "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #3 = { nounwind "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { noreturn "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { allocsize(1) "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nounwind willreturn memory(read) "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a" }
attributes #10 = { allocsize(0) }
attributes #11 = { nounwind }
attributes #12 = { noreturn }
attributes #13 = { allocsize(1) }
attributes #14 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Homebrew clang version 22.1.8"}
!1 = !{i32 2, !"SDK Version", [2 x i32] [i32 26, i32 1]}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 4}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
