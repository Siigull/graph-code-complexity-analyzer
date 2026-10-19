; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx26.0.0"

%struct.generator_core = type { ptr, ptr, ptr, ptr, i32, i32, i32, i32, %struct.symtable, %struct.symtable, ptr, i32, i32, ptr, i32, i32, ptr, ptr, ptr, i64, i64 }
%struct.symtable = type { ptr, i32 }
%struct.symbol_info = type { ptr, i32, i32, i8, ptr, i32, i32 }
%struct.StackNode = type { ptr, ptr }
%struct.TokenArray = type { ptr, i32, i32 }
%struct.Token = type { i32, ptr }
%struct.parser_info = type { i8, i32, %struct.Token, %struct.symtable, %struct.symtable, ptr, %struct.symbol_info }
%struct.param = type { ptr, i32, ptr }
%struct.Node = type { ptr, ptr, ptr, ptr, i32 }

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"JUMP $$main\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"LABEL $$main\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"CREATEFRAME\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"CALL $main$0\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"CLEARS\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"EXIT int@0\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c".IFJcode25\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"LABEL %s\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"PUSHFRAME\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"POPFRAME\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@.str.16 = private unnamed_addr constant [22 x i8] c"# End of function: %s\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"DEFVAR TF@%%param%d\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"POPS TF@%%param%d\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"CALL %s\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"GF\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c"DEFVAR GF@%s\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"DEFVAR LF@%s\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"DEFVAR %s@%s\00", align 1
@.str.25 = private unnamed_addr constant [17 x i8] c"MOVE %s@%s %s@%s\00", align 1
@.str.26 = private unnamed_addr constant [12 x i8] c"PUSHS %s@%s\00", align 1
@.str.27 = private unnamed_addr constant [11 x i8] c"POPS %s@%s\00", align 1
@.str.28 = private unnamed_addr constant [13 x i8] c"PUSHS int@%d\00", align 1
@.str.29 = private unnamed_addr constant [15 x i8] c"PUSHS float@%a\00", align 1
@.str.30 = private unnamed_addr constant [14 x i8] c"PUSHS string@\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"\\%03d\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.33 = private unnamed_addr constant [14 x i8] c"PUSHS nil@nil\00", align 1
@.str.34 = private unnamed_addr constant [14 x i8] c"PUSHS bool@%s\00", align 1
@.str.35 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"ADDS\00", align 1
@.str.38 = private unnamed_addr constant [11 x i8] c"POPS GF@%s\00", align 1
@.str.39 = private unnamed_addr constant [25 x i8] c"CONCAT GF@%s GF@%s GF@%s\00", align 1
@.str.40 = private unnamed_addr constant [12 x i8] c"PUSHS GF@%s\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c"SUBS\00", align 1
@.str.42 = private unnamed_addr constant [5 x i8] c"MULS\00", align 1
@.str.43 = private unnamed_addr constant [19 x i8] c"MOVE GF@%s string@\00", align 1
@.str.44 = private unnamed_addr constant [17 x i8] c"MOVE GF@%s int@0\00", align 1
@.str.45 = private unnamed_addr constant [16 x i8] c"str_repeat_loop\00", align 1
@.str.46 = private unnamed_addr constant [15 x i8] c"str_repeat_end\00", align 1
@.str.47 = private unnamed_addr constant [21 x i8] c"LT GF@%s GF@%s GF@%s\00", align 1
@.str.48 = private unnamed_addr constant [29 x i8] c"JUMPIFEQ %s GF@%s bool@false\00", align 1
@.str.49 = private unnamed_addr constant [22 x i8] c"ADD GF@%s GF@%s int@1\00", align 1
@.str.50 = private unnamed_addr constant [8 x i8] c"JUMP %s\00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c"DIVS\00", align 1
@gen_int2floats.vars_declared = internal global i8 0, align 1
@.str.52 = private unnamed_addr constant [8 x i8] c"%conv_a\00", align 1
@.str.53 = private unnamed_addr constant [8 x i8] c"%conv_b\00", align 1
@.str.54 = private unnamed_addr constant [11 x i8] c"%type_temp\00", align 1
@.str.55 = private unnamed_addr constant [17 x i8] c"POPS GF@%%conv_a\00", align 1
@.str.56 = private unnamed_addr constant [17 x i8] c"POPS GF@%%conv_b\00", align 1
@.str.57 = private unnamed_addr constant [32 x i8] c"TYPE GF@%%type_temp GF@%%conv_b\00", align 1
@.str.58 = private unnamed_addr constant [53 x i8] c"JUMPIFEQ $skip_conv_b_%d GF@%%type_temp string@float\00", align 1
@.str.59 = private unnamed_addr constant [34 x i8] c"INT2FLOAT GF@%%conv_b GF@%%conv_b\00", align 1
@.str.60 = private unnamed_addr constant [22 x i8] c"LABEL $skip_conv_b_%d\00", align 1
@.str.61 = private unnamed_addr constant [32 x i8] c"TYPE GF@%%type_temp GF@%%conv_a\00", align 1
@.str.62 = private unnamed_addr constant [53 x i8] c"JUMPIFEQ $skip_conv_a_%d GF@%%type_temp string@float\00", align 1
@.str.63 = private unnamed_addr constant [34 x i8] c"INT2FLOAT GF@%%conv_a GF@%%conv_a\00", align 1
@.str.64 = private unnamed_addr constant [22 x i8] c"LABEL $skip_conv_a_%d\00", align 1
@.str.65 = private unnamed_addr constant [18 x i8] c"PUSHS GF@%%conv_b\00", align 1
@.str.66 = private unnamed_addr constant [18 x i8] c"PUSHS GF@%%conv_a\00", align 1
@.str.67 = private unnamed_addr constant [4 x i8] c"EQS\00", align 1
@.str.68 = private unnamed_addr constant [5 x i8] c"NOTS\00", align 1
@.str.69 = private unnamed_addr constant [4 x i8] c"LTS\00", align 1
@.str.70 = private unnamed_addr constant [4 x i8] c"GTS\00", align 1
@.str.71 = private unnamed_addr constant [8 x i8] c"is_true\00", align 1
@.str.72 = private unnamed_addr constant [7 x i8] c"is_end\00", align 1
@.str.73 = private unnamed_addr constant [17 x i8] c"TYPE GF@%s GF@%s\00", align 1
@.str.74 = private unnamed_addr constant [4 x i8] c"Num\00", align 1
@.str.75 = private unnamed_addr constant [29 x i8] c"JUMPIFEQ %s GF@%s string@int\00", align 1
@.str.76 = private unnamed_addr constant [31 x i8] c"JUMPIFEQ %s GF@%s string@float\00", align 1
@.str.77 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.78 = private unnamed_addr constant [32 x i8] c"JUMPIFEQ %s GF@%s string@string\00", align 1
@.str.79 = private unnamed_addr constant [5 x i8] c"Null\00", align 1
@.str.80 = private unnamed_addr constant [29 x i8] c"JUMPIFEQ %s GF@%s string@nil\00", align 1
@.str.81 = private unnamed_addr constant [17 x i8] c"PUSHS bool@false\00", align 1
@.str.82 = private unnamed_addr constant [16 x i8] c"PUSHS bool@true\00", align 1
@.str.83 = private unnamed_addr constant [13 x i8] c"JUMPIFEQS %s\00", align 1
@.str.84 = private unnamed_addr constant [14 x i8] c"JUMPIFNEQS %s\00", align 1
@.str.85 = private unnamed_addr constant [7 x i8] c"$%s_%d\00", align 1
@.str.86 = private unnamed_addr constant [10 x i8] c"$if_%d_%s\00", align 1
@.str.87 = private unnamed_addr constant [13 x i8] c"$while_%d_%s\00", align 1
@.str.88 = private unnamed_addr constant [4 x i8] c"$%s\00", align 1
@.str.89 = private unnamed_addr constant [9 x i8] c"%%tmp_%d\00", align 1
@.str.90 = private unnamed_addr constant [20 x i8] c"LABEL $Ifj_read_str\00", align 1
@.str.91 = private unnamed_addr constant [18 x i8] c"DEFVAR LF@%%value\00", align 1
@.str.92 = private unnamed_addr constant [23 x i8] c"READ LF@%%value string\00", align 1
@.str.93 = private unnamed_addr constant [17 x i8] c"PUSHS LF@%%value\00", align 1
@.str.94 = private unnamed_addr constant [20 x i8] c"LABEL $Ifj_read_num\00", align 1
@.str.95 = private unnamed_addr constant [17 x i8] c"DEFVAR LF@%%type\00", align 1
@.str.96 = private unnamed_addr constant [22 x i8] c"READ LF@%%value float\00", align 1
@.str.97 = private unnamed_addr constant [26 x i8] c"TYPE LF@%%type LF@%%value\00", align 1
@.str.98 = private unnamed_addr constant [48 x i8] c"JUMPIFEQ $read_num_valid LF@%%type string@float\00", align 1
@.str.99 = private unnamed_addr constant [24 x i8] c"MOVE LF@%%value nil@nil\00", align 1
@.str.100 = private unnamed_addr constant [22 x i8] c"LABEL $read_num_valid\00", align 1
@.str.101 = private unnamed_addr constant [17 x i8] c"LABEL $Ifj_write\00", align 1
@.str.102 = private unnamed_addr constant [21 x i8] c"DEFVAR LF@%%temp_int\00", align 1
@.str.103 = private unnamed_addr constant [23 x i8] c"DEFVAR LF@%%temp_float\00", align 1
@.str.104 = private unnamed_addr constant [27 x i8] c"TYPE LF@%%type LF@%%param0\00", align 1
@.str.105 = private unnamed_addr constant [51 x i8] c"JUMPIFEQ $write_check_float LF@%%type string@float\00", align 1
@.str.106 = private unnamed_addr constant [18 x i8] c"WRITE LF@%%param0\00", align 1
@.str.107 = private unnamed_addr constant [16 x i8] c"JUMP $write_end\00", align 1
@.str.108 = private unnamed_addr constant [25 x i8] c"LABEL $write_check_float\00", align 1
@.str.109 = private unnamed_addr constant [36 x i8] c"FLOAT2INT LF@%%temp_int LF@%%param0\00", align 1
@.str.110 = private unnamed_addr constant [40 x i8] c"INT2FLOAT LF@%%temp_float LF@%%temp_int\00", align 1
@.str.111 = private unnamed_addr constant [51 x i8] c"JUMPIFEQ $write_as_int LF@%%param0 LF@%%temp_float\00", align 1
@.str.112 = private unnamed_addr constant [20 x i8] c"LABEL $write_as_int\00", align 1
@.str.113 = private unnamed_addr constant [20 x i8] c"WRITE LF@%%temp_int\00", align 1
@.str.114 = private unnamed_addr constant [17 x i8] c"LABEL $write_end\00", align 1
@.str.115 = private unnamed_addr constant [17 x i8] c"LABEL $Ifj_floor\00", align 1
@.str.116 = private unnamed_addr constant [19 x i8] c"DEFVAR LF@%%result\00", align 1
@.str.117 = private unnamed_addr constant [41 x i8] c"JUMPIFEQ $floor_int LF@%%type string@int\00", align 1
@.str.118 = private unnamed_addr constant [45 x i8] c"JUMPIFEQ $floor_float LF@%%type string@float\00", align 1
@.str.119 = private unnamed_addr constant [14 x i8] c"JUMP $$$er_25\00", align 1
@.str.120 = private unnamed_addr constant [17 x i8] c"LABEL $floor_int\00", align 1
@.str.121 = private unnamed_addr constant [34 x i8] c"INT2FLOAT LF@%%result LF@%%param0\00", align 1
@.str.122 = private unnamed_addr constant [18 x i8] c"PUSHS LF@%%result\00", align 1
@.str.123 = private unnamed_addr constant [19 x i8] c"LABEL $floor_float\00", align 1
@.str.124 = private unnamed_addr constant [34 x i8] c"FLOAT2INT LF@%%result LF@%%param0\00", align 1
@.str.125 = private unnamed_addr constant [34 x i8] c"INT2FLOAT LF@%%result LF@%%result\00", align 1
@.str.126 = private unnamed_addr constant [15 x i8] c"LABEL $Ifj_str\00", align 1
@.str.127 = private unnamed_addr constant [48 x i8] c"JUMPIFEQ $str_is_string LF@%%type string@string\00", align 1
@.str.128 = private unnamed_addr constant [42 x i8] c"JUMPIFEQ $str_is_int LF@%%type string@int\00", align 1
@.str.129 = private unnamed_addr constant [46 x i8] c"JUMPIFEQ $str_is_float LF@%%type string@float\00", align 1
@.str.130 = private unnamed_addr constant [42 x i8] c"JUMPIFEQ $str_is_nil LF@%%type string@nil\00", align 1
@.str.131 = private unnamed_addr constant [21 x i8] c"LABEL $str_is_string\00", align 1
@.str.132 = private unnamed_addr constant [29 x i8] c"MOVE LF@%%result LF@%%param0\00", align 1
@.str.133 = private unnamed_addr constant [14 x i8] c"JUMP $str_end\00", align 1
@.str.134 = private unnamed_addr constant [18 x i8] c"LABEL $str_is_int\00", align 1
@.str.135 = private unnamed_addr constant [32 x i8] c"INT2STR LF@%%result LF@%%param0\00", align 1
@.str.136 = private unnamed_addr constant [20 x i8] c"LABEL $str_is_float\00", align 1
@.str.137 = private unnamed_addr constant [34 x i8] c"FLOAT2STR LF@%%result LF@%%param0\00", align 1
@.str.138 = private unnamed_addr constant [18 x i8] c"LABEL $str_is_nil\00", align 1
@.str.139 = private unnamed_addr constant [29 x i8] c"MOVE LF@%%result string@null\00", align 1
@.str.140 = private unnamed_addr constant [15 x i8] c"LABEL $str_end\00", align 1
@.str.141 = private unnamed_addr constant [18 x i8] c"LABEL $Ifj_length\00", align 1
@.str.142 = private unnamed_addr constant [43 x i8] c"JUMPIFNEQ $$$er_25 LF@%%type string@string\00", align 1
@.str.143 = private unnamed_addr constant [31 x i8] c"STRLEN LF@%%result LF@%%param0\00", align 1
@.str.144 = private unnamed_addr constant [21 x i8] c"LABEL $Ifj_substring\00", align 1
@.str.145 = private unnamed_addr constant [16 x i8] c"DEFVAR LF@%%len\00", align 1
@.str.146 = private unnamed_addr constant [16 x i8] c"DEFVAR LF@%%idx\00", align 1
@.str.147 = private unnamed_addr constant [17 x i8] c"DEFVAR LF@%%char\00", align 1
@.str.148 = private unnamed_addr constant [27 x i8] c"TYPE LF@%%type LF@%%param1\00", align 1
@.str.149 = private unnamed_addr constant [40 x i8] c"JUMPIFNEQ $$$er_26 LF@%%type string@int\00", align 1
@.str.150 = private unnamed_addr constant [27 x i8] c"TYPE LF@%%type LF@%%param2\00", align 1
@.str.151 = private unnamed_addr constant [31 x i8] c"LT LF@%%type LF@%%param1 int@0\00", align 1
@.str.152 = private unnamed_addr constant [45 x i8] c"JUMPIFEQ $substring_null LF@%%type bool@true\00", align 1
@.str.153 = private unnamed_addr constant [31 x i8] c"LT LF@%%type LF@%%param2 int@0\00", align 1
@.str.154 = private unnamed_addr constant [37 x i8] c"GT LF@%%type LF@%%param1 LF@%%param2\00", align 1
@.str.155 = private unnamed_addr constant [28 x i8] c"STRLEN LF@%%len LF@%%param0\00", align 1
@.str.156 = private unnamed_addr constant [34 x i8] c"GT LF@%%type LF@%%param1 LF@%%len\00", align 1
@.str.157 = private unnamed_addr constant [34 x i8] c"LT LF@%%type LF@%%param2 LF@%%len\00", align 1
@.str.158 = private unnamed_addr constant [48 x i8] c"JUMPIFEQ $substring_extract LF@%%type bool@true\00", align 1
@.str.159 = private unnamed_addr constant [34 x i8] c"GT LF@%%type LF@%%param2 LF@%%len\00", align 1
@.str.160 = private unnamed_addr constant [25 x i8] c"LABEL $substring_extract\00", align 1
@.str.161 = private unnamed_addr constant [25 x i8] c"MOVE LF@%%result string@\00", align 1
@.str.162 = private unnamed_addr constant [26 x i8] c"MOVE LF@%%idx LF@%%param1\00", align 1
@.str.163 = private unnamed_addr constant [22 x i8] c"LABEL $substring_loop\00", align 1
@.str.164 = private unnamed_addr constant [46 x i8] c"JUMPIFEQ $substring_done LF@%%idx LF@%%param2\00", align 1
@.str.165 = private unnamed_addr constant [39 x i8] c"GETCHAR LF@%%char LF@%%param0 LF@%%idx\00", align 1
@.str.166 = private unnamed_addr constant [41 x i8] c"CONCAT LF@%%result LF@%%result LF@%%char\00", align 1
@.str.167 = private unnamed_addr constant [28 x i8] c"ADD LF@%%idx LF@%%idx int@1\00", align 1
@.str.168 = private unnamed_addr constant [21 x i8] c"JUMP $substring_loop\00", align 1
@.str.169 = private unnamed_addr constant [22 x i8] c"LABEL $substring_done\00", align 1
@.str.170 = private unnamed_addr constant [22 x i8] c"LABEL $substring_null\00", align 1
@.str.171 = private unnamed_addr constant [18 x i8] c"LABEL $Ifj_strcmp\00", align 1
@.str.172 = private unnamed_addr constant [37 x i8] c"LT LF@%%type LF@%%param0 LF@%%param1\00", align 1
@.str.173 = private unnamed_addr constant [42 x i8] c"JUMPIFEQ $strcmp_less LF@%%type bool@true\00", align 1
@.str.174 = private unnamed_addr constant [37 x i8] c"GT LF@%%type LF@%%param0 LF@%%param1\00", align 1
@.str.175 = private unnamed_addr constant [45 x i8] c"JUMPIFEQ $strcmp_greater LF@%%type bool@true\00", align 1
@.str.176 = private unnamed_addr constant [23 x i8] c"MOVE LF@%%result int@0\00", align 1
@.str.177 = private unnamed_addr constant [17 x i8] c"JUMP $strcmp_end\00", align 1
@.str.178 = private unnamed_addr constant [19 x i8] c"LABEL $strcmp_less\00", align 1
@.str.179 = private unnamed_addr constant [24 x i8] c"MOVE LF@%%result int@-1\00", align 1
@.str.180 = private unnamed_addr constant [22 x i8] c"LABEL $strcmp_greater\00", align 1
@.str.181 = private unnamed_addr constant [23 x i8] c"MOVE LF@%%result int@1\00", align 1
@.str.182 = private unnamed_addr constant [18 x i8] c"LABEL $strcmp_end\00", align 1
@.str.183 = private unnamed_addr constant [15 x i8] c"LABEL $Ifj_ord\00", align 1
@.str.184 = private unnamed_addr constant [39 x i8] c"JUMPIFEQ $ord_zero LF@%%type bool@true\00", align 1
@.str.185 = private unnamed_addr constant [34 x i8] c"EQ LF@%%type LF@%%param1 LF@%%len\00", align 1
@.str.186 = private unnamed_addr constant [45 x i8] c"STRI2INT LF@%%result LF@%%param0 LF@%%param1\00", align 1
@.str.187 = private unnamed_addr constant [16 x i8] c"LABEL $ord_zero\00", align 1
@.str.188 = private unnamed_addr constant [19 x i8] c"PUSHS float@0x0p+0\00", align 1
@.str.189 = private unnamed_addr constant [15 x i8] c"LABEL $Ifj_chr\00", align 1
@.str.190 = private unnamed_addr constant [20 x i8] c"DEFVAR LF@%%int_val\00", align 1
@.str.191 = private unnamed_addr constant [39 x i8] c"JUMPIFEQ $chr_int LF@%%type string@int\00", align 1
@.str.192 = private unnamed_addr constant [43 x i8] c"JUMPIFEQ $chr_float LF@%%type string@float\00", align 1
@.str.193 = private unnamed_addr constant [14 x i8] c"JUMP $$$er_26\00", align 1
@.str.194 = private unnamed_addr constant [17 x i8] c"LABEL $chr_float\00", align 1
@.str.195 = private unnamed_addr constant [35 x i8] c"FLOAT2INT LF@%%int_val LF@%%param0\00", align 1
@.str.196 = private unnamed_addr constant [35 x i8] c"INT2FLOAT LF@%%result LF@%%int_val\00", align 1
@.str.197 = private unnamed_addr constant [43 x i8] c"JUMPIFNEQ $$$er_26 LF@%%param0 LF@%%result\00", align 1
@.str.198 = private unnamed_addr constant [18 x i8] c"JUMP $chr_convert\00", align 1
@.str.199 = private unnamed_addr constant [15 x i8] c"LABEL $chr_int\00", align 1
@.str.200 = private unnamed_addr constant [30 x i8] c"MOVE LF@%%int_val LF@%%param0\00", align 1
@.str.201 = private unnamed_addr constant [19 x i8] c"LABEL $chr_convert\00", align 1
@.str.202 = private unnamed_addr constant [34 x i8] c"INT2CHAR LF@%%result LF@%%int_val\00", align 1
@.str.203 = private unnamed_addr constant [15 x i8] c"LABEL $$$er_25\00", align 1
@.str.204 = private unnamed_addr constant [12 x i8] c"EXIT int@26\00", align 1
@.str.205 = private unnamed_addr constant [15 x i8] c"LABEL $$$er_26\00", align 1
@.str.206 = private unnamed_addr constant [12 x i8] c"EXIT int@25\00", align 1
@.str.207 = private unnamed_addr constant [33 x i8] c"Failed to create temporary file\0A\00", align 1
@__stdoutp = external global ptr, align 8
@precedence_matrix = global [14 x [14 x i8]] [[14 x i8] c"<=<<<<<<<<<<<E", [14 x i8] c"EEEEEEEEEEEEEE", [14 x i8] c"<>>>>>>>>>>>>>", [14 x i8] c"<>>>>>>>>>>>>>", [14 x i8] c"<><<>>>>>>>>>>", [14 x i8] c"<><<>>>>>>>>>>", [14 x i8] c"<><<<<>>>>>>>>", [14 x i8] c"<><<<<>>>>>>>>", [14 x i8] c"<><<<<>>>>>>>>", [14 x i8] c"<><<<<>>>>>>>>", [14 x i8] c"<><<<<<<<<>>>>", [14 x i8] c"<><<<<<<<<<>>>", [14 x i8] c"<><<<<<<<<<>>>", [14 x i8] c"<E<<<<<<<<<<<A"], align 1
@__stderrp = external global ptr, align 8
@.str.311 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1.312 = private unnamed_addr constant [40 x i8] c"This also caused the following errors:\0A\00", align 1
@.str.2.313 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.3.310 = private unnamed_addr constant [20 x i8] c"[SCANNER ERROR]: %s\00", align 1
@.str.4.210 = private unnamed_addr constant [41 x i8] c"[SEMATIC ERROR] Missing function 'main' \00", align 1
@.str.5.211 = private unnamed_addr constant [42 x i8] c"[SEMATIC ERROR] Undefined function called\00", align 1
@.str.6.212 = private unnamed_addr constant [45 x i8] c"[SYNTAX ERROR] Missing import in RULE_PROLOG\00", align 1
@.str.7.213 = private unnamed_addr constant [6 x i8] c"ifj25\00", align 1
@.str.8.214 = private unnamed_addr constant [53 x i8] c"[SYNTAX ERROR] Missing string 'ifj25' in RULE_PROLOG\00", align 1
@.str.9.215 = private unnamed_addr constant [42 x i8] c"[SYNTAX ERROR] Missing for in RULE_PROLOG\00", align 1
@.str.10.216 = private unnamed_addr constant [48 x i8] c"[SYNTAX ERROR] Missing token ifj in RULE_PROLOG\00", align 1
@.str.11.217 = private unnamed_addr constant [51 x i8] c"[SYNTAX ERROR] Missing token Class in RULE_PROGRAM\00", align 1
@.str.12.218 = private unnamed_addr constant [8 x i8] c"Program\00", align 1
@.str.13.219 = private unnamed_addr constant [58 x i8] c"[SYNTAX ERROR] Missing identifier Program in RULE_PROGRAM\00", align 1
@.str.14.220 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing '{' in RULE_PROGRAM\00", align 1
@.str.15.221 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing '}' in RULE_PROGRAM\00", align 1
@.str.16.222 = private unnamed_addr constant [52 x i8] c"[SYNTAX ERROR] Is not EOF after end of RULE_PROGRAM\00", align 1
@.str.17.223 = private unnamed_addr constant [41 x i8] c"[SYNTAX ERROR] Missing '{' in RULE_BLOCK\00", align 1
@.str.18.224 = private unnamed_addr constant [70 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when creating local scope\00", align 1
@.str.19.225 = private unnamed_addr constant [73 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing local scope\00", align 1
@.str.20.226 = private unnamed_addr constant [46 x i8] c"[SYNTAX ERROR] Unexpected token in RULE_CLASS\00", align 1
@.str.21.227 = private unnamed_addr constant [42 x i8] c"[SYNTAX ERROR] Return outside of function\00", align 1
@.str.22.228 = private unnamed_addr constant [50 x i8] c"[SYNTAX ERROR] Unexpected token in RULE_NEXT_CODE\00", align 1
@.str.23.229 = private unnamed_addr constant [38 x i8] c"[SYNTAX ERROR] Missing '(' in RULE_IF\00", align 1
@gen_core = global ptr null, align 8
@.str.24.230 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.25.231 = private unnamed_addr constant [4 x i8] c"end\00", align 1
@.str.26.232 = private unnamed_addr constant [38 x i8] c"[SYNTAX ERROR] Missing ')' in RULE_IF\00", align 1
@.str.27.233 = private unnamed_addr constant [45 x i8] c"[SYNTAX ERROR] Missing token else in RULE_IF\00", align 1
@.str.28.234 = private unnamed_addr constant [41 x i8] c"[SYNTAX ERROR] Missing '(' in RULE_WHILE\00", align 1
@.str.29.235 = private unnamed_addr constant [6 x i8] c"start\00", align 1
@.str.30.236 = private unnamed_addr constant [41 x i8] c"[SYNTAX ERROR] Missing ')' in RULE_WHILE\00", align 1
@.str.31.237 = private unnamed_addr constant [68 x i8] c"[SYNTAX ERROR] Definition of function inside definition of function\00", align 1
@.str.32.238 = private unnamed_addr constant [73 x i8] c"[SYNTAX ERROR] Missing identificator after STATIC keyword in RULE_STATIC\00", align 1
@.str.33.239 = private unnamed_addr constant [71 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing func_info\00", align 1
@.str.34.240 = private unnamed_addr constant [60 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for getter_name\00", align 1
@.str.35.241 = private unnamed_addr constant [8 x i8] c"$get_%s\00", align 1
@.str.36.242 = private unnamed_addr constant [60 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for setter_name\00", align 1
@.str.37.243 = private unnamed_addr constant [8 x i8] c"$set_%s\00", align 1
@.str.38.244 = private unnamed_addr constant [74 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing combined_key\00", align 1
@.str.39.245 = private unnamed_addr constant [6 x i8] c"%s$%d\00", align 1
@.str.40.246 = private unnamed_addr constant [66 x i8] c"[SEMATIC ERROR] Inserting function in symtable failed RULE_STATIC\00", align 1
@.str.41.247 = private unnamed_addr constant [72 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing func_scope\00", align 1
@.str.42.248 = private unnamed_addr constant [66 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for mangled_func_name\00", align 1
@.str.43.249 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.44.250 = private unnamed_addr constant [10 x i8] c"%%param%d\00", align 1
@.str.45.251 = private unnamed_addr constant [74 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing getter_scope\00", align 1
@.str.46.252 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing '(' in RULE_DEFSETR\00", align 1
@.str.47.253 = private unnamed_addr constant [74 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing setter_scope\00", align 1
@.str.48.254 = private unnamed_addr constant [71 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing parameter\00", align 1
@.str.49.255 = private unnamed_addr constant [53 x i8] c"[SYNTAX ERROR] Missing identificator in RULE_DEFSETR\00", align 1
@.str.50.256 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing ')' in RULE_DEFSETR\00", align 1
@.str.51.257 = private unnamed_addr constant [54 x i8] c"[SYNTAX ERROR] Something failed in setter declaration\00", align 1
@.str.52.258 = private unnamed_addr constant [74 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing param_symbol\00", align 1
@.str.53.259 = private unnamed_addr constant [54 x i8] c"[SEMATIC ERROR] Inserting variable in symtable failed\00", align 1
@.str.54.260 = private unnamed_addr constant [59 x i8] c"[SYNTAX ERROR] Unexpected parameter in function definition\00", align 1
@.str.55.261 = private unnamed_addr constant [78 x i8] c"[SYNTAX ERROR] Unexpected parameter in function definition (RULE_PARAMS_DEFC)\00", align 1
@.str.56.262 = private unnamed_addr constant [73 x i8] c"[SEMATIC ERROR] Inserting variable in symtable failed - RULE_PARAMS_DEFC\00", align 1
@.str.57.263 = private unnamed_addr constant [62 x i8] c"[SYNTAX ERROR] No identifier after keyword VAR in RULE_DEFVAR\00", align 1
@.str.58.264 = private unnamed_addr constant [57 x i8] c"[SEMATIC ERROR] Redefinition of a variable - RULE_DEFVAR\00", align 1
@.str.59.265 = private unnamed_addr constant [70 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing var_info\00", align 1
@.str.60.266 = private unnamed_addr constant [68 x i8] c"[SEMATIC ERROR] Inserting variable in symtable failed - RULE_DEFVAR\00", align 1
@.str.61.267 = private unnamed_addr constant [53 x i8] c"[SEMATIC ERROR] Variable does not exist in any scope\00", align 1
@.str.62.268 = private unnamed_addr constant [50 x i8] c"[SYNTAX ERROR] No assign token '=' in RULE_ASSIGN\00", align 1
@.str.63.269 = private unnamed_addr constant [3 x i8] c"GF\00", align 1
@.str.64.270 = private unnamed_addr constant [66 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing temp\00", align 1
@.str.65.271 = private unnamed_addr constant [60 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for temp->value\00", align 1
@.str.66.272 = private unnamed_addr constant [68 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for mangled_lookup_name\00", align 1
@.str.67.273 = private unnamed_addr constant [61 x i8] c"[UNEXPECTED ERROR] Memory allocation failed for mangled_name\00", align 1
@.str.68.274 = private unnamed_addr constant [49 x i8] c"[SYNTAX ERROR] Missing token IFJ in RULE_IFJCALL\00", align 1
@.str.69.275 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing dot in RULE_IFJCALL\00", align 1
@.str.70.276 = private unnamed_addr constant [42 x i8] c"[SYNTAX ERROR] Missing ID in RULE_IFJCALL\00", align 1
@.str.71.277 = private unnamed_addr constant [43 x i8] c"[SYNTAX ERROR] Missing '(' in RULE_IFJCALL\00", align 1
@.str.72.278 = private unnamed_addr constant [68 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing s_info\00", align 1
@.str.73.279 = private unnamed_addr constant [47 x i8] c"[SEMATIC ERROR] Invalid built-in function call\00", align 1
@.str.74.280 = private unnamed_addr constant [7 x i8] c"Ifj_%s\00", align 1
@.str.75.281 = private unnamed_addr constant [42 x i8] c"[SYNTAX ERROR] Missing '(' in RULE_PARAMS\00", align 1
@.str.76.282 = private unnamed_addr constant [67 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing param\00", align 1
@.str.77.283 = private unnamed_addr constant [42 x i8] c"[SYNTAX ERROR] Missing ')' in RULE_PARAMS\00", align 1
@.str.78.284 = private unnamed_addr constant [47 x i8] c"[SYNTAX ERROR] Unexpected token in RULE_PARAMS\00", align 1
@.str.79.285 = private unnamed_addr constant [48 x i8] c"[SYNTAX ERROR] Unexpected token in RULE_PARAMSC\00", align 1
@.str.80.286 = private unnamed_addr constant [53 x i8] c"[SYNTAX ERROR] Comma or ')' expected in RULE_PARAMSC\00", align 1
@.str.81.287 = private unnamed_addr constant [9 x i8] c"POPFRAME\00", align 1
@.str.82.288 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@.str.83.289 = private unnamed_addr constant [46 x i8] c"[SYNTAX ERROR] Mandatory newline check failed\00", align 1
@.str.84.290 = private unnamed_addr constant [71 x i8] c"[SYNTAX ERROR] Not-defined rule was called - probably check your code?\00", align 1
@.str.85.305 = private unnamed_addr constant [89 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing Tokenarray (form_expession)\00", align 1
@.str.86.306 = private unnamed_addr constant [84 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing Token (form_expession)\00", align 1
@.str.87.307 = private unnamed_addr constant [86 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when copying token value (form_expession)\00", align 1
@.str.88.308 = private unnamed_addr constant [57 x i8] c"[SYNTAX ERROR] Unexpected token passed in form_expession\00", align 1
@.str.89.309 = private unnamed_addr constant [88 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing end Token (form_expession)\00", align 1
@.str.90.301 = private unnamed_addr constant [101 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when allocating memory for symbol_info (token_to_symbol)\00", align 1
@.str.91.302 = private unnamed_addr constant [70 x i8] c"[SEMATIC ERROR] Undefined variable passed to token_to_symbol function\00", align 1
@.str.92.303 = private unnamed_addr constant [74 x i8] c"[SEMATIC ERROR] Uninitialized variable called to token_to_symbol function\00", align 1
@.str.93.304 = private unnamed_addr constant [80 x i8] c"[UNEXPECTED ERROR] ???????????????????????????????? token_to_symbol() is broken\00", align 1
@.str.94.295 = private unnamed_addr constant [83 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing result Token (reduce)\00", align 1
@.str.95.296 = private unnamed_addr constant [53 x i8] c"[SEMATIC ERROR] Type mismatch in expression (reduce)\00", align 1
@.str.96.297 = private unnamed_addr constant [4 x i8] c"Num\00", align 1
@.str.97.298 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.98.299 = private unnamed_addr constant [5 x i8] c"Null\00", align 1
@.str.99.300 = private unnamed_addr constant [38 x i8] c"unexprcted error in reduce (parser.c)\00", align 1
@.str.100.291 = private unnamed_addr constant [93 x i8] c"[UNEXPECTED ERROR] Memory allocation failed when initalizing start Token (expression_parser)\00", align 1
@.str.101.292 = private unnamed_addr constant [87 x i8] c"[SYNTAX ERROR] Reduction requires at least two terms in term.stack (expression_parser)\00", align 1
@.str.102.293 = private unnamed_addr constant [87 x i8] c"[SYNTAX ERROR] Error happened by invalid match in precedence table (expression_parser)\00", align 1
@.str.103.294 = private unnamed_addr constant [115 x i8] c"[SYNTAX ERROR] Upon completion, term.stack has at least two elements (or none?), should be one (expression_parser)\00", align 1
@.str.314 = private unnamed_addr constant [6 x i8] c"class\00", align 1
@.str.1.315 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.2.316 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.3.317 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.4.318 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.5.319 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@.str.6.320 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.7.321 = private unnamed_addr constant [4 x i8] c"Ifj\00", align 1
@.str.8.322 = private unnamed_addr constant [7 x i8] c"static\00", align 1
@.str.9.323 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@.str.10.324 = private unnamed_addr constant [4 x i8] c"for\00", align 1
@.str.11.325 = private unnamed_addr constant [4 x i8] c"Num\00", align 1
@.str.12.326 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.13.327 = private unnamed_addr constant [5 x i8] c"Null\00", align 1
@.str.14.328 = private unnamed_addr constant [5 x i8] c"null\00", align 1
@__stdinp = external global ptr, align 8
@.str.15.331 = private unnamed_addr constant [26 x i8] c"Invalid character after _\00", align 1
@.str.16.332 = private unnamed_addr constant [24 x i8] c"Memory allocation error\00", align 1
@.str.17.333 = private unnamed_addr constant [28 x i8] c"Invalid float number format\00", align 1
@.str.18.334 = private unnamed_addr constant [30 x i8] c"Unterminated multiline string\00", align 1
@.str.19.335 = private unnamed_addr constant [28 x i8] c"Unterminated string literal\00", align 1
@.str.20.336 = private unnamed_addr constant [37 x i8] c"Unexpected newline in string literal\00", align 1
@.str.21.337 = private unnamed_addr constant [53 x i8] c"Invalid hexadecimal number in string escape sequence\00", align 1
@.str.22.338 = private unnamed_addr constant [24 x i8] c"Invalid escape sequence\00", align 1
@.str.23.339 = private unnamed_addr constant [3 x i8] c"\\n\00", align 1
@.str.24.340 = private unnamed_addr constant [27 x i8] c"Unterminated block comment\00", align 1
@.str.25.341 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.26.342 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str.27.343 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.28.344 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.29.345 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.30.346 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.31.347 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.32.348 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.33.349 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.34.350 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.35.351 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.36.352 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@.str.37.353 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@.str.38.354 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@.str.39.355 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@.str.40.356 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@.str.41.357 = private unnamed_addr constant [2 x i8] c">\00", align 1
@.str.42.358 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@.str.43.359 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.44.360 = private unnamed_addr constant [19 x i8] c"Unknown token type\00", align 1
@.str.367 = private unnamed_addr constant [9 x i8] c"read_str\00", align 1
@.str.1.368 = private unnamed_addr constant [9 x i8] c"read_num\00", align 1
@.str.2.369 = private unnamed_addr constant [6 x i8] c"write\00", align 1
@.str.3.370 = private unnamed_addr constant [6 x i8] c"floor\00", align 1
@.str.4.371 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@.str.5.372 = private unnamed_addr constant [7 x i8] c"length\00", align 1
@.str.6.373 = private unnamed_addr constant [10 x i8] c"substring\00", align 1
@.str.7.374 = private unnamed_addr constant [7 x i8] c"strcmp\00", align 1
@.str.8.375 = private unnamed_addr constant [4 x i8] c"ord\00", align 1
@.str.9.376 = private unnamed_addr constant [4 x i8] c"chr\00", align 1
@.str.10.387 = private unnamed_addr constant [7 x i8] c"main$0\00", align 1
@.str.396 = private unnamed_addr constant [3 x i8] c"__\00", align 1
@.str.1.399 = private unnamed_addr constant [5 x i8] c"Ifj.\00", align 1
@.str.400 = private unnamed_addr constant [11 x i8] c"IDENTIFIER\00", align 1
@.str.1.401 = private unnamed_addr constant [18 x i8] c"GLOBAL_IDENTIFIER\00", align 1
@.str.2.402 = private unnamed_addr constant [4 x i8] c"INT\00", align 1
@.str.3.403 = private unnamed_addr constant [6 x i8] c"FLOAT\00", align 1
@.str.4.404 = private unnamed_addr constant [7 x i8] c"STRING\00", align 1
@.str.5.405 = private unnamed_addr constant [13 x i8] c"NULL_LITERAL\00", align 1
@.str.6.406 = private unnamed_addr constant [6 x i8] c"CLASS\00", align 1
@.str.7.407 = private unnamed_addr constant [3 x i8] c"IF\00", align 1
@.str.8.408 = private unnamed_addr constant [5 x i8] c"ELSE\00", align 1
@.str.9.409 = private unnamed_addr constant [3 x i8] c"IS\00", align 1
@.str.10.410 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@.str.11.411 = private unnamed_addr constant [4 x i8] c"VAR\00", align 1
@.str.12.412 = private unnamed_addr constant [6 x i8] c"WHILE\00", align 1
@.str.13.413 = private unnamed_addr constant [4 x i8] c"IFJ\00", align 1
@.str.14.414 = private unnamed_addr constant [7 x i8] c"STATIC\00", align 1
@.str.15.415 = private unnamed_addr constant [7 x i8] c"IMPORT\00", align 1
@.str.16.416 = private unnamed_addr constant [4 x i8] c"FOR\00", align 1
@.str.17.417 = private unnamed_addr constant [9 x i8] c"NUM_TYPE\00", align 1
@.str.18.418 = private unnamed_addr constant [12 x i8] c"STRING_TYPE\00", align 1
@.str.19.419 = private unnamed_addr constant [10 x i8] c"NULL_TYPE\00", align 1
@.str.20.420 = private unnamed_addr constant [5 x i8] c"PLUS\00", align 1
@.str.21.421 = private unnamed_addr constant [6 x i8] c"MINUS\00", align 1
@.str.22.422 = private unnamed_addr constant [4 x i8] c"MUL\00", align 1
@.str.23.423 = private unnamed_addr constant [4 x i8] c"DIV\00", align 1
@.str.24.424 = private unnamed_addr constant [7 x i8] c"ASSIGN\00", align 1
@.str.25.425 = private unnamed_addr constant [3 x i8] c"EQ\00", align 1
@.str.26.426 = private unnamed_addr constant [4 x i8] c"NEQ\00", align 1
@.str.27.427 = private unnamed_addr constant [3 x i8] c"LT\00", align 1
@.str.28.428 = private unnamed_addr constant [3 x i8] c"GT\00", align 1
@.str.29.429 = private unnamed_addr constant [4 x i8] c"LTE\00", align 1
@.str.30.430 = private unnamed_addr constant [4 x i8] c"GTE\00", align 1
@.str.31.431 = private unnamed_addr constant [7 x i8] c"LPAREN\00", align 1
@.str.32.432 = private unnamed_addr constant [7 x i8] c"RPAREN\00", align 1
@.str.33.433 = private unnamed_addr constant [7 x i8] c"LBRACE\00", align 1
@.str.34.434 = private unnamed_addr constant [7 x i8] c"RBRACE\00", align 1
@.str.35.435 = private unnamed_addr constant [6 x i8] c"COMMA\00", align 1
@.str.36.436 = private unnamed_addr constant [4 x i8] c"DOT\00", align 1
@.str.37.437 = private unnamed_addr constant [4 x i8] c"EOL\00", align 1
@.str.38.438 = private unnamed_addr constant [4 x i8] c"EOF\00", align 1
@.str.39.439 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str.40.440 = private unnamed_addr constant [8 x i8] c"UNKNOWN\00", align 1
@.str.41.441 = private unnamed_addr constant [6 x i8] c"%-15s\00", align 1
@.str.42.442 = private unnamed_addr constant [6 x i8] c" : %s\00", align 1
@.str.43.443 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @generator_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call ptr @malloc(i64 noundef 152) #11
  store ptr %3, ptr @gen_core, align 8
  %4 = load ptr, ptr @gen_core, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  call void @internal_error()
  br label %69

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = load ptr, ptr @gen_core, align 8
  %10 = getelementptr inbounds %struct.generator_core, ptr %9, i32 0, i32 0
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr @gen_core, align 8
  %12 = getelementptr inbounds %struct.generator_core, ptr %11, i32 0, i32 4
  store i32 0, ptr %12, align 8
  %13 = load ptr, ptr @gen_core, align 8
  %14 = getelementptr inbounds %struct.generator_core, ptr %13, i32 0, i32 5
  store i32 0, ptr %14, align 4
  %15 = load ptr, ptr @gen_core, align 8
  %16 = getelementptr inbounds %struct.generator_core, ptr %15, i32 0, i32 6
  store i32 0, ptr %16, align 8
  %17 = load ptr, ptr @gen_core, align 8
  %18 = getelementptr inbounds %struct.generator_core, ptr %17, i32 0, i32 7
  store i32 0, ptr %18, align 4
  %19 = load ptr, ptr @gen_core, align 8
  %20 = getelementptr inbounds %struct.generator_core, ptr %19, i32 0, i32 8
  call void @init_symtable(ptr noundef %20)
  %21 = load ptr, ptr @gen_core, align 8
  %22 = getelementptr inbounds %struct.generator_core, ptr %21, i32 0, i32 9
  call void @init_symtable(ptr noundef %22)
  %23 = load ptr, ptr @gen_core, align 8
  %24 = getelementptr inbounds %struct.generator_core, ptr %23, i32 0, i32 12
  store i32 10000, ptr %24, align 4
  %25 = load ptr, ptr @gen_core, align 8
  %26 = getelementptr inbounds %struct.generator_core, ptr %25, i32 0, i32 11
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr @gen_core, align 8
  %28 = getelementptr inbounds %struct.generator_core, ptr %27, i32 0, i32 12
  %29 = load i32, ptr %28, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 8, %30
  %32 = call ptr @malloc(i64 noundef %31) #11
  %33 = load ptr, ptr @gen_core, align 8
  %34 = getelementptr inbounds %struct.generator_core, ptr %33, i32 0, i32 10
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr @gen_core, align 8
  %36 = getelementptr inbounds %struct.generator_core, ptr %35, i32 0, i32 10
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %40, label %39

39:                                               ; preds = %7
  call void @internal_error()
  br label %69

40:                                               ; preds = %7
  %41 = load ptr, ptr @gen_core, align 8
  %42 = getelementptr inbounds %struct.generator_core, ptr %41, i32 0, i32 15
  store i32 10000, ptr %42, align 4
  %43 = load ptr, ptr @gen_core, align 8
  %44 = getelementptr inbounds %struct.generator_core, ptr %43, i32 0, i32 14
  store i32 0, ptr %44, align 8
  %45 = load ptr, ptr @gen_core, align 8
  %46 = getelementptr inbounds %struct.generator_core, ptr %45, i32 0, i32 15
  %47 = load i32, ptr %46, align 4
  %48 = sext i32 %47 to i64
  %49 = mul i64 8, %48
  %50 = call ptr @malloc(i64 noundef %49) #11
  %51 = load ptr, ptr @gen_core, align 8
  %52 = getelementptr inbounds %struct.generator_core, ptr %51, i32 0, i32 13
  store ptr %50, ptr %52, align 8
  %53 = load ptr, ptr @gen_core, align 8
  %54 = getelementptr inbounds %struct.generator_core, ptr %53, i32 0, i32 13
  %55 = load ptr, ptr %54, align 8
  %56 = icmp ne ptr %55, null
  br i1 %56, label %58, label %57

57:                                               ; preds = %40
  call void @internal_error()
  br label %69

58:                                               ; preds = %40
  %59 = load ptr, ptr @gen_core, align 8
  %60 = getelementptr inbounds %struct.generator_core, ptr %59, i32 0, i32 16
  store ptr null, ptr %60, align 8
  %61 = load ptr, ptr @gen_core, align 8
  %62 = getelementptr inbounds %struct.generator_core, ptr %61, i32 0, i32 17
  store ptr null, ptr %62, align 8
  %63 = load ptr, ptr @gen_core, align 8
  %64 = getelementptr inbounds %struct.generator_core, ptr %63, i32 0, i32 18
  store ptr null, ptr %64, align 8
  %65 = load ptr, ptr @gen_core, align 8
  %66 = getelementptr inbounds %struct.generator_core, ptr %65, i32 0, i32 19
  store i64 0, ptr %66, align 8
  %67 = load ptr, ptr @gen_core, align 8
  %68 = getelementptr inbounds %struct.generator_core, ptr %67, i32 0, i32 20
  store i64 10000, ptr %68, align 8
  call void @gen_start()
  br label %69

69:                                               ; preds = %58, %57, %39, %6
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @internal_error() #0 {
  call void @exit(i32 noundef 99) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_start() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.1)
  call void @gen_ifjcode25_builtin_functions()
  call void (ptr, ...) @printcode(ptr noundef @.str.2)
  call void (ptr, ...) @printcode(ptr noundef @.str.3)
  call void (ptr, ...) @printcode(ptr noundef @.str.4)
  call void (ptr, ...) @printcode(ptr noundef @.str.5)
  call void (ptr, ...) @printcode(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @printcode(ptr noundef %0, ...) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.va_start.p0(ptr %3)
  %4 = load ptr, ptr @gen_core, align 8
  %5 = getelementptr inbounds %struct.generator_core, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call i32 @vfprintf(ptr noundef %6, ptr noundef %7, ptr noundef %8) #13
  call void @llvm.va_end.p0(ptr %3)
  %10 = load ptr, ptr @gen_core, align 8
  %11 = getelementptr inbounds %struct.generator_core, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str) #13
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_ifjcode25_builtin_functions() #0 {
  call void @gen_builtin_readstr()
  call void @gen_builtin_readnum()
  call void @gen_builtin_write()
  call void @gen_builtin_floor()
  call void @gen_builtin_str()
  call void @gen_builtin_length()
  call void @gen_builtin_substring()
  call void @gen_builtin_ord()
  call void @gen_builtin_chr()
  call void @gen_builtin_strcmp()
  call void @gen_builtin_error_exits()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_readstr() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.90)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.91)
  call void (ptr, ...) @printcode(ptr noundef @.str.92)
  call void (ptr, ...) @printcode(ptr noundef @.str.93)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_readnum() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.94)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.91)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.96)
  call void (ptr, ...) @printcode(ptr noundef @.str.97)
  call void (ptr, ...) @printcode(ptr noundef @.str.98)
  call void (ptr, ...) @printcode(ptr noundef @.str.99)
  call void (ptr, ...) @printcode(ptr noundef @.str.100)
  call void (ptr, ...) @printcode(ptr noundef @.str.93)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_write() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.101)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.102)
  call void (ptr, ...) @printcode(ptr noundef @.str.103)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.105)
  call void (ptr, ...) @printcode(ptr noundef @.str.106)
  call void (ptr, ...) @printcode(ptr noundef @.str.107)
  call void (ptr, ...) @printcode(ptr noundef @.str.108)
  call void (ptr, ...) @printcode(ptr noundef @.str.109)
  call void (ptr, ...) @printcode(ptr noundef @.str.110)
  call void (ptr, ...) @printcode(ptr noundef @.str.111)
  call void (ptr, ...) @printcode(ptr noundef @.str.106)
  call void (ptr, ...) @printcode(ptr noundef @.str.107)
  call void (ptr, ...) @printcode(ptr noundef @.str.112)
  call void (ptr, ...) @printcode(ptr noundef @.str.113)
  call void (ptr, ...) @printcode(ptr noundef @.str.114)
  call void (ptr, ...) @printcode(ptr noundef @.str.33)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_floor() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.115)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.117)
  call void (ptr, ...) @printcode(ptr noundef @.str.118)
  call void (ptr, ...) @printcode(ptr noundef @.str.119)
  call void (ptr, ...) @printcode(ptr noundef @.str.120)
  call void (ptr, ...) @printcode(ptr noundef @.str.121)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  call void (ptr, ...) @printcode(ptr noundef @.str.123)
  call void (ptr, ...) @printcode(ptr noundef @.str.124)
  call void (ptr, ...) @printcode(ptr noundef @.str.125)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_str() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.126)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.127)
  call void (ptr, ...) @printcode(ptr noundef @.str.128)
  call void (ptr, ...) @printcode(ptr noundef @.str.129)
  call void (ptr, ...) @printcode(ptr noundef @.str.130)
  call void (ptr, ...) @printcode(ptr noundef @.str.131)
  call void (ptr, ...) @printcode(ptr noundef @.str.132)
  call void (ptr, ...) @printcode(ptr noundef @.str.133)
  call void (ptr, ...) @printcode(ptr noundef @.str.134)
  call void (ptr, ...) @printcode(ptr noundef @.str.135)
  call void (ptr, ...) @printcode(ptr noundef @.str.133)
  call void (ptr, ...) @printcode(ptr noundef @.str.136)
  call void (ptr, ...) @printcode(ptr noundef @.str.137)
  call void (ptr, ...) @printcode(ptr noundef @.str.133)
  call void (ptr, ...) @printcode(ptr noundef @.str.138)
  call void (ptr, ...) @printcode(ptr noundef @.str.139)
  call void (ptr, ...) @printcode(ptr noundef @.str.133)
  call void (ptr, ...) @printcode(ptr noundef @.str.140)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_length() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.141)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.142)
  call void (ptr, ...) @printcode(ptr noundef @.str.143)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_substring() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.144)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.145)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.146)
  call void (ptr, ...) @printcode(ptr noundef @.str.147)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.142)
  call void (ptr, ...) @printcode(ptr noundef @.str.148)
  call void (ptr, ...) @printcode(ptr noundef @.str.149)
  call void (ptr, ...) @printcode(ptr noundef @.str.150)
  call void (ptr, ...) @printcode(ptr noundef @.str.149)
  call void (ptr, ...) @printcode(ptr noundef @.str.151)
  call void (ptr, ...) @printcode(ptr noundef @.str.152)
  call void (ptr, ...) @printcode(ptr noundef @.str.153)
  call void (ptr, ...) @printcode(ptr noundef @.str.152)
  call void (ptr, ...) @printcode(ptr noundef @.str.154)
  call void (ptr, ...) @printcode(ptr noundef @.str.152)
  call void (ptr, ...) @printcode(ptr noundef @.str.155)
  call void (ptr, ...) @printcode(ptr noundef @.str.156)
  call void (ptr, ...) @printcode(ptr noundef @.str.152)
  call void (ptr, ...) @printcode(ptr noundef @.str.157)
  call void (ptr, ...) @printcode(ptr noundef @.str.158)
  call void (ptr, ...) @printcode(ptr noundef @.str.159)
  call void (ptr, ...) @printcode(ptr noundef @.str.152)
  call void (ptr, ...) @printcode(ptr noundef @.str.160)
  call void (ptr, ...) @printcode(ptr noundef @.str.161)
  call void (ptr, ...) @printcode(ptr noundef @.str.162)
  call void (ptr, ...) @printcode(ptr noundef @.str.163)
  call void (ptr, ...) @printcode(ptr noundef @.str.164)
  call void (ptr, ...) @printcode(ptr noundef @.str.165)
  call void (ptr, ...) @printcode(ptr noundef @.str.166)
  call void (ptr, ...) @printcode(ptr noundef @.str.167)
  call void (ptr, ...) @printcode(ptr noundef @.str.168)
  call void (ptr, ...) @printcode(ptr noundef @.str.169)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  call void (ptr, ...) @printcode(ptr noundef @.str.170)
  call void (ptr, ...) @printcode(ptr noundef @.str.33)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_ord() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.183)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.145)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.142)
  call void (ptr, ...) @printcode(ptr noundef @.str.148)
  call void (ptr, ...) @printcode(ptr noundef @.str.149)
  call void (ptr, ...) @printcode(ptr noundef @.str.155)
  call void (ptr, ...) @printcode(ptr noundef @.str.151)
  call void (ptr, ...) @printcode(ptr noundef @.str.184)
  call void (ptr, ...) @printcode(ptr noundef @.str.156)
  call void (ptr, ...) @printcode(ptr noundef @.str.184)
  call void (ptr, ...) @printcode(ptr noundef @.str.185)
  call void (ptr, ...) @printcode(ptr noundef @.str.184)
  call void (ptr, ...) @printcode(ptr noundef @.str.186)
  call void (ptr, ...) @printcode(ptr noundef @.str.125)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  call void (ptr, ...) @printcode(ptr noundef @.str.187)
  call void (ptr, ...) @printcode(ptr noundef @.str.188)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_chr() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.189)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.190)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.191)
  call void (ptr, ...) @printcode(ptr noundef @.str.192)
  call void (ptr, ...) @printcode(ptr noundef @.str.193)
  call void (ptr, ...) @printcode(ptr noundef @.str.194)
  call void (ptr, ...) @printcode(ptr noundef @.str.195)
  call void (ptr, ...) @printcode(ptr noundef @.str.196)
  call void (ptr, ...) @printcode(ptr noundef @.str.197)
  call void (ptr, ...) @printcode(ptr noundef @.str.198)
  call void (ptr, ...) @printcode(ptr noundef @.str.199)
  call void (ptr, ...) @printcode(ptr noundef @.str.200)
  call void (ptr, ...) @printcode(ptr noundef @.str.201)
  call void (ptr, ...) @printcode(ptr noundef @.str.202)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_strcmp() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.171)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  call void (ptr, ...) @printcode(ptr noundef @.str.95)
  call void (ptr, ...) @printcode(ptr noundef @.str.116)
  call void (ptr, ...) @printcode(ptr noundef @.str.104)
  call void (ptr, ...) @printcode(ptr noundef @.str.142)
  call void (ptr, ...) @printcode(ptr noundef @.str.148)
  call void (ptr, ...) @printcode(ptr noundef @.str.142)
  call void (ptr, ...) @printcode(ptr noundef @.str.172)
  call void (ptr, ...) @printcode(ptr noundef @.str.173)
  call void (ptr, ...) @printcode(ptr noundef @.str.174)
  call void (ptr, ...) @printcode(ptr noundef @.str.175)
  call void (ptr, ...) @printcode(ptr noundef @.str.176)
  call void (ptr, ...) @printcode(ptr noundef @.str.177)
  call void (ptr, ...) @printcode(ptr noundef @.str.178)
  call void (ptr, ...) @printcode(ptr noundef @.str.179)
  call void (ptr, ...) @printcode(ptr noundef @.str.177)
  call void (ptr, ...) @printcode(ptr noundef @.str.180)
  call void (ptr, ...) @printcode(ptr noundef @.str.181)
  call void (ptr, ...) @printcode(ptr noundef @.str.182)
  call void (ptr, ...) @printcode(ptr noundef @.str.122)
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_builtin_error_exits() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.203)
  call void (ptr, ...) @printcode(ptr noundef @.str.204)
  call void (ptr, ...) @printcode(ptr noundef @.str.205)
  call void (ptr, ...) @printcode(ptr noundef @.str.206)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #2

; Function Attrs: nounwind
declare i32 @vfprintf(ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #2

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @generator_free() #0 {
  %1 = alloca i32, align 4
  %2 = load ptr, ptr @gen_core, align 8
  %3 = icmp ne ptr %2, null
  br i1 %3, label %4, label %67

4:                                                ; preds = %0
  %5 = load ptr, ptr @gen_core, align 8
  %6 = getelementptr inbounds %struct.generator_core, ptr %5, i32 0, i32 8
  %7 = getelementptr inbounds %struct.symtable, ptr %6, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %7)
  %8 = load ptr, ptr @gen_core, align 8
  %9 = getelementptr inbounds %struct.generator_core, ptr %8, i32 0, i32 9
  %10 = getelementptr inbounds %struct.symtable, ptr %9, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %10)
  %11 = load ptr, ptr @gen_core, align 8
  %12 = getelementptr inbounds %struct.generator_core, ptr %11, i32 0, i32 10
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %37

15:                                               ; preds = %4
  store i32 0, ptr %1, align 4
  br label %16

16:                                               ; preds = %30, %15
  %17 = load i32, ptr %1, align 4
  %18 = load ptr, ptr @gen_core, align 8
  %19 = getelementptr inbounds %struct.generator_core, ptr %18, i32 0, i32 11
  %20 = load i32, ptr %19, align 8
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %33

22:                                               ; preds = %16
  %23 = load ptr, ptr @gen_core, align 8
  %24 = getelementptr inbounds %struct.generator_core, ptr %23, i32 0, i32 10
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %25, i64 %27
  %29 = load ptr, ptr %28, align 8
  call void @free(ptr noundef %29)
  br label %30

30:                                               ; preds = %22
  %31 = load i32, ptr %1, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %1, align 4
  br label %16

33:                                               ; preds = %16
  %34 = load ptr, ptr @gen_core, align 8
  %35 = getelementptr inbounds %struct.generator_core, ptr %34, i32 0, i32 10
  %36 = load ptr, ptr %35, align 8
  call void @free(ptr noundef %36)
  br label %37

37:                                               ; preds = %33, %4
  %38 = load ptr, ptr @gen_core, align 8
  %39 = getelementptr inbounds %struct.generator_core, ptr %38, i32 0, i32 13
  %40 = load ptr, ptr %39, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %46

42:                                               ; preds = %37
  %43 = load ptr, ptr @gen_core, align 8
  %44 = getelementptr inbounds %struct.generator_core, ptr %43, i32 0, i32 13
  %45 = load ptr, ptr %44, align 8
  call void @free(ptr noundef %45)
  br label %46

46:                                               ; preds = %42, %37
  %47 = load ptr, ptr @gen_core, align 8
  %48 = getelementptr inbounds %struct.generator_core, ptr %47, i32 0, i32 18
  %49 = load ptr, ptr %48, align 8
  %50 = icmp ne ptr %49, null
  br i1 %50, label %51, label %55

51:                                               ; preds = %46
  %52 = load ptr, ptr @gen_core, align 8
  %53 = getelementptr inbounds %struct.generator_core, ptr %52, i32 0, i32 18
  %54 = load ptr, ptr %53, align 8
  call void @free(ptr noundef %54)
  br label %55

55:                                               ; preds = %51, %46
  %56 = load ptr, ptr @gen_core, align 8
  %57 = getelementptr inbounds %struct.generator_core, ptr %56, i32 0, i32 16
  %58 = load ptr, ptr %57, align 8
  %59 = icmp ne ptr %58, null
  br i1 %59, label %60, label %65

60:                                               ; preds = %55
  %61 = load ptr, ptr @gen_core, align 8
  %62 = getelementptr inbounds %struct.generator_core, ptr %61, i32 0, i32 16
  %63 = load ptr, ptr %62, align 8
  %64 = call i32 @fclose(ptr noundef %63)
  br label %65

65:                                               ; preds = %60, %55
  %66 = load ptr, ptr @gen_core, align 8
  call void @free(ptr noundef %66)
  store ptr null, ptr @gen_core, align 8
  br label %67

67:                                               ; preds = %65, %0
  ret void
}

declare void @free(ptr noundef) #5

declare i32 @fclose(ptr noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_output_global_defvars(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca [10000 x i8], align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr @gen_core, align 8
  %6 = getelementptr inbounds %struct.generator_core, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.7) #13
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %27, %1
  %10 = load i32, ptr %3, align 4
  %11 = load ptr, ptr @gen_core, align 8
  %12 = getelementptr inbounds %struct.generator_core, ptr %11, i32 0, i32 11
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %30

15:                                               ; preds = %9
  %16 = load ptr, ptr @gen_core, align 8
  %17 = getelementptr inbounds %struct.generator_core, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr @gen_core, align 8
  %20 = getelementptr inbounds %struct.generator_core, ptr %19, i32 0, i32 10
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.8, ptr noundef %25) #13
  br label %27

27:                                               ; preds = %15
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  br label %9

30:                                               ; preds = %9
  %31 = load ptr, ptr %2, align 8
  call void @rewind(ptr noundef %31)
  br label %32

32:                                               ; preds = %37, %30
  %33 = getelementptr inbounds [10000 x i8], ptr %4, i64 0, i64 0
  %34 = load ptr, ptr %2, align 8
  %35 = call ptr @fgets(ptr noundef %33, i32 noundef 10000, ptr noundef %34)
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %43

37:                                               ; preds = %32
  %38 = load ptr, ptr @gen_core, align 8
  %39 = getelementptr inbounds %struct.generator_core, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds [10000 x i8], ptr %4, i64 0, i64 0
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.9, ptr noundef %41) #13
  br label %32

43:                                               ; preds = %32
  ret void
}

declare void @rewind(ptr noundef) #5

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_function_start(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr @gen_core, align 8
  %6 = getelementptr inbounds %struct.generator_core, ptr %5, i32 0, i32 9
  %7 = getelementptr inbounds %struct.symtable, ptr %6, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %7)
  %8 = load ptr, ptr @gen_core, align 8
  %9 = getelementptr inbounds %struct.generator_core, ptr %8, i32 0, i32 9
  call void @init_symtable(ptr noundef %9)
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %23, %1
  %11 = load i32, ptr %3, align 4
  %12 = load ptr, ptr @gen_core, align 8
  %13 = getelementptr inbounds %struct.generator_core, ptr %12, i32 0, i32 14
  %14 = load i32, ptr %13, align 8
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %26

16:                                               ; preds = %10
  %17 = load ptr, ptr @gen_core, align 8
  %18 = getelementptr inbounds %struct.generator_core, ptr %17, i32 0, i32 13
  %19 = load ptr, ptr %18, align 8
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds ptr, ptr %19, i64 %21
  store ptr null, ptr %22, align 8
  br label %23

23:                                               ; preds = %16
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %10

26:                                               ; preds = %10
  %27 = load ptr, ptr @gen_core, align 8
  %28 = getelementptr inbounds %struct.generator_core, ptr %27, i32 0, i32 14
  store i32 0, ptr %28, align 8
  %29 = load ptr, ptr @gen_core, align 8
  %30 = getelementptr inbounds %struct.generator_core, ptr %29, i32 0, i32 20
  %31 = load i64, ptr %30, align 8
  %32 = call ptr @malloc(i64 noundef %31) #11
  %33 = load ptr, ptr @gen_core, align 8
  %34 = getelementptr inbounds %struct.generator_core, ptr %33, i32 0, i32 18
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr @gen_core, align 8
  %36 = getelementptr inbounds %struct.generator_core, ptr %35, i32 0, i32 18
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %40, label %39

39:                                               ; preds = %26
  call void @internal_error()
  br label %75

40:                                               ; preds = %26
  %41 = load ptr, ptr @gen_core, align 8
  %42 = getelementptr inbounds %struct.generator_core, ptr %41, i32 0, i32 19
  store i64 0, ptr %42, align 8
  %43 = load ptr, ptr @gen_core, align 8
  %44 = getelementptr inbounds %struct.generator_core, ptr %43, i32 0, i32 18
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr @gen_core, align 8
  %47 = getelementptr inbounds %struct.generator_core, ptr %46, i32 0, i32 20
  %48 = load i64, ptr %47, align 8
  %49 = call ptr @fmemopen(ptr noundef %45, i64 noundef %48, ptr noundef @.str.10)
  %50 = load ptr, ptr @gen_core, align 8
  %51 = getelementptr inbounds %struct.generator_core, ptr %50, i32 0, i32 16
  store ptr %49, ptr %51, align 8
  %52 = load ptr, ptr @gen_core, align 8
  %53 = getelementptr inbounds %struct.generator_core, ptr %52, i32 0, i32 16
  %54 = load ptr, ptr %53, align 8
  %55 = icmp ne ptr %54, null
  br i1 %55, label %60, label %56

56:                                               ; preds = %40
  %57 = load ptr, ptr @gen_core, align 8
  %58 = getelementptr inbounds %struct.generator_core, ptr %57, i32 0, i32 18
  %59 = load ptr, ptr %58, align 8
  call void @free(ptr noundef %59)
  call void @internal_error()
  br label %75

60:                                               ; preds = %40
  %61 = load ptr, ptr @gen_core, align 8
  %62 = getelementptr inbounds %struct.generator_core, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr @gen_core, align 8
  %65 = getelementptr inbounds %struct.generator_core, ptr %64, i32 0, i32 17
  store ptr %63, ptr %65, align 8
  %66 = load ptr, ptr @gen_core, align 8
  %67 = getelementptr inbounds %struct.generator_core, ptr %66, i32 0, i32 16
  %68 = load ptr, ptr %67, align 8
  %69 = load ptr, ptr @gen_core, align 8
  %70 = getelementptr inbounds %struct.generator_core, ptr %69, i32 0, i32 0
  store ptr %68, ptr %70, align 8
  %71 = load ptr, ptr %2, align 8
  %72 = call ptr @gen_func_label(ptr noundef %71)
  store ptr %72, ptr %4, align 8
  %73 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %73)
  call void (ptr, ...) @printcode(ptr noundef @.str.12)
  %74 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %74)
  br label %75

75:                                               ; preds = %60, %56, %39
  ret void
}

declare ptr @fmemopen(ptr noundef, i64 noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @gen_func_label(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [256 x i8], align 1
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %7 = call ptr @malloc(i64 noundef 256) #11
  store ptr %7, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %44

11:                                               ; preds = %1
  %12 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %13 = load ptr, ptr %3, align 8
  %14 = call ptr @__strncpy_chk(ptr noundef %12, ptr noundef %13, i64 noundef 255, i64 noundef 256) #13
  %15 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 255
  store i8 0, ptr %15, align 1
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %34, %11
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %37

22:                                               ; preds = %16
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %24
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 46
  br i1 %28, label %29, label %33

29:                                               ; preds = %22
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %31
  store i8 95, ptr %32, align 1
  br label %33

33:                                               ; preds = %29, %22
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  br label %16

37:                                               ; preds = %16
  %38 = load ptr, ptr %4, align 8
  %39 = load ptr, ptr %4, align 8
  %40 = call i64 @llvm.objectsize.i64.p0(ptr %39, i1 false, i1 true, i1 false)
  %41 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %42 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %38, i64 noundef 256, i32 noundef 0, i64 noundef %40, ptr noundef @.str.88, ptr noundef %41)
  %43 = load ptr, ptr %4, align 8
  store ptr %43, ptr %2, align 8
  br label %44

44:                                               ; preds = %37, %10
  %45 = load ptr, ptr %2, align 8
  ret ptr %45
}

; Function Attrs: nounwind
declare ptr @__strncpy_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #6

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_function_end(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [10000 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr @gen_core, align 8
  %8 = getelementptr inbounds %struct.generator_core, ptr %7, i32 0, i32 17
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr @gen_core, align 8
  %11 = getelementptr inbounds %struct.generator_core, ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr @gen_core, align 8
  %13 = getelementptr inbounds %struct.generator_core, ptr %12, i32 0, i32 16
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %103

16:                                               ; preds = %1
  %17 = load ptr, ptr @gen_core, align 8
  %18 = getelementptr inbounds %struct.generator_core, ptr %17, i32 0, i32 16
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @fclose(ptr noundef %19)
  %21 = load ptr, ptr @gen_core, align 8
  %22 = getelementptr inbounds %struct.generator_core, ptr %21, i32 0, i32 18
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr @gen_core, align 8
  %25 = getelementptr inbounds %struct.generator_core, ptr %24, i32 0, i32 20
  %26 = load i64, ptr %25, align 8
  %27 = call ptr @fmemopen(ptr noundef %23, i64 noundef %26, ptr noundef @.str.13)
  %28 = load ptr, ptr @gen_core, align 8
  %29 = getelementptr inbounds %struct.generator_core, ptr %28, i32 0, i32 16
  store ptr %27, ptr %29, align 8
  %30 = load ptr, ptr @gen_core, align 8
  %31 = getelementptr inbounds %struct.generator_core, ptr %30, i32 0, i32 16
  %32 = load ptr, ptr %31, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %38, label %34

34:                                               ; preds = %16
  %35 = load ptr, ptr @gen_core, align 8
  %36 = getelementptr inbounds %struct.generator_core, ptr %35, i32 0, i32 18
  %37 = load ptr, ptr %36, align 8
  call void @free(ptr noundef %37)
  br label %141

38:                                               ; preds = %16
  store i32 0, ptr %4, align 4
  br label %39

39:                                               ; preds = %51, %38
  %40 = load i32, ptr %4, align 4
  %41 = icmp slt i32 %40, 2
  br i1 %41, label %42, label %49

42:                                               ; preds = %39
  %43 = getelementptr inbounds [10000 x i8], ptr %3, i64 0, i64 0
  %44 = load ptr, ptr @gen_core, align 8
  %45 = getelementptr inbounds %struct.generator_core, ptr %44, i32 0, i32 16
  %46 = load ptr, ptr %45, align 8
  %47 = call ptr @fgets(ptr noundef %43, i32 noundef 10000, ptr noundef %46)
  %48 = icmp ne ptr %47, null
  br label %49

49:                                               ; preds = %42, %39
  %50 = phi i1 [ false, %39 ], [ %48, %42 ]
  br i1 %50, label %51, label %59

51:                                               ; preds = %49
  %52 = load ptr, ptr @gen_core, align 8
  %53 = getelementptr inbounds %struct.generator_core, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr inbounds [10000 x i8], ptr %3, i64 0, i64 0
  %56 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %54, ptr noundef @.str.9, ptr noundef %55) #13
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %4, align 4
  br label %39

59:                                               ; preds = %49
  store i32 0, ptr %5, align 4
  br label %60

60:                                               ; preds = %74, %59
  %61 = load i32, ptr %5, align 4
  %62 = load ptr, ptr @gen_core, align 8
  %63 = getelementptr inbounds %struct.generator_core, ptr %62, i32 0, i32 14
  %64 = load i32, ptr %63, align 8
  %65 = icmp slt i32 %61, %64
  br i1 %65, label %66, label %77

66:                                               ; preds = %60
  %67 = load ptr, ptr @gen_core, align 8
  %68 = getelementptr inbounds %struct.generator_core, ptr %67, i32 0, i32 13
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %5, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  %73 = load ptr, ptr %72, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.9, ptr noundef %73)
  br label %74

74:                                               ; preds = %66
  %75 = load i32, ptr %5, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %5, align 4
  br label %60

77:                                               ; preds = %60
  br label %78

78:                                               ; preds = %85, %77
  %79 = getelementptr inbounds [10000 x i8], ptr %3, i64 0, i64 0
  %80 = load ptr, ptr @gen_core, align 8
  %81 = getelementptr inbounds %struct.generator_core, ptr %80, i32 0, i32 16
  %82 = load ptr, ptr %81, align 8
  %83 = call ptr @fgets(ptr noundef %79, i32 noundef 10000, ptr noundef %82)
  %84 = icmp ne ptr %83, null
  br i1 %84, label %85, label %91

85:                                               ; preds = %78
  %86 = load ptr, ptr @gen_core, align 8
  %87 = getelementptr inbounds %struct.generator_core, ptr %86, i32 0, i32 0
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds [10000 x i8], ptr %3, i64 0, i64 0
  %90 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %88, ptr noundef @.str.9, ptr noundef %89) #13
  br label %78

91:                                               ; preds = %78
  %92 = load ptr, ptr @gen_core, align 8
  %93 = getelementptr inbounds %struct.generator_core, ptr %92, i32 0, i32 16
  %94 = load ptr, ptr %93, align 8
  %95 = call i32 @fclose(ptr noundef %94)
  %96 = load ptr, ptr @gen_core, align 8
  %97 = getelementptr inbounds %struct.generator_core, ptr %96, i32 0, i32 16
  store ptr null, ptr %97, align 8
  %98 = load ptr, ptr @gen_core, align 8
  %99 = getelementptr inbounds %struct.generator_core, ptr %98, i32 0, i32 18
  %100 = load ptr, ptr %99, align 8
  call void @free(ptr noundef %100)
  %101 = load ptr, ptr @gen_core, align 8
  %102 = getelementptr inbounds %struct.generator_core, ptr %101, i32 0, i32 18
  store ptr null, ptr %102, align 8
  br label %103

103:                                              ; preds = %91, %1
  store i32 0, ptr %6, align 4
  br label %104

104:                                              ; preds = %134, %103
  %105 = load i32, ptr %6, align 4
  %106 = load ptr, ptr @gen_core, align 8
  %107 = getelementptr inbounds %struct.generator_core, ptr %106, i32 0, i32 14
  %108 = load i32, ptr %107, align 8
  %109 = icmp slt i32 %105, %108
  br i1 %109, label %110, label %137

110:                                              ; preds = %104
  %111 = load ptr, ptr @gen_core, align 8
  %112 = getelementptr inbounds %struct.generator_core, ptr %111, i32 0, i32 13
  %113 = load ptr, ptr %112, align 8
  %114 = load i32, ptr %6, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds ptr, ptr %113, i64 %115
  %117 = load ptr, ptr %116, align 8
  %118 = icmp ne ptr %117, null
  br i1 %118, label %119, label %133

119:                                              ; preds = %110
  %120 = load ptr, ptr @gen_core, align 8
  %121 = getelementptr inbounds %struct.generator_core, ptr %120, i32 0, i32 13
  %122 = load ptr, ptr %121, align 8
  %123 = load i32, ptr %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds ptr, ptr %122, i64 %124
  %126 = load ptr, ptr %125, align 8
  call void @free(ptr noundef %126)
  %127 = load ptr, ptr @gen_core, align 8
  %128 = getelementptr inbounds %struct.generator_core, ptr %127, i32 0, i32 13
  %129 = load ptr, ptr %128, align 8
  %130 = load i32, ptr %6, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds ptr, ptr %129, i64 %131
  store ptr null, ptr %132, align 8
  br label %133

133:                                              ; preds = %119, %110
  br label %134

134:                                              ; preds = %133
  %135 = load i32, ptr %6, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %6, align 4
  br label %104

137:                                              ; preds = %104
  %138 = load ptr, ptr @gen_core, align 8
  %139 = getelementptr inbounds %struct.generator_core, ptr %138, i32 0, i32 14
  store i32 0, ptr %139, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.14)
  call void (ptr, ...) @printcode(ptr noundef @.str.15)
  %140 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.16, ptr noundef %140)
  br label %141

141:                                              ; preds = %137, %34
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_function_call(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.3)
  %7 = load i32, ptr %4, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, ptr %5, align 4
  br label %9

9:                                                ; preds = %15, %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.17, i32 noundef %13)
  %14 = load i32, ptr %5, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.18, i32 noundef %14)
  br label %15

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, ptr %5, align 4
  br label %9

18:                                               ; preds = %9
  %19 = load ptr, ptr %3, align 8
  %20 = call ptr @gen_func_label(ptr noundef %19)
  store ptr %20, ptr %6, align 8
  %21 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.19, ptr noundef %21)
  %22 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %22)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_defvar(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = call i32 @strcmp(ptr noundef %15, ptr noundef @.str.20) #13
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %101

18:                                               ; preds = %2
  store ptr null, ptr %5, align 8
  %19 = load ptr, ptr @gen_core, align 8
  %20 = getelementptr inbounds %struct.generator_core, ptr %19, i32 0, i32 8
  %21 = getelementptr inbounds %struct.symtable, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = call zeroext i1 @symtable_search(ptr noundef %22, ptr noundef %23, ptr noundef %5)
  br i1 %24, label %25, label %26

25:                                               ; preds = %18
  br label %191

26:                                               ; preds = %18
  %27 = call ptr @malloc(i64 noundef 40) #11
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %51

30:                                               ; preds = %26
  %31 = load ptr, ptr %4, align 8
  %32 = call ptr @strdup(ptr noundef %31)
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.symbol_info, ptr %33, i32 0, i32 0
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.symbol_info, ptr %35, i32 0, i32 1
  store i32 2, ptr %36, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.symbol_info, ptr %37, i32 0, i32 2
  store i32 5, ptr %38, align 4
  %39 = load ptr, ptr %6, align 8
  %40 = getelementptr inbounds %struct.symbol_info, ptr %39, i32 0, i32 3
  store i8 0, ptr %40, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.symbol_info, ptr %41, i32 0, i32 4
  store ptr null, ptr %42, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.symbol_info, ptr %43, i32 0, i32 6
  store i32 0, ptr %44, align 4
  store i32 0, ptr %7, align 4
  %45 = load ptr, ptr @gen_core, align 8
  %46 = getelementptr inbounds %struct.generator_core, ptr %45, i32 0, i32 8
  %47 = getelementptr inbounds %struct.symtable, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %4, align 8
  %49 = load ptr, ptr %6, align 8
  %50 = call zeroext i1 @symtable_insert(ptr noundef %47, ptr noundef %48, ptr noundef %49, ptr noundef %7)
  br label %51

51:                                               ; preds = %30, %26
  %52 = load ptr, ptr @gen_core, align 8
  %53 = getelementptr inbounds %struct.generator_core, ptr %52, i32 0, i32 11
  %54 = load i32, ptr %53, align 8
  %55 = load ptr, ptr @gen_core, align 8
  %56 = getelementptr inbounds %struct.generator_core, ptr %55, i32 0, i32 12
  %57 = load i32, ptr %56, align 4
  %58 = icmp sge i32 %54, %57
  br i1 %58, label %59, label %80

59:                                               ; preds = %51
  %60 = load ptr, ptr @gen_core, align 8
  %61 = getelementptr inbounds %struct.generator_core, ptr %60, i32 0, i32 12
  %62 = load i32, ptr %61, align 4
  %63 = mul nsw i32 %62, 2
  store i32 %63, ptr %61, align 4
  %64 = load ptr, ptr @gen_core, align 8
  %65 = getelementptr inbounds %struct.generator_core, ptr %64, i32 0, i32 10
  %66 = load ptr, ptr %65, align 8
  %67 = load ptr, ptr @gen_core, align 8
  %68 = getelementptr inbounds %struct.generator_core, ptr %67, i32 0, i32 12
  %69 = load i32, ptr %68, align 4
  %70 = sext i32 %69 to i64
  %71 = mul i64 8, %70
  %72 = call ptr @realloc(ptr noundef %66, i64 noundef %71) #14
  store ptr %72, ptr %8, align 8
  %73 = load ptr, ptr %8, align 8
  %74 = icmp ne ptr %73, null
  br i1 %74, label %76, label %75

75:                                               ; preds = %59
  call void @internal_error()
  br label %191

76:                                               ; preds = %59
  %77 = load ptr, ptr %8, align 8
  %78 = load ptr, ptr @gen_core, align 8
  %79 = getelementptr inbounds %struct.generator_core, ptr %78, i32 0, i32 10
  store ptr %77, ptr %79, align 8
  br label %80

80:                                               ; preds = %76, %51
  %81 = call ptr @malloc(i64 noundef 256) #11
  store ptr %81, ptr %9, align 8
  %82 = load ptr, ptr %9, align 8
  %83 = icmp ne ptr %82, null
  br i1 %83, label %84, label %100

84:                                               ; preds = %80
  %85 = load ptr, ptr %9, align 8
  %86 = load ptr, ptr %9, align 8
  %87 = call i64 @llvm.objectsize.i64.p0(ptr %86, i1 false, i1 true, i1 false)
  %88 = load ptr, ptr %4, align 8
  %89 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %85, i64 noundef 256, i32 noundef 0, i64 noundef %87, ptr noundef @.str.21, ptr noundef %88)
  %90 = load ptr, ptr %9, align 8
  %91 = load ptr, ptr @gen_core, align 8
  %92 = getelementptr inbounds %struct.generator_core, ptr %91, i32 0, i32 10
  %93 = load ptr, ptr %92, align 8
  %94 = load ptr, ptr @gen_core, align 8
  %95 = getelementptr inbounds %struct.generator_core, ptr %94, i32 0, i32 11
  %96 = load i32, ptr %95, align 8
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %95, align 8
  %98 = sext i32 %96 to i64
  %99 = getelementptr inbounds ptr, ptr %93, i64 %98
  store ptr %90, ptr %99, align 8
  br label %100

100:                                              ; preds = %84, %80
  br label %191

101:                                              ; preds = %2
  %102 = load ptr, ptr %3, align 8
  %103 = call i32 @strcmp(ptr noundef %102, ptr noundef @.str.22) #13
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %188

105:                                              ; preds = %101
  store ptr null, ptr %10, align 8
  %106 = load ptr, ptr @gen_core, align 8
  %107 = getelementptr inbounds %struct.generator_core, ptr %106, i32 0, i32 9
  %108 = getelementptr inbounds %struct.symtable, ptr %107, i32 0, i32 0
  %109 = load ptr, ptr %108, align 8
  %110 = load ptr, ptr %4, align 8
  %111 = call zeroext i1 @symtable_search(ptr noundef %109, ptr noundef %110, ptr noundef %10)
  br i1 %111, label %112, label %113

112:                                              ; preds = %105
  br label %191

113:                                              ; preds = %105
  %114 = call ptr @malloc(i64 noundef 40) #11
  store ptr %114, ptr %11, align 8
  %115 = load ptr, ptr %11, align 8
  %116 = icmp ne ptr %115, null
  br i1 %116, label %117, label %138

117:                                              ; preds = %113
  %118 = load ptr, ptr %4, align 8
  %119 = call ptr @strdup(ptr noundef %118)
  %120 = load ptr, ptr %11, align 8
  %121 = getelementptr inbounds %struct.symbol_info, ptr %120, i32 0, i32 0
  store ptr %119, ptr %121, align 8
  %122 = load ptr, ptr %11, align 8
  %123 = getelementptr inbounds %struct.symbol_info, ptr %122, i32 0, i32 1
  store i32 1, ptr %123, align 8
  %124 = load ptr, ptr %11, align 8
  %125 = getelementptr inbounds %struct.symbol_info, ptr %124, i32 0, i32 2
  store i32 5, ptr %125, align 4
  %126 = load ptr, ptr %11, align 8
  %127 = getelementptr inbounds %struct.symbol_info, ptr %126, i32 0, i32 3
  store i8 0, ptr %127, align 8
  %128 = load ptr, ptr %11, align 8
  %129 = getelementptr inbounds %struct.symbol_info, ptr %128, i32 0, i32 4
  store ptr null, ptr %129, align 8
  %130 = load ptr, ptr %11, align 8
  %131 = getelementptr inbounds %struct.symbol_info, ptr %130, i32 0, i32 6
  store i32 0, ptr %131, align 4
  store i32 0, ptr %12, align 4
  %132 = load ptr, ptr @gen_core, align 8
  %133 = getelementptr inbounds %struct.generator_core, ptr %132, i32 0, i32 9
  %134 = getelementptr inbounds %struct.symtable, ptr %133, i32 0, i32 0
  %135 = load ptr, ptr %4, align 8
  %136 = load ptr, ptr %11, align 8
  %137 = call zeroext i1 @symtable_insert(ptr noundef %134, ptr noundef %135, ptr noundef %136, ptr noundef %12)
  br label %138

138:                                              ; preds = %117, %113
  %139 = load ptr, ptr @gen_core, align 8
  %140 = getelementptr inbounds %struct.generator_core, ptr %139, i32 0, i32 14
  %141 = load i32, ptr %140, align 8
  %142 = load ptr, ptr @gen_core, align 8
  %143 = getelementptr inbounds %struct.generator_core, ptr %142, i32 0, i32 15
  %144 = load i32, ptr %143, align 4
  %145 = icmp sge i32 %141, %144
  br i1 %145, label %146, label %167

146:                                              ; preds = %138
  %147 = load ptr, ptr @gen_core, align 8
  %148 = getelementptr inbounds %struct.generator_core, ptr %147, i32 0, i32 15
  %149 = load i32, ptr %148, align 4
  %150 = mul nsw i32 %149, 2
  store i32 %150, ptr %148, align 4
  %151 = load ptr, ptr @gen_core, align 8
  %152 = getelementptr inbounds %struct.generator_core, ptr %151, i32 0, i32 13
  %153 = load ptr, ptr %152, align 8
  %154 = load ptr, ptr @gen_core, align 8
  %155 = getelementptr inbounds %struct.generator_core, ptr %154, i32 0, i32 15
  %156 = load i32, ptr %155, align 4
  %157 = sext i32 %156 to i64
  %158 = mul i64 8, %157
  %159 = call ptr @realloc(ptr noundef %153, i64 noundef %158) #14
  store ptr %159, ptr %13, align 8
  %160 = load ptr, ptr %13, align 8
  %161 = icmp ne ptr %160, null
  br i1 %161, label %163, label %162

162:                                              ; preds = %146
  call void @internal_error()
  br label %191

163:                                              ; preds = %146
  %164 = load ptr, ptr %13, align 8
  %165 = load ptr, ptr @gen_core, align 8
  %166 = getelementptr inbounds %struct.generator_core, ptr %165, i32 0, i32 13
  store ptr %164, ptr %166, align 8
  br label %167

167:                                              ; preds = %163, %138
  %168 = call ptr @malloc(i64 noundef 256) #11
  store ptr %168, ptr %14, align 8
  %169 = load ptr, ptr %14, align 8
  %170 = icmp ne ptr %169, null
  br i1 %170, label %171, label %187

171:                                              ; preds = %167
  %172 = load ptr, ptr %14, align 8
  %173 = load ptr, ptr %14, align 8
  %174 = call i64 @llvm.objectsize.i64.p0(ptr %173, i1 false, i1 true, i1 false)
  %175 = load ptr, ptr %4, align 8
  %176 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %172, i64 noundef 256, i32 noundef 0, i64 noundef %174, ptr noundef @.str.23, ptr noundef %175)
  %177 = load ptr, ptr %14, align 8
  %178 = load ptr, ptr @gen_core, align 8
  %179 = getelementptr inbounds %struct.generator_core, ptr %178, i32 0, i32 13
  %180 = load ptr, ptr %179, align 8
  %181 = load ptr, ptr @gen_core, align 8
  %182 = getelementptr inbounds %struct.generator_core, ptr %181, i32 0, i32 14
  %183 = load i32, ptr %182, align 8
  %184 = add nsw i32 %183, 1
  store i32 %184, ptr %182, align 8
  %185 = sext i32 %183 to i64
  %186 = getelementptr inbounds ptr, ptr %180, i64 %185
  store ptr %177, ptr %186, align 8
  br label %187

187:                                              ; preds = %171, %167
  br label %191

188:                                              ; preds = %101
  %189 = load ptr, ptr %3, align 8
  %190 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.24, ptr noundef %189, ptr noundef %190)
  br label %191

191:                                              ; preds = %188, %187, %162, %112, %100, %75, %25
  ret void
}

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare ptr @strdup(ptr noundef) #5

; Function Attrs: allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #7

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_defvar_immediate(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.24, ptr noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_move(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.25, ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.26, ptr noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pops(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.27, ptr noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs_int(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.28, i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs_float(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.29, double noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs_string(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr @gen_core, align 8
  %6 = getelementptr inbounds %struct.generator_core, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.30) #13
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %60, %1
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %10, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %63

17:                                               ; preds = %9
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %18, i64 %20
  %22 = load i8, ptr %21, align 1
  store i8 %22, ptr %4, align 1
  %23 = load i8, ptr %4, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 32
  br i1 %25, label %46, label %26

26:                                               ; preds = %17
  %27 = load i8, ptr %4, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 10
  br i1 %29, label %46, label %30

30:                                               ; preds = %26
  %31 = load i8, ptr %4, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 9
  br i1 %33, label %46, label %34

34:                                               ; preds = %30
  %35 = load i8, ptr %4, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 35
  br i1 %37, label %46, label %38

38:                                               ; preds = %34
  %39 = load i8, ptr %4, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 92
  br i1 %41, label %46, label %42

42:                                               ; preds = %38
  %43 = load i8, ptr %4, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp slt i32 %44, 32
  br i1 %45, label %46, label %53

46:                                               ; preds = %42, %38, %34, %30, %26, %17
  %47 = load ptr, ptr @gen_core, align 8
  %48 = getelementptr inbounds %struct.generator_core, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = load i8, ptr %4, align 1
  %51 = zext i8 %50 to i32
  %52 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %49, ptr noundef @.str.31, i32 noundef %51) #13
  br label %60

53:                                               ; preds = %42
  %54 = load ptr, ptr @gen_core, align 8
  %55 = getelementptr inbounds %struct.generator_core, ptr %54, i32 0, i32 0
  %56 = load ptr, ptr %55, align 8
  %57 = load i8, ptr %4, align 1
  %58 = sext i8 %57 to i32
  %59 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %56, ptr noundef @.str.32, i32 noundef %58) #13
  br label %60

60:                                               ; preds = %53, %46
  %61 = load i32, ptr %3, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  br label %9

63:                                               ; preds = %9
  %64 = load ptr, ptr @gen_core, align 8
  %65 = getelementptr inbounds %struct.generator_core, ptr %64, i32 0, i32 0
  %66 = load ptr, ptr %65, align 8
  %67 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %66, ptr noundef @.str) #13
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs_null() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.33)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_pushs_bool(i1 noundef zeroext %0) #0 {
  %2 = alloca i8, align 1
  %3 = zext i1 %0 to i8
  store i8 %3, ptr %2, align 1
  %4 = load i8, ptr %2, align 1
  %5 = trunc i8 %4 to i1
  %6 = zext i1 %5 to i64
  %7 = select i1 %5, ptr @.str.35, ptr @.str.36
  call void (ptr, ...) @printcode(ptr noundef @.str.34, ptr noundef %7)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_adds() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.37)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_concats() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @gen_tmp_var()
  store ptr %4, ptr %1, align 8
  %5 = call ptr @gen_tmp_var()
  store ptr %5, ptr %2, align 8
  %6 = call ptr @gen_tmp_var()
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %1, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %7)
  %8 = load ptr, ptr %2, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %8)
  %9 = load ptr, ptr %3, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %9)
  %10 = load ptr, ptr %1, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.38, ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.38, ptr noundef %11)
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = load ptr, ptr %1, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.39, ptr noundef %12, ptr noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.40, ptr noundef %15)
  %16 = load ptr, ptr %1, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %18)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @gen_tmp_var() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @malloc(i64 noundef 256) #11
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %17

7:                                                ; preds = %0
  %8 = load ptr, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = call i64 @llvm.objectsize.i64.p0(ptr %9, i1 false, i1 true, i1 false)
  %11 = load ptr, ptr @gen_core, align 8
  %12 = getelementptr inbounds %struct.generator_core, ptr %11, i32 0, i32 5
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 4
  %15 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %8, i64 noundef 256, i32 noundef 0, i64 noundef %10, ptr noundef @.str.89, i32 noundef %13)
  %16 = load ptr, ptr %2, align 8
  store ptr %16, ptr %1, align 8
  br label %17

17:                                               ; preds = %7, %6
  %18 = load ptr, ptr %1, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_subs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.41)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_muls() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.42)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_string_repeat() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = call ptr @gen_tmp_var()
  store ptr %8, ptr %1, align 8
  %9 = call ptr @gen_tmp_var()
  store ptr %9, ptr %2, align 8
  %10 = call ptr @gen_tmp_var()
  store ptr %10, ptr %3, align 8
  %11 = call ptr @gen_tmp_var()
  store ptr %11, ptr %4, align 8
  %12 = call ptr @gen_tmp_var()
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %1, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %15)
  %16 = load ptr, ptr %4, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %16)
  %17 = load ptr, ptr %5, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %17)
  %18 = load ptr, ptr %1, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.38, ptr noundef %18)
  %19 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.38, ptr noundef %19)
  %20 = load ptr, ptr %3, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.43, ptr noundef %20)
  %21 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.44, ptr noundef %21)
  %22 = call ptr @gen_unique_label(ptr noundef @.str.45)
  store ptr %22, ptr %6, align 8
  %23 = call ptr @gen_unique_label(ptr noundef @.str.46)
  store ptr %23, ptr %7, align 8
  %24 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %24)
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %1, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.47, ptr noundef %25, ptr noundef %26, ptr noundef %27)
  %28 = load ptr, ptr %7, align 8
  %29 = load ptr, ptr %5, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.48, ptr noundef %28, ptr noundef %29)
  %30 = load ptr, ptr %3, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.39, ptr noundef %30, ptr noundef %31, ptr noundef %32)
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.49, ptr noundef %33, ptr noundef %34)
  %35 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.50, ptr noundef %35)
  %36 = load ptr, ptr %7, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %36)
  %37 = load ptr, ptr %3, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.40, ptr noundef %37)
  %38 = load ptr, ptr %1, align 8
  call void @free(ptr noundef %38)
  %39 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %39)
  %40 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %40)
  %41 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %41)
  %42 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %42)
  %43 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %44)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @gen_unique_label(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = call ptr @malloc(i64 noundef 256) #11
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %20

9:                                                ; preds = %1
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @llvm.objectsize.i64.p0(ptr %11, i1 false, i1 true, i1 false)
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr @gen_core, align 8
  %15 = getelementptr inbounds %struct.generator_core, ptr %14, i32 0, i32 4
  %16 = load i32, ptr %15, align 8
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %15, align 8
  %18 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %10, i64 noundef 256, i32 noundef 0, i64 noundef %12, ptr noundef @.str.85, ptr noundef %13, i32 noundef %16)
  %19 = load ptr, ptr %4, align 8
  store ptr %19, ptr %2, align 8
  br label %20

20:                                               ; preds = %9, %8
  %21 = load ptr, ptr %2, align 8
  ret ptr %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_divs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.51)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_int2floats() #0 {
  %1 = alloca i32, align 4
  %2 = load i8, ptr @gen_int2floats.vars_declared, align 1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %5, label %4

4:                                                ; preds = %0
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef @.str.52)
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef @.str.53)
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef @.str.54)
  store i8 1, ptr @gen_int2floats.vars_declared, align 1
  br label %5

5:                                                ; preds = %4, %0
  call void (ptr, ...) @printcode(ptr noundef @.str.55)
  call void (ptr, ...) @printcode(ptr noundef @.str.56)
  call void (ptr, ...) @printcode(ptr noundef @.str.57)
  %6 = load ptr, ptr @gen_core, align 8
  %7 = getelementptr inbounds %struct.generator_core, ptr %6, i32 0, i32 4
  %8 = load i32, ptr %7, align 8
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %7, align 8
  store i32 %8, ptr %1, align 4
  %10 = load i32, ptr %1, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.58, i32 noundef %10)
  call void (ptr, ...) @printcode(ptr noundef @.str.59)
  %11 = load i32, ptr %1, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.60, i32 noundef %11)
  call void (ptr, ...) @printcode(ptr noundef @.str.61)
  %12 = load ptr, ptr @gen_core, align 8
  %13 = getelementptr inbounds %struct.generator_core, ptr %12, i32 0, i32 4
  %14 = load i32, ptr %13, align 8
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %13, align 8
  store i32 %14, ptr %1, align 4
  %16 = load i32, ptr %1, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.62, i32 noundef %16)
  call void (ptr, ...) @printcode(ptr noundef @.str.63)
  %17 = load i32, ptr %1, align 4
  call void (ptr, ...) @printcode(ptr noundef @.str.64, i32 noundef %17)
  call void (ptr, ...) @printcode(ptr noundef @.str.65)
  call void (ptr, ...) @printcode(ptr noundef @.str.66)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_eqs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.67)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_neqs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.67)
  call void (ptr, ...) @printcode(ptr noundef @.str.68)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_lts() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.69)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_gts() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.70)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_lteqs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.70)
  call void (ptr, ...) @printcode(ptr noundef @.str.68)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_gteqs() #0 {
  call void (ptr, ...) @printcode(ptr noundef @.str.69)
  call void (ptr, ...) @printcode(ptr noundef @.str.68)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_is_type(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = call ptr @gen_unique_label(ptr noundef @.str.71)
  store ptr %7, ptr %3, align 8
  %8 = call ptr @gen_unique_label(ptr noundef @.str.72)
  store ptr %8, ptr %4, align 8
  %9 = call ptr @gen_tmp_var()
  store ptr %9, ptr %5, align 8
  %10 = call ptr @gen_tmp_var()
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %5, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %11)
  %12 = load ptr, ptr %6, align 8
  call void @gen_defvar(ptr noundef @.str.20, ptr noundef %12)
  %13 = load ptr, ptr %5, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.38, ptr noundef %13)
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %5, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.73, ptr noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %2, align 8
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.74) #13
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %1
  %20 = load ptr, ptr %3, align 8
  %21 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.75, ptr noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.76, ptr noundef %22, ptr noundef %23)
  br label %40

24:                                               ; preds = %1
  %25 = load ptr, ptr %2, align 8
  %26 = call i32 @strcmp(ptr noundef %25, ptr noundef @.str.77) #13
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %24
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.78, ptr noundef %29, ptr noundef %30)
  br label %39

31:                                               ; preds = %24
  %32 = load ptr, ptr %2, align 8
  %33 = call i32 @strcmp(ptr noundef %32, ptr noundef @.str.79) #13
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load ptr, ptr %3, align 8
  %37 = load ptr, ptr %6, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.80, ptr noundef %36, ptr noundef %37)
  br label %38

38:                                               ; preds = %35, %31
  br label %39

39:                                               ; preds = %38, %28
  br label %40

40:                                               ; preds = %39, %19
  call void (ptr, ...) @printcode(ptr noundef @.str.81)
  %41 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.50, ptr noundef %41)
  %42 = load ptr, ptr %3, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %42)
  call void (ptr, ...) @printcode(ptr noundef @.str.82)
  %43 = load ptr, ptr %4, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %43)
  %44 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %44)
  %45 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %45)
  %46 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %46)
  %47 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %47)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_label(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.11, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_jump(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.50, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_jumpifeqs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.83, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @gen_jumpifneqs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void (ptr, ...) @printcode(ptr noundef @.str.84, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @gen_if_label(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = call ptr @malloc(i64 noundef 256) #11
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %19

11:                                               ; preds = %2
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call i64 @llvm.objectsize.i64.p0(ptr %13, i1 false, i1 true, i1 false)
  %15 = load i32, ptr %4, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %12, i64 noundef 256, i32 noundef 0, i64 noundef %14, ptr noundef @.str.86, i32 noundef %15, ptr noundef %16)
  %18 = load ptr, ptr %6, align 8
  store ptr %18, ptr %3, align 8
  br label %19

19:                                               ; preds = %11, %10
  %20 = load ptr, ptr %3, align 8
  ret ptr %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @gen_while_label(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = call ptr @malloc(i64 noundef 256) #11
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %19

11:                                               ; preds = %2
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call i64 @llvm.objectsize.i64.p0(ptr %13, i1 false, i1 true, i1 false)
  %15 = load i32, ptr %4, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %12, i64 noundef 256, i32 noundef 0, i64 noundef %14, ptr noundef @.str.87, i32 noundef %15, ptr noundef %16)
  %18 = load ptr, ptr %6, align 8
  store ptr %18, ptr %3, align 8
  br label %19

19:                                               ; preds = %11, %10
  %20 = load ptr, ptr %3, align 8
  ret ptr %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @stack_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.symtable, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.symtable, ptr %5, i32 0, i32 1
  store i32 0, ptr %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @stack_push(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = call ptr @malloc(i64 noundef 16) #11
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  store i1 false, ptr %3, align 1
  br label %27

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.StackNode, ptr %13, i32 0, i32 0
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.symtable, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.StackNode, ptr %18, i32 0, i32 1
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.symtable, ptr %21, i32 0, i32 0
  store ptr %20, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.symtable, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %24, align 8
  store i1 true, ptr %3, align 1
  br label %27

27:                                               ; preds = %11, %10
  %28 = load i1, ptr %3, align 1
  ret i1 %28
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @stack_pop(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.symtable, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %29

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.symtable, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.StackNode, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.StackNode, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.symtable, ptr %21, i32 0, i32 0
  store ptr %20, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %23)
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.symtable, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %25, align 8
  %28 = load ptr, ptr %5, align 8
  store ptr %28, ptr %2, align 8
  br label %29

29:                                               ; preds = %11, %10
  %30 = load ptr, ptr %2, align 8
  ret ptr %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @stack_top(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.symtable, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %15

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.symtable, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.StackNode, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %2, align 8
  br label %15

15:                                               ; preds = %9, %8
  %16 = load ptr, ptr %2, align 8
  ret ptr %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @stack_is_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.symtable, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @stack_dispose(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %26, %1
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.symtable, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %28

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.symtable, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.StackNode, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.symtable, ptr %16, i32 0, i32 0
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.StackNode, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %26

22:                                               ; preds = %9
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.StackNode, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %25)
  br label %26

26:                                               ; preds = %22, %9
  %27 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %27)
  br label %4

28:                                               ; preds = %4
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.symtable, ptr %29, i32 0, i32 1
  store i32 0, ptr %30, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @token_array_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.TokenArray, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.TokenArray, ptr %5, i32 0, i32 2
  store i32 8, ptr %6, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.TokenArray, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = mul i64 %10, 8
  %12 = call ptr @malloc(i64 noundef %11) #11
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.TokenArray, ptr %13, i32 0, i32 0
  store ptr %12, ptr %14, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @token_array_push(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.TokenArray, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.TokenArray, ptr %10, i32 0, i32 2
  %12 = load i32, ptr %11, align 4
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %35

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.TokenArray, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %16, align 4
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.TokenArray, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.TokenArray, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 4
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 8
  %27 = call ptr @realloc(ptr noundef %21, i64 noundef %26) #14
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %31, label %30

30:                                               ; preds = %14
  store i1 false, ptr %3, align 1
  br label %46

31:                                               ; preds = %14
  %32 = load ptr, ptr %6, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.TokenArray, ptr %33, i32 0, i32 0
  store ptr %32, ptr %34, align 8
  br label %35

35:                                               ; preds = %31, %2
  %36 = load ptr, ptr %5, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.TokenArray, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.TokenArray, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 8
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %41, align 8
  %44 = sext i32 %42 to i64
  %45 = getelementptr inbounds ptr, ptr %39, i64 %44
  store ptr %36, ptr %45, align 8
  store i1 true, ptr %3, align 1
  br label %46

46:                                               ; preds = %35, %30
  %47 = load i1, ptr %3, align 1
  ret i1 %47
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @token_array_dispose(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %4

4:                                                ; preds = %46, %1
  %5 = load i64, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.TokenArray, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = sext i32 %8 to i64
  %10 = icmp ult i64 %5, %9
  br i1 %10, label %11, label %49

11:                                               ; preds = %4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.TokenArray, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load i64, ptr %3, align 8
  %16 = getelementptr inbounds ptr, ptr %14, i64 %15
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %45

19:                                               ; preds = %11
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.TokenArray, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %3, align 8
  %24 = getelementptr inbounds ptr, ptr %22, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.Token, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %38

29:                                               ; preds = %19
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.TokenArray, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load i64, ptr %3, align 8
  %34 = getelementptr inbounds ptr, ptr %32, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.Token, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  call void @free(ptr noundef %37)
  br label %38

38:                                               ; preds = %29, %19
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds %struct.TokenArray, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = load i64, ptr %3, align 8
  %43 = getelementptr inbounds ptr, ptr %41, i64 %42
  %44 = load ptr, ptr %43, align 8
  call void @free(ptr noundef %44)
  br label %45

45:                                               ; preds = %38, %11
  br label %46

46:                                               ; preds = %45
  %47 = load i64, ptr %3, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %3, align 8
  br label %4

49:                                               ; preds = %4
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.TokenArray, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  call void @free(ptr noundef %52)
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.TokenArray, ptr %53, i32 0, i32 0
  store ptr null, ptr %54, align 8
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.TokenArray, ptr %55, i32 0, i32 1
  store i32 0, ptr %56, align 8
  %57 = load ptr, ptr %2, align 8
  %58 = getelementptr inbounds %struct.TokenArray, ptr %57, i32 0, i32 2
  store i32 0, ptr %58, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parser_info, align 8
  store i32 0, ptr %1, align 4
  %4 = call ptr @tmpfile()
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %0
  %8 = load ptr, ptr @__stderrp, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.207) #13
  store i32 99, ptr %1, align 4
  br label %32

10:                                               ; preds = %0
  %11 = load ptr, ptr %2, align 8
  call void @generator_init(ptr noundef %11)
  call void @parser(ptr dead_on_unwind writable sret(%struct.parser_info) align 8 %3)
  %12 = getelementptr inbounds %struct.parser_info, ptr %3, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %10
  %16 = load ptr, ptr @__stdoutp, align 8
  %17 = load ptr, ptr @gen_core, align 8
  %18 = getelementptr inbounds %struct.generator_core, ptr %17, i32 0, i32 0
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %2, align 8
  call void @gen_output_global_defvars(ptr noundef %19)
  %20 = load ptr, ptr %2, align 8
  %21 = call i32 @fclose(ptr noundef %20)
  call void @generator_free()
  br label %25

22:                                               ; preds = %10
  %23 = load ptr, ptr %2, align 8
  %24 = call i32 @fclose(ptr noundef %23)
  call void @generator_free()
  br label %25

25:                                               ; preds = %22, %15
  %26 = getelementptr inbounds %struct.parser_info, ptr %3, i32 0, i32 3
  %27 = getelementptr inbounds %struct.symtable, ptr %26, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %27)
  %28 = getelementptr inbounds %struct.parser_info, ptr %3, i32 0, i32 4
  %29 = getelementptr inbounds %struct.symtable, ptr %28, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %29)
  %30 = getelementptr inbounds %struct.parser_info, ptr %3, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  store i32 %31, ptr %1, align 4
  br label %32

32:                                               ; preds = %25, %7
  %33 = load i32, ptr %1, align 4
  ret i32 %33
}

declare ptr @tmpfile() #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @parser(ptr dead_on_unwind noalias writable sret(%struct.parser_info) align 8 %0) #0 {
  %2 = alloca %struct.Token, align 8
  %3 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 1
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 0
  store i8 0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 2
  %6 = call [2 x i64] @get_token()
  store [2 x i64] %6, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %2, i64 16, i1 false)
  %7 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 3
  call void @init_symtable(ptr noundef %7)
  %8 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 4
  call void @init_symtable(ptr noundef %8)
  %9 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 5
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 5
  %11 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 3
  %12 = call ptr @push_scope(ptr noundef %10, ptr noundef %11)
  %13 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 0, ptr noundef %0)
  %14 = zext i1 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %27

16:                                               ; preds = %1
  %17 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %16
  %21 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  br label %24

23:                                               ; preds = %16
  br label %24

24:                                               ; preds = %23, %20
  %25 = phi i32 [ %22, %20 ], [ 2, %23 ]
  %26 = getelementptr inbounds %struct.parser_info, ptr %0, i32 0, i32 1
  store i32 %25, ptr %26, align 4
  br label %27

27:                                               ; preds = %24, %1
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #8

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @process_rule(i32 noundef %0, ptr noundef %1, ...) #0 {
  %3 = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i64, align 8
  %28 = alloca i32, align 4
  %29 = alloca %struct.symtable, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca [256 x i8], align 1
  %34 = alloca %struct.symtable, align 8
  %35 = alloca %struct.symtable, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca i32, align 4
  %40 = alloca [256 x i8], align 1
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca %struct.Token, align 8
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i64, align 8
  %62 = alloca i32, align 4
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca ptr, align 8
  %67 = alloca ptr, align 8
  %68 = alloca ptr, align 8
  %69 = alloca ptr, align 8
  %70 = alloca ptr, align 8
  %71 = alloca ptr, align 8
  %72 = alloca i32, align 4
  %73 = alloca [256 x i8], align 1
  %74 = alloca ptr, align 8
  %75 = alloca ptr, align 8
  %76 = alloca ptr, align 8
  %77 = alloca ptr, align 8
  %78 = alloca ptr, align 8
  %79 = alloca ptr, align 8
  %80 = alloca ptr, align 8
  %81 = alloca ptr, align 8
  %82 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds %struct.parser_info, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %88

87:                                               ; preds = %2
  store i1 false, ptr %3, align 1
  br label %2163

88:                                               ; preds = %2
  call void @llvm.va_start.p0(ptr %6)
  store ptr null, ptr %7, align 8
  store ptr null, ptr %8, align 8
  store ptr null, ptr %9, align 8
  %89 = load i32, ptr %4, align 4
  %90 = icmp eq i32 %89, 7
  br i1 %90, label %106, label %91

91:                                               ; preds = %88
  %92 = load i32, ptr %4, align 4
  %93 = icmp eq i32 %92, 9
  br i1 %93, label %106, label %94

94:                                               ; preds = %91
  %95 = load i32, ptr %4, align 4
  %96 = icmp eq i32 %95, 12
  br i1 %96, label %106, label %97

97:                                               ; preds = %94
  %98 = load i32, ptr %4, align 4
  %99 = icmp eq i32 %98, 13
  br i1 %99, label %106, label %100

100:                                              ; preds = %97
  %101 = load i32, ptr %4, align 4
  %102 = icmp eq i32 %101, 10
  br i1 %102, label %106, label %103

103:                                              ; preds = %100
  %104 = load i32, ptr %4, align 4
  %105 = icmp eq i32 %104, 11
  br i1 %105, label %106, label %109

106:                                              ; preds = %103, %100, %97, %94, %91, %88
  %107 = va_arg ptr %6, ptr
  store ptr %107, ptr %10, align 8
  %108 = load ptr, ptr %10, align 8
  store ptr %108, ptr %7, align 8
  br label %118

109:                                              ; preds = %103
  %110 = load i32, ptr %4, align 4
  %111 = icmp eq i32 %110, 17
  br i1 %111, label %112, label %117

112:                                              ; preds = %109
  %113 = va_arg ptr %6, ptr
  store ptr %113, ptr %11, align 8
  %114 = load ptr, ptr %11, align 8
  store ptr %114, ptr %8, align 8
  %115 = va_arg ptr %6, ptr
  store ptr %115, ptr %12, align 8
  %116 = load ptr, ptr %12, align 8
  store ptr %116, ptr %9, align 8
  br label %117

117:                                              ; preds = %112, %109
  br label %118

118:                                              ; preds = %117, %106
  call void @llvm.va_end.p0(ptr %6)
  %119 = load i32, ptr %4, align 4
  switch i32 %119, label %2161 [
    i32 0, label %120
    i32 1, label %158
    i32 2, label %224
    i32 4, label %296
    i32 3, label %366
    i32 5, label %404
    i32 19, label %510
    i32 22, label %595
    i32 6, label %656
    i32 7, label %832
    i32 8, label %930
    i32 9, label %952
    i32 12, label %1092
    i32 13, label %1204
    i32 14, label %1340
    i32 20, label %1408
    i32 18, label %1774
    i32 10, label %1863
    i32 11, label %1973
    i32 21, label %2080
    i32 17, label %2105
    i32 23, label %2127
    i32 24, label %2140
  ]

120:                                              ; preds = %118
  %121 = load ptr, ptr %5, align 8
  %122 = getelementptr inbounds %struct.parser_info, ptr %121, i32 0, i32 2
  %123 = getelementptr inbounds %struct.Token, ptr %122, i32 0, i32 0
  %124 = load i32, ptr %123, align 8
  %125 = icmp eq i32 %124, 37
  br i1 %125, label %126, label %131

126:                                              ; preds = %120
  %127 = load ptr, ptr %5, align 8
  %128 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %127)
  br i1 %128, label %130, label %129

129:                                              ; preds = %126
  store i1 false, ptr %3, align 1
  br label %2163

130:                                              ; preds = %126
  br label %131

131:                                              ; preds = %130, %120
  %132 = load ptr, ptr %5, align 8
  %133 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 1, ptr noundef %132)
  br i1 %133, label %135, label %134

134:                                              ; preds = %131
  store i1 false, ptr %3, align 1
  br label %2163

135:                                              ; preds = %131
  %136 = load ptr, ptr %5, align 8
  %137 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %136)
  %138 = load ptr, ptr %5, align 8
  %139 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 2, ptr noundef %138)
  br i1 %139, label %141, label %140

140:                                              ; preds = %135
  store i1 false, ptr %3, align 1
  br label %2163

141:                                              ; preds = %135
  %142 = load ptr, ptr %5, align 8
  %143 = getelementptr inbounds %struct.parser_info, ptr %142, i32 0, i32 3
  %144 = getelementptr inbounds %struct.symtable, ptr %143, i32 0, i32 0
  %145 = load ptr, ptr %144, align 8
  %146 = call zeroext i1 @check_main_function_presence(ptr noundef %145)
  br i1 %146, label %149, label %147

147:                                              ; preds = %141
  %148 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %148, i32 noundef 3, ptr noundef @.str.4.210)
  store i1 false, ptr %3, align 1
  br label %2163

149:                                              ; preds = %141
  %150 = load ptr, ptr %5, align 8
  %151 = getelementptr inbounds %struct.parser_info, ptr %150, i32 0, i32 4
  %152 = load ptr, ptr %5, align 8
  %153 = getelementptr inbounds %struct.parser_info, ptr %152, i32 0, i32 3
  %154 = call zeroext i1 @check_called_functions_exist(ptr noundef %151, ptr noundef %153)
  br i1 %154, label %157, label %155

155:                                              ; preds = %149
  %156 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %156, i32 noundef 3, ptr noundef @.str.5.211)
  store i1 false, ptr %3, align 1
  br label %2163

157:                                              ; preds = %149
  store i1 true, ptr %3, align 1
  br label %2163

158:                                              ; preds = %118
  %159 = load ptr, ptr %5, align 8
  %160 = getelementptr inbounds %struct.parser_info, ptr %159, i32 0, i32 2
  %161 = getelementptr inbounds %struct.Token, ptr %160, i32 0, i32 0
  %162 = load i32, ptr %161, align 8
  %163 = icmp ne i32 %162, 15
  br i1 %163, label %164, label %166

164:                                              ; preds = %158
  %165 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %165, i32 noundef 2, ptr noundef @.str.6.212)
  store i1 false, ptr %3, align 1
  br label %2163

166:                                              ; preds = %158
  %167 = load ptr, ptr %5, align 8
  %168 = call zeroext i1 @safe_get_token(ptr noundef %167)
  br i1 %168, label %170, label %169

169:                                              ; preds = %166
  store i1 false, ptr %3, align 1
  br label %2163

170:                                              ; preds = %166
  %171 = load ptr, ptr %5, align 8
  %172 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %171)
  br i1 %172, label %174, label %173

173:                                              ; preds = %170
  store i1 false, ptr %3, align 1
  br label %2163

174:                                              ; preds = %170
  %175 = load ptr, ptr %5, align 8
  %176 = getelementptr inbounds %struct.parser_info, ptr %175, i32 0, i32 2
  %177 = getelementptr inbounds %struct.Token, ptr %176, i32 0, i32 0
  %178 = load i32, ptr %177, align 8
  %179 = icmp ne i32 %178, 2
  br i1 %179, label %187, label %180

180:                                              ; preds = %174
  %181 = load ptr, ptr %5, align 8
  %182 = getelementptr inbounds %struct.parser_info, ptr %181, i32 0, i32 2
  %183 = getelementptr inbounds %struct.Token, ptr %182, i32 0, i32 1
  %184 = load ptr, ptr %183, align 8
  %185 = call i32 @strcmp(ptr noundef %184, ptr noundef @.str.7.213) #13
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %189

187:                                              ; preds = %180, %174
  %188 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %188, i32 noundef 2, ptr noundef @.str.8.214)
  store i1 false, ptr %3, align 1
  br label %2163

189:                                              ; preds = %180
  %190 = load ptr, ptr %5, align 8
  %191 = call zeroext i1 @safe_get_token(ptr noundef %190)
  br i1 %191, label %193, label %192

192:                                              ; preds = %189
  store i1 false, ptr %3, align 1
  br label %2163

193:                                              ; preds = %189
  %194 = load ptr, ptr %5, align 8
  %195 = getelementptr inbounds %struct.parser_info, ptr %194, i32 0, i32 2
  %196 = getelementptr inbounds %struct.Token, ptr %195, i32 0, i32 0
  %197 = load i32, ptr %196, align 8
  %198 = icmp ne i32 %197, 16
  br i1 %198, label %199, label %201

199:                                              ; preds = %193
  %200 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %200, i32 noundef 2, ptr noundef @.str.9.215)
  store i1 false, ptr %3, align 1
  br label %2163

201:                                              ; preds = %193
  %202 = load ptr, ptr %5, align 8
  %203 = call zeroext i1 @safe_get_token(ptr noundef %202)
  br i1 %203, label %205, label %204

204:                                              ; preds = %201
  store i1 false, ptr %3, align 1
  br label %2163

205:                                              ; preds = %201
  %206 = load ptr, ptr %5, align 8
  %207 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %206)
  br i1 %207, label %209, label %208

208:                                              ; preds = %205
  store i1 false, ptr %3, align 1
  br label %2163

209:                                              ; preds = %205
  %210 = load ptr, ptr %5, align 8
  %211 = getelementptr inbounds %struct.parser_info, ptr %210, i32 0, i32 2
  %212 = getelementptr inbounds %struct.Token, ptr %211, i32 0, i32 0
  %213 = load i32, ptr %212, align 8
  %214 = icmp ne i32 %213, 13
  br i1 %214, label %215, label %217

215:                                              ; preds = %209
  %216 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %216, i32 noundef 2, ptr noundef @.str.10.216)
  store i1 false, ptr %3, align 1
  br label %2163

217:                                              ; preds = %209
  %218 = load ptr, ptr %5, align 8
  %219 = call zeroext i1 @safe_get_token(ptr noundef %218)
  br i1 %219, label %221, label %220

220:                                              ; preds = %217
  store i1 false, ptr %3, align 1
  br label %2163

221:                                              ; preds = %217
  %222 = load ptr, ptr %5, align 8
  %223 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %222)
  store i1 %223, ptr %3, align 1
  br label %2163

224:                                              ; preds = %118
  %225 = load ptr, ptr %5, align 8
  %226 = getelementptr inbounds %struct.parser_info, ptr %225, i32 0, i32 2
  %227 = getelementptr inbounds %struct.Token, ptr %226, i32 0, i32 0
  %228 = load i32, ptr %227, align 8
  %229 = icmp ne i32 %228, 6
  br i1 %229, label %230, label %232

230:                                              ; preds = %224
  %231 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %231, i32 noundef 2, ptr noundef @.str.11.217)
  store i1 false, ptr %3, align 1
  br label %2163

232:                                              ; preds = %224
  %233 = load ptr, ptr %5, align 8
  %234 = call zeroext i1 @safe_get_token(ptr noundef %233)
  br i1 %234, label %236, label %235

235:                                              ; preds = %232
  store i1 false, ptr %3, align 1
  br label %2163

236:                                              ; preds = %232
  %237 = load ptr, ptr %5, align 8
  %238 = getelementptr inbounds %struct.parser_info, ptr %237, i32 0, i32 2
  %239 = getelementptr inbounds %struct.Token, ptr %238, i32 0, i32 0
  %240 = load i32, ptr %239, align 8
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %249, label %242

242:                                              ; preds = %236
  %243 = load ptr, ptr %5, align 8
  %244 = getelementptr inbounds %struct.parser_info, ptr %243, i32 0, i32 2
  %245 = getelementptr inbounds %struct.Token, ptr %244, i32 0, i32 1
  %246 = load ptr, ptr %245, align 8
  %247 = call i32 @strcmp(ptr noundef %246, ptr noundef @.str.12.218) #13
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %251

249:                                              ; preds = %242, %236
  %250 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %250, i32 noundef 2, ptr noundef @.str.13.219)
  store i1 false, ptr %3, align 1
  br label %2163

251:                                              ; preds = %242
  %252 = load ptr, ptr %5, align 8
  %253 = call zeroext i1 @safe_get_token(ptr noundef %252)
  br i1 %253, label %255, label %254

254:                                              ; preds = %251
  store i1 false, ptr %3, align 1
  br label %2163

255:                                              ; preds = %251
  %256 = load ptr, ptr %5, align 8
  %257 = getelementptr inbounds %struct.parser_info, ptr %256, i32 0, i32 2
  %258 = getelementptr inbounds %struct.Token, ptr %257, i32 0, i32 0
  %259 = load i32, ptr %258, align 8
  %260 = icmp ne i32 %259, 33
  br i1 %260, label %261, label %263

261:                                              ; preds = %255
  %262 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %262, i32 noundef 2, ptr noundef @.str.14.220)
  store i1 false, ptr %3, align 1
  br label %2163

263:                                              ; preds = %255
  %264 = load ptr, ptr %5, align 8
  %265 = call zeroext i1 @safe_get_token(ptr noundef %264)
  br i1 %265, label %267, label %266

266:                                              ; preds = %263
  store i1 false, ptr %3, align 1
  br label %2163

267:                                              ; preds = %263
  %268 = load ptr, ptr %5, align 8
  %269 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 3, ptr noundef %268)
  br i1 %269, label %271, label %270

270:                                              ; preds = %267
  store i1 false, ptr %3, align 1
  br label %2163

271:                                              ; preds = %267
  %272 = load ptr, ptr %5, align 8
  %273 = getelementptr inbounds %struct.parser_info, ptr %272, i32 0, i32 2
  %274 = getelementptr inbounds %struct.Token, ptr %273, i32 0, i32 0
  %275 = load i32, ptr %274, align 8
  %276 = icmp ne i32 %275, 34
  br i1 %276, label %277, label %279

277:                                              ; preds = %271
  %278 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %278, i32 noundef 2, ptr noundef @.str.15.221)
  store i1 false, ptr %3, align 1
  br label %2163

279:                                              ; preds = %271
  %280 = load ptr, ptr %5, align 8
  %281 = call zeroext i1 @safe_get_token(ptr noundef %280)
  br i1 %281, label %283, label %282

282:                                              ; preds = %279
  store i1 false, ptr %3, align 1
  br label %2163

283:                                              ; preds = %279
  %284 = load ptr, ptr %5, align 8
  %285 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %284)
  br i1 %285, label %287, label %286

286:                                              ; preds = %283
  store i1 false, ptr %3, align 1
  br label %2163

287:                                              ; preds = %283
  %288 = load ptr, ptr %5, align 8
  %289 = getelementptr inbounds %struct.parser_info, ptr %288, i32 0, i32 2
  %290 = getelementptr inbounds %struct.Token, ptr %289, i32 0, i32 0
  %291 = load i32, ptr %290, align 8
  %292 = icmp ne i32 %291, 38
  br i1 %292, label %293, label %295

293:                                              ; preds = %287
  %294 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %294, i32 noundef 2, ptr noundef @.str.16.222)
  store i1 false, ptr %3, align 1
  br label %2163

295:                                              ; preds = %287
  store i1 true, ptr %3, align 1
  br label %2163

296:                                              ; preds = %118
  %297 = load ptr, ptr %5, align 8
  %298 = getelementptr inbounds %struct.parser_info, ptr %297, i32 0, i32 2
  %299 = getelementptr inbounds %struct.Token, ptr %298, i32 0, i32 0
  %300 = load i32, ptr %299, align 8
  %301 = icmp ne i32 %300, 33
  br i1 %301, label %302, label %304

302:                                              ; preds = %296
  %303 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %303, i32 noundef 2, ptr noundef @.str.17.223)
  store i1 false, ptr %3, align 1
  br label %2163

304:                                              ; preds = %296
  %305 = call ptr @malloc(i64 noundef 16) #11
  store ptr %305, ptr %13, align 8
  %306 = load ptr, ptr %13, align 8
  %307 = icmp eq ptr %306, null
  br i1 %307, label %308, label %310

308:                                              ; preds = %304
  %309 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %309, i32 noundef 99, ptr noundef @.str.18.224)
  store i1 false, ptr %3, align 1
  br label %2163

310:                                              ; preds = %304
  %311 = load ptr, ptr %13, align 8
  call void @init_symtable(ptr noundef %311)
  %312 = load ptr, ptr %5, align 8
  %313 = getelementptr inbounds %struct.parser_info, ptr %312, i32 0, i32 5
  %314 = load ptr, ptr %13, align 8
  %315 = call ptr @push_scope(ptr noundef %313, ptr noundef %314)
  %316 = icmp eq ptr %315, null
  br i1 %316, label %317, label %320

317:                                              ; preds = %310
  %318 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %318, i32 noundef 99, ptr noundef @.str.19.225)
  %319 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %319)
  store i1 false, ptr %3, align 1
  br label %2163

320:                                              ; preds = %310
  %321 = load ptr, ptr %5, align 8
  %322 = call zeroext i1 @safe_get_token(ptr noundef %321)
  br i1 %322, label %329, label %323

323:                                              ; preds = %320
  %324 = load ptr, ptr %5, align 8
  %325 = getelementptr inbounds %struct.parser_info, ptr %324, i32 0, i32 5
  call void @pop_scope(ptr noundef %325)
  %326 = load ptr, ptr %13, align 8
  %327 = getelementptr inbounds %struct.symtable, ptr %326, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %327)
  %328 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %328)
  store i1 false, ptr %3, align 1
  br label %2163

329:                                              ; preds = %320
  %330 = load ptr, ptr %5, align 8
  %331 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %330)
  br i1 %331, label %338, label %332

332:                                              ; preds = %329
  %333 = load ptr, ptr %5, align 8
  %334 = getelementptr inbounds %struct.parser_info, ptr %333, i32 0, i32 5
  call void @pop_scope(ptr noundef %334)
  %335 = load ptr, ptr %13, align 8
  %336 = getelementptr inbounds %struct.symtable, ptr %335, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %336)
  %337 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %337)
  store i1 false, ptr %3, align 1
  br label %2163

338:                                              ; preds = %329
  %339 = load ptr, ptr %5, align 8
  %340 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 5, ptr noundef %339)
  br i1 %340, label %347, label %341

341:                                              ; preds = %338
  %342 = load ptr, ptr %5, align 8
  %343 = getelementptr inbounds %struct.parser_info, ptr %342, i32 0, i32 5
  call void @pop_scope(ptr noundef %343)
  %344 = load ptr, ptr %13, align 8
  %345 = getelementptr inbounds %struct.symtable, ptr %344, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %345)
  %346 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %346)
  store i1 false, ptr %3, align 1
  br label %2163

347:                                              ; preds = %338
  %348 = load ptr, ptr %5, align 8
  %349 = getelementptr inbounds %struct.parser_info, ptr %348, i32 0, i32 2
  %350 = getelementptr inbounds %struct.Token, ptr %349, i32 0, i32 0
  %351 = load i32, ptr %350, align 8
  %352 = icmp ne i32 %351, 34
  br i1 %352, label %353, label %360

353:                                              ; preds = %347
  %354 = load ptr, ptr %5, align 8
  %355 = getelementptr inbounds %struct.parser_info, ptr %354, i32 0, i32 5
  call void @pop_scope(ptr noundef %355)
  %356 = load ptr, ptr %13, align 8
  %357 = getelementptr inbounds %struct.symtable, ptr %356, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %357)
  %358 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %358)
  %359 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %359, i32 noundef 2, ptr noundef @.str.14.220)
  store i1 false, ptr %3, align 1
  br label %2163

360:                                              ; preds = %347
  %361 = load ptr, ptr %5, align 8
  %362 = getelementptr inbounds %struct.parser_info, ptr %361, i32 0, i32 5
  call void @pop_scope(ptr noundef %362)
  %363 = load ptr, ptr %13, align 8
  %364 = getelementptr inbounds %struct.symtable, ptr %363, i32 0, i32 0
  call void @symtable_dispose(ptr noundef %364)
  %365 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %365)
  store i1 true, ptr %3, align 1
  br label %2163

366:                                              ; preds = %118
  %367 = load ptr, ptr %5, align 8
  %368 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %367)
  br i1 %368, label %370, label %369

369:                                              ; preds = %366
  store i1 false, ptr %3, align 1
  br label %2163

370:                                              ; preds = %366
  %371 = load ptr, ptr %5, align 8
  %372 = getelementptr inbounds %struct.parser_info, ptr %371, i32 0, i32 2
  %373 = getelementptr inbounds %struct.Token, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = icmp eq i32 %374, 14
  br i1 %375, label %376, label %381

376:                                              ; preds = %370
  %377 = load ptr, ptr %5, align 8
  %378 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 6, ptr noundef %377)
  br i1 %378, label %380, label %379

379:                                              ; preds = %376
  store i1 false, ptr %3, align 1
  br label %2163

380:                                              ; preds = %376
  br label %390

381:                                              ; preds = %370
  %382 = load ptr, ptr %5, align 8
  %383 = getelementptr inbounds %struct.parser_info, ptr %382, i32 0, i32 2
  %384 = getelementptr inbounds %struct.Token, ptr %383, i32 0, i32 0
  %385 = load i32, ptr %384, align 8
  %386 = icmp eq i32 %385, 34
  br i1 %386, label %387, label %388

387:                                              ; preds = %381
  store i1 true, ptr %3, align 1
  br label %2163

388:                                              ; preds = %381
  %389 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %389, i32 noundef 2, ptr noundef @.str.20.226)
  store i1 false, ptr %3, align 1
  br label %2163

390:                                              ; preds = %380
  %391 = load ptr, ptr %5, align 8
  %392 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %391)
  br i1 %392, label %394, label %393

393:                                              ; preds = %390
  store i1 false, ptr %3, align 1
  br label %2163

394:                                              ; preds = %390
  %395 = load ptr, ptr %5, align 8
  %396 = getelementptr inbounds %struct.parser_info, ptr %395, i32 0, i32 2
  %397 = getelementptr inbounds %struct.Token, ptr %396, i32 0, i32 0
  %398 = load i32, ptr %397, align 8
  %399 = icmp eq i32 %398, 34
  br i1 %399, label %400, label %401

400:                                              ; preds = %394
  store i1 true, ptr %3, align 1
  br label %2163

401:                                              ; preds = %394
  %402 = load ptr, ptr %5, align 8
  %403 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 3, ptr noundef %402)
  store i1 %403, ptr %3, align 1
  br label %2163

404:                                              ; preds = %118
  %405 = load ptr, ptr %5, align 8
  %406 = getelementptr inbounds %struct.parser_info, ptr %405, i32 0, i32 2
  %407 = getelementptr inbounds %struct.Token, ptr %406, i32 0, i32 0
  %408 = load i32, ptr %407, align 8
  %409 = icmp eq i32 %408, 34
  br i1 %409, label %410, label %411

410:                                              ; preds = %404
  store i1 true, ptr %3, align 1
  br label %2163

411:                                              ; preds = %404
  %412 = load ptr, ptr %5, align 8
  %413 = getelementptr inbounds %struct.parser_info, ptr %412, i32 0, i32 2
  %414 = getelementptr inbounds %struct.Token, ptr %413, i32 0, i32 0
  %415 = load i32, ptr %414, align 8
  %416 = icmp eq i32 %415, 11
  br i1 %416, label %417, label %422

417:                                              ; preds = %411
  %418 = load ptr, ptr %5, align 8
  %419 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 14, ptr noundef %418)
  br i1 %419, label %421, label %420

420:                                              ; preds = %417
  store i1 false, ptr %3, align 1
  br label %2163

421:                                              ; preds = %417
  br label %502

422:                                              ; preds = %411
  %423 = load ptr, ptr %5, align 8
  %424 = getelementptr inbounds %struct.parser_info, ptr %423, i32 0, i32 2
  %425 = getelementptr inbounds %struct.Token, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = icmp eq i32 %426, 0
  br i1 %427, label %434, label %428

428:                                              ; preds = %422
  %429 = load ptr, ptr %5, align 8
  %430 = getelementptr inbounds %struct.parser_info, ptr %429, i32 0, i32 2
  %431 = getelementptr inbounds %struct.Token, ptr %430, i32 0, i32 0
  %432 = load i32, ptr %431, align 8
  %433 = icmp eq i32 %432, 1
  br i1 %433, label %434, label %439

434:                                              ; preds = %428, %422
  %435 = load ptr, ptr %5, align 8
  %436 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 20, ptr noundef %435)
  br i1 %436, label %438, label %437

437:                                              ; preds = %434
  store i1 false, ptr %3, align 1
  br label %2163

438:                                              ; preds = %434
  br label %501

439:                                              ; preds = %428
  %440 = load ptr, ptr %5, align 8
  %441 = getelementptr inbounds %struct.parser_info, ptr %440, i32 0, i32 2
  %442 = getelementptr inbounds %struct.Token, ptr %441, i32 0, i32 0
  %443 = load i32, ptr %442, align 8
  %444 = icmp eq i32 %443, 7
  br i1 %444, label %445, label %450

445:                                              ; preds = %439
  %446 = load ptr, ptr %5, align 8
  %447 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 19, ptr noundef %446)
  br i1 %447, label %449, label %448

448:                                              ; preds = %445
  store i1 false, ptr %3, align 1
  br label %2163

449:                                              ; preds = %445
  br label %500

450:                                              ; preds = %439
  %451 = load ptr, ptr %5, align 8
  %452 = getelementptr inbounds %struct.parser_info, ptr %451, i32 0, i32 2
  %453 = getelementptr inbounds %struct.Token, ptr %452, i32 0, i32 0
  %454 = load i32, ptr %453, align 8
  %455 = icmp eq i32 %454, 12
  br i1 %455, label %456, label %461

456:                                              ; preds = %450
  %457 = load ptr, ptr %5, align 8
  %458 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 22, ptr noundef %457)
  br i1 %458, label %460, label %459

459:                                              ; preds = %456
  store i1 false, ptr %3, align 1
  br label %2163

460:                                              ; preds = %456
  br label %499

461:                                              ; preds = %450
  %462 = load ptr, ptr %5, align 8
  %463 = getelementptr inbounds %struct.parser_info, ptr %462, i32 0, i32 2
  %464 = getelementptr inbounds %struct.Token, ptr %463, i32 0, i32 0
  %465 = load i32, ptr %464, align 8
  %466 = icmp eq i32 %465, 33
  br i1 %466, label %467, label %476

467:                                              ; preds = %461
  %468 = load ptr, ptr %5, align 8
  %469 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %468)
  br i1 %469, label %471, label %470

470:                                              ; preds = %467
  store i1 false, ptr %3, align 1
  br label %2163

471:                                              ; preds = %467
  %472 = load ptr, ptr %5, align 8
  %473 = call zeroext i1 @safe_get_token(ptr noundef %472)
  br i1 %473, label %475, label %474

474:                                              ; preds = %471
  store i1 false, ptr %3, align 1
  br label %2163

475:                                              ; preds = %471
  br label %498

476:                                              ; preds = %461
  %477 = load ptr, ptr %5, align 8
  %478 = getelementptr inbounds %struct.parser_info, ptr %477, i32 0, i32 2
  %479 = getelementptr inbounds %struct.Token, ptr %478, i32 0, i32 0
  %480 = load i32, ptr %479, align 8
  %481 = icmp eq i32 %480, 10
  br i1 %481, label %482, label %495

482:                                              ; preds = %476
  %483 = load ptr, ptr %5, align 8
  %484 = getelementptr inbounds %struct.parser_info, ptr %483, i32 0, i32 0
  %485 = load i8, ptr %484, align 8
  %486 = trunc i8 %485 to i1
  br i1 %486, label %487, label %492

487:                                              ; preds = %482
  %488 = load ptr, ptr %5, align 8
  %489 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 21, ptr noundef %488)
  br i1 %489, label %491, label %490

490:                                              ; preds = %487
  store i1 false, ptr %3, align 1
  br label %2163

491:                                              ; preds = %487
  br label %494

492:                                              ; preds = %482
  %493 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %493, i32 noundef 2, ptr noundef @.str.21.227)
  store i1 false, ptr %3, align 1
  br label %2163

494:                                              ; preds = %491
  br label %497

495:                                              ; preds = %476
  %496 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %496, i32 noundef 2, ptr noundef @.str.22.228)
  store i1 false, ptr %3, align 1
  br label %2163

497:                                              ; preds = %494
  br label %498

498:                                              ; preds = %497, %475
  br label %499

499:                                              ; preds = %498, %460
  br label %500

500:                                              ; preds = %499, %449
  br label %501

501:                                              ; preds = %500, %438
  br label %502

502:                                              ; preds = %501, %421
  br label %503

503:                                              ; preds = %502
  %504 = load ptr, ptr %5, align 8
  %505 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %504)
  br i1 %505, label %507, label %506

506:                                              ; preds = %503
  store i1 false, ptr %3, align 1
  br label %2163

507:                                              ; preds = %503
  %508 = load ptr, ptr %5, align 8
  %509 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 5, ptr noundef %508)
  store i1 %509, ptr %3, align 1
  br label %2163

510:                                              ; preds = %118
  %511 = load ptr, ptr %5, align 8
  %512 = call zeroext i1 @safe_get_token(ptr noundef %511)
  br i1 %512, label %514, label %513

513:                                              ; preds = %510
  store i1 false, ptr %3, align 1
  br label %2163

514:                                              ; preds = %510
  %515 = load ptr, ptr %5, align 8
  %516 = getelementptr inbounds %struct.parser_info, ptr %515, i32 0, i32 2
  %517 = getelementptr inbounds %struct.Token, ptr %516, i32 0, i32 0
  %518 = load i32, ptr %517, align 8
  %519 = icmp ne i32 %518, 31
  br i1 %519, label %520, label %522

520:                                              ; preds = %514
  %521 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %521, i32 noundef 2, ptr noundef @.str.23.229)
  store i1 false, ptr %3, align 1
  br label %2163

522:                                              ; preds = %514
  %523 = load ptr, ptr %5, align 8
  %524 = call zeroext i1 @safe_get_token(ptr noundef %523)
  br i1 %524, label %526, label %525

525:                                              ; preds = %522
  store i1 false, ptr %3, align 1
  br label %2163

526:                                              ; preds = %522
  %527 = load ptr, ptr @gen_core, align 8
  %528 = getelementptr inbounds %struct.generator_core, ptr %527, i32 0, i32 6
  %529 = load i32, ptr %528, align 8
  %530 = add nsw i32 %529, 1
  store i32 %530, ptr %528, align 8
  store i32 %529, ptr %14, align 4
  %531 = load i32, ptr %14, align 4
  %532 = call ptr @gen_if_label(i32 noundef %531, ptr noundef @.str.24.230)
  store ptr %532, ptr %15, align 8
  %533 = load i32, ptr %14, align 4
  %534 = call ptr @gen_if_label(i32 noundef %533, ptr noundef @.str.25.231)
  store ptr %534, ptr %16, align 8
  store ptr null, ptr %17, align 8
  %535 = load ptr, ptr %5, align 8
  %536 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %535, ptr noundef %17, ptr noundef null)
  br i1 %536, label %540, label %537

537:                                              ; preds = %526
  %538 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %538)
  %539 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %539)
  store i1 false, ptr %3, align 1
  br label %2163

540:                                              ; preds = %526
  %541 = load ptr, ptr %5, align 8
  %542 = getelementptr inbounds %struct.parser_info, ptr %541, i32 0, i32 2
  %543 = getelementptr inbounds %struct.Token, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = icmp ne i32 %544, 32
  br i1 %545, label %546, label %550

546:                                              ; preds = %540
  %547 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %547, i32 noundef 2, ptr noundef @.str.26.232)
  %548 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %548)
  %549 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %549)
  store i1 false, ptr %3, align 1
  br label %2163

550:                                              ; preds = %540
  call void @gen_pushs_bool(i1 noundef zeroext true)
  %551 = load ptr, ptr %15, align 8
  call void @gen_jumpifneqs(ptr noundef %551)
  %552 = load ptr, ptr %5, align 8
  %553 = call zeroext i1 @safe_get_token(ptr noundef %552)
  br i1 %553, label %555, label %554

554:                                              ; preds = %550
  store i1 false, ptr %3, align 1
  br label %2163

555:                                              ; preds = %550
  %556 = load ptr, ptr %5, align 8
  %557 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %556)
  br i1 %557, label %561, label %558

558:                                              ; preds = %555
  %559 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %559)
  %560 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %560)
  store i1 false, ptr %3, align 1
  br label %2163

561:                                              ; preds = %555
  %562 = load ptr, ptr %5, align 8
  %563 = call zeroext i1 @safe_get_token(ptr noundef %562)
  br i1 %563, label %565, label %564

564:                                              ; preds = %561
  store i1 false, ptr %3, align 1
  br label %2163

565:                                              ; preds = %561
  %566 = load ptr, ptr %16, align 8
  call void @gen_jump(ptr noundef %566)
  %567 = load ptr, ptr %15, align 8
  call void @gen_label(ptr noundef %567)
  %568 = load ptr, ptr %5, align 8
  %569 = getelementptr inbounds %struct.parser_info, ptr %568, i32 0, i32 2
  %570 = getelementptr inbounds %struct.Token, ptr %569, i32 0, i32 0
  %571 = load i32, ptr %570, align 8
  %572 = icmp ne i32 %571, 8
  br i1 %572, label %573, label %577

573:                                              ; preds = %565
  %574 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %574, i32 noundef 2, ptr noundef @.str.27.233)
  %575 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %575)
  %576 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %576)
  store i1 false, ptr %3, align 1
  br label %2163

577:                                              ; preds = %565
  %578 = load ptr, ptr %5, align 8
  %579 = call zeroext i1 @safe_get_token(ptr noundef %578)
  br i1 %579, label %581, label %580

580:                                              ; preds = %577
  store i1 false, ptr %3, align 1
  br label %2163

581:                                              ; preds = %577
  %582 = load ptr, ptr %5, align 8
  %583 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %582)
  br i1 %583, label %587, label %584

584:                                              ; preds = %581
  %585 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %585)
  %586 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %586)
  store i1 false, ptr %3, align 1
  br label %2163

587:                                              ; preds = %581
  %588 = load ptr, ptr %5, align 8
  %589 = call zeroext i1 @safe_get_token(ptr noundef %588)
  br i1 %589, label %591, label %590

590:                                              ; preds = %587
  store i1 false, ptr %3, align 1
  br label %2163

591:                                              ; preds = %587
  %592 = load ptr, ptr %16, align 8
  call void @gen_label(ptr noundef %592)
  %593 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %593)
  %594 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %594)
  store i1 true, ptr %3, align 1
  br label %2163

595:                                              ; preds = %118
  %596 = load ptr, ptr %5, align 8
  %597 = call zeroext i1 @safe_get_token(ptr noundef %596)
  br i1 %597, label %599, label %598

598:                                              ; preds = %595
  store i1 false, ptr %3, align 1
  br label %2163

599:                                              ; preds = %595
  %600 = load ptr, ptr %5, align 8
  %601 = getelementptr inbounds %struct.parser_info, ptr %600, i32 0, i32 2
  %602 = getelementptr inbounds %struct.Token, ptr %601, i32 0, i32 0
  %603 = load i32, ptr %602, align 8
  %604 = icmp ne i32 %603, 31
  br i1 %604, label %605, label %607

605:                                              ; preds = %599
  %606 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %606, i32 noundef 2, ptr noundef @.str.28.234)
  store i1 false, ptr %3, align 1
  br label %2163

607:                                              ; preds = %599
  %608 = load ptr, ptr %5, align 8
  %609 = call zeroext i1 @safe_get_token(ptr noundef %608)
  br i1 %609, label %611, label %610

610:                                              ; preds = %607
  store i1 false, ptr %3, align 1
  br label %2163

611:                                              ; preds = %607
  %612 = load ptr, ptr @gen_core, align 8
  %613 = getelementptr inbounds %struct.generator_core, ptr %612, i32 0, i32 7
  %614 = load i32, ptr %613, align 4
  %615 = add nsw i32 %614, 1
  store i32 %615, ptr %613, align 4
  store i32 %614, ptr %18, align 4
  %616 = load i32, ptr %18, align 4
  %617 = call ptr @gen_while_label(i32 noundef %616, ptr noundef @.str.29.235)
  store ptr %617, ptr %19, align 8
  %618 = load i32, ptr %18, align 4
  %619 = call ptr @gen_while_label(i32 noundef %618, ptr noundef @.str.25.231)
  store ptr %619, ptr %20, align 8
  %620 = load ptr, ptr %19, align 8
  call void @gen_label(ptr noundef %620)
  store ptr null, ptr %21, align 8
  %621 = load ptr, ptr %5, align 8
  %622 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %621, ptr noundef %21, ptr noundef null)
  br i1 %622, label %626, label %623

623:                                              ; preds = %611
  %624 = load ptr, ptr %19, align 8
  call void @free(ptr noundef %624)
  %625 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %625)
  store i1 false, ptr %3, align 1
  br label %2163

626:                                              ; preds = %611
  %627 = load ptr, ptr %5, align 8
  %628 = getelementptr inbounds %struct.parser_info, ptr %627, i32 0, i32 2
  %629 = getelementptr inbounds %struct.Token, ptr %628, i32 0, i32 0
  %630 = load i32, ptr %629, align 8
  %631 = icmp ne i32 %630, 32
  br i1 %631, label %632, label %636

632:                                              ; preds = %626
  %633 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %633, i32 noundef 2, ptr noundef @.str.30.236)
  %634 = load ptr, ptr %19, align 8
  call void @free(ptr noundef %634)
  %635 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %635)
  store i1 false, ptr %3, align 1
  br label %2163

636:                                              ; preds = %626
  call void @gen_pushs_bool(i1 noundef zeroext true)
  %637 = load ptr, ptr %20, align 8
  call void @gen_jumpifneqs(ptr noundef %637)
  %638 = load ptr, ptr %5, align 8
  %639 = call zeroext i1 @safe_get_token(ptr noundef %638)
  br i1 %639, label %641, label %640

640:                                              ; preds = %636
  store i1 false, ptr %3, align 1
  br label %2163

641:                                              ; preds = %636
  %642 = load ptr, ptr %5, align 8
  %643 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %642)
  br i1 %643, label %647, label %644

644:                                              ; preds = %641
  %645 = load ptr, ptr %19, align 8
  call void @free(ptr noundef %645)
  %646 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %646)
  store i1 false, ptr %3, align 1
  br label %2163

647:                                              ; preds = %641
  %648 = load ptr, ptr %5, align 8
  %649 = call zeroext i1 @safe_get_token(ptr noundef %648)
  br i1 %649, label %651, label %650

650:                                              ; preds = %647
  store i1 false, ptr %3, align 1
  br label %2163

651:                                              ; preds = %647
  %652 = load ptr, ptr %19, align 8
  call void @gen_jump(ptr noundef %652)
  %653 = load ptr, ptr %20, align 8
  call void @gen_label(ptr noundef %653)
  %654 = load ptr, ptr %19, align 8
  call void @free(ptr noundef %654)
  %655 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %655)
  store i1 true, ptr %3, align 1
  br label %2163

656:                                              ; preds = %118
  %657 = load ptr, ptr %5, align 8
  %658 = getelementptr inbounds %struct.parser_info, ptr %657, i32 0, i32 0
  %659 = load i8, ptr %658, align 8
  %660 = trunc i8 %659 to i1
  br i1 %660, label %661, label %663

661:                                              ; preds = %656
  %662 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %662, i32 noundef 2, ptr noundef @.str.31.237)
  store i1 false, ptr %3, align 1
  br label %2163

663:                                              ; preds = %656
  %664 = load ptr, ptr %5, align 8
  %665 = getelementptr inbounds %struct.parser_info, ptr %664, i32 0, i32 0
  store i8 1, ptr %665, align 8
  %666 = load ptr, ptr %5, align 8
  %667 = call zeroext i1 @safe_get_token(ptr noundef %666)
  br i1 %667, label %669, label %668

668:                                              ; preds = %663
  store i1 false, ptr %3, align 1
  br label %2163

669:                                              ; preds = %663
  %670 = load ptr, ptr %5, align 8
  %671 = getelementptr inbounds %struct.parser_info, ptr %670, i32 0, i32 2
  %672 = getelementptr inbounds %struct.Token, ptr %671, i32 0, i32 0
  %673 = load i32, ptr %672, align 8
  %674 = icmp ne i32 %673, 0
  br i1 %674, label %675, label %677

675:                                              ; preds = %669
  %676 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %676, i32 noundef 2, ptr noundef @.str.32.238)
  store i1 false, ptr %3, align 1
  br label %2163

677:                                              ; preds = %669
  %678 = load ptr, ptr %5, align 8
  %679 = getelementptr inbounds %struct.parser_info, ptr %678, i32 0, i32 2
  %680 = getelementptr inbounds %struct.Token, ptr %679, i32 0, i32 1
  %681 = load ptr, ptr %680, align 8
  store ptr %681, ptr %22, align 8
  %682 = load ptr, ptr %5, align 8
  %683 = call zeroext i1 @safe_get_token(ptr noundef %682)
  br i1 %683, label %685, label %684

684:                                              ; preds = %677
  store i1 false, ptr %3, align 1
  br label %2163

685:                                              ; preds = %677
  %686 = call ptr @malloc(i64 noundef 40) #11
  store ptr %686, ptr %23, align 8
  %687 = load ptr, ptr %23, align 8
  %688 = icmp eq ptr %687, null
  br i1 %688, label %689, label %691

689:                                              ; preds = %685
  %690 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %690, i32 noundef 99, ptr noundef @.str.33.239)
  store i1 false, ptr %3, align 1
  br label %2163

691:                                              ; preds = %685
  %692 = load ptr, ptr %22, align 8
  %693 = call ptr @strdup(ptr noundef %692)
  %694 = load ptr, ptr %23, align 8
  %695 = getelementptr inbounds %struct.symbol_info, ptr %694, i32 0, i32 0
  store ptr %693, ptr %695, align 8
  %696 = load ptr, ptr %23, align 8
  %697 = getelementptr inbounds %struct.symbol_info, ptr %696, i32 0, i32 1
  store i32 3, ptr %697, align 8
  %698 = load ptr, ptr %23, align 8
  %699 = getelementptr inbounds %struct.symbol_info, ptr %698, i32 0, i32 6
  store i32 0, ptr %699, align 4
  %700 = load ptr, ptr %23, align 8
  %701 = getelementptr inbounds %struct.symbol_info, ptr %700, i32 0, i32 4
  store ptr null, ptr %701, align 8
  %702 = load ptr, ptr %5, align 8
  %703 = getelementptr inbounds %struct.parser_info, ptr %702, i32 0, i32 2
  %704 = getelementptr inbounds %struct.Token, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = icmp eq i32 %705, 31
  br i1 %706, label %707, label %713

707:                                              ; preds = %691
  %708 = load ptr, ptr %5, align 8
  %709 = load ptr, ptr %23, align 8
  %710 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 7, ptr noundef %708, ptr noundef %709)
  br i1 %710, label %712, label %711

711:                                              ; preds = %707
  store i1 false, ptr %3, align 1
  br label %2163

712:                                              ; preds = %707
  br label %776

713:                                              ; preds = %691
  %714 = load ptr, ptr %5, align 8
  %715 = getelementptr inbounds %struct.parser_info, ptr %714, i32 0, i32 2
  %716 = getelementptr inbounds %struct.Token, ptr %715, i32 0, i32 0
  %717 = load i32, ptr %716, align 8
  %718 = icmp eq i32 %717, 33
  br i1 %718, label %719, label %743

719:                                              ; preds = %713
  %720 = load ptr, ptr %22, align 8
  %721 = call i64 @strlen(ptr noundef %720) #13
  %722 = add i64 %721, 6
  %723 = call ptr @malloc(i64 noundef %722) #11
  store ptr %723, ptr %24, align 8
  %724 = load ptr, ptr %24, align 8
  %725 = icmp ne ptr %724, null
  br i1 %725, label %728, label %726

726:                                              ; preds = %719
  %727 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %727, i32 noundef 99, ptr noundef @.str.34.240)
  store i1 false, ptr %3, align 1
  br label %2163

728:                                              ; preds = %719
  %729 = load ptr, ptr %24, align 8
  %730 = load ptr, ptr %24, align 8
  %731 = call i64 @llvm.objectsize.i64.p0(ptr %730, i1 false, i1 true, i1 false)
  %732 = load ptr, ptr %22, align 8
  %733 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %729, i32 noundef 0, i64 noundef %731, ptr noundef @.str.35.241, ptr noundef %732)
  %734 = load ptr, ptr %24, align 8
  call void @gen_function_start(ptr noundef %734)
  %735 = load ptr, ptr %5, align 8
  %736 = load ptr, ptr %23, align 8
  %737 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 8, ptr noundef %735, ptr noundef %736)
  br i1 %737, label %740, label %738

738:                                              ; preds = %728
  %739 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %739)
  store i1 false, ptr %3, align 1
  br label %2163

740:                                              ; preds = %728
  %741 = load ptr, ptr %24, align 8
  call void @gen_function_end(ptr noundef %741)
  %742 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %742)
  br label %775

743:                                              ; preds = %713
  %744 = load ptr, ptr %5, align 8
  %745 = getelementptr inbounds %struct.parser_info, ptr %744, i32 0, i32 2
  %746 = getelementptr inbounds %struct.Token, ptr %745, i32 0, i32 0
  %747 = load i32, ptr %746, align 8
  %748 = icmp eq i32 %747, 24
  br i1 %748, label %749, label %773

749:                                              ; preds = %743
  %750 = load ptr, ptr %22, align 8
  %751 = call i64 @strlen(ptr noundef %750) #13
  %752 = add i64 %751, 6
  %753 = call ptr @malloc(i64 noundef %752) #11
  store ptr %753, ptr %25, align 8
  %754 = load ptr, ptr %25, align 8
  %755 = icmp ne ptr %754, null
  br i1 %755, label %758, label %756

756:                                              ; preds = %749
  %757 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %757, i32 noundef 99, ptr noundef @.str.36.242)
  store i1 false, ptr %3, align 1
  br label %2163

758:                                              ; preds = %749
  %759 = load ptr, ptr %25, align 8
  %760 = load ptr, ptr %25, align 8
  %761 = call i64 @llvm.objectsize.i64.p0(ptr %760, i1 false, i1 true, i1 false)
  %762 = load ptr, ptr %22, align 8
  %763 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %759, i32 noundef 0, i64 noundef %761, ptr noundef @.str.37.243, ptr noundef %762)
  %764 = load ptr, ptr %25, align 8
  call void @gen_function_start(ptr noundef %764)
  %765 = load ptr, ptr %5, align 8
  %766 = load ptr, ptr %23, align 8
  %767 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 9, ptr noundef %765, ptr noundef %766)
  br i1 %767, label %770, label %768

768:                                              ; preds = %758
  %769 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %769)
  store i1 false, ptr %3, align 1
  br label %2163

770:                                              ; preds = %758
  %771 = load ptr, ptr %25, align 8
  call void @gen_function_end(ptr noundef %771)
  %772 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %772)
  br label %774

773:                                              ; preds = %743
  store i1 false, ptr %3, align 1
  br label %2163

774:                                              ; preds = %770
  br label %775

775:                                              ; preds = %774, %740
  br label %776

776:                                              ; preds = %775, %712
  %777 = load ptr, ptr %23, align 8
  %778 = getelementptr inbounds %struct.symbol_info, ptr %777, i32 0, i32 1
  %779 = load i32, ptr %778, align 8
  %780 = icmp eq i32 %779, 3
  br i1 %780, label %781, label %805

781:                                              ; preds = %776
  %782 = load ptr, ptr %22, align 8
  %783 = call i64 @strlen(ptr noundef %782) #13
  %784 = add i64 %783, 12
  store i64 %784, ptr %27, align 8
  %785 = load i64, ptr %27, align 8
  %786 = call ptr @malloc(i64 noundef %785) #11
  store ptr %786, ptr %26, align 8
  %787 = load ptr, ptr %26, align 8
  %788 = icmp eq ptr %787, null
  br i1 %788, label %789, label %795

789:                                              ; preds = %781
  %790 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %790, i32 noundef 99, ptr noundef @.str.38.244)
  %791 = load ptr, ptr %23, align 8
  %792 = getelementptr inbounds %struct.symbol_info, ptr %791, i32 0, i32 0
  %793 = load ptr, ptr %792, align 8
  call void @free(ptr noundef %793)
  %794 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %794)
  store i1 false, ptr %3, align 1
  br label %2163

795:                                              ; preds = %781
  %796 = load ptr, ptr %26, align 8
  %797 = load i64, ptr %27, align 8
  %798 = load ptr, ptr %26, align 8
  %799 = call i64 @llvm.objectsize.i64.p0(ptr %798, i1 false, i1 true, i1 false)
  %800 = load ptr, ptr %22, align 8
  %801 = load ptr, ptr %23, align 8
  %802 = getelementptr inbounds %struct.symbol_info, ptr %801, i32 0, i32 6
  %803 = load i32, ptr %802, align 4
  %804 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %796, i64 noundef %797, i32 noundef 0, i64 noundef %799, ptr noundef @.str.39.245, ptr noundef %800, i32 noundef %803)
  br label %817

805:                                              ; preds = %776
  %806 = load ptr, ptr %22, align 8
  %807 = call ptr @strdup(ptr noundef %806)
  store ptr %807, ptr %26, align 8
  %808 = load ptr, ptr %26, align 8
  %809 = icmp eq ptr %808, null
  br i1 %809, label %810, label %816

810:                                              ; preds = %805
  %811 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %811, i32 noundef 99, ptr noundef @.str.38.244)
  %812 = load ptr, ptr %23, align 8
  %813 = getelementptr inbounds %struct.symbol_info, ptr %812, i32 0, i32 0
  %814 = load ptr, ptr %813, align 8
  call void @free(ptr noundef %814)
  %815 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %815)
  store i1 false, ptr %3, align 1
  br label %2163

816:                                              ; preds = %805
  br label %817

817:                                              ; preds = %816, %795
  %818 = load ptr, ptr %5, align 8
  %819 = getelementptr inbounds %struct.parser_info, ptr %818, i32 0, i32 3
  %820 = getelementptr inbounds %struct.symtable, ptr %819, i32 0, i32 0
  %821 = load ptr, ptr %26, align 8
  %822 = load ptr, ptr %23, align 8
  %823 = call zeroext i1 @symtable_insert(ptr noundef %820, ptr noundef %821, ptr noundef %822, ptr noundef %28)
  br i1 %823, label %828, label %824

824:                                              ; preds = %817
  %825 = load ptr, ptr %5, align 8
  %826 = load i32, ptr %28, align 4
  call void @error_process(ptr noundef %825, i32 noundef %826, ptr noundef @.str.40.246)
  %827 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %827)
  store i1 false, ptr %3, align 1
  br label %2163

828:                                              ; preds = %817
  %829 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %829)
  %830 = load ptr, ptr %5, align 8
  %831 = getelementptr inbounds %struct.parser_info, ptr %830, i32 0, i32 0
  store i8 0, ptr %831, align 8
  store i1 true, ptr %3, align 1
  br label %2163

832:                                              ; preds = %118
  %833 = load ptr, ptr %5, align 8
  %834 = call zeroext i1 @safe_get_token(ptr noundef %833)
  br i1 %834, label %836, label %835

835:                                              ; preds = %832
  store i1 false, ptr %3, align 1
  br label %2163

836:                                              ; preds = %832
  call void @init_symtable(ptr noundef %29)
  %837 = load ptr, ptr %5, align 8
  %838 = getelementptr inbounds %struct.parser_info, ptr %837, i32 0, i32 5
  %839 = call ptr @push_scope(ptr noundef %838, ptr noundef %29)
  %840 = icmp ne ptr %839, null
  br i1 %840, label %843, label %841

841:                                              ; preds = %836
  %842 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %842, i32 noundef 99, ptr noundef @.str.41.247)
  store i1 false, ptr %3, align 1
  br label %2163

843:                                              ; preds = %836
  %844 = load ptr, ptr %5, align 8
  %845 = load ptr, ptr %7, align 8
  %846 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 12, ptr noundef %844, ptr noundef %845)
  br i1 %846, label %850, label %847

847:                                              ; preds = %843
  %848 = load ptr, ptr %5, align 8
  %849 = getelementptr inbounds %struct.parser_info, ptr %848, i32 0, i32 5
  call void @pop_scope(ptr noundef %849)
  store i1 false, ptr %3, align 1
  br label %2163

850:                                              ; preds = %843
  %851 = load ptr, ptr %7, align 8
  %852 = getelementptr inbounds %struct.symbol_info, ptr %851, i32 0, i32 0
  %853 = load ptr, ptr %852, align 8
  %854 = call i64 @strlen(ptr noundef %853) #13
  %855 = add i64 %854, 12
  %856 = call ptr @malloc(i64 noundef %855) #11
  store ptr %856, ptr %30, align 8
  %857 = load ptr, ptr %30, align 8
  %858 = icmp ne ptr %857, null
  br i1 %858, label %863, label %859

859:                                              ; preds = %850
  %860 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %860, i32 noundef 99, ptr noundef @.str.42.248)
  %861 = load ptr, ptr %5, align 8
  %862 = getelementptr inbounds %struct.parser_info, ptr %861, i32 0, i32 5
  call void @pop_scope(ptr noundef %862)
  store i1 false, ptr %3, align 1
  br label %2163

863:                                              ; preds = %850
  %864 = load ptr, ptr %30, align 8
  %865 = load ptr, ptr %7, align 8
  %866 = getelementptr inbounds %struct.symbol_info, ptr %865, i32 0, i32 0
  %867 = load ptr, ptr %866, align 8
  %868 = call i64 @strlen(ptr noundef %867) #13
  %869 = add i64 %868, 12
  %870 = load ptr, ptr %30, align 8
  %871 = call i64 @llvm.objectsize.i64.p0(ptr %870, i1 false, i1 true, i1 false)
  %872 = load ptr, ptr %7, align 8
  %873 = getelementptr inbounds %struct.symbol_info, ptr %872, i32 0, i32 0
  %874 = load ptr, ptr %873, align 8
  %875 = load ptr, ptr %7, align 8
  %876 = getelementptr inbounds %struct.symbol_info, ptr %875, i32 0, i32 6
  %877 = load i32, ptr %876, align 4
  %878 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %864, i64 noundef %869, i32 noundef 0, i64 noundef %871, ptr noundef @.str.39.245, ptr noundef %874, i32 noundef %877)
  %879 = load ptr, ptr %30, align 8
  call void @gen_function_start(ptr noundef %879)
  %880 = load ptr, ptr %7, align 8
  %881 = getelementptr inbounds %struct.symbol_info, ptr %880, i32 0, i32 4
  %882 = load ptr, ptr %881, align 8
  store ptr %882, ptr %31, align 8
  store i32 0, ptr %32, align 4
  br label %883

883:                                              ; preds = %902, %863
  %884 = load ptr, ptr %31, align 8
  %885 = icmp ne ptr %884, null
  br i1 %885, label %886, label %908

886:                                              ; preds = %883
  %887 = load ptr, ptr %31, align 8
  %888 = getelementptr inbounds %struct.param, ptr %887, i32 0, i32 0
  %889 = load ptr, ptr %888, align 8
  %890 = icmp ne ptr %889, null
  br i1 %890, label %891, label %902

891:                                              ; preds = %886
  %892 = load ptr, ptr %31, align 8
  %893 = getelementptr inbounds %struct.param, ptr %892, i32 0, i32 0
  %894 = load ptr, ptr %893, align 8
  call void @gen_defvar_immediate(ptr noundef @.str.43.249, ptr noundef %894)
  %895 = getelementptr inbounds [256 x i8], ptr %33, i64 0, i64 0
  %896 = load i32, ptr %32, align 4
  %897 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %895, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.44.250, i32 noundef %896)
  %898 = load ptr, ptr %31, align 8
  %899 = getelementptr inbounds %struct.param, ptr %898, i32 0, i32 0
  %900 = load ptr, ptr %899, align 8
  %901 = getelementptr inbounds [256 x i8], ptr %33, i64 0, i64 0
  call void @gen_move(ptr noundef @.str.43.249, ptr noundef %900, ptr noundef @.str.43.249, ptr noundef %901)
  br label %902

902:                                              ; preds = %891, %886
  %903 = load ptr, ptr %31, align 8
  %904 = getelementptr inbounds %struct.param, ptr %903, i32 0, i32 2
  %905 = load ptr, ptr %904, align 8
  store ptr %905, ptr %31, align 8
  %906 = load i32, ptr %32, align 4
  %907 = add nsw i32 %906, 1
  store i32 %907, ptr %32, align 4
  br label %883

908:                                              ; preds = %883
  %909 = load ptr, ptr %5, align 8
  %910 = call zeroext i1 @safe_get_token(ptr noundef %909)
  br i1 %910, label %912, label %911

911:                                              ; preds = %908
  store i1 false, ptr %3, align 1
  br label %2163

912:                                              ; preds = %908
  %913 = load ptr, ptr %5, align 8
  %914 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %913)
  br i1 %914, label %919, label %915

915:                                              ; preds = %912
  %916 = load ptr, ptr %5, align 8
  %917 = getelementptr inbounds %struct.parser_info, ptr %916, i32 0, i32 5
  call void @pop_scope(ptr noundef %917)
  %918 = load ptr, ptr %30, align 8
  call void @free(ptr noundef %918)
  store i1 false, ptr %3, align 1
  br label %2163

919:                                              ; preds = %912
  %920 = load ptr, ptr %5, align 8
  %921 = getelementptr inbounds %struct.parser_info, ptr %920, i32 0, i32 5
  call void @pop_scope(ptr noundef %921)
  %922 = load ptr, ptr %30, align 8
  call void @gen_function_end(ptr noundef %922)
  %923 = load ptr, ptr %30, align 8
  call void @free(ptr noundef %923)
  %924 = load ptr, ptr %5, align 8
  %925 = call zeroext i1 @safe_get_token(ptr noundef %924)
  br i1 %925, label %927, label %926

926:                                              ; preds = %919
  store i1 false, ptr %3, align 1
  br label %2163

927:                                              ; preds = %919
  %928 = load ptr, ptr %5, align 8
  %929 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %928)
  store i1 %929, ptr %3, align 1
  br label %2163

930:                                              ; preds = %118
  call void @init_symtable(ptr noundef %34)
  %931 = load ptr, ptr %5, align 8
  %932 = getelementptr inbounds %struct.parser_info, ptr %931, i32 0, i32 5
  %933 = call ptr @push_scope(ptr noundef %932, ptr noundef %34)
  %934 = icmp ne ptr %933, null
  br i1 %934, label %937, label %935

935:                                              ; preds = %930
  %936 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %936, i32 noundef 99, ptr noundef @.str.45.251)
  store i1 false, ptr %3, align 1
  br label %2163

937:                                              ; preds = %930
  %938 = load ptr, ptr %5, align 8
  %939 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %938)
  br i1 %939, label %943, label %940

940:                                              ; preds = %937
  %941 = load ptr, ptr %5, align 8
  %942 = getelementptr inbounds %struct.parser_info, ptr %941, i32 0, i32 5
  call void @pop_scope(ptr noundef %942)
  store i1 false, ptr %3, align 1
  br label %2163

943:                                              ; preds = %937
  %944 = load ptr, ptr %5, align 8
  %945 = getelementptr inbounds %struct.parser_info, ptr %944, i32 0, i32 5
  call void @pop_scope(ptr noundef %945)
  %946 = load ptr, ptr %5, align 8
  %947 = call zeroext i1 @safe_get_token(ptr noundef %946)
  br i1 %947, label %949, label %948

948:                                              ; preds = %943
  store i1 false, ptr %3, align 1
  br label %2163

949:                                              ; preds = %943
  %950 = load ptr, ptr %5, align 8
  %951 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %950)
  store i1 %951, ptr %3, align 1
  br label %2163

952:                                              ; preds = %118
  %953 = load ptr, ptr %5, align 8
  %954 = call zeroext i1 @safe_get_token(ptr noundef %953)
  br i1 %954, label %956, label %955

955:                                              ; preds = %952
  store i1 false, ptr %3, align 1
  br label %2163

956:                                              ; preds = %952
  %957 = load ptr, ptr %5, align 8
  %958 = getelementptr inbounds %struct.parser_info, ptr %957, i32 0, i32 2
  %959 = getelementptr inbounds %struct.Token, ptr %958, i32 0, i32 0
  %960 = load i32, ptr %959, align 8
  %961 = icmp ne i32 %960, 31
  br i1 %961, label %962, label %964

962:                                              ; preds = %956
  %963 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %963, i32 noundef 2, ptr noundef @.str.46.252)
  store i1 false, ptr %3, align 1
  br label %2163

964:                                              ; preds = %956
  %965 = load ptr, ptr %5, align 8
  %966 = call zeroext i1 @safe_get_token(ptr noundef %965)
  br i1 %966, label %968, label %967

967:                                              ; preds = %964
  store i1 false, ptr %3, align 1
  br label %2163

968:                                              ; preds = %964
  call void @init_symtable(ptr noundef %35)
  %969 = load ptr, ptr %5, align 8
  %970 = getelementptr inbounds %struct.parser_info, ptr %969, i32 0, i32 5
  %971 = call ptr @push_scope(ptr noundef %970, ptr noundef %35)
  %972 = icmp ne ptr %971, null
  br i1 %972, label %975, label %973

973:                                              ; preds = %968
  %974 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %974, i32 noundef 99, ptr noundef @.str.47.253)
  store i1 false, ptr %3, align 1
  br label %2163

975:                                              ; preds = %968
  %976 = load ptr, ptr %5, align 8
  %977 = getelementptr inbounds %struct.parser_info, ptr %976, i32 0, i32 2
  %978 = getelementptr inbounds %struct.Token, ptr %977, i32 0, i32 0
  %979 = load i32, ptr %978, align 8
  %980 = icmp eq i32 %979, 0
  br i1 %980, label %981, label %1031

981:                                              ; preds = %975
  %982 = call ptr @malloc(i64 noundef 24) #11
  store ptr %982, ptr %36, align 8
  %983 = load ptr, ptr %36, align 8
  %984 = icmp eq ptr %983, null
  br i1 %984, label %985, label %989

985:                                              ; preds = %981
  %986 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %986, i32 noundef 99, ptr noundef @.str.48.254)
  %987 = load ptr, ptr %5, align 8
  %988 = getelementptr inbounds %struct.parser_info, ptr %987, i32 0, i32 5
  call void @pop_scope(ptr noundef %988)
  store i1 false, ptr %3, align 1
  br label %2163

989:                                              ; preds = %981
  %990 = load ptr, ptr %5, align 8
  %991 = getelementptr inbounds %struct.parser_info, ptr %990, i32 0, i32 2
  %992 = getelementptr inbounds %struct.Token, ptr %991, i32 0, i32 1
  %993 = load ptr, ptr %992, align 8
  %994 = call ptr @strdup(ptr noundef %993)
  %995 = load ptr, ptr %36, align 8
  %996 = getelementptr inbounds %struct.param, ptr %995, i32 0, i32 0
  store ptr %994, ptr %996, align 8
  %997 = load ptr, ptr %36, align 8
  %998 = getelementptr inbounds %struct.param, ptr %997, i32 0, i32 1
  store i32 5, ptr %998, align 8
  %999 = load ptr, ptr %36, align 8
  %1000 = getelementptr inbounds %struct.param, ptr %999, i32 0, i32 2
  store ptr null, ptr %1000, align 8
  %1001 = load ptr, ptr %7, align 8
  %1002 = getelementptr inbounds %struct.symbol_info, ptr %1001, i32 0, i32 4
  %1003 = load ptr, ptr %1002, align 8
  %1004 = icmp eq ptr %1003, null
  br i1 %1004, label %1005, label %1009

1005:                                             ; preds = %989
  %1006 = load ptr, ptr %36, align 8
  %1007 = load ptr, ptr %7, align 8
  %1008 = getelementptr inbounds %struct.symbol_info, ptr %1007, i32 0, i32 4
  store ptr %1006, ptr %1008, align 8
  br label %1026

1009:                                             ; preds = %989
  %1010 = load ptr, ptr %7, align 8
  %1011 = getelementptr inbounds %struct.symbol_info, ptr %1010, i32 0, i32 4
  %1012 = load ptr, ptr %1011, align 8
  store ptr %1012, ptr %37, align 8
  br label %1013

1013:                                             ; preds = %1018, %1009
  %1014 = load ptr, ptr %37, align 8
  %1015 = getelementptr inbounds %struct.param, ptr %1014, i32 0, i32 2
  %1016 = load ptr, ptr %1015, align 8
  %1017 = icmp ne ptr %1016, null
  br i1 %1017, label %1018, label %1022

1018:                                             ; preds = %1013
  %1019 = load ptr, ptr %37, align 8
  %1020 = getelementptr inbounds %struct.param, ptr %1019, i32 0, i32 2
  %1021 = load ptr, ptr %1020, align 8
  store ptr %1021, ptr %37, align 8
  br label %1013

1022:                                             ; preds = %1013
  %1023 = load ptr, ptr %36, align 8
  %1024 = load ptr, ptr %37, align 8
  %1025 = getelementptr inbounds %struct.param, ptr %1024, i32 0, i32 2
  store ptr %1023, ptr %1025, align 8
  br label %1026

1026:                                             ; preds = %1022, %1005
  %1027 = load ptr, ptr %7, align 8
  %1028 = getelementptr inbounds %struct.symbol_info, ptr %1027, i32 0, i32 6
  %1029 = load i32, ptr %1028, align 4
  %1030 = add nsw i32 %1029, 1
  store i32 %1030, ptr %1028, align 4
  br label %1035

1031:                                             ; preds = %975
  %1032 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1032, i32 noundef 2, ptr noundef @.str.49.255)
  %1033 = load ptr, ptr %5, align 8
  %1034 = getelementptr inbounds %struct.parser_info, ptr %1033, i32 0, i32 5
  call void @pop_scope(ptr noundef %1034)
  store i1 false, ptr %3, align 1
  br label %2163

1035:                                             ; preds = %1026
  %1036 = load ptr, ptr %5, align 8
  %1037 = call zeroext i1 @safe_get_token(ptr noundef %1036)
  br i1 %1037, label %1039, label %1038

1038:                                             ; preds = %1035
  store i1 false, ptr %3, align 1
  br label %2163

1039:                                             ; preds = %1035
  %1040 = load ptr, ptr %5, align 8
  %1041 = getelementptr inbounds %struct.parser_info, ptr %1040, i32 0, i32 2
  %1042 = getelementptr inbounds %struct.Token, ptr %1041, i32 0, i32 0
  %1043 = load i32, ptr %1042, align 8
  %1044 = icmp ne i32 %1043, 32
  br i1 %1044, label %1045, label %1049

1045:                                             ; preds = %1039
  %1046 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1046, i32 noundef 2, ptr noundef @.str.50.256)
  %1047 = load ptr, ptr %5, align 8
  %1048 = getelementptr inbounds %struct.parser_info, ptr %1047, i32 0, i32 5
  call void @pop_scope(ptr noundef %1048)
  store i1 false, ptr %3, align 1
  br label %2163

1049:                                             ; preds = %1039
  %1050 = load ptr, ptr %5, align 8
  %1051 = call zeroext i1 @safe_get_token(ptr noundef %1050)
  br i1 %1051, label %1053, label %1052

1052:                                             ; preds = %1049
  store i1 false, ptr %3, align 1
  br label %2163

1053:                                             ; preds = %1049
  %1054 = load ptr, ptr %7, align 8
  %1055 = getelementptr inbounds %struct.symbol_info, ptr %1054, i32 0, i32 4
  %1056 = load ptr, ptr %1055, align 8
  store ptr %1056, ptr %38, align 8
  store i32 0, ptr %39, align 4
  br label %1057

1057:                                             ; preds = %1060, %1053
  %1058 = load ptr, ptr %38, align 8
  %1059 = icmp ne ptr %1058, null
  br i1 %1059, label %1060, label %1076

1060:                                             ; preds = %1057
  %1061 = load ptr, ptr %38, align 8
  %1062 = getelementptr inbounds %struct.param, ptr %1061, i32 0, i32 0
  %1063 = load ptr, ptr %1062, align 8
  call void @gen_defvar(ptr noundef @.str.43.249, ptr noundef %1063)
  %1064 = getelementptr inbounds [256 x i8], ptr %40, i64 0, i64 0
  %1065 = load i32, ptr %39, align 4
  %1066 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %1064, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.44.250, i32 noundef %1065)
  %1067 = load ptr, ptr %38, align 8
  %1068 = getelementptr inbounds %struct.param, ptr %1067, i32 0, i32 0
  %1069 = load ptr, ptr %1068, align 8
  %1070 = getelementptr inbounds [256 x i8], ptr %40, i64 0, i64 0
  call void @gen_move(ptr noundef @.str.43.249, ptr noundef %1069, ptr noundef @.str.43.249, ptr noundef %1070)
  %1071 = load ptr, ptr %38, align 8
  %1072 = getelementptr inbounds %struct.param, ptr %1071, i32 0, i32 2
  %1073 = load ptr, ptr %1072, align 8
  store ptr %1073, ptr %38, align 8
  %1074 = load i32, ptr %39, align 4
  %1075 = add nsw i32 %1074, 1
  store i32 %1075, ptr %39, align 4
  br label %1057

1076:                                             ; preds = %1057
  %1077 = load ptr, ptr %5, align 8
  %1078 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 4, ptr noundef %1077)
  br i1 %1078, label %1083, label %1079

1079:                                             ; preds = %1076
  %1080 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1080, i32 noundef 2, ptr noundef @.str.51.257)
  %1081 = load ptr, ptr %5, align 8
  %1082 = getelementptr inbounds %struct.parser_info, ptr %1081, i32 0, i32 5
  call void @pop_scope(ptr noundef %1082)
  store i1 false, ptr %3, align 1
  br label %2163

1083:                                             ; preds = %1076
  %1084 = load ptr, ptr %5, align 8
  %1085 = getelementptr inbounds %struct.parser_info, ptr %1084, i32 0, i32 5
  call void @pop_scope(ptr noundef %1085)
  %1086 = load ptr, ptr %5, align 8
  %1087 = call zeroext i1 @safe_get_token(ptr noundef %1086)
  br i1 %1087, label %1089, label %1088

1088:                                             ; preds = %1083
  store i1 false, ptr %3, align 1
  br label %2163

1089:                                             ; preds = %1083
  %1090 = load ptr, ptr %5, align 8
  %1091 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 24, ptr noundef %1090)
  store i1 %1091, ptr %3, align 1
  br label %2163

1092:                                             ; preds = %118
  %1093 = load ptr, ptr %5, align 8
  %1094 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1093)
  br i1 %1094, label %1096, label %1095

1095:                                             ; preds = %1092
  store i1 false, ptr %3, align 1
  br label %2163

1096:                                             ; preds = %1092
  %1097 = load ptr, ptr %5, align 8
  %1098 = getelementptr inbounds %struct.parser_info, ptr %1097, i32 0, i32 2
  %1099 = getelementptr inbounds %struct.Token, ptr %1098, i32 0, i32 0
  %1100 = load i32, ptr %1099, align 8
  %1101 = icmp eq i32 %1100, 0
  br i1 %1101, label %1102, label %1195

1102:                                             ; preds = %1096
  %1103 = call ptr @malloc(i64 noundef 24) #11
  store ptr %1103, ptr %41, align 8
  %1104 = load ptr, ptr %41, align 8
  %1105 = icmp eq ptr %1104, null
  br i1 %1105, label %1106, label %1108

1106:                                             ; preds = %1102
  %1107 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1107, i32 noundef 99, ptr noundef @.str.48.254)
  store i1 false, ptr %3, align 1
  br label %2163

1108:                                             ; preds = %1102
  %1109 = load ptr, ptr %5, align 8
  %1110 = getelementptr inbounds %struct.parser_info, ptr %1109, i32 0, i32 2
  %1111 = getelementptr inbounds %struct.Token, ptr %1110, i32 0, i32 1
  %1112 = load ptr, ptr %1111, align 8
  %1113 = call ptr @strdup(ptr noundef %1112)
  %1114 = load ptr, ptr %41, align 8
  %1115 = getelementptr inbounds %struct.param, ptr %1114, i32 0, i32 0
  store ptr %1113, ptr %1115, align 8
  %1116 = load ptr, ptr %41, align 8
  %1117 = getelementptr inbounds %struct.param, ptr %1116, i32 0, i32 1
  store i32 5, ptr %1117, align 8
  %1118 = load ptr, ptr %41, align 8
  %1119 = getelementptr inbounds %struct.param, ptr %1118, i32 0, i32 2
  store ptr null, ptr %1119, align 8
  %1120 = call ptr @malloc(i64 noundef 40) #11
  store ptr %1120, ptr %42, align 8
  %1121 = load ptr, ptr %42, align 8
  %1122 = icmp eq ptr %1121, null
  br i1 %1122, label %1123, label %1126

1123:                                             ; preds = %1108
  %1124 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1124, i32 noundef 99, ptr noundef @.str.52.258)
  %1125 = load ptr, ptr %41, align 8
  call void @free(ptr noundef %1125)
  store i1 false, ptr %3, align 1
  br label %2163

1126:                                             ; preds = %1108
  %1127 = load ptr, ptr %42, align 8
  %1128 = getelementptr inbounds %struct.symbol_info, ptr %1127, i32 0, i32 1
  store i32 1, ptr %1128, align 8
  %1129 = load ptr, ptr %42, align 8
  %1130 = getelementptr inbounds %struct.symbol_info, ptr %1129, i32 0, i32 2
  store i32 5, ptr %1130, align 4
  %1131 = load ptr, ptr %42, align 8
  %1132 = getelementptr inbounds %struct.symbol_info, ptr %1131, i32 0, i32 3
  store i8 1, ptr %1132, align 8
  %1133 = load ptr, ptr %42, align 8
  %1134 = getelementptr inbounds %struct.symbol_info, ptr %1133, i32 0, i32 4
  store ptr null, ptr %1134, align 8
  %1135 = load ptr, ptr %42, align 8
  %1136 = getelementptr inbounds %struct.symbol_info, ptr %1135, i32 0, i32 6
  store i32 0, ptr %1136, align 4
  %1137 = load ptr, ptr %5, align 8
  %1138 = getelementptr inbounds %struct.parser_info, ptr %1137, i32 0, i32 5
  %1139 = load ptr, ptr %1138, align 8
  %1140 = getelementptr inbounds %struct.StackNode, ptr %1139, i32 0, i32 0
  %1141 = load ptr, ptr %1140, align 8
  %1142 = getelementptr inbounds %struct.symtable, ptr %1141, i32 0, i32 0
  %1143 = load ptr, ptr %41, align 8
  %1144 = getelementptr inbounds %struct.param, ptr %1143, i32 0, i32 0
  %1145 = load ptr, ptr %1144, align 8
  %1146 = load ptr, ptr %42, align 8
  %1147 = call zeroext i1 @symtable_insert(ptr noundef %1142, ptr noundef %1145, ptr noundef %1146, ptr noundef %43)
  br i1 %1147, label %1153, label %1148

1148:                                             ; preds = %1126
  %1149 = load ptr, ptr %5, align 8
  %1150 = load i32, ptr %43, align 4
  call void @error_process(ptr noundef %1149, i32 noundef %1150, ptr noundef @.str.53.259)
  %1151 = load ptr, ptr %41, align 8
  call void @free(ptr noundef %1151)
  %1152 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %1152)
  store i1 false, ptr %3, align 1
  br label %2163

1153:                                             ; preds = %1126
  %1154 = load ptr, ptr %7, align 8
  %1155 = getelementptr inbounds %struct.symbol_info, ptr %1154, i32 0, i32 4
  %1156 = load ptr, ptr %1155, align 8
  %1157 = icmp eq ptr %1156, null
  br i1 %1157, label %1158, label %1162

1158:                                             ; preds = %1153
  %1159 = load ptr, ptr %41, align 8
  %1160 = load ptr, ptr %7, align 8
  %1161 = getelementptr inbounds %struct.symbol_info, ptr %1160, i32 0, i32 4
  store ptr %1159, ptr %1161, align 8
  br label %1179

1162:                                             ; preds = %1153
  %1163 = load ptr, ptr %7, align 8
  %1164 = getelementptr inbounds %struct.symbol_info, ptr %1163, i32 0, i32 4
  %1165 = load ptr, ptr %1164, align 8
  store ptr %1165, ptr %44, align 8
  br label %1166

1166:                                             ; preds = %1171, %1162
  %1167 = load ptr, ptr %44, align 8
  %1168 = getelementptr inbounds %struct.param, ptr %1167, i32 0, i32 2
  %1169 = load ptr, ptr %1168, align 8
  %1170 = icmp ne ptr %1169, null
  br i1 %1170, label %1171, label %1175

1171:                                             ; preds = %1166
  %1172 = load ptr, ptr %44, align 8
  %1173 = getelementptr inbounds %struct.param, ptr %1172, i32 0, i32 2
  %1174 = load ptr, ptr %1173, align 8
  store ptr %1174, ptr %44, align 8
  br label %1166

1175:                                             ; preds = %1166
  %1176 = load ptr, ptr %41, align 8
  %1177 = load ptr, ptr %44, align 8
  %1178 = getelementptr inbounds %struct.param, ptr %1177, i32 0, i32 2
  store ptr %1176, ptr %1178, align 8
  br label %1179

1179:                                             ; preds = %1175, %1158
  %1180 = load ptr, ptr %7, align 8
  %1181 = getelementptr inbounds %struct.symbol_info, ptr %1180, i32 0, i32 6
  %1182 = load i32, ptr %1181, align 4
  %1183 = add nsw i32 %1182, 1
  store i32 %1183, ptr %1181, align 4
  %1184 = load ptr, ptr %5, align 8
  %1185 = call zeroext i1 @safe_get_token(ptr noundef %1184)
  br i1 %1185, label %1187, label %1186

1186:                                             ; preds = %1179
  store i1 false, ptr %3, align 1
  br label %2163

1187:                                             ; preds = %1179
  %1188 = load ptr, ptr %5, align 8
  %1189 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1188)
  br i1 %1189, label %1191, label %1190

1190:                                             ; preds = %1187
  store i1 false, ptr %3, align 1
  br label %2163

1191:                                             ; preds = %1187
  %1192 = load ptr, ptr %5, align 8
  %1193 = load ptr, ptr %7, align 8
  %1194 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 13, ptr noundef %1192, ptr noundef %1193)
  store i1 %1194, ptr %3, align 1
  br label %2163

1195:                                             ; preds = %1096
  %1196 = load ptr, ptr %5, align 8
  %1197 = getelementptr inbounds %struct.parser_info, ptr %1196, i32 0, i32 2
  %1198 = getelementptr inbounds %struct.Token, ptr %1197, i32 0, i32 0
  %1199 = load i32, ptr %1198, align 8
  %1200 = icmp eq i32 %1199, 32
  br i1 %1200, label %1201, label %1202

1201:                                             ; preds = %1195
  store i1 true, ptr %3, align 1
  br label %2163

1202:                                             ; preds = %1195
  %1203 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1203, i32 noundef 2, ptr noundef @.str.54.260)
  store i1 false, ptr %3, align 1
  br label %2163

1204:                                             ; preds = %118
  %1205 = load ptr, ptr %5, align 8
  %1206 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1205)
  br i1 %1206, label %1208, label %1207

1207:                                             ; preds = %1204
  store i1 false, ptr %3, align 1
  br label %2163

1208:                                             ; preds = %1204
  %1209 = load ptr, ptr %5, align 8
  %1210 = getelementptr inbounds %struct.parser_info, ptr %1209, i32 0, i32 2
  %1211 = getelementptr inbounds %struct.Token, ptr %1210, i32 0, i32 0
  %1212 = load i32, ptr %1211, align 8
  %1213 = icmp eq i32 %1212, 32
  br i1 %1213, label %1214, label %1215

1214:                                             ; preds = %1208
  store i1 true, ptr %3, align 1
  br label %2163

1215:                                             ; preds = %1208
  %1216 = load ptr, ptr %5, align 8
  %1217 = getelementptr inbounds %struct.parser_info, ptr %1216, i32 0, i32 2
  %1218 = getelementptr inbounds %struct.Token, ptr %1217, i32 0, i32 0
  %1219 = load i32, ptr %1218, align 8
  %1220 = icmp ne i32 %1219, 35
  br i1 %1220, label %1221, label %1223

1221:                                             ; preds = %1215
  %1222 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1222, i32 noundef 2, ptr noundef @.str.55.261)
  store i1 false, ptr %3, align 1
  br label %2163

1223:                                             ; preds = %1215
  br label %1224

1224:                                             ; preds = %1223
  %1225 = load ptr, ptr %5, align 8
  %1226 = call zeroext i1 @safe_get_token(ptr noundef %1225)
  br i1 %1226, label %1228, label %1227

1227:                                             ; preds = %1224
  store i1 false, ptr %3, align 1
  br label %2163

1228:                                             ; preds = %1224
  %1229 = load ptr, ptr %5, align 8
  %1230 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1229)
  br i1 %1230, label %1232, label %1231

1231:                                             ; preds = %1228
  store i1 false, ptr %3, align 1
  br label %2163

1232:                                             ; preds = %1228
  %1233 = load ptr, ptr %5, align 8
  %1234 = getelementptr inbounds %struct.parser_info, ptr %1233, i32 0, i32 2
  %1235 = getelementptr inbounds %struct.Token, ptr %1234, i32 0, i32 0
  %1236 = load i32, ptr %1235, align 8
  %1237 = icmp eq i32 %1236, 0
  br i1 %1237, label %1238, label %1338

1238:                                             ; preds = %1232
  %1239 = call ptr @malloc(i64 noundef 24) #11
  store ptr %1239, ptr %45, align 8
  %1240 = load ptr, ptr %45, align 8
  %1241 = icmp eq ptr %1240, null
  br i1 %1241, label %1242, label %1244

1242:                                             ; preds = %1238
  %1243 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1243, i32 noundef 99, ptr noundef @.str.48.254)
  store i1 false, ptr %3, align 1
  br label %2163

1244:                                             ; preds = %1238
  %1245 = load ptr, ptr %5, align 8
  %1246 = getelementptr inbounds %struct.parser_info, ptr %1245, i32 0, i32 2
  %1247 = getelementptr inbounds %struct.Token, ptr %1246, i32 0, i32 1
  %1248 = load ptr, ptr %1247, align 8
  %1249 = call ptr @strdup(ptr noundef %1248)
  %1250 = load ptr, ptr %45, align 8
  %1251 = getelementptr inbounds %struct.param, ptr %1250, i32 0, i32 0
  store ptr %1249, ptr %1251, align 8
  %1252 = load ptr, ptr %45, align 8
  %1253 = getelementptr inbounds %struct.param, ptr %1252, i32 0, i32 1
  store i32 5, ptr %1253, align 8
  %1254 = load ptr, ptr %45, align 8
  %1255 = getelementptr inbounds %struct.param, ptr %1254, i32 0, i32 2
  store ptr null, ptr %1255, align 8
  %1256 = call ptr @malloc(i64 noundef 40) #11
  store ptr %1256, ptr %46, align 8
  %1257 = load ptr, ptr %46, align 8
  %1258 = icmp eq ptr %1257, null
  br i1 %1258, label %1259, label %1262

1259:                                             ; preds = %1244
  %1260 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1260, i32 noundef 99, ptr noundef @.str.52.258)
  %1261 = load ptr, ptr %45, align 8
  call void @free(ptr noundef %1261)
  store i1 false, ptr %3, align 1
  br label %2163

1262:                                             ; preds = %1244
  %1263 = load ptr, ptr %46, align 8
  %1264 = getelementptr inbounds %struct.symbol_info, ptr %1263, i32 0, i32 1
  store i32 1, ptr %1264, align 8
  %1265 = load ptr, ptr %46, align 8
  %1266 = getelementptr inbounds %struct.symbol_info, ptr %1265, i32 0, i32 2
  store i32 5, ptr %1266, align 4
  %1267 = load ptr, ptr %46, align 8
  %1268 = getelementptr inbounds %struct.symbol_info, ptr %1267, i32 0, i32 3
  store i8 1, ptr %1268, align 8
  %1269 = load ptr, ptr %46, align 8
  %1270 = getelementptr inbounds %struct.symbol_info, ptr %1269, i32 0, i32 4
  store ptr null, ptr %1270, align 8
  %1271 = load ptr, ptr %46, align 8
  %1272 = getelementptr inbounds %struct.symbol_info, ptr %1271, i32 0, i32 6
  store i32 0, ptr %1272, align 4
  %1273 = load ptr, ptr %5, align 8
  %1274 = getelementptr inbounds %struct.parser_info, ptr %1273, i32 0, i32 5
  %1275 = load ptr, ptr %1274, align 8
  %1276 = getelementptr inbounds %struct.StackNode, ptr %1275, i32 0, i32 0
  %1277 = load ptr, ptr %1276, align 8
  %1278 = getelementptr inbounds %struct.symtable, ptr %1277, i32 0, i32 0
  %1279 = load ptr, ptr %45, align 8
  %1280 = getelementptr inbounds %struct.param, ptr %1279, i32 0, i32 0
  %1281 = load ptr, ptr %1280, align 8
  %1282 = load ptr, ptr %46, align 8
  %1283 = call zeroext i1 @symtable_insert(ptr noundef %1278, ptr noundef %1281, ptr noundef %1282, ptr noundef %47)
  br i1 %1283, label %1289, label %1284

1284:                                             ; preds = %1262
  %1285 = load ptr, ptr %5, align 8
  %1286 = load i32, ptr %47, align 4
  call void @error_process(ptr noundef %1285, i32 noundef %1286, ptr noundef @.str.56.262)
  %1287 = load ptr, ptr %45, align 8
  call void @free(ptr noundef %1287)
  %1288 = load ptr, ptr %46, align 8
  call void @free(ptr noundef %1288)
  store i1 false, ptr %3, align 1
  br label %2163

1289:                                             ; preds = %1262
  %1290 = load ptr, ptr %7, align 8
  %1291 = getelementptr inbounds %struct.symbol_info, ptr %1290, i32 0, i32 4
  %1292 = load ptr, ptr %1291, align 8
  %1293 = icmp eq ptr %1292, null
  br i1 %1293, label %1294, label %1298

1294:                                             ; preds = %1289
  %1295 = load ptr, ptr %45, align 8
  %1296 = load ptr, ptr %7, align 8
  %1297 = getelementptr inbounds %struct.symbol_info, ptr %1296, i32 0, i32 4
  store ptr %1295, ptr %1297, align 8
  br label %1315

1298:                                             ; preds = %1289
  %1299 = load ptr, ptr %7, align 8
  %1300 = getelementptr inbounds %struct.symbol_info, ptr %1299, i32 0, i32 4
  %1301 = load ptr, ptr %1300, align 8
  store ptr %1301, ptr %48, align 8
  br label %1302

1302:                                             ; preds = %1307, %1298
  %1303 = load ptr, ptr %48, align 8
  %1304 = getelementptr inbounds %struct.param, ptr %1303, i32 0, i32 2
  %1305 = load ptr, ptr %1304, align 8
  %1306 = icmp ne ptr %1305, null
  br i1 %1306, label %1307, label %1311

1307:                                             ; preds = %1302
  %1308 = load ptr, ptr %48, align 8
  %1309 = getelementptr inbounds %struct.param, ptr %1308, i32 0, i32 2
  %1310 = load ptr, ptr %1309, align 8
  store ptr %1310, ptr %48, align 8
  br label %1302

1311:                                             ; preds = %1302
  %1312 = load ptr, ptr %45, align 8
  %1313 = load ptr, ptr %48, align 8
  %1314 = getelementptr inbounds %struct.param, ptr %1313, i32 0, i32 2
  store ptr %1312, ptr %1314, align 8
  br label %1315

1315:                                             ; preds = %1311, %1294
  %1316 = load ptr, ptr %7, align 8
  %1317 = getelementptr inbounds %struct.symbol_info, ptr %1316, i32 0, i32 6
  %1318 = load i32, ptr %1317, align 4
  %1319 = add nsw i32 %1318, 1
  store i32 %1319, ptr %1317, align 4
  %1320 = load ptr, ptr %5, align 8
  %1321 = call zeroext i1 @safe_get_token(ptr noundef %1320)
  br i1 %1321, label %1323, label %1322

1322:                                             ; preds = %1315
  store i1 false, ptr %3, align 1
  br label %2163

1323:                                             ; preds = %1315
  %1324 = load ptr, ptr %5, align 8
  %1325 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1324)
  br i1 %1325, label %1327, label %1326

1326:                                             ; preds = %1323
  store i1 false, ptr %3, align 1
  br label %2163

1327:                                             ; preds = %1323
  %1328 = load ptr, ptr %5, align 8
  %1329 = getelementptr inbounds %struct.parser_info, ptr %1328, i32 0, i32 2
  %1330 = getelementptr inbounds %struct.Token, ptr %1329, i32 0, i32 0
  %1331 = load i32, ptr %1330, align 8
  %1332 = icmp eq i32 %1331, 35
  br i1 %1332, label %1333, label %1337

1333:                                             ; preds = %1327
  %1334 = load ptr, ptr %5, align 8
  %1335 = load ptr, ptr %7, align 8
  %1336 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 13, ptr noundef %1334, ptr noundef %1335)
  store i1 %1336, ptr %3, align 1
  br label %2163

1337:                                             ; preds = %1327
  store i1 true, ptr %3, align 1
  br label %2163

1338:                                             ; preds = %1232
  %1339 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1339, i32 noundef 2, ptr noundef @.str.55.261)
  store i1 false, ptr %3, align 1
  br label %2163

1340:                                             ; preds = %118
  %1341 = load ptr, ptr %5, align 8
  %1342 = call zeroext i1 @safe_get_token(ptr noundef %1341)
  br i1 %1342, label %1344, label %1343

1343:                                             ; preds = %1340
  store i1 false, ptr %3, align 1
  br label %2163

1344:                                             ; preds = %1340
  %1345 = load ptr, ptr %5, align 8
  %1346 = getelementptr inbounds %struct.parser_info, ptr %1345, i32 0, i32 2
  %1347 = getelementptr inbounds %struct.Token, ptr %1346, i32 0, i32 0
  %1348 = load i32, ptr %1347, align 8
  %1349 = icmp ne i32 %1348, 0
  br i1 %1349, label %1350, label %1352

1350:                                             ; preds = %1344
  %1351 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1351, i32 noundef 2, ptr noundef @.str.57.263)
  store i1 false, ptr %3, align 1
  br label %2163

1352:                                             ; preds = %1344
  %1353 = load ptr, ptr %5, align 8
  %1354 = getelementptr inbounds %struct.parser_info, ptr %1353, i32 0, i32 2
  %1355 = getelementptr inbounds %struct.Token, ptr %1354, i32 0, i32 1
  %1356 = load ptr, ptr %1355, align 8
  call void @gen_defvar(ptr noundef @.str.43.249, ptr noundef %1356)
  %1357 = load ptr, ptr %5, align 8
  %1358 = getelementptr inbounds %struct.parser_info, ptr %1357, i32 0, i32 5
  %1359 = load ptr, ptr %1358, align 8
  %1360 = load ptr, ptr %5, align 8
  %1361 = getelementptr inbounds %struct.parser_info, ptr %1360, i32 0, i32 2
  %1362 = getelementptr inbounds %struct.Token, ptr %1361, i32 0, i32 1
  %1363 = load ptr, ptr %1362, align 8
  %1364 = call zeroext i1 @is_defined_in_current_scope(ptr noundef %1359, ptr noundef %1363)
  br i1 %1364, label %1365, label %1367

1365:                                             ; preds = %1352
  %1366 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1366, i32 noundef 4, ptr noundef @.str.58.264)
  store i1 false, ptr %3, align 1
  br label %2163

1367:                                             ; preds = %1352
  %1368 = call ptr @malloc(i64 noundef 40) #11
  store ptr %1368, ptr %49, align 8
  %1369 = load ptr, ptr %49, align 8
  %1370 = icmp eq ptr %1369, null
  br i1 %1370, label %1371, label %1373

1371:                                             ; preds = %1367
  %1372 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1372, i32 noundef 99, ptr noundef @.str.59.265)
  store i1 false, ptr %3, align 1
  br label %2163

1373:                                             ; preds = %1367
  %1374 = load ptr, ptr %5, align 8
  %1375 = getelementptr inbounds %struct.parser_info, ptr %1374, i32 0, i32 2
  %1376 = getelementptr inbounds %struct.Token, ptr %1375, i32 0, i32 1
  %1377 = load ptr, ptr %1376, align 8
  %1378 = call ptr @strdup(ptr noundef %1377)
  %1379 = load ptr, ptr %49, align 8
  %1380 = getelementptr inbounds %struct.symbol_info, ptr %1379, i32 0, i32 0
  store ptr %1378, ptr %1380, align 8
  %1381 = load ptr, ptr %49, align 8
  %1382 = getelementptr inbounds %struct.symbol_info, ptr %1381, i32 0, i32 1
  store i32 0, ptr %1382, align 8
  %1383 = load ptr, ptr %49, align 8
  %1384 = getelementptr inbounds %struct.symbol_info, ptr %1383, i32 0, i32 3
  store i8 0, ptr %1384, align 8
  %1385 = load ptr, ptr %49, align 8
  %1386 = getelementptr inbounds %struct.symbol_info, ptr %1385, i32 0, i32 2
  store i32 2, ptr %1386, align 4
  %1387 = load ptr, ptr %49, align 8
  %1388 = getelementptr inbounds %struct.symbol_info, ptr %1387, i32 0, i32 4
  store ptr null, ptr %1388, align 8
  %1389 = load ptr, ptr %5, align 8
  %1390 = getelementptr inbounds %struct.parser_info, ptr %1389, i32 0, i32 5
  %1391 = load ptr, ptr %1390, align 8
  %1392 = getelementptr inbounds %struct.StackNode, ptr %1391, i32 0, i32 0
  %1393 = load ptr, ptr %1392, align 8
  %1394 = getelementptr inbounds %struct.symtable, ptr %1393, i32 0, i32 0
  %1395 = load ptr, ptr %49, align 8
  %1396 = getelementptr inbounds %struct.symbol_info, ptr %1395, i32 0, i32 0
  %1397 = load ptr, ptr %1396, align 8
  %1398 = load ptr, ptr %49, align 8
  %1399 = call zeroext i1 @symtable_insert(ptr noundef %1394, ptr noundef %1397, ptr noundef %1398, ptr noundef %50)
  br i1 %1399, label %1403, label %1400

1400:                                             ; preds = %1373
  %1401 = load ptr, ptr %5, align 8
  %1402 = load i32, ptr %50, align 4
  call void @error_process(ptr noundef %1401, i32 noundef %1402, ptr noundef @.str.60.266)
  store i1 false, ptr %3, align 1
  br label %2163

1403:                                             ; preds = %1373
  %1404 = load ptr, ptr %5, align 8
  %1405 = call zeroext i1 @safe_get_token(ptr noundef %1404)
  br i1 %1405, label %1407, label %1406

1406:                                             ; preds = %1403
  store i1 false, ptr %3, align 1
  br label %2163

1407:                                             ; preds = %1403
  store i1 true, ptr %3, align 1
  br label %2163

1408:                                             ; preds = %118
  %1409 = load ptr, ptr %5, align 8
  %1410 = getelementptr inbounds %struct.parser_info, ptr %1409, i32 0, i32 2
  %1411 = getelementptr inbounds %struct.Token, ptr %1410, i32 0, i32 0
  %1412 = load i32, ptr %1411, align 8
  %1413 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  store i32 %1412, ptr %1413, align 8
  %1414 = load ptr, ptr %5, align 8
  %1415 = getelementptr inbounds %struct.parser_info, ptr %1414, i32 0, i32 2
  %1416 = getelementptr inbounds %struct.Token, ptr %1415, i32 0, i32 1
  %1417 = load ptr, ptr %1416, align 8
  %1418 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  store ptr %1417, ptr %1418, align 8
  %1419 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1420 = load i32, ptr %1419, align 8
  %1421 = icmp eq i32 %1420, 0
  br i1 %1421, label %1422, label %1438

1422:                                             ; preds = %1408
  store ptr null, ptr %52, align 8
  %1423 = load ptr, ptr %5, align 8
  %1424 = getelementptr inbounds %struct.parser_info, ptr %1423, i32 0, i32 5
  %1425 = load ptr, ptr %1424, align 8
  %1426 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1427 = load ptr, ptr %1426, align 8
  %1428 = call zeroext i1 @search_in_scope_stack(ptr noundef %1425, ptr noundef %1427, ptr noundef %52)
  br i1 %1428, label %1431, label %1429

1429:                                             ; preds = %1422
  %1430 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1430, i32 noundef 3, ptr noundef @.str.61.267)
  store i1 false, ptr %3, align 1
  br label %2163

1431:                                             ; preds = %1422
  %1432 = load ptr, ptr %52, align 8
  %1433 = icmp ne ptr %1432, null
  br i1 %1433, label %1434, label %1437

1434:                                             ; preds = %1431
  %1435 = load ptr, ptr %52, align 8
  %1436 = getelementptr inbounds %struct.symbol_info, ptr %1435, i32 0, i32 3
  store i8 1, ptr %1436, align 8
  br label %1437

1437:                                             ; preds = %1434, %1431
  br label %1438

1438:                                             ; preds = %1437, %1408
  %1439 = load ptr, ptr %5, align 8
  %1440 = call zeroext i1 @safe_get_token(ptr noundef %1439)
  br i1 %1440, label %1442, label %1441

1441:                                             ; preds = %1438
  store i1 false, ptr %3, align 1
  br label %2163

1442:                                             ; preds = %1438
  %1443 = load ptr, ptr %5, align 8
  %1444 = getelementptr inbounds %struct.parser_info, ptr %1443, i32 0, i32 2
  %1445 = getelementptr inbounds %struct.Token, ptr %1444, i32 0, i32 0
  %1446 = load i32, ptr %1445, align 8
  %1447 = icmp ne i32 %1446, 24
  br i1 %1447, label %1448, label %1450

1448:                                             ; preds = %1442
  %1449 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1449, i32 noundef 2, ptr noundef @.str.62.268)
  store i1 false, ptr %3, align 1
  br label %2163

1450:                                             ; preds = %1442
  %1451 = load ptr, ptr %5, align 8
  %1452 = call zeroext i1 @safe_get_token(ptr noundef %1451)
  br i1 %1452, label %1454, label %1453

1453:                                             ; preds = %1450
  store i1 false, ptr %3, align 1
  br label %2163

1454:                                             ; preds = %1450
  %1455 = load ptr, ptr %5, align 8
  %1456 = getelementptr inbounds %struct.parser_info, ptr %1455, i32 0, i32 2
  %1457 = getelementptr inbounds %struct.Token, ptr %1456, i32 0, i32 0
  %1458 = load i32, ptr %1457, align 8
  %1459 = icmp eq i32 %1458, 13
  br i1 %1459, label %1460, label %1481

1460:                                             ; preds = %1454
  %1461 = load ptr, ptr %5, align 8
  %1462 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 18, ptr noundef %1461)
  br i1 %1462, label %1464, label %1463

1463:                                             ; preds = %1460
  store i1 false, ptr %3, align 1
  br label %2163

1464:                                             ; preds = %1460
  %1465 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1466 = load i32, ptr %1465, align 8
  %1467 = icmp eq i32 %1466, 1
  %1468 = zext i1 %1467 to i64
  %1469 = select i1 %1467, ptr @.str.63.269, ptr @.str.43.249
  store ptr %1469, ptr %53, align 8
  %1470 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1471 = load i32, ptr %1470, align 8
  %1472 = icmp eq i32 %1471, 1
  br i1 %1472, label %1473, label %1477

1473:                                             ; preds = %1464
  %1474 = load ptr, ptr %53, align 8
  %1475 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1476 = load ptr, ptr %1475, align 8
  call void @gen_defvar(ptr noundef %1474, ptr noundef %1476)
  br label %1477

1477:                                             ; preds = %1473, %1464
  %1478 = load ptr, ptr %53, align 8
  %1479 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1480 = load ptr, ptr %1479, align 8
  call void @gen_pops(ptr noundef %1478, ptr noundef %1480)
  br label %1773

1481:                                             ; preds = %1454
  %1482 = load ptr, ptr %5, align 8
  %1483 = getelementptr inbounds %struct.parser_info, ptr %1482, i32 0, i32 2
  %1484 = getelementptr inbounds %struct.Token, ptr %1483, i32 0, i32 0
  %1485 = load i32, ptr %1484, align 8
  %1486 = icmp eq i32 %1485, 0
  br i1 %1486, label %1487, label %1726

1487:                                             ; preds = %1481
  %1488 = call ptr @malloc(i64 noundef 16) #11
  store ptr %1488, ptr %54, align 8
  %1489 = load ptr, ptr %54, align 8
  %1490 = icmp eq ptr %1489, null
  br i1 %1490, label %1491, label %1493

1491:                                             ; preds = %1487
  %1492 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1492, i32 noundef 99, ptr noundef @.str.64.270)
  store i1 false, ptr %3, align 1
  br label %2163

1493:                                             ; preds = %1487
  %1494 = load ptr, ptr %54, align 8
  %1495 = getelementptr inbounds %struct.Token, ptr %1494, i32 0, i32 0
  store i32 0, ptr %1495, align 8
  %1496 = load ptr, ptr %5, align 8
  %1497 = getelementptr inbounds %struct.parser_info, ptr %1496, i32 0, i32 2
  %1498 = getelementptr inbounds %struct.Token, ptr %1497, i32 0, i32 1
  %1499 = load ptr, ptr %1498, align 8
  %1500 = call ptr @strdup(ptr noundef %1499)
  %1501 = load ptr, ptr %54, align 8
  %1502 = getelementptr inbounds %struct.Token, ptr %1501, i32 0, i32 1
  store ptr %1500, ptr %1502, align 8
  %1503 = load ptr, ptr %54, align 8
  %1504 = getelementptr inbounds %struct.Token, ptr %1503, i32 0, i32 1
  %1505 = load ptr, ptr %1504, align 8
  %1506 = icmp eq ptr %1505, null
  br i1 %1506, label %1507, label %1510

1507:                                             ; preds = %1493
  %1508 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %1508)
  %1509 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1509, i32 noundef 99, ptr noundef @.str.65.271)
  store i1 false, ptr %3, align 1
  br label %2163

1510:                                             ; preds = %1493
  %1511 = load ptr, ptr %5, align 8
  %1512 = call zeroext i1 @safe_get_token(ptr noundef %1511)
  br i1 %1512, label %1514, label %1513

1513:                                             ; preds = %1510
  store i1 false, ptr %3, align 1
  br label %2163

1514:                                             ; preds = %1510
  %1515 = load ptr, ptr %5, align 8
  %1516 = getelementptr inbounds %struct.parser_info, ptr %1515, i32 0, i32 2
  %1517 = getelementptr inbounds %struct.Token, ptr %1516, i32 0, i32 0
  %1518 = load i32, ptr %1517, align 8
  %1519 = icmp eq i32 %1518, 31
  br i1 %1519, label %1520, label %1678

1520:                                             ; preds = %1514
  %1521 = call ptr @malloc(i64 noundef 40) #11
  store ptr %1521, ptr %55, align 8
  %1522 = load ptr, ptr %55, align 8
  %1523 = icmp eq ptr %1522, null
  br i1 %1523, label %1524, label %1526

1524:                                             ; preds = %1520
  %1525 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1525, i32 noundef 99, ptr noundef @.str.33.239)
  store i1 false, ptr %3, align 1
  br label %2163

1526:                                             ; preds = %1520
  %1527 = load ptr, ptr %54, align 8
  %1528 = getelementptr inbounds %struct.Token, ptr %1527, i32 0, i32 1
  %1529 = load ptr, ptr %1528, align 8
  %1530 = load ptr, ptr %55, align 8
  %1531 = getelementptr inbounds %struct.symbol_info, ptr %1530, i32 0, i32 0
  store ptr %1529, ptr %1531, align 8
  %1532 = load ptr, ptr %55, align 8
  %1533 = getelementptr inbounds %struct.symbol_info, ptr %1532, i32 0, i32 6
  store i32 0, ptr %1533, align 4
  %1534 = load ptr, ptr %55, align 8
  %1535 = getelementptr inbounds %struct.symbol_info, ptr %1534, i32 0, i32 4
  store ptr null, ptr %1535, align 8
  %1536 = load ptr, ptr %55, align 8
  %1537 = getelementptr inbounds %struct.symbol_info, ptr %1536, i32 0, i32 1
  store i32 3, ptr %1537, align 8
  %1538 = load ptr, ptr %5, align 8
  %1539 = load ptr, ptr %55, align 8
  %1540 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 10, ptr noundef %1538, ptr noundef %1539)
  br i1 %1540, label %1542, label %1541

1541:                                             ; preds = %1526
  store i1 false, ptr %3, align 1
  br label %2163

1542:                                             ; preds = %1526
  %1543 = load ptr, ptr %55, align 8
  %1544 = getelementptr inbounds %struct.symbol_info, ptr %1543, i32 0, i32 0
  %1545 = load ptr, ptr %1544, align 8
  %1546 = call i64 @strlen(ptr noundef %1545) #13
  %1547 = add i64 %1546, 12
  %1548 = call ptr @malloc(i64 noundef %1547) #11
  store ptr %1548, ptr %56, align 8
  %1549 = load ptr, ptr %56, align 8
  %1550 = icmp ne ptr %1549, null
  br i1 %1550, label %1553, label %1551

1551:                                             ; preds = %1542
  %1552 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1552, i32 noundef 99, ptr noundef @.str.66.272)
  store i1 false, ptr %3, align 1
  br label %2163

1553:                                             ; preds = %1542
  %1554 = load ptr, ptr %56, align 8
  %1555 = load ptr, ptr %55, align 8
  %1556 = getelementptr inbounds %struct.symbol_info, ptr %1555, i32 0, i32 0
  %1557 = load ptr, ptr %1556, align 8
  %1558 = call i64 @strlen(ptr noundef %1557) #13
  %1559 = add i64 %1558, 12
  %1560 = load ptr, ptr %56, align 8
  %1561 = call i64 @llvm.objectsize.i64.p0(ptr %1560, i1 false, i1 true, i1 false)
  %1562 = load ptr, ptr %55, align 8
  %1563 = getelementptr inbounds %struct.symbol_info, ptr %1562, i32 0, i32 0
  %1564 = load ptr, ptr %1563, align 8
  %1565 = load ptr, ptr %55, align 8
  %1566 = getelementptr inbounds %struct.symbol_info, ptr %1565, i32 0, i32 6
  %1567 = load i32, ptr %1566, align 4
  %1568 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %1554, i64 noundef %1559, i32 noundef 0, i64 noundef %1561, ptr noundef @.str.39.245, ptr noundef %1564, i32 noundef %1567)
  %1569 = load ptr, ptr %56, align 8
  call void @free(ptr noundef %1569)
  %1570 = load ptr, ptr %55, align 8
  %1571 = getelementptr inbounds %struct.symbol_info, ptr %1570, i32 0, i32 4
  %1572 = load ptr, ptr %1571, align 8
  store ptr %1572, ptr %57, align 8
  br label %1573

1573:                                             ; preds = %1576, %1553
  %1574 = load ptr, ptr %57, align 8
  %1575 = icmp ne ptr %1574, null
  br i1 %1575, label %1576, label %1580

1576:                                             ; preds = %1573
  %1577 = load ptr, ptr %57, align 8
  %1578 = getelementptr inbounds %struct.param, ptr %1577, i32 0, i32 2
  %1579 = load ptr, ptr %1578, align 8
  store ptr %1579, ptr %57, align 8
  br label %1573

1580:                                             ; preds = %1573
  %1581 = load ptr, ptr %55, align 8
  %1582 = getelementptr inbounds %struct.symbol_info, ptr %1581, i32 0, i32 0
  %1583 = load ptr, ptr %1582, align 8
  %1584 = call i64 @strlen(ptr noundef %1583) #13
  %1585 = add i64 %1584, 12
  %1586 = call ptr @malloc(i64 noundef %1585) #11
  store ptr %1586, ptr %58, align 8
  %1587 = load ptr, ptr %58, align 8
  %1588 = icmp ne ptr %1587, null
  br i1 %1588, label %1591, label %1589

1589:                                             ; preds = %1580
  %1590 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1590, i32 noundef 99, ptr noundef @.str.67.273)
  store i1 false, ptr %3, align 1
  br label %2163

1591:                                             ; preds = %1580
  %1592 = load ptr, ptr %58, align 8
  %1593 = load ptr, ptr %55, align 8
  %1594 = getelementptr inbounds %struct.symbol_info, ptr %1593, i32 0, i32 0
  %1595 = load ptr, ptr %1594, align 8
  %1596 = call i64 @strlen(ptr noundef %1595) #13
  %1597 = add i64 %1596, 12
  %1598 = load ptr, ptr %58, align 8
  %1599 = call i64 @llvm.objectsize.i64.p0(ptr %1598, i1 false, i1 true, i1 false)
  %1600 = load ptr, ptr %55, align 8
  %1601 = getelementptr inbounds %struct.symbol_info, ptr %1600, i32 0, i32 0
  %1602 = load ptr, ptr %1601, align 8
  %1603 = load ptr, ptr %55, align 8
  %1604 = getelementptr inbounds %struct.symbol_info, ptr %1603, i32 0, i32 6
  %1605 = load i32, ptr %1604, align 4
  %1606 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %1592, i64 noundef %1597, i32 noundef 0, i64 noundef %1599, ptr noundef @.str.39.245, ptr noundef %1602, i32 noundef %1605)
  %1607 = load ptr, ptr %58, align 8
  %1608 = load ptr, ptr %55, align 8
  %1609 = getelementptr inbounds %struct.symbol_info, ptr %1608, i32 0, i32 6
  %1610 = load i32, ptr %1609, align 4
  call void @gen_function_call(ptr noundef %1607, i32 noundef %1610)
  %1611 = load ptr, ptr %58, align 8
  call void @free(ptr noundef %1611)
  %1612 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1613 = load i32, ptr %1612, align 8
  %1614 = icmp eq i32 %1613, 1
  %1615 = zext i1 %1614 to i64
  %1616 = select i1 %1614, ptr @.str.63.269, ptr @.str.43.249
  store ptr %1616, ptr %59, align 8
  %1617 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1618 = load i32, ptr %1617, align 8
  %1619 = icmp eq i32 %1618, 1
  br i1 %1619, label %1620, label %1624

1620:                                             ; preds = %1591
  %1621 = load ptr, ptr %59, align 8
  %1622 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1623 = load ptr, ptr %1622, align 8
  call void @gen_defvar(ptr noundef %1621, ptr noundef %1623)
  br label %1624

1624:                                             ; preds = %1620, %1591
  %1625 = load ptr, ptr %59, align 8
  %1626 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1627 = load ptr, ptr %1626, align 8
  call void @gen_pops(ptr noundef %1625, ptr noundef %1627)
  %1628 = load ptr, ptr %55, align 8
  %1629 = getelementptr inbounds %struct.symbol_info, ptr %1628, i32 0, i32 0
  %1630 = load ptr, ptr %1629, align 8
  %1631 = call i64 @strlen(ptr noundef %1630) #13
  %1632 = add i64 %1631, 12
  store i64 %1632, ptr %61, align 8
  %1633 = load i64, ptr %61, align 8
  %1634 = call ptr @malloc(i64 noundef %1633) #11
  store ptr %1634, ptr %60, align 8
  %1635 = load ptr, ptr %60, align 8
  %1636 = icmp eq ptr %1635, null
  br i1 %1636, label %1637, label %1640

1637:                                             ; preds = %1624
  %1638 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1638, i32 noundef 99, ptr noundef @.str.38.244)
  %1639 = load ptr, ptr %55, align 8
  call void @free(ptr noundef %1639)
  store i1 false, ptr %3, align 1
  br label %2163

1640:                                             ; preds = %1624
  %1641 = load ptr, ptr %60, align 8
  %1642 = load i64, ptr %61, align 8
  %1643 = load ptr, ptr %60, align 8
  %1644 = call i64 @llvm.objectsize.i64.p0(ptr %1643, i1 false, i1 true, i1 false)
  %1645 = load ptr, ptr %55, align 8
  %1646 = getelementptr inbounds %struct.symbol_info, ptr %1645, i32 0, i32 0
  %1647 = load ptr, ptr %1646, align 8
  %1648 = load ptr, ptr %55, align 8
  %1649 = getelementptr inbounds %struct.symbol_info, ptr %1648, i32 0, i32 6
  %1650 = load i32, ptr %1649, align 4
  %1651 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %1641, i64 noundef %1642, i32 noundef 0, i64 noundef %1644, ptr noundef @.str.39.245, ptr noundef %1647, i32 noundef %1650)
  store ptr null, ptr %63, align 8
  %1652 = load ptr, ptr %5, align 8
  %1653 = getelementptr inbounds %struct.parser_info, ptr %1652, i32 0, i32 4
  %1654 = getelementptr inbounds %struct.symtable, ptr %1653, i32 0, i32 0
  %1655 = load ptr, ptr %1654, align 8
  %1656 = load ptr, ptr %60, align 8
  %1657 = call zeroext i1 @symtable_search(ptr noundef %1655, ptr noundef %1656, ptr noundef %63)
  br i1 %1657, label %1670, label %1658

1658:                                             ; preds = %1640
  %1659 = load ptr, ptr %5, align 8
  %1660 = getelementptr inbounds %struct.parser_info, ptr %1659, i32 0, i32 4
  %1661 = getelementptr inbounds %struct.symtable, ptr %1660, i32 0, i32 0
  %1662 = load ptr, ptr %60, align 8
  %1663 = load ptr, ptr %55, align 8
  %1664 = call zeroext i1 @symtable_insert(ptr noundef %1661, ptr noundef %1662, ptr noundef %1663, ptr noundef %62)
  br i1 %1664, label %1669, label %1665

1665:                                             ; preds = %1658
  %1666 = load ptr, ptr %5, align 8
  %1667 = load i32, ptr %62, align 4
  call void @error_process(ptr noundef %1666, i32 noundef %1667, ptr noundef @.str.40.246)
  %1668 = load ptr, ptr %60, align 8
  call void @free(ptr noundef %1668)
  store i1 false, ptr %3, align 1
  br label %2163

1669:                                             ; preds = %1658
  br label %1675

1670:                                             ; preds = %1640
  %1671 = load ptr, ptr %55, align 8
  %1672 = getelementptr inbounds %struct.symbol_info, ptr %1671, i32 0, i32 0
  %1673 = load ptr, ptr %1672, align 8
  call void @free(ptr noundef %1673)
  %1674 = load ptr, ptr %55, align 8
  call void @free(ptr noundef %1674)
  br label %1675

1675:                                             ; preds = %1670, %1669
  %1676 = load ptr, ptr %60, align 8
  call void @free(ptr noundef %1676)
  %1677 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %1677)
  br label %1725

1678:                                             ; preds = %1514
  store ptr null, ptr %64, align 8
  %1679 = load ptr, ptr %5, align 8
  %1680 = load ptr, ptr %54, align 8
  %1681 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %1679, ptr noundef %64, ptr noundef %1680)
  br i1 %1681, label %1683, label %1682

1682:                                             ; preds = %1678
  store i1 false, ptr %3, align 1
  br label %2163

1683:                                             ; preds = %1678
  %1684 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1685 = load i32, ptr %1684, align 8
  %1686 = icmp eq i32 %1685, 0
  br i1 %1686, label %1687, label %1708

1687:                                             ; preds = %1683
  %1688 = load ptr, ptr %64, align 8
  %1689 = icmp ne ptr %1688, null
  br i1 %1689, label %1690, label %1708

1690:                                             ; preds = %1687
  store ptr null, ptr %65, align 8
  %1691 = load ptr, ptr %5, align 8
  %1692 = getelementptr inbounds %struct.parser_info, ptr %1691, i32 0, i32 5
  %1693 = load ptr, ptr %1692, align 8
  %1694 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1695 = load ptr, ptr %1694, align 8
  %1696 = call zeroext i1 @search_in_scope_stack(ptr noundef %1693, ptr noundef %1695, ptr noundef %65)
  br i1 %1696, label %1697, label %1707

1697:                                             ; preds = %1690
  %1698 = load ptr, ptr %65, align 8
  %1699 = icmp ne ptr %1698, null
  br i1 %1699, label %1700, label %1706

1700:                                             ; preds = %1697
  %1701 = load ptr, ptr %64, align 8
  %1702 = getelementptr inbounds %struct.symbol_info, ptr %1701, i32 0, i32 2
  %1703 = load i32, ptr %1702, align 4
  %1704 = load ptr, ptr %65, align 8
  %1705 = getelementptr inbounds %struct.symbol_info, ptr %1704, i32 0, i32 2
  store i32 %1703, ptr %1705, align 4
  br label %1706

1706:                                             ; preds = %1700, %1697
  br label %1707

1707:                                             ; preds = %1706, %1690
  br label %1708

1708:                                             ; preds = %1707, %1687, %1683
  %1709 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1710 = load i32, ptr %1709, align 8
  %1711 = icmp eq i32 %1710, 1
  %1712 = zext i1 %1711 to i64
  %1713 = select i1 %1711, ptr @.str.63.269, ptr @.str.43.249
  store ptr %1713, ptr %66, align 8
  %1714 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1715 = load i32, ptr %1714, align 8
  %1716 = icmp eq i32 %1715, 1
  br i1 %1716, label %1717, label %1721

1717:                                             ; preds = %1708
  %1718 = load ptr, ptr %66, align 8
  %1719 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1720 = load ptr, ptr %1719, align 8
  call void @gen_defvar(ptr noundef %1718, ptr noundef %1720)
  br label %1721

1721:                                             ; preds = %1717, %1708
  %1722 = load ptr, ptr %66, align 8
  %1723 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1724 = load ptr, ptr %1723, align 8
  call void @gen_pops(ptr noundef %1722, ptr noundef %1724)
  br label %1725

1725:                                             ; preds = %1721, %1675
  br label %1772

1726:                                             ; preds = %1481
  store ptr null, ptr %67, align 8
  %1727 = load ptr, ptr %5, align 8
  %1728 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %1727, ptr noundef %67, ptr noundef null)
  br i1 %1728, label %1730, label %1729

1729:                                             ; preds = %1726
  store i1 false, ptr %3, align 1
  br label %2163

1730:                                             ; preds = %1726
  %1731 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1732 = load i32, ptr %1731, align 8
  %1733 = icmp eq i32 %1732, 0
  br i1 %1733, label %1734, label %1755

1734:                                             ; preds = %1730
  %1735 = load ptr, ptr %67, align 8
  %1736 = icmp ne ptr %1735, null
  br i1 %1736, label %1737, label %1755

1737:                                             ; preds = %1734
  store ptr null, ptr %68, align 8
  %1738 = load ptr, ptr %5, align 8
  %1739 = getelementptr inbounds %struct.parser_info, ptr %1738, i32 0, i32 5
  %1740 = load ptr, ptr %1739, align 8
  %1741 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1742 = load ptr, ptr %1741, align 8
  %1743 = call zeroext i1 @search_in_scope_stack(ptr noundef %1740, ptr noundef %1742, ptr noundef %68)
  br i1 %1743, label %1744, label %1754

1744:                                             ; preds = %1737
  %1745 = load ptr, ptr %68, align 8
  %1746 = icmp ne ptr %1745, null
  br i1 %1746, label %1747, label %1753

1747:                                             ; preds = %1744
  %1748 = load ptr, ptr %67, align 8
  %1749 = getelementptr inbounds %struct.symbol_info, ptr %1748, i32 0, i32 2
  %1750 = load i32, ptr %1749, align 4
  %1751 = load ptr, ptr %68, align 8
  %1752 = getelementptr inbounds %struct.symbol_info, ptr %1751, i32 0, i32 2
  store i32 %1750, ptr %1752, align 4
  br label %1753

1753:                                             ; preds = %1747, %1744
  br label %1754

1754:                                             ; preds = %1753, %1737
  br label %1755

1755:                                             ; preds = %1754, %1734, %1730
  %1756 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1757 = load i32, ptr %1756, align 8
  %1758 = icmp eq i32 %1757, 1
  %1759 = zext i1 %1758 to i64
  %1760 = select i1 %1758, ptr @.str.63.269, ptr @.str.43.249
  store ptr %1760, ptr %69, align 8
  %1761 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 0
  %1762 = load i32, ptr %1761, align 8
  %1763 = icmp eq i32 %1762, 1
  br i1 %1763, label %1764, label %1768

1764:                                             ; preds = %1755
  %1765 = load ptr, ptr %69, align 8
  %1766 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1767 = load ptr, ptr %1766, align 8
  call void @gen_defvar(ptr noundef %1765, ptr noundef %1767)
  br label %1768

1768:                                             ; preds = %1764, %1755
  %1769 = load ptr, ptr %69, align 8
  %1770 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %1771 = load ptr, ptr %1770, align 8
  call void @gen_pops(ptr noundef %1769, ptr noundef %1771)
  br label %1772

1772:                                             ; preds = %1768, %1725
  br label %1773

1773:                                             ; preds = %1772, %1477
  store i1 true, ptr %3, align 1
  br label %2163

1774:                                             ; preds = %118
  %1775 = load ptr, ptr %5, align 8
  %1776 = getelementptr inbounds %struct.parser_info, ptr %1775, i32 0, i32 2
  %1777 = getelementptr inbounds %struct.Token, ptr %1776, i32 0, i32 0
  %1778 = load i32, ptr %1777, align 8
  %1779 = icmp ne i32 %1778, 13
  br i1 %1779, label %1780, label %1782

1780:                                             ; preds = %1774
  %1781 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1781, i32 noundef 2, ptr noundef @.str.68.274)
  store i1 false, ptr %3, align 1
  br label %2163

1782:                                             ; preds = %1774
  %1783 = load ptr, ptr %5, align 8
  %1784 = call zeroext i1 @safe_get_token(ptr noundef %1783)
  br i1 %1784, label %1786, label %1785

1785:                                             ; preds = %1782
  store i1 false, ptr %3, align 1
  br label %2163

1786:                                             ; preds = %1782
  %1787 = load ptr, ptr %5, align 8
  %1788 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1787)
  %1789 = load ptr, ptr %5, align 8
  %1790 = getelementptr inbounds %struct.parser_info, ptr %1789, i32 0, i32 2
  %1791 = getelementptr inbounds %struct.Token, ptr %1790, i32 0, i32 0
  %1792 = load i32, ptr %1791, align 8
  %1793 = icmp ne i32 %1792, 36
  br i1 %1793, label %1794, label %1796

1794:                                             ; preds = %1786
  %1795 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1795, i32 noundef 2, ptr noundef @.str.69.275)
  store i1 false, ptr %3, align 1
  br label %2163

1796:                                             ; preds = %1786
  %1797 = load ptr, ptr %5, align 8
  %1798 = call zeroext i1 @safe_get_token(ptr noundef %1797)
  br i1 %1798, label %1800, label %1799

1799:                                             ; preds = %1796
  store i1 false, ptr %3, align 1
  br label %2163

1800:                                             ; preds = %1796
  %1801 = load ptr, ptr %5, align 8
  %1802 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1801)
  %1803 = load ptr, ptr %5, align 8
  %1804 = getelementptr inbounds %struct.parser_info, ptr %1803, i32 0, i32 2
  %1805 = getelementptr inbounds %struct.Token, ptr %1804, i32 0, i32 0
  %1806 = load i32, ptr %1805, align 8
  %1807 = icmp ne i32 %1806, 0
  br i1 %1807, label %1808, label %1810

1808:                                             ; preds = %1800
  %1809 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1809, i32 noundef 2, ptr noundef @.str.70.276)
  store i1 false, ptr %3, align 1
  br label %2163

1810:                                             ; preds = %1800
  %1811 = load ptr, ptr %5, align 8
  %1812 = getelementptr inbounds %struct.parser_info, ptr %1811, i32 0, i32 2
  %1813 = getelementptr inbounds %struct.Token, ptr %1812, i32 0, i32 1
  %1814 = load ptr, ptr %1813, align 8
  %1815 = call ptr @strdup(ptr noundef %1814)
  store ptr %1815, ptr %70, align 8
  %1816 = load ptr, ptr %5, align 8
  %1817 = call zeroext i1 @safe_get_token(ptr noundef %1816)
  br i1 %1817, label %1819, label %1818

1818:                                             ; preds = %1810
  store i1 false, ptr %3, align 1
  br label %2163

1819:                                             ; preds = %1810
  %1820 = load ptr, ptr %5, align 8
  %1821 = getelementptr inbounds %struct.parser_info, ptr %1820, i32 0, i32 2
  %1822 = getelementptr inbounds %struct.Token, ptr %1821, i32 0, i32 0
  %1823 = load i32, ptr %1822, align 8
  %1824 = icmp ne i32 %1823, 31
  br i1 %1824, label %1825, label %1828

1825:                                             ; preds = %1819
  %1826 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1826, i32 noundef 2, ptr noundef @.str.71.277)
  %1827 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %1827)
  store i1 false, ptr %3, align 1
  br label %2163

1828:                                             ; preds = %1819
  %1829 = call ptr @malloc(i64 noundef 40) #11
  store ptr %1829, ptr %71, align 8
  %1830 = load ptr, ptr %71, align 8
  %1831 = icmp eq ptr %1830, null
  br i1 %1831, label %1832, label %1835

1832:                                             ; preds = %1828
  %1833 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1833, i32 noundef 99, ptr noundef @.str.72.278)
  %1834 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %1834)
  store i1 false, ptr %3, align 1
  br label %2163

1835:                                             ; preds = %1828
  %1836 = load ptr, ptr %71, align 8
  %1837 = getelementptr inbounds %struct.symbol_info, ptr %1836, i32 0, i32 6
  store i32 0, ptr %1837, align 4
  %1838 = load ptr, ptr %71, align 8
  %1839 = getelementptr inbounds %struct.symbol_info, ptr %1838, i32 0, i32 4
  store ptr null, ptr %1839, align 8
  %1840 = load ptr, ptr %5, align 8
  %1841 = load ptr, ptr %71, align 8
  %1842 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 10, ptr noundef %1840, ptr noundef %1841)
  %1843 = load ptr, ptr %70, align 8
  %1844 = load ptr, ptr %71, align 8
  %1845 = getelementptr inbounds %struct.symbol_info, ptr %1844, i32 0, i32 6
  %1846 = load i32, ptr %1845, align 4
  %1847 = call i32 @validate_builtin_function(ptr noundef %1843, i32 noundef %1846, ptr noundef null)
  store i32 %1847, ptr %72, align 4
  %1848 = load i32, ptr %72, align 4
  %1849 = icmp ne i32 %1848, 0
  br i1 %1849, label %1850, label %1854

1850:                                             ; preds = %1835
  %1851 = load ptr, ptr %5, align 8
  %1852 = load i32, ptr %72, align 4
  call void @error_process(ptr noundef %1851, i32 noundef %1852, ptr noundef @.str.73.279)
  %1853 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %1853)
  store i1 false, ptr %3, align 1
  br label %2163

1854:                                             ; preds = %1835
  %1855 = getelementptr inbounds [256 x i8], ptr %73, i64 0, i64 0
  %1856 = load ptr, ptr %70, align 8
  %1857 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %1855, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.74.280, ptr noundef %1856)
  %1858 = getelementptr inbounds [256 x i8], ptr %73, i64 0, i64 0
  %1859 = load ptr, ptr %71, align 8
  %1860 = getelementptr inbounds %struct.symbol_info, ptr %1859, i32 0, i32 6
  %1861 = load i32, ptr %1860, align 4
  call void @gen_function_call(ptr noundef %1858, i32 noundef %1861)
  %1862 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %1862)
  store i1 true, ptr %3, align 1
  br label %2163

1863:                                             ; preds = %118
  %1864 = load ptr, ptr %5, align 8
  %1865 = getelementptr inbounds %struct.parser_info, ptr %1864, i32 0, i32 2
  %1866 = getelementptr inbounds %struct.Token, ptr %1865, i32 0, i32 0
  %1867 = load i32, ptr %1866, align 8
  %1868 = icmp ne i32 %1867, 31
  br i1 %1868, label %1869, label %1871

1869:                                             ; preds = %1863
  %1870 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1870, i32 noundef 2, ptr noundef @.str.75.281)
  store i1 false, ptr %3, align 1
  br label %2163

1871:                                             ; preds = %1863
  %1872 = load ptr, ptr %5, align 8
  %1873 = call zeroext i1 @safe_get_token(ptr noundef %1872)
  br i1 %1873, label %1875, label %1874

1874:                                             ; preds = %1871
  store i1 false, ptr %3, align 1
  br label %2163

1875:                                             ; preds = %1871
  %1876 = load ptr, ptr %5, align 8
  %1877 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1876)
  br i1 %1877, label %1879, label %1878

1878:                                             ; preds = %1875
  store i1 false, ptr %3, align 1
  br label %2163

1879:                                             ; preds = %1875
  %1880 = load ptr, ptr %5, align 8
  %1881 = getelementptr inbounds %struct.parser_info, ptr %1880, i32 0, i32 2
  %1882 = getelementptr inbounds %struct.Token, ptr %1881, i32 0, i32 0
  %1883 = load i32, ptr %1882, align 8
  %1884 = icmp ne i32 %1883, 32
  br i1 %1884, label %1885, label %1960

1885:                                             ; preds = %1879
  store ptr null, ptr %74, align 8
  %1886 = load ptr, ptr %5, align 8
  %1887 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %1886, ptr noundef %74, ptr noundef null)
  br i1 %1887, label %1889, label %1888

1888:                                             ; preds = %1885
  store i1 false, ptr %3, align 1
  br label %2163

1889:                                             ; preds = %1885
  %1890 = call ptr @malloc(i64 noundef 24) #11
  store ptr %1890, ptr %75, align 8
  %1891 = load ptr, ptr %75, align 8
  %1892 = icmp eq ptr %1891, null
  br i1 %1892, label %1893, label %1895

1893:                                             ; preds = %1889
  %1894 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1894, i32 noundef 99, ptr noundef @.str.76.282)
  store i1 false, ptr %3, align 1
  br label %2163

1895:                                             ; preds = %1889
  %1896 = load ptr, ptr %75, align 8
  %1897 = getelementptr inbounds %struct.param, ptr %1896, i32 0, i32 0
  store ptr null, ptr %1897, align 8
  %1898 = load ptr, ptr %75, align 8
  %1899 = getelementptr inbounds %struct.param, ptr %1898, i32 0, i32 2
  store ptr null, ptr %1899, align 8
  %1900 = load ptr, ptr %74, align 8
  %1901 = icmp ne ptr %1900, null
  br i1 %1901, label %1902, label %1909

1902:                                             ; preds = %1895
  %1903 = load ptr, ptr %74, align 8
  %1904 = getelementptr inbounds %struct.symbol_info, ptr %1903, i32 0, i32 2
  %1905 = load i32, ptr %1904, align 4
  %1906 = load ptr, ptr %75, align 8
  %1907 = getelementptr inbounds %struct.param, ptr %1906, i32 0, i32 1
  store i32 %1905, ptr %1907, align 8
  %1908 = load ptr, ptr %74, align 8
  call void @free(ptr noundef %1908)
  br label %1912

1909:                                             ; preds = %1895
  %1910 = load ptr, ptr %75, align 8
  %1911 = getelementptr inbounds %struct.param, ptr %1910, i32 0, i32 1
  store i32 2, ptr %1911, align 8
  br label %1912

1912:                                             ; preds = %1909, %1902
  %1913 = load ptr, ptr %7, align 8
  %1914 = getelementptr inbounds %struct.symbol_info, ptr %1913, i32 0, i32 4
  %1915 = load ptr, ptr %1914, align 8
  %1916 = icmp eq ptr %1915, null
  br i1 %1916, label %1917, label %1921

1917:                                             ; preds = %1912
  %1918 = load ptr, ptr %75, align 8
  %1919 = load ptr, ptr %7, align 8
  %1920 = getelementptr inbounds %struct.symbol_info, ptr %1919, i32 0, i32 4
  store ptr %1918, ptr %1920, align 8
  br label %1938

1921:                                             ; preds = %1912
  %1922 = load ptr, ptr %7, align 8
  %1923 = getelementptr inbounds %struct.symbol_info, ptr %1922, i32 0, i32 4
  %1924 = load ptr, ptr %1923, align 8
  store ptr %1924, ptr %76, align 8
  br label %1925

1925:                                             ; preds = %1930, %1921
  %1926 = load ptr, ptr %76, align 8
  %1927 = getelementptr inbounds %struct.param, ptr %1926, i32 0, i32 2
  %1928 = load ptr, ptr %1927, align 8
  %1929 = icmp ne ptr %1928, null
  br i1 %1929, label %1930, label %1934

1930:                                             ; preds = %1925
  %1931 = load ptr, ptr %76, align 8
  %1932 = getelementptr inbounds %struct.param, ptr %1931, i32 0, i32 2
  %1933 = load ptr, ptr %1932, align 8
  store ptr %1933, ptr %76, align 8
  br label %1925

1934:                                             ; preds = %1925
  %1935 = load ptr, ptr %75, align 8
  %1936 = load ptr, ptr %76, align 8
  %1937 = getelementptr inbounds %struct.param, ptr %1936, i32 0, i32 2
  store ptr %1935, ptr %1937, align 8
  br label %1938

1938:                                             ; preds = %1934, %1917
  %1939 = load ptr, ptr %7, align 8
  %1940 = getelementptr inbounds %struct.symbol_info, ptr %1939, i32 0, i32 6
  %1941 = load i32, ptr %1940, align 4
  %1942 = add nsw i32 %1941, 1
  store i32 %1942, ptr %1940, align 4
  %1943 = load ptr, ptr %5, align 8
  %1944 = load ptr, ptr %7, align 8
  %1945 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 11, ptr noundef %1943, ptr noundef %1944)
  br i1 %1945, label %1947, label %1946

1946:                                             ; preds = %1938
  store i1 false, ptr %3, align 1
  br label %2163

1947:                                             ; preds = %1938
  %1948 = load ptr, ptr %5, align 8
  %1949 = getelementptr inbounds %struct.parser_info, ptr %1948, i32 0, i32 2
  %1950 = getelementptr inbounds %struct.Token, ptr %1949, i32 0, i32 0
  %1951 = load i32, ptr %1950, align 8
  %1952 = icmp ne i32 %1951, 32
  br i1 %1952, label %1953, label %1955

1953:                                             ; preds = %1947
  %1954 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1954, i32 noundef 2, ptr noundef @.str.77.283)
  store i1 false, ptr %3, align 1
  br label %2163

1955:                                             ; preds = %1947
  %1956 = load ptr, ptr %5, align 8
  %1957 = call zeroext i1 @safe_get_token(ptr noundef %1956)
  br i1 %1957, label %1959, label %1958

1958:                                             ; preds = %1955
  store i1 false, ptr %3, align 1
  br label %2163

1959:                                             ; preds = %1955
  store i1 true, ptr %3, align 1
  br label %2163

1960:                                             ; preds = %1879
  %1961 = load ptr, ptr %5, align 8
  %1962 = getelementptr inbounds %struct.parser_info, ptr %1961, i32 0, i32 2
  %1963 = getelementptr inbounds %struct.Token, ptr %1962, i32 0, i32 0
  %1964 = load i32, ptr %1963, align 8
  %1965 = icmp eq i32 %1964, 32
  br i1 %1965, label %1966, label %1971

1966:                                             ; preds = %1960
  %1967 = load ptr, ptr %5, align 8
  %1968 = call zeroext i1 @safe_get_token(ptr noundef %1967)
  br i1 %1968, label %1970, label %1969

1969:                                             ; preds = %1966
  store i1 false, ptr %3, align 1
  br label %2163

1970:                                             ; preds = %1966
  store i1 true, ptr %3, align 1
  br label %2163

1971:                                             ; preds = %1960
  %1972 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %1972, i32 noundef 2, ptr noundef @.str.78.284)
  store i1 false, ptr %3, align 1
  br label %2163

1973:                                             ; preds = %118
  %1974 = load ptr, ptr %5, align 8
  %1975 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1974)
  br i1 %1975, label %1977, label %1976

1976:                                             ; preds = %1973
  store i1 false, ptr %3, align 1
  br label %2163

1977:                                             ; preds = %1973
  %1978 = load ptr, ptr %5, align 8
  %1979 = getelementptr inbounds %struct.parser_info, ptr %1978, i32 0, i32 2
  %1980 = getelementptr inbounds %struct.Token, ptr %1979, i32 0, i32 0
  %1981 = load i32, ptr %1980, align 8
  %1982 = icmp eq i32 %1981, 32
  br i1 %1982, label %1983, label %1984

1983:                                             ; preds = %1977
  store i1 true, ptr %3, align 1
  br label %2163

1984:                                             ; preds = %1977
  %1985 = load ptr, ptr %5, align 8
  %1986 = getelementptr inbounds %struct.parser_info, ptr %1985, i32 0, i32 2
  %1987 = getelementptr inbounds %struct.Token, ptr %1986, i32 0, i32 0
  %1988 = load i32, ptr %1987, align 8
  %1989 = icmp eq i32 %1988, 35
  br i1 %1989, label %1990, label %2078

1990:                                             ; preds = %1984
  %1991 = load ptr, ptr %5, align 8
  %1992 = call zeroext i1 @safe_get_token(ptr noundef %1991)
  br i1 %1992, label %1994, label %1993

1993:                                             ; preds = %1990
  store i1 false, ptr %3, align 1
  br label %2163

1994:                                             ; preds = %1990
  %1995 = load ptr, ptr %5, align 8
  %1996 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %1995)
  br i1 %1996, label %1998, label %1997

1997:                                             ; preds = %1994
  store i1 false, ptr %3, align 1
  br label %2163

1998:                                             ; preds = %1994
  %1999 = load ptr, ptr %5, align 8
  %2000 = getelementptr inbounds %struct.parser_info, ptr %1999, i32 0, i32 2
  %2001 = getelementptr inbounds %struct.Token, ptr %2000, i32 0, i32 0
  %2002 = load i32, ptr %2001, align 8
  %2003 = icmp ne i32 %2002, 32
  br i1 %2003, label %2004, label %2076

2004:                                             ; preds = %1998
  %2005 = load ptr, ptr %5, align 8
  %2006 = getelementptr inbounds %struct.parser_info, ptr %2005, i32 0, i32 2
  %2007 = getelementptr inbounds %struct.Token, ptr %2006, i32 0, i32 0
  %2008 = load i32, ptr %2007, align 8
  %2009 = icmp ne i32 %2008, 35
  br i1 %2009, label %2010, label %2076

2010:                                             ; preds = %2004
  store ptr null, ptr %77, align 8
  %2011 = load ptr, ptr %5, align 8
  %2012 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %2011, ptr noundef %77, ptr noundef null)
  br i1 %2012, label %2014, label %2013

2013:                                             ; preds = %2010
  store i1 false, ptr %3, align 1
  br label %2163

2014:                                             ; preds = %2010
  %2015 = call ptr @malloc(i64 noundef 24) #11
  store ptr %2015, ptr %78, align 8
  %2016 = load ptr, ptr %78, align 8
  %2017 = icmp eq ptr %2016, null
  br i1 %2017, label %2018, label %2020

2018:                                             ; preds = %2014
  %2019 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %2019, i32 noundef 99, ptr noundef @.str.76.282)
  store i1 false, ptr %3, align 1
  br label %2163

2020:                                             ; preds = %2014
  %2021 = load ptr, ptr %78, align 8
  %2022 = getelementptr inbounds %struct.param, ptr %2021, i32 0, i32 0
  store ptr null, ptr %2022, align 8
  %2023 = load ptr, ptr %78, align 8
  %2024 = getelementptr inbounds %struct.param, ptr %2023, i32 0, i32 2
  store ptr null, ptr %2024, align 8
  %2025 = load ptr, ptr %77, align 8
  %2026 = icmp ne ptr %2025, null
  br i1 %2026, label %2027, label %2034

2027:                                             ; preds = %2020
  %2028 = load ptr, ptr %77, align 8
  %2029 = getelementptr inbounds %struct.symbol_info, ptr %2028, i32 0, i32 2
  %2030 = load i32, ptr %2029, align 4
  %2031 = load ptr, ptr %78, align 8
  %2032 = getelementptr inbounds %struct.param, ptr %2031, i32 0, i32 1
  store i32 %2030, ptr %2032, align 8
  %2033 = load ptr, ptr %77, align 8
  call void @free(ptr noundef %2033)
  br label %2037

2034:                                             ; preds = %2020
  %2035 = load ptr, ptr %78, align 8
  %2036 = getelementptr inbounds %struct.param, ptr %2035, i32 0, i32 1
  store i32 2, ptr %2036, align 8
  br label %2037

2037:                                             ; preds = %2034, %2027
  %2038 = load ptr, ptr %7, align 8
  %2039 = icmp eq ptr %2038, null
  br i1 %2039, label %2040, label %2042

2040:                                             ; preds = %2037
  %2041 = load ptr, ptr %78, align 8
  call void @free(ptr noundef %2041)
  store i1 false, ptr %3, align 1
  br label %2163

2042:                                             ; preds = %2037
  %2043 = load ptr, ptr %7, align 8
  %2044 = getelementptr inbounds %struct.symbol_info, ptr %2043, i32 0, i32 4
  %2045 = load ptr, ptr %2044, align 8
  %2046 = icmp eq ptr %2045, null
  br i1 %2046, label %2047, label %2051

2047:                                             ; preds = %2042
  %2048 = load ptr, ptr %78, align 8
  %2049 = load ptr, ptr %7, align 8
  %2050 = getelementptr inbounds %struct.symbol_info, ptr %2049, i32 0, i32 4
  store ptr %2048, ptr %2050, align 8
  br label %2068

2051:                                             ; preds = %2042
  %2052 = load ptr, ptr %7, align 8
  %2053 = getelementptr inbounds %struct.symbol_info, ptr %2052, i32 0, i32 4
  %2054 = load ptr, ptr %2053, align 8
  store ptr %2054, ptr %79, align 8
  br label %2055

2055:                                             ; preds = %2060, %2051
  %2056 = load ptr, ptr %79, align 8
  %2057 = getelementptr inbounds %struct.param, ptr %2056, i32 0, i32 2
  %2058 = load ptr, ptr %2057, align 8
  %2059 = icmp ne ptr %2058, null
  br i1 %2059, label %2060, label %2064

2060:                                             ; preds = %2055
  %2061 = load ptr, ptr %79, align 8
  %2062 = getelementptr inbounds %struct.param, ptr %2061, i32 0, i32 2
  %2063 = load ptr, ptr %2062, align 8
  store ptr %2063, ptr %79, align 8
  br label %2055

2064:                                             ; preds = %2055
  %2065 = load ptr, ptr %78, align 8
  %2066 = load ptr, ptr %79, align 8
  %2067 = getelementptr inbounds %struct.param, ptr %2066, i32 0, i32 2
  store ptr %2065, ptr %2067, align 8
  br label %2068

2068:                                             ; preds = %2064, %2047
  %2069 = load ptr, ptr %7, align 8
  %2070 = getelementptr inbounds %struct.symbol_info, ptr %2069, i32 0, i32 6
  %2071 = load i32, ptr %2070, align 4
  %2072 = add nsw i32 %2071, 1
  store i32 %2072, ptr %2070, align 4
  %2073 = load ptr, ptr %5, align 8
  %2074 = load ptr, ptr %7, align 8
  %2075 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 11, ptr noundef %2073, ptr noundef %2074)
  store i1 %2075, ptr %3, align 1
  br label %2163

2076:                                             ; preds = %2004, %1998
  %2077 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %2077, i32 noundef 2, ptr noundef @.str.79.285)
  store i1 false, ptr %3, align 1
  br label %2163

2078:                                             ; preds = %1984
  %2079 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %2079, i32 noundef 2, ptr noundef @.str.80.286)
  store i1 false, ptr %3, align 1
  br label %2163

2080:                                             ; preds = %118
  %2081 = load ptr, ptr %5, align 8
  %2082 = call zeroext i1 @safe_get_token(ptr noundef %2081)
  br i1 %2082, label %2084, label %2083

2083:                                             ; preds = %2080
  store i1 false, ptr %3, align 1
  br label %2163

2084:                                             ; preds = %2080
  %2085 = load ptr, ptr %5, align 8
  %2086 = getelementptr inbounds %struct.parser_info, ptr %2085, i32 0, i32 2
  %2087 = getelementptr inbounds %struct.Token, ptr %2086, i32 0, i32 0
  %2088 = load i32, ptr %2087, align 8
  %2089 = icmp ne i32 %2088, 37
  br i1 %2089, label %2090, label %2101

2090:                                             ; preds = %2084
  %2091 = load ptr, ptr %5, align 8
  %2092 = getelementptr inbounds %struct.parser_info, ptr %2091, i32 0, i32 2
  %2093 = getelementptr inbounds %struct.Token, ptr %2092, i32 0, i32 0
  %2094 = load i32, ptr %2093, align 8
  %2095 = icmp ne i32 %2094, 34
  br i1 %2095, label %2096, label %2101

2096:                                             ; preds = %2090
  store ptr null, ptr %80, align 8
  %2097 = load ptr, ptr %5, align 8
  %2098 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 17, ptr noundef %2097, ptr noundef %80, ptr noundef null)
  br i1 %2098, label %2100, label %2099

2099:                                             ; preds = %2096
  store i1 false, ptr %3, align 1
  br label %2163

2100:                                             ; preds = %2096
  br label %2102

2101:                                             ; preds = %2090, %2084
  call void @gen_pushs_null()
  br label %2102

2102:                                             ; preds = %2101, %2100
  %2103 = call i32 @printcode(ptr noundef @.str.81.287)
  %2104 = call i32 @printcode(ptr noundef @.str.82.288)
  store i1 true, ptr %3, align 1
  br label %2163

2105:                                             ; preds = %118
  %2106 = load ptr, ptr %5, align 8
  %2107 = load ptr, ptr %9, align 8
  %2108 = call ptr @form_expression(ptr noundef %2106, ptr noundef %2107)
  store ptr %2108, ptr %81, align 8
  %2109 = load ptr, ptr %81, align 8
  %2110 = icmp ne ptr %2109, null
  br i1 %2110, label %2112, label %2111

2111:                                             ; preds = %2105
  store i1 false, ptr %3, align 1
  br label %2163

2112:                                             ; preds = %2105
  %2113 = call ptr @malloc(i64 noundef 40) #11
  store ptr %2113, ptr %82, align 8
  %2114 = load ptr, ptr %5, align 8
  %2115 = load ptr, ptr %81, align 8
  %2116 = call zeroext i1 @expression_parser(ptr noundef %2114, ptr noundef %2115, ptr noundef %82)
  br i1 %2116, label %2118, label %2117

2117:                                             ; preds = %2112
  store i1 false, ptr %3, align 1
  br label %2163

2118:                                             ; preds = %2112
  %2119 = load ptr, ptr %8, align 8
  %2120 = icmp ne ptr %2119, null
  br i1 %2120, label %2121, label %2124

2121:                                             ; preds = %2118
  %2122 = load ptr, ptr %82, align 8
  %2123 = load ptr, ptr %8, align 8
  store ptr %2122, ptr %2123, align 8
  br label %2126

2124:                                             ; preds = %2118
  %2125 = load ptr, ptr %82, align 8
  call void @free(ptr noundef %2125)
  br label %2126

2126:                                             ; preds = %2124, %2121
  store i1 true, ptr %3, align 1
  br label %2163

2127:                                             ; preds = %118
  br label %2128

2128:                                             ; preds = %2138, %2127
  %2129 = load ptr, ptr %5, align 8
  %2130 = getelementptr inbounds %struct.parser_info, ptr %2129, i32 0, i32 2
  %2131 = getelementptr inbounds %struct.Token, ptr %2130, i32 0, i32 0
  %2132 = load i32, ptr %2131, align 8
  %2133 = icmp eq i32 %2132, 37
  br i1 %2133, label %2134, label %2139

2134:                                             ; preds = %2128
  %2135 = load ptr, ptr %5, align 8
  %2136 = call zeroext i1 @safe_get_token(ptr noundef %2135)
  br i1 %2136, label %2138, label %2137

2137:                                             ; preds = %2134
  store i1 false, ptr %3, align 1
  br label %2163

2138:                                             ; preds = %2134
  br label %2128

2139:                                             ; preds = %2128
  store i1 true, ptr %3, align 1
  br label %2163

2140:                                             ; preds = %118
  %2141 = load ptr, ptr %5, align 8
  %2142 = getelementptr inbounds %struct.parser_info, ptr %2141, i32 0, i32 2
  %2143 = getelementptr inbounds %struct.Token, ptr %2142, i32 0, i32 0
  %2144 = load i32, ptr %2143, align 8
  %2145 = icmp ne i32 %2144, 37
  br i1 %2145, label %2146, label %2148

2146:                                             ; preds = %2140
  %2147 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %2147, i32 noundef 2, ptr noundef @.str.83.289)
  store i1 false, ptr %3, align 1
  br label %2163

2148:                                             ; preds = %2140
  br label %2149

2149:                                             ; preds = %2159, %2148
  %2150 = load ptr, ptr %5, align 8
  %2151 = getelementptr inbounds %struct.parser_info, ptr %2150, i32 0, i32 2
  %2152 = getelementptr inbounds %struct.Token, ptr %2151, i32 0, i32 0
  %2153 = load i32, ptr %2152, align 8
  %2154 = icmp eq i32 %2153, 37
  br i1 %2154, label %2155, label %2160

2155:                                             ; preds = %2149
  %2156 = load ptr, ptr %5, align 8
  %2157 = call zeroext i1 @safe_get_token(ptr noundef %2156)
  br i1 %2157, label %2159, label %2158

2158:                                             ; preds = %2155
  store i1 false, ptr %3, align 1
  br label %2163

2159:                                             ; preds = %2155
  br label %2149

2160:                                             ; preds = %2149
  store i1 true, ptr %3, align 1
  br label %2163

2161:                                             ; preds = %118
  %2162 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %2162, i32 noundef 2, ptr noundef @.str.84.290)
  store i1 false, ptr %3, align 1
  br label %2163

2163:                                             ; preds = %2161, %2160, %2158, %2146, %2139, %2137, %2126, %2117, %2111, %2102, %2099, %2083, %2078, %2076, %2068, %2040, %2018, %2013, %1997, %1993, %1983, %1976, %1971, %1970, %1969, %1959, %1958, %1953, %1946, %1893, %1888, %1878, %1874, %1869, %1854, %1850, %1832, %1825, %1818, %1808, %1799, %1794, %1785, %1780, %1773, %1729, %1682, %1665, %1637, %1589, %1551, %1541, %1524, %1513, %1507, %1491, %1463, %1453, %1448, %1441, %1429, %1407, %1406, %1400, %1371, %1365, %1350, %1343, %1338, %1337, %1333, %1326, %1322, %1284, %1259, %1242, %1231, %1227, %1221, %1214, %1207, %1202, %1201, %1191, %1190, %1186, %1148, %1123, %1106, %1095, %1089, %1088, %1079, %1052, %1045, %1038, %1031, %985, %973, %967, %962, %955, %949, %948, %940, %935, %927, %926, %915, %911, %859, %847, %841, %835, %828, %824, %810, %789, %773, %768, %756, %738, %726, %711, %689, %684, %675, %668, %661, %651, %650, %644, %640, %632, %623, %610, %605, %598, %591, %590, %584, %580, %573, %564, %558, %554, %546, %537, %525, %520, %513, %507, %506, %495, %492, %490, %474, %470, %459, %448, %437, %420, %410, %401, %400, %393, %388, %387, %379, %369, %360, %353, %341, %332, %323, %317, %308, %302, %295, %293, %286, %282, %277, %270, %266, %261, %254, %249, %235, %230, %221, %220, %215, %208, %204, %199, %192, %187, %173, %169, %164, %157, %155, %147, %140, %134, %129, %87
  %2164 = load i1, ptr %3, align 1
  ret i1 %2164
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @error_process(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.parser_info, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %20

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.parser_info, ptr %13, i32 0, i32 1
  store i32 %12, ptr %14, align 4
  %15 = load ptr, ptr @__stderrp, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.311, ptr noundef %16) #13
  %18 = load ptr, ptr @__stderrp, align 8
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.1.312) #13
  br label %20

20:                                               ; preds = %11, %3
  %21 = load ptr, ptr @__stderrp, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.2.313, ptr noundef %22) #13
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @safe_get_token(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca [256 x i8], align 1
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.parser_info, ptr %6, i32 0, i32 2
  %8 = call [2 x i64] @get_token()
  store [2 x i64] %8, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %4, i64 16, i1 false)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.parser_info, ptr %9, i32 0, i32 2
  %11 = getelementptr inbounds %struct.Token, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 40
  br i1 %13, label %14, label %23

14:                                               ; preds = %1
  %15 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.parser_info, ptr %16, i32 0, i32 2
  %18 = getelementptr inbounds %struct.Token, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %15, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.3.310, ptr noundef %19)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  call void @error_process(ptr noundef %21, i32 noundef 1, ptr noundef %22)
  store i1 false, ptr %2, align 1
  br label %24

23:                                               ; preds = %1
  store i1 true, ptr %2, align 1
  br label %24

24:                                               ; preds = %23, %14
  %25 = load i1, ptr %2, align 1
  ret i1 %25
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #3

declare i32 @__sprintf_chk(ptr noundef, i32 noundef, i64 noundef, ptr noundef, ...) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @form_expression(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i8 1, ptr %7, align 1
  %12 = call ptr @malloc(i64 noundef 16) #11
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %16, i32 noundef 99, ptr noundef @.str.85.305)
  store ptr null, ptr %3, align 8
  br label %227

17:                                               ; preds = %2
  %18 = load ptr, ptr %8, align 8
  call void @token_array_init(ptr noundef %18)
  %19 = load ptr, ptr %5, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %61

21:                                               ; preds = %17
  %22 = call ptr @malloc(i64 noundef 16) #11
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %21
  %26 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %26, i32 noundef 99, ptr noundef @.str.86.306)
  %27 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %27)
  store ptr null, ptr %3, align 8
  br label %227

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.Token, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds %struct.Token, ptr %32, i32 0, i32 0
  store i32 %31, ptr %33, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.Token, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %54

38:                                               ; preds = %28
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.Token, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = call ptr @strdup(ptr noundef %41)
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds %struct.Token, ptr %43, i32 0, i32 1
  store ptr %42, ptr %44, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = getelementptr inbounds %struct.Token, ptr %45, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = icmp eq ptr %47, null
  br i1 %48, label %49, label %53

49:                                               ; preds = %38
  %50 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %50, i32 noundef 99, ptr noundef @.str.87.307)
  %51 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %51)
  %52 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %52)
  store ptr null, ptr %3, align 8
  br label %227

53:                                               ; preds = %38
  br label %57

54:                                               ; preds = %28
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr inbounds %struct.Token, ptr %55, i32 0, i32 1
  store ptr null, ptr %56, align 8
  br label %57

57:                                               ; preds = %54, %53
  %58 = load ptr, ptr %8, align 8
  %59 = load ptr, ptr %9, align 8
  %60 = call zeroext i1 @token_array_push(ptr noundef %58, ptr noundef %59)
  br label %61

61:                                               ; preds = %57, %17
  br label %62

62:                                               ; preds = %212, %61
  %63 = load i8, ptr %7, align 1
  %64 = trunc i8 %63 to i1
  br i1 %64, label %65, label %213

65:                                               ; preds = %62
  %66 = call ptr @malloc(i64 noundef 16) #11
  store ptr %66, ptr %10, align 8
  %67 = load ptr, ptr %10, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %69, label %72

69:                                               ; preds = %65
  %70 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %70, i32 noundef 99, ptr noundef @.str.86.306)
  %71 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %71)
  store ptr null, ptr %3, align 8
  br label %227

72:                                               ; preds = %65
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.parser_info, ptr %73, i32 0, i32 2
  %75 = getelementptr inbounds %struct.Token, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = load ptr, ptr %10, align 8
  %78 = getelementptr inbounds %struct.Token, ptr %77, i32 0, i32 0
  store i32 %76, ptr %78, align 8
  %79 = load ptr, ptr %4, align 8
  %80 = getelementptr inbounds %struct.parser_info, ptr %79, i32 0, i32 2
  %81 = getelementptr inbounds %struct.Token, ptr %80, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  %83 = icmp ne ptr %82, null
  br i1 %83, label %84, label %101

84:                                               ; preds = %72
  %85 = load ptr, ptr %4, align 8
  %86 = getelementptr inbounds %struct.parser_info, ptr %85, i32 0, i32 2
  %87 = getelementptr inbounds %struct.Token, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = call ptr @strdup(ptr noundef %88)
  %90 = load ptr, ptr %10, align 8
  %91 = getelementptr inbounds %struct.Token, ptr %90, i32 0, i32 1
  store ptr %89, ptr %91, align 8
  %92 = load ptr, ptr %10, align 8
  %93 = getelementptr inbounds %struct.Token, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = icmp eq ptr %94, null
  br i1 %95, label %96, label %100

96:                                               ; preds = %84
  %97 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %97, i32 noundef 99, ptr noundef @.str.87.307)
  %98 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %98)
  %99 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %99)
  store ptr null, ptr %3, align 8
  br label %227

100:                                              ; preds = %84
  br label %104

101:                                              ; preds = %72
  %102 = load ptr, ptr %10, align 8
  %103 = getelementptr inbounds %struct.Token, ptr %102, i32 0, i32 1
  store ptr null, ptr %103, align 8
  br label %104

104:                                              ; preds = %101, %100
  %105 = load ptr, ptr %10, align 8
  %106 = getelementptr inbounds %struct.Token, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 8
  %108 = icmp eq i32 %107, 31
  br i1 %108, label %109, label %117

109:                                              ; preds = %104
  %110 = load ptr, ptr %8, align 8
  %111 = load ptr, ptr %10, align 8
  %112 = call zeroext i1 @token_array_push(ptr noundef %110, ptr noundef %111)
  %113 = load i32, ptr %6, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %6, align 4
  %115 = load ptr, ptr %4, align 8
  %116 = call zeroext i1 @safe_get_token(ptr noundef %115)
  br label %212

117:                                              ; preds = %104
  %118 = load ptr, ptr %10, align 8
  %119 = getelementptr inbounds %struct.Token, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 32
  br i1 %121, label %122, label %136

122:                                              ; preds = %117
  %123 = load i32, ptr %6, align 4
  %124 = icmp sgt i32 %123, 0
  br i1 %124, label %125, label %133

125:                                              ; preds = %122
  %126 = load ptr, ptr %8, align 8
  %127 = load ptr, ptr %10, align 8
  %128 = call zeroext i1 @token_array_push(ptr noundef %126, ptr noundef %127)
  %129 = load i32, ptr %6, align 4
  %130 = add nsw i32 %129, -1
  store i32 %130, ptr %6, align 4
  %131 = load ptr, ptr %4, align 8
  %132 = call zeroext i1 @safe_get_token(ptr noundef %131)
  br label %135

133:                                              ; preds = %122
  store i8 0, ptr %7, align 1
  %134 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %134)
  br label %135

135:                                              ; preds = %133, %125
  br label %211

136:                                              ; preds = %117
  %137 = load ptr, ptr %10, align 8
  %138 = load [2 x i64], ptr %137, align 8
  %139 = call zeroext i1 @is_term([2 x i64] %138)
  br i1 %139, label %140, label %159

140:                                              ; preds = %136
  %141 = load ptr, ptr %8, align 8
  %142 = load ptr, ptr %10, align 8
  %143 = call zeroext i1 @token_array_push(ptr noundef %141, ptr noundef %142)
  %144 = load ptr, ptr %4, align 8
  %145 = call zeroext i1 @safe_get_token(ptr noundef %144)
  %146 = load ptr, ptr %4, align 8
  %147 = getelementptr inbounds %struct.parser_info, ptr %146, i32 0, i32 2
  %148 = getelementptr inbounds %struct.Token, ptr %147, i32 0, i32 0
  %149 = load i32, ptr %148, align 8
  %150 = icmp eq i32 %149, 37
  br i1 %150, label %157, label %151

151:                                              ; preds = %140
  %152 = load ptr, ptr %4, align 8
  %153 = getelementptr inbounds %struct.parser_info, ptr %152, i32 0, i32 2
  %154 = getelementptr inbounds %struct.Token, ptr %153, i32 0, i32 0
  %155 = load i32, ptr %154, align 8
  %156 = icmp eq i32 %155, 34
  br i1 %156, label %157, label %158

157:                                              ; preds = %151, %140
  store i8 0, ptr %7, align 1
  br label %158

158:                                              ; preds = %157, %151
  br label %210

159:                                              ; preds = %136
  %160 = load ptr, ptr %10, align 8
  %161 = load [2 x i64], ptr %160, align 8
  %162 = call zeroext i1 @is_op([2 x i64] %161)
  br i1 %162, label %163, label %178

163:                                              ; preds = %159
  %164 = load ptr, ptr %8, align 8
  %165 = load ptr, ptr %10, align 8
  %166 = call zeroext i1 @token_array_push(ptr noundef %164, ptr noundef %165)
  %167 = load ptr, ptr %4, align 8
  %168 = call zeroext i1 @safe_get_token(ptr noundef %167)
  %169 = load ptr, ptr %4, align 8
  %170 = getelementptr inbounds %struct.parser_info, ptr %169, i32 0, i32 2
  %171 = getelementptr inbounds %struct.Token, ptr %170, i32 0, i32 0
  %172 = load i32, ptr %171, align 8
  %173 = icmp eq i32 %172, 37
  br i1 %173, label %174, label %177

174:                                              ; preds = %163
  %175 = load ptr, ptr %4, align 8
  %176 = call zeroext i1 (i32, ptr, ...) @process_rule(i32 noundef 23, ptr noundef %175)
  br label %177

177:                                              ; preds = %174, %163
  br label %209

178:                                              ; preds = %159
  %179 = load ptr, ptr %4, align 8
  %180 = getelementptr inbounds %struct.parser_info, ptr %179, i32 0, i32 2
  %181 = getelementptr inbounds %struct.Token, ptr %180, i32 0, i32 0
  %182 = load i32, ptr %181, align 8
  %183 = icmp eq i32 %182, 37
  br i1 %183, label %202, label %184

184:                                              ; preds = %178
  %185 = load ptr, ptr %4, align 8
  %186 = getelementptr inbounds %struct.parser_info, ptr %185, i32 0, i32 2
  %187 = getelementptr inbounds %struct.Token, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = icmp eq i32 %188, 34
  br i1 %189, label %202, label %190

190:                                              ; preds = %184
  %191 = load ptr, ptr %4, align 8
  %192 = getelementptr inbounds %struct.parser_info, ptr %191, i32 0, i32 2
  %193 = getelementptr inbounds %struct.Token, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 32
  br i1 %195, label %202, label %196

196:                                              ; preds = %190
  %197 = load ptr, ptr %4, align 8
  %198 = getelementptr inbounds %struct.parser_info, ptr %197, i32 0, i32 2
  %199 = getelementptr inbounds %struct.Token, ptr %198, i32 0, i32 0
  %200 = load i32, ptr %199, align 8
  %201 = icmp eq i32 %200, 35
  br i1 %201, label %202, label %204

202:                                              ; preds = %196, %190, %184, %178
  store i8 0, ptr %7, align 1
  %203 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %203)
  br label %208

204:                                              ; preds = %196
  %205 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %205, i32 noundef 2, ptr noundef @.str.88.308)
  %206 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %206)
  %207 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %207)
  store ptr null, ptr %3, align 8
  br label %227

208:                                              ; preds = %202
  br label %209

209:                                              ; preds = %208, %177
  br label %210

210:                                              ; preds = %209, %158
  br label %211

211:                                              ; preds = %210, %135
  br label %212

212:                                              ; preds = %211, %109
  br label %62

213:                                              ; preds = %62
  %214 = call ptr @malloc(i64 noundef 16) #11
  store ptr %214, ptr %11, align 8
  %215 = load ptr, ptr %11, align 8
  %216 = icmp eq ptr %215, null
  br i1 %216, label %217, label %220

217:                                              ; preds = %213
  %218 = load ptr, ptr %4, align 8
  call void @error_process(ptr noundef %218, i32 noundef 99, ptr noundef @.str.89.309)
  %219 = load ptr, ptr %8, align 8
  call void @token_array_dispose(ptr noundef %219)
  store ptr null, ptr %3, align 8
  br label %227

220:                                              ; preds = %213
  %221 = load ptr, ptr %11, align 8
  %222 = getelementptr inbounds %struct.Token, ptr %221, i32 0, i32 0
  store i32 39, ptr %222, align 8
  %223 = load ptr, ptr %8, align 8
  %224 = load ptr, ptr %11, align 8
  %225 = call zeroext i1 @token_array_push(ptr noundef %223, ptr noundef %224)
  %226 = load ptr, ptr %8, align 8
  store ptr %226, ptr %3, align 8
  br label %227

227:                                              ; preds = %220, %217, %204, %96, %69, %49, %25, %15
  %228 = load ptr, ptr %3, align 8
  ret ptr %228
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @expression_parser(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.symtable, align 8
  %9 = alloca %struct.symtable, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i8, align 1
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.parser_info, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %3
  store i1 false, ptr %4, align 1
  br label %216

25:                                               ; preds = %3
  %26 = load ptr, ptr %6, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store i1 false, ptr %4, align 1
  br label %216

29:                                               ; preds = %25
  call void @stack_init(ptr noundef %8)
  call void @stack_init(ptr noundef %9)
  %30 = call ptr @malloc(i64 noundef 16) #11
  store ptr %30, ptr %10, align 8
  %31 = load ptr, ptr %10, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %34, i32 noundef 99, ptr noundef @.str.100.291)
  store i1 false, ptr %4, align 1
  br label %216

35:                                               ; preds = %29
  %36 = load ptr, ptr %10, align 8
  %37 = getelementptr inbounds %struct.Token, ptr %36, i32 0, i32 0
  store i32 39, ptr %37, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = call zeroext i1 @stack_push(ptr noundef %8, ptr noundef %38)
  store i32 0, ptr %11, align 4
  store i8 1, ptr %12, align 1
  store i8 1, ptr %13, align 1
  br label %40

40:                                               ; preds = %150, %69, %35
  %41 = load i8, ptr %12, align 1
  %42 = trunc i8 %41 to i1
  br i1 %42, label %43, label %49

43:                                               ; preds = %40
  %44 = load i32, ptr %11, align 4
  %45 = load ptr, ptr %6, align 8
  %46 = getelementptr inbounds %struct.TokenArray, ptr %45, i32 0, i32 1
  %47 = load i32, ptr %46, align 8
  %48 = icmp slt i32 %44, %47
  br label %49

49:                                               ; preds = %43, %40
  %50 = phi i1 [ false, %40 ], [ %48, %43 ]
  br i1 %50, label %51, label %151

51:                                               ; preds = %49
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds %struct.TokenArray, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %11, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds ptr, ptr %54, i64 %56
  %58 = load ptr, ptr %57, align 8
  store ptr %58, ptr %14, align 8
  %59 = load ptr, ptr %14, align 8
  %60 = load [2 x i64], ptr %59, align 8
  %61 = call zeroext i1 @is_term([2 x i64] %60)
  br i1 %61, label %62, label %81

62:                                               ; preds = %51
  %63 = load ptr, ptr %14, align 8
  %64 = load ptr, ptr %5, align 8
  %65 = call ptr @token_to_symbol(ptr noundef %63, ptr noundef %64)
  store ptr %65, ptr %15, align 8
  %66 = load ptr, ptr %15, align 8
  %67 = icmp ne ptr %66, null
  br i1 %67, label %69, label %68

68:                                               ; preds = %62
  store i8 0, ptr %13, align 1
  br label %165

69:                                               ; preds = %62
  %70 = load ptr, ptr %15, align 8
  %71 = call zeroext i1 @stack_push(ptr noundef %9, ptr noundef %70)
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.TokenArray, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  %75 = load i32, ptr %11, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds ptr, ptr %74, i64 %76
  store ptr null, ptr %77, align 8
  %78 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %78)
  %79 = load i32, ptr %11, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %11, align 4
  br label %40

81:                                               ; preds = %51
  %82 = call ptr @stack_top(ptr noundef %8)
  store ptr %82, ptr %16, align 8
  %83 = load ptr, ptr %16, align 8
  %84 = load [2 x i64], ptr %83, align 8
  %85 = call i32 @token_precedence([2 x i64] %84)
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [14 x [14 x i8]], ptr @precedence_matrix, i64 0, i64 %86
  %88 = load ptr, ptr %14, align 8
  %89 = load [2 x i64], ptr %88, align 8
  %90 = call i32 @token_precedence([2 x i64] %89)
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [14 x i8], ptr %87, i64 0, i64 %91
  %93 = load i8, ptr %92, align 1
  store i8 %93, ptr %17, align 1
  %94 = load i8, ptr %17, align 1
  %95 = sext i8 %94 to i32
  switch i32 %95, label %136 [
    i32 60, label %96
    i32 62, label %107
    i32 61, label %118
  ]

96:                                               ; preds = %81
  %97 = load ptr, ptr %14, align 8
  %98 = call zeroext i1 @stack_push(ptr noundef %8, ptr noundef %97)
  %99 = load ptr, ptr %6, align 8
  %100 = getelementptr inbounds %struct.TokenArray, ptr %99, i32 0, i32 0
  %101 = load ptr, ptr %100, align 8
  %102 = load i32, ptr %11, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds ptr, ptr %101, i64 %103
  store ptr null, ptr %104, align 8
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %11, align 4
  br label %150

107:                                              ; preds = %81
  %108 = getelementptr inbounds %struct.symtable, ptr %9, i32 0, i32 1
  %109 = load i32, ptr %108, align 8
  %110 = icmp slt i32 %109, 2
  br i1 %110, label %111, label %113

111:                                              ; preds = %107
  %112 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %112, i32 noundef 2, ptr noundef @.str.101.292)
  store i8 0, ptr %13, align 1
  br label %165

113:                                              ; preds = %107
  %114 = load ptr, ptr %5, align 8
  %115 = call zeroext i1 @reduce(ptr noundef %8, ptr noundef %9, ptr noundef %114)
  br i1 %115, label %117, label %116

116:                                              ; preds = %113
  store i8 0, ptr %13, align 1
  br label %165

117:                                              ; preds = %113
  br label %150

118:                                              ; preds = %81
  %119 = call ptr @stack_pop(ptr noundef %8)
  store ptr %119, ptr %18, align 8
  %120 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %120)
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.TokenArray, ptr %121, i32 0, i32 0
  %123 = load ptr, ptr %122, align 8
  %124 = load i32, ptr %11, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds ptr, ptr %123, i64 %125
  %127 = load ptr, ptr %126, align 8
  call void @free(ptr noundef %127)
  %128 = load ptr, ptr %6, align 8
  %129 = getelementptr inbounds %struct.TokenArray, ptr %128, i32 0, i32 0
  %130 = load ptr, ptr %129, align 8
  %131 = load i32, ptr %11, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds ptr, ptr %130, i64 %132
  store ptr null, ptr %133, align 8
  %134 = load i32, ptr %11, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %11, align 4
  br label %150

136:                                              ; preds = %81
  %137 = load ptr, ptr %16, align 8
  %138 = getelementptr inbounds %struct.Token, ptr %137, i32 0, i32 0
  %139 = load i32, ptr %138, align 8
  %140 = icmp eq i32 %139, 39
  br i1 %140, label %141, label %147

141:                                              ; preds = %136
  %142 = load ptr, ptr %14, align 8
  %143 = getelementptr inbounds %struct.Token, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = icmp eq i32 %144, 39
  br i1 %145, label %146, label %147

146:                                              ; preds = %141
  store i8 0, ptr %12, align 1
  br label %149

147:                                              ; preds = %141, %136
  %148 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %148, i32 noundef 2, ptr noundef @.str.102.293)
  store i8 0, ptr %13, align 1
  br label %165

149:                                              ; preds = %146
  br label %150

150:                                              ; preds = %149, %118, %117, %96
  br label %40

151:                                              ; preds = %49
  %152 = load i8, ptr %13, align 1
  %153 = trunc i8 %152 to i1
  br i1 %153, label %154, label %164

154:                                              ; preds = %151
  %155 = getelementptr inbounds %struct.symtable, ptr %9, i32 0, i32 1
  %156 = load i32, ptr %155, align 8
  %157 = icmp eq i32 %156, 1
  br i1 %157, label %158, label %161

158:                                              ; preds = %154
  %159 = call ptr @stack_pop(ptr noundef %9)
  %160 = load ptr, ptr %7, align 8
  store ptr %159, ptr %160, align 8
  br label %163

161:                                              ; preds = %154
  %162 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %162, i32 noundef 2, ptr noundef @.str.103.294)
  store i8 0, ptr %13, align 1
  br label %163

163:                                              ; preds = %161, %158
  br label %164

164:                                              ; preds = %163, %151
  br label %165

165:                                              ; preds = %164, %147, %116, %111, %68
  br label %166

166:                                              ; preds = %169, %165
  %167 = call zeroext i1 @stack_is_empty(ptr noundef %8)
  %168 = xor i1 %167, true
  br i1 %168, label %169, label %171

169:                                              ; preds = %166
  %170 = call ptr @stack_pop(ptr noundef %8)
  call void @free(ptr noundef %170)
  br label %166

171:                                              ; preds = %166
  br label %172

172:                                              ; preds = %175, %171
  %173 = call zeroext i1 @stack_is_empty(ptr noundef %9)
  %174 = xor i1 %173, true
  br i1 %174, label %175, label %177

175:                                              ; preds = %172
  %176 = call ptr @stack_pop(ptr noundef %9)
  call void @free(ptr noundef %176)
  br label %172

177:                                              ; preds = %172
  call void @stack_dispose(ptr noundef %8)
  call void @stack_dispose(ptr noundef %9)
  %178 = load ptr, ptr %6, align 8
  %179 = icmp ne ptr %178, null
  br i1 %179, label %180, label %213

180:                                              ; preds = %177
  store i32 0, ptr %19, align 4
  br label %181

181:                                              ; preds = %205, %180
  %182 = load i32, ptr %19, align 4
  %183 = load ptr, ptr %6, align 8
  %184 = getelementptr inbounds %struct.TokenArray, ptr %183, i32 0, i32 1
  %185 = load i32, ptr %184, align 8
  %186 = icmp slt i32 %182, %185
  br i1 %186, label %187, label %208

187:                                              ; preds = %181
  %188 = load ptr, ptr %6, align 8
  %189 = getelementptr inbounds %struct.TokenArray, ptr %188, i32 0, i32 0
  %190 = load ptr, ptr %189, align 8
  %191 = load i32, ptr %19, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds ptr, ptr %190, i64 %192
  %194 = load ptr, ptr %193, align 8
  %195 = icmp ne ptr %194, null
  br i1 %195, label %196, label %204

196:                                              ; preds = %187
  %197 = load ptr, ptr %6, align 8
  %198 = getelementptr inbounds %struct.TokenArray, ptr %197, i32 0, i32 0
  %199 = load ptr, ptr %198, align 8
  %200 = load i32, ptr %19, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds ptr, ptr %199, i64 %201
  %203 = load ptr, ptr %202, align 8
  call void @free(ptr noundef %203)
  br label %204

204:                                              ; preds = %196, %187
  br label %205

205:                                              ; preds = %204
  %206 = load i32, ptr %19, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, ptr %19, align 4
  br label %181

208:                                              ; preds = %181
  %209 = load ptr, ptr %6, align 8
  %210 = getelementptr inbounds %struct.TokenArray, ptr %209, i32 0, i32 0
  %211 = load ptr, ptr %210, align 8
  call void @free(ptr noundef %211)
  %212 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %212)
  br label %213

213:                                              ; preds = %208, %177
  %214 = load i8, ptr %13, align 1
  %215 = trunc i8 %214 to i1
  store i1 %215, ptr %4, align 1
  br label %216

216:                                              ; preds = %213, %33, %28, %24
  %217 = load i1, ptr %4, align 1
  ret i1 %217
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_term([2 x i64] %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca %struct.Token, align 8
  store [2 x i64] %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %39, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %39, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp eq i32 %13, 3
  br i1 %14, label %39, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 4
  br i1 %18, label %39, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 2
  br i1 %22, label %39, label %23

23:                                               ; preds = %19
  %24 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 5
  br i1 %26, label %39, label %27

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %29, 17
  br i1 %30, label %39, label %31

31:                                               ; preds = %27
  %32 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 18
  br i1 %34, label %39, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = icmp eq i32 %37, 19
  br i1 %38, label %39, label %40

39:                                               ; preds = %35, %31, %27, %23, %19, %15, %11, %7, %1
  store i1 true, ptr %2, align 1
  br label %41

40:                                               ; preds = %35
  store i1 false, ptr %2, align 1
  br label %41

41:                                               ; preds = %40, %39
  %42 = load i1, ptr %2, align 1
  ret i1 %42
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @token_to_symbol(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = call ptr @malloc(i64 noundef 40) #11
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %13, i32 noundef 99, ptr noundef @.str.90.301)
  store ptr null, ptr %3, align 8
  br label %180

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.Token, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %19, label %26

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.symbol_info, ptr %20, i32 0, i32 2
  store i32 0, ptr %21, align 4
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.Token, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = call i32 @atoi(ptr noundef %24)
  call void @gen_pushs_int(i32 noundef %25)
  br label %178

26:                                               ; preds = %14
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.Token, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %29, 4
  br i1 %30, label %31, label %38

31:                                               ; preds = %26
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds %struct.symbol_info, ptr %32, i32 0, i32 2
  store i32 0, ptr %33, align 4
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.Token, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = call double @atof(ptr noundef %36)
  call void @gen_pushs_float(double noundef %37)
  br label %177

38:                                               ; preds = %26
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.Token, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %43, label %49

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds %struct.symbol_info, ptr %44, i32 0, i32 2
  store i32 1, ptr %45, align 4
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.Token, ptr %46, i32 0, i32 1
  %48 = load ptr, ptr %47, align 8
  call void @gen_pushs_string(ptr noundef %48)
  br label %176

49:                                               ; preds = %38
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.Token, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  %53 = icmp eq i32 %52, 5
  br i1 %53, label %54, label %57

54:                                               ; preds = %49
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr inbounds %struct.symbol_info, ptr %55, i32 0, i32 2
  store i32 2, ptr %56, align 4
  call void @gen_pushs_null()
  br label %175

57:                                               ; preds = %49
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds %struct.Token, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = icmp eq i32 %60, 17
  br i1 %61, label %72, label %62

62:                                               ; preds = %57
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.Token, ptr %63, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = icmp eq i32 %65, 18
  br i1 %66, label %72, label %67

67:                                               ; preds = %62
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds %struct.Token, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = icmp eq i32 %70, 19
  br i1 %71, label %72, label %93

72:                                               ; preds = %67, %62, %57
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.Token, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = icmp eq i32 %75, 17
  br i1 %76, label %77, label %80

77:                                               ; preds = %72
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.symbol_info, ptr %78, i32 0, i32 2
  store i32 0, ptr %79, align 4
  br label %92

80:                                               ; preds = %72
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds %struct.Token, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %82, align 8
  %84 = icmp eq i32 %83, 18
  br i1 %84, label %85, label %88

85:                                               ; preds = %80
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.symbol_info, ptr %86, i32 0, i32 2
  store i32 1, ptr %87, align 4
  br label %91

88:                                               ; preds = %80
  %89 = load ptr, ptr %6, align 8
  %90 = getelementptr inbounds %struct.symbol_info, ptr %89, i32 0, i32 2
  store i32 2, ptr %90, align 4
  br label %91

91:                                               ; preds = %88, %85
  br label %92

92:                                               ; preds = %91, %77
  br label %174

93:                                               ; preds = %67
  %94 = load ptr, ptr %4, align 8
  %95 = getelementptr inbounds %struct.Token, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %95, align 8
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %103, label %98

98:                                               ; preds = %93
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.Token, ptr %99, i32 0, i32 0
  %101 = load i32, ptr %100, align 8
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %170

103:                                              ; preds = %98, %93
  store ptr null, ptr %7, align 8
  store i8 0, ptr %8, align 1
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds %struct.Token, ptr %104, i32 0, i32 0
  %106 = load i32, ptr %105, align 8
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %141

108:                                              ; preds = %103
  %109 = load ptr, ptr %5, align 8
  %110 = getelementptr inbounds %struct.parser_info, ptr %109, i32 0, i32 5
  %111 = load ptr, ptr %110, align 8
  %112 = load ptr, ptr %4, align 8
  %113 = getelementptr inbounds %struct.Token, ptr %112, i32 0, i32 1
  %114 = load ptr, ptr %113, align 8
  %115 = call zeroext i1 @search_in_scope_stack(ptr noundef %111, ptr noundef %114, ptr noundef %7)
  %116 = zext i1 %115 to i8
  store i8 %116, ptr %8, align 1
  %117 = load i8, ptr %8, align 1
  %118 = trunc i8 %117 to i1
  br i1 %118, label %119, label %122

119:                                              ; preds = %108
  %120 = load ptr, ptr %7, align 8
  %121 = icmp eq ptr %120, null
  br i1 %121, label %122, label %125

122:                                              ; preds = %119, %108
  %123 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %123, i32 noundef 3, ptr noundef @.str.91.302)
  %124 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %124)
  store ptr null, ptr %3, align 8
  br label %180

125:                                              ; preds = %119
  %126 = load ptr, ptr %7, align 8
  %127 = call i32 @check_variable_init(ptr noundef %126)
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %132

129:                                              ; preds = %125
  %130 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %130, i32 noundef 3, ptr noundef @.str.92.303)
  %131 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %131)
  store ptr null, ptr %3, align 8
  br label %180

132:                                              ; preds = %125
  %133 = load ptr, ptr %7, align 8
  %134 = getelementptr inbounds %struct.symbol_info, ptr %133, i32 0, i32 2
  %135 = load i32, ptr %134, align 4
  %136 = load ptr, ptr %6, align 8
  %137 = getelementptr inbounds %struct.symbol_info, ptr %136, i32 0, i32 2
  store i32 %135, ptr %137, align 4
  %138 = load ptr, ptr %4, align 8
  %139 = getelementptr inbounds %struct.Token, ptr %138, i32 0, i32 1
  %140 = load ptr, ptr %139, align 8
  call void @gen_pushs(ptr noundef @.str.43.249, ptr noundef %140)
  br label %169

141:                                              ; preds = %103
  %142 = load ptr, ptr %5, align 8
  %143 = getelementptr inbounds %struct.parser_info, ptr %142, i32 0, i32 3
  %144 = getelementptr inbounds %struct.symtable, ptr %143, i32 0, i32 0
  %145 = load ptr, ptr %144, align 8
  %146 = load ptr, ptr %4, align 8
  %147 = getelementptr inbounds %struct.Token, ptr %146, i32 0, i32 1
  %148 = load ptr, ptr %147, align 8
  %149 = call zeroext i1 @symtable_search(ptr noundef %145, ptr noundef %148, ptr noundef %7)
  %150 = zext i1 %149 to i8
  store i8 %150, ptr %8, align 1
  %151 = load i8, ptr %8, align 1
  %152 = trunc i8 %151 to i1
  br i1 %152, label %153, label %156

153:                                              ; preds = %141
  %154 = load ptr, ptr %7, align 8
  %155 = icmp eq ptr %154, null
  br i1 %155, label %156, label %159

156:                                              ; preds = %153, %141
  %157 = load ptr, ptr %6, align 8
  %158 = getelementptr inbounds %struct.symbol_info, ptr %157, i32 0, i32 2
  store i32 2, ptr %158, align 4
  br label %165

159:                                              ; preds = %153
  %160 = load ptr, ptr %7, align 8
  %161 = getelementptr inbounds %struct.symbol_info, ptr %160, i32 0, i32 2
  %162 = load i32, ptr %161, align 4
  %163 = load ptr, ptr %6, align 8
  %164 = getelementptr inbounds %struct.symbol_info, ptr %163, i32 0, i32 2
  store i32 %162, ptr %164, align 4
  br label %165

165:                                              ; preds = %159, %156
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.Token, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  call void @gen_pushs(ptr noundef @.str.63.269, ptr noundef %168)
  br label %169

169:                                              ; preds = %165, %132
  br label %173

170:                                              ; preds = %98
  %171 = load ptr, ptr %5, align 8
  call void @error_process(ptr noundef %171, i32 noundef 99, ptr noundef @.str.93.304)
  %172 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %172)
  store ptr null, ptr %3, align 8
  br label %180

173:                                              ; preds = %169
  br label %174

174:                                              ; preds = %173, %92
  br label %175

175:                                              ; preds = %174, %54
  br label %176

176:                                              ; preds = %175, %43
  br label %177

177:                                              ; preds = %176, %31
  br label %178

178:                                              ; preds = %177, %19
  %179 = load ptr, ptr %6, align 8
  store ptr %179, ptr %3, align 8
  br label %180

180:                                              ; preds = %178, %170, %129, %122, %12
  %181 = load ptr, ptr %3, align 8
  ret ptr %181
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @token_precedence([2 x i64] %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.Token, align 8
  store [2 x i64] %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  switch i32 %5, label %20 [
    i32 31, label %6
    i32 32, label %7
    i32 22, label %8
    i32 23, label %9
    i32 20, label %10
    i32 21, label %11
    i32 27, label %12
    i32 28, label %13
    i32 29, label %14
    i32 30, label %15
    i32 9, label %16
    i32 25, label %17
    i32 26, label %18
    i32 39, label %19
  ]

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %21

7:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %21

8:                                                ; preds = %1
  store i32 2, ptr %2, align 4
  br label %21

9:                                                ; preds = %1
  store i32 3, ptr %2, align 4
  br label %21

10:                                               ; preds = %1
  store i32 4, ptr %2, align 4
  br label %21

11:                                               ; preds = %1
  store i32 5, ptr %2, align 4
  br label %21

12:                                               ; preds = %1
  store i32 6, ptr %2, align 4
  br label %21

13:                                               ; preds = %1
  store i32 7, ptr %2, align 4
  br label %21

14:                                               ; preds = %1
  store i32 8, ptr %2, align 4
  br label %21

15:                                               ; preds = %1
  store i32 9, ptr %2, align 4
  br label %21

16:                                               ; preds = %1
  store i32 10, ptr %2, align 4
  br label %21

17:                                               ; preds = %1
  store i32 11, ptr %2, align 4
  br label %21

18:                                               ; preds = %1
  store i32 12, ptr %2, align 4
  br label %21

19:                                               ; preds = %1
  store i32 13, ptr %2, align 4
  br label %21

20:                                               ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %21

21:                                               ; preds = %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @reduce(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = call ptr @stack_pop(ptr noundef %13)
  store ptr %14, ptr %8, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = call ptr @stack_pop(ptr noundef %15)
  store ptr %16, ptr %9, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = call ptr @stack_pop(ptr noundef %17)
  store ptr %18, ptr %10, align 8
  %19 = call ptr @malloc(i64 noundef 40) #11
  store ptr %19, ptr %11, align 8
  %20 = load ptr, ptr %11, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %27, label %22

22:                                               ; preds = %3
  %23 = load ptr, ptr %7, align 8
  call void @error_process(ptr noundef %23, i32 noundef 99, ptr noundef @.str.94.295)
  %24 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %24)
  %25 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %25)
  %26 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %26)
  store i1 false, ptr %4, align 1
  br label %133

27:                                               ; preds = %3
  %28 = load ptr, ptr %10, align 8
  %29 = getelementptr inbounds %struct.symbol_info, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = load ptr, ptr %9, align 8
  %32 = getelementptr inbounds %struct.symbol_info, ptr %31, i32 0, i32 2
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.Token, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = call i32 @check_expression_types(i32 noundef %30, i32 noundef %33, i32 noundef %36)
  store i32 %37, ptr %12, align 4
  %38 = load i32, ptr %12, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %47

40:                                               ; preds = %27
  %41 = load ptr, ptr %7, align 8
  %42 = load i32, ptr %12, align 4
  call void @error_process(ptr noundef %41, i32 noundef %42, ptr noundef @.str.95.296)
  %43 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %44)
  %45 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %45)
  %46 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %46)
  store i1 false, ptr %4, align 1
  br label %133

47:                                               ; preds = %27
  %48 = load ptr, ptr %11, align 8
  %49 = getelementptr inbounds %struct.symbol_info, ptr %48, i32 0, i32 2
  store i32 0, ptr %49, align 4
  %50 = load ptr, ptr %8, align 8
  %51 = getelementptr inbounds %struct.Token, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  switch i32 %52, label %120 [
    i32 20, label %53
    i32 21, label %70
    i32 22, label %73
    i32 23, label %90
    i32 27, label %93
    i32 28, label %94
    i32 29, label %95
    i32 30, label %96
    i32 25, label %97
    i32 26, label %98
    i32 9, label %99
  ]

53:                                               ; preds = %47
  %54 = load ptr, ptr %10, align 8
  %55 = getelementptr inbounds %struct.symbol_info, ptr %54, i32 0, i32 2
  %56 = load i32, ptr %55, align 4
  %57 = icmp eq i32 %56, 1
  br i1 %57, label %63, label %58

58:                                               ; preds = %53
  %59 = load ptr, ptr %9, align 8
  %60 = getelementptr inbounds %struct.symbol_info, ptr %59, i32 0, i32 2
  %61 = load i32, ptr %60, align 4
  %62 = icmp eq i32 %61, 1
  br i1 %62, label %63, label %66

63:                                               ; preds = %58, %53
  call void @gen_concats()
  %64 = load ptr, ptr %11, align 8
  %65 = getelementptr inbounds %struct.symbol_info, ptr %64, i32 0, i32 2
  store i32 1, ptr %65, align 4
  br label %69

66:                                               ; preds = %58
  call void @gen_int2floats()
  call void @gen_adds()
  %67 = load ptr, ptr %11, align 8
  %68 = getelementptr inbounds %struct.symbol_info, ptr %67, i32 0, i32 2
  store i32 0, ptr %68, align 4
  br label %69

69:                                               ; preds = %66, %63
  br label %126

70:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_subs()
  %71 = load ptr, ptr %11, align 8
  %72 = getelementptr inbounds %struct.symbol_info, ptr %71, i32 0, i32 2
  store i32 0, ptr %72, align 4
  br label %126

73:                                               ; preds = %47
  %74 = load ptr, ptr %10, align 8
  %75 = getelementptr inbounds %struct.symbol_info, ptr %74, i32 0, i32 2
  %76 = load i32, ptr %75, align 4
  %77 = icmp eq i32 %76, 1
  br i1 %77, label %78, label %86

78:                                               ; preds = %73
  %79 = load ptr, ptr %9, align 8
  %80 = getelementptr inbounds %struct.symbol_info, ptr %79, i32 0, i32 2
  %81 = load i32, ptr %80, align 4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %86

83:                                               ; preds = %78
  call void @gen_string_repeat()
  %84 = load ptr, ptr %11, align 8
  %85 = getelementptr inbounds %struct.symbol_info, ptr %84, i32 0, i32 2
  store i32 1, ptr %85, align 4
  br label %89

86:                                               ; preds = %78, %73
  call void @gen_int2floats()
  call void @gen_muls()
  %87 = load ptr, ptr %11, align 8
  %88 = getelementptr inbounds %struct.symbol_info, ptr %87, i32 0, i32 2
  store i32 0, ptr %88, align 4
  br label %89

89:                                               ; preds = %86, %83
  br label %126

90:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_divs()
  %91 = load ptr, ptr %11, align 8
  %92 = getelementptr inbounds %struct.symbol_info, ptr %91, i32 0, i32 2
  store i32 0, ptr %92, align 4
  br label %126

93:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_lts()
  br label %126

94:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_gts()
  br label %126

95:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_lteqs()
  br label %126

96:                                               ; preds = %47
  call void @gen_int2floats()
  call void @gen_gteqs()
  br label %126

97:                                               ; preds = %47
  call void @gen_eqs()
  br label %126

98:                                               ; preds = %47
  call void @gen_neqs()
  br label %126

99:                                               ; preds = %47
  %100 = load ptr, ptr %9, align 8
  %101 = getelementptr inbounds %struct.symbol_info, ptr %100, i32 0, i32 2
  %102 = load i32, ptr %101, align 4
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %105

104:                                              ; preds = %99
  call void @gen_is_type(ptr noundef @.str.96.297)
  br label %119

105:                                              ; preds = %99
  %106 = load ptr, ptr %9, align 8
  %107 = getelementptr inbounds %struct.symbol_info, ptr %106, i32 0, i32 2
  %108 = load i32, ptr %107, align 4
  %109 = icmp eq i32 %108, 1
  br i1 %109, label %110, label %111

110:                                              ; preds = %105
  call void @gen_is_type(ptr noundef @.str.97.298)
  br label %118

111:                                              ; preds = %105
  %112 = load ptr, ptr %9, align 8
  %113 = getelementptr inbounds %struct.symbol_info, ptr %112, i32 0, i32 2
  %114 = load i32, ptr %113, align 4
  %115 = icmp eq i32 %114, 2
  br i1 %115, label %116, label %117

116:                                              ; preds = %111
  call void @gen_is_type(ptr noundef @.str.98.299)
  br label %117

117:                                              ; preds = %116, %111
  br label %118

118:                                              ; preds = %117, %110
  br label %119

119:                                              ; preds = %118, %104
  br label %126

120:                                              ; preds = %47
  %121 = load ptr, ptr %7, align 8
  call void @error_process(ptr noundef %121, i32 noundef 99, ptr noundef @.str.99.300)
  %122 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %122)
  %123 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %123)
  %124 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %124)
  %125 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %125)
  store i1 false, ptr %4, align 1
  br label %133

126:                                              ; preds = %119, %98, %97, %96, %95, %94, %93, %90, %89, %70, %69
  %127 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %127)
  %128 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %128)
  %129 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %129)
  %130 = load ptr, ptr %6, align 8
  %131 = load ptr, ptr %11, align 8
  %132 = call zeroext i1 @stack_push(ptr noundef %130, ptr noundef %131)
  store i1 true, ptr %4, align 1
  br label %133

133:                                              ; preds = %126, %120, %40, %22
  %134 = load i1, ptr %4, align 1
  ret i1 %134
}

declare i32 @atoi(ptr noundef) #5

declare double @atof(ptr noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_op([2 x i64] %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca %struct.Token, align 8
  store [2 x i64] %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 20
  br i1 %6, label %55, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp eq i32 %9, 21
  br i1 %10, label %55, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp eq i32 %13, 22
  br i1 %14, label %55, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 23
  br i1 %18, label %55, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 31
  br i1 %22, label %55, label %23

23:                                               ; preds = %19
  %24 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 32
  br i1 %26, label %55, label %27

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %29, 25
  br i1 %30, label %55, label %31

31:                                               ; preds = %27
  %32 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 26
  br i1 %34, label %55, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = icmp eq i32 %37, 28
  br i1 %38, label %55, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = icmp eq i32 %41, 30
  br i1 %42, label %55, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %45, 27
  br i1 %46, label %55, label %47

47:                                               ; preds = %43
  %48 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 29
  br i1 %50, label %55, label %51

51:                                               ; preds = %47
  %52 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %53 = load i32, ptr %52, align 8
  %54 = icmp eq i32 %53, 9
  br i1 %54, label %55, label %56

55:                                               ; preds = %51, %47, %43, %39, %35, %31, %27, %23, %19, %15, %11, %7, %1
  store i1 true, ptr %2, align 1
  br label %57

56:                                               ; preds = %51
  store i1 false, ptr %2, align 1
  br label %57

57:                                               ; preds = %56, %55
  %58 = load i1, ptr %2, align 1
  ret i1 %58
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @check_keyword(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @.str.314) #13
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 6, ptr %2, align 4
  br label %79

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.1.315) #13
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 7, ptr %2, align 4
  br label %79

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 8
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.2.316) #13
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 8, ptr %2, align 4
  br label %79

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @.str.3.317) #13
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store i32 9, ptr %2, align 4
  br label %79

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @.str.4.318) #13
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store i32 10, ptr %2, align 4
  br label %79

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 8
  %30 = call i32 @strcmp(ptr noundef %29, ptr noundef @.str.5.319) #13
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %28
  store i32 11, ptr %2, align 4
  br label %79

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = call i32 @strcmp(ptr noundef %34, ptr noundef @.str.6.320) #13
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  store i32 12, ptr %2, align 4
  br label %79

38:                                               ; preds = %33
  %39 = load ptr, ptr %3, align 8
  %40 = call i32 @strcmp(ptr noundef %39, ptr noundef @.str.7.321) #13
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %38
  store i32 13, ptr %2, align 4
  br label %79

43:                                               ; preds = %38
  %44 = load ptr, ptr %3, align 8
  %45 = call i32 @strcmp(ptr noundef %44, ptr noundef @.str.8.322) #13
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %48

47:                                               ; preds = %43
  store i32 14, ptr %2, align 4
  br label %79

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = call i32 @strcmp(ptr noundef %49, ptr noundef @.str.9.323) #13
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  store i32 15, ptr %2, align 4
  br label %79

53:                                               ; preds = %48
  %54 = load ptr, ptr %3, align 8
  %55 = call i32 @strcmp(ptr noundef %54, ptr noundef @.str.10.324) #13
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %53
  store i32 16, ptr %2, align 4
  br label %79

58:                                               ; preds = %53
  %59 = load ptr, ptr %3, align 8
  %60 = call i32 @strcmp(ptr noundef %59, ptr noundef @.str.11.325) #13
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %63

62:                                               ; preds = %58
  store i32 17, ptr %2, align 4
  br label %79

63:                                               ; preds = %58
  %64 = load ptr, ptr %3, align 8
  %65 = call i32 @strcmp(ptr noundef %64, ptr noundef @.str.12.326) #13
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %63
  store i32 18, ptr %2, align 4
  br label %79

68:                                               ; preds = %63
  %69 = load ptr, ptr %3, align 8
  %70 = call i32 @strcmp(ptr noundef %69, ptr noundef @.str.13.327) #13
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %68
  store i32 19, ptr %2, align 4
  br label %79

73:                                               ; preds = %68
  %74 = load ptr, ptr %3, align 8
  %75 = call i32 @strcmp(ptr noundef %74, ptr noundef @.str.14.328) #13
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %73
  store i32 5, ptr %2, align 4
  br label %79

78:                                               ; preds = %73
  store i32 0, ptr %2, align 4
  br label %79

79:                                               ; preds = %78, %77, %72, %67, %62, %57, %52, %47, %42, %37, %32, %27, %22, %17, %12, %7
  %80 = load i32, ptr %2, align 4
  ret i32 %80
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define [2 x i64] @get_token() #0 {
  %1 = alloca %struct.Token, align 8
  %2 = alloca i32, align 4
  %3 = alloca [200 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [200 x i8], align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca [3 x i8], align 1
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  br label %30

30:                                               ; preds = %39, %0
  %31 = call i32 @getchar()
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %30
  %33 = load i32, ptr %2, align 4
  %34 = call i32 @isspace(i32 noundef %33) #15
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %32
  %37 = load i32, ptr %2, align 4
  %38 = icmp ne i32 %37, 10
  br label %39

39:                                               ; preds = %36, %32
  %40 = phi i1 [ false, %32 ], [ %38, %36 ]
  br i1 %40, label %30, label %41

41:                                               ; preds = %39
  %42 = load i32, ptr %2, align 4
  %43 = icmp eq i32 %42, -1
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 38, ptr %45, align 8
  %46 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  store ptr null, ptr %46, align 8
  br label %830

47:                                               ; preds = %41
  %48 = load i32, ptr %2, align 4
  %49 = call i32 @isalpha(i32 noundef %48) #15
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %99

51:                                               ; preds = %47
  store i32 0, ptr %4, align 4
  %52 = load i32, ptr %2, align 4
  %53 = trunc i32 %52 to i8
  %54 = load i32, ptr %4, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 %55
  store i8 %53, ptr %56, align 1
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %4, align 4
  br label %59

59:                                               ; preds = %73, %51
  %60 = call i32 @getchar()
  store i32 %60, ptr %2, align 4
  %61 = load i32, ptr %2, align 4
  %62 = call i32 @isalpha(i32 noundef %61) #15
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %71, label %64

64:                                               ; preds = %59
  %65 = load i32, ptr %2, align 4
  %66 = call i32 @isdigit(i32 noundef %65) #15
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %71, label %68

68:                                               ; preds = %64
  %69 = load i32, ptr %2, align 4
  %70 = icmp eq i32 %69, 95
  br label %71

71:                                               ; preds = %68, %64, %59
  %72 = phi i1 [ true, %64 ], [ true, %59 ], [ %70, %68 ]
  br i1 %72, label %73, label %81

73:                                               ; preds = %71
  %74 = load i32, ptr %2, align 4
  %75 = trunc i32 %74 to i8
  %76 = load i32, ptr %4, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 %77
  store i8 %75, ptr %78, align 1
  %79 = load i32, ptr %4, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %4, align 4
  br label %59

81:                                               ; preds = %71
  %82 = load i32, ptr %4, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 %83
  store i8 0, ptr %84, align 1
  %85 = load i32, ptr %2, align 4
  %86 = icmp ne i32 %85, -1
  br i1 %86, label %87, label %91

87:                                               ; preds = %81
  %88 = load i32, ptr %2, align 4
  %89 = load ptr, ptr @__stdinp, align 8
  %90 = call i32 @ungetc(i32 noundef %88, ptr noundef %89)
  br label %91

91:                                               ; preds = %87, %81
  %92 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %93 = call i32 @check_keyword(ptr noundef %92)
  store i32 %93, ptr %5, align 4
  %94 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  %95 = load i32, ptr %5, align 4
  store i32 %95, ptr %94, align 8
  %96 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %97 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %98 = call ptr @strdup(ptr noundef %97)
  store ptr %98, ptr %96, align 8
  br label %830

99:                                               ; preds = %47
  %100 = load i32, ptr %2, align 4
  %101 = icmp eq i32 %100, 95
  br i1 %101, label %102, label %162

102:                                              ; preds = %99
  %103 = call i32 @getchar()
  store i32 %103, ptr %2, align 4
  %104 = load i32, ptr %2, align 4
  %105 = icmp eq i32 %104, 95
  br i1 %105, label %106, label %158

106:                                              ; preds = %102
  store i32 0, ptr %7, align 4
  %107 = load i32, ptr %2, align 4
  %108 = trunc i32 %107 to i8
  %109 = load i32, ptr %7, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 %110
  store i8 %108, ptr %111, align 1
  %112 = load i32, ptr %7, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %7, align 4
  %114 = load i32, ptr %2, align 4
  %115 = trunc i32 %114 to i8
  %116 = load i32, ptr %7, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 %117
  store i8 %115, ptr %118, align 1
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %7, align 4
  br label %121

121:                                              ; preds = %135, %106
  %122 = call i32 @getchar()
  store i32 %122, ptr %2, align 4
  %123 = load i32, ptr %2, align 4
  %124 = call i32 @isalpha(i32 noundef %123) #15
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %133, label %126

126:                                              ; preds = %121
  %127 = load i32, ptr %2, align 4
  %128 = call i32 @isdigit(i32 noundef %127) #15
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %133, label %130

130:                                              ; preds = %126
  %131 = load i32, ptr %2, align 4
  %132 = icmp eq i32 %131, 95
  br label %133

133:                                              ; preds = %130, %126, %121
  %134 = phi i1 [ true, %126 ], [ true, %121 ], [ %132, %130 ]
  br i1 %134, label %135, label %143

135:                                              ; preds = %133
  %136 = load i32, ptr %2, align 4
  %137 = trunc i32 %136 to i8
  %138 = load i32, ptr %7, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 %139
  store i8 %137, ptr %140, align 1
  %141 = load i32, ptr %7, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, ptr %7, align 4
  br label %121

143:                                              ; preds = %133
  %144 = load i32, ptr %7, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 %145
  store i8 0, ptr %146, align 1
  %147 = load i32, ptr %2, align 4
  %148 = icmp ne i32 %147, -1
  br i1 %148, label %149, label %153

149:                                              ; preds = %143
  %150 = load i32, ptr %2, align 4
  %151 = load ptr, ptr @__stdinp, align 8
  %152 = call i32 @ungetc(i32 noundef %150, ptr noundef %151)
  br label %153

153:                                              ; preds = %149, %143
  %154 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 1, ptr %154, align 8
  %155 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %156 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 0
  %157 = call ptr @strdup(ptr noundef %156)
  store ptr %157, ptr %155, align 8
  br label %830

158:                                              ; preds = %102
  %159 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %159, align 8
  %160 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %161 = call ptr @strdup(ptr noundef @.str.15.331)
  store ptr %161, ptr %160, align 8
  br label %830

162:                                              ; preds = %99
  %163 = load i32, ptr %2, align 4
  %164 = call i32 @isdigit(i32 noundef %163) #15
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %343

166:                                              ; preds = %162
  store i32 200, ptr %8, align 4
  %167 = load i32, ptr %8, align 4
  %168 = sext i32 %167 to i64
  %169 = call ptr @malloc(i64 noundef %168) #11
  store ptr %169, ptr %9, align 8
  %170 = load ptr, ptr %9, align 8
  %171 = icmp eq ptr %170, null
  br i1 %171, label %172, label %176

172:                                              ; preds = %166
  %173 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %173, align 8
  %174 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %175 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %175, ptr %174, align 8
  br label %830

176:                                              ; preds = %166
  store i32 0, ptr %10, align 4
  %177 = load i32, ptr %2, align 4
  %178 = trunc i32 %177 to i8
  %179 = load ptr, ptr %9, align 8
  %180 = load i32, ptr %10, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i8, ptr %179, i64 %181
  store i8 %178, ptr %182, align 1
  %183 = load i32, ptr %10, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %185

185:                                              ; preds = %324, %176
  %186 = call i32 @getchar()
  store i32 %186, ptr %2, align 4
  %187 = load i32, ptr %10, align 4
  %188 = load i32, ptr %8, align 4
  %189 = sub nsw i32 %188, 1
  %190 = icmp sge i32 %187, %189
  br i1 %190, label %191, label %207

191:                                              ; preds = %185
  %192 = load i32, ptr %8, align 4
  %193 = mul nsw i32 %192, 2
  store i32 %193, ptr %8, align 4
  %194 = load ptr, ptr %9, align 8
  %195 = load i32, ptr %8, align 4
  %196 = sext i32 %195 to i64
  %197 = call ptr @realloc(ptr noundef %194, i64 noundef %196) #14
  store ptr %197, ptr %13, align 8
  %198 = load ptr, ptr %13, align 8
  %199 = icmp eq ptr %198, null
  br i1 %199, label %200, label %205

200:                                              ; preds = %191
  %201 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %201)
  %202 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %202, align 8
  %203 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %204 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %204, ptr %203, align 8
  br label %830

205:                                              ; preds = %191
  %206 = load ptr, ptr %13, align 8
  store ptr %206, ptr %9, align 8
  br label %207

207:                                              ; preds = %205, %185
  %208 = load i32, ptr %2, align 4
  %209 = call i32 @isdigit(i32 noundef %208) #15
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %220

211:                                              ; preds = %207
  %212 = load i32, ptr %2, align 4
  %213 = trunc i32 %212 to i8
  %214 = load ptr, ptr %9, align 8
  %215 = load i32, ptr %10, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, ptr %214, i64 %216
  store i8 %213, ptr %217, align 1
  %218 = load i32, ptr %10, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, ptr %10, align 4
  br label %324

220:                                              ; preds = %207
  %221 = load i32, ptr %2, align 4
  %222 = icmp eq i32 %221, 46
  br i1 %222, label %223, label %255

223:                                              ; preds = %220
  %224 = load i32, ptr %11, align 4
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %255

226:                                              ; preds = %223
  %227 = load i32, ptr %12, align 4
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %229, label %255

229:                                              ; preds = %226
  store i32 1, ptr %11, align 4
  %230 = load i32, ptr %2, align 4
  %231 = trunc i32 %230 to i8
  %232 = load ptr, ptr %9, align 8
  %233 = load i32, ptr %10, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i8, ptr %232, i64 %234
  store i8 %231, ptr %235, align 1
  %236 = load i32, ptr %10, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, ptr %10, align 4
  %238 = call i32 @getchar()
  store i32 %238, ptr %2, align 4
  %239 = call i32 @isdigit(i32 noundef %238) #15
  %240 = icmp ne i32 %239, 0
  br i1 %240, label %246, label %241

241:                                              ; preds = %229
  %242 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %242)
  %243 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %243, align 8
  %244 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %245 = call ptr @strdup(ptr noundef @.str.17.333)
  store ptr %245, ptr %244, align 8
  br label %830

246:                                              ; preds = %229
  %247 = load i32, ptr %2, align 4
  %248 = trunc i32 %247 to i8
  %249 = load ptr, ptr %9, align 8
  %250 = load i32, ptr %10, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i8, ptr %249, i64 %251
  store i8 %248, ptr %252, align 1
  %253 = load i32, ptr %10, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, ptr %10, align 4
  br label %323

255:                                              ; preds = %226, %223, %220
  %256 = load i32, ptr %2, align 4
  %257 = icmp eq i32 %256, 101
  br i1 %257, label %261, label %258

258:                                              ; preds = %255
  %259 = load i32, ptr %2, align 4
  %260 = icmp eq i32 %259, 69
  br i1 %260, label %261, label %314

261:                                              ; preds = %258, %255
  %262 = load i32, ptr %12, align 4
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %314

264:                                              ; preds = %261
  store i32 1, ptr %12, align 4
  %265 = load i32, ptr %2, align 4
  %266 = trunc i32 %265 to i8
  %267 = load ptr, ptr %9, align 8
  %268 = load i32, ptr %10, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i8, ptr %267, i64 %269
  store i8 %266, ptr %270, align 1
  %271 = load i32, ptr %10, align 4
  %272 = add nsw i32 %271, 1
  store i32 %272, ptr %10, align 4
  %273 = call i32 @getchar()
  store i32 %273, ptr %2, align 4
  %274 = load i32, ptr %2, align 4
  %275 = icmp eq i32 %274, 43
  br i1 %275, label %279, label %276

276:                                              ; preds = %264
  %277 = load i32, ptr %2, align 4
  %278 = icmp eq i32 %277, 45
  br i1 %278, label %279, label %288

279:                                              ; preds = %276, %264
  %280 = load i32, ptr %2, align 4
  %281 = trunc i32 %280 to i8
  %282 = load ptr, ptr %9, align 8
  %283 = load i32, ptr %10, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds i8, ptr %282, i64 %284
  store i8 %281, ptr %285, align 1
  %286 = load i32, ptr %10, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, ptr %10, align 4
  br label %296

288:                                              ; preds = %276
  %289 = load i32, ptr %2, align 4
  %290 = icmp ne i32 %289, -1
  br i1 %290, label %291, label %295

291:                                              ; preds = %288
  %292 = load i32, ptr %2, align 4
  %293 = load ptr, ptr @__stdinp, align 8
  %294 = call i32 @ungetc(i32 noundef %292, ptr noundef %293)
  br label %295

295:                                              ; preds = %291, %288
  br label %296

296:                                              ; preds = %295, %279
  %297 = call i32 @getchar()
  store i32 %297, ptr %2, align 4
  %298 = call i32 @isdigit(i32 noundef %297) #15
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %305, label %300

300:                                              ; preds = %296
  %301 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %301)
  %302 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %302, align 8
  %303 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %304 = call ptr @strdup(ptr noundef @.str.17.333)
  store ptr %304, ptr %303, align 8
  br label %830

305:                                              ; preds = %296
  %306 = load i32, ptr %2, align 4
  %307 = trunc i32 %306 to i8
  %308 = load ptr, ptr %9, align 8
  %309 = load i32, ptr %10, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i8, ptr %308, i64 %310
  store i8 %307, ptr %311, align 1
  %312 = load i32, ptr %10, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, ptr %10, align 4
  br label %322

314:                                              ; preds = %261, %258
  %315 = load i32, ptr %2, align 4
  %316 = icmp ne i32 %315, -1
  br i1 %316, label %317, label %321

317:                                              ; preds = %314
  %318 = load i32, ptr %2, align 4
  %319 = load ptr, ptr @__stdinp, align 8
  %320 = call i32 @ungetc(i32 noundef %318, ptr noundef %319)
  br label %321

321:                                              ; preds = %317, %314
  br label %325

322:                                              ; preds = %305
  br label %323

323:                                              ; preds = %322, %246
  br label %324

324:                                              ; preds = %323, %211
  br label %185

325:                                              ; preds = %321
  %326 = load ptr, ptr %9, align 8
  %327 = load i32, ptr %10, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i8, ptr %326, i64 %328
  store i8 0, ptr %329, align 1
  %330 = load i32, ptr %11, align 4
  %331 = icmp eq i32 %330, 1
  br i1 %331, label %335, label %332

332:                                              ; preds = %325
  %333 = load i32, ptr %12, align 4
  %334 = icmp eq i32 %333, 1
  br i1 %334, label %335, label %339

335:                                              ; preds = %332, %325
  %336 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 4, ptr %336, align 8
  %337 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %338 = load ptr, ptr %9, align 8
  store ptr %338, ptr %337, align 8
  br label %830

339:                                              ; preds = %332
  %340 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 3, ptr %340, align 8
  %341 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %342 = load ptr, ptr %9, align 8
  store ptr %342, ptr %341, align 8
  br label %830

343:                                              ; preds = %162
  %344 = load i32, ptr %2, align 4
  %345 = icmp eq i32 %344, 34
  br i1 %345, label %346, label %487

346:                                              ; preds = %343
  %347 = call i32 @getchar()
  store i32 %347, ptr %14, align 4
  %348 = call i32 @getchar()
  store i32 %348, ptr %15, align 4
  %349 = load i32, ptr %14, align 4
  %350 = icmp eq i32 %349, 34
  br i1 %350, label %351, label %471

351:                                              ; preds = %346
  %352 = load i32, ptr %15, align 4
  %353 = icmp eq i32 %352, 34
  br i1 %353, label %354, label %471

354:                                              ; preds = %351
  store i32 1000, ptr %16, align 4
  %355 = load i32, ptr %16, align 4
  %356 = sext i32 %355 to i64
  %357 = call ptr @malloc(i64 noundef %356) #11
  store ptr %357, ptr %17, align 8
  %358 = load ptr, ptr %17, align 8
  %359 = icmp eq ptr %358, null
  br i1 %359, label %360, label %364

360:                                              ; preds = %354
  %361 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %361, align 8
  %362 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %363 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %363, ptr %362, align 8
  br label %830

364:                                              ; preds = %354
  store i32 0, ptr %18, align 4
  store i32 0, ptr %19, align 4
  store i32 0, ptr %20, align 4
  br label %365

365:                                              ; preds = %374, %364
  %366 = call i32 @getchar()
  store i32 %366, ptr %2, align 4
  %367 = icmp ne i32 %366, -1
  br i1 %367, label %368, label %372

368:                                              ; preds = %365
  %369 = load i32, ptr %2, align 4
  %370 = call i32 @isspace(i32 noundef %369) #15
  %371 = icmp ne i32 %370, 0
  br label %372

372:                                              ; preds = %368, %365
  %373 = phi i1 [ false, %365 ], [ %371, %368 ]
  br i1 %373, label %374, label %375

374:                                              ; preds = %372
  br label %365

375:                                              ; preds = %372
  %376 = load i32, ptr %2, align 4
  %377 = icmp ne i32 %376, -1
  br i1 %377, label %378, label %382

378:                                              ; preds = %375
  %379 = load i32, ptr %2, align 4
  %380 = load ptr, ptr @__stdinp, align 8
  %381 = call i32 @ungetc(i32 noundef %379, ptr noundef %380)
  br label %382

382:                                              ; preds = %378, %375
  br label %383

383:                                              ; preds = %460, %382
  %384 = call i32 @getchar()
  store i32 %384, ptr %2, align 4
  %385 = load i32, ptr %2, align 4
  %386 = icmp eq i32 %385, -1
  br i1 %386, label %387, label %392

387:                                              ; preds = %383
  %388 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %388)
  %389 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %389, align 8
  %390 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %391 = call ptr @strdup(ptr noundef @.str.18.334)
  store ptr %391, ptr %390, align 8
  br label %830

392:                                              ; preds = %383
  %393 = load i32, ptr %19, align 4
  %394 = icmp eq i32 %393, 34
  br i1 %394, label %395, label %439

395:                                              ; preds = %392
  %396 = load i32, ptr %18, align 4
  %397 = icmp eq i32 %396, 34
  br i1 %397, label %398, label %439

398:                                              ; preds = %395
  %399 = load i32, ptr %2, align 4
  %400 = icmp eq i32 %399, 34
  br i1 %400, label %401, label %439

401:                                              ; preds = %398
  br label %402

402:                                              ; preds = %418, %401
  %403 = load i32, ptr %20, align 4
  %404 = sub nsw i32 %403, 3
  %405 = icmp sge i32 %404, 0
  br i1 %405, label %406, label %416

406:                                              ; preds = %402
  %407 = load ptr, ptr %17, align 8
  %408 = load i32, ptr %20, align 4
  %409 = sub nsw i32 %408, 3
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i8, ptr %407, i64 %410
  %412 = load i8, ptr %411, align 1
  %413 = sext i8 %412 to i32
  %414 = call i32 @isspace(i32 noundef %413) #15
  %415 = icmp ne i32 %414, 0
  br label %416

416:                                              ; preds = %406, %402
  %417 = phi i1 [ false, %402 ], [ %415, %406 ]
  br i1 %417, label %418, label %421

418:                                              ; preds = %416
  %419 = load i32, ptr %20, align 4
  %420 = add nsw i32 %419, -1
  store i32 %420, ptr %20, align 4
  br label %402

421:                                              ; preds = %416
  %422 = load i32, ptr %20, align 4
  %423 = icmp slt i32 %422, 2
  br i1 %423, label %424, label %430

424:                                              ; preds = %421
  %425 = load ptr, ptr %17, align 8
  %426 = getelementptr inbounds i8, ptr %425, i64 0
  store i8 0, ptr %426, align 1
  %427 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 2, ptr %427, align 8
  %428 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %429 = load ptr, ptr %17, align 8
  store ptr %429, ptr %428, align 8
  br label %830

430:                                              ; preds = %421
  %431 = load ptr, ptr %17, align 8
  %432 = load i32, ptr %20, align 4
  %433 = sub nsw i32 %432, 2
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds i8, ptr %431, i64 %434
  store i8 0, ptr %435, align 1
  %436 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 2, ptr %436, align 8
  %437 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %438 = load ptr, ptr %17, align 8
  store ptr %438, ptr %437, align 8
  br label %830

439:                                              ; preds = %398, %395, %392
  %440 = load i32, ptr %20, align 4
  %441 = load i32, ptr %16, align 4
  %442 = sub nsw i32 %441, 1
  %443 = icmp sge i32 %440, %442
  br i1 %443, label %444, label %460

444:                                              ; preds = %439
  %445 = load i32, ptr %16, align 4
  %446 = mul nsw i32 %445, 2
  store i32 %446, ptr %16, align 4
  %447 = load ptr, ptr %17, align 8
  %448 = load i32, ptr %16, align 4
  %449 = sext i32 %448 to i64
  %450 = call ptr @realloc(ptr noundef %447, i64 noundef %449) #14
  store ptr %450, ptr %21, align 8
  %451 = load ptr, ptr %21, align 8
  %452 = icmp eq ptr %451, null
  br i1 %452, label %453, label %458

453:                                              ; preds = %444
  %454 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %454)
  %455 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %455, align 8
  %456 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %457 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %457, ptr %456, align 8
  br label %830

458:                                              ; preds = %444
  %459 = load ptr, ptr %21, align 8
  store ptr %459, ptr %17, align 8
  br label %460

460:                                              ; preds = %458, %439
  %461 = load i32, ptr %2, align 4
  %462 = trunc i32 %461 to i8
  %463 = load ptr, ptr %17, align 8
  %464 = load i32, ptr %20, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds i8, ptr %463, i64 %465
  store i8 %462, ptr %466, align 1
  %467 = load i32, ptr %20, align 4
  %468 = add nsw i32 %467, 1
  store i32 %468, ptr %20, align 4
  %469 = load i32, ptr %18, align 4
  store i32 %469, ptr %19, align 4
  %470 = load i32, ptr %2, align 4
  store i32 %470, ptr %18, align 4
  br label %383

471:                                              ; preds = %351, %346
  %472 = load i32, ptr %15, align 4
  %473 = icmp ne i32 %472, -1
  br i1 %473, label %474, label %478

474:                                              ; preds = %471
  %475 = load i32, ptr %15, align 4
  %476 = load ptr, ptr @__stdinp, align 8
  %477 = call i32 @ungetc(i32 noundef %475, ptr noundef %476)
  br label %478

478:                                              ; preds = %474, %471
  %479 = load i32, ptr %14, align 4
  %480 = icmp ne i32 %479, -1
  br i1 %480, label %481, label %485

481:                                              ; preds = %478
  %482 = load i32, ptr %14, align 4
  %483 = load ptr, ptr @__stdinp, align 8
  %484 = call i32 @ungetc(i32 noundef %482, ptr noundef %483)
  br label %485

485:                                              ; preds = %481, %478
  br label %486

486:                                              ; preds = %485
  br label %487

487:                                              ; preds = %486, %343
  %488 = load i32, ptr %2, align 4
  %489 = icmp eq i32 %488, 34
  br i1 %489, label %490, label %630

490:                                              ; preds = %487
  store i32 200, ptr %22, align 4
  %491 = load i32, ptr %22, align 4
  %492 = sext i32 %491 to i64
  %493 = call ptr @malloc(i64 noundef %492) #11
  store ptr %493, ptr %23, align 8
  %494 = load ptr, ptr %23, align 8
  %495 = icmp eq ptr %494, null
  br i1 %495, label %496, label %500

496:                                              ; preds = %490
  %497 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %497, align 8
  %498 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %499 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %499, ptr %498, align 8
  br label %830

500:                                              ; preds = %490
  store i32 0, ptr %24, align 4
  br label %501

501:                                              ; preds = %627, %500
  %502 = call i32 @getchar()
  store i32 %502, ptr %2, align 4
  %503 = load i32, ptr %2, align 4
  %504 = icmp eq i32 %503, -1
  br i1 %504, label %505, label %510

505:                                              ; preds = %501
  %506 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %506)
  %507 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %507, align 8
  %508 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %509 = call ptr @strdup(ptr noundef @.str.19.335)
  store ptr %509, ptr %508, align 8
  br label %830

510:                                              ; preds = %501
  %511 = load i32, ptr %2, align 4
  %512 = icmp eq i32 %511, 10
  br i1 %512, label %513, label %518

513:                                              ; preds = %510
  %514 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %514)
  %515 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %515, align 8
  %516 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %517 = call ptr @strdup(ptr noundef @.str.20.336)
  store ptr %517, ptr %516, align 8
  br label %830

518:                                              ; preds = %510
  %519 = load i32, ptr %24, align 4
  %520 = load i32, ptr %22, align 4
  %521 = sub nsw i32 %520, 1
  %522 = icmp sge i32 %519, %521
  br i1 %522, label %523, label %539

523:                                              ; preds = %518
  %524 = load i32, ptr %22, align 4
  %525 = mul nsw i32 %524, 2
  store i32 %525, ptr %22, align 4
  %526 = load ptr, ptr %23, align 8
  %527 = load i32, ptr %22, align 4
  %528 = sext i32 %527 to i64
  %529 = call ptr @realloc(ptr noundef %526, i64 noundef %528) #14
  store ptr %529, ptr %25, align 8
  %530 = load ptr, ptr %25, align 8
  %531 = icmp eq ptr %530, null
  br i1 %531, label %532, label %537

532:                                              ; preds = %523
  %533 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %533)
  %534 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %534, align 8
  %535 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %536 = call ptr @strdup(ptr noundef @.str.16.332)
  store ptr %536, ptr %535, align 8
  br label %830

537:                                              ; preds = %523
  %538 = load ptr, ptr %25, align 8
  store ptr %538, ptr %23, align 8
  br label %539

539:                                              ; preds = %537, %518
  %540 = load i32, ptr %2, align 4
  %541 = icmp eq i32 %540, 34
  br i1 %541, label %542, label %550

542:                                              ; preds = %539
  %543 = load ptr, ptr %23, align 8
  %544 = load i32, ptr %24, align 4
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds i8, ptr %543, i64 %545
  store i8 0, ptr %546, align 1
  %547 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 2, ptr %547, align 8
  %548 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %549 = load ptr, ptr %23, align 8
  store ptr %549, ptr %548, align 8
  br label %830

550:                                              ; preds = %539
  %551 = load i32, ptr %2, align 4
  %552 = icmp eq i32 %551, 92
  br i1 %552, label %553, label %620

553:                                              ; preds = %550
  %554 = call i32 @getchar()
  store i32 %554, ptr %2, align 4
  %555 = load i32, ptr %2, align 4
  switch i32 %555, label %614 [
    i32 34, label %556
    i32 110, label %561
    i32 114, label %566
    i32 116, label %571
    i32 92, label %576
    i32 120, label %581
  ]

556:                                              ; preds = %553
  %557 = load ptr, ptr %23, align 8
  %558 = load i32, ptr %24, align 4
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i8, ptr %557, i64 %559
  store i8 34, ptr %560, align 1
  br label %619

561:                                              ; preds = %553
  %562 = load ptr, ptr %23, align 8
  %563 = load i32, ptr %24, align 4
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds i8, ptr %562, i64 %564
  store i8 10, ptr %565, align 1
  br label %619

566:                                              ; preds = %553
  %567 = load ptr, ptr %23, align 8
  %568 = load i32, ptr %24, align 4
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds i8, ptr %567, i64 %569
  store i8 13, ptr %570, align 1
  br label %619

571:                                              ; preds = %553
  %572 = load ptr, ptr %23, align 8
  %573 = load i32, ptr %24, align 4
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds i8, ptr %572, i64 %574
  store i8 9, ptr %575, align 1
  br label %619

576:                                              ; preds = %553
  %577 = load ptr, ptr %23, align 8
  %578 = load i32, ptr %24, align 4
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds i8, ptr %577, i64 %579
  store i8 92, ptr %580, align 1
  br label %619

581:                                              ; preds = %553
  call void @llvm.memset.p0.i64(ptr align 1 %26, i8 0, i64 3, i1 false)
  %582 = call i32 @getchar()
  %583 = trunc i32 %582 to i8
  %584 = getelementptr inbounds [3 x i8], ptr %26, i64 0, i64 0
  store i8 %583, ptr %584, align 1
  %585 = call i32 @getchar()
  %586 = trunc i32 %585 to i8
  %587 = getelementptr inbounds [3 x i8], ptr %26, i64 0, i64 1
  store i8 %586, ptr %587, align 1
  %588 = getelementptr inbounds [3 x i8], ptr %26, i64 0, i64 0
  %589 = load i8, ptr %588, align 1
  %590 = sext i8 %589 to i32
  %591 = call i32 @isxdigit(i32 noundef %590) #15
  %592 = icmp ne i32 %591, 0
  br i1 %592, label %593, label %599

593:                                              ; preds = %581
  %594 = getelementptr inbounds [3 x i8], ptr %26, i64 0, i64 1
  %595 = load i8, ptr %594, align 1
  %596 = sext i8 %595 to i32
  %597 = call i32 @isxdigit(i32 noundef %596) #15
  %598 = icmp ne i32 %597, 0
  br i1 %598, label %604, label %599

599:                                              ; preds = %593, %581
  %600 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %600)
  %601 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %601, align 8
  %602 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %603 = call ptr @strdup(ptr noundef @.str.21.337)
  store ptr %603, ptr %602, align 8
  br label %830

604:                                              ; preds = %593
  %605 = getelementptr inbounds [3 x i8], ptr %26, i64 0, i64 0
  %606 = call i64 @strtol(ptr noundef %605, ptr noundef null, i32 noundef 16)
  %607 = trunc i64 %606 to i32
  store i32 %607, ptr %27, align 4
  %608 = load i32, ptr %27, align 4
  %609 = trunc i32 %608 to i8
  %610 = load ptr, ptr %23, align 8
  %611 = load i32, ptr %24, align 4
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds i8, ptr %610, i64 %612
  store i8 %609, ptr %613, align 1
  br label %619

614:                                              ; preds = %553
  %615 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %615)
  %616 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %616, align 8
  %617 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %618 = call ptr @strdup(ptr noundef @.str.22.338)
  store ptr %618, ptr %617, align 8
  br label %830

619:                                              ; preds = %604, %576, %571, %566, %561, %556
  br label %627

620:                                              ; preds = %550
  %621 = load i32, ptr %2, align 4
  %622 = trunc i32 %621 to i8
  %623 = load ptr, ptr %23, align 8
  %624 = load i32, ptr %24, align 4
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds i8, ptr %623, i64 %625
  store i8 %622, ptr %626, align 1
  br label %627

627:                                              ; preds = %620, %619
  %628 = load i32, ptr %24, align 4
  %629 = add nsw i32 %628, 1
  store i32 %629, ptr %24, align 4
  br label %501

630:                                              ; preds = %487
  %631 = load i32, ptr %2, align 4
  %632 = icmp eq i32 %631, 47
  br i1 %632, label %633, label %708

633:                                              ; preds = %630
  %634 = call i32 @getchar()
  store i32 %634, ptr %2, align 4
  %635 = load i32, ptr %2, align 4
  %636 = icmp eq i32 %635, 47
  br i1 %636, label %637, label %658

637:                                              ; preds = %633
  br label %638

638:                                              ; preds = %646, %637
  %639 = call i32 @getchar()
  store i32 %639, ptr %2, align 4
  %640 = icmp ne i32 %639, 10
  br i1 %640, label %641, label %644

641:                                              ; preds = %638
  %642 = load i32, ptr %2, align 4
  %643 = icmp ne i32 %642, -1
  br label %644

644:                                              ; preds = %641, %638
  %645 = phi i1 [ false, %638 ], [ %643, %641 ]
  br i1 %645, label %646, label %647

646:                                              ; preds = %644
  br label %638

647:                                              ; preds = %644
  %648 = load i32, ptr %2, align 4
  %649 = icmp ne i32 %648, -1
  br i1 %649, label %650, label %654

650:                                              ; preds = %647
  %651 = load i32, ptr %2, align 4
  %652 = load ptr, ptr @__stdinp, align 8
  %653 = call i32 @ungetc(i32 noundef %651, ptr noundef %652)
  br label %654

654:                                              ; preds = %650, %647
  %655 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 37, ptr %655, align 8
  %656 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %657 = call ptr @strdup(ptr noundef @.str.23.339)
  store ptr %657, ptr %656, align 8
  br label %830

658:                                              ; preds = %633
  %659 = load i32, ptr %2, align 4
  %660 = icmp eq i32 %659, 42
  br i1 %660, label %661, label %698

661:                                              ; preds = %658
  store i32 1, ptr %28, align 4
  br label %662

662:                                              ; preds = %693, %661
  %663 = load i32, ptr %28, align 4
  %664 = icmp sgt i32 %663, 0
  br i1 %664, label %665, label %694

665:                                              ; preds = %662
  %666 = load i32, ptr %2, align 4
  store i32 %666, ptr %29, align 4
  %667 = call i32 @getchar()
  store i32 %667, ptr %2, align 4
  %668 = load i32, ptr %2, align 4
  %669 = icmp eq i32 %668, -1
  br i1 %669, label %670, label %674

670:                                              ; preds = %665
  %671 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %671, align 8
  %672 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %673 = call ptr @strdup(ptr noundef @.str.24.340)
  store ptr %673, ptr %672, align 8
  br label %830

674:                                              ; preds = %665
  %675 = load i32, ptr %29, align 4
  %676 = icmp eq i32 %675, 47
  br i1 %676, label %677, label %683

677:                                              ; preds = %674
  %678 = load i32, ptr %2, align 4
  %679 = icmp eq i32 %678, 42
  br i1 %679, label %680, label %683

680:                                              ; preds = %677
  %681 = load i32, ptr %28, align 4
  %682 = add nsw i32 %681, 1
  store i32 %682, ptr %28, align 4
  br label %693

683:                                              ; preds = %677, %674
  %684 = load i32, ptr %29, align 4
  %685 = icmp eq i32 %684, 42
  br i1 %685, label %686, label %692

686:                                              ; preds = %683
  %687 = load i32, ptr %2, align 4
  %688 = icmp eq i32 %687, 47
  br i1 %688, label %689, label %692

689:                                              ; preds = %686
  %690 = load i32, ptr %28, align 4
  %691 = add nsw i32 %690, -1
  store i32 %691, ptr %28, align 4
  br label %692

692:                                              ; preds = %689, %686, %683
  br label %693

693:                                              ; preds = %692, %680
  br label %662

694:                                              ; preds = %662
  %695 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 37, ptr %695, align 8
  %696 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %697 = call ptr @strdup(ptr noundef @.str.25.341)
  store ptr %697, ptr %696, align 8
  br label %830

698:                                              ; preds = %658
  %699 = load i32, ptr %2, align 4
  %700 = icmp ne i32 %699, -1
  br i1 %700, label %701, label %705

701:                                              ; preds = %698
  %702 = load i32, ptr %2, align 4
  %703 = load ptr, ptr @__stdinp, align 8
  %704 = call i32 @ungetc(i32 noundef %702, ptr noundef %703)
  br label %705

705:                                              ; preds = %701, %698
  store i32 47, ptr %2, align 4
  br label %706

706:                                              ; preds = %705
  br label %707

707:                                              ; preds = %706
  br label %708

708:                                              ; preds = %707, %630
  %709 = load i32, ptr %2, align 4
  switch i32 %709, label %826 [
    i32 43, label %710
    i32 45, label %714
    i32 42, label %718
    i32 47, label %722
    i32 40, label %726
    i32 41, label %730
    i32 123, label %734
    i32 125, label %738
    i32 44, label %742
    i32 46, label %746
    i32 10, label %750
    i32 61, label %754
    i32 33, label %772
    i32 62, label %790
    i32 60, label %808
  ]

710:                                              ; preds = %708
  %711 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 20, ptr %711, align 8
  %712 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %713 = call ptr @strdup(ptr noundef @.str.26.342)
  store ptr %713, ptr %712, align 8
  br label %830

714:                                              ; preds = %708
  %715 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 21, ptr %715, align 8
  %716 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %717 = call ptr @strdup(ptr noundef @.str.27.343)
  store ptr %717, ptr %716, align 8
  br label %830

718:                                              ; preds = %708
  %719 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 22, ptr %719, align 8
  %720 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %721 = call ptr @strdup(ptr noundef @.str.28.344)
  store ptr %721, ptr %720, align 8
  br label %830

722:                                              ; preds = %708
  %723 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 23, ptr %723, align 8
  %724 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %725 = call ptr @strdup(ptr noundef @.str.29.345)
  store ptr %725, ptr %724, align 8
  br label %830

726:                                              ; preds = %708
  %727 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 31, ptr %727, align 8
  %728 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %729 = call ptr @strdup(ptr noundef @.str.30.346)
  store ptr %729, ptr %728, align 8
  br label %830

730:                                              ; preds = %708
  %731 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 32, ptr %731, align 8
  %732 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %733 = call ptr @strdup(ptr noundef @.str.31.347)
  store ptr %733, ptr %732, align 8
  br label %830

734:                                              ; preds = %708
  %735 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 33, ptr %735, align 8
  %736 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %737 = call ptr @strdup(ptr noundef @.str.32.348)
  store ptr %737, ptr %736, align 8
  br label %830

738:                                              ; preds = %708
  %739 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 34, ptr %739, align 8
  %740 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %741 = call ptr @strdup(ptr noundef @.str.33.349)
  store ptr %741, ptr %740, align 8
  br label %830

742:                                              ; preds = %708
  %743 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 35, ptr %743, align 8
  %744 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %745 = call ptr @strdup(ptr noundef @.str.34.350)
  store ptr %745, ptr %744, align 8
  br label %830

746:                                              ; preds = %708
  %747 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 36, ptr %747, align 8
  %748 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %749 = call ptr @strdup(ptr noundef @.str.35.351)
  store ptr %749, ptr %748, align 8
  br label %830

750:                                              ; preds = %708
  %751 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 37, ptr %751, align 8
  %752 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %753 = call ptr @strdup(ptr noundef @.str.23.339)
  store ptr %753, ptr %752, align 8
  br label %830

754:                                              ; preds = %708
  %755 = call i32 @getchar()
  store i32 %755, ptr %2, align 4
  %756 = icmp eq i32 %755, 61
  br i1 %756, label %757, label %761

757:                                              ; preds = %754
  %758 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 25, ptr %758, align 8
  %759 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %760 = call ptr @strdup(ptr noundef @.str.36.352)
  store ptr %760, ptr %759, align 8
  br label %830

761:                                              ; preds = %754
  %762 = load i32, ptr %2, align 4
  %763 = icmp ne i32 %762, -1
  br i1 %763, label %764, label %768

764:                                              ; preds = %761
  %765 = load i32, ptr %2, align 4
  %766 = load ptr, ptr @__stdinp, align 8
  %767 = call i32 @ungetc(i32 noundef %765, ptr noundef %766)
  br label %768

768:                                              ; preds = %764, %761
  %769 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 24, ptr %769, align 8
  %770 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %771 = call ptr @strdup(ptr noundef @.str.37.353)
  store ptr %771, ptr %770, align 8
  br label %830

772:                                              ; preds = %708
  %773 = call i32 @getchar()
  store i32 %773, ptr %2, align 4
  %774 = icmp eq i32 %773, 61
  br i1 %774, label %775, label %779

775:                                              ; preds = %772
  %776 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 26, ptr %776, align 8
  %777 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %778 = call ptr @strdup(ptr noundef @.str.38.354)
  store ptr %778, ptr %777, align 8
  br label %830

779:                                              ; preds = %772
  %780 = load i32, ptr %2, align 4
  %781 = icmp ne i32 %780, -1
  br i1 %781, label %782, label %786

782:                                              ; preds = %779
  %783 = load i32, ptr %2, align 4
  %784 = load ptr, ptr @__stdinp, align 8
  %785 = call i32 @ungetc(i32 noundef %783, ptr noundef %784)
  br label %786

786:                                              ; preds = %782, %779
  %787 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %787, align 8
  %788 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %789 = call ptr @strdup(ptr noundef @.str.39.355)
  store ptr %789, ptr %788, align 8
  br label %830

790:                                              ; preds = %708
  %791 = call i32 @getchar()
  store i32 %791, ptr %2, align 4
  %792 = icmp eq i32 %791, 61
  br i1 %792, label %793, label %797

793:                                              ; preds = %790
  %794 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 30, ptr %794, align 8
  %795 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %796 = call ptr @strdup(ptr noundef @.str.40.356)
  store ptr %796, ptr %795, align 8
  br label %830

797:                                              ; preds = %790
  %798 = load i32, ptr %2, align 4
  %799 = icmp ne i32 %798, -1
  br i1 %799, label %800, label %804

800:                                              ; preds = %797
  %801 = load i32, ptr %2, align 4
  %802 = load ptr, ptr @__stdinp, align 8
  %803 = call i32 @ungetc(i32 noundef %801, ptr noundef %802)
  br label %804

804:                                              ; preds = %800, %797
  %805 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 28, ptr %805, align 8
  %806 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %807 = call ptr @strdup(ptr noundef @.str.41.357)
  store ptr %807, ptr %806, align 8
  br label %830

808:                                              ; preds = %708
  %809 = call i32 @getchar()
  store i32 %809, ptr %2, align 4
  %810 = icmp eq i32 %809, 61
  br i1 %810, label %811, label %815

811:                                              ; preds = %808
  %812 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 29, ptr %812, align 8
  %813 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %814 = call ptr @strdup(ptr noundef @.str.42.358)
  store ptr %814, ptr %813, align 8
  br label %830

815:                                              ; preds = %808
  %816 = load i32, ptr %2, align 4
  %817 = icmp ne i32 %816, -1
  br i1 %817, label %818, label %822

818:                                              ; preds = %815
  %819 = load i32, ptr %2, align 4
  %820 = load ptr, ptr @__stdinp, align 8
  %821 = call i32 @ungetc(i32 noundef %819, ptr noundef %820)
  br label %822

822:                                              ; preds = %818, %815
  %823 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 27, ptr %823, align 8
  %824 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %825 = call ptr @strdup(ptr noundef @.str.43.359)
  store ptr %825, ptr %824, align 8
  br label %830

826:                                              ; preds = %708
  %827 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 0
  store i32 40, ptr %827, align 8
  %828 = getelementptr inbounds %struct.Token, ptr %1, i32 0, i32 1
  %829 = call ptr @strdup(ptr noundef @.str.44.360)
  store ptr %829, ptr %828, align 8
  br label %830

830:                                              ; preds = %826, %822, %811, %804, %793, %786, %775, %768, %757, %750, %746, %742, %738, %734, %730, %726, %722, %718, %714, %710, %694, %670, %654, %614, %599, %542, %532, %513, %505, %496, %453, %430, %424, %387, %360, %339, %335, %300, %241, %200, %172, %158, %153, %91, %44
  %831 = load [2 x i64], ptr %1, align 8
  ret [2 x i64] %831
}

declare i32 @getchar() #5

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isspace(i32 noundef) #9

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isalpha(i32 noundef) #9

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isdigit(i32 noundef) #9

declare i32 @ungetc(i32 noundef, ptr noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #10

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isxdigit(i32 noundef) #9

declare i64 @strtol(ptr noundef, ptr noundef, i32 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @check_expression_types(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %8, 20
  br i1 %9, label %10, label %48

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %46, label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %5, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, ptr %6, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %46, label %22

22:                                               ; preds = %19, %16
  %23 = load i32, ptr %5, align 4
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load i32, ptr %6, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %46, label %28

28:                                               ; preds = %25, %22
  %29 = load i32, ptr %5, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %28
  %32 = load i32, ptr %6, align 4
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %46, label %34

34:                                               ; preds = %31, %28
  %35 = load i32, ptr %5, align 4
  %36 = icmp eq i32 %35, 5
  br i1 %36, label %46, label %37

37:                                               ; preds = %34
  %38 = load i32, ptr %6, align 4
  %39 = icmp eq i32 %38, 5
  br i1 %39, label %46, label %40

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %46, label %43

43:                                               ; preds = %40
  %44 = load i32, ptr %6, align 4
  %45 = icmp eq i32 %44, 2
  br i1 %45, label %46, label %47

46:                                               ; preds = %43, %40, %37, %34, %31, %25, %19, %13
  store i32 0, ptr %4, align 4
  br label %151

47:                                               ; preds = %43
  store i32 6, ptr %4, align 4
  br label %151

48:                                               ; preds = %3
  %49 = load i32, ptr %7, align 4
  %50 = icmp eq i32 %49, 22
  br i1 %50, label %51, label %79

51:                                               ; preds = %48
  %52 = load i32, ptr %5, align 4
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %54, label %58

54:                                               ; preds = %51
  %55 = load i32, ptr %6, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  store i32 0, ptr %4, align 4
  br label %151

58:                                               ; preds = %54, %51
  %59 = load i32, ptr %5, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %65

61:                                               ; preds = %58
  %62 = load i32, ptr %6, align 4
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  store i32 0, ptr %4, align 4
  br label %151

65:                                               ; preds = %61, %58
  %66 = load i32, ptr %5, align 4
  %67 = icmp eq i32 %66, 5
  br i1 %67, label %77, label %68

68:                                               ; preds = %65
  %69 = load i32, ptr %6, align 4
  %70 = icmp eq i32 %69, 5
  br i1 %70, label %77, label %71

71:                                               ; preds = %68
  %72 = load i32, ptr %5, align 4
  %73 = icmp eq i32 %72, 2
  br i1 %73, label %77, label %74

74:                                               ; preds = %71
  %75 = load i32, ptr %6, align 4
  %76 = icmp eq i32 %75, 2
  br i1 %76, label %77, label %78

77:                                               ; preds = %74, %71, %68, %65
  store i32 0, ptr %4, align 4
  br label %151

78:                                               ; preds = %74
  store i32 6, ptr %4, align 4
  br label %151

79:                                               ; preds = %48
  %80 = load i32, ptr %7, align 4
  %81 = icmp eq i32 %80, 21
  br i1 %81, label %85, label %82

82:                                               ; preds = %79
  %83 = load i32, ptr %7, align 4
  %84 = icmp eq i32 %83, 23
  br i1 %84, label %85, label %106

85:                                               ; preds = %82, %79
  %86 = load i32, ptr %5, align 4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %92

88:                                               ; preds = %85
  %89 = load i32, ptr %6, align 4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %92

91:                                               ; preds = %88
  store i32 0, ptr %4, align 4
  br label %151

92:                                               ; preds = %88, %85
  %93 = load i32, ptr %5, align 4
  %94 = icmp eq i32 %93, 5
  br i1 %94, label %104, label %95

95:                                               ; preds = %92
  %96 = load i32, ptr %6, align 4
  %97 = icmp eq i32 %96, 5
  br i1 %97, label %104, label %98

98:                                               ; preds = %95
  %99 = load i32, ptr %5, align 4
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %104, label %101

101:                                              ; preds = %98
  %102 = load i32, ptr %6, align 4
  %103 = icmp eq i32 %102, 2
  br i1 %103, label %104, label %105

104:                                              ; preds = %101, %98, %95, %92
  store i32 0, ptr %4, align 4
  br label %151

105:                                              ; preds = %101
  store i32 6, ptr %4, align 4
  br label %151

106:                                              ; preds = %82
  %107 = load i32, ptr %7, align 4
  %108 = icmp eq i32 %107, 27
  br i1 %108, label %118, label %109

109:                                              ; preds = %106
  %110 = load i32, ptr %7, align 4
  %111 = icmp eq i32 %110, 28
  br i1 %111, label %118, label %112

112:                                              ; preds = %109
  %113 = load i32, ptr %7, align 4
  %114 = icmp eq i32 %113, 29
  br i1 %114, label %118, label %115

115:                                              ; preds = %112
  %116 = load i32, ptr %7, align 4
  %117 = icmp eq i32 %116, 30
  br i1 %117, label %118, label %139

118:                                              ; preds = %115, %112, %109, %106
  %119 = load i32, ptr %5, align 4
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %121, label %125

121:                                              ; preds = %118
  %122 = load i32, ptr %6, align 4
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %125

124:                                              ; preds = %121
  store i32 0, ptr %4, align 4
  br label %151

125:                                              ; preds = %121, %118
  %126 = load i32, ptr %5, align 4
  %127 = icmp eq i32 %126, 5
  br i1 %127, label %137, label %128

128:                                              ; preds = %125
  %129 = load i32, ptr %6, align 4
  %130 = icmp eq i32 %129, 5
  br i1 %130, label %137, label %131

131:                                              ; preds = %128
  %132 = load i32, ptr %5, align 4
  %133 = icmp eq i32 %132, 2
  br i1 %133, label %137, label %134

134:                                              ; preds = %131
  %135 = load i32, ptr %6, align 4
  %136 = icmp eq i32 %135, 2
  br i1 %136, label %137, label %138

137:                                              ; preds = %134, %131, %128, %125
  store i32 0, ptr %4, align 4
  br label %151

138:                                              ; preds = %134
  store i32 6, ptr %4, align 4
  br label %151

139:                                              ; preds = %115
  %140 = load i32, ptr %7, align 4
  %141 = icmp eq i32 %140, 25
  br i1 %141, label %145, label %142

142:                                              ; preds = %139
  %143 = load i32, ptr %7, align 4
  %144 = icmp eq i32 %143, 26
  br i1 %144, label %145, label %146

145:                                              ; preds = %142, %139
  store i32 0, ptr %4, align 4
  br label %151

146:                                              ; preds = %142
  %147 = load i32, ptr %7, align 4
  %148 = icmp eq i32 %147, 9
  br i1 %148, label %149, label %150

149:                                              ; preds = %146
  store i32 0, ptr %4, align 4
  br label %151

150:                                              ; preds = %146
  store i32 10, ptr %4, align 4
  br label %151

151:                                              ; preds = %150, %149, %145, %138, %137, %124, %105, %104, %91, %78, %77, %64, %57, %47, %46
  %152 = load i32, ptr %4, align 4
  ret i32 %152
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @validate_function_call(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 3, ptr %3, align 4
  br label %28

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.symbol_info, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %20

14:                                               ; preds = %9
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.symbol_info, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 6
  br i1 %18, label %19, label %20

19:                                               ; preds = %14
  store i32 3, ptr %3, align 4
  br label %28

20:                                               ; preds = %14, %9
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.symbol_info, ptr %21, i32 0, i32 6
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp ne i32 %23, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %20
  store i32 5, ptr %3, align 4
  br label %28

27:                                               ; preds = %20
  store i32 0, ptr %3, align 4
  br label %28

28:                                               ; preds = %27, %26, %19, %8
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @check_variable_init(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 3, ptr %2, align 4
  br label %19

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.symbol_info, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.symbol_info, ptr %13, i32 0, i32 3
  %15 = load i8, ptr %14, align 8
  %16 = trunc i8 %15 to i1
  br i1 %16, label %18, label %17

17:                                               ; preds = %12
  store i32 3, ptr %2, align 4
  br label %19

18:                                               ; preds = %12, %7
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %6
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @validate_builtin_function(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  store i32 3, ptr %4, align 4
  br label %171

11:                                               ; preds = %3
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef @.str.367) #13
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.1.368) #13
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %15, %11
  %20 = load i32, ptr %6, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 5, ptr %4, align 4
  br label %171

23:                                               ; preds = %19
  store i32 0, ptr %4, align 4
  br label %171

24:                                               ; preds = %15
  %25 = load ptr, ptr %5, align 8
  %26 = call i32 @strcmp(ptr noundef %25, ptr noundef @.str.2.369) #13
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %33

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4
  %30 = icmp ne i32 %29, 1
  br i1 %30, label %31, label %32

31:                                               ; preds = %28
  store i32 5, ptr %4, align 4
  br label %171

32:                                               ; preds = %28
  store i32 0, ptr %4, align 4
  br label %171

33:                                               ; preds = %24
  %34 = load ptr, ptr %5, align 8
  %35 = call i32 @strcmp(ptr noundef %34, ptr noundef @.str.3.370) #13
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %51

37:                                               ; preds = %33
  %38 = load i32, ptr %6, align 4
  %39 = icmp ne i32 %38, 1
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  store i32 5, ptr %4, align 4
  br label %171

41:                                               ; preds = %37
  %42 = load ptr, ptr %7, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %50

44:                                               ; preds = %41
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds i32, ptr %45, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %44
  store i32 5, ptr %4, align 4
  br label %171

50:                                               ; preds = %44, %41
  store i32 0, ptr %4, align 4
  br label %171

51:                                               ; preds = %33
  %52 = load ptr, ptr %5, align 8
  %53 = call i32 @strcmp(ptr noundef %52, ptr noundef @.str.4.371) #13
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %60

55:                                               ; preds = %51
  %56 = load i32, ptr %6, align 4
  %57 = icmp ne i32 %56, 1
  br i1 %57, label %58, label %59

58:                                               ; preds = %55
  store i32 5, ptr %4, align 4
  br label %171

59:                                               ; preds = %55
  store i32 0, ptr %4, align 4
  br label %171

60:                                               ; preds = %51
  %61 = load ptr, ptr %5, align 8
  %62 = call i32 @strcmp(ptr noundef %61, ptr noundef @.str.5.372) #13
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %78

64:                                               ; preds = %60
  %65 = load i32, ptr %6, align 4
  %66 = icmp ne i32 %65, 1
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  store i32 5, ptr %4, align 4
  br label %171

68:                                               ; preds = %64
  %69 = load ptr, ptr %7, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %77

71:                                               ; preds = %68
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds i32, ptr %72, i64 0
  %74 = load i32, ptr %73, align 4
  %75 = icmp ne i32 %74, 1
  br i1 %75, label %76, label %77

76:                                               ; preds = %71
  store i32 5, ptr %4, align 4
  br label %171

77:                                               ; preds = %71, %68
  store i32 0, ptr %4, align 4
  br label %171

78:                                               ; preds = %60
  %79 = load ptr, ptr %5, align 8
  %80 = call i32 @strcmp(ptr noundef %79, ptr noundef @.str.6.373) #13
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %106

82:                                               ; preds = %78
  %83 = load i32, ptr %6, align 4
  %84 = icmp ne i32 %83, 3
  br i1 %84, label %85, label %86

85:                                               ; preds = %82
  store i32 5, ptr %4, align 4
  br label %171

86:                                               ; preds = %82
  %87 = load ptr, ptr %7, align 8
  %88 = icmp ne ptr %87, null
  br i1 %88, label %89, label %105

89:                                               ; preds = %86
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds i32, ptr %90, i64 0
  %92 = load i32, ptr %91, align 4
  %93 = icmp ne i32 %92, 1
  br i1 %93, label %104, label %94

94:                                               ; preds = %89
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds i32, ptr %95, i64 1
  %97 = load i32, ptr %96, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %104, label %99

99:                                               ; preds = %94
  %100 = load ptr, ptr %7, align 8
  %101 = getelementptr inbounds i32, ptr %100, i64 2
  %102 = load i32, ptr %101, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %105

104:                                              ; preds = %99, %94, %89
  store i32 5, ptr %4, align 4
  br label %171

105:                                              ; preds = %99, %86
  store i32 0, ptr %4, align 4
  br label %171

106:                                              ; preds = %78
  %107 = load ptr, ptr %5, align 8
  %108 = call i32 @strcmp(ptr noundef %107, ptr noundef @.str.7.374) #13
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %129

110:                                              ; preds = %106
  %111 = load i32, ptr %6, align 4
  %112 = icmp ne i32 %111, 2
  br i1 %112, label %113, label %114

113:                                              ; preds = %110
  store i32 5, ptr %4, align 4
  br label %171

114:                                              ; preds = %110
  %115 = load ptr, ptr %7, align 8
  %116 = icmp ne ptr %115, null
  br i1 %116, label %117, label %128

117:                                              ; preds = %114
  %118 = load ptr, ptr %7, align 8
  %119 = getelementptr inbounds i32, ptr %118, i64 0
  %120 = load i32, ptr %119, align 4
  %121 = icmp ne i32 %120, 1
  br i1 %121, label %127, label %122

122:                                              ; preds = %117
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds i32, ptr %123, i64 1
  %125 = load i32, ptr %124, align 4
  %126 = icmp ne i32 %125, 1
  br i1 %126, label %127, label %128

127:                                              ; preds = %122, %117
  store i32 5, ptr %4, align 4
  br label %171

128:                                              ; preds = %122, %114
  store i32 0, ptr %4, align 4
  br label %171

129:                                              ; preds = %106
  %130 = load ptr, ptr %5, align 8
  %131 = call i32 @strcmp(ptr noundef %130, ptr noundef @.str.8.375) #13
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %152

133:                                              ; preds = %129
  %134 = load i32, ptr %6, align 4
  %135 = icmp ne i32 %134, 2
  br i1 %135, label %136, label %137

136:                                              ; preds = %133
  store i32 5, ptr %4, align 4
  br label %171

137:                                              ; preds = %133
  %138 = load ptr, ptr %7, align 8
  %139 = icmp ne ptr %138, null
  br i1 %139, label %140, label %151

140:                                              ; preds = %137
  %141 = load ptr, ptr %7, align 8
  %142 = getelementptr inbounds i32, ptr %141, i64 0
  %143 = load i32, ptr %142, align 4
  %144 = icmp ne i32 %143, 1
  br i1 %144, label %150, label %145

145:                                              ; preds = %140
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds i32, ptr %146, i64 1
  %148 = load i32, ptr %147, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %151

150:                                              ; preds = %145, %140
  store i32 5, ptr %4, align 4
  br label %171

151:                                              ; preds = %145, %137
  store i32 0, ptr %4, align 4
  br label %171

152:                                              ; preds = %129
  %153 = load ptr, ptr %5, align 8
  %154 = call i32 @strcmp(ptr noundef %153, ptr noundef @.str.9.376) #13
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %170

156:                                              ; preds = %152
  %157 = load i32, ptr %6, align 4
  %158 = icmp ne i32 %157, 1
  br i1 %158, label %159, label %160

159:                                              ; preds = %156
  store i32 5, ptr %4, align 4
  br label %171

160:                                              ; preds = %156
  %161 = load ptr, ptr %7, align 8
  %162 = icmp ne ptr %161, null
  br i1 %162, label %163, label %169

163:                                              ; preds = %160
  %164 = load ptr, ptr %7, align 8
  %165 = getelementptr inbounds i32, ptr %164, i64 0
  %166 = load i32, ptr %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %169

168:                                              ; preds = %163
  store i32 5, ptr %4, align 4
  br label %171

169:                                              ; preds = %163, %160
  store i32 0, ptr %4, align 4
  br label %171

170:                                              ; preds = %152
  store i32 3, ptr %4, align 4
  br label %171

171:                                              ; preds = %170, %169, %168, %159, %151, %150, %136, %128, %127, %113, %105, %104, %85, %77, %76, %67, %59, %58, %50, %49, %40, %32, %31, %23, %22, %10
  %172 = load i32, ptr %4, align 4
  ret i32 %172
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_builtin_function(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %49

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str.367) #13
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %47, label %11

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef @.str.1.368) #13
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %47, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.2.369) #13
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %47, label %19

19:                                               ; preds = %15
  %20 = load ptr, ptr %3, align 8
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef @.str.3.370) #13
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %47, label %23

23:                                               ; preds = %19
  %24 = load ptr, ptr %3, align 8
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @.str.4.371) #13
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %47, label %27

27:                                               ; preds = %23
  %28 = load ptr, ptr %3, align 8
  %29 = call i32 @strcmp(ptr noundef %28, ptr noundef @.str.5.372) #13
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %47, label %31

31:                                               ; preds = %27
  %32 = load ptr, ptr %3, align 8
  %33 = call i32 @strcmp(ptr noundef %32, ptr noundef @.str.6.373) #13
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %47, label %35

35:                                               ; preds = %31
  %36 = load ptr, ptr %3, align 8
  %37 = call i32 @strcmp(ptr noundef %36, ptr noundef @.str.7.374) #13
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %47, label %39

39:                                               ; preds = %35
  %40 = load ptr, ptr %3, align 8
  %41 = call i32 @strcmp(ptr noundef %40, ptr noundef @.str.8.375) #13
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %47, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %3, align 8
  %45 = call i32 @strcmp(ptr noundef %44, ptr noundef @.str.9.376) #13
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %48

47:                                               ; preds = %43, %39, %35, %31, %27, %23, %19, %15, %11, %7
  store i1 true, ptr %2, align 1
  br label %49

48:                                               ; preds = %43
  store i1 false, ptr %2, align 1
  br label %49

49:                                               ; preds = %48, %47, %6
  %50 = load i1, ptr %2, align 1
  ret i1 %50
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @get_builtin_return_type(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 5, ptr %2, align 4
  br label %53

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str.2.369) #13
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  store i32 2, ptr %2, align 4
  br label %53

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef @.str.367) #13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store i32 1, ptr %2, align 4
  br label %53

17:                                               ; preds = %12
  %18 = load ptr, ptr %3, align 8
  %19 = call i32 @strcmp(ptr noundef %18, ptr noundef @.str.1.368) #13
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  store i32 0, ptr %2, align 4
  br label %53

22:                                               ; preds = %17
  %23 = load ptr, ptr %3, align 8
  %24 = call i32 @strcmp(ptr noundef %23, ptr noundef @.str.3.370) #13
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %38, label %26

26:                                               ; preds = %22
  %27 = load ptr, ptr %3, align 8
  %28 = call i32 @strcmp(ptr noundef %27, ptr noundef @.str.5.372) #13
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %38, label %30

30:                                               ; preds = %26
  %31 = load ptr, ptr %3, align 8
  %32 = call i32 @strcmp(ptr noundef %31, ptr noundef @.str.7.374) #13
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %38, label %34

34:                                               ; preds = %30
  %35 = load ptr, ptr %3, align 8
  %36 = call i32 @strcmp(ptr noundef %35, ptr noundef @.str.8.375) #13
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %34, %30, %26, %22
  store i32 0, ptr %2, align 4
  br label %53

39:                                               ; preds = %34
  %40 = load ptr, ptr %3, align 8
  %41 = call i32 @strcmp(ptr noundef %40, ptr noundef @.str.4.371) #13
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %51, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %3, align 8
  %45 = call i32 @strcmp(ptr noundef %44, ptr noundef @.str.6.373) #13
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %51, label %47

47:                                               ; preds = %43
  %48 = load ptr, ptr %3, align 8
  %49 = call i32 @strcmp(ptr noundef %48, ptr noundef @.str.9.376) #13
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %52

51:                                               ; preds = %47, %43, %39
  store i32 1, ptr %2, align 4
  br label %53

52:                                               ; preds = %47
  store i32 5, ptr %2, align 4
  br label %53

53:                                               ; preds = %52, %51, %38, %21, %16, %11, %6
  %54 = load i32, ptr %2, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @push_scope(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store ptr null, ptr %3, align 8
  br label %29

13:                                               ; preds = %9
  %14 = call ptr @malloc(i64 noundef 16) #11
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store ptr null, ptr %3, align 8
  br label %29

18:                                               ; preds = %13
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.StackNode, ptr %20, i32 0, i32 0
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.StackNode, ptr %24, i32 0, i32 1
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %4, align 8
  store ptr %26, ptr %27, align 8
  %28 = load ptr, ptr %6, align 8
  store ptr %28, ptr %3, align 8
  br label %29

29:                                               ; preds = %18, %17, %12
  %30 = load ptr, ptr %3, align 8
  ret ptr %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @pop_scope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %10, label %6

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %6, %1
  br label %20

11:                                               ; preds = %6
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %3, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.StackNode, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %2, align 8
  store ptr %17, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %19)
  br label %20

20:                                               ; preds = %11, %10
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @search_in_scope_stack(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %17, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %6, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load ptr, ptr %7, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11, %3
  store i1 false, ptr %4, align 1
  br label %38

18:                                               ; preds = %14
  %19 = load ptr, ptr %5, align 8
  store ptr %19, ptr %8, align 8
  br label %20

20:                                               ; preds = %33, %18
  %21 = load ptr, ptr %8, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %37

23:                                               ; preds = %20
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.StackNode, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.symtable, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = call zeroext i1 @symtable_search(ptr noundef %28, ptr noundef %29, ptr noundef %30)
  br i1 %31, label %32, label %33

32:                                               ; preds = %23
  store i1 true, ptr %4, align 1
  br label %38

33:                                               ; preds = %23
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.StackNode, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %8, align 8
  br label %20

37:                                               ; preds = %20
  store i1 false, ptr %4, align 1
  br label %38

38:                                               ; preds = %37, %32, %17
  %39 = load i1, ptr %4, align 1
  ret i1 %39
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_defined_in_current_scope(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store i1 false, ptr %3, align 1
  br label %21

13:                                               ; preds = %9
  store ptr null, ptr %6, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.StackNode, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.symtable, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = call zeroext i1 @symtable_search(ptr noundef %18, ptr noundef %19, ptr noundef %6)
  store i1 %20, ptr %3, align 1
  br label %21

21:                                               ; preds = %13, %12
  %22 = load i1, ptr %3, align 1
  ret i1 %22
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @check_arithmetic_compatibility(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %8, 0
  br label %10

10:                                               ; preds = %7, %2
  %11 = phi i1 [ false, %2 ], [ %9, %7 ]
  ret i1 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @check_string_compatibility(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %8, 20
  br i1 %9, label %10, label %18

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp eq i32 %14, 1
  br label %16

16:                                               ; preds = %13, %10
  %17 = phi i1 [ false, %10 ], [ %15, %13 ]
  store i1 %17, ptr %4, align 1
  br label %30

18:                                               ; preds = %3
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, 22
  br i1 %20, label %21, label %29

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %6, align 4
  %26 = icmp eq i32 %25, 0
  br label %27

27:                                               ; preds = %24, %21
  %28 = phi i1 [ false, %21 ], [ %26, %24 ]
  store i1 %28, ptr %4, align 1
  br label %30

29:                                               ; preds = %18
  store i1 false, ptr %4, align 1
  br label %30

30:                                               ; preds = %29, %27, %16
  %31 = load i1, ptr %4, align 1
  ret i1 %31
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @check_main_function_presence(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %25

8:                                                ; preds = %1
  store ptr null, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = call zeroext i1 @symtable_search(ptr noundef %9, ptr noundef @.str.10.387, ptr noundef %4)
  br i1 %10, label %12, label %11

11:                                               ; preds = %8
  store i1 false, ptr %2, align 1
  br label %25

12:                                               ; preds = %8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.symbol_info, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

17:                                               ; preds = %12
  store i1 false, ptr %2, align 1
  br label %25

18:                                               ; preds = %12
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.symbol_info, ptr %19, i32 0, i32 6
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %18
  store i1 false, ptr %2, align 1
  br label %25

24:                                               ; preds = %18
  store i1 true, ptr %2, align 1
  br label %25

25:                                               ; preds = %24, %23, %17, %11, %7
  %26 = load i1, ptr %2, align 1
  ret i1 %26
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @check_called_functions_exist(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.symtable, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.symtable, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call zeroext i1 @check_called_functions_exist_recursive(ptr noundef %7, ptr noundef %10)
  ret i1 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @check_called_functions_exist_recursive(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  store i1 true, ptr %3, align 1
  br label %39

12:                                               ; preds = %2
  store ptr null, ptr %6, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = call zeroext i1 @symtable_search(ptr noundef %13, ptr noundef %16, ptr noundef %6)
  br i1 %17, label %19, label %18

18:                                               ; preds = %12
  store i1 false, ptr %3, align 1
  br label %39

19:                                               ; preds = %12
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.Node, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = call zeroext i1 @check_called_functions_exist_recursive(ptr noundef %22, ptr noundef %23)
  %25 = zext i1 %24 to i8
  store i8 %25, ptr %7, align 1
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.Node, ptr %26, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = call zeroext i1 @check_called_functions_exist_recursive(ptr noundef %28, ptr noundef %29)
  %31 = zext i1 %30 to i8
  store i8 %31, ptr %8, align 1
  %32 = load i8, ptr %7, align 1
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %37

34:                                               ; preds = %19
  %35 = load i8, ptr %8, align 1
  %36 = trunc i8 %35 to i1
  br label %37

37:                                               ; preds = %34, %19
  %38 = phi i1 [ false, %19 ], [ %36, %34 ]
  store i1 %38, ptr %3, align 1
  br label %39

39:                                               ; preds = %37, %18, %11
  %40 = load i1, ptr %3, align 1
  ret i1 %40
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @max(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %3, align 4
  br label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %11, %9
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @init_symtable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.symtable, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.symtable, ptr %5, i32 0, i32 1
  store i32 0, ptr %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @height(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 4
  %10 = load i32, ptr %9, align 8
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %7, %6
  %12 = load i32, ptr %2, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @get_balance(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %17

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 @height(ptr noundef %10)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @height(ptr noundef %14)
  %16 = sub nsw i32 %11, %15
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %7, %6
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @find_min_node(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %8, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %12

8:                                                ; preds = %3
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %2, align 8
  br label %3

12:                                               ; preds = %3
  %13 = load ptr, ptr %2, align 8
  ret ptr %13
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @free_symbol_info(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %41

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.symbol_info, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %17

13:                                               ; preds = %8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.symbol_info, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16)
  br label %17

17:                                               ; preds = %13, %8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.symbol_info, ptr %18, i32 0, i32 4
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %3, align 8
  br label %21

21:                                               ; preds = %36, %17
  %22 = load ptr, ptr %3, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %39

24:                                               ; preds = %21
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.param, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %4, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.param, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %36

32:                                               ; preds = %24
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.param, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  call void @free(ptr noundef %35)
  br label %36

36:                                               ; preds = %32, %24
  %37 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %37)
  %38 = load ptr, ptr %4, align 8
  store ptr %38, ptr %3, align 8
  br label %21

39:                                               ; preds = %21
  %40 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %40)
  br label %41

41:                                               ; preds = %39, %7
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @right_rotate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.Node, ptr %5, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 3
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Node, ptr %15, i32 0, i32 2
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.Node, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @height(ptr noundef %19)
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.Node, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = call i32 @height(ptr noundef %23)
  %25 = call i32 @max(i32 noundef %20, i32 noundef %24)
  %26 = add nsw i32 %25, 1
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.Node, ptr %27, i32 0, i32 4
  store i32 %26, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 @height(ptr noundef %31)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.Node, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = call i32 @height(ptr noundef %35)
  %37 = call i32 @max(i32 noundef %32, i32 noundef %36)
  %38 = add nsw i32 %37, 1
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.Node, ptr %39, i32 0, i32 4
  store i32 %38, ptr %40, align 8
  %41 = load ptr, ptr %3, align 8
  ret ptr %41
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @left_rotate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.Node, ptr %5, i32 0, i32 3
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 2
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Node, ptr %15, i32 0, i32 3
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.Node, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @height(ptr noundef %19)
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.Node, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = call i32 @height(ptr noundef %23)
  %25 = call i32 @max(i32 noundef %20, i32 noundef %24)
  %26 = add nsw i32 %25, 1
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.Node, ptr %27, i32 0, i32 4
  store i32 %26, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 @height(ptr noundef %31)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.Node, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = call i32 @height(ptr noundef %35)
  %37 = call i32 @max(i32 noundef %32, i32 noundef %36)
  %38 = add nsw i32 %37, 1
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.Node, ptr %39, i32 0, i32 4
  store i32 %38, ptr %40, align 8
  %41 = load ptr, ptr %3, align 8
  ret ptr %41
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @new_node(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = call ptr @malloc(i64 noundef 40) #11
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %44

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = call i64 @strlen(ptr noundef %12) #13
  %14 = add i64 %13, 1
  %15 = call ptr @malloc(i64 noundef %14) #11
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %16, i32 0, i32 0
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.Node, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %24

22:                                               ; preds = %11
  %23 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %23)
  store ptr null, ptr %3, align 8
  br label %44

24:                                               ; preds = %11
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = call i64 @llvm.objectsize.i64.p0(ptr %31, i1 false, i1 true, i1 false)
  %33 = call ptr @__strcpy_chk(ptr noundef %27, ptr noundef %28, i64 noundef %32) #13
  %34 = load ptr, ptr %5, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %35, i32 0, i32 1
  store ptr %34, ptr %36, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.Node, ptr %37, i32 0, i32 2
  store ptr null, ptr %38, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = getelementptr inbounds %struct.Node, ptr %39, i32 0, i32 3
  store ptr null, ptr %40, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.Node, ptr %41, i32 0, i32 4
  store i32 1, ptr %42, align 8
  %43 = load ptr, ptr %6, align 8
  store ptr %43, ptr %3, align 8
  br label %44

44:                                               ; preds = %24, %22, %10
  %45 = load ptr, ptr %3, align 8
  ret ptr %45
}

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symtable_search(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %8, align 8
  br label %10

10:                                               ; preds = %40, %3
  %11 = load ptr, ptr %8, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %41

13:                                               ; preds = %10
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = call i32 @strcmp(ptr noundef %16, ptr noundef %17) #13
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %13
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.Node, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %7, align 8
  store ptr %23, ptr %24, align 8
  store i1 true, ptr %4, align 1
  br label %43

25:                                               ; preds = %13
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.Node, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 @strcmp(ptr noundef %26, ptr noundef %29) #13
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %36

32:                                               ; preds = %25
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.Node, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %8, align 8
  br label %40

36:                                               ; preds = %25
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.Node, ptr %37, i32 0, i32 3
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %8, align 8
  br label %40

40:                                               ; preds = %36, %32
  br label %10

41:                                               ; preds = %10
  %42 = load ptr, ptr %7, align 8
  store ptr null, ptr %42, align 8
  store i1 false, ptr %4, align 1
  br label %43

43:                                               ; preds = %41, %20
  %44 = load i1, ptr %4, align 1
  ret i1 %44
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @avl_insert(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %16

12:                                               ; preds = %3
  %13 = load ptr, ptr %6, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = call ptr @new_node(ptr noundef %13, ptr noundef %14)
  store ptr %15, ptr %4, align 8
  br label %118

16:                                               ; preds = %3
  %17 = load ptr, ptr %6, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.Node, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @strcmp(ptr noundef %17, ptr noundef %20) #13
  store i32 %21, ptr %8, align 4
  %22 = load i32, ptr %8, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %32

24:                                               ; preds = %16
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  call void @free_symbol_info(ptr noundef %27)
  %28 = load ptr, ptr %7, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 1
  store ptr %28, ptr %30, align 8
  %31 = load ptr, ptr %5, align 8
  store ptr %31, ptr %4, align 8
  br label %118

32:                                               ; preds = %16
  %33 = load i32, ptr %8, align 4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %44

35:                                               ; preds = %32
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.Node, ptr %36, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = load ptr, ptr %7, align 8
  %41 = call ptr @avl_insert(ptr noundef %38, ptr noundef %39, ptr noundef %40)
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.Node, ptr %42, i32 0, i32 2
  store ptr %41, ptr %43, align 8
  br label %53

44:                                               ; preds = %32
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.Node, ptr %45, i32 0, i32 3
  %47 = load ptr, ptr %46, align 8
  %48 = load ptr, ptr %6, align 8
  %49 = load ptr, ptr %7, align 8
  %50 = call ptr @avl_insert(ptr noundef %47, ptr noundef %48, ptr noundef %49)
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds %struct.Node, ptr %51, i32 0, i32 3
  store ptr %50, ptr %52, align 8
  br label %53

53:                                               ; preds = %44, %35
  br label %54

54:                                               ; preds = %53
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds %struct.Node, ptr %55, i32 0, i32 2
  %57 = load ptr, ptr %56, align 8
  %58 = call i32 @height(ptr noundef %57)
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds %struct.Node, ptr %59, i32 0, i32 3
  %61 = load ptr, ptr %60, align 8
  %62 = call i32 @height(ptr noundef %61)
  %63 = call i32 @max(i32 noundef %58, i32 noundef %62)
  %64 = add nsw i32 1, %63
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds %struct.Node, ptr %65, i32 0, i32 4
  store i32 %64, ptr %66, align 8
  %67 = load ptr, ptr %5, align 8
  %68 = call i32 @get_balance(ptr noundef %67)
  store i32 %68, ptr %9, align 4
  %69 = load i32, ptr %9, align 4
  %70 = icmp sgt i32 %69, 1
  br i1 %70, label %71, label %92

71:                                               ; preds = %54
  %72 = load ptr, ptr %6, align 8
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.Node, ptr %73, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %struct.Node, ptr %75, i32 0, i32 0
  %77 = load ptr, ptr %76, align 8
  %78 = call i32 @strcmp(ptr noundef %72, ptr noundef %77) #13
  %79 = icmp slt i32 %78, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %71
  %81 = load ptr, ptr %5, align 8
  %82 = call ptr @right_rotate(ptr noundef %81)
  store ptr %82, ptr %4, align 8
  br label %118

83:                                               ; preds = %71
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.Node, ptr %84, i32 0, i32 2
  %86 = load ptr, ptr %85, align 8
  %87 = call ptr @left_rotate(ptr noundef %86)
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.Node, ptr %88, i32 0, i32 2
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %5, align 8
  %91 = call ptr @right_rotate(ptr noundef %90)
  store ptr %91, ptr %4, align 8
  br label %118

92:                                               ; preds = %54
  %93 = load i32, ptr %9, align 4
  %94 = icmp slt i32 %93, -1
  br i1 %94, label %95, label %116

95:                                               ; preds = %92
  %96 = load ptr, ptr %6, align 8
  %97 = load ptr, ptr %5, align 8
  %98 = getelementptr inbounds %struct.Node, ptr %97, i32 0, i32 3
  %99 = load ptr, ptr %98, align 8
  %100 = getelementptr inbounds %struct.Node, ptr %99, i32 0, i32 0
  %101 = load ptr, ptr %100, align 8
  %102 = call i32 @strcmp(ptr noundef %96, ptr noundef %101) #13
  %103 = icmp sgt i32 %102, 0
  br i1 %103, label %104, label %107

104:                                              ; preds = %95
  %105 = load ptr, ptr %5, align 8
  %106 = call ptr @left_rotate(ptr noundef %105)
  store ptr %106, ptr %4, align 8
  br label %118

107:                                              ; preds = %95
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.Node, ptr %108, i32 0, i32 3
  %110 = load ptr, ptr %109, align 8
  %111 = call ptr @right_rotate(ptr noundef %110)
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds %struct.Node, ptr %112, i32 0, i32 3
  store ptr %111, ptr %113, align 8
  %114 = load ptr, ptr %5, align 8
  %115 = call ptr @left_rotate(ptr noundef %114)
  store ptr %115, ptr %4, align 8
  br label %118

116:                                              ; preds = %92
  %117 = load ptr, ptr %5, align 8
  store ptr %117, ptr %4, align 8
  br label %118

118:                                              ; preds = %116, %107, %104, %83, %80, %24, %12
  %119 = load ptr, ptr %4, align 8
  ret ptr %119
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symtable_insert(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i1, align 1
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %12 = load ptr, ptr %9, align 8
  store i32 0, ptr %12, align 4
  %13 = load ptr, ptr %8, align 8
  %14 = getelementptr inbounds %struct.symbol_info, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %28

17:                                               ; preds = %4
  %18 = load ptr, ptr %7, align 8
  %19 = call i32 @strncmp(ptr noundef %18, ptr noundef @.str.396, i64 noundef 2) #13
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %17
  %22 = load ptr, ptr %8, align 8
  %23 = getelementptr inbounds %struct.symbol_info, ptr %22, i32 0, i32 1
  store i32 2, ptr %23, align 8
  br label %27

24:                                               ; preds = %17
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds %struct.symbol_info, ptr %25, i32 0, i32 1
  store i32 1, ptr %26, align 8
  br label %27

27:                                               ; preds = %24, %21
  br label %28

28:                                               ; preds = %27, %4
  store ptr null, ptr %10, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = load ptr, ptr %29, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = call zeroext i1 @symtable_search(ptr noundef %30, ptr noundef %31, ptr noundef %10)
  br i1 %32, label %33, label %122

33:                                               ; preds = %28
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.symbol_info, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp eq i32 %36, 3
  br i1 %37, label %38, label %54

38:                                               ; preds = %33
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.symbol_info, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 8
  %42 = icmp eq i32 %41, 3
  br i1 %42, label %43, label %54

43:                                               ; preds = %38
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds %struct.symbol_info, ptr %44, i32 0, i32 6
  %46 = load i32, ptr %45, align 4
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.symbol_info, ptr %47, i32 0, i32 6
  %49 = load i32, ptr %48, align 4
  %50 = icmp eq i32 %46, %49
  br i1 %50, label %51, label %53

51:                                               ; preds = %43
  %52 = load ptr, ptr %9, align 8
  store i32 4, ptr %52, align 4
  store i1 false, ptr %5, align 1
  br label %139

53:                                               ; preds = %43
  br label %121

54:                                               ; preds = %38, %33
  %55 = load ptr, ptr %8, align 8
  %56 = getelementptr inbounds %struct.symbol_info, ptr %55, i32 0, i32 1
  %57 = load i32, ptr %56, align 8
  %58 = icmp eq i32 %57, 1
  br i1 %58, label %59, label %64

59:                                               ; preds = %54
  %60 = load ptr, ptr %10, align 8
  %61 = getelementptr inbounds %struct.symbol_info, ptr %60, i32 0, i32 1
  %62 = load i32, ptr %61, align 8
  %63 = icmp eq i32 %62, 3
  br i1 %63, label %74, label %64

64:                                               ; preds = %59, %54
  %65 = load ptr, ptr %8, align 8
  %66 = getelementptr inbounds %struct.symbol_info, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 3
  br i1 %68, label %69, label %76

69:                                               ; preds = %64
  %70 = load ptr, ptr %10, align 8
  %71 = getelementptr inbounds %struct.symbol_info, ptr %70, i32 0, i32 1
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %76

74:                                               ; preds = %69, %59
  %75 = load ptr, ptr %9, align 8
  store i32 4, ptr %75, align 4
  store i1 false, ptr %5, align 1
  br label %139

76:                                               ; preds = %69, %64
  %77 = load ptr, ptr %8, align 8
  %78 = getelementptr inbounds %struct.symbol_info, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 8
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %91

81:                                               ; preds = %76
  %82 = load ptr, ptr %10, align 8
  %83 = getelementptr inbounds %struct.symbol_info, ptr %82, i32 0, i32 1
  %84 = load i32, ptr %83, align 8
  %85 = icmp eq i32 %84, 4
  br i1 %85, label %106, label %86

86:                                               ; preds = %81
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.symbol_info, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = icmp eq i32 %89, 5
  br i1 %90, label %106, label %91

91:                                               ; preds = %86, %76
  %92 = load ptr, ptr %8, align 8
  %93 = getelementptr inbounds %struct.symbol_info, ptr %92, i32 0, i32 1
  %94 = load i32, ptr %93, align 8
  %95 = icmp eq i32 %94, 4
  br i1 %95, label %101, label %96

96:                                               ; preds = %91
  %97 = load ptr, ptr %8, align 8
  %98 = getelementptr inbounds %struct.symbol_info, ptr %97, i32 0, i32 1
  %99 = load i32, ptr %98, align 8
  %100 = icmp eq i32 %99, 5
  br i1 %100, label %101, label %108

101:                                              ; preds = %96, %91
  %102 = load ptr, ptr %10, align 8
  %103 = getelementptr inbounds %struct.symbol_info, ptr %102, i32 0, i32 1
  %104 = load i32, ptr %103, align 8
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %108

106:                                              ; preds = %101, %86, %81
  %107 = load ptr, ptr %9, align 8
  store i32 4, ptr %107, align 4
  store i1 false, ptr %5, align 1
  br label %139

108:                                              ; preds = %101, %96
  %109 = load ptr, ptr %8, align 8
  %110 = getelementptr inbounds %struct.symbol_info, ptr %109, i32 0, i32 1
  %111 = load i32, ptr %110, align 8
  %112 = load ptr, ptr %10, align 8
  %113 = getelementptr inbounds %struct.symbol_info, ptr %112, i32 0, i32 1
  %114 = load i32, ptr %113, align 8
  %115 = icmp eq i32 %111, %114
  br i1 %115, label %116, label %118

116:                                              ; preds = %108
  %117 = load ptr, ptr %9, align 8
  store i32 4, ptr %117, align 4
  store i1 false, ptr %5, align 1
  br label %139

118:                                              ; preds = %108
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
  br label %121

121:                                              ; preds = %120, %53
  br label %122

122:                                              ; preds = %121, %28
  %123 = load ptr, ptr %6, align 8
  %124 = load ptr, ptr %123, align 8
  %125 = load ptr, ptr %7, align 8
  %126 = load ptr, ptr %8, align 8
  %127 = call ptr @avl_insert(ptr noundef %124, ptr noundef %125, ptr noundef %126)
  store ptr %127, ptr %11, align 8
  %128 = load ptr, ptr %11, align 8
  %129 = icmp eq ptr %128, null
  br i1 %129, label %130, label %136

130:                                              ; preds = %122
  %131 = load ptr, ptr %6, align 8
  %132 = load ptr, ptr %131, align 8
  %133 = icmp eq ptr %132, null
  br i1 %133, label %134, label %136

134:                                              ; preds = %130
  %135 = load ptr, ptr %9, align 8
  store i32 99, ptr %135, align 4
  store i1 false, ptr %5, align 1
  br label %139

136:                                              ; preds = %130, %122
  %137 = load ptr, ptr %11, align 8
  %138 = load ptr, ptr %6, align 8
  store ptr %137, ptr %138, align 8
  store i1 true, ptr %5, align 1
  br label %139

139:                                              ; preds = %136, %134, %116, %106, %74, %51
  %140 = load i1, ptr %5, align 1
  ret i1 %140
}

; Function Attrs: nounwind
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @avl_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  store ptr %14, ptr %3, align 8
  br label %213

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.Node, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @strcmp(ptr noundef %16, ptr noundef %19) #13
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %31

23:                                               ; preds = %15
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.Node, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = call ptr @avl_delete(ptr noundef %26, ptr noundef %27)
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 2
  store ptr %28, ptr %30, align 8
  br label %150

31:                                               ; preds = %15
  %32 = load i32, ptr %6, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %42

34:                                               ; preds = %31
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %35, i32 0, i32 3
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = call ptr @avl_delete(ptr noundef %37, ptr noundef %38)
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.Node, ptr %40, i32 0, i32 3
  store ptr %39, ptr %41, align 8
  br label %149

42:                                               ; preds = %31
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.Node, ptr %43, i32 0, i32 2
  %45 = load ptr, ptr %44, align 8
  %46 = icmp eq ptr %45, null
  br i1 %46, label %47, label %60

47:                                               ; preds = %42
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.Node, ptr %48, i32 0, i32 3
  %50 = load ptr, ptr %49, align 8
  %51 = icmp eq ptr %50, null
  br i1 %51, label %52, label %60

52:                                               ; preds = %47
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.Node, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %55)
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.Node, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  call void @free_symbol_info(ptr noundef %58)
  %59 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %59)
  store ptr null, ptr %4, align 8
  br label %148

60:                                               ; preds = %47, %42
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.Node, ptr %61, i32 0, i32 3
  %63 = load ptr, ptr %62, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %65, label %77

65:                                               ; preds = %60
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds %struct.Node, ptr %66, i32 0, i32 2
  %68 = load ptr, ptr %67, align 8
  store ptr %68, ptr %7, align 8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.Node, ptr %69, i32 0, i32 0
  %71 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %71)
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.Node, ptr %72, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  call void @free_symbol_info(ptr noundef %74)
  %75 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %75)
  %76 = load ptr, ptr %7, align 8
  store ptr %76, ptr %4, align 8
  br label %147

77:                                               ; preds = %60
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.Node, ptr %78, i32 0, i32 2
  %80 = load ptr, ptr %79, align 8
  %81 = icmp eq ptr %80, null
  br i1 %81, label %82, label %94

82:                                               ; preds = %77
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.Node, ptr %83, i32 0, i32 3
  %85 = load ptr, ptr %84, align 8
  store ptr %85, ptr %8, align 8
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds %struct.Node, ptr %86, i32 0, i32 0
  %88 = load ptr, ptr %87, align 8
  call void @free(ptr noundef %88)
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds %struct.Node, ptr %89, i32 0, i32 1
  %91 = load ptr, ptr %90, align 8
  call void @free_symbol_info(ptr noundef %91)
  %92 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %92)
  %93 = load ptr, ptr %8, align 8
  store ptr %93, ptr %4, align 8
  br label %146

94:                                               ; preds = %77
  %95 = load ptr, ptr %4, align 8
  %96 = getelementptr inbounds %struct.Node, ptr %95, i32 0, i32 3
  %97 = load ptr, ptr %96, align 8
  %98 = call ptr @find_min_node(ptr noundef %97)
  store ptr %98, ptr %9, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.Node, ptr %99, i32 0, i32 0
  %101 = load ptr, ptr %100, align 8
  call void @free(ptr noundef %101)
  %102 = load ptr, ptr %4, align 8
  %103 = getelementptr inbounds %struct.Node, ptr %102, i32 0, i32 1
  %104 = load ptr, ptr %103, align 8
  call void @free_symbol_info(ptr noundef %104)
  %105 = load ptr, ptr %9, align 8
  %106 = getelementptr inbounds %struct.Node, ptr %105, i32 0, i32 0
  %107 = load ptr, ptr %106, align 8
  %108 = call i64 @strlen(ptr noundef %107) #13
  %109 = add i64 %108, 1
  %110 = call ptr @malloc(i64 noundef %109) #11
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.Node, ptr %111, i32 0, i32 0
  store ptr %110, ptr %112, align 8
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds %struct.Node, ptr %113, i32 0, i32 0
  %115 = load ptr, ptr %114, align 8
  %116 = icmp ne ptr %115, null
  br i1 %116, label %117, label %129

117:                                              ; preds = %94
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.Node, ptr %118, i32 0, i32 0
  %120 = load ptr, ptr %119, align 8
  %121 = load ptr, ptr %9, align 8
  %122 = getelementptr inbounds %struct.Node, ptr %121, i32 0, i32 0
  %123 = load ptr, ptr %122, align 8
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.Node, ptr %124, i32 0, i32 0
  %126 = load ptr, ptr %125, align 8
  %127 = call i64 @llvm.objectsize.i64.p0(ptr %126, i1 false, i1 true, i1 false)
  %128 = call ptr @__strcpy_chk(ptr noundef %120, ptr noundef %123, i64 noundef %127) #13
  br label %129

129:                                              ; preds = %117, %94
  %130 = load ptr, ptr %9, align 8
  %131 = getelementptr inbounds %struct.Node, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = load ptr, ptr %4, align 8
  %134 = getelementptr inbounds %struct.Node, ptr %133, i32 0, i32 1
  store ptr %132, ptr %134, align 8
  %135 = load ptr, ptr %9, align 8
  %136 = getelementptr inbounds %struct.Node, ptr %135, i32 0, i32 1
  store ptr null, ptr %136, align 8
  %137 = load ptr, ptr %4, align 8
  %138 = getelementptr inbounds %struct.Node, ptr %137, i32 0, i32 3
  %139 = load ptr, ptr %138, align 8
  %140 = load ptr, ptr %9, align 8
  %141 = getelementptr inbounds %struct.Node, ptr %140, i32 0, i32 0
  %142 = load ptr, ptr %141, align 8
  %143 = call ptr @avl_delete(ptr noundef %139, ptr noundef %142)
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds %struct.Node, ptr %144, i32 0, i32 3
  store ptr %143, ptr %145, align 8
  br label %146

146:                                              ; preds = %129, %82
  br label %147

147:                                              ; preds = %146, %65
  br label %148

148:                                              ; preds = %147, %52
  br label %149

149:                                              ; preds = %148, %34
  br label %150

150:                                              ; preds = %149, %23
  %151 = load ptr, ptr %4, align 8
  %152 = icmp eq ptr %151, null
  br i1 %152, label %153, label %155

153:                                              ; preds = %150
  %154 = load ptr, ptr %4, align 8
  store ptr %154, ptr %3, align 8
  br label %213

155:                                              ; preds = %150
  %156 = load ptr, ptr %4, align 8
  %157 = getelementptr inbounds %struct.Node, ptr %156, i32 0, i32 2
  %158 = load ptr, ptr %157, align 8
  %159 = call i32 @height(ptr noundef %158)
  %160 = load ptr, ptr %4, align 8
  %161 = getelementptr inbounds %struct.Node, ptr %160, i32 0, i32 3
  %162 = load ptr, ptr %161, align 8
  %163 = call i32 @height(ptr noundef %162)
  %164 = call i32 @max(i32 noundef %159, i32 noundef %163)
  %165 = add nsw i32 1, %164
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.Node, ptr %166, i32 0, i32 4
  store i32 %165, ptr %167, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = call i32 @get_balance(ptr noundef %168)
  store i32 %169, ptr %10, align 4
  %170 = load i32, ptr %10, align 4
  %171 = icmp sgt i32 %170, 1
  br i1 %171, label %172, label %190

172:                                              ; preds = %155
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.Node, ptr %173, i32 0, i32 2
  %175 = load ptr, ptr %174, align 8
  %176 = call i32 @get_balance(ptr noundef %175)
  %177 = icmp sge i32 %176, 0
  br i1 %177, label %178, label %181

178:                                              ; preds = %172
  %179 = load ptr, ptr %4, align 8
  %180 = call ptr @right_rotate(ptr noundef %179)
  store ptr %180, ptr %3, align 8
  br label %213

181:                                              ; preds = %172
  %182 = load ptr, ptr %4, align 8
  %183 = getelementptr inbounds %struct.Node, ptr %182, i32 0, i32 2
  %184 = load ptr, ptr %183, align 8
  %185 = call ptr @left_rotate(ptr noundef %184)
  %186 = load ptr, ptr %4, align 8
  %187 = getelementptr inbounds %struct.Node, ptr %186, i32 0, i32 2
  store ptr %185, ptr %187, align 8
  %188 = load ptr, ptr %4, align 8
  %189 = call ptr @right_rotate(ptr noundef %188)
  store ptr %189, ptr %3, align 8
  br label %213

190:                                              ; preds = %155
  %191 = load i32, ptr %10, align 4
  %192 = icmp slt i32 %191, -1
  br i1 %192, label %193, label %211

193:                                              ; preds = %190
  %194 = load ptr, ptr %4, align 8
  %195 = getelementptr inbounds %struct.Node, ptr %194, i32 0, i32 3
  %196 = load ptr, ptr %195, align 8
  %197 = call i32 @get_balance(ptr noundef %196)
  %198 = icmp sle i32 %197, 0
  br i1 %198, label %199, label %202

199:                                              ; preds = %193
  %200 = load ptr, ptr %4, align 8
  %201 = call ptr @left_rotate(ptr noundef %200)
  store ptr %201, ptr %3, align 8
  br label %213

202:                                              ; preds = %193
  %203 = load ptr, ptr %4, align 8
  %204 = getelementptr inbounds %struct.Node, ptr %203, i32 0, i32 3
  %205 = load ptr, ptr %204, align 8
  %206 = call ptr @right_rotate(ptr noundef %205)
  %207 = load ptr, ptr %4, align 8
  %208 = getelementptr inbounds %struct.Node, ptr %207, i32 0, i32 3
  store ptr %206, ptr %208, align 8
  %209 = load ptr, ptr %4, align 8
  %210 = call ptr @left_rotate(ptr noundef %209)
  store ptr %210, ptr %3, align 8
  br label %213

211:                                              ; preds = %190
  %212 = load ptr, ptr %4, align 8
  store ptr %212, ptr %3, align 8
  br label %213

213:                                              ; preds = %211, %202, %199, %181, %178, %153, %13
  %214 = load ptr, ptr %3, align 8
  ret ptr %214
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @symtable_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @avl_delete(ptr noundef %6, ptr noundef %7)
  %9 = load ptr, ptr %3, align 8
  store ptr %8, ptr %9, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @symtable_dispose(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %25

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 2
  call void @symtable_dispose(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 3
  call void @symtable_dispose(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.Node, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %2, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  call void @free_symbol_info(ptr noundef %21)
  %22 = load ptr, ptr %2, align 8
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  %24 = load ptr, ptr %2, align 8
  store ptr null, ptr %24, align 8
  br label %25

25:                                               ; preds = %7, %6
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @symtable_search_function_by_arity(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i1, align 1
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = call zeroext i1 @symtable_search(ptr noundef %11, ptr noundef %12, ptr noundef %10)
  br i1 %13, label %14, label %29

14:                                               ; preds = %4
  %15 = load ptr, ptr %10, align 8
  %16 = getelementptr inbounds %struct.symbol_info, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %19, label %28

19:                                               ; preds = %14
  %20 = load ptr, ptr %10, align 8
  %21 = getelementptr inbounds %struct.symbol_info, ptr %20, i32 0, i32 6
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %28

25:                                               ; preds = %19
  %26 = load ptr, ptr %10, align 8
  %27 = load ptr, ptr %9, align 8
  store ptr %26, ptr %27, align 8
  store i1 true, ptr %5, align 1
  br label %31

28:                                               ; preds = %19, %14
  br label %29

29:                                               ; preds = %28, %4
  %30 = load ptr, ptr %9, align 8
  store ptr null, ptr %30, align 8
  store i1 false, ptr %5, align 1
  br label %31

31:                                               ; preds = %29, %25
  %32 = load i1, ptr %5, align 1
  ret i1 %32
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @is_variable_initialized(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call zeroext i1 @symtable_search(ptr noundef %7, ptr noundef %8, ptr noundef %6)
  br i1 %9, label %10, label %31

10:                                               ; preds = %2
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.symbol_info, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %10
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.symbol_info, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %25, label %20

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.symbol_info, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 8
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %25, label %30

25:                                               ; preds = %20, %15, %10
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.symbol_info, ptr %26, i32 0, i32 3
  %28 = load i8, ptr %27, align 8
  %29 = trunc i8 %28 to i1
  store i1 %29, ptr %3, align 1
  br label %32

30:                                               ; preds = %20
  br label %31

31:                                               ; preds = %30, %2
  store i1 false, ptr %3, align 1
  br label %32

32:                                               ; preds = %31, %25
  %33 = load i1, ptr %3, align 1
  ret i1 %33
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @determine_identifier_type(ptr noundef %0, i1 noundef zeroext %1, i1 noundef zeroext %2, i1 noundef zeroext %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  store ptr %0, ptr %6, align 8
  %10 = zext i1 %1 to i8
  store i8 %10, ptr %7, align 1
  %11 = zext i1 %2 to i8
  store i8 %11, ptr %8, align 1
  %12 = zext i1 %3 to i8
  store i8 %12, ptr %9, align 1
  %13 = load ptr, ptr %6, align 8
  %14 = call i32 @strncmp(ptr noundef %13, ptr noundef @.str.1.399, i64 noundef 4) #13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %4
  store i32 6, ptr %5, align 4
  br label %35

17:                                               ; preds = %4
  %18 = load i8, ptr %8, align 1
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i32 4, ptr %5, align 4
  br label %35

21:                                               ; preds = %17
  %22 = load i8, ptr %9, align 1
  %23 = trunc i8 %22 to i1
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  store i32 5, ptr %5, align 4
  br label %35

25:                                               ; preds = %21
  %26 = load i8, ptr %7, align 1
  %27 = trunc i8 %26 to i1
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store i32 3, ptr %5, align 4
  br label %35

29:                                               ; preds = %25
  %30 = load ptr, ptr %6, align 8
  %31 = call i32 @strncmp(ptr noundef %30, ptr noundef @.str.396, i64 noundef 2) #13
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %34

33:                                               ; preds = %29
  store i32 2, ptr %5, align 4
  br label %35

34:                                               ; preds = %29
  store i32 1, ptr %5, align 4
  br label %35

35:                                               ; preds = %34, %33, %28, %24, %20, %16
  %36 = load i32, ptr %5, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @token_type_to_str(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  switch i32 %4, label %45 [
    i32 0, label %5
    i32 1, label %6
    i32 3, label %7
    i32 4, label %8
    i32 2, label %9
    i32 5, label %10
    i32 6, label %11
    i32 7, label %12
    i32 8, label %13
    i32 9, label %14
    i32 10, label %15
    i32 11, label %16
    i32 12, label %17
    i32 13, label %18
    i32 14, label %19
    i32 15, label %20
    i32 16, label %21
    i32 17, label %22
    i32 18, label %23
    i32 19, label %24
    i32 20, label %25
    i32 21, label %26
    i32 22, label %27
    i32 23, label %28
    i32 24, label %29
    i32 25, label %30
    i32 26, label %31
    i32 27, label %32
    i32 28, label %33
    i32 29, label %34
    i32 30, label %35
    i32 31, label %36
    i32 32, label %37
    i32 33, label %38
    i32 34, label %39
    i32 35, label %40
    i32 36, label %41
    i32 37, label %42
    i32 38, label %43
    i32 40, label %44
  ]

5:                                                ; preds = %1
  store ptr @.str.400, ptr %2, align 8
  br label %46

6:                                                ; preds = %1
  store ptr @.str.1.401, ptr %2, align 8
  br label %46

7:                                                ; preds = %1
  store ptr @.str.2.402, ptr %2, align 8
  br label %46

8:                                                ; preds = %1
  store ptr @.str.3.403, ptr %2, align 8
  br label %46

9:                                                ; preds = %1
  store ptr @.str.4.404, ptr %2, align 8
  br label %46

10:                                               ; preds = %1
  store ptr @.str.5.405, ptr %2, align 8
  br label %46

11:                                               ; preds = %1
  store ptr @.str.6.406, ptr %2, align 8
  br label %46

12:                                               ; preds = %1
  store ptr @.str.7.407, ptr %2, align 8
  br label %46

13:                                               ; preds = %1
  store ptr @.str.8.408, ptr %2, align 8
  br label %46

14:                                               ; preds = %1
  store ptr @.str.9.409, ptr %2, align 8
  br label %46

15:                                               ; preds = %1
  store ptr @.str.10.410, ptr %2, align 8
  br label %46

16:                                               ; preds = %1
  store ptr @.str.11.411, ptr %2, align 8
  br label %46

17:                                               ; preds = %1
  store ptr @.str.12.412, ptr %2, align 8
  br label %46

18:                                               ; preds = %1
  store ptr @.str.13.413, ptr %2, align 8
  br label %46

19:                                               ; preds = %1
  store ptr @.str.14.414, ptr %2, align 8
  br label %46

20:                                               ; preds = %1
  store ptr @.str.15.415, ptr %2, align 8
  br label %46

21:                                               ; preds = %1
  store ptr @.str.16.416, ptr %2, align 8
  br label %46

22:                                               ; preds = %1
  store ptr @.str.17.417, ptr %2, align 8
  br label %46

23:                                               ; preds = %1
  store ptr @.str.18.418, ptr %2, align 8
  br label %46

24:                                               ; preds = %1
  store ptr @.str.19.419, ptr %2, align 8
  br label %46

25:                                               ; preds = %1
  store ptr @.str.20.420, ptr %2, align 8
  br label %46

26:                                               ; preds = %1
  store ptr @.str.21.421, ptr %2, align 8
  br label %46

27:                                               ; preds = %1
  store ptr @.str.22.422, ptr %2, align 8
  br label %46

28:                                               ; preds = %1
  store ptr @.str.23.423, ptr %2, align 8
  br label %46

29:                                               ; preds = %1
  store ptr @.str.24.424, ptr %2, align 8
  br label %46

30:                                               ; preds = %1
  store ptr @.str.25.425, ptr %2, align 8
  br label %46

31:                                               ; preds = %1
  store ptr @.str.26.426, ptr %2, align 8
  br label %46

32:                                               ; preds = %1
  store ptr @.str.27.427, ptr %2, align 8
  br label %46

33:                                               ; preds = %1
  store ptr @.str.28.428, ptr %2, align 8
  br label %46

34:                                               ; preds = %1
  store ptr @.str.29.429, ptr %2, align 8
  br label %46

35:                                               ; preds = %1
  store ptr @.str.30.430, ptr %2, align 8
  br label %46

36:                                               ; preds = %1
  store ptr @.str.31.431, ptr %2, align 8
  br label %46

37:                                               ; preds = %1
  store ptr @.str.32.432, ptr %2, align 8
  br label %46

38:                                               ; preds = %1
  store ptr @.str.33.433, ptr %2, align 8
  br label %46

39:                                               ; preds = %1
  store ptr @.str.34.434, ptr %2, align 8
  br label %46

40:                                               ; preds = %1
  store ptr @.str.35.435, ptr %2, align 8
  br label %46

41:                                               ; preds = %1
  store ptr @.str.36.436, ptr %2, align 8
  br label %46

42:                                               ; preds = %1
  store ptr @.str.37.437, ptr %2, align 8
  br label %46

43:                                               ; preds = %1
  store ptr @.str.38.438, ptr %2, align 8
  br label %46

44:                                               ; preds = %1
  store ptr @.str.39.439, ptr %2, align 8
  br label %46

45:                                               ; preds = %1
  store ptr @.str.40.440, ptr %2, align 8
  br label %46

46:                                               ; preds = %45, %44, %43, %42, %41, %40, %39, %38, %37, %36, %35, %34, %33, %32, %31, %30, %29, %28, %27, %26, %25, %24, %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  %47 = load ptr, ptr %2, align 8
  ret ptr %47
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @print_token(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = call ptr @token_type_to_str(i32 noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.41.441, ptr noundef %6)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Token, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %17

12:                                               ; preds = %1
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Token, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.42.442, ptr noundef %15)
  br label %17

17:                                               ; preds = %12, %1
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.43.443)
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { allocsize(1) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind willreturn memory(read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #10 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { allocsize(0) }
attributes #12 = { noreturn }
attributes #13 = { nounwind }
attributes #14 = { allocsize(1) }
attributes #15 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Apple clang version 17.0.0 (clang-1700.4.4.1)"}
!1 = !{i32 2, !"SDK Version", [2 x i32] [i32 26, i32 1]}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 1}
