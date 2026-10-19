; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx26.0.0"

%struct.ifjFunction = type { ptr, i32 }
%struct.Token = type { i32, ptr, i32, i32, i32, %union.dataU }
%union.dataU = type { double }
%struct.AstNodeStack = type { ptr, i64, i64 }
%struct.AstNode = type { ptr, ptr, i32, i32, %struct.Token, i32, ptr }
%struct.Ast = type { ptr }
%struct.Symbol = type { i32, i8, i8, i8, ptr }
%struct.AVLNode = type { ptr, ptr, ptr, ptr, i32 }
%struct.Call = type { ptr, i32, ptr }

@.str = private unnamed_addr constant [38 x i8] c"initAst(): Memory allocation error in\00", align 1
@.str.1 = private unnamed_addr constant [41 x i8] c"createAstNode(): Memory allocation error\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"setAstRoot(): tree or root is NULL\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"addAstNode(): Memory allocation error\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"PROGRAM\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"PROLOG\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"CLASS\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"FUNC_LIST\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"FUNC_DECL\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"PARAM_LIST\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"FUNC_PARAM\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"BLOCK\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"DEFVAR\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"EXPR\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"ID\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"ASSIGNMENT\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"IF_STATEMENT\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"IF_BRANCH\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"ELSE_BRANCH\00", align 1
@.str.21 = private unnamed_addr constant [6 x i8] c"WHILE\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"FUNCALL\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"UNKNOWN\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.26 = private unnamed_addr constant [81 x i8] c"Program error during lexical analysis (invalid structure of the current lexeme)\0A\00", align 1
@.str.1.27 = private unnamed_addr constant [88 x i8] c"Program error during syntactic analysis (invalid program syntax, missing header, etc.)\0A\00", align 1
@.str.2.28 = private unnamed_addr constant [66 x i8] c"Semantic error in the program \E2\80\93 undefined function or variable\0A\00", align 1
@.str.3.29 = private unnamed_addr constant [115 x i8] c"Semantic error in the program \E2\80\93 redefinition of a variable or function; assignment to a non-modifiable variable\0A\00", align 1
@.str.4.30 = private unnamed_addr constant [158 x i8] c"Semantic error in the program \E2\80\93 incorrect number/type of parameters in a function call; invalid type or disallowed discarding of a function's return value\0A\00", align 1
@.str.5.31 = private unnamed_addr constant [91 x i8] c"Semantic error in the program \E2\80\93 missing/extra expression in a function return statement\0A\00", align 1
@.str.6.32 = private unnamed_addr constant [23 x i8] c"Other semantic errors\0A\00", align 1
@.str.7.33 = private unnamed_addr constant [104 x i8] c"Internal compiler error, i.e., not caused by the input program (e.g., memory allocation failure, etc.)\0A\00", align 1
@.str.8.34 = private unnamed_addr constant [43 x i8] c"The scanner tried to pop an empty string.\0A\00", align 1
@.str.9.35 = private unnamed_addr constant [52 x i8] c"The syntactic analyzer has produced an empty tree.\0A\00", align 1
@.str.10.36 = private unnamed_addr constant [40 x i8] c"The input program has no main fucntion.\00", align 1
@.str.11.37 = private unnamed_addr constant [40 x i8] c"An internal generator error has occured\00", align 1
@.str.12.38 = private unnamed_addr constant [31 x i8] c"An unknown error has occured.\0A\00", align 1
@.str.13.41 = private unnamed_addr constant [11 x i8] c"DEBUG: %s\0A\00", align 1
@unusedNum = global i32 0, align 4
@.str.42 = private unnamed_addr constant [12 x i8] c".IFJcode25\0A\00", align 1
@.str.1.43 = private unnamed_addr constant [24 x i8] c"DEFVAR GF@ifjWriteNum$\0A\00", align 1
@.str.2.44 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@star_right\0A\00", align 1
@.str.3.45 = private unnamed_addr constant [21 x i8] c"DEFVAR GF@star_left\0A\00", align 1
@.str.4.46 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@star_typeL\0A\00", align 1
@.str.5.47 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@star_typeR\0A\00", align 1
@.str.6.48 = private unnamed_addr constant [24 x i8] c"DEFVAR GF@star_counter\0A\00", align 1
@.str.7.49 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@star_str\0A\00", align 1
@.str.8.50 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@star_res\0A\00", align 1
@.str.9.51 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@strcmp$1\0A\00", align 1
@.str.10.52 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@strcmp$2\0A\00", align 1
@.str.11.53 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@index1\0A\00", align 1
@.str.12.54 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@index2\0A\00", align 1
@.str.13.55 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@index3\0A\00", align 1
@.str.14.56 = private unnamed_addr constant [15 x i8] c"DEFVAR GF@op1\0A\00", align 1
@.str.15.57 = private unnamed_addr constant [15 x i8] c"DEFVAR GF@op2\0A\00", align 1
@.str.16.58 = private unnamed_addr constant [23 x i8] c"DEFVAR GF@tmp_compare\0A\00", align 1
@.str.17.59 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@tmp_type\0A\00", align 1
@.str.18.60 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@tmp_s1\0A\00", align 1
@.str.19.61 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@tmp_s2\0A\00", align 1
@.str.20.62 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@tmp_concat\0A\00", align 1
@.str.21.63 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@trash$\0A\00", align 1
@.str.22.64 = private unnamed_addr constant [23 x i8] c"DEFVAR GF@while_expr$\0A\00", align 1
@.str.23.65 = private unnamed_addr constant [21 x i8] c"DEFVAR GF@compType$\0A\00", align 1
@.str.24.66 = private unnamed_addr constant [19 x i8] c"DEFVAR GF@return$\0A\00", align 1
@.str.25.67 = private unnamed_addr constant [15 x i8] c"DEFVAR GF@str\0A\00", align 1
@.str.26.68 = private unnamed_addr constant [17 x i8] c"DEFVAR GF@index\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"DEFVAR GF@len\0A\00", align 1
@.str.28 = private unnamed_addr constant [18 x i8] c"DEFVAR GF@$$tmp_\0A\00", align 1
@.str.29 = private unnamed_addr constant [17 x i8] c"DEFVAR GF@ascii\0A\00", align 1
@.str.30 = private unnamed_addr constant [16 x i8] c"DEFVAR GF@char\0A\00", align 1
@.str.31 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@compare$\0A\00", align 1
@.str.32 = private unnamed_addr constant [17 x i8] c"DEFVAR GF@type$\0A\00", align 1
@.str.33 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@startIndex\0A\00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"DEFVAR GF@tmp_substr\0A\00", align 1
@.str.35 = private unnamed_addr constant [21 x i8] c"DEFVAR GF@newstring\0A\00", align 1
@.str.36 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@zeroDiv$\0A\00", align 1
@.str.37 = private unnamed_addr constant [23 x i8] c"DEFVAR GF@compare$DIV\0A\00", align 1
@.str.38 = private unnamed_addr constant [20 x i8] c"DEFVAR GF@type$DIV\0A\00", align 1
@.str.39 = private unnamed_addr constant [13 x i8] c"CREATEFRAME\0A\00", align 1
@.str.40 = private unnamed_addr constant [12 x i8] c"JUMP main\0A\0A\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.42.69 = private unnamed_addr constant [12 x i8] c"EXIT int@0\0A\00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c"LABEL main\0A\00", align 1
@.str.44 = private unnamed_addr constant [11 x i8] c"PUSHFRAME\0A\00", align 1
@.str.45 = private unnamed_addr constant [10 x i8] c"LABEL %s\0A\00", align 1
@.str.46 = private unnamed_addr constant [22 x i8] c"This shouldnt happen\0A\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"POPFRAME\0A\00", align 1
@.str.48 = private unnamed_addr constant [11 x i8] c"DEFVAR %s\0A\00", align 1
@.str.49 = private unnamed_addr constant [9 x i8] c"POPS %s\0A\00", align 1
@.str.50 = private unnamed_addr constant [20 x i8] c"JUMP $$end_of_if%d\0A\00", align 1
@.str.51 = private unnamed_addr constant [18 x i8] c"LABEL $$if%d_end\0A\00", align 1
@.str.52 = private unnamed_addr constant [21 x i8] c"LABEL $$end_of_if%d\0A\00", align 1
@.str.53 = private unnamed_addr constant [21 x i8] c"LABEL while_loop$%d\0A\00", align 1
@.str.54 = private unnamed_addr constant [21 x i8] c"POPS GF@while_expr$\0A\00", align 1
@.str.55 = private unnamed_addr constant [49 x i8] c"JUMPIFNEQ while_end$%d GF@while_expr$ bool@true\0A\00", align 1
@.str.56 = private unnamed_addr constant [20 x i8] c"JUMP while_loop$%d\0A\00", align 1
@.str.57 = private unnamed_addr constant [20 x i8] c"LABEL while_end$%d\0A\00", align 1
@.str.58 = private unnamed_addr constant [15 x i8] c"PUSHS nil@nil\0A\00", align 1
@.str.59 = private unnamed_addr constant [8 x i8] c"RETURN\0A\00", align 1
@.str.60 = private unnamed_addr constant [9 x i8] c"CALL %s\0A\00", align 1
@.str.61 = private unnamed_addr constant [10 x i8] c"PUSHS %s\0A\00", align 1
@.str.62 = private unnamed_addr constant [13 x i8] c"PUSHS GF@%s\0A\00", align 1
@.str.63 = private unnamed_addr constant [17 x i8] c"PUSHS string@%s\0A\00", align 1
@.str.64 = private unnamed_addr constant [7 x i8] c"TYPES\0A\00", align 1
@.str.65 = private unnamed_addr constant [19 x i8] c"POPS GF@compType$\0A\00", align 1
@.str.66 = private unnamed_addr constant [49 x i8] c"JUMPIFEQ rightType$%i string@float GF@compType$\0A\00", align 1
@.str.67 = private unnamed_addr constant [18 x i8] c"PUSHS bool@false\0A\00", align 1
@.str.68 = private unnamed_addr constant [15 x i8] c"JUMP endIS$%i\0A\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c"LABEL rightType$%i\0A\00", align 1
@.str.70 = private unnamed_addr constant [17 x i8] c"PUSHS bool@true\0A\00", align 1
@.str.71 = private unnamed_addr constant [16 x i8] c"LABEL endIF$%i\0A\00", align 1
@.str.72 = private unnamed_addr constant [50 x i8] c"JUMPIFEQ rightType$%i string@string GF@compType$\0A\00", align 1
@.str.73 = private unnamed_addr constant [47 x i8] c"JUMPIFEQ rightType$%i string@nil GF@compType$\0A\00", align 1
@.str.74 = private unnamed_addr constant [12 x i8] c"EXIT int@6\0A\00", align 1
@.str.75 = private unnamed_addr constant [16 x i8] c"PUSHS float@%a\0A\00", align 1
@.str.76 = private unnamed_addr constant [16 x i8] c"POPS GF@tmp_s1\0A\00", align 1
@.str.77 = private unnamed_addr constant [16 x i8] c"POPS GF@tmp_s2\0A\00", align 1
@.str.78 = private unnamed_addr constant [28 x i8] c"TYPE GF@tmp_type GF@tmp_s1\0A\00", align 1
@.str.79 = private unnamed_addr constant [52 x i8] c"JUMPIFEQ RuntimeErrorNil$%i string@nil GF@tmp_type\0A\00", align 1
@.str.80 = private unnamed_addr constant [53 x i8] c"JUMPIFEQ RuntimeErrorNil$%i string@bool GF@tmp_type\0A\00", align 1
@.str.81 = private unnamed_addr constant [28 x i8] c"TYPE GF@tmp_type GF@tmp_s2\0A\00", align 1
@.str.82 = private unnamed_addr constant [52 x i8] c"JUMPIFEQ secondString$%i string@string GF@tmp_type\0A\00", align 1
@.str.83 = private unnamed_addr constant [55 x i8] c"JUMPIFEQ RuntimeErrorNil$%i string@string GF@tmp_type\0A\00", align 1
@.str.84 = private unnamed_addr constant [17 x i8] c"PUSHS GF@tmp_s2\0A\00", align 1
@.str.85 = private unnamed_addr constant [17 x i8] c"PUSHS GF@tmp_s1\0A\00", align 1
@.str.86 = private unnamed_addr constant [6 x i8] c"ADDS\0A\00", align 1
@.str.87 = private unnamed_addr constant [19 x i8] c"JUMP EndConcat$%i\0A\00", align 1
@.str.88 = private unnamed_addr constant [23 x i8] c"LABEL secondString$%i\0A\00", align 1
@.str.89 = private unnamed_addr constant [56 x i8] c"JUMPIFNEQ RuntimeErrorNil$%i string@string GF@tmp_type\0A\00", align 1
@.str.90 = private unnamed_addr constant [42 x i8] c"CONCAT GF@tmp_concat GF@tmp_s2 GF@tmp_s1\0A\00", align 1
@.str.91 = private unnamed_addr constant [21 x i8] c"PUSHS GF@tmp_concat\0A\00", align 1
@.str.92 = private unnamed_addr constant [19 x i8] c"LABEL Addition$%i\0A\00", align 1
@.str.93 = private unnamed_addr constant [26 x i8] c"LABEL RuntimeErrorNil$%i\0A\00", align 1
@.str.94 = private unnamed_addr constant [13 x i8] c"EXIT int@26\0A\00", align 1
@.str.95 = private unnamed_addr constant [20 x i8] c"LABEL EndConcat$%i\0A\00", align 1
@.str.96 = private unnamed_addr constant [6 x i8] c"SUBS\0A\00", align 1
@.str.97 = private unnamed_addr constant [20 x i8] c"POPS GF@star_right\0A\00", align 1
@.str.98 = private unnamed_addr constant [19 x i8] c"POPS GF@star_left\0A\00", align 1
@.str.99 = private unnamed_addr constant [34 x i8] c"TYPE GF@star_typeR GF@star_right\0A\00", align 1
@.str.100 = private unnamed_addr constant [45 x i8] c"JUMPIFEQ isOK$%d GF@star_typeR string@float\0A\00", align 1
@.str.101 = private unnamed_addr constant [43 x i8] c"JUMPIFEQ isOK$%i GF@star_typeR string@int\0A\00", align 1
@.str.102 = private unnamed_addr constant [15 x i8] c"LABEL isOK$%d\0A\00", align 1
@.str.103 = private unnamed_addr constant [33 x i8] c"TYPE GF@star_typeL GF@star_left\0A\00", align 1
@.str.104 = private unnamed_addr constant [51 x i8] c"JUMPIFEQ strConcat$%i GF@star_typeL string@string\0A\00", align 1
@.str.105 = private unnamed_addr constant [45 x i8] c"JUMPIFNEQ multi$%d GF@star_typeL string@nil\0A\00", align 1
@.str.106 = private unnamed_addr constant [16 x i8] c"LABEL multi$%d\0A\00", align 1
@.str.107 = private unnamed_addr constant [44 x i8] c"MUL GF@star_res GF@star_right GF@star_left\0A\00", align 1
@.str.108 = private unnamed_addr constant [19 x i8] c"PUSHS GF@star_res\0A\00", align 1
@.str.109 = private unnamed_addr constant [17 x i8] c"JUMP endStar$%i\0A\00", align 1
@.str.110 = private unnamed_addr constant [20 x i8] c"LABEL strConcat$%i\0A\00", align 1
@.str.111 = private unnamed_addr constant [36 x i8] c"MOVE GF@star_counter GF@star_right\0A\00", align 1
@.str.112 = private unnamed_addr constant [37 x i8] c"ISINT GF@star_typeR GF@star_counter\0A\00", align 1
@.str.113 = private unnamed_addr constant [48 x i8] c"JUMPIFEQ errorCode$%i bool@false GF@star_typeR\0A\00", align 1
@.str.114 = private unnamed_addr constant [31 x i8] c"MOVE GF@star_str GF@star_left\0A\00", align 1
@.str.115 = private unnamed_addr constant [30 x i8] c"MOVE GF@star_res GF@star_str\0A\00", align 1
@.str.116 = private unnamed_addr constant [20 x i8] c"LABEL star_loop$%d\0A\00", align 1
@.str.117 = private unnamed_addr constant [23 x i8] c"PUSHS GF@star_counter\0A\00", align 1
@.str.118 = private unnamed_addr constant [20 x i8] c"PUSHS float@0x1p+0\0A\00", align 1
@.str.119 = private unnamed_addr constant [5 x i8] c"GTS\0A\00", align 1
@.str.120 = private unnamed_addr constant [25 x i8] c"JUMPIFNEQS star_done$%d\0A\00", align 1
@.str.121 = private unnamed_addr constant [44 x i8] c"CONCAT GF@star_res GF@star_res GF@star_str\0A\00", align 1
@.str.122 = private unnamed_addr constant [50 x i8] c"SUB GF@star_counter GF@star_counter float@0x1p+0\0A\00", align 1
@.str.123 = private unnamed_addr constant [19 x i8] c"JUMP star_loop$%d\0A\00", align 1
@.str.124 = private unnamed_addr constant [20 x i8] c"LABEL star_done$%d\0A\00", align 1
@.str.125 = private unnamed_addr constant [20 x i8] c"LABEL errorCode$%d\0A\00", align 1
@.str.126 = private unnamed_addr constant [18 x i8] c"LABEL endStar$%i\0A\00", align 1
@.str.127 = private unnamed_addr constant [18 x i8] c"POPS GF@zeroDiv$\0A\00", align 1
@.str.128 = private unnamed_addr constant [47 x i8] c"JUMPIFNEQ notZero$%i GF@zeroDiv$ float@0x0p+0\0A\00", align 1
@.str.129 = private unnamed_addr constant [18 x i8] c"LABEL notZero$%i\0A\00", align 1
@.str.130 = private unnamed_addr constant [19 x i8] c"PUSHS GF@zeroDiv$\0A\00", align 1
@.str.131 = private unnamed_addr constant [21 x i8] c"POPS GF@compare$DIV\0A\00", align 1
@.str.132 = private unnamed_addr constant [33 x i8] c"TYPE GF@type$DIV GF@compare$DIV\0A\00", align 1
@.str.133 = private unnamed_addr constant [22 x i8] c"PUSHS GF@compare$DIV\0A\00", align 1
@.str.134 = private unnamed_addr constant [43 x i8] c"JUMPIFEQ intDiv$%i string@int GF@type$DIV\0A\00", align 1
@.str.135 = private unnamed_addr constant [6 x i8] c"DIVS\0A\00", align 1
@.str.136 = private unnamed_addr constant [19 x i8] c"JUMP ENDintDiv$%i\0A\00", align 1
@.str.137 = private unnamed_addr constant [17 x i8] c"LABEL intDiv$%i\0A\00", align 1
@.str.138 = private unnamed_addr constant [7 x i8] c"IDIVS\0A\00", align 1
@.str.139 = private unnamed_addr constant [20 x i8] c"LABEL ENDintDiv$%i\0A\00", align 1
@.str.140 = private unnamed_addr constant [5 x i8] c"LTS\0A\00", align 1
@.str.141 = private unnamed_addr constant [6 x i8] c"NOTS\0A\00", align 1
@.str.142 = private unnamed_addr constant [5 x i8] c"EQS\0A\00", align 1
@.str.143 = private unnamed_addr constant [14 x i8] c"DEFVAR GF@%s\0A\00", align 1
@.str.144 = private unnamed_addr constant [12 x i8] c"POPS GF@%s\0A\00", align 1
@.str.145 = private unnamed_addr constant [17 x i8] c"POPS GF@return$\0A\00", align 1
@.str.146 = private unnamed_addr constant [20 x i8] c"MOVE %s GF@return$\0A\00", align 1
@.str.147 = private unnamed_addr constant [23 x i8] c"JUMPIFNEQS $$if%d_end\0A\00", align 1
@.str.148 = private unnamed_addr constant [21 x i8] c"JUMPIFEQS isNull$%d\0A\00", align 1
@.str.149 = private unnamed_addr constant [19 x i8] c"JUMP endIfExpr$%d\0A\00", align 1
@.str.150 = private unnamed_addr constant [17 x i8] c"LABEL isNull$%d\0A\00", align 1
@.str.151 = private unnamed_addr constant [20 x i8] c"LABEL endIfExpr$%d\0A\00", align 1
@.str.152 = private unnamed_addr constant [24 x i8] c"JUMPIFNEQS $$if%d_end \0A\00", align 1
@funcNames = internal constant [11 x %struct.ifjFunction] [%struct.ifjFunction { ptr @.str.247, i32 0 }, %struct.ifjFunction { ptr @.str.248, i32 1 }, %struct.ifjFunction { ptr @.str.249, i32 2 }, %struct.ifjFunction { ptr @.str.250, i32 3 }, %struct.ifjFunction { ptr @.str.251, i32 4 }, %struct.ifjFunction { ptr @.str.252, i32 5 }, %struct.ifjFunction { ptr @.str.253, i32 6 }, %struct.ifjFunction { ptr @.str.254, i32 7 }, %struct.ifjFunction { ptr @.str.255, i32 8 }, %struct.ifjFunction { ptr @.str.256, i32 9 }, %struct.ifjFunction { ptr null, i32 10 }], align 8
@.str.153 = private unnamed_addr constant [16 x i8] c"READ %s string\0A\00", align 1
@.str.154 = private unnamed_addr constant [15 x i8] c"READ %s float\0A\00", align 1
@.str.155 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.156 = private unnamed_addr constant [5 x i8] c"null\00", align 1
@.str.157 = private unnamed_addr constant [4 x i8] c"nil\00", align 1
@.str.158 = private unnamed_addr constant [15 x i8] c"WRITE nil@nil\0A\00", align 1
@.str.159 = private unnamed_addr constant [17 x i8] c"WRITE string@%s\0A\00", align 1
@.str.160 = private unnamed_addr constant [15 x i8] c"WRITE int@%ld\0A\00", align 1
@.str.161 = private unnamed_addr constant [16 x i8] c"WRITE float@%a\0A\00", align 1
@.str.162 = private unnamed_addr constant [21 x i8] c"PUSHS string@string\0A\00", align 1
@.str.163 = private unnamed_addr constant [27 x i8] c"JUMPIFEQS write_string$%d\0A\00", align 1
@.str.164 = private unnamed_addr constant [18 x i8] c"PUSHS string@int\0A\00", align 1
@.str.165 = private unnamed_addr constant [24 x i8] c"JUMPIFEQS write_int$%d\0A\00", align 1
@.str.166 = private unnamed_addr constant [8 x i8] c"ISINTS\0A\00", align 1
@.str.167 = private unnamed_addr constant [27 x i8] c"JUMPIFNEQS write_float$%d\0A\00", align 1
@.str.168 = private unnamed_addr constant [12 x i8] c"FLOAT2INTS\0A\00", align 1
@.str.169 = private unnamed_addr constant [22 x i8] c"POPS GF@ifjWriteNum$\0A\00", align 1
@.str.170 = private unnamed_addr constant [23 x i8] c"WRITE GF@ifjWriteNum$\0A\00", align 1
@.str.171 = private unnamed_addr constant [19 x i8] c"JUMP write_end$%d\0A\00", align 1
@.str.172 = private unnamed_addr constant [23 x i8] c"LABEL write_string$%d\0A\00", align 1
@.str.173 = private unnamed_addr constant [10 x i8] c"WRITE %s\0A\00", align 1
@.str.174 = private unnamed_addr constant [20 x i8] c"LABEL write_int$%d\0A\00", align 1
@.str.175 = private unnamed_addr constant [22 x i8] c"LABEL write_float$%d\0A\00", align 1
@.str.176 = private unnamed_addr constant [20 x i8] c"LABEL write_end$%d\0A\00", align 1
@.str.177 = private unnamed_addr constant [13 x i8] c"WRITE GF@%s\0A\00", align 1
@.str.178 = private unnamed_addr constant [20 x i8] c"we here dumbass %d\0A\00", align 1
@.str.179 = private unnamed_addr constant [18 x i8] c"POPS GF@compare$\0A\00", align 1
@.str.180 = private unnamed_addr constant [27 x i8] c"TYPE GF@type$ GF@compare$\0A\00", align 1
@.str.181 = private unnamed_addr constant [41 x i8] c"JUMPIFEQ int2str$%i string@int GF@type$\0A\00", align 1
@.str.182 = private unnamed_addr constant [12 x i8] c"FLOAT2STRS\0A\00", align 1
@.str.183 = private unnamed_addr constant [16 x i8] c"JUMP endStr$%i\0A\00", align 1
@.str.184 = private unnamed_addr constant [18 x i8] c"LABEL int2str$%i\0A\00", align 1
@.str.185 = private unnamed_addr constant [10 x i8] c"INT2STRS\0A\00", align 1
@.str.186 = private unnamed_addr constant [17 x i8] c"LABEL endStr$%i\0A\00", align 1
@.str.187 = private unnamed_addr constant [14 x i8] c"STRLEN %s %s\0A\00", align 1
@.str.188 = private unnamed_addr constant [23 x i8] c"MOVE GF@startIndex %s\0A\00", align 1
@.str.189 = private unnamed_addr constant [36 x i8] c"SUB GF@startIndex GF@startIndex %s\0A\00", align 1
@.str.190 = private unnamed_addr constant [28 x i8] c"MOVE GF@tmp_substr string@\0A\00", align 1
@.str.191 = private unnamed_addr constant [21 x i8] c"LABEL $$substr_loop\0A\00", align 1
@.str.192 = private unnamed_addr constant [43 x i8] c"JUMPIFEQ $$substr_end GF@startIndex int@0\0A\00", align 1
@.str.193 = private unnamed_addr constant [40 x i8] c"GETCHAR GF@tmp_substr %s GF@startIndex\0A\00", align 1
@.str.194 = private unnamed_addr constant [38 x i8] c"CONCAT GF@newstring GF@tmp_substr %s\0A\00", align 1
@.str.195 = private unnamed_addr constant [39 x i8] c"SUB GF@startIndex GF@startIndex int@1\0A\00", align 1
@.str.196 = private unnamed_addr constant [20 x i8] c"JUMP $$substr_loop\0A\00", align 1
@.str.197 = private unnamed_addr constant [20 x i8] c"LABEL $$substr_end\0A\00", align 1
@.str.198 = private unnamed_addr constant [20 x i8] c"PUSHS GF@newstring\0A\00", align 1
@.str.199 = private unnamed_addr constant [22 x i8] c"MOVE %s GF@newstring\0A\00", align 1
@.str.200 = private unnamed_addr constant [23 x i8] c"MOVE GF@op1 string@%s\0A\00", align 1
@.str.201 = private unnamed_addr constant [16 x i8] c"MOVE GF@op1 %s\0A\00", align 1
@.str.202 = private unnamed_addr constant [23 x i8] c"MOVE GF@op2 string@%s\0A\00", align 1
@.str.203 = private unnamed_addr constant [16 x i8] c"MOVE GF@op2 %s\0A\00", align 1
@.str.204 = private unnamed_addr constant [25 x i8] c"STRLEN GF@index1 GF@op1\0A\00", align 1
@.str.205 = private unnamed_addr constant [25 x i8] c"STRLEN GF@index2 GF@op2\0A\00", align 1
@.str.206 = private unnamed_addr constant [43 x i8] c"JUMPIFEQ $$strcmp_cmp GF@index1 GF@index2\0A\00", align 1
@.str.207 = private unnamed_addr constant [34 x i8] c"LT GF@index3 GF@index1 GF@index2\0A\00", align 1
@.str.208 = private unnamed_addr constant [41 x i8] c"JUMPIFEQ $$strcmp_1 GF@index3 bool@true\0A\00", align 1
@.str.209 = private unnamed_addr constant [18 x i8] c"LABEL $$strcmp_l\0A\00", align 1
@.str.210 = private unnamed_addr constant [16 x i8] c"MOVE %s int@-1\0A\00", align 1
@.str.211 = private unnamed_addr constant [19 x i8] c"JUMP $$strcmp_end\0A\00", align 1
@.str.212 = private unnamed_addr constant [18 x i8] c"LABEL $$strcmp_g\0A\00", align 1
@.str.213 = private unnamed_addr constant [15 x i8] c"MOVE %s int@1\0A\00", align 1
@.str.214 = private unnamed_addr constant [20 x i8] c"LABEL $$strcmp_cmp\0A\00", align 1
@.str.215 = private unnamed_addr constant [22 x i8] c"MOVE GF@index1 int@0\0A\00", align 1
@.str.216 = private unnamed_addr constant [21 x i8] c"LABEL $$strcmp_loop\0A\00", align 1
@.str.217 = private unnamed_addr constant [39 x i8] c"STRI2INT GF@strcmp$1 GF@op1 GF@index1\0A\00", align 1
@.str.218 = private unnamed_addr constant [39 x i8] c"STRI2INT GF@strcmp$2 GF@op2 GF@index1\0A\00", align 1
@.str.219 = private unnamed_addr constant [48 x i8] c"JUMPIFNEQ $$strcmp_neq GF@strcmp$1 GF@strcmp$2\0A\00", align 1
@.str.220 = private unnamed_addr constant [42 x i8] c"JUMPIFEQ $$strcmp_eq GF@index1 GF@index2\0A\00", align 1
@.str.221 = private unnamed_addr constant [31 x i8] c"ADD GF@index1 GF@index1 int@1\0A\00", align 1
@.str.222 = private unnamed_addr constant [20 x i8] c"JUMP $$strcmp_loop\0A\00", align 1
@.str.223 = private unnamed_addr constant [20 x i8] c"LABEL $$strcmp_neq\0A\00", align 1
@.str.224 = private unnamed_addr constant [38 x i8] c"LT GF@index1 GF@strcmp$1 GF@strcmp$2\0A\00", align 1
@.str.225 = private unnamed_addr constant [41 x i8] c"JUMPIFEQ $$strcmp_l GF@index1 bool@true\0A\00", align 1
@.str.226 = private unnamed_addr constant [17 x i8] c"JUMP $$strcmp_g\0A\00", align 1
@.str.227 = private unnamed_addr constant [19 x i8] c"LABEL $$strcmp_eq\0A\00", align 1
@.str.228 = private unnamed_addr constant [15 x i8] c"MOVE %s int@0\0A\00", align 1
@.str.229 = private unnamed_addr constant [20 x i8] c"LABEL $$strcmp_end\0A\00", align 1
@.str.230 = private unnamed_addr constant [23 x i8] c"MOVE GF@str string@%s\0A\00", align 1
@.str.231 = private unnamed_addr constant [16 x i8] c"MOVE GF@str %s\0A\00", align 1
@.str.232 = private unnamed_addr constant [22 x i8] c"MOVE GF@index int@%s\0A\00", align 1
@.str.233 = private unnamed_addr constant [18 x i8] c"MOVE GF@index %s\0A\00", align 1
@.str.234 = private unnamed_addr constant [22 x i8] c"STRLEN GF@len GF@str\0A\00", align 1
@.str.235 = private unnamed_addr constant [33 x i8] c"JUMPIFEQ $$ord_err GF@len int@0\0A\00", align 1
@.str.236 = private unnamed_addr constant [29 x i8] c"LT GF@$$tmp_ GF@index int@0\0A\00", align 1
@.str.237 = private unnamed_addr constant [40 x i8] c"JUMPIFEQ $$ord_err GF@$$tmp_ bool@true\0A\00", align 1
@.str.238 = private unnamed_addr constant [30 x i8] c"GT GF@$$tmp_ GF@index GF@len\0A\00", align 1
@.str.239 = private unnamed_addr constant [33 x i8] c"GETCHAR GF@char GF@str GF@index\0A\00", align 1
@.str.240 = private unnamed_addr constant [35 x i8] c"STRI2INT GF@ascii GF@str GF@index\0A\00", align 1
@.str.241 = private unnamed_addr constant [18 x i8] c"MOVE %s GF@ascii\0A\00", align 1
@.str.242 = private unnamed_addr constant [16 x i8] c"JUMP $$ord_end\0A\00", align 1
@.str.243 = private unnamed_addr constant [17 x i8] c"LABEL $$ord_err\0A\00", align 1
@.str.244 = private unnamed_addr constant [17 x i8] c"LABEL $$ord_end\0A\00", align 1
@.str.245 = private unnamed_addr constant [14 x i8] c"PUSHS int@%s\0A\00", align 1
@.str.246 = private unnamed_addr constant [11 x i8] c"INT2CHARS\0A\00", align 1
@.str.247 = private unnamed_addr constant [13 x i8] c"Ifj.read_str\00", align 1
@.str.248 = private unnamed_addr constant [13 x i8] c"Ifj.read_num\00", align 1
@.str.249 = private unnamed_addr constant [10 x i8] c"Ifj.write\00", align 1
@.str.250 = private unnamed_addr constant [10 x i8] c"Ifj.floor\00", align 1
@.str.251 = private unnamed_addr constant [8 x i8] c"Ifj.str\00", align 1
@.str.252 = private unnamed_addr constant [11 x i8] c"Ifj.length\00", align 1
@.str.253 = private unnamed_addr constant [14 x i8] c"Ifj.substring\00", align 1
@.str.254 = private unnamed_addr constant [11 x i8] c"Ifj.strcmp\00", align 1
@.str.255 = private unnamed_addr constant [8 x i8] c"Ifj.ord\00", align 1
@.str.256 = private unnamed_addr constant [8 x i8] c"Ifj.chr\00", align 1
@bufferFull = internal global i8 0, align 1
@bufferToken = internal global %struct.Token zeroinitializer, align 8
@.str.257 = private unnamed_addr constant [18 x i8] c"Lexical error: %s\00", align 1
@eolAllowance = internal global i32 1, align 4
@lineNumber = internal global i32 0, align 4
@.str.1.258 = private unnamed_addr constant [15 x i8] c"unexpected EOL\00", align 1
@.str.2.259 = private unnamed_addr constant [13 x i8] c"expected EOL\00", align 1
@.str.3.260 = private unnamed_addr constant [37 x i8] c"token: %d, value: %s, tokenLine: %d\0A\00", align 1
@.str.4.261 = private unnamed_addr constant [16 x i8] c"lineNumber: %d\0A\00", align 1
@prevLine = internal global i32 0, align 4
@prolog = internal global i8 0, align 1
@.str.5.262 = private unnamed_addr constant [11 x i8] c"token: %s\0A\00", align 1
@.str.6.263 = private unnamed_addr constant [5 x i8] c"Ifj.\00", align 1
@.str.7.264 = private unnamed_addr constant [36 x i8] c"addPrefix: Memmory allocation error\00", align 1
@.str.8.265 = private unnamed_addr constant [34 x i8] c"typeToTableId: Index out of range\00", align 1
@stack = internal global %struct.AstNodeStack zeroinitializer, align 8
@.str.9.266 = private unnamed_addr constant [33 x i8] c"reduce: did not found < on stack\00", align 1
@.str.10.267 = private unnamed_addr constant [10 x i8] c"REDUCE ID\00", align 1
@.str.11.268 = private unnamed_addr constant [25 x i8] c"REDUCE: UNDEFINED SYMBOL\00", align 1
@.str.12.269 = private unnamed_addr constant [22 x i8] c"Undefined symbol: %s\0A\00", align 1
@.str.13.270 = private unnamed_addr constant [33 x i8] c"TOKEN TO GET TYPE: %s, type: %d\0A\00", align 1
@.str.14.271 = private unnamed_addr constant [13 x i8] c"REDUCE PAREN\00", align 1
@.str.15.272 = private unnamed_addr constant [14 x i8] c"REDUCE BINARY\00", align 1
@.str.16.273 = private unnamed_addr constant [24 x i8] c"value0: %s, value1: %s\0A\00", align 1
@.str.17.274 = private unnamed_addr constant [13 x i8] c"OPERAND: %d\0A\00", align 1
@.str.18.275 = private unnamed_addr constant [47 x i8] c"Wrong left operand type for \22is\22 operator: %s\0A\00", align 1
@.str.19.276 = private unnamed_addr constant [56 x i8] c"Wrong operands type for \22+\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.20.277 = private unnamed_addr constant [15 x i8] c"Division by 0\0A\00", align 1
@.str.21.278 = private unnamed_addr constant [56 x i8] c"Wrong operands type for \22-\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.22.279 = private unnamed_addr constant [56 x i8] c"Wrong operands type for \22/\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.23.280 = private unnamed_addr constant [56 x i8] c"Wrong operands type for \22<\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.24.281 = private unnamed_addr constant [56 x i8] c"Wrong operands type for \22>\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.25.282 = private unnamed_addr constant [57 x i8] c"Wrong operands type for \22<=\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.26.283 = private unnamed_addr constant [57 x i8] c"Wrong operands type for \22>=\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.27.284 = private unnamed_addr constant [57 x i8] c"Wrong operands type for \22==\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.28.285 = private unnamed_addr constant [57 x i8] c"Wrong operands type for \22!=\22 operator: %s - %d, %s - %d\0A\00", align 1
@.str.29.286 = private unnamed_addr constant [24 x i8] c"Expression parser error\00", align 1
@.str.30.289 = private unnamed_addr constant [13 x i8] c"Expected EOF\00", align 1
@.str.31.290 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.32.291 = private unnamed_addr constant [31 x i8] c"Main() function is not defined\00", align 1
@.str.33.329 = private unnamed_addr constant [8 x i8] c"%d: %d\0A\00", align 1
@.str.34.333 = private unnamed_addr constant [35 x i8] c"parseProlog(): Expected TOK_IMPORT\00", align 1
@.str.35.334 = private unnamed_addr constant [6 x i8] c"ifj25\00", align 1
@.str.36.335 = private unnamed_addr constant [54 x i8] c"parseProlog(): Expected TOK_STRING with value \22ifj25\22\00", align 1
@.str.37.336 = private unnamed_addr constant [32 x i8] c"parseProlog(): Expected TOK_FOR\00", align 1
@.str.38.337 = private unnamed_addr constant [32 x i8] c"parseProlog(): Expected TOK_IFJ\00", align 1
@.str.39.292 = private unnamed_addr constant [33 x i8] c"parseClass(): Expected TOK_CLASS\00", align 1
@.str.40.293 = private unnamed_addr constant [8 x i8] c"Program\00", align 1
@.str.41.294 = private unnamed_addr constant [53 x i8] c"parseClass(): Expected TOK_NAME with value \22Program\22\00", align 1
@.str.42.295 = private unnamed_addr constant [40 x i8] c"parseClass(): Expected TOK_LEFT_BRACKET\00", align 1
@.str.43.296 = private unnamed_addr constant [41 x i8] c"parseClass(): Expected TOK_RIGHT_BRACKET\00", align 1
@.str.44.297 = private unnamed_addr constant [37 x i8] c"parseFuncDecl(): Expected TOK_STATIC\00", align 1
@.str.45.298 = private unnamed_addr constant [35 x i8] c"parseFuncDecl(): Expected TOK_NAME\00", align 1
@.str.46.299 = private unnamed_addr constant [60 x i8] c"parseFuncDecl: setter: Unexpected token: %s, expected '='.\0A\00", align 1
@.str.47.300 = private unnamed_addr constant [61 x i8] c"parseFuncDecl: setter: Unexpected token: %s, expected: '('.\0A\00", align 1
@.str.48.301 = private unnamed_addr constant [66 x i8] c"parseFuncDecl: setter: Unexpected token: %s, expected: TOK_NAME.\0A\00", align 1
@.str.49.302 = private unnamed_addr constant [60 x i8] c"parseFuncDecl: setter: Unexpected token: %s, expected: ')'\0A\00", align 1
@.str.50.303 = private unnamed_addr constant [37 x i8] c"parseFuncDecl: Unexpected token: %s\0A\00", align 1
@.str.51.307 = private unnamed_addr constant [40 x i8] c"parseBlock(): Expected TOK_LEFT_BRACKET\00", align 1
@.str.52.308 = private unnamed_addr constant [21 x i8] c"parseBlock(): switch\00", align 1
@.str.53.332 = private unnamed_addr constant [33 x i8] c"parseDefVar(): Expected TOK_NAME\00", align 1
@sentinelNode = internal global %struct.AstNode { ptr null, ptr null, i32 0, i32 0, %struct.Token { i32 4, ptr null, i32 0, i32 0, i32 0, %union.dataU zeroinitializer }, i32 0, ptr null }, align 8
@.str.54.309 = private unnamed_addr constant [20 x i8] c"precedence[%d][%d]\0A\00", align 1
@precedenceTable = internal constant [15 x [15 x i8]] [[15 x i8] c">><<>>>>>>>><><", [15 x i8] c">><<>>>>>>>><><", [15 x i8] c">>>>>>>>>>>><><", [15 x i8] c">>>>>>>>>>>><><", [15 x i8] c"<<<< <<<<<<<< <", [15 x i8] c"<<<<><<<<<>><><", [15 x i8] c"<<<<>>>>>>>><><", [15 x i8] c"<<<<>>>>>>>><><", [15 x i8] c"<<<<>>>>>>>><><", [15 x i8] c"<<<<>>>>>>>><><", [15 x i8] c"<<<<><<<<<>><><", [15 x i8] c"<<<<><<<<<>><><", [15 x i8] c"<<<< <<<<<<<<=<", [15 x i8] c">>>>>>>>>>>> > ", [15 x i8] c">>>>>>>>>>>> >>"], align 1
@.str.55.310 = private unnamed_addr constant [21 x i8] c"precedence char: %c\0A\00", align 1
@.str.56.311 = private unnamed_addr constant [7 x i8] c"\0A\0A%d\0A\0A\00", align 1
@.str.57.312 = private unnamed_addr constant [51 x i8] c"Expected EOL at the end of an expression after ')'\00", align 1
@precedenceOpenNode = internal global %struct.AstNode { ptr null, ptr null, i32 0, i32 0, %struct.Token { i32 55, ptr null, i32 0, i32 0, i32 0, %union.dataU zeroinitializer }, i32 0, ptr null }, align 8
@.str.58.313 = private unnamed_addr constant [52 x i8] c"Expected EOL at the end of an expression after 'id'\00", align 1
@.str.59.314 = private unnamed_addr constant [15 x i8] c"stacksize: %d\0A\00", align 1
@.str.60.315 = private unnamed_addr constant [16 x i8] c"\0AcurrToken: %s\0A\00", align 1
@.str.61.316 = private unnamed_addr constant [16 x i8] c"precedence: %c\0A\00", align 1
@.str.62.317 = private unnamed_addr constant [43 x i8] c"parseExpr: Unexpected precedence character\00", align 1
@.str.63.318 = private unnamed_addr constant [24 x i8] c"parseExpr: parse failed\00", align 1
@.str.64.319 = private unnamed_addr constant [10 x i8] c"Ifj.floor\00", align 1
@.str.65.320 = private unnamed_addr constant [11 x i8] c"Ifj.length\00", align 1
@.str.66.321 = private unnamed_addr constant [14 x i8] c"Ifj.substring\00", align 1
@.str.67.322 = private unnamed_addr constant [11 x i8] c"Ifj.strcmp\00", align 1
@.str.68.323 = private unnamed_addr constant [8 x i8] c"Ifj.ord\00", align 1
@.str.69.324 = private unnamed_addr constant [8 x i8] c"Ifj.chr\00", align 1
@.str.70.325 = private unnamed_addr constant [13 x i8] c"Ifj.read_str\00", align 1
@.str.71.326 = private unnamed_addr constant [13 x i8] c"Ifj.read_num\00", align 1
@.str.72.327 = private unnamed_addr constant [10 x i8] c"Ifj.write\00", align 1
@.str.73.328 = private unnamed_addr constant [8 x i8] c"Ifj.str\00", align 1
@__const.isBuiltInFunc.builtInF = private unnamed_addr constant [11 x ptr] [ptr @.str.70.325, ptr @.str.71.326, ptr @.str.72.327, ptr @.str.65.320, ptr @.str.68.323, ptr @.str.69.324, ptr @.str.66.321, ptr @.str.64.319, ptr @.str.73.328, ptr @.str.67.322, ptr null], align 8
@.str.74.331 = private unnamed_addr constant [30 x i8] c"parseAssignment: expected '='\00", align 1
@.str.75.330 = private unnamed_addr constant [39 x i8] c"parseIfBranch: Expected TOK_LEFT_PAREN\00", align 1
@pendingParams = internal global ptr null, align 8
@pendingParamCount = internal global i32 0, align 4
@.str.76.304 = private unnamed_addr constant [48 x i8] c"parseParamList(): Expected TOK_NAME after comma\00", align 1
@.str.77.305 = private unnamed_addr constant [55 x i8] c"parseParamList(): Expected TOK_NAME or TOK_RIGHT_PAREN\00", align 1
@.str.78.306 = private unnamed_addr constant [56 x i8] c"parseParamList(): Expected TOK_COMMA or TOK_RIGHT_PAREN\00", align 1
@storeChar = internal global i8 1, align 1
@__stdinp = external global ptr, align 8
@depth = internal global i32 0, align 4
@CURRENTLINE = internal global i32 1, align 4
@.str.360 = private unnamed_addr constant [65 x i8] c"value out of range in HEX representation of symbol, on line: %d\0A\00", align 1
@keywords = internal constant [21 x %struct.ifjFunction] [%struct.ifjFunction { ptr @.str.2.340, i32 30 }, %struct.ifjFunction { ptr @.str.3.341, i32 31 }, %struct.ifjFunction { ptr @.str.4.342, i32 32 }, %struct.ifjFunction { ptr @.str.5.343, i32 5 }, %struct.ifjFunction { ptr @.str.6.344, i32 50 }, %struct.ifjFunction { ptr @.str.7.345, i32 45 }, %struct.ifjFunction { ptr @.str.8.346, i32 40 }, %struct.ifjFunction { ptr @.str.9.347, i32 42 }, %struct.ifjFunction { ptr @.str.10.348, i32 36 }, %struct.ifjFunction { ptr @.str.11.349, i32 28 }, %struct.ifjFunction { ptr @.str.12.350, i32 41 }, %struct.ifjFunction { ptr @.str.13.351, i32 34 }, %struct.ifjFunction { ptr @.str.14.352, i32 33 }, %struct.ifjFunction { ptr @.str.15.353, i32 44 }, %struct.ifjFunction { ptr @.str.16.354, i32 43 }, %struct.ifjFunction { ptr @.str.17.355, i32 29 }, %struct.ifjFunction { ptr @.str.18.356, i32 35 }, %struct.ifjFunction { ptr @.str.19.357, i32 37 }, %struct.ifjFunction { ptr @.str.20.358, i32 38 }, %struct.ifjFunction { ptr @.str.21.359, i32 39 }, %struct.ifjFunction zeroinitializer], align 8
@.str.1.361 = private unnamed_addr constant [42 x i8] c"Token value exceeds maximum length (%d).\0A\00", align 1
@.str.2.340 = private unnamed_addr constant [6 x i8] c"class\00", align 1
@.str.3.341 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.4.342 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.5.343 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.6.344 = private unnamed_addr constant [5 x i8] c"null\00", align 1
@.str.7.345 = private unnamed_addr constant [5 x i8] c"Null\00", align 1
@.str.8.346 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.9.347 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@.str.10.348 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.11.349 = private unnamed_addr constant [4 x i8] c"Ifj\00", align 1
@.str.12.350 = private unnamed_addr constant [7 x i8] c"static\00", align 1
@.str.13.351 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.14.352 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.15.353 = private unnamed_addr constant [4 x i8] c"Num\00", align 1
@.str.16.354 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.17.355 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@.str.18.356 = private unnamed_addr constant [4 x i8] c"for\00", align 1
@.str.19.357 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@.str.20.358 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str.21.359 = private unnamed_addr constant [3 x i8] c"in\00", align 1
@semStack = common global %struct.AstNodeStack zeroinitializer, align 8
@.str.368 = private unnamed_addr constant [13 x i8] c"Ifj.read_str\00", align 1
@.str.1.369 = private unnamed_addr constant [13 x i8] c"Ifj.read_num\00", align 1
@.str.2.370 = private unnamed_addr constant [10 x i8] c"Ifj.write\00", align 1
@.str.3.371 = private unnamed_addr constant [11 x i8] c"Ifj.length\00", align 1
@.str.4.372 = private unnamed_addr constant [8 x i8] c"Ifj.ord\00", align 1
@.str.5.373 = private unnamed_addr constant [8 x i8] c"Ifj.chr\00", align 1
@.str.6.374 = private unnamed_addr constant [14 x i8] c"Ifj.substring\00", align 1
@.str.7.375 = private unnamed_addr constant [10 x i8] c"Ifj.floor\00", align 1
@.str.8.376 = private unnamed_addr constant [8 x i8] c"Ifj.str\00", align 1
@.str.9.377 = private unnamed_addr constant [11 x i8] c"Ifj.strcmp\00", align 1
@.str.10.388 = private unnamed_addr constant [22 x i8] c"Undefined symbol: %s\0A\00", align 1
@.str.399 = private unnamed_addr constant [38 x i8] c"Memory allocation error for ast stack\00", align 1
@.str.1.400 = private unnamed_addr constant [43 x i8] c"Memory allocation error resizing ast stack\00", align 1
@.str.2.405 = private unnamed_addr constant [20 x i8] c"top: Stack is empty\00", align 1
@varCounter = internal global i64 0, align 8
@.str.424 = private unnamed_addr constant [10 x i8] c"GF@%s$%zu\00", align 1
@.str.1.425 = private unnamed_addr constant [10 x i8] c"LF@%s$%zu\00", align 1
@__debug = global i8 0, align 1
@.str.2.428 = private unnamed_addr constant [18 x i8] c"DECLARE FUNCTION\0A\00", align 1
@.str.3.429 = private unnamed_addr constant [6 x i8] c"%s#%d\00", align 1
@.str.4.432 = private unnamed_addr constant [5 x i8] c"%s#s\00", align 1
@.str.5.435 = private unnamed_addr constant [5 x i8] c"%s#g\00", align 1
@.str.6.444 = private unnamed_addr constant [30 x i8] c"checkNode: Undefined function\00", align 1
@unresCallCount = internal global i64 0, align 8
@unresCallCap = internal global i64 0, align 8
@unresCall = internal global ptr null, align 8
@.str.7.449 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@__stderrp = external global ptr, align 8
@.str.8.450 = private unnamed_addr constant [50 x i8] c"Call of function with wrong arity: %s (arity %d)\0A\00", align 1
@.str.9.451 = private unnamed_addr constant [43 x i8] c"Call of undefined function: %s (arity %d)\0A\00", align 1
@.str.10.452 = private unnamed_addr constant [6 x i8] c"%s#%c\00", align 1
@.str.11.453 = private unnamed_addr constant [37 x i8] c"Call of undefined getter/setter: %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @initAst() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @malloc(i64 noundef 8) #11
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %10

5:                                                ; preds = %0
  %6 = load i8, ptr @__debug, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  call void @printDebug(ptr noundef @.str)
  br label %9

9:                                                ; preds = %8, %5
  call void @handleError(i32 noundef 99) #12
  unreachable

10:                                               ; preds = %0
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds %struct.Ast, ptr %11, i32 0, i32 0
  store ptr null, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  ret ptr %13
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @deleteAst(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %11

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Ast, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  call void @deleteAstNode(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %10)
  br label %11

11:                                               ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @deleteAstNode(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %38

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %22, %7
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AstNode, ptr %10, i32 0, i32 2
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %25

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.AstNode, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds ptr, ptr %17, i64 %19
  %21 = load ptr, ptr %20, align 8
  call void @deleteAstNode(ptr noundef %21)
  br label %22

22:                                               ; preds = %14
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %8

25:                                               ; preds = %8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.AstNode, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.AstNode, ptr %29, i32 0, i32 3
  %31 = load i32, ptr %30, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %25
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.AstNode, ptr %34, i32 0, i32 4
  call void @tokenDeInit(ptr noundef %35)
  br label %36

36:                                               ; preds = %33, %25
  %37 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %37)
  br label %38

38:                                               ; preds = %36, %6
  ret void
}

declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @invPostOrder(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %31

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.AstNode, ptr %9, i32 0, i32 2
  %11 = load i32, ptr %10, align 8
  %12 = sub nsw i32 %11, 1
  store i32 %12, ptr %5, align 4
  br label %13

13:                                               ; preds = %25, %8
  %14 = load i32, ptr %5, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %28

16:                                               ; preds = %13
  %17 = load ptr, ptr %3, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.AstNode, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds ptr, ptr %20, i64 %22
  %24 = load ptr, ptr %23, align 8
  call void @invPostOrder(ptr noundef %17, ptr noundef %24)
  br label %25

25:                                               ; preds = %16
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %5, align 4
  br label %13

28:                                               ; preds = %13
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %4, align 8
  call void @push(ptr noundef %29, ptr noundef %30)
  br label %32

31:                                               ; preds = %2
  br label %32

32:                                               ; preds = %31, %28
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @PostOrder(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %30

8:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %9

9:                                                ; preds = %24, %8
  %10 = load i32, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.AstNode, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %27

15:                                               ; preds = %9
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.AstNode, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds ptr, ptr %19, i64 %21
  %23 = load ptr, ptr %22, align 8
  call void @invPostOrder(ptr noundef %16, ptr noundef %23)
  br label %24

24:                                               ; preds = %15
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %9

27:                                               ; preds = %9
  %28 = load ptr, ptr %3, align 8
  %29 = load ptr, ptr %4, align 8
  call void @push(ptr noundef %28, ptr noundef %29)
  br label %31

30:                                               ; preds = %2
  br label %31

31:                                               ; preds = %30, %27
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @createAstNode(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call ptr @malloc(i64 noundef 80) #11
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load i8, ptr @__debug, align 1
  %9 = trunc i8 %8 to i1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  call void @printDebug(ptr noundef @.str.1)
  br label %11

11:                                               ; preds = %10, %7
  call void @handleError(i32 noundef 99) #12
  unreachable

12:                                               ; preds = %1
  %13 = load i32, ptr %2, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.AstNode, ptr %14, i32 0, i32 3
  store i32 %13, ptr %15, align 4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.AstNode, ptr %16, i32 0, i32 2
  store i32 0, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.AstNode, ptr %18, i32 0, i32 1
  store ptr null, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.AstNode, ptr %20, i32 0, i32 0
  store ptr null, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.AstNode, ptr %22, i32 0, i32 6
  store ptr null, ptr %23, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @setAstRoot(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %15

10:                                               ; preds = %7, %2
  %11 = load i8, ptr @__debug, align 1
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @printDebug(ptr noundef @.str.2)
  br label %14

14:                                               ; preds = %13, %10
  call void @handleError(i32 noundef 99) #12
  unreachable

15:                                               ; preds = %7
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.Ast, ptr %17, i32 0, i32 0
  store ptr %16, ptr %18, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @addAstNode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.AstNode, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 8
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.AstNode, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 8
  %17 = call ptr @realloc(ptr noundef %13, i64 noundef %16) #13
  store ptr %17, ptr %6, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %25

20:                                               ; preds = %2
  %21 = load i8, ptr @__debug, align 1
  %22 = trunc i8 %21 to i1
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  call void @printDebug(ptr noundef @.str.3)
  br label %24

24:                                               ; preds = %23, %20
  call void @handleError(i32 noundef 99) #12
  unreachable

25:                                               ; preds = %2
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.AstNode, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AstNode, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.AstNode, ptr %33, i32 0, i32 2
  %35 = load i32, ptr %34, align 8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds ptr, ptr %32, i64 %36
  store ptr %29, ptr %37, align 8
  %38 = load i32, ptr %5, align 4
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.AstNode, ptr %39, i32 0, i32 2
  store i32 %38, ptr %40, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.AstNode, ptr %42, i32 0, i32 0
  store ptr %41, ptr %43, align 8
  ret void
}

; Function Attrs: allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @printAst(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  call void @printIndent(i32 noundef %6)
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.AstNode, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %22

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.AstNode, ptr %12, i32 0, i32 3
  %14 = load i32, ptr %13, align 4
  %15 = icmp ne i32 %14, 10
  br i1 %15, label %16, label %22

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.AstNode, ptr %17, i32 0, i32 3
  %19 = load i32, ptr %18, align 4
  %20 = call ptr @astTypeToString(i32 noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %20)
  br label %28

22:                                               ; preds = %11, %2
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.AstNode, ptr %23, i32 0, i32 4
  %25 = getelementptr inbounds %struct.Token, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %26)
  br label %28

28:                                               ; preds = %22, %16
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %5, align 4
  br label %30

30:                                               ; preds = %46, %28
  %31 = load i32, ptr %5, align 4
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.AstNode, ptr %32, i32 0, i32 2
  %34 = load i32, ptr %33, align 8
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %49

36:                                               ; preds = %30
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.AstNode, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds ptr, ptr %39, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %4, align 4
  %45 = add nsw i32 %44, 1
  call void @printAst(ptr noundef %43, i32 noundef %45)
  br label %46

46:                                               ; preds = %36
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  br label %30

49:                                               ; preds = %30
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @printIndent(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %10, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %13

8:                                                ; preds = %4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %10

10:                                               ; preds = %8
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %3, align 4
  br label %4

13:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @astTypeToString(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  switch i32 %4, label %23 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
    i32 6, label %10
    i32 7, label %11
    i32 8, label %12
    i32 9, label %13
    i32 10, label %14
    i32 11, label %15
    i32 12, label %16
    i32 13, label %17
    i32 14, label %18
    i32 15, label %19
    i32 16, label %20
    i32 17, label %21
    i32 18, label %22
  ]

5:                                                ; preds = %1
  store ptr @.str.6, ptr %2, align 8
  br label %24

6:                                                ; preds = %1
  store ptr @.str.7, ptr %2, align 8
  br label %24

7:                                                ; preds = %1
  store ptr @.str.8, ptr %2, align 8
  br label %24

8:                                                ; preds = %1
  store ptr @.str.9, ptr %2, align 8
  br label %24

9:                                                ; preds = %1
  store ptr @.str.10, ptr %2, align 8
  br label %24

10:                                               ; preds = %1
  store ptr @.str.11, ptr %2, align 8
  br label %24

11:                                               ; preds = %1
  store ptr @.str.12, ptr %2, align 8
  br label %24

12:                                               ; preds = %1
  store ptr @.str.13, ptr %2, align 8
  br label %24

13:                                               ; preds = %1
  store ptr @.str.14, ptr %2, align 8
  br label %24

14:                                               ; preds = %1
  store ptr @.str.15, ptr %2, align 8
  br label %24

15:                                               ; preds = %1
  store ptr @.str.16, ptr %2, align 8
  br label %24

16:                                               ; preds = %1
  store ptr @.str.17, ptr %2, align 8
  br label %24

17:                                               ; preds = %1
  store ptr @.str.18, ptr %2, align 8
  br label %24

18:                                               ; preds = %1
  store ptr @.str.19, ptr %2, align 8
  br label %24

19:                                               ; preds = %1
  store ptr @.str.20, ptr %2, align 8
  br label %24

20:                                               ; preds = %1
  store ptr @.str.21, ptr %2, align 8
  br label %24

21:                                               ; preds = %1
  store ptr @.str.22, ptr %2, align 8
  br label %24

22:                                               ; preds = %1
  store ptr @.str.23, ptr %2, align 8
  br label %24

23:                                               ; preds = %1
  store ptr @.str.24, ptr %2, align 8
  br label %24

24:                                               ; preds = %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  %25 = load ptr, ptr %2, align 8
  ret ptr %25
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline noreturn nounwind optnone ssp uwtable(sync)
define void @handleError(i32 noundef %0) #4 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  switch i32 %3, label %40 [
    i32 1, label %4
    i32 2, label %7
    i32 3, label %10
    i32 4, label %13
    i32 5, label %16
    i32 6, label %19
    i32 10, label %22
    i32 99, label %25
    i32 27, label %28
    i32 28, label %31
    i32 29, label %34
    i32 30, label %37
  ]

4:                                                ; preds = %1
  %5 = load ptr, ptr @__stderrp, align 8
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.26) #14
  br label %43

7:                                                ; preds = %1
  %8 = load ptr, ptr @__stderrp, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.1.27) #14
  br label %43

10:                                               ; preds = %1
  %11 = load ptr, ptr @__stderrp, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.2.28) #14
  br label %43

13:                                               ; preds = %1
  %14 = load ptr, ptr @__stderrp, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.3.29) #14
  br label %43

16:                                               ; preds = %1
  %17 = load ptr, ptr @__stderrp, align 8
  %18 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef @.str.4.30) #14
  br label %43

19:                                               ; preds = %1
  %20 = load ptr, ptr @__stderrp, align 8
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.5.31) #14
  br label %43

22:                                               ; preds = %1
  %23 = load ptr, ptr @__stderrp, align 8
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.6.32) #14
  br label %43

25:                                               ; preds = %1
  %26 = load ptr, ptr @__stderrp, align 8
  %27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.7.33) #14
  br label %43

28:                                               ; preds = %1
  %29 = load ptr, ptr @__stderrp, align 8
  %30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %29, ptr noundef @.str.8.34) #14
  br label %43

31:                                               ; preds = %1
  %32 = load ptr, ptr @__stderrp, align 8
  %33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.9.35) #14
  br label %43

34:                                               ; preds = %1
  %35 = load ptr, ptr @__stderrp, align 8
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.10.36) #14
  br label %43

37:                                               ; preds = %1
  %38 = load ptr, ptr @__stderrp, align 8
  %39 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.11.37) #14
  br label %43

40:                                               ; preds = %1
  %41 = load ptr, ptr @__stderrp, align 8
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.12.38) #14
  br label %43

43:                                               ; preds = %40, %37, %34, %31, %28, %25, %22, %19, %16, %13, %10, %7, %4
  %44 = load i32, ptr %2, align 4
  call void @exit(i32 noundef %44) #12
  unreachable
}

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @printDebug(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.13.41, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @mainGenerator(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Ast, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @handleError(i32 noundef 28) #12
  unreachable

11:                                               ; preds = %1
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1.43)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2.44)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3.45)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4.46)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.5.47)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.6.48)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7.49)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.8.50)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.9.51)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.10.52)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.11.53)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.12.54)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.13.55)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14.56)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.15.57)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.16.58)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.17.59)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.18.60)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.19.61)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.20.62)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.21.63)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.22.64)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.23.65)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.24.66)
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.25.67)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.26.68)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  %53 = call ptr @createAstNode(i32 noundef 19)
  store ptr %53, ptr %3, align 8
  %54 = load ptr, ptr %2, align 8
  %55 = getelementptr inbounds %struct.Ast, ptr %54, i32 0, i32 0
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds %struct.AstNode, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds ptr, ptr %58, i64 1
  %60 = load ptr, ptr %59, align 8
  %61 = getelementptr inbounds %struct.AstNode, ptr %60, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds ptr, ptr %62, i64 0
  %64 = load ptr, ptr %63, align 8
  store ptr %64, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %65

65:                                               ; preds = %103, %11
  %66 = load i32, ptr %4, align 4
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds %struct.AstNode, ptr %67, i32 0, i32 2
  %69 = load i32, ptr %68, align 8
  %70 = icmp slt i32 %66, %69
  br i1 %70, label %71, label %106

71:                                               ; preds = %65
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds %struct.AstNode, ptr %72, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = load i32, ptr %4, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds ptr, ptr %74, i64 %76
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.AstNode, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds ptr, ptr %80, i64 0
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.AstNode, ptr %82, i32 0, i32 4
  %84 = getelementptr inbounds %struct.Token, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = call i32 @strcmp(ptr noundef %85, ptr noundef @.str.41) #14
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %102

88:                                               ; preds = %71
  %89 = load ptr, ptr %3, align 8
  %90 = getelementptr inbounds %struct.AstNode, ptr %89, i32 0, i32 1
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %4, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds ptr, ptr %91, i64 %93
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds %struct.AstNode, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds ptr, ptr %97, i64 0
  %99 = load ptr, ptr %98, align 8
  %100 = call i32 @generateFunction(ptr noundef %99)
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.42.69)
  br label %102

102:                                              ; preds = %88, %71
  br label %103

103:                                              ; preds = %102
  %104 = load i32, ptr %4, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %4, align 4
  br label %65

106:                                              ; preds = %65
  store i32 0, ptr %5, align 4
  br label %107

107:                                              ; preds = %144, %106
  %108 = load i32, ptr %5, align 4
  %109 = load ptr, ptr %3, align 8
  %110 = getelementptr inbounds %struct.AstNode, ptr %109, i32 0, i32 2
  %111 = load i32, ptr %110, align 8
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %147

113:                                              ; preds = %107
  %114 = load ptr, ptr %3, align 8
  %115 = getelementptr inbounds %struct.AstNode, ptr %114, i32 0, i32 1
  %116 = load ptr, ptr %115, align 8
  %117 = load i32, ptr %5, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds ptr, ptr %116, i64 %118
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds %struct.AstNode, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr inbounds ptr, ptr %122, i64 0
  %124 = load ptr, ptr %123, align 8
  %125 = getelementptr inbounds %struct.AstNode, ptr %124, i32 0, i32 4
  %126 = getelementptr inbounds %struct.Token, ptr %125, i32 0, i32 1
  %127 = load ptr, ptr %126, align 8
  %128 = call i32 @strcmp(ptr noundef %127, ptr noundef @.str.41) #14
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %143

130:                                              ; preds = %113
  %131 = load ptr, ptr %3, align 8
  %132 = getelementptr inbounds %struct.AstNode, ptr %131, i32 0, i32 1
  %133 = load ptr, ptr %132, align 8
  %134 = load i32, ptr %5, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds ptr, ptr %133, i64 %135
  %137 = load ptr, ptr %136, align 8
  %138 = getelementptr inbounds %struct.AstNode, ptr %137, i32 0, i32 1
  %139 = load ptr, ptr %138, align 8
  %140 = getelementptr inbounds ptr, ptr %139, i64 0
  %141 = load ptr, ptr %140, align 8
  %142 = call i32 @generateFunction(ptr noundef %141)
  br label %143

143:                                              ; preds = %130, %113
  br label %144

144:                                              ; preds = %143
  %145 = load i32, ptr %5, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, ptr %5, align 4
  br label %107

147:                                              ; preds = %107
  ret void
}

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @generateFunction(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.AstNode, ptr %3, i32 0, i32 4
  %5 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 @strcmp(ptr noundef %6, ptr noundef @.str.41) #14
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  br label %20

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.AstNode, ptr %15, i32 0, i32 4
  %17 = getelementptr inbounds %struct.Token, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.45, ptr noundef %18)
  br label %20

20:                                               ; preds = %14, %9
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.AstNode, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.AstNode, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.AstNode, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %39

31:                                               ; preds = %20
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.AstNode, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.AstNode, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 1
  %38 = load ptr, ptr %37, align 8
  call void @generateParams(ptr noundef %38)
  br label %39

39:                                               ; preds = %31, %20
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.AstNode, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.AstNode, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %43, align 8
  %45 = icmp sgt i32 %44, 2
  br i1 %45, label %46, label %65

46:                                               ; preds = %39
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.AstNode, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.AstNode, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds ptr, ptr %51, i64 2
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds %struct.AstNode, ptr %53, i32 0, i32 3
  %55 = load i32, ptr %54, align 4
  %56 = icmp eq i32 %55, 8
  br i1 %56, label %57, label %65

57:                                               ; preds = %46
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.AstNode, ptr %58, i32 0, i32 0
  %60 = load ptr, ptr %59, align 8
  %61 = getelementptr inbounds %struct.AstNode, ptr %60, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds ptr, ptr %62, i64 2
  %64 = load ptr, ptr %63, align 8
  call void @generateBlock(ptr noundef %64)
  br label %95

65:                                               ; preds = %46, %39
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds %struct.AstNode, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds %struct.AstNode, ptr %68, i32 0, i32 2
  %70 = load i32, ptr %69, align 8
  %71 = icmp sgt i32 %70, 1
  br i1 %71, label %72, label %91

72:                                               ; preds = %65
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds %struct.AstNode, ptr %73, i32 0, i32 0
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %struct.AstNode, ptr %75, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds ptr, ptr %77, i64 1
  %79 = load ptr, ptr %78, align 8
  %80 = getelementptr inbounds %struct.AstNode, ptr %79, i32 0, i32 3
  %81 = load i32, ptr %80, align 4
  %82 = icmp eq i32 %81, 8
  br i1 %82, label %83, label %91

83:                                               ; preds = %72
  %84 = load ptr, ptr %2, align 8
  %85 = getelementptr inbounds %struct.AstNode, ptr %84, i32 0, i32 0
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.AstNode, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds ptr, ptr %88, i64 1
  %90 = load ptr, ptr %89, align 8
  call void @generateBlock(ptr noundef %90)
  br label %94

91:                                               ; preds = %72, %65
  %92 = load ptr, ptr @__stderrp, align 8
  %93 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %92, ptr noundef @.str.46) #14
  call void @handleError(i32 noundef 10) #12
  unreachable

94:                                               ; preds = %83
  br label %95

95:                                               ; preds = %94, %57
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.47)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @generateParams(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AstNode, ptr %4, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %45

9:                                                ; preds = %1
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AstNode, ptr %10, i32 0, i32 2
  %12 = load i32, ptr %11, align 8
  %13 = sub nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %42, %9
  %15 = load i32, ptr %3, align 4
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %45

17:                                               ; preds = %14
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.AstNode, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds ptr, ptr %20, i64 %22
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.AstNode, ptr %24, i32 0, i32 6
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.Symbol, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.48, ptr noundef %28)
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.AstNode, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds ptr, ptr %32, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.AstNode, ptr %36, i32 0, i32 6
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.Symbol, ptr %38, i32 0, i32 4
  %40 = load ptr, ptr %39, align 8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %40)
  br label %42

42:                                               ; preds = %17
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, -1
  store i32 %44, ptr %3, align 4
  br label %14

45:                                               ; preds = %14, %8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @generateBlock(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %298, %1
  %10 = load i32, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.AstNode, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %301

15:                                               ; preds = %9
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.AstNode, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds ptr, ptr %18, i64 %20
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.AstNode, ptr %22, i32 0, i32 3
  %24 = load i32, ptr %23, align 4
  switch i32 %24, label %296 [
    i32 0, label %25
    i32 8, label %26
    i32 9, label %34
    i32 10, label %82
    i32 12, label %99
    i32 13, label %118
    i32 16, label %225
    i32 17, label %257
    i32 18, label %284
  ]

25:                                               ; preds = %15
  br label %297

26:                                               ; preds = %15
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.AstNode, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31
  %33 = load ptr, ptr %32, align 8
  call void @generateBlock(ptr noundef %33)
  br label %297

34:                                               ; preds = %15
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.AstNode, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds ptr, ptr %37, i64 %39
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.AstNode, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 0
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.AstNode, ptr %45, i32 0, i32 6
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %4, align 8
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.Symbol, ptr %48, i32 0, i32 4
  %50 = load ptr, ptr %49, align 8
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.48, ptr noundef %50)
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.AstNode, ptr %52, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %3, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds ptr, ptr %54, i64 %56
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds %struct.AstNode, ptr %58, i32 0, i32 2
  %60 = load i32, ptr %59, align 8
  %61 = icmp sgt i32 %60, 1
  br i1 %61, label %62, label %81

62:                                               ; preds = %34
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds %struct.AstNode, ptr %63, i32 0, i32 1
  %65 = load ptr, ptr %64, align 8
  %66 = load i32, ptr %3, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr %65, i64 %67
  %69 = load ptr, ptr %68, align 8
  %70 = call i32 @checkForIfj(ptr noundef %69)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %80

72:                                               ; preds = %62
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds %struct.AstNode, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = load i32, ptr %3, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds ptr, ptr %75, i64 %77
  %79 = load ptr, ptr %78, align 8
  call void @createAssignement(ptr noundef %79)
  br label %80

80:                                               ; preds = %72, %62
  br label %81

81:                                               ; preds = %80, %34
  br label %297

82:                                               ; preds = %15
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.AstNode, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds ptr, ptr %85, i64 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds %struct.AstNode, ptr %87, i32 0, i32 6
  %89 = load ptr, ptr %88, align 8
  store ptr %89, ptr %5, align 8
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.AstNode, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds ptr, ptr %92, i64 1
  %94 = load ptr, ptr %93, align 8
  call void @createExpr(ptr noundef %94)
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds %struct.Symbol, ptr %95, i32 0, i32 4
  %97 = load ptr, ptr %96, align 8
  %98 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %97)
  br label %297

99:                                               ; preds = %15
  %100 = load ptr, ptr %2, align 8
  %101 = getelementptr inbounds %struct.AstNode, ptr %100, i32 0, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = load i32, ptr %3, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds ptr, ptr %102, i64 %104
  %106 = load ptr, ptr %105, align 8
  %107 = call i32 @checkForIfj(ptr noundef %106)
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %117

109:                                              ; preds = %99
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.AstNode, ptr %110, i32 0, i32 1
  %112 = load ptr, ptr %111, align 8
  %113 = load i32, ptr %3, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds ptr, ptr %112, i64 %114
  %116 = load ptr, ptr %115, align 8
  call void @createAssignement(ptr noundef %116)
  br label %117

117:                                              ; preds = %109, %99
  br label %297

118:                                              ; preds = %15
  %119 = call i32 @nextNum(i1 noundef zeroext true)
  store i32 %119, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %120

120:                                              ; preds = %219, %118
  %121 = load i32, ptr %7, align 4
  %122 = load ptr, ptr %2, align 8
  %123 = getelementptr inbounds %struct.AstNode, ptr %122, i32 0, i32 1
  %124 = load ptr, ptr %123, align 8
  %125 = load i32, ptr %3, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds ptr, ptr %124, i64 %126
  %128 = load ptr, ptr %127, align 8
  %129 = getelementptr inbounds %struct.AstNode, ptr %128, i32 0, i32 2
  %130 = load i32, ptr %129, align 8
  %131 = icmp slt i32 %121, %130
  br i1 %131, label %132, label %222

132:                                              ; preds = %120
  %133 = load ptr, ptr %2, align 8
  %134 = getelementptr inbounds %struct.AstNode, ptr %133, i32 0, i32 1
  %135 = load ptr, ptr %134, align 8
  %136 = load i32, ptr %3, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds ptr, ptr %135, i64 %137
  %139 = load ptr, ptr %138, align 8
  %140 = getelementptr inbounds %struct.AstNode, ptr %139, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = load i32, ptr %7, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds ptr, ptr %141, i64 %143
  %145 = load ptr, ptr %144, align 8
  %146 = getelementptr inbounds %struct.AstNode, ptr %145, i32 0, i32 3
  %147 = load i32, ptr %146, align 4
  %148 = icmp eq i32 %147, 14
  br i1 %148, label %149, label %186

149:                                              ; preds = %132
  %150 = call i32 @nextNum(i1 noundef zeroext true)
  store i32 %150, ptr %8, align 4
  %151 = load ptr, ptr %2, align 8
  %152 = getelementptr inbounds %struct.AstNode, ptr %151, i32 0, i32 1
  %153 = load ptr, ptr %152, align 8
  %154 = load i32, ptr %3, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds ptr, ptr %153, i64 %155
  %157 = load ptr, ptr %156, align 8
  %158 = getelementptr inbounds %struct.AstNode, ptr %157, i32 0, i32 1
  %159 = load ptr, ptr %158, align 8
  %160 = load i32, ptr %7, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds ptr, ptr %159, i64 %161
  %163 = load ptr, ptr %162, align 8
  %164 = load i32, ptr %8, align 4
  call void @createIfExpression(ptr noundef %163, i32 noundef %164)
  %165 = load ptr, ptr %2, align 8
  %166 = getelementptr inbounds %struct.AstNode, ptr %165, i32 0, i32 1
  %167 = load ptr, ptr %166, align 8
  %168 = load i32, ptr %3, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds ptr, ptr %167, i64 %169
  %171 = load ptr, ptr %170, align 8
  %172 = getelementptr inbounds %struct.AstNode, ptr %171, i32 0, i32 1
  %173 = load ptr, ptr %172, align 8
  %174 = load i32, ptr %7, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds ptr, ptr %173, i64 %175
  %177 = load ptr, ptr %176, align 8
  %178 = getelementptr inbounds %struct.AstNode, ptr %177, i32 0, i32 1
  %179 = load ptr, ptr %178, align 8
  %180 = getelementptr inbounds ptr, ptr %179, i64 1
  %181 = load ptr, ptr %180, align 8
  call void @generateBlock(ptr noundef %181)
  %182 = load i32, ptr %6, align 4
  %183 = call i32 (ptr, ...) @printf(ptr noundef @.str.50, i32 noundef %182)
  %184 = load i32, ptr %8, align 4
  %185 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, i32 noundef %184)
  br label %218

186:                                              ; preds = %132
  %187 = load ptr, ptr %2, align 8
  %188 = getelementptr inbounds %struct.AstNode, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = load i32, ptr %3, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds ptr, ptr %189, i64 %191
  %193 = load ptr, ptr %192, align 8
  %194 = getelementptr inbounds %struct.AstNode, ptr %193, i32 0, i32 1
  %195 = load ptr, ptr %194, align 8
  %196 = load i32, ptr %7, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds ptr, ptr %195, i64 %197
  %199 = load ptr, ptr %198, align 8
  %200 = getelementptr inbounds %struct.AstNode, ptr %199, i32 0, i32 3
  %201 = load i32, ptr %200, align 4
  %202 = icmp eq i32 %201, 15
  br i1 %202, label %203, label %217

203:                                              ; preds = %186
  %204 = load ptr, ptr %2, align 8
  %205 = getelementptr inbounds %struct.AstNode, ptr %204, i32 0, i32 1
  %206 = load ptr, ptr %205, align 8
  %207 = load i32, ptr %3, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds ptr, ptr %206, i64 %208
  %210 = load ptr, ptr %209, align 8
  %211 = getelementptr inbounds %struct.AstNode, ptr %210, i32 0, i32 1
  %212 = load ptr, ptr %211, align 8
  %213 = load i32, ptr %7, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds ptr, ptr %212, i64 %214
  %216 = load ptr, ptr %215, align 8
  call void @generateBlock(ptr noundef %216)
  br label %217

217:                                              ; preds = %203, %186
  br label %218

218:                                              ; preds = %217, %149
  br label %219

219:                                              ; preds = %218
  %220 = load i32, ptr %7, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, ptr %7, align 4
  br label %120

222:                                              ; preds = %120
  %223 = load i32, ptr %6, align 4
  %224 = call i32 (ptr, ...) @printf(ptr noundef @.str.52, i32 noundef %223)
  br label %297

225:                                              ; preds = %15
  %226 = load i32, ptr %3, align 4
  %227 = call i32 (ptr, ...) @printf(ptr noundef @.str.53, i32 noundef %226)
  %228 = load ptr, ptr %2, align 8
  %229 = getelementptr inbounds %struct.AstNode, ptr %228, i32 0, i32 1
  %230 = load ptr, ptr %229, align 8
  %231 = load i32, ptr %3, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds ptr, ptr %230, i64 %232
  %234 = load ptr, ptr %233, align 8
  %235 = getelementptr inbounds %struct.AstNode, ptr %234, i32 0, i32 1
  %236 = load ptr, ptr %235, align 8
  %237 = getelementptr inbounds ptr, ptr %236, i64 0
  %238 = load ptr, ptr %237, align 8
  call void @createExpr(ptr noundef %238)
  %239 = call i32 (ptr, ...) @printf(ptr noundef @.str.54)
  %240 = load i32, ptr %3, align 4
  %241 = call i32 (ptr, ...) @printf(ptr noundef @.str.55, i32 noundef %240)
  %242 = load ptr, ptr %2, align 8
  %243 = getelementptr inbounds %struct.AstNode, ptr %242, i32 0, i32 1
  %244 = load ptr, ptr %243, align 8
  %245 = load i32, ptr %3, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds ptr, ptr %244, i64 %246
  %248 = load ptr, ptr %247, align 8
  %249 = getelementptr inbounds %struct.AstNode, ptr %248, i32 0, i32 1
  %250 = load ptr, ptr %249, align 8
  %251 = getelementptr inbounds ptr, ptr %250, i64 1
  %252 = load ptr, ptr %251, align 8
  call void @generateBlock(ptr noundef %252)
  %253 = load i32, ptr %3, align 4
  %254 = call i32 (ptr, ...) @printf(ptr noundef @.str.56, i32 noundef %253)
  %255 = load i32, ptr %3, align 4
  %256 = call i32 (ptr, ...) @printf(ptr noundef @.str.57, i32 noundef %255)
  br label %297

257:                                              ; preds = %15
  %258 = load ptr, ptr %2, align 8
  %259 = getelementptr inbounds %struct.AstNode, ptr %258, i32 0, i32 1
  %260 = load ptr, ptr %259, align 8
  %261 = load i32, ptr %3, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds ptr, ptr %260, i64 %262
  %264 = load ptr, ptr %263, align 8
  %265 = getelementptr inbounds %struct.AstNode, ptr %264, i32 0, i32 2
  %266 = load i32, ptr %265, align 8
  %267 = icmp sgt i32 %266, 0
  br i1 %267, label %268, label %280

268:                                              ; preds = %257
  %269 = load ptr, ptr %2, align 8
  %270 = getelementptr inbounds %struct.AstNode, ptr %269, i32 0, i32 1
  %271 = load ptr, ptr %270, align 8
  %272 = load i32, ptr %3, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds ptr, ptr %271, i64 %273
  %275 = load ptr, ptr %274, align 8
  %276 = getelementptr inbounds %struct.AstNode, ptr %275, i32 0, i32 1
  %277 = load ptr, ptr %276, align 8
  %278 = getelementptr inbounds ptr, ptr %277, i64 0
  %279 = load ptr, ptr %278, align 8
  call void @createExpr(ptr noundef %279)
  br label %282

280:                                              ; preds = %257
  %281 = call i32 (ptr, ...) @printf(ptr noundef @.str.58)
  br label %282

282:                                              ; preds = %280, %268
  %283 = call i32 (ptr, ...) @printf(ptr noundef @.str.59)
  br label %297

284:                                              ; preds = %15
  %285 = load ptr, ptr %2, align 8
  %286 = getelementptr inbounds %struct.AstNode, ptr %285, i32 0, i32 1
  %287 = load ptr, ptr %286, align 8
  %288 = load i32, ptr %3, align 4
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds ptr, ptr %287, i64 %289
  %291 = load ptr, ptr %290, align 8
  %292 = getelementptr inbounds %struct.AstNode, ptr %291, i32 0, i32 4
  %293 = getelementptr inbounds %struct.Token, ptr %292, i32 0, i32 1
  %294 = load ptr, ptr %293, align 8
  %295 = call i32 (ptr, ...) @printf(ptr noundef @.str.60, ptr noundef %294)
  br label %297

296:                                              ; preds = %15
  br label %297

297:                                              ; preds = %296, %284, %282, %225, %222, %117, %82, %81, %26, %25
  br label %298

298:                                              ; preds = %297
  %299 = load i32, ptr %3, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, ptr %3, align 4
  br label %9

301:                                              ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @checkForIfj(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 10, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %35

35:                                               ; preds = %65, %1
  %36 = load i32, ptr %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [11 x %struct.ifjFunction], ptr @funcNames, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.ifjFunction, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %68

42:                                               ; preds = %35
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.AstNode, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds ptr, ptr %45, i64 1
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.AstNode, ptr %47, i32 0, i32 4
  %49 = getelementptr inbounds %struct.Token, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [11 x %struct.ifjFunction], ptr @funcNames, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.ifjFunction, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = call i32 @strcmp(ptr noundef %50, ptr noundef %55) #14
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %64

58:                                               ; preds = %42
  %59 = load i32, ptr %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [11 x %struct.ifjFunction], ptr @funcNames, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.ifjFunction, ptr %61, i32 0, i32 1
  %63 = load i32, ptr %62, align 8
  store i32 %63, ptr %4, align 4
  br label %68

64:                                               ; preds = %42
  br label %65

65:                                               ; preds = %64
  %66 = load i32, ptr %5, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %5, align 4
  br label %35

68:                                               ; preds = %58, %35
  %69 = load i32, ptr %4, align 4
  switch i32 %69, label %903 [
    i32 0, label %70
    i32 1, label %82
    i32 2, label %104
    i32 3, label %314
    i32 4, label %346
    i32 5, label %401
    i32 6, label %431
    i32 7, label %512
    i32 8, label %672
    i32 9, label %814
    i32 10, label %902
  ]

70:                                               ; preds = %68
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.AstNode, ptr %71, i32 0, i32 1
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds ptr, ptr %73, i64 0
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %struct.AstNode, ptr %75, i32 0, i32 6
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %6, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.Symbol, ptr %78, i32 0, i32 4
  %80 = load ptr, ptr %79, align 8
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.153, ptr noundef %80)
  br label %904

82:                                               ; preds = %68
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds %struct.AstNode, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds ptr, ptr %85, i64 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds %struct.AstNode, ptr %87, i32 0, i32 6
  %89 = load ptr, ptr %88, align 8
  %90 = icmp ne ptr %89, null
  br i1 %90, label %91, label %103

91:                                               ; preds = %82
  %92 = load ptr, ptr %3, align 8
  %93 = getelementptr inbounds %struct.AstNode, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds ptr, ptr %94, i64 0
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.AstNode, ptr %96, i32 0, i32 6
  %98 = load ptr, ptr %97, align 8
  store ptr %98, ptr %7, align 8
  %99 = load ptr, ptr %7, align 8
  %100 = getelementptr inbounds %struct.Symbol, ptr %99, i32 0, i32 4
  %101 = load ptr, ptr %100, align 8
  %102 = call i32 (ptr, ...) @printf(ptr noundef @.str.154, ptr noundef %101)
  br label %103

103:                                              ; preds = %91, %82
  br label %904

104:                                              ; preds = %68
  %105 = load ptr, ptr %3, align 8
  %106 = getelementptr inbounds %struct.AstNode, ptr %105, i32 0, i32 1
  %107 = load ptr, ptr %106, align 8
  %108 = getelementptr inbounds ptr, ptr %107, i64 1
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds %struct.AstNode, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds ptr, ptr %111, i64 0
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds %struct.AstNode, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = getelementptr inbounds ptr, ptr %115, i64 0
  %117 = load ptr, ptr %116, align 8
  %118 = getelementptr inbounds %struct.AstNode, ptr %117, i32 0, i32 4
  %119 = getelementptr inbounds %struct.Token, ptr %118, i32 0, i32 1
  %120 = load ptr, ptr %119, align 8
  store ptr %120, ptr %8, align 8
  %121 = load ptr, ptr %8, align 8
  %122 = call i32 @strcmp(ptr noundef %121, ptr noundef @.str.155) #14
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %132, label %124

124:                                              ; preds = %104
  %125 = load ptr, ptr %8, align 8
  %126 = call i32 @strcmp(ptr noundef %125, ptr noundef @.str.156) #14
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %132, label %128

128:                                              ; preds = %124
  %129 = load ptr, ptr %8, align 8
  %130 = call i32 @strcmp(ptr noundef %129, ptr noundef @.str.157) #14
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %134

132:                                              ; preds = %128, %124, %104
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.158)
  br label %904

134:                                              ; preds = %128
  %135 = load ptr, ptr %3, align 8
  %136 = getelementptr inbounds %struct.AstNode, ptr %135, i32 0, i32 1
  %137 = load ptr, ptr %136, align 8
  %138 = getelementptr inbounds ptr, ptr %137, i64 1
  %139 = load ptr, ptr %138, align 8
  %140 = getelementptr inbounds %struct.AstNode, ptr %139, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = getelementptr inbounds ptr, ptr %141, i64 0
  %143 = load ptr, ptr %142, align 8
  %144 = getelementptr inbounds %struct.AstNode, ptr %143, i32 0, i32 1
  %145 = load ptr, ptr %144, align 8
  %146 = getelementptr inbounds ptr, ptr %145, i64 0
  %147 = load ptr, ptr %146, align 8
  %148 = getelementptr inbounds %struct.AstNode, ptr %147, i32 0, i32 4
  %149 = getelementptr inbounds %struct.Token, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %149, align 8
  switch i32 %150, label %295 [
    i32 46, label %151
    i32 48, label %172
    i32 47, label %203
    i32 49, label %277
  ]

151:                                              ; preds = %134
  %152 = load ptr, ptr %3, align 8
  %153 = getelementptr inbounds %struct.AstNode, ptr %152, i32 0, i32 1
  %154 = load ptr, ptr %153, align 8
  %155 = getelementptr inbounds ptr, ptr %154, i64 1
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr inbounds %struct.AstNode, ptr %156, i32 0, i32 1
  %158 = load ptr, ptr %157, align 8
  %159 = getelementptr inbounds ptr, ptr %158, i64 0
  %160 = load ptr, ptr %159, align 8
  %161 = getelementptr inbounds %struct.AstNode, ptr %160, i32 0, i32 1
  %162 = load ptr, ptr %161, align 8
  %163 = getelementptr inbounds ptr, ptr %162, i64 0
  %164 = load ptr, ptr %163, align 8
  %165 = getelementptr inbounds %struct.AstNode, ptr %164, i32 0, i32 4
  %166 = getelementptr inbounds %struct.Token, ptr %165, i32 0, i32 1
  %167 = load ptr, ptr %166, align 8
  %168 = call ptr @convertString(ptr noundef %167)
  store ptr %168, ptr %9, align 8
  %169 = load ptr, ptr %9, align 8
  %170 = call i32 (ptr, ...) @printf(ptr noundef @.str.159, ptr noundef %169)
  %171 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %171)
  br label %313

172:                                              ; preds = %134
  %173 = load ptr, ptr %3, align 8
  %174 = getelementptr inbounds %struct.AstNode, ptr %173, i32 0, i32 1
  %175 = load ptr, ptr %174, align 8
  %176 = getelementptr inbounds ptr, ptr %175, i64 1
  %177 = load ptr, ptr %176, align 8
  %178 = getelementptr inbounds %struct.AstNode, ptr %177, i32 0, i32 1
  %179 = load ptr, ptr %178, align 8
  %180 = getelementptr inbounds ptr, ptr %179, i64 0
  %181 = load ptr, ptr %180, align 8
  %182 = getelementptr inbounds %struct.AstNode, ptr %181, i32 0, i32 1
  %183 = load ptr, ptr %182, align 8
  %184 = getelementptr inbounds ptr, ptr %183, i64 0
  %185 = load ptr, ptr %184, align 8
  %186 = getelementptr inbounds %struct.AstNode, ptr %185, i32 0, i32 4
  %187 = getelementptr inbounds %struct.Token, ptr %186, i32 0, i32 1
  %188 = load ptr, ptr %187, align 8
  %189 = call double @"\01_strtod"(ptr noundef %188, ptr noundef null)
  store double %189, ptr %10, align 8
  %190 = load double, ptr %10, align 8
  %191 = load double, ptr %10, align 8
  %192 = call double @llvm.floor.f64(double %191)
  %193 = fcmp oeq double %190, %192
  br i1 %193, label %194, label %199

194:                                              ; preds = %172
  %195 = load double, ptr %10, align 8
  %196 = fptosi double %195 to i64
  store i64 %196, ptr %11, align 8
  %197 = load i64, ptr %11, align 8
  %198 = call i32 (ptr, ...) @printf(ptr noundef @.str.160, i64 noundef %197)
  br label %202

199:                                              ; preds = %172
  %200 = load double, ptr %10, align 8
  %201 = call i32 (ptr, ...) @printf(ptr noundef @.str.161, double noundef %200)
  br label %202

202:                                              ; preds = %199, %194
  br label %313

203:                                              ; preds = %134
  %204 = load ptr, ptr %3, align 8
  %205 = getelementptr inbounds %struct.AstNode, ptr %204, i32 0, i32 1
  %206 = load ptr, ptr %205, align 8
  %207 = getelementptr inbounds ptr, ptr %206, i64 1
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds %struct.AstNode, ptr %208, i32 0, i32 1
  %210 = load ptr, ptr %209, align 8
  %211 = getelementptr inbounds ptr, ptr %210, i64 0
  %212 = load ptr, ptr %211, align 8
  %213 = getelementptr inbounds %struct.AstNode, ptr %212, i32 0, i32 1
  %214 = load ptr, ptr %213, align 8
  %215 = getelementptr inbounds ptr, ptr %214, i64 0
  %216 = load ptr, ptr %215, align 8
  %217 = getelementptr inbounds %struct.AstNode, ptr %216, i32 0, i32 6
  %218 = load ptr, ptr %217, align 8
  store ptr %218, ptr %12, align 8
  %219 = call i32 @nextNum(i1 noundef zeroext true)
  store i32 %219, ptr %13, align 4
  %220 = load ptr, ptr %12, align 8
  %221 = getelementptr inbounds %struct.Symbol, ptr %220, i32 0, i32 4
  %222 = load ptr, ptr %221, align 8
  %223 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %222)
  %224 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  %225 = call i32 (ptr, ...) @printf(ptr noundef @.str.162)
  %226 = load i32, ptr %13, align 4
  %227 = call i32 (ptr, ...) @printf(ptr noundef @.str.163, i32 noundef %226)
  %228 = load ptr, ptr %12, align 8
  %229 = getelementptr inbounds %struct.Symbol, ptr %228, i32 0, i32 4
  %230 = load ptr, ptr %229, align 8
  %231 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %230)
  %232 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  %233 = call i32 (ptr, ...) @printf(ptr noundef @.str.164)
  %234 = load i32, ptr %13, align 4
  %235 = call i32 (ptr, ...) @printf(ptr noundef @.str.165, i32 noundef %234)
  %236 = load ptr, ptr %12, align 8
  %237 = getelementptr inbounds %struct.Symbol, ptr %236, i32 0, i32 4
  %238 = load ptr, ptr %237, align 8
  %239 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %238)
  %240 = call i32 (ptr, ...) @printf(ptr noundef @.str.166)
  %241 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %242 = load i32, ptr %13, align 4
  %243 = call i32 (ptr, ...) @printf(ptr noundef @.str.167, i32 noundef %242)
  %244 = load ptr, ptr %12, align 8
  %245 = getelementptr inbounds %struct.Symbol, ptr %244, i32 0, i32 4
  %246 = load ptr, ptr %245, align 8
  %247 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %246)
  %248 = call i32 (ptr, ...) @printf(ptr noundef @.str.168)
  %249 = call i32 (ptr, ...) @printf(ptr noundef @.str.169)
  %250 = call i32 (ptr, ...) @printf(ptr noundef @.str.170)
  %251 = load i32, ptr %13, align 4
  %252 = call i32 (ptr, ...) @printf(ptr noundef @.str.171, i32 noundef %251)
  %253 = load i32, ptr %13, align 4
  %254 = call i32 (ptr, ...) @printf(ptr noundef @.str.172, i32 noundef %253)
  %255 = load ptr, ptr %12, align 8
  %256 = getelementptr inbounds %struct.Symbol, ptr %255, i32 0, i32 4
  %257 = load ptr, ptr %256, align 8
  %258 = call i32 (ptr, ...) @printf(ptr noundef @.str.173, ptr noundef %257)
  %259 = load i32, ptr %13, align 4
  %260 = call i32 (ptr, ...) @printf(ptr noundef @.str.171, i32 noundef %259)
  %261 = load i32, ptr %13, align 4
  %262 = call i32 (ptr, ...) @printf(ptr noundef @.str.174, i32 noundef %261)
  %263 = load ptr, ptr %12, align 8
  %264 = getelementptr inbounds %struct.Symbol, ptr %263, i32 0, i32 4
  %265 = load ptr, ptr %264, align 8
  %266 = call i32 (ptr, ...) @printf(ptr noundef @.str.173, ptr noundef %265)
  %267 = load i32, ptr %13, align 4
  %268 = call i32 (ptr, ...) @printf(ptr noundef @.str.171, i32 noundef %267)
  %269 = load i32, ptr %13, align 4
  %270 = call i32 (ptr, ...) @printf(ptr noundef @.str.175, i32 noundef %269)
  %271 = load ptr, ptr %12, align 8
  %272 = getelementptr inbounds %struct.Symbol, ptr %271, i32 0, i32 4
  %273 = load ptr, ptr %272, align 8
  %274 = call i32 (ptr, ...) @printf(ptr noundef @.str.173, ptr noundef %273)
  %275 = load i32, ptr %13, align 4
  %276 = call i32 (ptr, ...) @printf(ptr noundef @.str.176, i32 noundef %275)
  br label %313

277:                                              ; preds = %134
  %278 = load ptr, ptr %3, align 8
  %279 = getelementptr inbounds %struct.AstNode, ptr %278, i32 0, i32 1
  %280 = load ptr, ptr %279, align 8
  %281 = getelementptr inbounds ptr, ptr %280, i64 1
  %282 = load ptr, ptr %281, align 8
  %283 = getelementptr inbounds %struct.AstNode, ptr %282, i32 0, i32 1
  %284 = load ptr, ptr %283, align 8
  %285 = getelementptr inbounds ptr, ptr %284, i64 0
  %286 = load ptr, ptr %285, align 8
  %287 = getelementptr inbounds %struct.AstNode, ptr %286, i32 0, i32 1
  %288 = load ptr, ptr %287, align 8
  %289 = getelementptr inbounds ptr, ptr %288, i64 0
  %290 = load ptr, ptr %289, align 8
  %291 = getelementptr inbounds %struct.AstNode, ptr %290, i32 0, i32 4
  %292 = getelementptr inbounds %struct.Token, ptr %291, i32 0, i32 1
  %293 = load ptr, ptr %292, align 8
  %294 = call i32 (ptr, ...) @printf(ptr noundef @.str.177, ptr noundef %293)
  br label %313

295:                                              ; preds = %134
  %296 = load ptr, ptr %3, align 8
  %297 = getelementptr inbounds %struct.AstNode, ptr %296, i32 0, i32 1
  %298 = load ptr, ptr %297, align 8
  %299 = getelementptr inbounds ptr, ptr %298, i64 1
  %300 = load ptr, ptr %299, align 8
  %301 = getelementptr inbounds %struct.AstNode, ptr %300, i32 0, i32 1
  %302 = load ptr, ptr %301, align 8
  %303 = getelementptr inbounds ptr, ptr %302, i64 0
  %304 = load ptr, ptr %303, align 8
  %305 = getelementptr inbounds %struct.AstNode, ptr %304, i32 0, i32 1
  %306 = load ptr, ptr %305, align 8
  %307 = getelementptr inbounds ptr, ptr %306, i64 0
  %308 = load ptr, ptr %307, align 8
  %309 = getelementptr inbounds %struct.AstNode, ptr %308, i32 0, i32 4
  %310 = getelementptr inbounds %struct.Token, ptr %309, i32 0, i32 0
  %311 = load i32, ptr %310, align 8
  %312 = call i32 (ptr, ...) @printf(ptr noundef @.str.178, i32 noundef %311)
  call void @handleError(i32 noundef 30) #12
  unreachable

313:                                              ; preds = %277, %203, %202, %151
  br label %904

314:                                              ; preds = %68
  %315 = load ptr, ptr %3, align 8
  %316 = getelementptr inbounds %struct.AstNode, ptr %315, i32 0, i32 1
  %317 = load ptr, ptr %316, align 8
  %318 = getelementptr inbounds ptr, ptr %317, i64 0
  %319 = load ptr, ptr %318, align 8
  %320 = getelementptr inbounds %struct.AstNode, ptr %319, i32 0, i32 6
  %321 = load ptr, ptr %320, align 8
  store ptr %321, ptr %14, align 8
  %322 = load ptr, ptr %3, align 8
  %323 = getelementptr inbounds %struct.AstNode, ptr %322, i32 0, i32 1
  %324 = load ptr, ptr %323, align 8
  %325 = getelementptr inbounds ptr, ptr %324, i64 1
  %326 = load ptr, ptr %325, align 8
  %327 = getelementptr inbounds %struct.AstNode, ptr %326, i32 0, i32 1
  %328 = load ptr, ptr %327, align 8
  %329 = getelementptr inbounds ptr, ptr %328, i64 0
  %330 = load ptr, ptr %329, align 8
  %331 = getelementptr inbounds %struct.AstNode, ptr %330, i32 0, i32 1
  %332 = load ptr, ptr %331, align 8
  %333 = getelementptr inbounds ptr, ptr %332, i64 0
  %334 = load ptr, ptr %333, align 8
  %335 = getelementptr inbounds %struct.AstNode, ptr %334, i32 0, i32 6
  %336 = load ptr, ptr %335, align 8
  store ptr %336, ptr %15, align 8
  %337 = load ptr, ptr %15, align 8
  %338 = getelementptr inbounds %struct.Symbol, ptr %337, i32 0, i32 4
  %339 = load ptr, ptr %338, align 8
  %340 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %339)
  %341 = call i32 (ptr, ...) @printf(ptr noundef @.str.168)
  %342 = load ptr, ptr %14, align 8
  %343 = getelementptr inbounds %struct.Symbol, ptr %342, i32 0, i32 4
  %344 = load ptr, ptr %343, align 8
  %345 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %344)
  br label %904

346:                                              ; preds = %68
  %347 = load ptr, ptr %3, align 8
  %348 = getelementptr inbounds %struct.AstNode, ptr %347, i32 0, i32 1
  %349 = load ptr, ptr %348, align 8
  %350 = getelementptr inbounds ptr, ptr %349, i64 0
  %351 = load ptr, ptr %350, align 8
  %352 = getelementptr inbounds %struct.AstNode, ptr %351, i32 0, i32 6
  %353 = load ptr, ptr %352, align 8
  store ptr %353, ptr %16, align 8
  %354 = load ptr, ptr %3, align 8
  %355 = getelementptr inbounds %struct.AstNode, ptr %354, i32 0, i32 1
  %356 = load ptr, ptr %355, align 8
  %357 = getelementptr inbounds ptr, ptr %356, i64 1
  %358 = load ptr, ptr %357, align 8
  %359 = getelementptr inbounds %struct.AstNode, ptr %358, i32 0, i32 1
  %360 = load ptr, ptr %359, align 8
  %361 = getelementptr inbounds ptr, ptr %360, i64 0
  %362 = load ptr, ptr %361, align 8
  %363 = getelementptr inbounds %struct.AstNode, ptr %362, i32 0, i32 1
  %364 = load ptr, ptr %363, align 8
  %365 = getelementptr inbounds ptr, ptr %364, i64 0
  %366 = load ptr, ptr %365, align 8
  %367 = getelementptr inbounds %struct.AstNode, ptr %366, i32 0, i32 6
  %368 = load ptr, ptr %367, align 8
  store ptr %368, ptr %17, align 8
  %369 = load ptr, ptr %17, align 8
  %370 = getelementptr inbounds %struct.Symbol, ptr %369, i32 0, i32 4
  %371 = load ptr, ptr %370, align 8
  %372 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %371)
  %373 = call i32 (ptr, ...) @printf(ptr noundef @.str.179)
  %374 = call i32 (ptr, ...) @printf(ptr noundef @.str.180)
  %375 = call i32 @nextNum(i1 noundef zeroext false)
  %376 = call i32 (ptr, ...) @printf(ptr noundef @.str.181, i32 noundef %375)
  %377 = load ptr, ptr %17, align 8
  %378 = getelementptr inbounds %struct.Symbol, ptr %377, i32 0, i32 4
  %379 = load ptr, ptr %378, align 8
  %380 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %379)
  %381 = call i32 (ptr, ...) @printf(ptr noundef @.str.182)
  %382 = load ptr, ptr %16, align 8
  %383 = getelementptr inbounds %struct.Symbol, ptr %382, i32 0, i32 4
  %384 = load ptr, ptr %383, align 8
  %385 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %384)
  %386 = call i32 @nextNum(i1 noundef zeroext false)
  %387 = call i32 (ptr, ...) @printf(ptr noundef @.str.183, i32 noundef %386)
  %388 = call i32 @nextNum(i1 noundef zeroext false)
  %389 = call i32 (ptr, ...) @printf(ptr noundef @.str.184, i32 noundef %388)
  %390 = load ptr, ptr %17, align 8
  %391 = getelementptr inbounds %struct.Symbol, ptr %390, i32 0, i32 4
  %392 = load ptr, ptr %391, align 8
  %393 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %392)
  %394 = call i32 (ptr, ...) @printf(ptr noundef @.str.185)
  %395 = load ptr, ptr %16, align 8
  %396 = getelementptr inbounds %struct.Symbol, ptr %395, i32 0, i32 4
  %397 = load ptr, ptr %396, align 8
  %398 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %397)
  %399 = call i32 @nextNum(i1 noundef zeroext false)
  %400 = call i32 (ptr, ...) @printf(ptr noundef @.str.186, i32 noundef %399)
  br label %904

401:                                              ; preds = %68
  %402 = load ptr, ptr %3, align 8
  %403 = getelementptr inbounds %struct.AstNode, ptr %402, i32 0, i32 1
  %404 = load ptr, ptr %403, align 8
  %405 = getelementptr inbounds ptr, ptr %404, i64 0
  %406 = load ptr, ptr %405, align 8
  %407 = getelementptr inbounds %struct.AstNode, ptr %406, i32 0, i32 6
  %408 = load ptr, ptr %407, align 8
  store ptr %408, ptr %18, align 8
  %409 = load ptr, ptr %3, align 8
  %410 = getelementptr inbounds %struct.AstNode, ptr %409, i32 0, i32 1
  %411 = load ptr, ptr %410, align 8
  %412 = getelementptr inbounds ptr, ptr %411, i64 1
  %413 = load ptr, ptr %412, align 8
  %414 = getelementptr inbounds %struct.AstNode, ptr %413, i32 0, i32 1
  %415 = load ptr, ptr %414, align 8
  %416 = getelementptr inbounds ptr, ptr %415, i64 0
  %417 = load ptr, ptr %416, align 8
  %418 = getelementptr inbounds %struct.AstNode, ptr %417, i32 0, i32 1
  %419 = load ptr, ptr %418, align 8
  %420 = getelementptr inbounds ptr, ptr %419, i64 0
  %421 = load ptr, ptr %420, align 8
  %422 = getelementptr inbounds %struct.AstNode, ptr %421, i32 0, i32 6
  %423 = load ptr, ptr %422, align 8
  store ptr %423, ptr %19, align 8
  %424 = load ptr, ptr %18, align 8
  %425 = getelementptr inbounds %struct.Symbol, ptr %424, i32 0, i32 4
  %426 = load ptr, ptr %425, align 8
  %427 = load ptr, ptr %19, align 8
  %428 = getelementptr inbounds %struct.Symbol, ptr %427, i32 0, i32 4
  %429 = load ptr, ptr %428, align 8
  %430 = call i32 (ptr, ...) @printf(ptr noundef @.str.187, ptr noundef %426, ptr noundef %429)
  br label %904

431:                                              ; preds = %68
  %432 = load ptr, ptr %3, align 8
  %433 = getelementptr inbounds %struct.AstNode, ptr %432, i32 0, i32 1
  %434 = load ptr, ptr %433, align 8
  %435 = getelementptr inbounds ptr, ptr %434, i64 0
  %436 = load ptr, ptr %435, align 8
  %437 = getelementptr inbounds %struct.AstNode, ptr %436, i32 0, i32 6
  %438 = load ptr, ptr %437, align 8
  store ptr %438, ptr %20, align 8
  %439 = load ptr, ptr %3, align 8
  %440 = getelementptr inbounds %struct.AstNode, ptr %439, i32 0, i32 1
  %441 = load ptr, ptr %440, align 8
  %442 = getelementptr inbounds ptr, ptr %441, i64 1
  %443 = load ptr, ptr %442, align 8
  %444 = getelementptr inbounds %struct.AstNode, ptr %443, i32 0, i32 1
  %445 = load ptr, ptr %444, align 8
  %446 = getelementptr inbounds ptr, ptr %445, i64 0
  %447 = load ptr, ptr %446, align 8
  %448 = getelementptr inbounds %struct.AstNode, ptr %447, i32 0, i32 1
  %449 = load ptr, ptr %448, align 8
  %450 = getelementptr inbounds ptr, ptr %449, i64 0
  %451 = load ptr, ptr %450, align 8
  %452 = getelementptr inbounds %struct.AstNode, ptr %451, i32 0, i32 6
  %453 = load ptr, ptr %452, align 8
  store ptr %453, ptr %21, align 8
  %454 = load ptr, ptr %3, align 8
  %455 = getelementptr inbounds %struct.AstNode, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = getelementptr inbounds ptr, ptr %456, i64 1
  %458 = load ptr, ptr %457, align 8
  %459 = getelementptr inbounds %struct.AstNode, ptr %458, i32 0, i32 1
  %460 = load ptr, ptr %459, align 8
  %461 = getelementptr inbounds ptr, ptr %460, i64 0
  %462 = load ptr, ptr %461, align 8
  %463 = getelementptr inbounds %struct.AstNode, ptr %462, i32 0, i32 1
  %464 = load ptr, ptr %463, align 8
  %465 = getelementptr inbounds ptr, ptr %464, i64 2
  %466 = load ptr, ptr %465, align 8
  %467 = getelementptr inbounds %struct.AstNode, ptr %466, i32 0, i32 6
  %468 = load ptr, ptr %467, align 8
  store ptr %468, ptr %22, align 8
  %469 = load ptr, ptr %3, align 8
  %470 = getelementptr inbounds %struct.AstNode, ptr %469, i32 0, i32 1
  %471 = load ptr, ptr %470, align 8
  %472 = getelementptr inbounds ptr, ptr %471, i64 1
  %473 = load ptr, ptr %472, align 8
  %474 = getelementptr inbounds %struct.AstNode, ptr %473, i32 0, i32 1
  %475 = load ptr, ptr %474, align 8
  %476 = getelementptr inbounds ptr, ptr %475, i64 0
  %477 = load ptr, ptr %476, align 8
  %478 = getelementptr inbounds %struct.AstNode, ptr %477, i32 0, i32 1
  %479 = load ptr, ptr %478, align 8
  %480 = getelementptr inbounds ptr, ptr %479, i64 1
  %481 = load ptr, ptr %480, align 8
  %482 = getelementptr inbounds %struct.AstNode, ptr %481, i32 0, i32 6
  %483 = load ptr, ptr %482, align 8
  store ptr %483, ptr %23, align 8
  %484 = load ptr, ptr %22, align 8
  %485 = getelementptr inbounds %struct.Symbol, ptr %484, i32 0, i32 4
  %486 = load ptr, ptr %485, align 8
  %487 = call i32 (ptr, ...) @printf(ptr noundef @.str.188, ptr noundef %486)
  %488 = load ptr, ptr %23, align 8
  %489 = getelementptr inbounds %struct.Symbol, ptr %488, i32 0, i32 4
  %490 = load ptr, ptr %489, align 8
  %491 = call i32 (ptr, ...) @printf(ptr noundef @.str.189, ptr noundef %490)
  %492 = call i32 (ptr, ...) @printf(ptr noundef @.str.190)
  %493 = call i32 (ptr, ...) @printf(ptr noundef @.str.191)
  %494 = call i32 (ptr, ...) @printf(ptr noundef @.str.192)
  %495 = load ptr, ptr %21, align 8
  %496 = getelementptr inbounds %struct.Symbol, ptr %495, i32 0, i32 4
  %497 = load ptr, ptr %496, align 8
  %498 = call i32 (ptr, ...) @printf(ptr noundef @.str.193, ptr noundef %497)
  %499 = load ptr, ptr %20, align 8
  %500 = getelementptr inbounds %struct.Symbol, ptr %499, i32 0, i32 4
  %501 = load ptr, ptr %500, align 8
  %502 = call i32 (ptr, ...) @printf(ptr noundef @.str.194, ptr noundef %501)
  %503 = call i32 (ptr, ...) @printf(ptr noundef @.str.195)
  %504 = call i32 (ptr, ...) @printf(ptr noundef @.str.196)
  %505 = call i32 (ptr, ...) @printf(ptr noundef @.str.197)
  %506 = call i32 (ptr, ...) @printf(ptr noundef @.str.198)
  %507 = call i32 (ptr, ...) @printf(ptr noundef @.str.47)
  %508 = load ptr, ptr %20, align 8
  %509 = getelementptr inbounds %struct.Symbol, ptr %508, i32 0, i32 4
  %510 = load ptr, ptr %509, align 8
  %511 = call i32 (ptr, ...) @printf(ptr noundef @.str.199, ptr noundef %510)
  br label %904

512:                                              ; preds = %68
  %513 = load ptr, ptr %3, align 8
  %514 = getelementptr inbounds %struct.AstNode, ptr %513, i32 0, i32 1
  %515 = load ptr, ptr %514, align 8
  %516 = getelementptr inbounds ptr, ptr %515, i64 0
  %517 = load ptr, ptr %516, align 8
  %518 = getelementptr inbounds %struct.AstNode, ptr %517, i32 0, i32 6
  %519 = load ptr, ptr %518, align 8
  store ptr %519, ptr %24, align 8
  %520 = load ptr, ptr %3, align 8
  %521 = getelementptr inbounds %struct.AstNode, ptr %520, i32 0, i32 1
  %522 = load ptr, ptr %521, align 8
  %523 = getelementptr inbounds ptr, ptr %522, i64 1
  %524 = load ptr, ptr %523, align 8
  %525 = getelementptr inbounds %struct.AstNode, ptr %524, i32 0, i32 1
  %526 = load ptr, ptr %525, align 8
  %527 = getelementptr inbounds ptr, ptr %526, i64 0
  %528 = load ptr, ptr %527, align 8
  %529 = getelementptr inbounds %struct.AstNode, ptr %528, i32 0, i32 1
  %530 = load ptr, ptr %529, align 8
  %531 = getelementptr inbounds ptr, ptr %530, i64 0
  %532 = load ptr, ptr %531, align 8
  %533 = getelementptr inbounds %struct.AstNode, ptr %532, i32 0, i32 4
  %534 = getelementptr inbounds %struct.Token, ptr %533, i32 0, i32 0
  %535 = load i32, ptr %534, align 8
  %536 = icmp eq i32 %535, 46
  br i1 %536, label %537, label %557

537:                                              ; preds = %512
  %538 = load ptr, ptr %3, align 8
  %539 = getelementptr inbounds %struct.AstNode, ptr %538, i32 0, i32 1
  %540 = load ptr, ptr %539, align 8
  %541 = getelementptr inbounds ptr, ptr %540, i64 1
  %542 = load ptr, ptr %541, align 8
  %543 = getelementptr inbounds %struct.AstNode, ptr %542, i32 0, i32 1
  %544 = load ptr, ptr %543, align 8
  %545 = getelementptr inbounds ptr, ptr %544, i64 0
  %546 = load ptr, ptr %545, align 8
  %547 = getelementptr inbounds %struct.AstNode, ptr %546, i32 0, i32 1
  %548 = load ptr, ptr %547, align 8
  %549 = getelementptr inbounds ptr, ptr %548, i64 0
  %550 = load ptr, ptr %549, align 8
  %551 = getelementptr inbounds %struct.AstNode, ptr %550, i32 0, i32 4
  %552 = getelementptr inbounds %struct.Token, ptr %551, i32 0, i32 1
  %553 = load ptr, ptr %552, align 8
  %554 = call ptr @convertString(ptr noundef %553)
  store ptr %554, ptr %25, align 8
  %555 = load ptr, ptr %25, align 8
  %556 = call i32 (ptr, ...) @printf(ptr noundef @.str.200, ptr noundef %555)
  br label %577

557:                                              ; preds = %512
  %558 = load ptr, ptr %3, align 8
  %559 = getelementptr inbounds %struct.AstNode, ptr %558, i32 0, i32 1
  %560 = load ptr, ptr %559, align 8
  %561 = getelementptr inbounds ptr, ptr %560, i64 1
  %562 = load ptr, ptr %561, align 8
  %563 = getelementptr inbounds %struct.AstNode, ptr %562, i32 0, i32 1
  %564 = load ptr, ptr %563, align 8
  %565 = getelementptr inbounds ptr, ptr %564, i64 0
  %566 = load ptr, ptr %565, align 8
  %567 = getelementptr inbounds %struct.AstNode, ptr %566, i32 0, i32 1
  %568 = load ptr, ptr %567, align 8
  %569 = getelementptr inbounds ptr, ptr %568, i64 0
  %570 = load ptr, ptr %569, align 8
  %571 = getelementptr inbounds %struct.AstNode, ptr %570, i32 0, i32 6
  %572 = load ptr, ptr %571, align 8
  store ptr %572, ptr %26, align 8
  %573 = load ptr, ptr %26, align 8
  %574 = getelementptr inbounds %struct.Symbol, ptr %573, i32 0, i32 4
  %575 = load ptr, ptr %574, align 8
  %576 = call i32 (ptr, ...) @printf(ptr noundef @.str.201, ptr noundef %575)
  br label %577

577:                                              ; preds = %557, %537
  %578 = load ptr, ptr %3, align 8
  %579 = getelementptr inbounds %struct.AstNode, ptr %578, i32 0, i32 1
  %580 = load ptr, ptr %579, align 8
  %581 = getelementptr inbounds ptr, ptr %580, i64 1
  %582 = load ptr, ptr %581, align 8
  %583 = getelementptr inbounds %struct.AstNode, ptr %582, i32 0, i32 1
  %584 = load ptr, ptr %583, align 8
  %585 = getelementptr inbounds ptr, ptr %584, i64 0
  %586 = load ptr, ptr %585, align 8
  %587 = getelementptr inbounds %struct.AstNode, ptr %586, i32 0, i32 1
  %588 = load ptr, ptr %587, align 8
  %589 = getelementptr inbounds ptr, ptr %588, i64 1
  %590 = load ptr, ptr %589, align 8
  %591 = getelementptr inbounds %struct.AstNode, ptr %590, i32 0, i32 4
  %592 = getelementptr inbounds %struct.Token, ptr %591, i32 0, i32 0
  %593 = load i32, ptr %592, align 8
  %594 = icmp eq i32 %593, 46
  br i1 %594, label %595, label %615

595:                                              ; preds = %577
  %596 = load ptr, ptr %3, align 8
  %597 = getelementptr inbounds %struct.AstNode, ptr %596, i32 0, i32 1
  %598 = load ptr, ptr %597, align 8
  %599 = getelementptr inbounds ptr, ptr %598, i64 1
  %600 = load ptr, ptr %599, align 8
  %601 = getelementptr inbounds %struct.AstNode, ptr %600, i32 0, i32 1
  %602 = load ptr, ptr %601, align 8
  %603 = getelementptr inbounds ptr, ptr %602, i64 0
  %604 = load ptr, ptr %603, align 8
  %605 = getelementptr inbounds %struct.AstNode, ptr %604, i32 0, i32 1
  %606 = load ptr, ptr %605, align 8
  %607 = getelementptr inbounds ptr, ptr %606, i64 1
  %608 = load ptr, ptr %607, align 8
  %609 = getelementptr inbounds %struct.AstNode, ptr %608, i32 0, i32 4
  %610 = getelementptr inbounds %struct.Token, ptr %609, i32 0, i32 1
  %611 = load ptr, ptr %610, align 8
  %612 = call ptr @convertString(ptr noundef %611)
  store ptr %612, ptr %27, align 8
  %613 = load ptr, ptr %27, align 8
  %614 = call i32 (ptr, ...) @printf(ptr noundef @.str.202, ptr noundef %613)
  br label %635

615:                                              ; preds = %577
  %616 = load ptr, ptr %3, align 8
  %617 = getelementptr inbounds %struct.AstNode, ptr %616, i32 0, i32 1
  %618 = load ptr, ptr %617, align 8
  %619 = getelementptr inbounds ptr, ptr %618, i64 1
  %620 = load ptr, ptr %619, align 8
  %621 = getelementptr inbounds %struct.AstNode, ptr %620, i32 0, i32 1
  %622 = load ptr, ptr %621, align 8
  %623 = getelementptr inbounds ptr, ptr %622, i64 0
  %624 = load ptr, ptr %623, align 8
  %625 = getelementptr inbounds %struct.AstNode, ptr %624, i32 0, i32 1
  %626 = load ptr, ptr %625, align 8
  %627 = getelementptr inbounds ptr, ptr %626, i64 1
  %628 = load ptr, ptr %627, align 8
  %629 = getelementptr inbounds %struct.AstNode, ptr %628, i32 0, i32 6
  %630 = load ptr, ptr %629, align 8
  store ptr %630, ptr %28, align 8
  %631 = load ptr, ptr %28, align 8
  %632 = getelementptr inbounds %struct.Symbol, ptr %631, i32 0, i32 4
  %633 = load ptr, ptr %632, align 8
  %634 = call i32 (ptr, ...) @printf(ptr noundef @.str.203, ptr noundef %633)
  br label %635

635:                                              ; preds = %615, %595
  %636 = call i32 (ptr, ...) @printf(ptr noundef @.str.204)
  %637 = call i32 (ptr, ...) @printf(ptr noundef @.str.205)
  %638 = call i32 (ptr, ...) @printf(ptr noundef @.str.206)
  %639 = call i32 (ptr, ...) @printf(ptr noundef @.str.207)
  %640 = call i32 (ptr, ...) @printf(ptr noundef @.str.208)
  %641 = call i32 (ptr, ...) @printf(ptr noundef @.str.209)
  %642 = load ptr, ptr %24, align 8
  %643 = getelementptr inbounds %struct.Symbol, ptr %642, i32 0, i32 4
  %644 = load ptr, ptr %643, align 8
  %645 = call i32 (ptr, ...) @printf(ptr noundef @.str.210, ptr noundef %644)
  %646 = call i32 (ptr, ...) @printf(ptr noundef @.str.211)
  %647 = call i32 (ptr, ...) @printf(ptr noundef @.str.212)
  %648 = load ptr, ptr %24, align 8
  %649 = getelementptr inbounds %struct.Symbol, ptr %648, i32 0, i32 4
  %650 = load ptr, ptr %649, align 8
  %651 = call i32 (ptr, ...) @printf(ptr noundef @.str.213, ptr noundef %650)
  %652 = call i32 (ptr, ...) @printf(ptr noundef @.str.211)
  %653 = call i32 (ptr, ...) @printf(ptr noundef @.str.214)
  %654 = call i32 (ptr, ...) @printf(ptr noundef @.str.215)
  %655 = call i32 (ptr, ...) @printf(ptr noundef @.str.216)
  %656 = call i32 (ptr, ...) @printf(ptr noundef @.str.217)
  %657 = call i32 (ptr, ...) @printf(ptr noundef @.str.218)
  %658 = call i32 (ptr, ...) @printf(ptr noundef @.str.219)
  %659 = call i32 (ptr, ...) @printf(ptr noundef @.str.220)
  %660 = call i32 (ptr, ...) @printf(ptr noundef @.str.221)
  %661 = call i32 (ptr, ...) @printf(ptr noundef @.str.222)
  %662 = call i32 (ptr, ...) @printf(ptr noundef @.str.223)
  %663 = call i32 (ptr, ...) @printf(ptr noundef @.str.224)
  %664 = call i32 (ptr, ...) @printf(ptr noundef @.str.225)
  %665 = call i32 (ptr, ...) @printf(ptr noundef @.str.226)
  %666 = call i32 (ptr, ...) @printf(ptr noundef @.str.227)
  %667 = load ptr, ptr %24, align 8
  %668 = getelementptr inbounds %struct.Symbol, ptr %667, i32 0, i32 4
  %669 = load ptr, ptr %668, align 8
  %670 = call i32 (ptr, ...) @printf(ptr noundef @.str.228, ptr noundef %669)
  %671 = call i32 (ptr, ...) @printf(ptr noundef @.str.229)
  br label %904

672:                                              ; preds = %68
  %673 = load ptr, ptr %3, align 8
  %674 = getelementptr inbounds %struct.AstNode, ptr %673, i32 0, i32 1
  %675 = load ptr, ptr %674, align 8
  %676 = getelementptr inbounds ptr, ptr %675, i64 0
  %677 = load ptr, ptr %676, align 8
  %678 = getelementptr inbounds %struct.AstNode, ptr %677, i32 0, i32 6
  %679 = load ptr, ptr %678, align 8
  store ptr %679, ptr %29, align 8
  %680 = load ptr, ptr %3, align 8
  %681 = getelementptr inbounds %struct.AstNode, ptr %680, i32 0, i32 1
  %682 = load ptr, ptr %681, align 8
  %683 = getelementptr inbounds ptr, ptr %682, i64 1
  %684 = load ptr, ptr %683, align 8
  %685 = getelementptr inbounds %struct.AstNode, ptr %684, i32 0, i32 1
  %686 = load ptr, ptr %685, align 8
  %687 = getelementptr inbounds ptr, ptr %686, i64 0
  %688 = load ptr, ptr %687, align 8
  %689 = getelementptr inbounds %struct.AstNode, ptr %688, i32 0, i32 1
  %690 = load ptr, ptr %689, align 8
  %691 = getelementptr inbounds ptr, ptr %690, i64 0
  %692 = load ptr, ptr %691, align 8
  %693 = getelementptr inbounds %struct.AstNode, ptr %692, i32 0, i32 4
  %694 = getelementptr inbounds %struct.Token, ptr %693, i32 0, i32 0
  %695 = load i32, ptr %694, align 8
  %696 = icmp eq i32 %695, 46
  br i1 %696, label %697, label %717

697:                                              ; preds = %672
  %698 = load ptr, ptr %3, align 8
  %699 = getelementptr inbounds %struct.AstNode, ptr %698, i32 0, i32 1
  %700 = load ptr, ptr %699, align 8
  %701 = getelementptr inbounds ptr, ptr %700, i64 1
  %702 = load ptr, ptr %701, align 8
  %703 = getelementptr inbounds %struct.AstNode, ptr %702, i32 0, i32 1
  %704 = load ptr, ptr %703, align 8
  %705 = getelementptr inbounds ptr, ptr %704, i64 0
  %706 = load ptr, ptr %705, align 8
  %707 = getelementptr inbounds %struct.AstNode, ptr %706, i32 0, i32 1
  %708 = load ptr, ptr %707, align 8
  %709 = getelementptr inbounds ptr, ptr %708, i64 0
  %710 = load ptr, ptr %709, align 8
  %711 = getelementptr inbounds %struct.AstNode, ptr %710, i32 0, i32 4
  %712 = getelementptr inbounds %struct.Token, ptr %711, i32 0, i32 1
  %713 = load ptr, ptr %712, align 8
  %714 = call ptr @convertString(ptr noundef %713)
  store ptr %714, ptr %30, align 8
  %715 = load ptr, ptr %30, align 8
  %716 = call i32 (ptr, ...) @printf(ptr noundef @.str.230, ptr noundef %715)
  br label %737

717:                                              ; preds = %672
  %718 = load ptr, ptr %3, align 8
  %719 = getelementptr inbounds %struct.AstNode, ptr %718, i32 0, i32 1
  %720 = load ptr, ptr %719, align 8
  %721 = getelementptr inbounds ptr, ptr %720, i64 1
  %722 = load ptr, ptr %721, align 8
  %723 = getelementptr inbounds %struct.AstNode, ptr %722, i32 0, i32 1
  %724 = load ptr, ptr %723, align 8
  %725 = getelementptr inbounds ptr, ptr %724, i64 0
  %726 = load ptr, ptr %725, align 8
  %727 = getelementptr inbounds %struct.AstNode, ptr %726, i32 0, i32 1
  %728 = load ptr, ptr %727, align 8
  %729 = getelementptr inbounds ptr, ptr %728, i64 0
  %730 = load ptr, ptr %729, align 8
  %731 = getelementptr inbounds %struct.AstNode, ptr %730, i32 0, i32 6
  %732 = load ptr, ptr %731, align 8
  store ptr %732, ptr %31, align 8
  %733 = load ptr, ptr %31, align 8
  %734 = getelementptr inbounds %struct.Symbol, ptr %733, i32 0, i32 4
  %735 = load ptr, ptr %734, align 8
  %736 = call i32 (ptr, ...) @printf(ptr noundef @.str.231, ptr noundef %735)
  br label %737

737:                                              ; preds = %717, %697
  %738 = load ptr, ptr %3, align 8
  %739 = getelementptr inbounds %struct.AstNode, ptr %738, i32 0, i32 1
  %740 = load ptr, ptr %739, align 8
  %741 = getelementptr inbounds ptr, ptr %740, i64 1
  %742 = load ptr, ptr %741, align 8
  %743 = getelementptr inbounds %struct.AstNode, ptr %742, i32 0, i32 1
  %744 = load ptr, ptr %743, align 8
  %745 = getelementptr inbounds ptr, ptr %744, i64 0
  %746 = load ptr, ptr %745, align 8
  %747 = getelementptr inbounds %struct.AstNode, ptr %746, i32 0, i32 1
  %748 = load ptr, ptr %747, align 8
  %749 = getelementptr inbounds ptr, ptr %748, i64 1
  %750 = load ptr, ptr %749, align 8
  %751 = getelementptr inbounds %struct.AstNode, ptr %750, i32 0, i32 4
  %752 = getelementptr inbounds %struct.Token, ptr %751, i32 0, i32 0
  %753 = load i32, ptr %752, align 8
  %754 = icmp eq i32 %753, 48
  br i1 %754, label %755, label %774

755:                                              ; preds = %737
  %756 = load ptr, ptr %3, align 8
  %757 = getelementptr inbounds %struct.AstNode, ptr %756, i32 0, i32 1
  %758 = load ptr, ptr %757, align 8
  %759 = getelementptr inbounds ptr, ptr %758, i64 1
  %760 = load ptr, ptr %759, align 8
  %761 = getelementptr inbounds %struct.AstNode, ptr %760, i32 0, i32 1
  %762 = load ptr, ptr %761, align 8
  %763 = getelementptr inbounds ptr, ptr %762, i64 0
  %764 = load ptr, ptr %763, align 8
  %765 = getelementptr inbounds %struct.AstNode, ptr %764, i32 0, i32 1
  %766 = load ptr, ptr %765, align 8
  %767 = getelementptr inbounds ptr, ptr %766, i64 1
  %768 = load ptr, ptr %767, align 8
  %769 = getelementptr inbounds %struct.AstNode, ptr %768, i32 0, i32 4
  %770 = getelementptr inbounds %struct.Token, ptr %769, i32 0, i32 1
  %771 = load ptr, ptr %770, align 8
  store ptr %771, ptr %32, align 8
  %772 = load ptr, ptr %32, align 8
  %773 = call i32 (ptr, ...) @printf(ptr noundef @.str.232, ptr noundef %772)
  br label %794

774:                                              ; preds = %737
  %775 = load ptr, ptr %3, align 8
  %776 = getelementptr inbounds %struct.AstNode, ptr %775, i32 0, i32 1
  %777 = load ptr, ptr %776, align 8
  %778 = getelementptr inbounds ptr, ptr %777, i64 1
  %779 = load ptr, ptr %778, align 8
  %780 = getelementptr inbounds %struct.AstNode, ptr %779, i32 0, i32 1
  %781 = load ptr, ptr %780, align 8
  %782 = getelementptr inbounds ptr, ptr %781, i64 0
  %783 = load ptr, ptr %782, align 8
  %784 = getelementptr inbounds %struct.AstNode, ptr %783, i32 0, i32 1
  %785 = load ptr, ptr %784, align 8
  %786 = getelementptr inbounds ptr, ptr %785, i64 1
  %787 = load ptr, ptr %786, align 8
  %788 = getelementptr inbounds %struct.AstNode, ptr %787, i32 0, i32 6
  %789 = load ptr, ptr %788, align 8
  store ptr %789, ptr %33, align 8
  %790 = load ptr, ptr %33, align 8
  %791 = getelementptr inbounds %struct.Symbol, ptr %790, i32 0, i32 4
  %792 = load ptr, ptr %791, align 8
  %793 = call i32 (ptr, ...) @printf(ptr noundef @.str.233, ptr noundef %792)
  br label %794

794:                                              ; preds = %774, %755
  %795 = call i32 (ptr, ...) @printf(ptr noundef @.str.234)
  %796 = call i32 (ptr, ...) @printf(ptr noundef @.str.235)
  %797 = call i32 (ptr, ...) @printf(ptr noundef @.str.236)
  %798 = call i32 (ptr, ...) @printf(ptr noundef @.str.237)
  %799 = call i32 (ptr, ...) @printf(ptr noundef @.str.238)
  %800 = call i32 (ptr, ...) @printf(ptr noundef @.str.237)
  %801 = call i32 (ptr, ...) @printf(ptr noundef @.str.239)
  %802 = call i32 (ptr, ...) @printf(ptr noundef @.str.240)
  %803 = load ptr, ptr %29, align 8
  %804 = getelementptr inbounds %struct.Symbol, ptr %803, i32 0, i32 4
  %805 = load ptr, ptr %804, align 8
  %806 = call i32 (ptr, ...) @printf(ptr noundef @.str.241, ptr noundef %805)
  %807 = call i32 (ptr, ...) @printf(ptr noundef @.str.242)
  %808 = call i32 (ptr, ...) @printf(ptr noundef @.str.243)
  %809 = load ptr, ptr %29, align 8
  %810 = getelementptr inbounds %struct.Symbol, ptr %809, i32 0, i32 4
  %811 = load ptr, ptr %810, align 8
  %812 = call i32 (ptr, ...) @printf(ptr noundef @.str.228, ptr noundef %811)
  %813 = call i32 (ptr, ...) @printf(ptr noundef @.str.244)
  br label %904

814:                                              ; preds = %68
  %815 = load ptr, ptr %3, align 8
  %816 = getelementptr inbounds %struct.AstNode, ptr %815, i32 0, i32 1
  %817 = load ptr, ptr %816, align 8
  %818 = getelementptr inbounds ptr, ptr %817, i64 1
  %819 = load ptr, ptr %818, align 8
  %820 = getelementptr inbounds %struct.AstNode, ptr %819, i32 0, i32 1
  %821 = load ptr, ptr %820, align 8
  %822 = getelementptr inbounds ptr, ptr %821, i64 0
  %823 = load ptr, ptr %822, align 8
  %824 = getelementptr inbounds %struct.AstNode, ptr %823, i32 0, i32 1
  %825 = load ptr, ptr %824, align 8
  %826 = getelementptr inbounds ptr, ptr %825, i64 0
  %827 = load ptr, ptr %826, align 8
  %828 = getelementptr inbounds %struct.AstNode, ptr %827, i32 0, i32 4
  %829 = getelementptr inbounds %struct.Token, ptr %828, i32 0, i32 0
  %830 = load i32, ptr %829, align 8
  %831 = icmp eq i32 %830, 48
  br i1 %831, label %832, label %850

832:                                              ; preds = %814
  %833 = load ptr, ptr %3, align 8
  %834 = getelementptr inbounds %struct.AstNode, ptr %833, i32 0, i32 1
  %835 = load ptr, ptr %834, align 8
  %836 = getelementptr inbounds ptr, ptr %835, i64 1
  %837 = load ptr, ptr %836, align 8
  %838 = getelementptr inbounds %struct.AstNode, ptr %837, i32 0, i32 1
  %839 = load ptr, ptr %838, align 8
  %840 = getelementptr inbounds ptr, ptr %839, i64 0
  %841 = load ptr, ptr %840, align 8
  %842 = getelementptr inbounds %struct.AstNode, ptr %841, i32 0, i32 1
  %843 = load ptr, ptr %842, align 8
  %844 = getelementptr inbounds ptr, ptr %843, i64 0
  %845 = load ptr, ptr %844, align 8
  %846 = getelementptr inbounds %struct.AstNode, ptr %845, i32 0, i32 4
  %847 = getelementptr inbounds %struct.Token, ptr %846, i32 0, i32 1
  %848 = load ptr, ptr %847, align 8
  %849 = call i32 (ptr, ...) @printf(ptr noundef @.str.245, ptr noundef %848)
  br label %890

850:                                              ; preds = %814
  %851 = load ptr, ptr %3, align 8
  %852 = getelementptr inbounds %struct.AstNode, ptr %851, i32 0, i32 1
  %853 = load ptr, ptr %852, align 8
  %854 = getelementptr inbounds ptr, ptr %853, i64 1
  %855 = load ptr, ptr %854, align 8
  %856 = getelementptr inbounds %struct.AstNode, ptr %855, i32 0, i32 1
  %857 = load ptr, ptr %856, align 8
  %858 = getelementptr inbounds ptr, ptr %857, i64 0
  %859 = load ptr, ptr %858, align 8
  %860 = getelementptr inbounds %struct.AstNode, ptr %859, i32 0, i32 1
  %861 = load ptr, ptr %860, align 8
  %862 = getelementptr inbounds ptr, ptr %861, i64 0
  %863 = load ptr, ptr %862, align 8
  %864 = getelementptr inbounds %struct.AstNode, ptr %863, i32 0, i32 4
  %865 = getelementptr inbounds %struct.Token, ptr %864, i32 0, i32 0
  %866 = load i32, ptr %865, align 8
  %867 = icmp eq i32 %866, 47
  br i1 %867, label %868, label %889

868:                                              ; preds = %850
  %869 = load ptr, ptr %3, align 8
  %870 = getelementptr inbounds %struct.AstNode, ptr %869, i32 0, i32 1
  %871 = load ptr, ptr %870, align 8
  %872 = getelementptr inbounds ptr, ptr %871, i64 1
  %873 = load ptr, ptr %872, align 8
  %874 = getelementptr inbounds %struct.AstNode, ptr %873, i32 0, i32 1
  %875 = load ptr, ptr %874, align 8
  %876 = getelementptr inbounds ptr, ptr %875, i64 0
  %877 = load ptr, ptr %876, align 8
  %878 = getelementptr inbounds %struct.AstNode, ptr %877, i32 0, i32 1
  %879 = load ptr, ptr %878, align 8
  %880 = getelementptr inbounds ptr, ptr %879, i64 0
  %881 = load ptr, ptr %880, align 8
  %882 = getelementptr inbounds %struct.AstNode, ptr %881, i32 0, i32 6
  %883 = load ptr, ptr %882, align 8
  store ptr %883, ptr %34, align 8
  %884 = load ptr, ptr %34, align 8
  %885 = getelementptr inbounds %struct.Symbol, ptr %884, i32 0, i32 4
  %886 = load ptr, ptr %885, align 8
  %887 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %886)
  %888 = call i32 (ptr, ...) @printf(ptr noundef @.str.168)
  br label %889

889:                                              ; preds = %868, %850
  br label %890

890:                                              ; preds = %889, %832
  %891 = call i32 (ptr, ...) @printf(ptr noundef @.str.246)
  %892 = load ptr, ptr %3, align 8
  %893 = getelementptr inbounds %struct.AstNode, ptr %892, i32 0, i32 1
  %894 = load ptr, ptr %893, align 8
  %895 = getelementptr inbounds ptr, ptr %894, i64 0
  %896 = load ptr, ptr %895, align 8
  %897 = getelementptr inbounds %struct.AstNode, ptr %896, i32 0, i32 6
  %898 = load ptr, ptr %897, align 8
  %899 = getelementptr inbounds %struct.Symbol, ptr %898, i32 0, i32 4
  %900 = load ptr, ptr %899, align 8
  %901 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %900)
  br label %904

902:                                              ; preds = %68
  store i32 1, ptr %2, align 4
  br label %905

903:                                              ; preds = %68
  store i32 1, ptr %2, align 4
  br label %905

904:                                              ; preds = %890, %794, %635, %431, %401, %346, %314, %313, %132, %103, %70
  store i32 0, ptr %2, align 4
  br label %905

905:                                              ; preds = %904, %903, %902
  %906 = load i32, ptr %2, align 4
  ret i32 %906
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @createAssignement(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.AstNode, ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 1
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.AstNode, ptr %10, i32 0, i32 2
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %66

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.AstNode, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.AstNode, ptr %19, i32 0, i32 4
  %21 = getelementptr inbounds %struct.Token, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp ne i32 %22, 49
  br i1 %23, label %24, label %41

24:                                               ; preds = %14
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.AstNode, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 0
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.AstNode, ptr %29, i32 0, i32 6
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %3, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.AstNode, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 1
  %36 = load ptr, ptr %35, align 8
  call void @createExpr(ptr noundef %36)
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.Symbol, ptr %37, i32 0, i32 4
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %39)
  br label %65

41:                                               ; preds = %14
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds %struct.AstNode, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 1
  %46 = load ptr, ptr %45, align 8
  call void @createExpr(ptr noundef %46)
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.AstNode, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds ptr, ptr %49, i64 0
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds %struct.AstNode, ptr %51, i32 0, i32 4
  %53 = getelementptr inbounds %struct.Token, ptr %52, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.143, ptr noundef %54)
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds %struct.AstNode, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds ptr, ptr %58, i64 0
  %60 = load ptr, ptr %59, align 8
  %61 = getelementptr inbounds %struct.AstNode, ptr %60, i32 0, i32 4
  %62 = getelementptr inbounds %struct.Token, ptr %61, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.144, ptr noundef %63)
  br label %65

65:                                               ; preds = %41, %24
  br label %216

66:                                               ; preds = %1
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds %struct.AstNode, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds ptr, ptr %69, i64 1
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds %struct.AstNode, ptr %71, i32 0, i32 2
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %153

75:                                               ; preds = %66
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr inbounds %struct.AstNode, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds ptr, ptr %78, i64 1
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.AstNode, ptr %80, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds ptr, ptr %82, i64 0
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds %struct.AstNode, ptr %84, i32 0, i32 3
  %86 = load i32, ptr %85, align 4
  %87 = icmp eq i32 %86, 6
  br i1 %87, label %88, label %151

88:                                               ; preds = %75
  store i32 0, ptr %4, align 4
  br label %89

89:                                               ; preds = %124, %88
  %90 = load i32, ptr %4, align 4
  %91 = load ptr, ptr %2, align 8
  %92 = getelementptr inbounds %struct.AstNode, ptr %91, i32 0, i32 1
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr inbounds ptr, ptr %93, i64 1
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds %struct.AstNode, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds ptr, ptr %97, i64 0
  %99 = load ptr, ptr %98, align 8
  %100 = getelementptr inbounds %struct.AstNode, ptr %99, i32 0, i32 2
  %101 = load i32, ptr %100, align 8
  %102 = icmp slt i32 %90, %101
  br i1 %102, label %103, label %127

103:                                              ; preds = %89
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr inbounds %struct.AstNode, ptr %104, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr inbounds ptr, ptr %106, i64 1
  %108 = load ptr, ptr %107, align 8
  %109 = getelementptr inbounds %struct.AstNode, ptr %108, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  %111 = getelementptr inbounds ptr, ptr %110, i64 0
  %112 = load ptr, ptr %111, align 8
  %113 = getelementptr inbounds %struct.AstNode, ptr %112, i32 0, i32 1
  %114 = load ptr, ptr %113, align 8
  %115 = load i32, ptr %4, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds ptr, ptr %114, i64 %116
  %118 = load ptr, ptr %117, align 8
  %119 = getelementptr inbounds %struct.AstNode, ptr %118, i32 0, i32 6
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds %struct.Symbol, ptr %120, i32 0, i32 4
  %122 = load ptr, ptr %121, align 8
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %122)
  br label %124

124:                                              ; preds = %103
  %125 = load i32, ptr %4, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, ptr %4, align 4
  br label %89

127:                                              ; preds = %89
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  %129 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr inbounds %struct.AstNode, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds ptr, ptr %132, i64 1
  %134 = load ptr, ptr %133, align 8
  %135 = getelementptr inbounds %struct.AstNode, ptr %134, i32 0, i32 4
  %136 = getelementptr inbounds %struct.Token, ptr %135, i32 0, i32 1
  %137 = load ptr, ptr %136, align 8
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.60, ptr noundef %137)
  %139 = call i32 (ptr, ...) @printf(ptr noundef @.str.145)
  %140 = call i32 (ptr, ...) @printf(ptr noundef @.str.47)
  %141 = load ptr, ptr %2, align 8
  %142 = getelementptr inbounds %struct.AstNode, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  %144 = getelementptr inbounds ptr, ptr %143, i64 0
  %145 = load ptr, ptr %144, align 8
  %146 = getelementptr inbounds %struct.AstNode, ptr %145, i32 0, i32 6
  %147 = load ptr, ptr %146, align 8
  %148 = getelementptr inbounds %struct.Symbol, ptr %147, i32 0, i32 4
  %149 = load ptr, ptr %148, align 8
  %150 = call i32 (ptr, ...) @printf(ptr noundef @.str.146, ptr noundef %149)
  br label %152

151:                                              ; preds = %75
  br label %217

152:                                              ; preds = %127
  br label %215

153:                                              ; preds = %66
  %154 = load ptr, ptr %2, align 8
  %155 = getelementptr inbounds %struct.AstNode, ptr %154, i32 0, i32 1
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr inbounds ptr, ptr %156, i64 1
  %158 = load ptr, ptr %157, align 8
  %159 = getelementptr inbounds %struct.AstNode, ptr %158, i32 0, i32 2
  %160 = load i32, ptr %159, align 8
  %161 = icmp sgt i32 %160, 1
  br i1 %161, label %162, label %214

162:                                              ; preds = %153
  %163 = load ptr, ptr %2, align 8
  %164 = getelementptr inbounds %struct.AstNode, ptr %163, i32 0, i32 1
  %165 = load ptr, ptr %164, align 8
  %166 = getelementptr inbounds ptr, ptr %165, i64 0
  %167 = load ptr, ptr %166, align 8
  %168 = getelementptr inbounds %struct.AstNode, ptr %167, i32 0, i32 4
  %169 = getelementptr inbounds %struct.Token, ptr %168, i32 0, i32 0
  %170 = load i32, ptr %169, align 8
  %171 = icmp ne i32 %170, 49
  br i1 %171, label %172, label %189

172:                                              ; preds = %162
  %173 = load ptr, ptr %2, align 8
  %174 = getelementptr inbounds %struct.AstNode, ptr %173, i32 0, i32 1
  %175 = load ptr, ptr %174, align 8
  %176 = getelementptr inbounds ptr, ptr %175, i64 0
  %177 = load ptr, ptr %176, align 8
  %178 = getelementptr inbounds %struct.AstNode, ptr %177, i32 0, i32 6
  %179 = load ptr, ptr %178, align 8
  store ptr %179, ptr %5, align 8
  %180 = load ptr, ptr %2, align 8
  %181 = getelementptr inbounds %struct.AstNode, ptr %180, i32 0, i32 1
  %182 = load ptr, ptr %181, align 8
  %183 = getelementptr inbounds ptr, ptr %182, i64 1
  %184 = load ptr, ptr %183, align 8
  call void @createExpr(ptr noundef %184)
  %185 = load ptr, ptr %5, align 8
  %186 = getelementptr inbounds %struct.Symbol, ptr %185, i32 0, i32 4
  %187 = load ptr, ptr %186, align 8
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str.49, ptr noundef %187)
  br label %213

189:                                              ; preds = %162
  %190 = load ptr, ptr %2, align 8
  %191 = getelementptr inbounds %struct.AstNode, ptr %190, i32 0, i32 1
  %192 = load ptr, ptr %191, align 8
  %193 = getelementptr inbounds ptr, ptr %192, i64 1
  %194 = load ptr, ptr %193, align 8
  call void @createExpr(ptr noundef %194)
  %195 = load ptr, ptr %2, align 8
  %196 = getelementptr inbounds %struct.AstNode, ptr %195, i32 0, i32 1
  %197 = load ptr, ptr %196, align 8
  %198 = getelementptr inbounds ptr, ptr %197, i64 0
  %199 = load ptr, ptr %198, align 8
  %200 = getelementptr inbounds %struct.AstNode, ptr %199, i32 0, i32 4
  %201 = getelementptr inbounds %struct.Token, ptr %200, i32 0, i32 1
  %202 = load ptr, ptr %201, align 8
  %203 = call i32 (ptr, ...) @printf(ptr noundef @.str.143, ptr noundef %202)
  %204 = load ptr, ptr %2, align 8
  %205 = getelementptr inbounds %struct.AstNode, ptr %204, i32 0, i32 1
  %206 = load ptr, ptr %205, align 8
  %207 = getelementptr inbounds ptr, ptr %206, i64 0
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds %struct.AstNode, ptr %208, i32 0, i32 4
  %210 = getelementptr inbounds %struct.Token, ptr %209, i32 0, i32 1
  %211 = load ptr, ptr %210, align 8
  %212 = call i32 (ptr, ...) @printf(ptr noundef @.str.144, ptr noundef %211)
  br label %213

213:                                              ; preds = %189, %172
  br label %214

214:                                              ; preds = %213, %153
  br label %215

215:                                              ; preds = %214, %152
  br label %216

216:                                              ; preds = %215, %65
  br label %217

217:                                              ; preds = %216, %151
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @createExpr(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.AstNodeStack, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @initStack(ptr noundef %3, i64 noundef 16)
  %9 = load ptr, ptr %2, align 8
  call void @invPostOrder(ptr noundef %3, ptr noundef %9)
  store i64 0, ptr %4, align 8
  br label %10

10:                                               ; preds = %243, %1
  %11 = load i64, ptr %4, align 8
  %12 = getelementptr inbounds %struct.AstNodeStack, ptr %3, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = icmp ult i64 %11, %13
  br i1 %14, label %15, label %246

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.AstNodeStack, ptr %3, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %4, align 8
  %19 = getelementptr inbounds ptr, ptr %17, i64 %18
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %5, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.AstNode, ptr %21, i32 0, i32 4
  %23 = getelementptr inbounds %struct.Token, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  switch i32 %24, label %241 [
    i32 47, label %25
    i32 49, label %33
    i32 46, label %39
    i32 5, label %48
    i32 48, label %99
    i32 0, label %105
    i32 1, label %145
    i32 2, label %147
    i32 3, label %203
    i32 6, label %224
    i32 7, label %226
    i32 8, label %228
    i32 9, label %231
    i32 10, label %234
    i32 11, label %236
    i32 50, label %239
  ]

25:                                               ; preds = %15
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds %struct.AstNode, ptr %26, i32 0, i32 6
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.Symbol, ptr %29, i32 0, i32 4
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %31)
  br label %242

33:                                               ; preds = %15
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.AstNode, ptr %34, i32 0, i32 4
  %36 = getelementptr inbounds %struct.Token, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.62, ptr noundef %37)
  br label %242

39:                                               ; preds = %15
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds %struct.AstNode, ptr %40, i32 0, i32 4
  %42 = getelementptr inbounds %struct.Token, ptr %41, i32 0, i32 5
  %43 = load ptr, ptr %42, align 8
  %44 = call ptr @convertString(ptr noundef %43)
  store ptr %44, ptr %7, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.63, ptr noundef %45)
  %47 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %47)
  br label %242

48:                                               ; preds = %15
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds %struct.AstNode, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds ptr, ptr %51, i64 0
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds %struct.AstNode, ptr %53, i32 0, i32 4
  %55 = getelementptr inbounds %struct.Token, ptr %54, i32 0, i32 0
  %56 = load i32, ptr %55, align 8
  switch i32 %56, label %96 [
    i32 44, label %57
    i32 43, label %70
    i32 45, label %83
  ]

57:                                               ; preds = %48
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.65)
  %60 = call i32 @nextNum(i1 noundef zeroext false)
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.66, i32 noundef %60)
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  %63 = call i32 @nextNum(i1 noundef zeroext false)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.68, i32 noundef %63)
  %65 = call i32 @nextNum(i1 noundef zeroext false)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.69, i32 noundef %65)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %68 = call i32 @nextNum(i1 noundef zeroext false)
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.71, i32 noundef %68)
  br label %98

70:                                               ; preds = %48
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.65)
  %73 = call i32 @nextNum(i1 noundef zeroext false)
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.72, i32 noundef %73)
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  %76 = call i32 @nextNum(i1 noundef zeroext false)
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.68, i32 noundef %76)
  %78 = call i32 @nextNum(i1 noundef zeroext false)
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.69, i32 noundef %78)
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %81 = call i32 @nextNum(i1 noundef zeroext false)
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.71, i32 noundef %81)
  br label %98

83:                                               ; preds = %48
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.65)
  %86 = call i32 @nextNum(i1 noundef zeroext false)
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.73, i32 noundef %86)
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  %89 = call i32 @nextNum(i1 noundef zeroext false)
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.68, i32 noundef %89)
  %91 = call i32 @nextNum(i1 noundef zeroext false)
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.69, i32 noundef %91)
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %94 = call i32 @nextNum(i1 noundef zeroext false)
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.71, i32 noundef %94)
  br label %98

96:                                               ; preds = %48
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.74)
  br label %98

98:                                               ; preds = %96, %83, %70, %57
  br label %242

99:                                               ; preds = %15
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.AstNode, ptr %100, i32 0, i32 4
  %102 = getelementptr inbounds %struct.Token, ptr %101, i32 0, i32 5
  %103 = load double, ptr %102, align 8
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str.75, double noundef %103)
  br label %242

105:                                              ; preds = %15
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.76)
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.77)
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.78)
  %109 = call i32 @nextNum(i1 noundef zeroext true)
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str.79, i32 noundef %109)
  %111 = call i32 @nextNum(i1 noundef zeroext false)
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.80, i32 noundef %111)
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.81)
  %114 = call i32 @nextNum(i1 noundef zeroext false)
  %115 = call i32 (ptr, ...) @printf(ptr noundef @.str.79, i32 noundef %114)
  %116 = call i32 @nextNum(i1 noundef zeroext false)
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.80, i32 noundef %116)
  %118 = call i32 @nextNum(i1 noundef zeroext false)
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.82, i32 noundef %118)
  %120 = call i32 (ptr, ...) @printf(ptr noundef @.str.78)
  %121 = call i32 @nextNum(i1 noundef zeroext false)
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.83, i32 noundef %121)
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.84)
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.85)
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.86)
  %126 = call i32 @nextNum(i1 noundef zeroext false)
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.87, i32 noundef %126)
  %128 = call i32 @nextNum(i1 noundef zeroext false)
  %129 = call i32 (ptr, ...) @printf(ptr noundef @.str.88, i32 noundef %128)
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.78)
  %131 = call i32 @nextNum(i1 noundef zeroext false)
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str.89, i32 noundef %131)
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.90)
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.91)
  %135 = call i32 @nextNum(i1 noundef zeroext false)
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str.87, i32 noundef %135)
  %137 = call i32 @nextNum(i1 noundef zeroext false)
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.92, i32 noundef %137)
  %139 = call i32 (ptr, ...) @printf(ptr noundef @.str.86)
  %140 = call i32 @nextNum(i1 noundef zeroext false)
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.93, i32 noundef %140)
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str.94)
  %143 = call i32 @nextNum(i1 noundef zeroext false)
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str.95, i32 noundef %143)
  br label %242

145:                                              ; preds = %15
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.96)
  br label %242

147:                                              ; preds = %15
  %148 = call i32 @nextNum(i1 noundef zeroext true)
  store i32 %148, ptr %8, align 4
  %149 = call i32 (ptr, ...) @printf(ptr noundef @.str.97)
  %150 = call i32 (ptr, ...) @printf(ptr noundef @.str.98)
  %151 = call i32 (ptr, ...) @printf(ptr noundef @.str.99)
  %152 = load i32, ptr %8, align 4
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.100, i32 noundef %152)
  %154 = call i32 (ptr, ...) @printf(ptr noundef @.str.99)
  %155 = load i32, ptr %8, align 4
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str.101, i32 noundef %155)
  %157 = call i32 (ptr, ...) @printf(ptr noundef @.str.94)
  %158 = load i32, ptr %8, align 4
  %159 = call i32 (ptr, ...) @printf(ptr noundef @.str.102, i32 noundef %158)
  %160 = call i32 (ptr, ...) @printf(ptr noundef @.str.103)
  %161 = load i32, ptr %8, align 4
  %162 = call i32 (ptr, ...) @printf(ptr noundef @.str.104, i32 noundef %161)
  %163 = call i32 (ptr, ...) @printf(ptr noundef @.str.103)
  %164 = load i32, ptr %8, align 4
  %165 = call i32 (ptr, ...) @printf(ptr noundef @.str.105, i32 noundef %164)
  %166 = call i32 (ptr, ...) @printf(ptr noundef @.str.94)
  %167 = load i32, ptr %8, align 4
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.106, i32 noundef %167)
  %169 = call i32 (ptr, ...) @printf(ptr noundef @.str.107)
  %170 = call i32 (ptr, ...) @printf(ptr noundef @.str.108)
  %171 = load i32, ptr %8, align 4
  %172 = call i32 (ptr, ...) @printf(ptr noundef @.str.109, i32 noundef %171)
  %173 = load i32, ptr %8, align 4
  %174 = call i32 (ptr, ...) @printf(ptr noundef @.str.110, i32 noundef %173)
  %175 = call i32 (ptr, ...) @printf(ptr noundef @.str.111)
  %176 = call i32 (ptr, ...) @printf(ptr noundef @.str.112)
  %177 = load i32, ptr %8, align 4
  %178 = call i32 (ptr, ...) @printf(ptr noundef @.str.113, i32 noundef %177)
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.114)
  %180 = call i32 (ptr, ...) @printf(ptr noundef @.str.115)
  %181 = load i32, ptr %8, align 4
  %182 = call i32 (ptr, ...) @printf(ptr noundef @.str.116, i32 noundef %181)
  %183 = call i32 (ptr, ...) @printf(ptr noundef @.str.117)
  %184 = call i32 (ptr, ...) @printf(ptr noundef @.str.118)
  %185 = call i32 (ptr, ...) @printf(ptr noundef @.str.119)
  %186 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %187 = load i32, ptr %8, align 4
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str.120, i32 noundef %187)
  %189 = call i32 (ptr, ...) @printf(ptr noundef @.str.121)
  %190 = call i32 (ptr, ...) @printf(ptr noundef @.str.122)
  %191 = load i32, ptr %8, align 4
  %192 = call i32 (ptr, ...) @printf(ptr noundef @.str.123, i32 noundef %191)
  %193 = load i32, ptr %8, align 4
  %194 = call i32 (ptr, ...) @printf(ptr noundef @.str.124, i32 noundef %193)
  %195 = call i32 (ptr, ...) @printf(ptr noundef @.str.108)
  %196 = load i32, ptr %8, align 4
  %197 = call i32 (ptr, ...) @printf(ptr noundef @.str.109, i32 noundef %196)
  %198 = load i32, ptr %8, align 4
  %199 = call i32 (ptr, ...) @printf(ptr noundef @.str.125, i32 noundef %198)
  %200 = call i32 (ptr, ...) @printf(ptr noundef @.str.94)
  %201 = call i32 @nextNum(i1 noundef zeroext false)
  %202 = call i32 (ptr, ...) @printf(ptr noundef @.str.126, i32 noundef %201)
  br label %242

203:                                              ; preds = %15
  %204 = call i32 (ptr, ...) @printf(ptr noundef @.str.127)
  %205 = call i32 @nextNum(i1 noundef zeroext false)
  %206 = call i32 (ptr, ...) @printf(ptr noundef @.str.128, i32 noundef %205)
  %207 = call i32 (ptr, ...) @printf(ptr noundef @.str.94)
  %208 = call i32 @nextNum(i1 noundef zeroext false)
  %209 = call i32 (ptr, ...) @printf(ptr noundef @.str.129, i32 noundef %208)
  %210 = call i32 (ptr, ...) @printf(ptr noundef @.str.130)
  %211 = call i32 (ptr, ...) @printf(ptr noundef @.str.131)
  %212 = call i32 (ptr, ...) @printf(ptr noundef @.str.132)
  %213 = call i32 (ptr, ...) @printf(ptr noundef @.str.133)
  %214 = call i32 @nextNum(i1 noundef zeroext false)
  %215 = call i32 (ptr, ...) @printf(ptr noundef @.str.134, i32 noundef %214)
  %216 = call i32 (ptr, ...) @printf(ptr noundef @.str.135)
  %217 = call i32 @nextNum(i1 noundef zeroext false)
  %218 = call i32 (ptr, ...) @printf(ptr noundef @.str.136, i32 noundef %217)
  %219 = call i32 @nextNum(i1 noundef zeroext false)
  %220 = call i32 (ptr, ...) @printf(ptr noundef @.str.137, i32 noundef %219)
  %221 = call i32 (ptr, ...) @printf(ptr noundef @.str.138)
  %222 = call i32 @nextNum(i1 noundef zeroext false)
  %223 = call i32 (ptr, ...) @printf(ptr noundef @.str.139, i32 noundef %222)
  br label %242

224:                                              ; preds = %15
  %225 = call i32 (ptr, ...) @printf(ptr noundef @.str.140)
  br label %242

226:                                              ; preds = %15
  %227 = call i32 (ptr, ...) @printf(ptr noundef @.str.119)
  br label %242

228:                                              ; preds = %15
  %229 = call i32 (ptr, ...) @printf(ptr noundef @.str.119)
  %230 = call i32 (ptr, ...) @printf(ptr noundef @.str.141)
  br label %242

231:                                              ; preds = %15
  %232 = call i32 (ptr, ...) @printf(ptr noundef @.str.140)
  %233 = call i32 (ptr, ...) @printf(ptr noundef @.str.141)
  br label %242

234:                                              ; preds = %15
  %235 = call i32 (ptr, ...) @printf(ptr noundef @.str.142)
  br label %242

236:                                              ; preds = %15
  %237 = call i32 (ptr, ...) @printf(ptr noundef @.str.142)
  %238 = call i32 (ptr, ...) @printf(ptr noundef @.str.141)
  br label %242

239:                                              ; preds = %15
  %240 = call i32 (ptr, ...) @printf(ptr noundef @.str.58)
  br label %242

241:                                              ; preds = %15
  br label %242

242:                                              ; preds = %241, %239, %236, %234, %231, %228, %226, %224, %203, %147, %145, %105, %99, %98, %39, %33, %25
  br label %243

243:                                              ; preds = %242
  %244 = load i64, ptr %4, align 8
  %245 = add i64 %244, 1
  store i64 %245, ptr %4, align 8
  br label %10

246:                                              ; preds = %10
  call void @emptyStack(ptr noundef %3)
  call void @freeStack(ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @nextNum(i1 noundef zeroext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = zext i1 %0 to i8
  store i8 %4, ptr %3, align 1
  %5 = load i8, ptr %3, align 1
  %6 = trunc i8 %5 to i1
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr @unusedNum, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr @unusedNum, align 4
  store i32 %9, ptr %2, align 4
  br label %12

10:                                               ; preds = %1
  %11 = load i32, ptr @unusedNum, align 4
  store i32 %11, ptr %2, align 4
  br label %12

12:                                               ; preds = %10, %7
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @createIfExpression(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.AstNode, ptr %5, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 0
  %9 = load ptr, ptr %8, align 8
  call void @createExpr(ptr noundef %9)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.AstNode, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 0
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.AstNode, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 8
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %20 = load i32, ptr %4, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.147, i32 noundef %20)
  br label %37

22:                                               ; preds = %2
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.58)
  %24 = load i32, ptr %4, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.148, i32 noundef %24)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %27 = load i32, ptr %4, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.149, i32 noundef %27)
  %29 = load i32, ptr %4, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.150, i32 noundef %29)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  %32 = load i32, ptr %4, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.151, i32 noundef %32)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %35 = load i32, ptr %4, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.152, i32 noundef %35)
  br label %37

37:                                               ; preds = %22, %18
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @convertString(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = call i64 @strlen(ptr noundef %9) #14
  %11 = trunc i64 %10 to i32
  store i32 %11, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %47, %1
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %50

16:                                               ; preds = %12
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp sle i32 %22, 32
  br i1 %23, label %40, label %24

24:                                               ; preds = %16
  %25 = load ptr, ptr %2, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %25, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 35
  br i1 %31, label %40, label %32

32:                                               ; preds = %24
  %33 = load ptr, ptr %2, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr %33, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, 92
  br i1 %39, label %40, label %43

40:                                               ; preds = %32, %24, %16
  %41 = load i32, ptr %4, align 4
  %42 = add nsw i32 %41, 4
  store i32 %42, ptr %4, align 4
  br label %46

43:                                               ; preds = %32
  %44 = load i32, ptr %4, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %4, align 4
  br label %46

46:                                               ; preds = %43, %40
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %5, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %5, align 4
  br label %12

50:                                               ; preds = %12
  %51 = load i32, ptr %4, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = mul i64 1, %53
  %55 = call ptr @malloc(i64 noundef %54) #11
  store ptr %55, ptr %6, align 8
  %56 = load ptr, ptr %6, align 8
  %57 = icmp eq ptr %56, null
  br i1 %57, label %58, label %59

58:                                               ; preds = %50
  call void @handleError(i32 noundef 99) #12
  unreachable

59:                                               ; preds = %50
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %60

60:                                               ; preds = %357, %59
  %61 = load i32, ptr %8, align 4
  %62 = load i32, ptr %3, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %360

64:                                               ; preds = %60
  %65 = load ptr, ptr %2, align 8
  %66 = load i32, ptr %8, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, ptr %65, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp sle i32 %70, 32
  br i1 %71, label %88, label %72

72:                                               ; preds = %64
  %73 = load ptr, ptr %2, align 8
  %74 = load i32, ptr %8, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %73, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %78, 35
  br i1 %79, label %88, label %80

80:                                               ; preds = %72
  %81 = load ptr, ptr %2, align 8
  %82 = load i32, ptr %8, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, ptr %81, i64 %83
  %85 = load i8, ptr %84, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp eq i32 %86, 92
  br i1 %87, label %88, label %345

88:                                               ; preds = %80, %72, %64
  %89 = load ptr, ptr %2, align 8
  %90 = load i32, ptr %8, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, ptr %89, i64 %91
  %93 = load i8, ptr %92, align 1
  %94 = sext i8 %93 to i32
  %95 = icmp eq i32 %94, 92
  br i1 %95, label %96, label %295

96:                                               ; preds = %88
  %97 = load ptr, ptr %2, align 8
  %98 = load i32, ptr %8, align 4
  %99 = add nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, ptr %97, i64 %100
  %102 = load i8, ptr %101, align 1
  %103 = sext i8 %102 to i32
  switch i32 %103, label %293 [
    i32 34, label %104
    i32 92, label %125
    i32 37, label %146
    i32 101, label %167
    i32 102, label %188
    i32 110, label %209
    i32 114, label %230
    i32 116, label %251
    i32 118, label %272
  ]

104:                                              ; preds = %96
  %105 = load ptr, ptr %6, align 8
  %106 = load i32, ptr %7, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %7, align 4
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds i8, ptr %105, i64 %108
  store i8 92, ptr %109, align 1
  %110 = load ptr, ptr %6, align 8
  %111 = load i32, ptr %7, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %7, align 4
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds i8, ptr %110, i64 %113
  store i8 48, ptr %114, align 1
  %115 = load ptr, ptr %6, align 8
  %116 = load i32, ptr %7, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %7, align 4
  %118 = sext i32 %116 to i64
  %119 = getelementptr inbounds i8, ptr %115, i64 %118
  store i8 51, ptr %119, align 1
  %120 = load ptr, ptr %6, align 8
  %121 = load i32, ptr %7, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %7, align 4
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds i8, ptr %120, i64 %123
  store i8 52, ptr %124, align 1
  br label %294

125:                                              ; preds = %96
  %126 = load ptr, ptr %6, align 8
  %127 = load i32, ptr %7, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %7, align 4
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds i8, ptr %126, i64 %129
  store i8 92, ptr %130, align 1
  %131 = load ptr, ptr %6, align 8
  %132 = load i32, ptr %7, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, ptr %7, align 4
  %134 = sext i32 %132 to i64
  %135 = getelementptr inbounds i8, ptr %131, i64 %134
  store i8 48, ptr %135, align 1
  %136 = load ptr, ptr %6, align 8
  %137 = load i32, ptr %7, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, ptr %7, align 4
  %139 = sext i32 %137 to i64
  %140 = getelementptr inbounds i8, ptr %136, i64 %139
  store i8 57, ptr %140, align 1
  %141 = load ptr, ptr %6, align 8
  %142 = load i32, ptr %7, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %7, align 4
  %144 = sext i32 %142 to i64
  %145 = getelementptr inbounds i8, ptr %141, i64 %144
  store i8 50, ptr %145, align 1
  br label %294

146:                                              ; preds = %96
  %147 = load ptr, ptr %6, align 8
  %148 = load i32, ptr %7, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %7, align 4
  %150 = sext i32 %148 to i64
  %151 = getelementptr inbounds i8, ptr %147, i64 %150
  store i8 92, ptr %151, align 1
  %152 = load ptr, ptr %6, align 8
  %153 = load i32, ptr %7, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %7, align 4
  %155 = sext i32 %153 to i64
  %156 = getelementptr inbounds i8, ptr %152, i64 %155
  store i8 48, ptr %156, align 1
  %157 = load ptr, ptr %6, align 8
  %158 = load i32, ptr %7, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, ptr %7, align 4
  %160 = sext i32 %158 to i64
  %161 = getelementptr inbounds i8, ptr %157, i64 %160
  store i8 51, ptr %161, align 1
  %162 = load ptr, ptr %6, align 8
  %163 = load i32, ptr %7, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, ptr %7, align 4
  %165 = sext i32 %163 to i64
  %166 = getelementptr inbounds i8, ptr %162, i64 %165
  store i8 55, ptr %166, align 1
  br label %294

167:                                              ; preds = %96
  %168 = load ptr, ptr %6, align 8
  %169 = load i32, ptr %7, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, ptr %7, align 4
  %171 = sext i32 %169 to i64
  %172 = getelementptr inbounds i8, ptr %168, i64 %171
  store i8 92, ptr %172, align 1
  %173 = load ptr, ptr %6, align 8
  %174 = load i32, ptr %7, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %7, align 4
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds i8, ptr %173, i64 %176
  store i8 48, ptr %177, align 1
  %178 = load ptr, ptr %6, align 8
  %179 = load i32, ptr %7, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %7, align 4
  %181 = sext i32 %179 to i64
  %182 = getelementptr inbounds i8, ptr %178, i64 %181
  store i8 50, ptr %182, align 1
  %183 = load ptr, ptr %6, align 8
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, ptr %7, align 4
  %186 = sext i32 %184 to i64
  %187 = getelementptr inbounds i8, ptr %183, i64 %186
  store i8 55, ptr %187, align 1
  br label %294

188:                                              ; preds = %96
  %189 = load ptr, ptr %6, align 8
  %190 = load i32, ptr %7, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, ptr %7, align 4
  %192 = sext i32 %190 to i64
  %193 = getelementptr inbounds i8, ptr %189, i64 %192
  store i8 92, ptr %193, align 1
  %194 = load ptr, ptr %6, align 8
  %195 = load i32, ptr %7, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, ptr %7, align 4
  %197 = sext i32 %195 to i64
  %198 = getelementptr inbounds i8, ptr %194, i64 %197
  store i8 48, ptr %198, align 1
  %199 = load ptr, ptr %6, align 8
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, ptr %7, align 4
  %202 = sext i32 %200 to i64
  %203 = getelementptr inbounds i8, ptr %199, i64 %202
  store i8 49, ptr %203, align 1
  %204 = load ptr, ptr %6, align 8
  %205 = load i32, ptr %7, align 4
  %206 = add nsw i32 %205, 1
  store i32 %206, ptr %7, align 4
  %207 = sext i32 %205 to i64
  %208 = getelementptr inbounds i8, ptr %204, i64 %207
  store i8 50, ptr %208, align 1
  br label %294

209:                                              ; preds = %96
  %210 = load ptr, ptr %6, align 8
  %211 = load i32, ptr %7, align 4
  %212 = add nsw i32 %211, 1
  store i32 %212, ptr %7, align 4
  %213 = sext i32 %211 to i64
  %214 = getelementptr inbounds i8, ptr %210, i64 %213
  store i8 92, ptr %214, align 1
  %215 = load ptr, ptr %6, align 8
  %216 = load i32, ptr %7, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, ptr %7, align 4
  %218 = sext i32 %216 to i64
  %219 = getelementptr inbounds i8, ptr %215, i64 %218
  store i8 48, ptr %219, align 1
  %220 = load ptr, ptr %6, align 8
  %221 = load i32, ptr %7, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, ptr %7, align 4
  %223 = sext i32 %221 to i64
  %224 = getelementptr inbounds i8, ptr %220, i64 %223
  store i8 49, ptr %224, align 1
  %225 = load ptr, ptr %6, align 8
  %226 = load i32, ptr %7, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, ptr %7, align 4
  %228 = sext i32 %226 to i64
  %229 = getelementptr inbounds i8, ptr %225, i64 %228
  store i8 48, ptr %229, align 1
  br label %294

230:                                              ; preds = %96
  %231 = load ptr, ptr %6, align 8
  %232 = load i32, ptr %7, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, ptr %7, align 4
  %234 = sext i32 %232 to i64
  %235 = getelementptr inbounds i8, ptr %231, i64 %234
  store i8 92, ptr %235, align 1
  %236 = load ptr, ptr %6, align 8
  %237 = load i32, ptr %7, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, ptr %7, align 4
  %239 = sext i32 %237 to i64
  %240 = getelementptr inbounds i8, ptr %236, i64 %239
  store i8 48, ptr %240, align 1
  %241 = load ptr, ptr %6, align 8
  %242 = load i32, ptr %7, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, ptr %7, align 4
  %244 = sext i32 %242 to i64
  %245 = getelementptr inbounds i8, ptr %241, i64 %244
  store i8 49, ptr %245, align 1
  %246 = load ptr, ptr %6, align 8
  %247 = load i32, ptr %7, align 4
  %248 = add nsw i32 %247, 1
  store i32 %248, ptr %7, align 4
  %249 = sext i32 %247 to i64
  %250 = getelementptr inbounds i8, ptr %246, i64 %249
  store i8 51, ptr %250, align 1
  br label %294

251:                                              ; preds = %96
  %252 = load ptr, ptr %6, align 8
  %253 = load i32, ptr %7, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, ptr %7, align 4
  %255 = sext i32 %253 to i64
  %256 = getelementptr inbounds i8, ptr %252, i64 %255
  store i8 92, ptr %256, align 1
  %257 = load ptr, ptr %6, align 8
  %258 = load i32, ptr %7, align 4
  %259 = add nsw i32 %258, 1
  store i32 %259, ptr %7, align 4
  %260 = sext i32 %258 to i64
  %261 = getelementptr inbounds i8, ptr %257, i64 %260
  store i8 48, ptr %261, align 1
  %262 = load ptr, ptr %6, align 8
  %263 = load i32, ptr %7, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, ptr %7, align 4
  %265 = sext i32 %263 to i64
  %266 = getelementptr inbounds i8, ptr %262, i64 %265
  store i8 48, ptr %266, align 1
  %267 = load ptr, ptr %6, align 8
  %268 = load i32, ptr %7, align 4
  %269 = add nsw i32 %268, 1
  store i32 %269, ptr %7, align 4
  %270 = sext i32 %268 to i64
  %271 = getelementptr inbounds i8, ptr %267, i64 %270
  store i8 57, ptr %271, align 1
  br label %294

272:                                              ; preds = %96
  %273 = load ptr, ptr %6, align 8
  %274 = load i32, ptr %7, align 4
  %275 = add nsw i32 %274, 1
  store i32 %275, ptr %7, align 4
  %276 = sext i32 %274 to i64
  %277 = getelementptr inbounds i8, ptr %273, i64 %276
  store i8 92, ptr %277, align 1
  %278 = load ptr, ptr %6, align 8
  %279 = load i32, ptr %7, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, ptr %7, align 4
  %281 = sext i32 %279 to i64
  %282 = getelementptr inbounds i8, ptr %278, i64 %281
  store i8 48, ptr %282, align 1
  %283 = load ptr, ptr %6, align 8
  %284 = load i32, ptr %7, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, ptr %7, align 4
  %286 = sext i32 %284 to i64
  %287 = getelementptr inbounds i8, ptr %283, i64 %286
  store i8 49, ptr %287, align 1
  %288 = load ptr, ptr %6, align 8
  %289 = load i32, ptr %7, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, ptr %7, align 4
  %291 = sext i32 %289 to i64
  %292 = getelementptr inbounds i8, ptr %288, i64 %291
  store i8 49, ptr %292, align 1
  br label %294

293:                                              ; preds = %96
  br label %294

294:                                              ; preds = %293, %272, %251, %230, %209, %188, %167, %146, %125, %104
  br label %344

295:                                              ; preds = %88
  %296 = load ptr, ptr %6, align 8
  %297 = load i32, ptr %7, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, ptr %7, align 4
  %299 = sext i32 %297 to i64
  %300 = getelementptr inbounds i8, ptr %296, i64 %299
  store i8 92, ptr %300, align 1
  %301 = load ptr, ptr %2, align 8
  %302 = load i32, ptr %8, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i8, ptr %301, i64 %303
  %305 = load i8, ptr %304, align 1
  %306 = sext i8 %305 to i32
  %307 = sdiv i32 %306, 100
  %308 = add nsw i32 48, %307
  %309 = trunc i32 %308 to i8
  %310 = load ptr, ptr %6, align 8
  %311 = load i32, ptr %7, align 4
  %312 = add nsw i32 %311, 1
  store i32 %312, ptr %7, align 4
  %313 = sext i32 %311 to i64
  %314 = getelementptr inbounds i8, ptr %310, i64 %313
  store i8 %309, ptr %314, align 1
  %315 = load ptr, ptr %2, align 8
  %316 = load i32, ptr %8, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i8, ptr %315, i64 %317
  %319 = load i8, ptr %318, align 1
  %320 = sext i8 %319 to i32
  %321 = sdiv i32 %320, 10
  %322 = srem i32 %321, 10
  %323 = add nsw i32 48, %322
  %324 = trunc i32 %323 to i8
  %325 = load ptr, ptr %6, align 8
  %326 = load i32, ptr %7, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, ptr %7, align 4
  %328 = sext i32 %326 to i64
  %329 = getelementptr inbounds i8, ptr %325, i64 %328
  store i8 %324, ptr %329, align 1
  %330 = load ptr, ptr %2, align 8
  %331 = load i32, ptr %8, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i8, ptr %330, i64 %332
  %334 = load i8, ptr %333, align 1
  %335 = sext i8 %334 to i32
  %336 = srem i32 %335, 10
  %337 = add nsw i32 48, %336
  %338 = trunc i32 %337 to i8
  %339 = load ptr, ptr %6, align 8
  %340 = load i32, ptr %7, align 4
  %341 = add nsw i32 %340, 1
  store i32 %341, ptr %7, align 4
  %342 = sext i32 %340 to i64
  %343 = getelementptr inbounds i8, ptr %339, i64 %342
  store i8 %338, ptr %343, align 1
  br label %344

344:                                              ; preds = %295, %294
  br label %356

345:                                              ; preds = %80
  %346 = load ptr, ptr %2, align 8
  %347 = load i32, ptr %8, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i8, ptr %346, i64 %348
  %350 = load i8, ptr %349, align 1
  %351 = load ptr, ptr %6, align 8
  %352 = load i32, ptr %7, align 4
  %353 = add nsw i32 %352, 1
  store i32 %353, ptr %7, align 4
  %354 = sext i32 %352 to i64
  %355 = getelementptr inbounds i8, ptr %351, i64 %354
  store i8 %350, ptr %355, align 1
  br label %356

356:                                              ; preds = %345, %344
  br label %357

357:                                              ; preds = %356
  %358 = load i32, ptr %8, align 4
  %359 = add nsw i32 %358, 1
  store i32 %359, ptr %8, align 4
  br label %60

360:                                              ; preds = %60
  %361 = load ptr, ptr %6, align 8
  %362 = load i32, ptr %7, align 4
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds i8, ptr %361, i64 %363
  store i8 0, ptr %364, align 1
  %365 = load ptr, ptr %6, align 8
  ret ptr %365
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #5

declare double @"\01_strtod"(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #7

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @parse()
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @mainGenerator(ptr noundef %4)
  %5 = load ptr, ptr %2, align 8
  call void @deleteAst(ptr noundef %5)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @getToken(ptr dead_on_unwind noalias writable sret(%struct.Token) align 8 %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  store i32 %1, ptr %3, align 4
  %6 = load i8, ptr @bufferFull, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i8 0, ptr @bufferFull, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 @bufferToken, i64 40, i1 false)
  br label %10

9:                                                ; preds = %2
  call void @getNextToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %4, i64 40, i1 false)
  br label %10

10:                                               ; preds = %9, %8
  %11 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 3
  %12 = load i32, ptr %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.257, ptr noundef %16)
  call void @handleError(i32 noundef 1) #12
  unreachable

18:                                               ; preds = %10
  %19 = load i32, ptr @eolAllowance, align 4
  %20 = icmp eq i32 %19, 2
  br i1 %20, label %21, label %26

21:                                               ; preds = %18
  %22 = load i32, ptr @lineNumber, align 4
  %23 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 4
  %24 = load i32, ptr %23, align 8
  %25 = icmp ne i32 %22, %24
  br i1 %25, label %34, label %26

26:                                               ; preds = %21, %18
  %27 = load i32, ptr @eolAllowance, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %57

29:                                               ; preds = %26
  %30 = load i32, ptr @lineNumber, align 4
  %31 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 4
  %32 = load i32, ptr %31, align 8
  %33 = icmp sge i32 %30, %32
  br i1 %33, label %34, label %57

34:                                               ; preds = %29, %21
  %35 = load i32, ptr @eolAllowance, align 4
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  call void @printDebug(ptr noundef @.str.1.258)
  br label %43

38:                                               ; preds = %34
  %39 = load i32, ptr @eolAllowance, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  call void @printDebug(ptr noundef @.str.2.259)
  br label %42

42:                                               ; preds = %41, %38
  br label %43

43:                                               ; preds = %42, %37
  %44 = load i8, ptr @__debug, align 1
  %45 = trunc i8 %44 to i1
  br i1 %45, label %46, label %56

46:                                               ; preds = %43
  %47 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 4
  %52 = load i32, ptr %51, align 8
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.3.260, i32 noundef %48, ptr noundef %50, i32 noundef %52)
  %54 = load i32, ptr @lineNumber, align 4
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.4.261, i32 noundef %54)
  br label %56

56:                                               ; preds = %46, %43
  call void @handleError(i32 noundef 2) #12
  unreachable

57:                                               ; preds = %29, %26
  %58 = load i32, ptr %3, align 4
  store i32 %58, ptr @eolAllowance, align 4
  %59 = load i32, ptr @lineNumber, align 4
  store i32 %59, ptr @prevLine, align 4
  %60 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 4
  %61 = load i32, ptr %60, align 8
  store i32 %61, ptr @lineNumber, align 4
  %62 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %63 = load i32, ptr %62, align 8
  %64 = icmp eq i32 %63, 28
  br i1 %64, label %65, label %69

65:                                               ; preds = %57
  %66 = load i8, ptr @prolog, align 1
  %67 = trunc i8 %66 to i1
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  call void @tokenDeInit(ptr noundef %0)
  call void @parseBuiltInFunc(ptr dead_on_unwind writable sret(%struct.Token) align 8 %5)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %5, i64 40, i1 false)
  br label %69

69:                                               ; preds = %68, %65, %57
  %70 = load i8, ptr @__debug, align 1
  %71 = trunc i8 %70 to i1
  br i1 %71, label %72, label %76

72:                                               ; preds = %69
  %73 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.5.262, ptr noundef %74)
  br label %76

76:                                               ; preds = %72, %69
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #8

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @parseBuiltInFunc(ptr dead_on_unwind noalias writable sret(%struct.Token) align 8 %0) #0 {
  %2 = alloca %struct.Token, align 8
  store i32 2, ptr @eolAllowance, align 4
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %0, i32 noundef 1)
  %3 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = icmp ne i32 %4, 20
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  call void @handleError(i32 noundef 2) #12
  unreachable

7:                                                ; preds = %1
  call void @tokenDeInit(ptr noundef %0)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %2, i64 40, i1 false)
  %8 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp ne i32 %9, 47
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  call void @handleError(i32 noundef 2) #12
  unreachable

12:                                               ; preds = %7
  call void @addPrefix(ptr noundef %0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @addPrefix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.Token, ptr %5, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %1
  br label %40

10:                                               ; preds = %1
  store ptr @.str.6.263, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i64 @strlen(ptr noundef %11) #14
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Token, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @strlen(ptr noundef %15) #14
  %17 = add i64 %12, %16
  %18 = add i64 %17, 1
  %19 = call ptr @malloc(i64 noundef %18) #11
  store ptr %19, ptr %4, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %23, label %22

22:                                               ; preds = %10
  call void @printDebug(ptr noundef @.str.7.264)
  call void @handleError(i32 noundef 99) #12
  unreachable

23:                                               ; preds = %10
  %24 = load ptr, ptr %4, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = call i64 @llvm.objectsize.i64.p0(ptr %26, i1 false, i1 true, i1 false)
  %28 = call ptr @__strcpy_chk(ptr noundef %24, ptr noundef %25, i64 noundef %27) #14
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.Token, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = call i64 @llvm.objectsize.i64.p0(ptr %33, i1 false, i1 true, i1 false)
  %35 = call ptr @__strcat_chk(ptr noundef %29, ptr noundef %32, i64 noundef %34) #14
  %36 = load ptr, ptr %2, align 8
  call void @tokenDeInit(ptr noundef %36)
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.Token, ptr %38, i32 0, i32 1
  store ptr %37, ptr %39, align 8
  br label %40

40:                                               ; preds = %23, %9
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #9

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: nounwind
declare ptr @__strcat_chk(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @storeToken(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 @bufferToken, ptr align 8 %0, i64 40, i1 false)
  store i8 1, ptr @bufferFull, align 1
  %3 = load i32, ptr @prevLine, align 4
  store i32 %3, ptr @lineNumber, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @peekToken(ptr dead_on_unwind noalias writable sret(%struct.Token) align 8 %0) #0 {
  %2 = alloca %struct.Token, align 8
  %3 = load i8, ptr @bufferFull, align 1
  %4 = trunc i8 %3 to i1
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 @bufferToken, i64 40, i1 false)
  br label %7

6:                                                ; preds = %1
  call void @getNextToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 @bufferToken, ptr align 8 %2, i64 40, i1 false)
  store i8 1, ptr @bufferFull, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 @bufferToken, i64 40, i1 false)
  br label %7

7:                                                ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @throwToken(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.Token, align 8
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef %4)
  call void @tokenDeInit(ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isExpr(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  switch i32 %5, label %7 [
    i32 0, label %6
    i32 1, label %6
    i32 2, label %6
    i32 3, label %6
    i32 5, label %6
    i32 6, label %6
    i32 7, label %6
    i32 8, label %6
    i32 9, label %6
    i32 10, label %6
    i32 11, label %6
    i32 12, label %6
    i32 13, label %6
    i32 46, label %6
    i32 47, label %6
    i32 48, label %6
    i32 49, label %6
    i32 50, label %6
    i32 45, label %6
    i32 43, label %6
    i32 44, label %6
  ]

6:                                                ; preds = %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1, %1
  store i1 true, ptr %2, align 1
  br label %8

7:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %8

8:                                                ; preds = %7, %6
  %9 = load i1, ptr %2, align 1
  ret i1 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @typeToTableId(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp uge i32 %4, 15
  br i1 %5, label %6, label %17

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp ult i32 %7, 46
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4
  %11 = icmp ugt i32 %10, 45
  br i1 %11, label %12, label %17

12:                                               ; preds = %9
  %13 = load i8, ptr @__debug, align 1
  %14 = trunc i8 %13 to i1
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @printDebug(ptr noundef @.str.8.265)
  br label %16

16:                                               ; preds = %15, %12
  call void @handleError(i32 noundef 2) #12
  unreachable

17:                                               ; preds = %9, %6, %1
  %18 = load i32, ptr %3, align 4
  switch i32 %18, label %20 [
    i32 46, label %19
    i32 47, label %19
    i32 48, label %19
    i32 49, label %19
    i32 50, label %19
    i32 45, label %19
    i32 43, label %19
    i32 44, label %19
  ]

19:                                               ; preds = %17, %17, %17, %17, %17, %17, %17, %17
  store i32 14, ptr %2, align 4
  br label %22

20:                                               ; preds = %17
  %21 = load i32, ptr %3, align 4
  store i32 %21, ptr %2, align 4
  br label %22

22:                                               ; preds = %20, %19
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isTokenId(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp ugt i32 %3, 42
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp ult i32 %6, 51
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i1 [ false, %1 ], [ %7, %5 ]
  ret i1 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isBinaryOp(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp ult i32 %3, 12
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp ne i32 %6, 4
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i1 [ false, %1 ], [ %7, %5 ]
  ret i1 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isDataTypeKW(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp uge i32 %3, 43
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp ule i32 %6, 45
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i1 [ false, %1 ], [ %7, %5 ]
  ret i1 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @reduce() #0 {
  %1 = alloca [3 x ptr], align 8
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store i32 0, ptr %2, align 4
  call void @top(ptr noundef @stack, ptr noundef %3)
  br label %5

5:                                                ; preds = %15, %0
  %6 = call zeroext i1 @isEmpty(ptr noundef @stack)
  br i1 %6, label %13, label %7

7:                                                ; preds = %5
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.AstNode, ptr %8, i32 0, i32 4
  %10 = getelementptr inbounds %struct.Token, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 55
  br label %13

13:                                               ; preds = %7, %5
  %14 = phi i1 [ false, %5 ], [ %12, %7 ]
  br i1 %14, label %15, label %20

15:                                               ; preds = %13
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %2, align 4
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 %18
  call void @pop(ptr noundef @stack, ptr noundef %19)
  call void @top(ptr noundef @stack, ptr noundef %3)
  br label %5

20:                                               ; preds = %13
  %21 = call zeroext i1 @isEmpty(ptr noundef @stack)
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = load i8, ptr @__debug, align 1
  %24 = trunc i8 %23 to i1
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @printDebug(ptr noundef @.str.9.266)
  br label %26

26:                                               ; preds = %25, %22
  call void @handleError(i32 noundef 2) #12
  unreachable

27:                                               ; preds = %20
  call void @pop(ptr noundef @stack, ptr noundef %3)
  %28 = load i32, ptr %2, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %118

30:                                               ; preds = %27
  %31 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.AstNode, ptr %32, i32 0, i32 4
  %34 = getelementptr inbounds %struct.Token, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 8
  %36 = call zeroext i1 @isTokenId(i32 noundef %35)
  br i1 %36, label %37, label %118

37:                                               ; preds = %30
  %38 = load i8, ptr @__debug, align 1
  %39 = trunc i8 %38 to i1
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  call void @printDebug(ptr noundef @.str.10.267)
  br label %41

41:                                               ; preds = %40, %37
  %42 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.AstNode, ptr %43, i32 0, i32 4
  %45 = getelementptr inbounds %struct.Token, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = icmp eq i32 %46, 47
  br i1 %47, label %48, label %75

48:                                               ; preds = %41
  %49 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.AstNode, ptr %50, i32 0, i32 4
  %52 = getelementptr inbounds %struct.Token, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %53)
  %55 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds %struct.AstNode, ptr %56, i32 0, i32 6
  store ptr %54, ptr %57, align 8
  %58 = icmp eq ptr %54, null
  br i1 %58, label %59, label %74

59:                                               ; preds = %48
  %60 = load i8, ptr @__debug, align 1
  %61 = trunc i8 %60 to i1
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  call void @printDebug(ptr noundef @.str.11.268)
  br label %63

63:                                               ; preds = %62, %59
  %64 = load i8, ptr @__debug, align 1
  %65 = trunc i8 %64 to i1
  br i1 %65, label %66, label %73

66:                                               ; preds = %63
  %67 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds %struct.AstNode, ptr %68, i32 0, i32 4
  %70 = getelementptr inbounds %struct.Token, ptr %69, i32 0, i32 1
  %71 = load ptr, ptr %70, align 8
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.12.269, ptr noundef %71)
  br label %73

73:                                               ; preds = %66, %63
  br label %74

74:                                               ; preds = %73, %48
  br label %112

75:                                               ; preds = %41
  %76 = call ptr @malloc(i64 noundef 16) #11
  %77 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.AstNode, ptr %78, i32 0, i32 6
  store ptr %76, ptr %79, align 8
  %80 = load i8, ptr @__debug, align 1
  %81 = trunc i8 %80 to i1
  br i1 %81, label %82, label %94

82:                                               ; preds = %75
  %83 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds %struct.AstNode, ptr %84, i32 0, i32 4
  %86 = getelementptr inbounds %struct.Token, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.AstNode, ptr %89, i32 0, i32 4
  %91 = getelementptr inbounds %struct.Token, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.13.270, ptr noundef %87, i32 noundef %92)
  br label %94

94:                                               ; preds = %82, %75
  %95 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.AstNode, ptr %96, i32 0, i32 4
  %98 = getelementptr inbounds %struct.Token, ptr %97, i32 0, i32 0
  %99 = load i32, ptr %98, align 8
  %100 = call i32 @getTypeMask(i32 noundef %99)
  %101 = trunc i32 %100 to i8
  %102 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr inbounds %struct.AstNode, ptr %103, i32 0, i32 6
  %105 = load ptr, ptr %104, align 8
  %106 = getelementptr inbounds %struct.Symbol, ptr %105, i32 0, i32 3
  store i8 %101, ptr %106, align 2
  %107 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %108 = load ptr, ptr %107, align 8
  %109 = getelementptr inbounds %struct.AstNode, ptr %108, i32 0, i32 6
  %110 = load ptr, ptr %109, align 8
  %111 = getelementptr inbounds %struct.Symbol, ptr %110, i32 0, i32 4
  store ptr null, ptr %111, align 8
  br label %112

112:                                              ; preds = %94, %74
  %113 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %114 = load ptr, ptr %113, align 8
  %115 = getelementptr inbounds %struct.AstNode, ptr %114, i32 0, i32 3
  store i32 10, ptr %115, align 4
  %116 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %117 = load ptr, ptr %116, align 8
  call void @push(ptr noundef @stack, ptr noundef %117)
  br label %1170

118:                                              ; preds = %30, %27
  %119 = load i32, ptr %2, align 4
  %120 = icmp eq i32 %119, 3
  br i1 %120, label %121, label %142

121:                                              ; preds = %118
  %122 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds %struct.AstNode, ptr %123, i32 0, i32 4
  %125 = getelementptr inbounds %struct.Token, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %125, align 8
  %127 = icmp eq i32 %126, 13
  br i1 %127, label %128, label %142

128:                                              ; preds = %121
  %129 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr inbounds %struct.AstNode, ptr %130, i32 0, i32 4
  %132 = getelementptr inbounds %struct.Token, ptr %131, i32 0, i32 0
  %133 = load i32, ptr %132, align 8
  %134 = icmp eq i32 %133, 12
  br i1 %134, label %135, label %142

135:                                              ; preds = %128
  %136 = load i8, ptr @__debug, align 1
  %137 = trunc i8 %136 to i1
  br i1 %137, label %138, label %139

138:                                              ; preds = %135
  call void @printDebug(ptr noundef @.str.14.271)
  br label %139

139:                                              ; preds = %138, %135
  %140 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %141 = load ptr, ptr %140, align 8
  call void @push(ptr noundef @stack, ptr noundef %141)
  br label %1169

142:                                              ; preds = %128, %121, %118
  %143 = load i32, ptr %2, align 4
  %144 = icmp eq i32 %143, 3
  br i1 %144, label %145, label %1167

145:                                              ; preds = %142
  %146 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %147 = load ptr, ptr %146, align 8
  %148 = getelementptr inbounds %struct.AstNode, ptr %147, i32 0, i32 4
  %149 = getelementptr inbounds %struct.Token, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %149, align 8
  %151 = call zeroext i1 @isBinaryOp(i32 noundef %150)
  br i1 %151, label %152, label %1167

152:                                              ; preds = %145
  %153 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %154 = load ptr, ptr %153, align 8
  %155 = getelementptr inbounds %struct.AstNode, ptr %154, i32 0, i32 3
  %156 = load i32, ptr %155, align 4
  %157 = icmp eq i32 %156, 10
  br i1 %157, label %158, label %1167

158:                                              ; preds = %152
  %159 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %160 = load ptr, ptr %159, align 8
  %161 = getelementptr inbounds %struct.AstNode, ptr %160, i32 0, i32 3
  %162 = load i32, ptr %161, align 4
  %163 = icmp eq i32 %162, 10
  br i1 %163, label %164, label %1167

164:                                              ; preds = %158
  %165 = load i8, ptr @__debug, align 1
  %166 = trunc i8 %165 to i1
  br i1 %166, label %167, label %168

167:                                              ; preds = %164
  call void @printDebug(ptr noundef @.str.15.272)
  br label %168

168:                                              ; preds = %167, %164
  %169 = load i8, ptr @__debug, align 1
  %170 = trunc i8 %169 to i1
  br i1 %170, label %171, label %183

171:                                              ; preds = %168
  %172 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %173 = load ptr, ptr %172, align 8
  %174 = getelementptr inbounds %struct.AstNode, ptr %173, i32 0, i32 4
  %175 = getelementptr inbounds %struct.Token, ptr %174, i32 0, i32 1
  %176 = load ptr, ptr %175, align 8
  %177 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %178 = load ptr, ptr %177, align 8
  %179 = getelementptr inbounds %struct.AstNode, ptr %178, i32 0, i32 4
  %180 = getelementptr inbounds %struct.Token, ptr %179, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = call i32 (ptr, ...) @printf(ptr noundef @.str.16.273, ptr noundef %176, ptr noundef %181)
  br label %183

183:                                              ; preds = %171, %168
  store i8 0, ptr %4, align 1
  %184 = load i8, ptr @__debug, align 1
  %185 = trunc i8 %184 to i1
  br i1 %185, label %186, label %193

186:                                              ; preds = %183
  %187 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %188 = load ptr, ptr %187, align 8
  %189 = getelementptr inbounds %struct.AstNode, ptr %188, i32 0, i32 4
  %190 = getelementptr inbounds %struct.Token, ptr %189, i32 0, i32 0
  %191 = load i32, ptr %190, align 8
  %192 = call i32 (ptr, ...) @printf(ptr noundef @.str.17.274, i32 noundef %191)
  br label %193

193:                                              ; preds = %186, %183
  %194 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %195 = load ptr, ptr %194, align 8
  %196 = getelementptr inbounds %struct.AstNode, ptr %195, i32 0, i32 4
  %197 = getelementptr inbounds %struct.Token, ptr %196, i32 0, i32 0
  %198 = load i32, ptr %197, align 8
  switch i32 %198, label %1135 [
    i32 5, label %199
    i32 0, label %229
    i32 1, label %388
    i32 3, label %472
    i32 6, label %537
    i32 7, label %602
    i32 8, label %667
    i32 9, label %732
    i32 10, label %797
    i32 11, label %900
    i32 2, label %1003
  ]

199:                                              ; preds = %193
  %200 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %201 = load ptr, ptr %200, align 8
  %202 = getelementptr inbounds %struct.AstNode, ptr %201, i32 0, i32 4
  %203 = getelementptr inbounds %struct.Token, ptr %202, i32 0, i32 0
  %204 = load i32, ptr %203, align 8
  %205 = icmp ne i32 %204, 45
  br i1 %205, label %206, label %228

206:                                              ; preds = %199
  %207 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds %struct.AstNode, ptr %208, i32 0, i32 4
  %210 = getelementptr inbounds %struct.Token, ptr %209, i32 0, i32 0
  %211 = load i32, ptr %210, align 8
  %212 = icmp ne i32 %211, 44
  br i1 %212, label %213, label %228

213:                                              ; preds = %206
  %214 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %215 = load ptr, ptr %214, align 8
  %216 = getelementptr inbounds %struct.AstNode, ptr %215, i32 0, i32 4
  %217 = getelementptr inbounds %struct.Token, ptr %216, i32 0, i32 0
  %218 = load i32, ptr %217, align 8
  %219 = icmp ne i32 %218, 43
  br i1 %219, label %220, label %228

220:                                              ; preds = %213
  %221 = load ptr, ptr @__stderrp, align 8
  %222 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %223 = load ptr, ptr %222, align 8
  %224 = getelementptr inbounds %struct.AstNode, ptr %223, i32 0, i32 4
  %225 = getelementptr inbounds %struct.Token, ptr %224, i32 0, i32 1
  %226 = load ptr, ptr %225, align 8
  %227 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %221, ptr noundef @.str.18.275, ptr noundef %226) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

228:                                              ; preds = %213, %206, %199
  store i8 5, ptr %4, align 1
  br label %1136

229:                                              ; preds = %193
  %230 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %231 = load ptr, ptr %230, align 8
  %232 = getelementptr inbounds %struct.AstNode, ptr %231, i32 0, i32 6
  %233 = load ptr, ptr %232, align 8
  %234 = getelementptr inbounds %struct.Symbol, ptr %233, i32 0, i32 3
  %235 = load i8, ptr %234, align 2
  %236 = zext i8 %235 to i32
  %237 = icmp eq i32 %236, 2
  br i1 %237, label %238, label %247

238:                                              ; preds = %229
  %239 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %240 = load ptr, ptr %239, align 8
  %241 = getelementptr inbounds %struct.AstNode, ptr %240, i32 0, i32 6
  %242 = load ptr, ptr %241, align 8
  %243 = getelementptr inbounds %struct.Symbol, ptr %242, i32 0, i32 3
  %244 = load i8, ptr %243, align 2
  %245 = zext i8 %244 to i32
  %246 = icmp eq i32 %245, 2
  br i1 %246, label %283, label %247

247:                                              ; preds = %238, %229
  %248 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %249 = load ptr, ptr %248, align 8
  %250 = getelementptr inbounds %struct.AstNode, ptr %249, i32 0, i32 6
  %251 = load ptr, ptr %250, align 8
  %252 = getelementptr inbounds %struct.Symbol, ptr %251, i32 0, i32 3
  %253 = load i8, ptr %252, align 2
  %254 = zext i8 %253 to i32
  %255 = icmp eq i32 %254, 2
  br i1 %255, label %256, label %265

256:                                              ; preds = %247
  %257 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %258 = load ptr, ptr %257, align 8
  %259 = getelementptr inbounds %struct.AstNode, ptr %258, i32 0, i32 6
  %260 = load ptr, ptr %259, align 8
  %261 = getelementptr inbounds %struct.Symbol, ptr %260, i32 0, i32 3
  %262 = load i8, ptr %261, align 2
  %263 = zext i8 %262 to i32
  %264 = icmp eq i32 %263, 0
  br i1 %264, label %283, label %265

265:                                              ; preds = %256, %247
  %266 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %267 = load ptr, ptr %266, align 8
  %268 = getelementptr inbounds %struct.AstNode, ptr %267, i32 0, i32 6
  %269 = load ptr, ptr %268, align 8
  %270 = getelementptr inbounds %struct.Symbol, ptr %269, i32 0, i32 3
  %271 = load i8, ptr %270, align 2
  %272 = zext i8 %271 to i32
  %273 = icmp eq i32 %272, 0
  br i1 %273, label %274, label %284

274:                                              ; preds = %265
  %275 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %276 = load ptr, ptr %275, align 8
  %277 = getelementptr inbounds %struct.AstNode, ptr %276, i32 0, i32 6
  %278 = load ptr, ptr %277, align 8
  %279 = getelementptr inbounds %struct.Symbol, ptr %278, i32 0, i32 3
  %280 = load i8, ptr %279, align 2
  %281 = zext i8 %280 to i32
  %282 = icmp eq i32 %281, 2
  br i1 %282, label %283, label %284

283:                                              ; preds = %274, %256, %238
  store i8 2, ptr %4, align 1
  br label %387

284:                                              ; preds = %274, %265
  %285 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %286 = load ptr, ptr %285, align 8
  %287 = getelementptr inbounds %struct.AstNode, ptr %286, i32 0, i32 6
  %288 = load ptr, ptr %287, align 8
  %289 = getelementptr inbounds %struct.Symbol, ptr %288, i32 0, i32 3
  %290 = load i8, ptr %289, align 2
  %291 = zext i8 %290 to i32
  %292 = icmp eq i32 %291, 1
  br i1 %292, label %293, label %302

293:                                              ; preds = %284
  %294 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %295 = load ptr, ptr %294, align 8
  %296 = getelementptr inbounds %struct.AstNode, ptr %295, i32 0, i32 6
  %297 = load ptr, ptr %296, align 8
  %298 = getelementptr inbounds %struct.Symbol, ptr %297, i32 0, i32 3
  %299 = load i8, ptr %298, align 2
  %300 = zext i8 %299 to i32
  %301 = icmp eq i32 %300, 1
  br i1 %301, label %338, label %302

302:                                              ; preds = %293, %284
  %303 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %304 = load ptr, ptr %303, align 8
  %305 = getelementptr inbounds %struct.AstNode, ptr %304, i32 0, i32 6
  %306 = load ptr, ptr %305, align 8
  %307 = getelementptr inbounds %struct.Symbol, ptr %306, i32 0, i32 3
  %308 = load i8, ptr %307, align 2
  %309 = zext i8 %308 to i32
  %310 = icmp eq i32 %309, 1
  br i1 %310, label %311, label %320

311:                                              ; preds = %302
  %312 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %313 = load ptr, ptr %312, align 8
  %314 = getelementptr inbounds %struct.AstNode, ptr %313, i32 0, i32 6
  %315 = load ptr, ptr %314, align 8
  %316 = getelementptr inbounds %struct.Symbol, ptr %315, i32 0, i32 3
  %317 = load i8, ptr %316, align 2
  %318 = zext i8 %317 to i32
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %338, label %320

320:                                              ; preds = %311, %302
  %321 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %322 = load ptr, ptr %321, align 8
  %323 = getelementptr inbounds %struct.AstNode, ptr %322, i32 0, i32 6
  %324 = load ptr, ptr %323, align 8
  %325 = getelementptr inbounds %struct.Symbol, ptr %324, i32 0, i32 3
  %326 = load i8, ptr %325, align 2
  %327 = zext i8 %326 to i32
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %339

329:                                              ; preds = %320
  %330 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %331 = load ptr, ptr %330, align 8
  %332 = getelementptr inbounds %struct.AstNode, ptr %331, i32 0, i32 6
  %333 = load ptr, ptr %332, align 8
  %334 = getelementptr inbounds %struct.Symbol, ptr %333, i32 0, i32 3
  %335 = load i8, ptr %334, align 2
  %336 = zext i8 %335 to i32
  %337 = icmp eq i32 %336, 1
  br i1 %337, label %338, label %339

338:                                              ; preds = %329, %311, %293
  store i8 1, ptr %4, align 1
  br label %386

339:                                              ; preds = %329, %320
  %340 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %341 = load ptr, ptr %340, align 8
  %342 = getelementptr inbounds %struct.AstNode, ptr %341, i32 0, i32 6
  %343 = load ptr, ptr %342, align 8
  %344 = getelementptr inbounds %struct.Symbol, ptr %343, i32 0, i32 3
  %345 = load i8, ptr %344, align 2
  %346 = zext i8 %345 to i32
  %347 = icmp eq i32 %346, 0
  br i1 %347, label %348, label %358

348:                                              ; preds = %339
  %349 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %350 = load ptr, ptr %349, align 8
  %351 = getelementptr inbounds %struct.AstNode, ptr %350, i32 0, i32 6
  %352 = load ptr, ptr %351, align 8
  %353 = getelementptr inbounds %struct.Symbol, ptr %352, i32 0, i32 3
  %354 = load i8, ptr %353, align 2
  %355 = zext i8 %354 to i32
  %356 = icmp eq i32 %355, 0
  br i1 %356, label %357, label %358

357:                                              ; preds = %348
  store i8 0, ptr %4, align 1
  br label %385

358:                                              ; preds = %348, %339
  %359 = load ptr, ptr @__stderrp, align 8
  %360 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %361 = load ptr, ptr %360, align 8
  %362 = getelementptr inbounds %struct.AstNode, ptr %361, i32 0, i32 4
  %363 = getelementptr inbounds %struct.Token, ptr %362, i32 0, i32 1
  %364 = load ptr, ptr %363, align 8
  %365 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %366 = load ptr, ptr %365, align 8
  %367 = getelementptr inbounds %struct.AstNode, ptr %366, i32 0, i32 6
  %368 = load ptr, ptr %367, align 8
  %369 = getelementptr inbounds %struct.Symbol, ptr %368, i32 0, i32 3
  %370 = load i8, ptr %369, align 2
  %371 = zext i8 %370 to i32
  %372 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %373 = load ptr, ptr %372, align 8
  %374 = getelementptr inbounds %struct.AstNode, ptr %373, i32 0, i32 4
  %375 = getelementptr inbounds %struct.Token, ptr %374, i32 0, i32 1
  %376 = load ptr, ptr %375, align 8
  %377 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %378 = load ptr, ptr %377, align 8
  %379 = getelementptr inbounds %struct.AstNode, ptr %378, i32 0, i32 6
  %380 = load ptr, ptr %379, align 8
  %381 = getelementptr inbounds %struct.Symbol, ptr %380, i32 0, i32 3
  %382 = load i8, ptr %381, align 2
  %383 = zext i8 %382 to i32
  %384 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %359, ptr noundef @.str.19.276, ptr noundef %364, i32 noundef %371, ptr noundef %376, i32 noundef %383) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

385:                                              ; preds = %357
  br label %386

386:                                              ; preds = %385, %338
  br label %387

387:                                              ; preds = %386, %283
  br label %1136

388:                                              ; preds = %193
  %389 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %390 = load ptr, ptr %389, align 8
  %391 = getelementptr inbounds %struct.AstNode, ptr %390, i32 0, i32 4
  %392 = getelementptr inbounds %struct.Token, ptr %391, i32 0, i32 0
  %393 = load i32, ptr %392, align 8
  %394 = icmp eq i32 %393, 48
  br i1 %394, label %395, label %406

395:                                              ; preds = %388
  %396 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %397 = load ptr, ptr %396, align 8
  %398 = getelementptr inbounds %struct.AstNode, ptr %397, i32 0, i32 4
  %399 = getelementptr inbounds %struct.Token, ptr %398, i32 0, i32 1
  %400 = load ptr, ptr %399, align 8
  %401 = call double @atof(ptr noundef %400)
  %402 = fcmp oeq double %401, 0.000000e+00
  br i1 %402, label %403, label %406

403:                                              ; preds = %395
  %404 = load ptr, ptr @__stderrp, align 8
  %405 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %404, ptr noundef @.str.20.277) #14
  call void @handleError(i32 noundef 26) #12
  unreachable

406:                                              ; preds = %395, %388
  %407 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %408 = load ptr, ptr %407, align 8
  %409 = getelementptr inbounds %struct.AstNode, ptr %408, i32 0, i32 6
  %410 = load ptr, ptr %409, align 8
  %411 = getelementptr inbounds %struct.Symbol, ptr %410, i32 0, i32 3
  %412 = load i8, ptr %411, align 2
  %413 = zext i8 %412 to i32
  %414 = icmp eq i32 %413, 1
  br i1 %414, label %424, label %415

415:                                              ; preds = %406
  %416 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %417 = load ptr, ptr %416, align 8
  %418 = getelementptr inbounds %struct.AstNode, ptr %417, i32 0, i32 6
  %419 = load ptr, ptr %418, align 8
  %420 = getelementptr inbounds %struct.Symbol, ptr %419, i32 0, i32 3
  %421 = load i8, ptr %420, align 2
  %422 = zext i8 %421 to i32
  %423 = icmp eq i32 %422, 0
  br i1 %423, label %424, label %443

424:                                              ; preds = %415, %406
  %425 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %426 = load ptr, ptr %425, align 8
  %427 = getelementptr inbounds %struct.AstNode, ptr %426, i32 0, i32 6
  %428 = load ptr, ptr %427, align 8
  %429 = getelementptr inbounds %struct.Symbol, ptr %428, i32 0, i32 3
  %430 = load i8, ptr %429, align 2
  %431 = zext i8 %430 to i32
  %432 = icmp eq i32 %431, 1
  br i1 %432, label %442, label %433

433:                                              ; preds = %424
  %434 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %435 = load ptr, ptr %434, align 8
  %436 = getelementptr inbounds %struct.AstNode, ptr %435, i32 0, i32 6
  %437 = load ptr, ptr %436, align 8
  %438 = getelementptr inbounds %struct.Symbol, ptr %437, i32 0, i32 3
  %439 = load i8, ptr %438, align 2
  %440 = zext i8 %439 to i32
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %442, label %443

442:                                              ; preds = %433, %424
  store i8 1, ptr %4, align 1
  br label %470

443:                                              ; preds = %433, %415
  %444 = load ptr, ptr @__stderrp, align 8
  %445 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %446 = load ptr, ptr %445, align 8
  %447 = getelementptr inbounds %struct.AstNode, ptr %446, i32 0, i32 4
  %448 = getelementptr inbounds %struct.Token, ptr %447, i32 0, i32 1
  %449 = load ptr, ptr %448, align 8
  %450 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %451 = load ptr, ptr %450, align 8
  %452 = getelementptr inbounds %struct.AstNode, ptr %451, i32 0, i32 6
  %453 = load ptr, ptr %452, align 8
  %454 = getelementptr inbounds %struct.Symbol, ptr %453, i32 0, i32 3
  %455 = load i8, ptr %454, align 2
  %456 = zext i8 %455 to i32
  %457 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %458 = load ptr, ptr %457, align 8
  %459 = getelementptr inbounds %struct.AstNode, ptr %458, i32 0, i32 4
  %460 = getelementptr inbounds %struct.Token, ptr %459, i32 0, i32 1
  %461 = load ptr, ptr %460, align 8
  %462 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %463 = load ptr, ptr %462, align 8
  %464 = getelementptr inbounds %struct.AstNode, ptr %463, i32 0, i32 6
  %465 = load ptr, ptr %464, align 8
  %466 = getelementptr inbounds %struct.Symbol, ptr %465, i32 0, i32 3
  %467 = load i8, ptr %466, align 2
  %468 = zext i8 %467 to i32
  %469 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %444, ptr noundef @.str.21.278, ptr noundef %449, i32 noundef %456, ptr noundef %461, i32 noundef %468) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

470:                                              ; preds = %442
  br label %471

471:                                              ; preds = %470
  br label %1136

472:                                              ; preds = %193
  %473 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %474 = load ptr, ptr %473, align 8
  %475 = getelementptr inbounds %struct.AstNode, ptr %474, i32 0, i32 6
  %476 = load ptr, ptr %475, align 8
  %477 = getelementptr inbounds %struct.Symbol, ptr %476, i32 0, i32 3
  %478 = load i8, ptr %477, align 2
  %479 = zext i8 %478 to i32
  %480 = icmp eq i32 %479, 1
  br i1 %480, label %490, label %481

481:                                              ; preds = %472
  %482 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %483 = load ptr, ptr %482, align 8
  %484 = getelementptr inbounds %struct.AstNode, ptr %483, i32 0, i32 6
  %485 = load ptr, ptr %484, align 8
  %486 = getelementptr inbounds %struct.Symbol, ptr %485, i32 0, i32 3
  %487 = load i8, ptr %486, align 2
  %488 = zext i8 %487 to i32
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %490, label %509

490:                                              ; preds = %481, %472
  %491 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %492 = load ptr, ptr %491, align 8
  %493 = getelementptr inbounds %struct.AstNode, ptr %492, i32 0, i32 6
  %494 = load ptr, ptr %493, align 8
  %495 = getelementptr inbounds %struct.Symbol, ptr %494, i32 0, i32 3
  %496 = load i8, ptr %495, align 2
  %497 = zext i8 %496 to i32
  %498 = icmp eq i32 %497, 1
  br i1 %498, label %508, label %499

499:                                              ; preds = %490
  %500 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %501 = load ptr, ptr %500, align 8
  %502 = getelementptr inbounds %struct.AstNode, ptr %501, i32 0, i32 6
  %503 = load ptr, ptr %502, align 8
  %504 = getelementptr inbounds %struct.Symbol, ptr %503, i32 0, i32 3
  %505 = load i8, ptr %504, align 2
  %506 = zext i8 %505 to i32
  %507 = icmp eq i32 %506, 0
  br i1 %507, label %508, label %509

508:                                              ; preds = %499, %490
  store i8 1, ptr %4, align 1
  br label %536

509:                                              ; preds = %499, %481
  %510 = load ptr, ptr @__stderrp, align 8
  %511 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %512 = load ptr, ptr %511, align 8
  %513 = getelementptr inbounds %struct.AstNode, ptr %512, i32 0, i32 4
  %514 = getelementptr inbounds %struct.Token, ptr %513, i32 0, i32 1
  %515 = load ptr, ptr %514, align 8
  %516 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %517 = load ptr, ptr %516, align 8
  %518 = getelementptr inbounds %struct.AstNode, ptr %517, i32 0, i32 6
  %519 = load ptr, ptr %518, align 8
  %520 = getelementptr inbounds %struct.Symbol, ptr %519, i32 0, i32 3
  %521 = load i8, ptr %520, align 2
  %522 = zext i8 %521 to i32
  %523 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %524 = load ptr, ptr %523, align 8
  %525 = getelementptr inbounds %struct.AstNode, ptr %524, i32 0, i32 4
  %526 = getelementptr inbounds %struct.Token, ptr %525, i32 0, i32 1
  %527 = load ptr, ptr %526, align 8
  %528 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %529 = load ptr, ptr %528, align 8
  %530 = getelementptr inbounds %struct.AstNode, ptr %529, i32 0, i32 6
  %531 = load ptr, ptr %530, align 8
  %532 = getelementptr inbounds %struct.Symbol, ptr %531, i32 0, i32 3
  %533 = load i8, ptr %532, align 2
  %534 = zext i8 %533 to i32
  %535 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %510, ptr noundef @.str.22.279, ptr noundef %515, i32 noundef %522, ptr noundef %527, i32 noundef %534) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

536:                                              ; preds = %508
  br label %1136

537:                                              ; preds = %193
  %538 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %539 = load ptr, ptr %538, align 8
  %540 = getelementptr inbounds %struct.AstNode, ptr %539, i32 0, i32 6
  %541 = load ptr, ptr %540, align 8
  %542 = getelementptr inbounds %struct.Symbol, ptr %541, i32 0, i32 3
  %543 = load i8, ptr %542, align 2
  %544 = zext i8 %543 to i32
  %545 = icmp eq i32 %544, 1
  br i1 %545, label %555, label %546

546:                                              ; preds = %537
  %547 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %548 = load ptr, ptr %547, align 8
  %549 = getelementptr inbounds %struct.AstNode, ptr %548, i32 0, i32 6
  %550 = load ptr, ptr %549, align 8
  %551 = getelementptr inbounds %struct.Symbol, ptr %550, i32 0, i32 3
  %552 = load i8, ptr %551, align 2
  %553 = zext i8 %552 to i32
  %554 = icmp eq i32 %553, 0
  br i1 %554, label %555, label %574

555:                                              ; preds = %546, %537
  %556 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %557 = load ptr, ptr %556, align 8
  %558 = getelementptr inbounds %struct.AstNode, ptr %557, i32 0, i32 6
  %559 = load ptr, ptr %558, align 8
  %560 = getelementptr inbounds %struct.Symbol, ptr %559, i32 0, i32 3
  %561 = load i8, ptr %560, align 2
  %562 = zext i8 %561 to i32
  %563 = icmp eq i32 %562, 1
  br i1 %563, label %573, label %564

564:                                              ; preds = %555
  %565 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %566 = load ptr, ptr %565, align 8
  %567 = getelementptr inbounds %struct.AstNode, ptr %566, i32 0, i32 6
  %568 = load ptr, ptr %567, align 8
  %569 = getelementptr inbounds %struct.Symbol, ptr %568, i32 0, i32 3
  %570 = load i8, ptr %569, align 2
  %571 = zext i8 %570 to i32
  %572 = icmp eq i32 %571, 0
  br i1 %572, label %573, label %574

573:                                              ; preds = %564, %555
  store i8 5, ptr %4, align 1
  br label %601

574:                                              ; preds = %564, %546
  %575 = load ptr, ptr @__stderrp, align 8
  %576 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %577 = load ptr, ptr %576, align 8
  %578 = getelementptr inbounds %struct.AstNode, ptr %577, i32 0, i32 4
  %579 = getelementptr inbounds %struct.Token, ptr %578, i32 0, i32 1
  %580 = load ptr, ptr %579, align 8
  %581 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %582 = load ptr, ptr %581, align 8
  %583 = getelementptr inbounds %struct.AstNode, ptr %582, i32 0, i32 6
  %584 = load ptr, ptr %583, align 8
  %585 = getelementptr inbounds %struct.Symbol, ptr %584, i32 0, i32 3
  %586 = load i8, ptr %585, align 2
  %587 = zext i8 %586 to i32
  %588 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %589 = load ptr, ptr %588, align 8
  %590 = getelementptr inbounds %struct.AstNode, ptr %589, i32 0, i32 4
  %591 = getelementptr inbounds %struct.Token, ptr %590, i32 0, i32 1
  %592 = load ptr, ptr %591, align 8
  %593 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %594 = load ptr, ptr %593, align 8
  %595 = getelementptr inbounds %struct.AstNode, ptr %594, i32 0, i32 6
  %596 = load ptr, ptr %595, align 8
  %597 = getelementptr inbounds %struct.Symbol, ptr %596, i32 0, i32 3
  %598 = load i8, ptr %597, align 2
  %599 = zext i8 %598 to i32
  %600 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %575, ptr noundef @.str.23.280, ptr noundef %580, i32 noundef %587, ptr noundef %592, i32 noundef %599) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

601:                                              ; preds = %573
  br label %1136

602:                                              ; preds = %193
  %603 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %604 = load ptr, ptr %603, align 8
  %605 = getelementptr inbounds %struct.AstNode, ptr %604, i32 0, i32 6
  %606 = load ptr, ptr %605, align 8
  %607 = getelementptr inbounds %struct.Symbol, ptr %606, i32 0, i32 3
  %608 = load i8, ptr %607, align 2
  %609 = zext i8 %608 to i32
  %610 = icmp eq i32 %609, 1
  br i1 %610, label %620, label %611

611:                                              ; preds = %602
  %612 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %613 = load ptr, ptr %612, align 8
  %614 = getelementptr inbounds %struct.AstNode, ptr %613, i32 0, i32 6
  %615 = load ptr, ptr %614, align 8
  %616 = getelementptr inbounds %struct.Symbol, ptr %615, i32 0, i32 3
  %617 = load i8, ptr %616, align 2
  %618 = zext i8 %617 to i32
  %619 = icmp eq i32 %618, 0
  br i1 %619, label %620, label %639

620:                                              ; preds = %611, %602
  %621 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %622 = load ptr, ptr %621, align 8
  %623 = getelementptr inbounds %struct.AstNode, ptr %622, i32 0, i32 6
  %624 = load ptr, ptr %623, align 8
  %625 = getelementptr inbounds %struct.Symbol, ptr %624, i32 0, i32 3
  %626 = load i8, ptr %625, align 2
  %627 = zext i8 %626 to i32
  %628 = icmp eq i32 %627, 1
  br i1 %628, label %638, label %629

629:                                              ; preds = %620
  %630 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %631 = load ptr, ptr %630, align 8
  %632 = getelementptr inbounds %struct.AstNode, ptr %631, i32 0, i32 6
  %633 = load ptr, ptr %632, align 8
  %634 = getelementptr inbounds %struct.Symbol, ptr %633, i32 0, i32 3
  %635 = load i8, ptr %634, align 2
  %636 = zext i8 %635 to i32
  %637 = icmp eq i32 %636, 0
  br i1 %637, label %638, label %639

638:                                              ; preds = %629, %620
  store i8 5, ptr %4, align 1
  br label %666

639:                                              ; preds = %629, %611
  %640 = load ptr, ptr @__stderrp, align 8
  %641 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %642 = load ptr, ptr %641, align 8
  %643 = getelementptr inbounds %struct.AstNode, ptr %642, i32 0, i32 4
  %644 = getelementptr inbounds %struct.Token, ptr %643, i32 0, i32 1
  %645 = load ptr, ptr %644, align 8
  %646 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %647 = load ptr, ptr %646, align 8
  %648 = getelementptr inbounds %struct.AstNode, ptr %647, i32 0, i32 6
  %649 = load ptr, ptr %648, align 8
  %650 = getelementptr inbounds %struct.Symbol, ptr %649, i32 0, i32 3
  %651 = load i8, ptr %650, align 2
  %652 = zext i8 %651 to i32
  %653 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %654 = load ptr, ptr %653, align 8
  %655 = getelementptr inbounds %struct.AstNode, ptr %654, i32 0, i32 4
  %656 = getelementptr inbounds %struct.Token, ptr %655, i32 0, i32 1
  %657 = load ptr, ptr %656, align 8
  %658 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %659 = load ptr, ptr %658, align 8
  %660 = getelementptr inbounds %struct.AstNode, ptr %659, i32 0, i32 6
  %661 = load ptr, ptr %660, align 8
  %662 = getelementptr inbounds %struct.Symbol, ptr %661, i32 0, i32 3
  %663 = load i8, ptr %662, align 2
  %664 = zext i8 %663 to i32
  %665 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %640, ptr noundef @.str.24.281, ptr noundef %645, i32 noundef %652, ptr noundef %657, i32 noundef %664) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

666:                                              ; preds = %638
  br label %1136

667:                                              ; preds = %193
  %668 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %669 = load ptr, ptr %668, align 8
  %670 = getelementptr inbounds %struct.AstNode, ptr %669, i32 0, i32 6
  %671 = load ptr, ptr %670, align 8
  %672 = getelementptr inbounds %struct.Symbol, ptr %671, i32 0, i32 3
  %673 = load i8, ptr %672, align 2
  %674 = zext i8 %673 to i32
  %675 = icmp eq i32 %674, 1
  br i1 %675, label %685, label %676

676:                                              ; preds = %667
  %677 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %678 = load ptr, ptr %677, align 8
  %679 = getelementptr inbounds %struct.AstNode, ptr %678, i32 0, i32 6
  %680 = load ptr, ptr %679, align 8
  %681 = getelementptr inbounds %struct.Symbol, ptr %680, i32 0, i32 3
  %682 = load i8, ptr %681, align 2
  %683 = zext i8 %682 to i32
  %684 = icmp eq i32 %683, 0
  br i1 %684, label %685, label %704

685:                                              ; preds = %676, %667
  %686 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %687 = load ptr, ptr %686, align 8
  %688 = getelementptr inbounds %struct.AstNode, ptr %687, i32 0, i32 6
  %689 = load ptr, ptr %688, align 8
  %690 = getelementptr inbounds %struct.Symbol, ptr %689, i32 0, i32 3
  %691 = load i8, ptr %690, align 2
  %692 = zext i8 %691 to i32
  %693 = icmp eq i32 %692, 1
  br i1 %693, label %703, label %694

694:                                              ; preds = %685
  %695 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %696 = load ptr, ptr %695, align 8
  %697 = getelementptr inbounds %struct.AstNode, ptr %696, i32 0, i32 6
  %698 = load ptr, ptr %697, align 8
  %699 = getelementptr inbounds %struct.Symbol, ptr %698, i32 0, i32 3
  %700 = load i8, ptr %699, align 2
  %701 = zext i8 %700 to i32
  %702 = icmp eq i32 %701, 0
  br i1 %702, label %703, label %704

703:                                              ; preds = %694, %685
  store i8 5, ptr %4, align 1
  br label %731

704:                                              ; preds = %694, %676
  %705 = load ptr, ptr @__stderrp, align 8
  %706 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %707 = load ptr, ptr %706, align 8
  %708 = getelementptr inbounds %struct.AstNode, ptr %707, i32 0, i32 4
  %709 = getelementptr inbounds %struct.Token, ptr %708, i32 0, i32 1
  %710 = load ptr, ptr %709, align 8
  %711 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %712 = load ptr, ptr %711, align 8
  %713 = getelementptr inbounds %struct.AstNode, ptr %712, i32 0, i32 6
  %714 = load ptr, ptr %713, align 8
  %715 = getelementptr inbounds %struct.Symbol, ptr %714, i32 0, i32 3
  %716 = load i8, ptr %715, align 2
  %717 = zext i8 %716 to i32
  %718 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %719 = load ptr, ptr %718, align 8
  %720 = getelementptr inbounds %struct.AstNode, ptr %719, i32 0, i32 4
  %721 = getelementptr inbounds %struct.Token, ptr %720, i32 0, i32 1
  %722 = load ptr, ptr %721, align 8
  %723 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %724 = load ptr, ptr %723, align 8
  %725 = getelementptr inbounds %struct.AstNode, ptr %724, i32 0, i32 6
  %726 = load ptr, ptr %725, align 8
  %727 = getelementptr inbounds %struct.Symbol, ptr %726, i32 0, i32 3
  %728 = load i8, ptr %727, align 2
  %729 = zext i8 %728 to i32
  %730 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %705, ptr noundef @.str.25.282, ptr noundef %710, i32 noundef %717, ptr noundef %722, i32 noundef %729) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

731:                                              ; preds = %703
  br label %1136

732:                                              ; preds = %193
  %733 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %734 = load ptr, ptr %733, align 8
  %735 = getelementptr inbounds %struct.AstNode, ptr %734, i32 0, i32 6
  %736 = load ptr, ptr %735, align 8
  %737 = getelementptr inbounds %struct.Symbol, ptr %736, i32 0, i32 3
  %738 = load i8, ptr %737, align 2
  %739 = zext i8 %738 to i32
  %740 = icmp eq i32 %739, 1
  br i1 %740, label %750, label %741

741:                                              ; preds = %732
  %742 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %743 = load ptr, ptr %742, align 8
  %744 = getelementptr inbounds %struct.AstNode, ptr %743, i32 0, i32 6
  %745 = load ptr, ptr %744, align 8
  %746 = getelementptr inbounds %struct.Symbol, ptr %745, i32 0, i32 3
  %747 = load i8, ptr %746, align 2
  %748 = zext i8 %747 to i32
  %749 = icmp eq i32 %748, 0
  br i1 %749, label %750, label %769

750:                                              ; preds = %741, %732
  %751 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %752 = load ptr, ptr %751, align 8
  %753 = getelementptr inbounds %struct.AstNode, ptr %752, i32 0, i32 6
  %754 = load ptr, ptr %753, align 8
  %755 = getelementptr inbounds %struct.Symbol, ptr %754, i32 0, i32 3
  %756 = load i8, ptr %755, align 2
  %757 = zext i8 %756 to i32
  %758 = icmp eq i32 %757, 1
  br i1 %758, label %768, label %759

759:                                              ; preds = %750
  %760 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %761 = load ptr, ptr %760, align 8
  %762 = getelementptr inbounds %struct.AstNode, ptr %761, i32 0, i32 6
  %763 = load ptr, ptr %762, align 8
  %764 = getelementptr inbounds %struct.Symbol, ptr %763, i32 0, i32 3
  %765 = load i8, ptr %764, align 2
  %766 = zext i8 %765 to i32
  %767 = icmp eq i32 %766, 0
  br i1 %767, label %768, label %769

768:                                              ; preds = %759, %750
  store i8 5, ptr %4, align 1
  br label %796

769:                                              ; preds = %759, %741
  %770 = load ptr, ptr @__stderrp, align 8
  %771 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %772 = load ptr, ptr %771, align 8
  %773 = getelementptr inbounds %struct.AstNode, ptr %772, i32 0, i32 4
  %774 = getelementptr inbounds %struct.Token, ptr %773, i32 0, i32 1
  %775 = load ptr, ptr %774, align 8
  %776 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %777 = load ptr, ptr %776, align 8
  %778 = getelementptr inbounds %struct.AstNode, ptr %777, i32 0, i32 6
  %779 = load ptr, ptr %778, align 8
  %780 = getelementptr inbounds %struct.Symbol, ptr %779, i32 0, i32 3
  %781 = load i8, ptr %780, align 2
  %782 = zext i8 %781 to i32
  %783 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %784 = load ptr, ptr %783, align 8
  %785 = getelementptr inbounds %struct.AstNode, ptr %784, i32 0, i32 4
  %786 = getelementptr inbounds %struct.Token, ptr %785, i32 0, i32 1
  %787 = load ptr, ptr %786, align 8
  %788 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %789 = load ptr, ptr %788, align 8
  %790 = getelementptr inbounds %struct.AstNode, ptr %789, i32 0, i32 6
  %791 = load ptr, ptr %790, align 8
  %792 = getelementptr inbounds %struct.Symbol, ptr %791, i32 0, i32 3
  %793 = load i8, ptr %792, align 2
  %794 = zext i8 %793 to i32
  %795 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %770, ptr noundef @.str.26.283, ptr noundef %775, i32 noundef %782, ptr noundef %787, i32 noundef %794) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

796:                                              ; preds = %768
  br label %1136

797:                                              ; preds = %193
  %798 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %799 = load ptr, ptr %798, align 8
  %800 = getelementptr inbounds %struct.AstNode, ptr %799, i32 0, i32 6
  %801 = load ptr, ptr %800, align 8
  %802 = getelementptr inbounds %struct.Symbol, ptr %801, i32 0, i32 3
  %803 = load i8, ptr %802, align 2
  %804 = zext i8 %803 to i32
  %805 = icmp eq i32 %804, 1
  br i1 %805, label %815, label %806

806:                                              ; preds = %797
  %807 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %808 = load ptr, ptr %807, align 8
  %809 = getelementptr inbounds %struct.AstNode, ptr %808, i32 0, i32 6
  %810 = load ptr, ptr %809, align 8
  %811 = getelementptr inbounds %struct.Symbol, ptr %810, i32 0, i32 3
  %812 = load i8, ptr %811, align 2
  %813 = zext i8 %812 to i32
  %814 = icmp eq i32 %813, 0
  br i1 %814, label %815, label %833

815:                                              ; preds = %806, %797
  %816 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %817 = load ptr, ptr %816, align 8
  %818 = getelementptr inbounds %struct.AstNode, ptr %817, i32 0, i32 6
  %819 = load ptr, ptr %818, align 8
  %820 = getelementptr inbounds %struct.Symbol, ptr %819, i32 0, i32 3
  %821 = load i8, ptr %820, align 2
  %822 = zext i8 %821 to i32
  %823 = icmp eq i32 %822, 1
  br i1 %823, label %851, label %824

824:                                              ; preds = %815
  %825 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %826 = load ptr, ptr %825, align 8
  %827 = getelementptr inbounds %struct.AstNode, ptr %826, i32 0, i32 6
  %828 = load ptr, ptr %827, align 8
  %829 = getelementptr inbounds %struct.Symbol, ptr %828, i32 0, i32 3
  %830 = load i8, ptr %829, align 2
  %831 = zext i8 %830 to i32
  %832 = icmp eq i32 %831, 0
  br i1 %832, label %851, label %833

833:                                              ; preds = %824, %806
  %834 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %835 = load ptr, ptr %834, align 8
  %836 = getelementptr inbounds %struct.AstNode, ptr %835, i32 0, i32 6
  %837 = load ptr, ptr %836, align 8
  %838 = getelementptr inbounds %struct.Symbol, ptr %837, i32 0, i32 3
  %839 = load i8, ptr %838, align 2
  %840 = zext i8 %839 to i32
  %841 = icmp eq i32 %840, 2
  br i1 %841, label %851, label %842

842:                                              ; preds = %833
  %843 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %844 = load ptr, ptr %843, align 8
  %845 = getelementptr inbounds %struct.AstNode, ptr %844, i32 0, i32 6
  %846 = load ptr, ptr %845, align 8
  %847 = getelementptr inbounds %struct.Symbol, ptr %846, i32 0, i32 3
  %848 = load i8, ptr %847, align 2
  %849 = zext i8 %848 to i32
  %850 = icmp eq i32 %849, 2
  br i1 %850, label %851, label %852

851:                                              ; preds = %842, %833, %824, %815
  store i8 5, ptr %4, align 1
  br label %899

852:                                              ; preds = %842
  %853 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %854 = load ptr, ptr %853, align 8
  %855 = getelementptr inbounds %struct.AstNode, ptr %854, i32 0, i32 6
  %856 = load ptr, ptr %855, align 8
  %857 = getelementptr inbounds %struct.Symbol, ptr %856, i32 0, i32 3
  %858 = load i8, ptr %857, align 2
  %859 = zext i8 %858 to i32
  %860 = icmp eq i32 %859, 4
  br i1 %860, label %870, label %861

861:                                              ; preds = %852
  %862 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %863 = load ptr, ptr %862, align 8
  %864 = getelementptr inbounds %struct.AstNode, ptr %863, i32 0, i32 6
  %865 = load ptr, ptr %864, align 8
  %866 = getelementptr inbounds %struct.Symbol, ptr %865, i32 0, i32 3
  %867 = load i8, ptr %866, align 2
  %868 = zext i8 %867 to i32
  %869 = icmp eq i32 %868, 4
  br i1 %869, label %870, label %871

870:                                              ; preds = %861, %852
  store i8 5, ptr %4, align 1
  br label %898

871:                                              ; preds = %861
  %872 = load ptr, ptr @__stderrp, align 8
  %873 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %874 = load ptr, ptr %873, align 8
  %875 = getelementptr inbounds %struct.AstNode, ptr %874, i32 0, i32 4
  %876 = getelementptr inbounds %struct.Token, ptr %875, i32 0, i32 1
  %877 = load ptr, ptr %876, align 8
  %878 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %879 = load ptr, ptr %878, align 8
  %880 = getelementptr inbounds %struct.AstNode, ptr %879, i32 0, i32 6
  %881 = load ptr, ptr %880, align 8
  %882 = getelementptr inbounds %struct.Symbol, ptr %881, i32 0, i32 3
  %883 = load i8, ptr %882, align 2
  %884 = zext i8 %883 to i32
  %885 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %886 = load ptr, ptr %885, align 8
  %887 = getelementptr inbounds %struct.AstNode, ptr %886, i32 0, i32 4
  %888 = getelementptr inbounds %struct.Token, ptr %887, i32 0, i32 1
  %889 = load ptr, ptr %888, align 8
  %890 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %891 = load ptr, ptr %890, align 8
  %892 = getelementptr inbounds %struct.AstNode, ptr %891, i32 0, i32 6
  %893 = load ptr, ptr %892, align 8
  %894 = getelementptr inbounds %struct.Symbol, ptr %893, i32 0, i32 3
  %895 = load i8, ptr %894, align 2
  %896 = zext i8 %895 to i32
  %897 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %872, ptr noundef @.str.27.284, ptr noundef %877, i32 noundef %884, ptr noundef %889, i32 noundef %896) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

898:                                              ; preds = %870
  br label %899

899:                                              ; preds = %898, %851
  br label %1136

900:                                              ; preds = %193
  %901 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %902 = load ptr, ptr %901, align 8
  %903 = getelementptr inbounds %struct.AstNode, ptr %902, i32 0, i32 6
  %904 = load ptr, ptr %903, align 8
  %905 = getelementptr inbounds %struct.Symbol, ptr %904, i32 0, i32 3
  %906 = load i8, ptr %905, align 2
  %907 = zext i8 %906 to i32
  %908 = icmp eq i32 %907, 1
  br i1 %908, label %918, label %909

909:                                              ; preds = %900
  %910 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %911 = load ptr, ptr %910, align 8
  %912 = getelementptr inbounds %struct.AstNode, ptr %911, i32 0, i32 6
  %913 = load ptr, ptr %912, align 8
  %914 = getelementptr inbounds %struct.Symbol, ptr %913, i32 0, i32 3
  %915 = load i8, ptr %914, align 2
  %916 = zext i8 %915 to i32
  %917 = icmp eq i32 %916, 0
  br i1 %917, label %918, label %936

918:                                              ; preds = %909, %900
  %919 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %920 = load ptr, ptr %919, align 8
  %921 = getelementptr inbounds %struct.AstNode, ptr %920, i32 0, i32 6
  %922 = load ptr, ptr %921, align 8
  %923 = getelementptr inbounds %struct.Symbol, ptr %922, i32 0, i32 3
  %924 = load i8, ptr %923, align 2
  %925 = zext i8 %924 to i32
  %926 = icmp eq i32 %925, 1
  br i1 %926, label %954, label %927

927:                                              ; preds = %918
  %928 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %929 = load ptr, ptr %928, align 8
  %930 = getelementptr inbounds %struct.AstNode, ptr %929, i32 0, i32 6
  %931 = load ptr, ptr %930, align 8
  %932 = getelementptr inbounds %struct.Symbol, ptr %931, i32 0, i32 3
  %933 = load i8, ptr %932, align 2
  %934 = zext i8 %933 to i32
  %935 = icmp eq i32 %934, 0
  br i1 %935, label %954, label %936

936:                                              ; preds = %927, %909
  %937 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %938 = load ptr, ptr %937, align 8
  %939 = getelementptr inbounds %struct.AstNode, ptr %938, i32 0, i32 6
  %940 = load ptr, ptr %939, align 8
  %941 = getelementptr inbounds %struct.Symbol, ptr %940, i32 0, i32 3
  %942 = load i8, ptr %941, align 2
  %943 = zext i8 %942 to i32
  %944 = icmp eq i32 %943, 2
  br i1 %944, label %954, label %945

945:                                              ; preds = %936
  %946 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %947 = load ptr, ptr %946, align 8
  %948 = getelementptr inbounds %struct.AstNode, ptr %947, i32 0, i32 6
  %949 = load ptr, ptr %948, align 8
  %950 = getelementptr inbounds %struct.Symbol, ptr %949, i32 0, i32 3
  %951 = load i8, ptr %950, align 2
  %952 = zext i8 %951 to i32
  %953 = icmp eq i32 %952, 2
  br i1 %953, label %954, label %955

954:                                              ; preds = %945, %936, %927, %918
  store i8 5, ptr %4, align 1
  br label %1002

955:                                              ; preds = %945
  %956 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %957 = load ptr, ptr %956, align 8
  %958 = getelementptr inbounds %struct.AstNode, ptr %957, i32 0, i32 6
  %959 = load ptr, ptr %958, align 8
  %960 = getelementptr inbounds %struct.Symbol, ptr %959, i32 0, i32 3
  %961 = load i8, ptr %960, align 2
  %962 = zext i8 %961 to i32
  %963 = icmp eq i32 %962, 4
  br i1 %963, label %973, label %964

964:                                              ; preds = %955
  %965 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %966 = load ptr, ptr %965, align 8
  %967 = getelementptr inbounds %struct.AstNode, ptr %966, i32 0, i32 6
  %968 = load ptr, ptr %967, align 8
  %969 = getelementptr inbounds %struct.Symbol, ptr %968, i32 0, i32 3
  %970 = load i8, ptr %969, align 2
  %971 = zext i8 %970 to i32
  %972 = icmp eq i32 %971, 4
  br i1 %972, label %973, label %974

973:                                              ; preds = %964, %955
  store i8 5, ptr %4, align 1
  br label %1001

974:                                              ; preds = %964
  %975 = load ptr, ptr @__stderrp, align 8
  %976 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %977 = load ptr, ptr %976, align 8
  %978 = getelementptr inbounds %struct.AstNode, ptr %977, i32 0, i32 4
  %979 = getelementptr inbounds %struct.Token, ptr %978, i32 0, i32 1
  %980 = load ptr, ptr %979, align 8
  %981 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %982 = load ptr, ptr %981, align 8
  %983 = getelementptr inbounds %struct.AstNode, ptr %982, i32 0, i32 6
  %984 = load ptr, ptr %983, align 8
  %985 = getelementptr inbounds %struct.Symbol, ptr %984, i32 0, i32 3
  %986 = load i8, ptr %985, align 2
  %987 = zext i8 %986 to i32
  %988 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %989 = load ptr, ptr %988, align 8
  %990 = getelementptr inbounds %struct.AstNode, ptr %989, i32 0, i32 4
  %991 = getelementptr inbounds %struct.Token, ptr %990, i32 0, i32 1
  %992 = load ptr, ptr %991, align 8
  %993 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %994 = load ptr, ptr %993, align 8
  %995 = getelementptr inbounds %struct.AstNode, ptr %994, i32 0, i32 6
  %996 = load ptr, ptr %995, align 8
  %997 = getelementptr inbounds %struct.Symbol, ptr %996, i32 0, i32 3
  %998 = load i8, ptr %997, align 2
  %999 = zext i8 %998 to i32
  %1000 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %975, ptr noundef @.str.28.285, ptr noundef %980, i32 noundef %987, ptr noundef %992, i32 noundef %999) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

1001:                                             ; preds = %973
  br label %1002

1002:                                             ; preds = %1001, %954
  br label %1136

1003:                                             ; preds = %193
  %1004 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1005 = load ptr, ptr %1004, align 8
  %1006 = getelementptr inbounds %struct.AstNode, ptr %1005, i32 0, i32 6
  %1007 = load ptr, ptr %1006, align 8
  %1008 = getelementptr inbounds %struct.Symbol, ptr %1007, i32 0, i32 3
  %1009 = load i8, ptr %1008, align 2
  %1010 = zext i8 %1009 to i32
  %1011 = icmp eq i32 %1010, 1
  br i1 %1011, label %1021, label %1012

1012:                                             ; preds = %1003
  %1013 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1014 = load ptr, ptr %1013, align 8
  %1015 = getelementptr inbounds %struct.AstNode, ptr %1014, i32 0, i32 6
  %1016 = load ptr, ptr %1015, align 8
  %1017 = getelementptr inbounds %struct.Symbol, ptr %1016, i32 0, i32 3
  %1018 = load i8, ptr %1017, align 2
  %1019 = zext i8 %1018 to i32
  %1020 = icmp eq i32 %1019, 0
  br i1 %1020, label %1021, label %1031

1021:                                             ; preds = %1012, %1003
  %1022 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1023 = load ptr, ptr %1022, align 8
  %1024 = getelementptr inbounds %struct.AstNode, ptr %1023, i32 0, i32 6
  %1025 = load ptr, ptr %1024, align 8
  %1026 = getelementptr inbounds %struct.Symbol, ptr %1025, i32 0, i32 3
  %1027 = load i8, ptr %1026, align 2
  %1028 = zext i8 %1027 to i32
  %1029 = icmp eq i32 %1028, 2
  br i1 %1029, label %1030, label %1031

1030:                                             ; preds = %1021
  store i8 2, ptr %4, align 1
  br label %1134

1031:                                             ; preds = %1021, %1012
  %1032 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1033 = load ptr, ptr %1032, align 8
  %1034 = getelementptr inbounds %struct.AstNode, ptr %1033, i32 0, i32 6
  %1035 = load ptr, ptr %1034, align 8
  %1036 = getelementptr inbounds %struct.Symbol, ptr %1035, i32 0, i32 3
  %1037 = load i8, ptr %1036, align 2
  %1038 = zext i8 %1037 to i32
  %1039 = icmp eq i32 %1038, 1
  br i1 %1039, label %1040, label %1050

1040:                                             ; preds = %1031
  %1041 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1042 = load ptr, ptr %1041, align 8
  %1043 = getelementptr inbounds %struct.AstNode, ptr %1042, i32 0, i32 6
  %1044 = load ptr, ptr %1043, align 8
  %1045 = getelementptr inbounds %struct.Symbol, ptr %1044, i32 0, i32 3
  %1046 = load i8, ptr %1045, align 2
  %1047 = zext i8 %1046 to i32
  %1048 = icmp eq i32 %1047, 1
  br i1 %1048, label %1049, label %1050

1049:                                             ; preds = %1040
  store i8 1, ptr %4, align 1
  br label %1133

1050:                                             ; preds = %1040, %1031
  %1051 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1052 = load ptr, ptr %1051, align 8
  %1053 = getelementptr inbounds %struct.AstNode, ptr %1052, i32 0, i32 6
  %1054 = load ptr, ptr %1053, align 8
  %1055 = getelementptr inbounds %struct.Symbol, ptr %1054, i32 0, i32 3
  %1056 = load i8, ptr %1055, align 2
  %1057 = zext i8 %1056 to i32
  %1058 = icmp eq i32 %1057, 1
  br i1 %1058, label %1068, label %1059

1059:                                             ; preds = %1050
  %1060 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1061 = load ptr, ptr %1060, align 8
  %1062 = getelementptr inbounds %struct.AstNode, ptr %1061, i32 0, i32 6
  %1063 = load ptr, ptr %1062, align 8
  %1064 = getelementptr inbounds %struct.Symbol, ptr %1063, i32 0, i32 3
  %1065 = load i8, ptr %1064, align 2
  %1066 = zext i8 %1065 to i32
  %1067 = icmp eq i32 %1066, 0
  br i1 %1067, label %1068, label %1086

1068:                                             ; preds = %1059, %1050
  %1069 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1070 = load ptr, ptr %1069, align 8
  %1071 = getelementptr inbounds %struct.AstNode, ptr %1070, i32 0, i32 6
  %1072 = load ptr, ptr %1071, align 8
  %1073 = getelementptr inbounds %struct.Symbol, ptr %1072, i32 0, i32 3
  %1074 = load i8, ptr %1073, align 2
  %1075 = zext i8 %1074 to i32
  %1076 = icmp eq i32 %1075, 1
  br i1 %1076, label %1104, label %1077

1077:                                             ; preds = %1068
  %1078 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1079 = load ptr, ptr %1078, align 8
  %1080 = getelementptr inbounds %struct.AstNode, ptr %1079, i32 0, i32 6
  %1081 = load ptr, ptr %1080, align 8
  %1082 = getelementptr inbounds %struct.Symbol, ptr %1081, i32 0, i32 3
  %1083 = load i8, ptr %1082, align 2
  %1084 = zext i8 %1083 to i32
  %1085 = icmp eq i32 %1084, 0
  br i1 %1085, label %1104, label %1086

1086:                                             ; preds = %1077, %1059
  %1087 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1088 = load ptr, ptr %1087, align 8
  %1089 = getelementptr inbounds %struct.AstNode, ptr %1088, i32 0, i32 6
  %1090 = load ptr, ptr %1089, align 8
  %1091 = getelementptr inbounds %struct.Symbol, ptr %1090, i32 0, i32 3
  %1092 = load i8, ptr %1091, align 2
  %1093 = zext i8 %1092 to i32
  %1094 = icmp eq i32 %1093, 0
  br i1 %1094, label %1095, label %1105

1095:                                             ; preds = %1086
  %1096 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1097 = load ptr, ptr %1096, align 8
  %1098 = getelementptr inbounds %struct.AstNode, ptr %1097, i32 0, i32 6
  %1099 = load ptr, ptr %1098, align 8
  %1100 = getelementptr inbounds %struct.Symbol, ptr %1099, i32 0, i32 3
  %1101 = load i8, ptr %1100, align 2
  %1102 = zext i8 %1101 to i32
  %1103 = icmp eq i32 %1102, 0
  br i1 %1103, label %1104, label %1105

1104:                                             ; preds = %1095, %1077, %1068
  store i8 0, ptr %4, align 1
  br label %1132

1105:                                             ; preds = %1095, %1086
  %1106 = load ptr, ptr @__stderrp, align 8
  %1107 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1108 = load ptr, ptr %1107, align 8
  %1109 = getelementptr inbounds %struct.AstNode, ptr %1108, i32 0, i32 4
  %1110 = getelementptr inbounds %struct.Token, ptr %1109, i32 0, i32 1
  %1111 = load ptr, ptr %1110, align 8
  %1112 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1113 = load ptr, ptr %1112, align 8
  %1114 = getelementptr inbounds %struct.AstNode, ptr %1113, i32 0, i32 6
  %1115 = load ptr, ptr %1114, align 8
  %1116 = getelementptr inbounds %struct.Symbol, ptr %1115, i32 0, i32 3
  %1117 = load i8, ptr %1116, align 2
  %1118 = zext i8 %1117 to i32
  %1119 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1120 = load ptr, ptr %1119, align 8
  %1121 = getelementptr inbounds %struct.AstNode, ptr %1120, i32 0, i32 4
  %1122 = getelementptr inbounds %struct.Token, ptr %1121, i32 0, i32 1
  %1123 = load ptr, ptr %1122, align 8
  %1124 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1125 = load ptr, ptr %1124, align 8
  %1126 = getelementptr inbounds %struct.AstNode, ptr %1125, i32 0, i32 6
  %1127 = load ptr, ptr %1126, align 8
  %1128 = getelementptr inbounds %struct.Symbol, ptr %1127, i32 0, i32 3
  %1129 = load i8, ptr %1128, align 2
  %1130 = zext i8 %1129 to i32
  %1131 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1106, ptr noundef @.str.21.278, ptr noundef %1111, i32 noundef %1118, ptr noundef %1123, i32 noundef %1130) #14
  call void @handleError(i32 noundef 6) #12
  unreachable

1132:                                             ; preds = %1104
  br label %1133

1133:                                             ; preds = %1132, %1049
  br label %1134

1134:                                             ; preds = %1133, %1030
  br label %1136

1135:                                             ; preds = %193
  br label %1136

1136:                                             ; preds = %1135, %1134, %1002, %899, %796, %731, %666, %601, %536, %471, %387, %228
  %1137 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1138 = load ptr, ptr %1137, align 8
  %1139 = getelementptr inbounds %struct.AstNode, ptr %1138, i32 0, i32 6
  %1140 = load ptr, ptr %1139, align 8
  %1141 = icmp eq ptr %1140, null
  br i1 %1141, label %1142, label %1147

1142:                                             ; preds = %1136
  %1143 = call ptr @malloc(i64 noundef 16) #11
  %1144 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1145 = load ptr, ptr %1144, align 8
  %1146 = getelementptr inbounds %struct.AstNode, ptr %1145, i32 0, i32 6
  store ptr %1143, ptr %1146, align 8
  br label %1147

1147:                                             ; preds = %1142, %1136
  %1148 = load i8, ptr %4, align 1
  %1149 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1150 = load ptr, ptr %1149, align 8
  %1151 = getelementptr inbounds %struct.AstNode, ptr %1150, i32 0, i32 6
  %1152 = load ptr, ptr %1151, align 8
  %1153 = getelementptr inbounds %struct.Symbol, ptr %1152, i32 0, i32 3
  store i8 %1148, ptr %1153, align 2
  %1154 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 0
  %1155 = load ptr, ptr %1154, align 8
  %1156 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1157 = load ptr, ptr %1156, align 8
  call void @addAstNode(ptr noundef %1155, ptr noundef %1157)
  %1158 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 2
  %1159 = load ptr, ptr %1158, align 8
  %1160 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1161 = load ptr, ptr %1160, align 8
  call void @addAstNode(ptr noundef %1159, ptr noundef %1161)
  %1162 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1163 = load ptr, ptr %1162, align 8
  %1164 = getelementptr inbounds %struct.AstNode, ptr %1163, i32 0, i32 3
  store i32 10, ptr %1164, align 4
  %1165 = getelementptr inbounds [3 x ptr], ptr %1, i64 0, i64 1
  %1166 = load ptr, ptr %1165, align 8
  call void @push(ptr noundef @stack, ptr noundef %1166)
  br label %1168

1167:                                             ; preds = %158, %152, %145, %142
  call void @printDebug(ptr noundef @.str.29.286)
  call void @handleError(i32 noundef 2) #12
  unreachable

1168:                                             ; preds = %1147
  br label %1169

1169:                                             ; preds = %1168, %139
  br label %1170

1170:                                             ; preds = %1169, %112
  ret void
}

declare double @atof(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @parse() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca %struct.Token, align 8
  call void @semInit()
  %4 = call ptr @initAst()
  store ptr %4, ptr %1, align 8
  call void @initStack(ptr noundef @stack, i64 noundef 20)
  %5 = call ptr @createAstNode(i32 noundef 1)
  store ptr %5, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = load ptr, ptr %2, align 8
  call void @setAstRoot(ptr noundef %6, ptr noundef %7)
  %8 = call ptr @parseProlog()
  %9 = load ptr, ptr %2, align 8
  call void @addAstNode(ptr noundef %8, ptr noundef %9)
  %10 = call ptr @parseClass()
  %11 = load ptr, ptr %2, align 8
  call void @addAstNode(ptr noundef %10, ptr noundef %11)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 1)
  %12 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp ne i32 %13, 53
  br i1 %14, label %15, label %20

15:                                               ; preds = %0
  %16 = load i8, ptr @__debug, align 1
  %17 = trunc i8 %16 to i1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  call void @printDebug(ptr noundef @.str.30.289)
  br label %19

19:                                               ; preds = %18, %15
  call void @handleError(i32 noundef 2) #12
  unreachable

20:                                               ; preds = %0
  call void @tokenDeInit(ptr noundef %3)
  call void @freeStack(ptr noundef @stack)
  call void @resCALL(ptr noundef @semStack)
  %21 = call i32 @lookupFunction(ptr noundef @semStack, ptr noundef @.str.31.290, i32 noundef 0, ptr noundef null)
  %22 = icmp eq i32 %21, 3
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  call void @printDebug(ptr noundef @.str.32.291)
  call void @handleError(i32 noundef 3) #12
  unreachable

24:                                               ; preds = %20
  call void @semClean()
  %25 = load ptr, ptr %1, align 8
  ret ptr %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseProlog() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = call ptr @createAstNode(i32 noundef 2)
  store ptr %6, ptr %1, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2, i32 noundef 1)
  %7 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp ne i32 %8, 29
  br i1 %9, label %10, label %15

10:                                               ; preds = %0
  %11 = load i8, ptr @__debug, align 1
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @printDebug(ptr noundef @.str.34.333)
  br label %14

14:                                               ; preds = %13, %10
  call void @handleError(i32 noundef 2) #12
  unreachable

15:                                               ; preds = %0
  call void @tokenDeInit(ptr noundef %2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %16 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 46
  br i1 %18, label %24, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.35.334) #14
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %19, %15
  %25 = load i8, ptr @__debug, align 1
  %26 = trunc i8 %25 to i1
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  call void @printDebug(ptr noundef @.str.36.335)
  br label %28

28:                                               ; preds = %27, %24
  call void @handleError(i32 noundef 2) #12
  unreachable

29:                                               ; preds = %19
  call void @tokenDeInit(ptr noundef %2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %4, i64 40, i1 false)
  %30 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 35
  br i1 %32, label %33, label %38

33:                                               ; preds = %29
  %34 = load i8, ptr @__debug, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @printDebug(ptr noundef @.str.37.336)
  br label %37

37:                                               ; preds = %36, %33
  call void @handleError(i32 noundef 2) #12
  unreachable

38:                                               ; preds = %29
  call void @tokenDeInit(ptr noundef %2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %5, i32 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %5, i64 40, i1 false)
  %39 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp ne i32 %40, 28
  br i1 %41, label %42, label %47

42:                                               ; preds = %38
  %43 = load i8, ptr @__debug, align 1
  %44 = trunc i8 %43 to i1
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  call void @printDebug(ptr noundef @.str.38.337)
  br label %46

46:                                               ; preds = %45, %42
  call void @handleError(i32 noundef 2) #12
  unreachable

47:                                               ; preds = %38
  call void @tokenDeInit(ptr noundef %2)
  store i8 1, ptr @prolog, align 1
  %48 = load ptr, ptr %1, align 8
  ret ptr %48
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseClass() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = call ptr @createAstNode(i32 noundef 3)
  store ptr %6, ptr %1, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2, i32 noundef 2)
  %7 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp ne i32 %8, 30
  br i1 %9, label %10, label %15

10:                                               ; preds = %0
  %11 = load i8, ptr @__debug, align 1
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @printDebug(ptr noundef @.str.39.292)
  br label %14

14:                                               ; preds = %13, %10
  call void @handleError(i32 noundef 2) #12
  unreachable

15:                                               ; preds = %0
  call void @tokenDeInit(ptr noundef %2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %16 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 47
  br i1 %18, label %19, label %29

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.40.293) #14
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %19
  %25 = load i8, ptr @__debug, align 1
  %26 = trunc i8 %25 to i1
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  call void @printDebug(ptr noundef @.str.41.294)
  br label %28

28:                                               ; preds = %27, %24
  call void @handleError(i32 noundef 2) #12
  unreachable

29:                                               ; preds = %19, %15
  call void @tokenDeInit(ptr noundef %2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4, i32 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %4, i64 40, i1 false)
  %30 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp ne i32 %31, 15
  br i1 %32, label %33, label %38

33:                                               ; preds = %29
  %34 = load i8, ptr @__debug, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @printDebug(ptr noundef @.str.42.295)
  br label %37

37:                                               ; preds = %36, %33
  call void @handleError(i32 noundef 2) #12
  unreachable

38:                                               ; preds = %29
  call void @tokenDeInit(ptr noundef %2)
  %39 = call ptr @parseFuncList()
  %40 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %39, ptr noundef %40)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %5, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %5, i64 40, i1 false)
  %41 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %42 = load i32, ptr %41, align 8
  %43 = icmp ne i32 %42, 16
  br i1 %43, label %44, label %49

44:                                               ; preds = %38
  %45 = load i8, ptr @__debug, align 1
  %46 = trunc i8 %45 to i1
  br i1 %46, label %47, label %48

47:                                               ; preds = %44
  call void @printDebug(ptr noundef @.str.43.296)
  br label %48

48:                                               ; preds = %47, %44
  call void @handleError(i32 noundef 2) #12
  unreachable

49:                                               ; preds = %38
  call void @tokenDeInit(ptr noundef %2)
  %50 = load ptr, ptr %1, align 8
  ret ptr %50
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseFuncList() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = call ptr @createAstNode(i32 noundef 4)
  store ptr %6, ptr %1, align 8
  br label %7

7:                                                ; preds = %16, %0
  %8 = call ptr @parseFuncDecl()
  %9 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %8, ptr noundef %9)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %10 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 41
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %2, i64 40, i1 false)
  call void @storeToken(ptr noundef %4)
  br label %16

14:                                               ; preds = %7
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %2, i64 40, i1 false)
  call void @storeToken(ptr noundef %5)
  %15 = load ptr, ptr %1, align 8
  ret ptr %15

16:                                               ; preds = %13
  br label %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseFuncDecl() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = alloca %struct.Token, align 8
  %7 = alloca %struct.Token, align 8
  %8 = alloca %struct.Token, align 8
  %9 = alloca %struct.Token, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %struct.Token, align 8
  %13 = alloca %struct.Token, align 8
  %14 = alloca %struct.Token, align 8
  %15 = alloca %struct.Token, align 8
  %16 = alloca %struct.Token, align 8
  %17 = alloca ptr, align 8
  %18 = alloca %struct.Token, align 8
  %19 = alloca i32, align 4
  %20 = alloca %struct.Token, align 8
  %21 = alloca %struct.Token, align 8
  %22 = call ptr @createAstNode(i32 noundef 5)
  store ptr %22, ptr %1, align 8
  %23 = call ptr @createAstNode(i32 noundef 0)
  store ptr %23, ptr %2, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 2)
  %24 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp ne i32 %25, 41
  br i1 %26, label %27, label %32

27:                                               ; preds = %0
  %28 = load i8, ptr @__debug, align 1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  call void @printDebug(ptr noundef @.str.44.297)
  br label %31

31:                                               ; preds = %30, %27
  call void @handleError(i32 noundef 2) #12
  unreachable

32:                                               ; preds = %0
  call void @tokenDeInit(ptr noundef %3)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %4, i64 40, i1 false)
  %33 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = icmp ne i32 %34, 47
  br i1 %35, label %36, label %41

36:                                               ; preds = %32
  %37 = load i8, ptr @__debug, align 1
  %38 = trunc i8 %37 to i1
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  call void @printDebug(ptr noundef @.str.45.298)
  br label %40

40:                                               ; preds = %39, %36
  call void @handleError(i32 noundef 2) #12
  unreachable

41:                                               ; preds = %32
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds %struct.AstNode, ptr %42, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %43, ptr align 8 %3, i64 40, i1 false)
  %44 = load ptr, ptr %2, align 8
  %45 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %44, ptr noundef %45)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %3, i64 40, i1 false)
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %6)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %6, i64 40, i1 false)
  %46 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp eq i32 %47, 27
  br i1 %48, label %49, label %98

49:                                               ; preds = %41
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %7, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %7, i64 40, i1 false)
  %50 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %51 = load i32, ptr %50, align 8
  %52 = icmp ne i32 %51, 27
  br i1 %52, label %53, label %58

53:                                               ; preds = %49
  %54 = load ptr, ptr @__stderrp, align 8
  %55 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  %57 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %54, ptr noundef @.str.46.299, ptr noundef %56) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

58:                                               ; preds = %49
  call void @tokenDeInit(ptr noundef %3)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %8, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %8, i64 40, i1 false)
  %59 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = icmp ne i32 %60, 12
  br i1 %61, label %62, label %67

62:                                               ; preds = %58
  %63 = load ptr, ptr @__stderrp, align 8
  %64 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %65 = load ptr, ptr %64, align 8
  %66 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %63, ptr noundef @.str.47.300, ptr noundef %65) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

67:                                               ; preds = %58
  call void @tokenDeInit(ptr noundef %3)
  call void @semEnterScope()
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %9, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %9, i64 40, i1 false)
  %68 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %69 = load i32, ptr %68, align 8
  %70 = icmp ne i32 %69, 47
  br i1 %70, label %71, label %76

71:                                               ; preds = %67
  %72 = load ptr, ptr @__stderrp, align 8
  %73 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %72, ptr noundef @.str.48.301, ptr noundef %74) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

76:                                               ; preds = %67
  %77 = call ptr @createAstNode(i32 noundef 6)
  store ptr %77, ptr %10, align 8
  %78 = call ptr @createAstNode(i32 noundef 0)
  store ptr %78, ptr %11, align 8
  %79 = load ptr, ptr %11, align 8
  %80 = getelementptr inbounds %struct.AstNode, ptr %79, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %80, ptr align 8 %3, i64 40, i1 false)
  %81 = load ptr, ptr %11, align 8
  %82 = load ptr, ptr %10, align 8
  call void @addAstNode(ptr noundef %81, ptr noundef %82)
  %83 = load ptr, ptr %10, align 8
  %84 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %83, ptr noundef %84)
  %85 = load ptr, ptr %11, align 8
  %86 = getelementptr inbounds %struct.AstNode, ptr %85, i32 0, i32 6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %3, i64 40, i1 false)
  call void @semVar(ptr noundef %12, i1 noundef zeroext false, ptr noundef %86)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %13, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %13, i64 40, i1 false)
  %87 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = icmp ne i32 %88, 13
  br i1 %89, label %90, label %95

90:                                               ; preds = %76
  %91 = load ptr, ptr @__stderrp, align 8
  %92 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %93 = load ptr, ptr %92, align 8
  %94 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %91, ptr noundef @.str.49.302, ptr noundef %93) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

95:                                               ; preds = %76
  call void @tokenDeInit(ptr noundef %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %5, i64 40, i1 false)
  call void @semStr(ptr noundef %14)
  %96 = call ptr @parseBlock(i1 noundef zeroext false)
  %97 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %96, ptr noundef %97)
  call void @semExitScope()
  br label %170

98:                                               ; preds = %41
  %99 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 15
  br i1 %101, label %102, label %105

102:                                              ; preds = %98
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %5, i64 40, i1 false)
  call void @semGtr(ptr noundef %15)
  %103 = call ptr @parseBlock(i1 noundef zeroext true)
  %104 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %103, ptr noundef %104)
  br label %169

105:                                              ; preds = %98
  %106 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %107 = load i32, ptr %106, align 8
  %108 = icmp eq i32 %107, 12
  br i1 %108, label %109, label %163

109:                                              ; preds = %105
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %16, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %16, i64 40, i1 false)
  %110 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %111 = load i32, ptr %110, align 8
  %112 = icmp ne i32 %111, 12
  br i1 %112, label %113, label %118

113:                                              ; preds = %109
  %114 = load ptr, ptr @__stderrp, align 8
  %115 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %116 = load ptr, ptr %115, align 8
  %117 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %114, ptr noundef @.str.50.303, ptr noundef %116) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

118:                                              ; preds = %109
  call void @tokenDeInit(ptr noundef %3)
  call void @semEnterScope()
  %119 = call ptr @parseParamList(i1 noundef zeroext false)
  store ptr %119, ptr %17, align 8
  %120 = load ptr, ptr %17, align 8
  %121 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %120, ptr noundef %121)
  %122 = load ptr, ptr %17, align 8
  %123 = getelementptr inbounds %struct.AstNode, ptr %122, i32 0, i32 2
  %124 = load i32, ptr %123, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %18, ptr align 8 %5, i64 40, i1 false)
  call void @semFnc(ptr noundef %18, i32 noundef %124)
  store i32 0, ptr %19, align 4
  br label %125

125:                                              ; preds = %148, %118
  %126 = load i32, ptr %19, align 4
  %127 = load ptr, ptr %17, align 8
  %128 = getelementptr inbounds %struct.AstNode, ptr %127, i32 0, i32 2
  %129 = load i32, ptr %128, align 8
  %130 = icmp slt i32 %126, %129
  br i1 %130, label %131, label %151

131:                                              ; preds = %125
  %132 = load ptr, ptr %17, align 8
  %133 = getelementptr inbounds %struct.AstNode, ptr %132, i32 0, i32 1
  %134 = load ptr, ptr %133, align 8
  %135 = load i32, ptr %19, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds ptr, ptr %134, i64 %136
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds %struct.AstNode, ptr %138, i32 0, i32 4
  %140 = load ptr, ptr %17, align 8
  %141 = getelementptr inbounds %struct.AstNode, ptr %140, i32 0, i32 1
  %142 = load ptr, ptr %141, align 8
  %143 = load i32, ptr %19, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds ptr, ptr %142, i64 %144
  %146 = load ptr, ptr %145, align 8
  %147 = getelementptr inbounds %struct.AstNode, ptr %146, i32 0, i32 6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %20, ptr align 8 %139, i64 40, i1 false)
  call void @semVar(ptr noundef %20, i1 noundef zeroext false, ptr noundef %147)
  br label %148

148:                                              ; preds = %131
  %149 = load i32, ptr %19, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %19, align 4
  br label %125

151:                                              ; preds = %125
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %21, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %21, i64 40, i1 false)
  %152 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %153 = load i32, ptr %152, align 8
  %154 = icmp ne i32 %153, 13
  br i1 %154, label %155, label %160

155:                                              ; preds = %151
  %156 = load ptr, ptr @__stderrp, align 8
  %157 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %158 = load ptr, ptr %157, align 8
  %159 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %156, ptr noundef @.str.50.303, ptr noundef %158) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

160:                                              ; preds = %151
  call void @tokenDeInit(ptr noundef %3)
  %161 = call ptr @parseBlock(i1 noundef zeroext false)
  %162 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %161, ptr noundef %162)
  call void @semExitScope()
  br label %168

163:                                              ; preds = %105
  %164 = load ptr, ptr @__stderrp, align 8
  %165 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %166 = load ptr, ptr %165, align 8
  %167 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %164, ptr noundef @.str.50.303, ptr noundef %166) #14
  call void @handleError(i32 noundef 2) #12
  unreachable

168:                                              ; preds = %160
  br label %169

169:                                              ; preds = %168, %102
  br label %170

170:                                              ; preds = %169, %95
  %171 = load ptr, ptr %1, align 8
  ret ptr %171
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseBlock(i1 noundef zeroext %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca ptr, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = alloca %struct.Token, align 8
  %7 = alloca %struct.Token, align 8
  %8 = zext i1 %0 to i8
  store i8 %8, ptr %2, align 1
  %9 = call ptr @createAstNode(i32 noundef 8)
  store ptr %9, ptr %3, align 8
  %10 = load i8, ptr %2, align 1
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %13

12:                                               ; preds = %1
  call void @semEnterScope()
  br label %13

13:                                               ; preds = %12, %1
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4, i32 noundef 0)
  %14 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp ne i32 %15, 15
  br i1 %16, label %17, label %22

17:                                               ; preds = %13
  %18 = load i8, ptr @__debug, align 1
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @printDebug(ptr noundef @.str.51.307)
  br label %21

21:                                               ; preds = %20, %17
  call void @handleError(i32 noundef 2) #12
  unreachable

22:                                               ; preds = %13
  call void @tokenDeInit(ptr noundef %4)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %5, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %5, i64 40, i1 false)
  br label %23

23:                                               ; preds = %53, %22
  %24 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp ne i32 %25, 16
  br i1 %26, label %27, label %54

27:                                               ; preds = %23
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %4, i64 40, i1 false)
  call void @storeToken(ptr noundef %6)
  %28 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  switch i32 %29, label %48 [
    i32 42, label %30
    i32 49, label %33
    i32 47, label %33
    i32 31, label %36
    i32 36, label %39
    i32 40, label %42
    i32 15, label %45
  ]

30:                                               ; preds = %27
  %31 = call ptr @parseDefVar()
  %32 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %31, ptr noundef %32)
  br label %53

33:                                               ; preds = %27, %27
  %34 = call ptr @parseAssignment()
  %35 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %34, ptr noundef %35)
  br label %53

36:                                               ; preds = %27
  %37 = call ptr @parseIfStatement()
  %38 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %37, ptr noundef %38)
  br label %53

39:                                               ; preds = %27
  %40 = call ptr @parseWhile()
  %41 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %40, ptr noundef %41)
  br label %53

42:                                               ; preds = %27
  %43 = call ptr @parseReturn()
  %44 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %43, ptr noundef %44)
  br label %53

45:                                               ; preds = %27
  %46 = call ptr @parseBlock(i1 noundef zeroext true)
  %47 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %46, ptr noundef %47)
  br label %53

48:                                               ; preds = %27
  %49 = load i8, ptr @__debug, align 1
  %50 = trunc i8 %49 to i1
  br i1 %50, label %51, label %52

51:                                               ; preds = %48
  call void @printDebug(ptr noundef @.str.52.308)
  br label %52

52:                                               ; preds = %51, %48
  call void @handleError(i32 noundef 2) #12
  unreachable

53:                                               ; preds = %45, %42, %39, %36, %33, %30
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %7, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %7, i64 40, i1 false)
  br label %23

54:                                               ; preds = %23
  call void @tokenDeInit(ptr noundef %4)
  %55 = load i8, ptr %2, align 1
  %56 = trunc i8 %55 to i1
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  call void @semExitScope()
  br label %58

58:                                               ; preds = %57, %54
  %59 = load ptr, ptr %3, align 8
  ret ptr %59
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseParamList(i1 noundef zeroext %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.Token, align 8
  %7 = alloca i8, align 1
  %8 = alloca %struct.Token, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.Token, align 8
  %11 = alloca %struct.Token, align 8
  %12 = alloca %struct.Token, align 8
  %13 = zext i1 %0 to i8
  store i8 %13, ptr %3, align 1
  %14 = call ptr @createAstNode(i32 noundef 6)
  store ptr %14, ptr %4, align 8
  store i8 0, ptr %7, align 1
  br label %15

15:                                               ; preds = %201, %1
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %8, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %8, i64 40, i1 false)
  %16 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = call zeroext i1 @isTokenId(i32 noundef %17)
  br i1 %18, label %19, label %162

19:                                               ; preds = %15
  %20 = call ptr @createAstNode(i32 noundef 0)
  store ptr %20, ptr %5, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.AstNode, ptr %21, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %22, ptr align 8 %6, i64 40, i1 false)
  %23 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = icmp eq i32 %24, 46
  br i1 %25, label %50, label %26

26:                                               ; preds = %19
  %27 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %28 = load i32, ptr %27, align 8
  %29 = icmp eq i32 %28, 48
  br i1 %29, label %50, label %30

30:                                               ; preds = %26
  %31 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = icmp eq i32 %32, 50
  br i1 %33, label %50, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = icmp eq i32 %36, 34
  br i1 %37, label %50, label %38

38:                                               ; preds = %34
  %39 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 33
  br i1 %41, label %50, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 44
  br i1 %45, label %50, label %46

46:                                               ; preds = %42
  %47 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 43
  br i1 %49, label %50, label %84

50:                                               ; preds = %46, %42, %38, %34, %30, %26, %19
  %51 = call ptr @malloc(i64 noundef 16) #11
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds %struct.AstNode, ptr %52, i32 0, i32 6
  store ptr %51, ptr %53, align 8
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %struct.AstNode, ptr %54, i32 0, i32 6
  %56 = load ptr, ptr %55, align 8
  %57 = icmp ne ptr %56, null
  br i1 %57, label %59, label %58

58:                                               ; preds = %50
  call void @handleError(i32 noundef 99) #12
  unreachable

59:                                               ; preds = %50
  %60 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = call i32 @getTypeMask(i32 noundef %61)
  %63 = trunc i32 %62 to i8
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds %struct.AstNode, ptr %64, i32 0, i32 6
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds %struct.Symbol, ptr %66, i32 0, i32 3
  store i8 %63, ptr %67, align 2
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds %struct.AstNode, ptr %68, i32 0, i32 6
  %70 = load ptr, ptr %69, align 8
  %71 = getelementptr inbounds %struct.Symbol, ptr %70, i32 0, i32 0
  store i32 2, ptr %71, align 8
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds %struct.AstNode, ptr %72, i32 0, i32 6
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.Symbol, ptr %74, i32 0, i32 2
  store i8 1, ptr %75, align 1
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.AstNode, ptr %76, i32 0, i32 6
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.Symbol, ptr %78, i32 0, i32 1
  store i8 1, ptr %79, align 4
  %80 = load ptr, ptr %5, align 8
  %81 = getelementptr inbounds %struct.AstNode, ptr %80, i32 0, i32 6
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.Symbol, ptr %82, i32 0, i32 4
  store ptr null, ptr %83, align 8
  br label %119

84:                                               ; preds = %46
  %85 = load ptr, ptr %5, align 8
  %86 = getelementptr inbounds %struct.AstNode, ptr %85, i32 0, i32 4
  %87 = getelementptr inbounds %struct.Token, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = icmp eq i32 %88, 47
  br i1 %89, label %90, label %118

90:                                               ; preds = %84
  %91 = load i8, ptr %3, align 1
  %92 = trunc i8 %91 to i1
  br i1 %92, label %93, label %118

93:                                               ; preds = %90
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds %struct.AstNode, ptr %94, i32 0, i32 4
  %96 = getelementptr inbounds %struct.Token, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %97)
  %99 = load ptr, ptr %5, align 8
  %100 = getelementptr inbounds %struct.AstNode, ptr %99, i32 0, i32 6
  store ptr %98, ptr %100, align 8
  %101 = icmp eq ptr %98, null
  br i1 %101, label %102, label %117

102:                                              ; preds = %93
  %103 = load ptr, ptr %5, align 8
  %104 = getelementptr inbounds %struct.AstNode, ptr %103, i32 0, i32 4
  %105 = getelementptr inbounds %struct.Token, ptr %104, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.AstNode, ptr %107, i32 0, i32 6
  %109 = call i32 @lookupSetter(ptr noundef @semStack, ptr noundef %106, ptr noundef %108)
  %110 = icmp eq i32 %109, 3
  br i1 %110, label %111, label %117

111:                                              ; preds = %102
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds %struct.AstNode, ptr %112, i32 0, i32 4
  %114 = getelementptr inbounds %struct.Token, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = load ptr, ptr %5, align 8
  call void @regCall(ptr noundef %115, i32 noundef -1, ptr noundef %116)
  br label %117

117:                                              ; preds = %111, %102, %93
  br label %118

118:                                              ; preds = %117, %90, %84
  br label %119

119:                                              ; preds = %118, %59
  %120 = load ptr, ptr %5, align 8
  %121 = load ptr, ptr %4, align 8
  call void @addAstNode(ptr noundef %120, ptr noundef %121)
  %122 = load i8, ptr %3, align 1
  %123 = trunc i8 %122 to i1
  br i1 %123, label %161, label %124

124:                                              ; preds = %119
  store ptr null, ptr %9, align 8
  %125 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 1
  %126 = load ptr, ptr %125, align 8
  %127 = icmp ne ptr %126, null
  br i1 %127, label %128, label %144

128:                                              ; preds = %124
  %129 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 1
  %130 = load ptr, ptr %129, align 8
  %131 = call i64 @strlen(ptr noundef %130) #14
  %132 = add i64 %131, 1
  %133 = call ptr @malloc(i64 noundef %132) #11
  store ptr %133, ptr %9, align 8
  %134 = load ptr, ptr %9, align 8
  %135 = icmp ne ptr %134, null
  br i1 %135, label %137, label %136

136:                                              ; preds = %128
  call void @handleError(i32 noundef 99) #12
  unreachable

137:                                              ; preds = %128
  %138 = load ptr, ptr %9, align 8
  %139 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 1
  %140 = load ptr, ptr %139, align 8
  %141 = load ptr, ptr %9, align 8
  %142 = call i64 @llvm.objectsize.i64.p0(ptr %141, i1 false, i1 true, i1 false)
  %143 = call ptr @__strcpy_chk(ptr noundef %138, ptr noundef %140, i64 noundef %142) #14
  br label %144

144:                                              ; preds = %137, %124
  %145 = load ptr, ptr @pendingParams, align 8
  %146 = load i32, ptr @pendingParamCount, align 4
  %147 = add nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = mul i64 8, %148
  %150 = call ptr @realloc(ptr noundef %145, i64 noundef %149) #13
  store ptr %150, ptr @pendingParams, align 8
  %151 = load ptr, ptr @pendingParams, align 8
  %152 = icmp ne ptr %151, null
  br i1 %152, label %154, label %153

153:                                              ; preds = %144
  call void @handleError(i32 noundef 99) #12
  unreachable

154:                                              ; preds = %144
  %155 = load ptr, ptr %9, align 8
  %156 = load ptr, ptr @pendingParams, align 8
  %157 = load i32, ptr @pendingParamCount, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, ptr @pendingParamCount, align 4
  %159 = sext i32 %157 to i64
  %160 = getelementptr inbounds ptr, ptr %156, i64 %159
  store ptr %155, ptr %160, align 8
  br label %161

161:                                              ; preds = %154, %119
  store i8 0, ptr %7, align 1
  br label %185

162:                                              ; preds = %15
  %163 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %164 = load i32, ptr %163, align 8
  %165 = icmp eq i32 %164, 13
  br i1 %165, label %166, label %171

166:                                              ; preds = %162
  %167 = load i8, ptr %7, align 1
  %168 = trunc i8 %167 to i1
  br i1 %168, label %171, label %169

169:                                              ; preds = %166
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %6, i64 40, i1 false)
  call void @storeToken(ptr noundef %10)
  %170 = load ptr, ptr %4, align 8
  store ptr %170, ptr %2, align 8
  br label %202

171:                                              ; preds = %166, %162
  %172 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %173 = load i32, ptr %172, align 8
  %174 = icmp eq i32 %173, 13
  br i1 %174, label %175, label %180

175:                                              ; preds = %171
  %176 = load i8, ptr @__debug, align 1
  %177 = trunc i8 %176 to i1
  br i1 %177, label %178, label %179

178:                                              ; preds = %175
  call void @printDebug(ptr noundef @.str.76.304)
  br label %179

179:                                              ; preds = %178, %175
  call void @handleError(i32 noundef 2) #12
  unreachable

180:                                              ; preds = %171
  %181 = load i8, ptr @__debug, align 1
  %182 = trunc i8 %181 to i1
  br i1 %182, label %183, label %184

183:                                              ; preds = %180
  call void @printDebug(ptr noundef @.str.77.305)
  br label %184

184:                                              ; preds = %183, %180
  call void @handleError(i32 noundef 2) #12
  unreachable

185:                                              ; preds = %161
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %11, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %11, i64 40, i1 false)
  %186 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %187 = load i32, ptr %186, align 8
  %188 = icmp eq i32 %187, 21
  br i1 %188, label %189, label %190

189:                                              ; preds = %185
  call void @tokenDeInit(ptr noundef %6)
  store i8 1, ptr %7, align 1
  br label %201

190:                                              ; preds = %185
  %191 = getelementptr inbounds %struct.Token, ptr %6, i32 0, i32 0
  %192 = load i32, ptr %191, align 8
  %193 = icmp eq i32 %192, 13
  br i1 %193, label %194, label %196

194:                                              ; preds = %190
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %6, i64 40, i1 false)
  call void @storeToken(ptr noundef %12)
  %195 = load ptr, ptr %4, align 8
  store ptr %195, ptr %2, align 8
  br label %202

196:                                              ; preds = %190
  %197 = load i8, ptr @__debug, align 1
  %198 = trunc i8 %197 to i1
  br i1 %198, label %199, label %200

199:                                              ; preds = %196
  call void @printDebug(ptr noundef @.str.78.306)
  br label %200

200:                                              ; preds = %199, %196
  call void @handleError(i32 noundef 2) #12
  unreachable

201:                                              ; preds = %189
  br label %15

202:                                              ; preds = %194, %169
  %203 = load ptr, ptr %2, align 8
  ret ptr %203
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseDefVar() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.Token, align 8
  %6 = alloca %struct.Token, align 8
  %7 = alloca %struct.Token, align 8
  %8 = call ptr @createAstNode(i32 noundef 9)
  store ptr %8, ptr %2, align 8
  call void @throwToken(i32 noundef 2)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 1)
  %9 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp ne i32 %10, 47
  br i1 %11, label %12, label %17

12:                                               ; preds = %0
  %13 = load i8, ptr @__debug, align 1
  %14 = trunc i8 %13 to i1
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @printDebug(ptr noundef @.str.53.332)
  br label %16

16:                                               ; preds = %15, %12
  call void @handleError(i32 noundef 2) #12
  unreachable

17:                                               ; preds = %0
  %18 = call ptr @createAstNode(i32 noundef 0)
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.AstNode, ptr %19, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %20, ptr align 8 %3, i64 40, i1 false)
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %2, align 8
  call void @addAstNode(ptr noundef %21, ptr noundef %22)
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.AstNode, ptr %23, i32 0, i32 6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %3, i64 40, i1 false)
  call void @semVar(ptr noundef %5, i1 noundef zeroext false, ptr noundef %24)
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.AstNode, ptr %25, i32 0, i32 4
  %27 = getelementptr inbounds %struct.Token, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %28)
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AstNode, ptr %30, i32 0, i32 6
  store ptr %29, ptr %31, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %6, i32 noundef 2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %6, i64 40, i1 false)
  %32 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp ne i32 %33, 27
  br i1 %34, label %35, label %37

35:                                               ; preds = %17
  store i32 0, ptr @eolAllowance, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %3, i64 40, i1 false)
  call void @storeToken(ptr noundef %7)
  %36 = load ptr, ptr %2, align 8
  store ptr %36, ptr %1, align 8
  br label %41

37:                                               ; preds = %17
  call void @tokenDeInit(ptr noundef %3)
  %38 = call ptr @parseExpr(i1 noundef zeroext false)
  %39 = load ptr, ptr %2, align 8
  call void @addAstNode(ptr noundef %38, ptr noundef %39)
  %40 = load ptr, ptr %2, align 8
  store ptr %40, ptr %1, align 8
  br label %41

41:                                               ; preds = %37, %35
  %42 = load ptr, ptr %1, align 8
  ret ptr %42
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseAssignment() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca %struct.Token, align 8
  %6 = call ptr @createAstNode(i32 noundef 12)
  store ptr %6, ptr %1, align 8
  %7 = call ptr @createAstNode(i32 noundef 0)
  store ptr %7, ptr %2, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 2)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.AstNode, ptr %8, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %3, i64 40, i1 false)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AstNode, ptr %10, i32 0, i32 4
  %12 = getelementptr inbounds %struct.Token, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.AstNode, ptr %15, i32 0, i32 6
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.AstNode, ptr %17, i32 0, i32 6
  %19 = load ptr, ptr %18, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %28

21:                                               ; preds = %0
  %22 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  %24 = icmp ne i32 %23, 49
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  %26 = load ptr, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %3, i64 40, i1 false)
  call void @semCheckVar(ptr noundef %4, i1 noundef zeroext true, ptr noundef %26)
  br label %27

27:                                               ; preds = %25, %21
  br label %28

28:                                               ; preds = %27, %0
  %29 = load ptr, ptr %2, align 8
  %30 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %29, ptr noundef %30)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %5, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %5, i64 40, i1 false)
  %31 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = icmp ne i32 %32, 27
  br i1 %33, label %34, label %35

34:                                               ; preds = %28
  call void @tokenDeInit(ptr noundef %3)
  call void @printDebug(ptr noundef @.str.74.331)
  call void @handleError(i32 noundef 2) #12
  unreachable

35:                                               ; preds = %28
  call void @tokenDeInit(ptr noundef %3)
  %36 = call ptr @parseExpr(i1 noundef zeroext false)
  %37 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %36, ptr noundef %37)
  %38 = load ptr, ptr %1, align 8
  ret ptr %38
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseIfStatement() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = call ptr @createAstNode(i32 noundef 13)
  store ptr %4, ptr %1, align 8
  br label %5

5:                                                ; preds = %13, %0
  %6 = call ptr @parseIfBranch()
  %7 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %6, ptr noundef %7)
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %8 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp ne i32 %9, 32
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = load ptr, ptr %1, align 8
  ret ptr %12

13:                                               ; preds = %5
  call void @throwToken(i32 noundef 2)
  br label %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseWhile() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = call ptr @createAstNode(i32 noundef 16)
  store ptr %4, ptr %1, align 8
  call void @throwToken(i32 noundef 1)
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %5 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp ne i32 %6, 12
  br i1 %7, label %8, label %13

8:                                                ; preds = %0
  %9 = load i8, ptr @__debug, align 1
  %10 = trunc i8 %9 to i1
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  call void @printDebug(ptr noundef @.str.75.330)
  br label %12

12:                                               ; preds = %11, %8
  call void @handleError(i32 noundef 2) #12
  unreachable

13:                                               ; preds = %0
  %14 = call ptr @parseExpr(i1 noundef zeroext true)
  %15 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %14, ptr noundef %15)
  call void @tokenDeInit(ptr noundef %2)
  store i32 2, ptr @eolAllowance, align 4
  %16 = call ptr @parseBlock(i1 noundef zeroext true)
  %17 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %16, ptr noundef %17)
  %18 = load ptr, ptr %1, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseReturn() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = call ptr @createAstNode(i32 noundef 17)
  store ptr %4, ptr %1, align 8
  call void @throwToken(i32 noundef 2)
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %2, i64 40, i1 false)
  %5 = call zeroext i1 @isExpr(ptr noundef %3)
  br i1 %5, label %6, label %9

6:                                                ; preds = %0
  %7 = call ptr @parseExpr(i1 noundef zeroext false)
  %8 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %7, ptr noundef %8)
  br label %9

9:                                                ; preds = %6, %0
  store i32 1, ptr @eolAllowance, align 4
  %10 = load ptr, ptr %1, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseExpr(i1 noundef zeroext %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca %struct.Token, align 8
  %12 = alloca %struct.Token, align 8
  %13 = alloca %struct.Token, align 8
  %14 = alloca %struct.Token, align 8
  %15 = alloca %struct.Token, align 8
  %16 = alloca %struct.Token, align 8
  %17 = alloca %struct.Token, align 8
  %18 = alloca %struct.Token, align 8
  %19 = alloca %struct.Token, align 8
  %20 = alloca %struct.Token, align 8
  %21 = alloca %struct.Token, align 8
  %22 = alloca %struct.Token, align 8
  %23 = alloca %struct.Token, align 8
  %24 = alloca %struct.Token, align 8
  %25 = alloca %struct.Token, align 8
  %26 = zext i1 %0 to i8
  store i8 %26, ptr %2, align 1
  call void @push(ptr noundef @stack, ptr noundef @sentinelNode)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3, i32 noundef 1)
  store i8 1, ptr %9, align 1
  br label %27

27:                                               ; preds = %272, %1
  %28 = load i8, ptr %9, align 1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %33, label %30

30:                                               ; preds = %27
  %31 = load i64, ptr getelementptr inbounds (%struct.AstNodeStack, ptr @stack, i32 0, i32 1), align 8
  %32 = icmp ne i64 %31, 2
  br label %33

33:                                               ; preds = %30, %27
  %34 = phi i1 [ true, %27 ], [ %32, %30 ]
  br i1 %34, label %35, label %273

35:                                               ; preds = %33
  %36 = call ptr @createAstNode(i32 noundef 11)
  store ptr %36, ptr %6, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.AstNode, ptr %37, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %38, ptr align 8 %3, i64 40, i1 false)
  %39 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 46
  br i1 %41, label %66, label %42

42:                                               ; preds = %35
  %43 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 48
  br i1 %45, label %66, label %46

46:                                               ; preds = %42
  %47 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 50
  br i1 %49, label %66, label %50

50:                                               ; preds = %46
  %51 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  %53 = icmp eq i32 %52, 34
  br i1 %53, label %66, label %54

54:                                               ; preds = %50
  %55 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %56 = load i32, ptr %55, align 8
  %57 = icmp eq i32 %56, 33
  br i1 %57, label %66, label %58

58:                                               ; preds = %54
  %59 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = icmp eq i32 %60, 44
  br i1 %61, label %66, label %62

62:                                               ; preds = %58
  %63 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 43
  br i1 %65, label %66, label %100

66:                                               ; preds = %62, %58, %54, %50, %46, %42, %35
  %67 = call ptr @malloc(i64 noundef 16) #11
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.AstNode, ptr %68, i32 0, i32 6
  store ptr %67, ptr %69, align 8
  %70 = load ptr, ptr %6, align 8
  %71 = getelementptr inbounds %struct.AstNode, ptr %70, i32 0, i32 6
  %72 = load ptr, ptr %71, align 8
  %73 = icmp ne ptr %72, null
  br i1 %73, label %75, label %74

74:                                               ; preds = %66
  call void @handleError(i32 noundef 99) #12
  unreachable

75:                                               ; preds = %66
  %76 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = call i32 @getTypeMask(i32 noundef %77)
  %79 = trunc i32 %78 to i8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.AstNode, ptr %80, i32 0, i32 6
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.Symbol, ptr %82, i32 0, i32 3
  store i8 %79, ptr %83, align 2
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.AstNode, ptr %84, i32 0, i32 6
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.Symbol, ptr %86, i32 0, i32 0
  store i32 2, ptr %87, align 8
  %88 = load ptr, ptr %6, align 8
  %89 = getelementptr inbounds %struct.AstNode, ptr %88, i32 0, i32 6
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds %struct.Symbol, ptr %90, i32 0, i32 1
  store i8 1, ptr %91, align 4
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr inbounds %struct.AstNode, ptr %92, i32 0, i32 6
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds %struct.Symbol, ptr %94, i32 0, i32 2
  store i8 1, ptr %95, align 1
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %struct.AstNode, ptr %96, i32 0, i32 6
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds %struct.Symbol, ptr %98, i32 0, i32 4
  store ptr null, ptr %99, align 8
  br label %100

100:                                              ; preds = %75, %62
  call void @top(ptr noundef @stack, ptr noundef %5)
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds %struct.AstNode, ptr %101, i32 0, i32 3
  %103 = load i32, ptr %102, align 4
  %104 = icmp eq i32 %103, 10
  br i1 %104, label %105, label %107

105:                                              ; preds = %100
  call void @pop(ptr noundef @stack, ptr noundef %7)
  call void @top(ptr noundef @stack, ptr noundef %5)
  %106 = load ptr, ptr %7, align 8
  call void @push(ptr noundef @stack, ptr noundef %106)
  br label %107

107:                                              ; preds = %105, %100
  %108 = load i8, ptr @__debug, align 1
  %109 = trunc i8 %108 to i1
  br i1 %109, label %110, label %111

110:                                              ; preds = %107
  call void @printStack(ptr noundef @stack)
  br label %111

111:                                              ; preds = %110, %107
  %112 = load i8, ptr @__debug, align 1
  %113 = trunc i8 %112 to i1
  br i1 %113, label %114, label %124

114:                                              ; preds = %111
  %115 = load ptr, ptr %5, align 8
  %116 = getelementptr inbounds %struct.AstNode, ptr %115, i32 0, i32 4
  %117 = getelementptr inbounds %struct.Token, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 8
  %119 = call i32 @typeToTableId(i32 noundef %118)
  %120 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = call i32 @typeToTableId(i32 noundef %121)
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.54.309, i32 noundef %119, i32 noundef %122)
  br label %124

124:                                              ; preds = %114, %111
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds %struct.AstNode, ptr %125, i32 0, i32 4
  %127 = getelementptr inbounds %struct.Token, ptr %126, i32 0, i32 0
  %128 = load i32, ptr %127, align 8
  %129 = call i32 @typeToTableId(i32 noundef %128)
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [15 x [15 x i8]], ptr @precedenceTable, i64 0, i64 %130
  %132 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %133 = load i32, ptr %132, align 8
  %134 = call i32 @typeToTableId(i32 noundef %133)
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [15 x i8], ptr %131, i64 0, i64 %135
  %137 = load i8, ptr %136, align 1
  store i8 %137, ptr %10, align 1
  %138 = load i8, ptr @__debug, align 1
  %139 = trunc i8 %138 to i1
  br i1 %139, label %140, label %144

140:                                              ; preds = %124
  %141 = load i8, ptr %10, align 1
  %142 = sext i8 %141 to i32
  %143 = call i32 (ptr, ...) @printf(ptr noundef @.str.55.310, i32 noundef %142)
  br label %144

144:                                              ; preds = %140, %124
  %145 = load i8, ptr %10, align 1
  %146 = sext i8 %145 to i32
  switch i32 %146, label %235 [
    i32 61, label %147
    i32 60, label %183
    i32 62, label %234
  ]

147:                                              ; preds = %144
  %148 = load ptr, ptr %6, align 8
  call void @push(ptr noundef @stack, ptr noundef %148)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %11, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %11, i64 40, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %3, i64 40, i1 false)
  %149 = call zeroext i1 @isExpr(ptr noundef %12)
  br i1 %149, label %150, label %157

150:                                              ; preds = %147
  %151 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 4
  %152 = load i32, ptr %151, align 8
  %153 = load i32, ptr @prevLine, align 4
  %154 = icmp ne i32 %152, %153
  br i1 %154, label %155, label %157

155:                                              ; preds = %150
  store i8 0, ptr %9, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %3, i64 40, i1 false)
  call void @storeToken(ptr noundef %13)
  store i32 0, ptr @eolAllowance, align 4
  %156 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  store i32 4, ptr %156, align 8
  br label %182

157:                                              ; preds = %150, %147
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %3, i64 40, i1 false)
  %158 = call zeroext i1 @isExpr(ptr noundef %14)
  br i1 %158, label %181, label %159

159:                                              ; preds = %157
  %160 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 4
  %161 = load i32, ptr %160, align 8
  %162 = load i32, ptr @prevLine, align 4
  %163 = icmp eq i32 %161, %162
  br i1 %163, label %164, label %181

164:                                              ; preds = %159
  %165 = load i8, ptr %2, align 1
  %166 = trunc i8 %165 to i1
  br i1 %166, label %167, label %168

167:                                              ; preds = %164
  store i8 0, ptr %2, align 1
  br label %180

168:                                              ; preds = %164
  %169 = load i8, ptr @__debug, align 1
  %170 = trunc i8 %169 to i1
  br i1 %170, label %171, label %175

171:                                              ; preds = %168
  %172 = load i64, ptr getelementptr inbounds (%struct.AstNodeStack, ptr @stack, i32 0, i32 1), align 8
  %173 = trunc i64 %172 to i32
  %174 = call i32 (ptr, ...) @printf(ptr noundef @.str.56.311, i32 noundef %173)
  br label %175

175:                                              ; preds = %171, %168
  %176 = load i8, ptr @__debug, align 1
  %177 = trunc i8 %176 to i1
  br i1 %177, label %178, label %179

178:                                              ; preds = %175
  call void @printStack(ptr noundef @stack)
  br label %179

179:                                              ; preds = %178, %175
  call void @printDebug(ptr noundef @.str.57.312)
  call void @handleError(i32 noundef 2) #12
  unreachable

180:                                              ; preds = %167
  br label %181

181:                                              ; preds = %180, %159, %157
  br label %182

182:                                              ; preds = %181, %155
  br label %265

183:                                              ; preds = %144
  %184 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %185 = load i32, ptr %184, align 8
  %186 = call zeroext i1 @isBinaryOp(i32 noundef %185)
  br i1 %186, label %187, label %190

187:                                              ; preds = %183
  call void @pop(ptr noundef @stack, ptr noundef %7)
  call void @push(ptr noundef @stack, ptr noundef @precedenceOpenNode)
  %188 = load ptr, ptr %7, align 8
  call void @push(ptr noundef @stack, ptr noundef %188)
  %189 = load ptr, ptr %6, align 8
  call void @push(ptr noundef @stack, ptr noundef %189)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %15, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %15, i64 40, i1 false)
  br label %233

190:                                              ; preds = %183
  %191 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %192 = load i32, ptr %191, align 8
  %193 = icmp eq i32 %192, 28
  br i1 %193, label %194, label %195

194:                                              ; preds = %190
  call void @tokenDeInit(ptr noundef %3)
  call void @parseBuiltInFunc(ptr dead_on_unwind writable sret(%struct.Token) align 8 %16)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %16, i64 40, i1 false)
  br label %195

195:                                              ; preds = %194, %190
  %196 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  %197 = load i32, ptr %196, align 8
  %198 = icmp eq i32 %197, 47
  br i1 %198, label %199, label %213

199:                                              ; preds = %195
  %200 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %201 = load ptr, ptr %200, align 8
  %202 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %201)
  %203 = load ptr, ptr %6, align 8
  %204 = getelementptr inbounds %struct.AstNode, ptr %203, i32 0, i32 6
  store ptr %202, ptr %204, align 8
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %17)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %17, i64 40, i1 false)
  %205 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 0
  %206 = load i32, ptr %205, align 8
  %207 = icmp eq i32 %206, 12
  br i1 %207, label %208, label %210

208:                                              ; preds = %199
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %18, ptr align 8 %3, i64 40, i1 false)
  %209 = call ptr @parseFunCall(ptr noundef %18)
  store ptr %209, ptr %6, align 8
  br label %212

210:                                              ; preds = %199
  %211 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %19, ptr align 8 %3, i64 40, i1 false)
  call void @semCheckVar(ptr noundef %19, i1 noundef zeroext false, ptr noundef %211)
  br label %212

212:                                              ; preds = %210, %208
  br label %213

213:                                              ; preds = %212, %195
  call void @push(ptr noundef @stack, ptr noundef @precedenceOpenNode)
  %214 = load ptr, ptr %6, align 8
  call void @push(ptr noundef @stack, ptr noundef %214)
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %20, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %20, i64 40, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %21, ptr align 8 %3, i64 40, i1 false)
  %215 = call zeroext i1 @isExpr(ptr noundef %21)
  br i1 %215, label %216, label %223

216:                                              ; preds = %213
  %217 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 4
  %218 = load i32, ptr %217, align 8
  %219 = load i32, ptr @prevLine, align 4
  %220 = icmp ne i32 %218, %219
  br i1 %220, label %221, label %223

221:                                              ; preds = %216
  store i8 0, ptr %9, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %22, ptr align 8 %3, i64 40, i1 false)
  call void @storeToken(ptr noundef %22)
  store i32 0, ptr @eolAllowance, align 4
  %222 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  store i32 4, ptr %222, align 8
  br label %232

223:                                              ; preds = %216, %213
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %3, i64 40, i1 false)
  %224 = call zeroext i1 @isExpr(ptr noundef %23)
  br i1 %224, label %231, label %225

225:                                              ; preds = %223
  %226 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 4
  %227 = load i32, ptr %226, align 8
  %228 = load i32, ptr @prevLine, align 4
  %229 = icmp eq i32 %227, %228
  br i1 %229, label %230, label %231

230:                                              ; preds = %225
  call void @printDebug(ptr noundef @.str.58.313)
  call void @handleError(i32 noundef 2) #12
  unreachable

231:                                              ; preds = %225, %223
  br label %232

232:                                              ; preds = %231, %221
  br label %233

233:                                              ; preds = %232, %187
  br label %265

234:                                              ; preds = %144
  call void @reduce()
  br label %265

235:                                              ; preds = %144
  %236 = load i8, ptr @__debug, align 1
  %237 = trunc i8 %236 to i1
  br i1 %237, label %238, label %242

238:                                              ; preds = %235
  %239 = load i64, ptr getelementptr inbounds (%struct.AstNodeStack, ptr @stack, i32 0, i32 1), align 8
  %240 = trunc i64 %239 to i32
  %241 = call i32 (ptr, ...) @printf(ptr noundef @.str.59.314, i32 noundef %240)
  br label %242

242:                                              ; preds = %238, %235
  %243 = load i8, ptr @__debug, align 1
  %244 = trunc i8 %243 to i1
  br i1 %244, label %245, label %246

245:                                              ; preds = %242
  call void @printStack(ptr noundef @stack)
  br label %246

246:                                              ; preds = %245, %242
  %247 = load i8, ptr @__debug, align 1
  %248 = trunc i8 %247 to i1
  br i1 %248, label %249, label %253

249:                                              ; preds = %246
  %250 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %251 = load ptr, ptr %250, align 8
  %252 = call i32 (ptr, ...) @printf(ptr noundef @.str.60.315, ptr noundef %251)
  br label %253

253:                                              ; preds = %249, %246
  %254 = load i8, ptr @__debug, align 1
  %255 = trunc i8 %254 to i1
  br i1 %255, label %256, label %260

256:                                              ; preds = %253
  %257 = load i8, ptr %10, align 1
  %258 = sext i8 %257 to i32
  %259 = call i32 (ptr, ...) @printf(ptr noundef @.str.61.316, i32 noundef %258)
  br label %260

260:                                              ; preds = %256, %253
  %261 = load i8, ptr @__debug, align 1
  %262 = trunc i8 %261 to i1
  br i1 %262, label %263, label %264

263:                                              ; preds = %260
  call void @printDebug(ptr noundef @.str.62.317)
  br label %264

264:                                              ; preds = %263, %260
  call void @handleError(i32 noundef 2) #12
  unreachable

265:                                              ; preds = %234, %233, %182
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %3, i64 40, i1 false)
  %266 = call zeroext i1 @isExpr(ptr noundef %24)
  br i1 %266, label %272, label %267

267:                                              ; preds = %265
  %268 = load i8, ptr %9, align 1
  %269 = trunc i8 %268 to i1
  br i1 %269, label %270, label %272

270:                                              ; preds = %267
  store i8 0, ptr %9, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %25, ptr align 8 %3, i64 40, i1 false)
  call void @storeToken(ptr noundef %25)
  store i32 0, ptr @eolAllowance, align 4
  %271 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 0
  store i32 4, ptr %271, align 8
  br label %272

272:                                              ; preds = %270, %267, %265
  br label %27

273:                                              ; preds = %33
  %274 = load i64, ptr getelementptr inbounds (%struct.AstNodeStack, ptr @stack, i32 0, i32 1), align 8
  %275 = icmp eq i64 %274, 2
  br i1 %275, label %276, label %292

276:                                              ; preds = %273
  %277 = load ptr, ptr @stack, align 8
  %278 = getelementptr inbounds ptr, ptr %277, i64 0
  %279 = load ptr, ptr %278, align 8
  %280 = icmp eq ptr %279, @sentinelNode
  br i1 %280, label %281, label %292

281:                                              ; preds = %276
  %282 = load ptr, ptr @stack, align 8
  %283 = getelementptr inbounds ptr, ptr %282, i64 1
  %284 = load ptr, ptr %283, align 8
  %285 = getelementptr inbounds %struct.AstNode, ptr %284, i32 0, i32 3
  %286 = load i32, ptr %285, align 4
  %287 = icmp eq i32 %286, 10
  br i1 %287, label %288, label %292

288:                                              ; preds = %281
  %289 = load ptr, ptr @stack, align 8
  %290 = getelementptr inbounds ptr, ptr %289, i64 1
  %291 = load ptr, ptr %290, align 8
  store ptr %291, ptr %8, align 8
  br label %297

292:                                              ; preds = %281, %276, %273
  %293 = load i8, ptr @__debug, align 1
  %294 = trunc i8 %293 to i1
  br i1 %294, label %295, label %296

295:                                              ; preds = %292
  call void @printDebug(ptr noundef @.str.63.318)
  br label %296

296:                                              ; preds = %295, %292
  call void @handleError(i32 noundef 2) #12
  unreachable

297:                                              ; preds = %288
  call void @emptyStack(ptr noundef @stack)
  %298 = load ptr, ptr %8, align 8
  ret ptr %298
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @printStack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AstNodeStack, ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = sub i64 %6, 1
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %3, align 4
  br label %9

9:                                                ; preds = %25, %1
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.AstNodeStack, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.AstNode, ptr %20, i32 0, i32 4
  %22 = getelementptr inbounds %struct.Token, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.33.329, i32 noundef %13, i32 noundef %23)
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %3, align 4
  br label %9

28:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseFunCall(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %8 = call ptr @createAstNode(i32 noundef 18)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.AstNode, ptr %9, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %0, i64 40, i1 false)
  store i32 2, ptr @eolAllowance, align 4
  call void @throwToken(i32 noundef 1)
  %11 = call ptr @parseParamList(i1 noundef zeroext true)
  store ptr %11, ptr %4, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %3, align 8
  call void @addAstNode(ptr noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.AstNode, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 8
  store i32 %16, ptr %5, align 4
  store ptr null, ptr %6, align 8
  %17 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load i32, ptr %5, align 4
  %20 = call i32 @lookupFunction(ptr noundef @semStack, ptr noundef %18, i32 noundef %19, ptr noundef %6)
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %336

23:                                               ; preds = %1
  %24 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = call zeroext i1 @isBuiltInFunc(ptr noundef %25)
  br i1 %26, label %27, label %336

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 @strcmp(ptr noundef %29, ptr noundef @.str.64.319) #14
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %61

32:                                               ; preds = %27
  %33 = load i32, ptr %5, align 4
  %34 = icmp ne i32 %33, 1
  br i1 %34, label %59, label %35

35:                                               ; preds = %32
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.AstNode, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds ptr, ptr %38, i64 0
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.AstNode, ptr %40, i32 0, i32 6
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.Symbol, ptr %42, i32 0, i32 3
  %44 = load i8, ptr %43, align 2
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %60, label %47

47:                                               ; preds = %35
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.AstNode, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds ptr, ptr %50, i64 0
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds %struct.AstNode, ptr %52, i32 0, i32 6
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr inbounds %struct.Symbol, ptr %54, i32 0, i32 3
  %56 = load i8, ptr %55, align 2
  %57 = zext i8 %56 to i32
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %60, label %59

59:                                               ; preds = %47, %32
  call void @printDebug(ptr noundef @.str.64.319)
  call void @handleError(i32 noundef 5) #12
  unreachable

60:                                               ; preds = %47, %35
  br label %61

61:                                               ; preds = %60, %27
  %62 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = call i32 @strcmp(ptr noundef %63, ptr noundef @.str.65.320) #14
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %95

66:                                               ; preds = %61
  %67 = load i32, ptr %5, align 4
  %68 = icmp ne i32 %67, 1
  br i1 %68, label %93, label %69

69:                                               ; preds = %66
  %70 = load ptr, ptr %4, align 8
  %71 = getelementptr inbounds %struct.AstNode, ptr %70, i32 0, i32 1
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr inbounds ptr, ptr %72, i64 0
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.AstNode, ptr %74, i32 0, i32 6
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds %struct.Symbol, ptr %76, i32 0, i32 3
  %78 = load i8, ptr %77, align 2
  %79 = zext i8 %78 to i32
  %80 = icmp eq i32 %79, 2
  br i1 %80, label %94, label %81

81:                                               ; preds = %69
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.AstNode, ptr %82, i32 0, i32 1
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds ptr, ptr %84, i64 0
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.AstNode, ptr %86, i32 0, i32 6
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds %struct.Symbol, ptr %88, i32 0, i32 3
  %90 = load i8, ptr %89, align 2
  %91 = zext i8 %90 to i32
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %94, label %93

93:                                               ; preds = %81, %66
  call void @handleError(i32 noundef 5) #12
  unreachable

94:                                               ; preds = %81, %69
  br label %95

95:                                               ; preds = %94, %61
  %96 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = call i32 @strcmp(ptr noundef %97, ptr noundef @.str.66.321) #14
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %180

100:                                              ; preds = %95
  %101 = load i32, ptr %5, align 4
  %102 = icmp ne i32 %101, 3
  br i1 %102, label %103, label %104

103:                                              ; preds = %100
  call void @handleError(i32 noundef 5) #12
  unreachable

104:                                              ; preds = %100
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.AstNode, ptr %105, i32 0, i32 1
  %107 = load ptr, ptr %106, align 8
  %108 = getelementptr inbounds ptr, ptr %107, i64 0
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds %struct.AstNode, ptr %109, i32 0, i32 6
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.Symbol, ptr %111, i32 0, i32 3
  %113 = load i8, ptr %112, align 2
  %114 = zext i8 %113 to i32
  %115 = icmp eq i32 %114, 2
  br i1 %115, label %129, label %116

116:                                              ; preds = %104
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.AstNode, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = getelementptr inbounds ptr, ptr %119, i64 0
  %121 = load ptr, ptr %120, align 8
  %122 = getelementptr inbounds %struct.AstNode, ptr %121, i32 0, i32 6
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds %struct.Symbol, ptr %123, i32 0, i32 3
  %125 = load i8, ptr %124, align 2
  %126 = zext i8 %125 to i32
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %129, label %128

128:                                              ; preds = %116
  call void @handleError(i32 noundef 5) #12
  unreachable

129:                                              ; preds = %116, %104
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds %struct.AstNode, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds ptr, ptr %132, i64 1
  %134 = load ptr, ptr %133, align 8
  %135 = getelementptr inbounds %struct.AstNode, ptr %134, i32 0, i32 6
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds %struct.Symbol, ptr %136, i32 0, i32 3
  %138 = load i8, ptr %137, align 2
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 1
  br i1 %140, label %154, label %141

141:                                              ; preds = %129
  %142 = load ptr, ptr %4, align 8
  %143 = getelementptr inbounds %struct.AstNode, ptr %142, i32 0, i32 1
  %144 = load ptr, ptr %143, align 8
  %145 = getelementptr inbounds ptr, ptr %144, i64 0
  %146 = load ptr, ptr %145, align 8
  %147 = getelementptr inbounds %struct.AstNode, ptr %146, i32 0, i32 6
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds %struct.Symbol, ptr %148, i32 0, i32 3
  %150 = load i8, ptr %149, align 2
  %151 = zext i8 %150 to i32
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %154, label %153

153:                                              ; preds = %141
  call void @handleError(i32 noundef 5) #12
  unreachable

154:                                              ; preds = %141, %129
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds %struct.AstNode, ptr %155, i32 0, i32 1
  %157 = load ptr, ptr %156, align 8
  %158 = getelementptr inbounds ptr, ptr %157, i64 2
  %159 = load ptr, ptr %158, align 8
  %160 = getelementptr inbounds %struct.AstNode, ptr %159, i32 0, i32 6
  %161 = load ptr, ptr %160, align 8
  %162 = getelementptr inbounds %struct.Symbol, ptr %161, i32 0, i32 3
  %163 = load i8, ptr %162, align 2
  %164 = zext i8 %163 to i32
  %165 = icmp eq i32 %164, 1
  br i1 %165, label %179, label %166

166:                                              ; preds = %154
  %167 = load ptr, ptr %4, align 8
  %168 = getelementptr inbounds %struct.AstNode, ptr %167, i32 0, i32 1
  %169 = load ptr, ptr %168, align 8
  %170 = getelementptr inbounds ptr, ptr %169, i64 0
  %171 = load ptr, ptr %170, align 8
  %172 = getelementptr inbounds %struct.AstNode, ptr %171, i32 0, i32 6
  %173 = load ptr, ptr %172, align 8
  %174 = getelementptr inbounds %struct.Symbol, ptr %173, i32 0, i32 3
  %175 = load i8, ptr %174, align 2
  %176 = zext i8 %175 to i32
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %179, label %178

178:                                              ; preds = %166
  call void @handleError(i32 noundef 5) #12
  unreachable

179:                                              ; preds = %166, %154
  br label %180

180:                                              ; preds = %179, %95
  %181 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %182 = load ptr, ptr %181, align 8
  %183 = call i32 @strcmp(ptr noundef %182, ptr noundef @.str.67.322) #14
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %240

185:                                              ; preds = %180
  %186 = load i32, ptr %5, align 4
  %187 = icmp ne i32 %186, 2
  br i1 %187, label %188, label %189

188:                                              ; preds = %185
  call void @handleError(i32 noundef 5) #12
  unreachable

189:                                              ; preds = %185
  %190 = load ptr, ptr %4, align 8
  %191 = getelementptr inbounds %struct.AstNode, ptr %190, i32 0, i32 1
  %192 = load ptr, ptr %191, align 8
  %193 = getelementptr inbounds ptr, ptr %192, i64 0
  %194 = load ptr, ptr %193, align 8
  %195 = getelementptr inbounds %struct.AstNode, ptr %194, i32 0, i32 6
  %196 = load ptr, ptr %195, align 8
  %197 = getelementptr inbounds %struct.Symbol, ptr %196, i32 0, i32 3
  %198 = load i8, ptr %197, align 2
  %199 = zext i8 %198 to i32
  %200 = icmp eq i32 %199, 2
  br i1 %200, label %214, label %201

201:                                              ; preds = %189
  %202 = load ptr, ptr %4, align 8
  %203 = getelementptr inbounds %struct.AstNode, ptr %202, i32 0, i32 1
  %204 = load ptr, ptr %203, align 8
  %205 = getelementptr inbounds ptr, ptr %204, i64 0
  %206 = load ptr, ptr %205, align 8
  %207 = getelementptr inbounds %struct.AstNode, ptr %206, i32 0, i32 6
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds %struct.Symbol, ptr %208, i32 0, i32 3
  %210 = load i8, ptr %209, align 2
  %211 = zext i8 %210 to i32
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %214, label %213

213:                                              ; preds = %201
  call void @handleError(i32 noundef 5) #12
  unreachable

214:                                              ; preds = %201, %189
  %215 = load ptr, ptr %4, align 8
  %216 = getelementptr inbounds %struct.AstNode, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  %218 = getelementptr inbounds ptr, ptr %217, i64 1
  %219 = load ptr, ptr %218, align 8
  %220 = getelementptr inbounds %struct.AstNode, ptr %219, i32 0, i32 6
  %221 = load ptr, ptr %220, align 8
  %222 = getelementptr inbounds %struct.Symbol, ptr %221, i32 0, i32 3
  %223 = load i8, ptr %222, align 2
  %224 = zext i8 %223 to i32
  %225 = icmp eq i32 %224, 2
  br i1 %225, label %239, label %226

226:                                              ; preds = %214
  %227 = load ptr, ptr %4, align 8
  %228 = getelementptr inbounds %struct.AstNode, ptr %227, i32 0, i32 1
  %229 = load ptr, ptr %228, align 8
  %230 = getelementptr inbounds ptr, ptr %229, i64 0
  %231 = load ptr, ptr %230, align 8
  %232 = getelementptr inbounds %struct.AstNode, ptr %231, i32 0, i32 6
  %233 = load ptr, ptr %232, align 8
  %234 = getelementptr inbounds %struct.Symbol, ptr %233, i32 0, i32 3
  %235 = load i8, ptr %234, align 2
  %236 = zext i8 %235 to i32
  %237 = icmp eq i32 %236, 0
  br i1 %237, label %239, label %238

238:                                              ; preds = %226
  call void @handleError(i32 noundef 5) #12
  unreachable

239:                                              ; preds = %226, %214
  br label %240

240:                                              ; preds = %239, %180
  %241 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %242 = load ptr, ptr %241, align 8
  %243 = call i32 @strcmp(ptr noundef %242, ptr noundef @.str.68.323) #14
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %245, label %300

245:                                              ; preds = %240
  %246 = load i32, ptr %5, align 4
  %247 = icmp ne i32 %246, 2
  br i1 %247, label %248, label %249

248:                                              ; preds = %245
  call void @handleError(i32 noundef 5) #12
  unreachable

249:                                              ; preds = %245
  %250 = load ptr, ptr %4, align 8
  %251 = getelementptr inbounds %struct.AstNode, ptr %250, i32 0, i32 1
  %252 = load ptr, ptr %251, align 8
  %253 = getelementptr inbounds ptr, ptr %252, i64 0
  %254 = load ptr, ptr %253, align 8
  %255 = getelementptr inbounds %struct.AstNode, ptr %254, i32 0, i32 6
  %256 = load ptr, ptr %255, align 8
  %257 = getelementptr inbounds %struct.Symbol, ptr %256, i32 0, i32 3
  %258 = load i8, ptr %257, align 2
  %259 = zext i8 %258 to i32
  %260 = icmp eq i32 %259, 2
  br i1 %260, label %274, label %261

261:                                              ; preds = %249
  %262 = load ptr, ptr %4, align 8
  %263 = getelementptr inbounds %struct.AstNode, ptr %262, i32 0, i32 1
  %264 = load ptr, ptr %263, align 8
  %265 = getelementptr inbounds ptr, ptr %264, i64 0
  %266 = load ptr, ptr %265, align 8
  %267 = getelementptr inbounds %struct.AstNode, ptr %266, i32 0, i32 6
  %268 = load ptr, ptr %267, align 8
  %269 = getelementptr inbounds %struct.Symbol, ptr %268, i32 0, i32 3
  %270 = load i8, ptr %269, align 2
  %271 = zext i8 %270 to i32
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %274, label %273

273:                                              ; preds = %261
  call void @handleError(i32 noundef 5) #12
  unreachable

274:                                              ; preds = %261, %249
  %275 = load ptr, ptr %4, align 8
  %276 = getelementptr inbounds %struct.AstNode, ptr %275, i32 0, i32 1
  %277 = load ptr, ptr %276, align 8
  %278 = getelementptr inbounds ptr, ptr %277, i64 1
  %279 = load ptr, ptr %278, align 8
  %280 = getelementptr inbounds %struct.AstNode, ptr %279, i32 0, i32 6
  %281 = load ptr, ptr %280, align 8
  %282 = getelementptr inbounds %struct.Symbol, ptr %281, i32 0, i32 3
  %283 = load i8, ptr %282, align 2
  %284 = zext i8 %283 to i32
  %285 = icmp eq i32 %284, 1
  br i1 %285, label %299, label %286

286:                                              ; preds = %274
  %287 = load ptr, ptr %4, align 8
  %288 = getelementptr inbounds %struct.AstNode, ptr %287, i32 0, i32 1
  %289 = load ptr, ptr %288, align 8
  %290 = getelementptr inbounds ptr, ptr %289, i64 0
  %291 = load ptr, ptr %290, align 8
  %292 = getelementptr inbounds %struct.AstNode, ptr %291, i32 0, i32 6
  %293 = load ptr, ptr %292, align 8
  %294 = getelementptr inbounds %struct.Symbol, ptr %293, i32 0, i32 3
  %295 = load i8, ptr %294, align 2
  %296 = zext i8 %295 to i32
  %297 = icmp eq i32 %296, 0
  br i1 %297, label %299, label %298

298:                                              ; preds = %286
  call void @handleError(i32 noundef 5) #12
  unreachable

299:                                              ; preds = %286, %274
  br label %300

300:                                              ; preds = %299, %240
  %301 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %302 = load ptr, ptr %301, align 8
  %303 = call i32 @strcmp(ptr noundef %302, ptr noundef @.str.69.324) #14
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %305, label %335

305:                                              ; preds = %300
  %306 = load i32, ptr %5, align 4
  %307 = icmp ne i32 %306, 1
  br i1 %307, label %308, label %309

308:                                              ; preds = %305
  call void @handleError(i32 noundef 5) #12
  unreachable

309:                                              ; preds = %305
  %310 = load ptr, ptr %4, align 8
  %311 = getelementptr inbounds %struct.AstNode, ptr %310, i32 0, i32 1
  %312 = load ptr, ptr %311, align 8
  %313 = getelementptr inbounds ptr, ptr %312, i64 0
  %314 = load ptr, ptr %313, align 8
  %315 = getelementptr inbounds %struct.AstNode, ptr %314, i32 0, i32 6
  %316 = load ptr, ptr %315, align 8
  %317 = getelementptr inbounds %struct.Symbol, ptr %316, i32 0, i32 3
  %318 = load i8, ptr %317, align 2
  %319 = zext i8 %318 to i32
  %320 = icmp eq i32 %319, 1
  br i1 %320, label %334, label %321

321:                                              ; preds = %309
  %322 = load ptr, ptr %4, align 8
  %323 = getelementptr inbounds %struct.AstNode, ptr %322, i32 0, i32 1
  %324 = load ptr, ptr %323, align 8
  %325 = getelementptr inbounds ptr, ptr %324, i64 0
  %326 = load ptr, ptr %325, align 8
  %327 = getelementptr inbounds %struct.AstNode, ptr %326, i32 0, i32 6
  %328 = load ptr, ptr %327, align 8
  %329 = getelementptr inbounds %struct.Symbol, ptr %328, i32 0, i32 3
  %330 = load i8, ptr %329, align 2
  %331 = zext i8 %330 to i32
  %332 = icmp eq i32 %331, 0
  br i1 %332, label %334, label %333

333:                                              ; preds = %321
  call void @handleError(i32 noundef 5) #12
  unreachable

334:                                              ; preds = %321, %309
  br label %335

335:                                              ; preds = %334, %300
  br label %336

336:                                              ; preds = %335, %23, %1
  %337 = load i32, ptr %7, align 4
  %338 = icmp eq i32 %337, 0
  br i1 %338, label %339, label %343

339:                                              ; preds = %336
  %340 = load ptr, ptr %6, align 8
  %341 = load ptr, ptr %3, align 8
  %342 = getelementptr inbounds %struct.AstNode, ptr %341, i32 0, i32 6
  store ptr %340, ptr %342, align 8
  br label %357

343:                                              ; preds = %336
  %344 = load i32, ptr %7, align 4
  %345 = icmp eq i32 %344, 3
  br i1 %345, label %346, label %351

346:                                              ; preds = %343
  %347 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %348 = load ptr, ptr %347, align 8
  %349 = load i32, ptr %5, align 4
  %350 = load ptr, ptr %3, align 8
  call void @regCall(ptr noundef %348, i32 noundef %349, ptr noundef %350)
  br label %356

351:                                              ; preds = %343
  %352 = load i32, ptr %7, align 4
  %353 = icmp eq i32 %352, 5
  br i1 %353, label %354, label %355

354:                                              ; preds = %351
  call void @handleError(i32 noundef 5) #12
  unreachable

355:                                              ; preds = %351
  call void @handleError(i32 noundef 99) #12
  unreachable

356:                                              ; preds = %346
  br label %357

357:                                              ; preds = %356, %339
  call void @throwToken(i32 noundef 1)
  %358 = load ptr, ptr %3, align 8
  ret ptr %358
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal zeroext i1 @isBuiltInFunc(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca [11 x ptr], align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %30

9:                                                ; preds = %1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 @__const.isBuiltInFunc.builtInF, i64 88, i1 false)
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %26, %9
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [11 x ptr], ptr %4, i64 0, i64 %12
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %29

16:                                               ; preds = %10
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [11 x ptr], ptr %4, i64 0, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 @strcmp(ptr noundef %17, ptr noundef %21) #14
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %16
  store i1 true, ptr %2, align 1
  br label %30

25:                                               ; preds = %16
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  br label %10

29:                                               ; preds = %10
  store i1 false, ptr %2, align 1
  br label %30

30:                                               ; preds = %29, %24, %8
  %31 = load i1, ptr %2, align 1
  ret i1 %31
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @parseIfBranch() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Token, align 8
  %3 = alloca %struct.Token, align 8
  %4 = alloca %struct.Token, align 8
  call void @getToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %2, i32 noundef 2)
  %5 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 31
  br i1 %7, label %8, label %21

8:                                                ; preds = %0
  %9 = call ptr @createAstNode(i32 noundef 14)
  store ptr %9, ptr %1, align 8
  call void @tokenDeInit(ptr noundef %2)
  call void @peekToken(ptr dead_on_unwind writable sret(%struct.Token) align 8 %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 40, i1 false)
  %10 = getelementptr inbounds %struct.Token, ptr %2, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 12
  br i1 %12, label %13, label %18

13:                                               ; preds = %8
  %14 = load i8, ptr @__debug, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  call void @printDebug(ptr noundef @.str.75.330)
  br label %17

17:                                               ; preds = %16, %13
  call void @handleError(i32 noundef 2) #12
  unreachable

18:                                               ; preds = %8
  %19 = call ptr @parseExpr(i1 noundef zeroext true)
  %20 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %19, ptr noundef %20)
  call void @tokenDeInit(ptr noundef %2)
  br label %23

21:                                               ; preds = %0
  %22 = call ptr @createAstNode(i32 noundef 15)
  store ptr %22, ptr %1, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %2, i64 40, i1 false)
  call void @storeToken(ptr noundef %4)
  br label %23

23:                                               ; preds = %21, %18
  store i32 2, ptr @eolAllowance, align 4
  %24 = call ptr @parseBlock(i1 noundef zeroext true)
  %25 = load ptr, ptr %1, align 8
  call void @addAstNode(ptr noundef %24, ptr noundef %25)
  %26 = load ptr, ptr %1, align 8
  ret ptr %26
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @getNextToken(ptr dead_on_unwind noalias writable sret(%struct.Token) align 8 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.Token, align 8
  %5 = alloca i8, align 1
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @tokenInit(ptr dead_on_unwind writable sret(%struct.Token) align 8 %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %4, i64 40, i1 false)
  br label %6

6:                                                ; preds = %25, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %29

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %18

13:                                               ; preds = %9
  %14 = load i8, ptr @storeChar, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load i8, ptr %5, align 1
  call void @tokenAppend(ptr noundef %0, i8 noundef signext %17)
  br label %18

18:                                               ; preds = %16, %13, %9
  store i8 1, ptr @storeChar, align 1
  %19 = call i32 @getchar()
  %20 = trunc i32 %19 to i8
  store i8 %20, ptr %5, align 1
  %21 = load ptr, ptr @__stdinp, align 8
  %22 = call i32 @ferror(ptr noundef %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %18
  call void @handleError(i32 noundef 99) #12
  unreachable

25:                                               ; preds = %18
  %26 = load i8, ptr %5, align 1
  %27 = load i32, ptr %2, align 4
  %28 = call i32 @getState(i8 noundef signext %26, i32 noundef %27, ptr noundef %0)
  store i32 %28, ptr %3, align 4
  br label %6

29:                                               ; preds = %6
  %30 = load i8, ptr %5, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, -1
  br i1 %32, label %33, label %38

33:                                               ; preds = %29
  %34 = load i8, ptr %5, align 1
  %35 = sext i8 %34 to i32
  %36 = load ptr, ptr @__stdinp, align 8
  %37 = call i32 @ungetc(i32 noundef %35, ptr noundef %36)
  br label %38

38:                                               ; preds = %33, %29
  %39 = load i32, ptr %2, align 4
  call void @tokenCreate(i32 noundef %39, ptr noundef %0)
  store i32 0, ptr @depth, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @tokenInit(ptr dead_on_unwind noalias writable sret(%struct.Token) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  store i32 54, ptr %2, align 8
  %3 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 2
  store i32 0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 3
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 4
  store i32 0, ptr %5, align 8
  %6 = call ptr @malloc(i64 noundef 256) #11
  %7 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  call void @handleError(i32 noundef 99) #12
  unreachable

12:                                               ; preds = %1
  %13 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 0
  store i8 0, ptr %15, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @tokenAppend(ptr noundef %0, i8 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.Token, ptr %5, i32 0, i32 2
  %7 = load i32, ptr %6, align 8
  %8 = icmp sge i32 %7, 255
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr @__stderrp, align 8
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.1.361, i32 noundef 255) #14
  call void @handleError(i32 noundef 1) #12
  unreachable

12:                                               ; preds = %2
  %13 = load i8, ptr %4, align 1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Token, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.Token, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %18, align 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %16, i64 %20
  store i8 %13, ptr %21, align 1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.Token, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 8
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.Token, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.Token, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr %28, i64 %32
  store i8 0, ptr %33, align 1
  br label %34

34:                                               ; preds = %12
  ret void
}

declare i32 @getchar() #2

declare i32 @ferror(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @getState(i8 noundef signext %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i8 %0, ptr %4, align 1
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 3, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  switch i32 %8, label %536 [
    i32 0, label %9
    i32 4, label %59
    i32 7, label %71
    i32 10, label %95
    i32 30, label %124
    i32 17, label %141
    i32 32, label %176
    i32 37, label %182
    i32 35, label %188
    i32 40, label %194
    i32 39, label %200
    i32 33, label %206
    i32 5, label %212
    i32 27, label %218
    i32 28, label %218
    i32 29, label %218
    i32 43, label %218
    i32 44, label %218
    i32 47, label %218
    i32 48, label %218
    i32 45, label %218
    i32 46, label %218
    i32 49, label %218
    i32 50, label %218
    i32 51, label %218
    i32 9, label %219
    i32 8, label %227
    i32 13, label %245
    i32 15, label %263
    i32 11, label %271
    i32 12, label %279
    i32 53, label %287
    i32 54, label %302
    i32 18, label %341
    i32 21, label %376
    i32 6, label %383
    i32 31, label %395
    i32 26, label %402
    i32 19, label %403
    i32 20, label %427
    i32 16, label %483
    i32 14, label %491
    i32 22, label %499
    i32 23, label %505
    i32 25, label %517
    i32 24, label %535
  ]

9:                                                ; preds = %3
  %10 = load i8, ptr %4, align 1
  %11 = call zeroext i1 @isWhiteSpace(i8 noundef signext %10)
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %537

13:                                               ; preds = %9
  %14 = load i8, ptr %4, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 @isalpha(i32 noundef %15) #15
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %13
  store i32 4, ptr %7, align 4
  br label %537

19:                                               ; preds = %13
  %20 = load i8, ptr %4, align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 @isdigit(i32 noundef %21) #15
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %19
  %25 = load i8, ptr %4, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 48
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  store i32 7, ptr %7, align 4
  br label %537

29:                                               ; preds = %24, %19
  br label %30

30:                                               ; preds = %29
  br label %31

31:                                               ; preds = %30
  %32 = load i8, ptr %4, align 1
  %33 = sext i8 %32 to i32
  switch i32 %33, label %57 [
    i32 43, label %34
    i32 45, label %35
    i32 47, label %36
    i32 42, label %37
    i32 61, label %38
    i32 62, label %39
    i32 60, label %40
    i32 33, label %41
    i32 38, label %42
    i32 124, label %43
    i32 40, label %44
    i32 41, label %45
    i32 123, label %46
    i32 125, label %47
    i32 91, label %48
    i32 93, label %49
    i32 46, label %50
    i32 58, label %51
    i32 44, label %52
    i32 95, label %53
    i32 34, label %54
    i32 48, label %55
    i32 -1, label %56
  ]

34:                                               ; preds = %31
  store i32 27, ptr %7, align 4
  br label %58

35:                                               ; preds = %31
  store i32 28, ptr %7, align 4
  br label %58

36:                                               ; preds = %31
  store i32 30, ptr %7, align 4
  br label %58

37:                                               ; preds = %31
  store i32 29, ptr %7, align 4
  br label %58

38:                                               ; preds = %31
  store i32 31, ptr %7, align 4
  br label %58

39:                                               ; preds = %31
  store i32 37, ptr %7, align 4
  br label %58

40:                                               ; preds = %31
  store i32 35, ptr %7, align 4
  br label %58

41:                                               ; preds = %31
  store i32 33, ptr %7, align 4
  br label %58

42:                                               ; preds = %31
  store i32 40, ptr %7, align 4
  br label %58

43:                                               ; preds = %31
  store i32 39, ptr %7, align 4
  br label %58

44:                                               ; preds = %31
  store i32 43, ptr %7, align 4
  br label %58

45:                                               ; preds = %31
  store i32 44, ptr %7, align 4
  br label %58

46:                                               ; preds = %31
  store i32 45, ptr %7, align 4
  br label %58

47:                                               ; preds = %31
  store i32 46, ptr %7, align 4
  br label %58

48:                                               ; preds = %31
  store i32 47, ptr %7, align 4
  br label %58

49:                                               ; preds = %31
  store i32 48, ptr %7, align 4
  br label %58

50:                                               ; preds = %31
  store i32 49, ptr %7, align 4
  br label %58

51:                                               ; preds = %31
  store i32 50, ptr %7, align 4
  br label %58

52:                                               ; preds = %31
  store i32 51, ptr %7, align 4
  br label %58

53:                                               ; preds = %31
  store i32 5, ptr %7, align 4
  br label %58

54:                                               ; preds = %31
  store i32 17, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %58

55:                                               ; preds = %31
  store i32 10, ptr %7, align 4
  br label %58

56:                                               ; preds = %31
  store i32 2, ptr %7, align 4
  br label %58

57:                                               ; preds = %31
  br label %58

58:                                               ; preds = %57, %56, %55, %54, %53, %52, %51, %50, %49, %48, %47, %46, %45, %44, %43, %42, %41, %40, %39, %38, %37, %36, %35, %34
  br label %537

59:                                               ; preds = %3
  %60 = load i8, ptr %4, align 1
  %61 = sext i8 %60 to i32
  %62 = call i32 @isalnum(i32 noundef %61) #15
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %68, label %64

64:                                               ; preds = %59
  %65 = load i8, ptr %4, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp eq i32 %66, 95
  br i1 %67, label %68, label %69

68:                                               ; preds = %64, %59
  store i32 4, ptr %7, align 4
  br label %70

69:                                               ; preds = %64
  store i32 1, ptr %7, align 4
  br label %70

70:                                               ; preds = %69, %68
  br label %537

71:                                               ; preds = %3
  %72 = load i8, ptr %4, align 1
  %73 = sext i8 %72 to i32
  %74 = call i32 @isdigit(i32 noundef %73) #15
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %77

76:                                               ; preds = %71
  store i32 7, ptr %7, align 4
  br label %94

77:                                               ; preds = %71
  %78 = load i8, ptr %4, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp eq i32 %79, 46
  br i1 %80, label %81, label %82

81:                                               ; preds = %77
  store i32 9, ptr %7, align 4
  br label %93

82:                                               ; preds = %77
  %83 = load i8, ptr %4, align 1
  %84 = sext i8 %83 to i32
  %85 = icmp eq i32 %84, 101
  br i1 %85, label %90, label %86

86:                                               ; preds = %82
  %87 = load i8, ptr %4, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp eq i32 %88, 69
  br i1 %89, label %90, label %91

90:                                               ; preds = %86, %82
  store i32 13, ptr %7, align 4
  br label %92

91:                                               ; preds = %86
  store i32 1, ptr %7, align 4
  br label %92

92:                                               ; preds = %91, %90
  br label %93

93:                                               ; preds = %92, %81
  br label %94

94:                                               ; preds = %93, %76
  br label %537

95:                                               ; preds = %3
  %96 = load i8, ptr %4, align 1
  %97 = sext i8 %96 to i32
  %98 = icmp eq i32 %97, 120
  br i1 %98, label %103, label %99

99:                                               ; preds = %95
  %100 = load i8, ptr %4, align 1
  %101 = sext i8 %100 to i32
  %102 = icmp eq i32 %101, 88
  br i1 %102, label %103, label %104

103:                                              ; preds = %99, %95
  store i32 11, ptr %7, align 4
  br label %123

104:                                              ; preds = %99
  %105 = load i8, ptr %4, align 1
  %106 = sext i8 %105 to i32
  %107 = icmp eq i32 %106, 46
  br i1 %107, label %108, label %109

108:                                              ; preds = %104
  store i32 8, ptr %7, align 4
  br label %122

109:                                              ; preds = %104
  %110 = load i8, ptr %4, align 1
  %111 = sext i8 %110 to i32
  %112 = icmp eq i32 %111, 48
  br i1 %112, label %113, label %114

113:                                              ; preds = %109
  store i32 7, ptr %7, align 4
  br label %121

114:                                              ; preds = %109
  %115 = load i8, ptr %4, align 1
  %116 = sext i8 %115 to i32
  %117 = icmp eq i32 %116, 101
  br i1 %117, label %118, label %119

118:                                              ; preds = %114
  store i32 13, ptr %7, align 4
  br label %120

119:                                              ; preds = %114
  store i32 1, ptr %7, align 4
  br label %120

120:                                              ; preds = %119, %118
  br label %121

121:                                              ; preds = %120, %113
  br label %122

122:                                              ; preds = %121, %108
  br label %123

123:                                              ; preds = %122, %103
  br label %537

124:                                              ; preds = %3
  %125 = load i8, ptr %4, align 1
  %126 = sext i8 %125 to i32
  %127 = icmp eq i32 %126, 47
  br i1 %127, label %128, label %130

128:                                              ; preds = %124
  store i8 0, ptr @storeChar, align 1
  %129 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %129)
  store i32 53, ptr %7, align 4
  br label %140

130:                                              ; preds = %124
  %131 = load i8, ptr %4, align 1
  %132 = sext i8 %131 to i32
  %133 = icmp eq i32 %132, 42
  br i1 %133, label %134, label %138

134:                                              ; preds = %130
  store i8 0, ptr @storeChar, align 1
  %135 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %135)
  %136 = load i32, ptr @depth, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, ptr @depth, align 4
  store i32 54, ptr %7, align 4
  br label %139

138:                                              ; preds = %130
  store i32 1, ptr %7, align 4
  br label %139

139:                                              ; preds = %138, %134
  br label %140

140:                                              ; preds = %139, %128
  br label %537

141:                                              ; preds = %3
  %142 = load i8, ptr %4, align 1
  %143 = sext i8 %142 to i32
  %144 = icmp eq i32 %143, 34
  br i1 %144, label %145, label %146

145:                                              ; preds = %141
  store i32 21, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %175

146:                                              ; preds = %141
  %147 = load i8, ptr %4, align 1
  %148 = sext i8 %147 to i32
  %149 = icmp eq i32 %148, 92
  br i1 %149, label %150, label %151

150:                                              ; preds = %146
  store i32 19, ptr %7, align 4
  br label %174

151:                                              ; preds = %146
  %152 = load i8, ptr %4, align 1
  %153 = sext i8 %152 to i32
  %154 = icmp eq i32 %153, 10
  br i1 %154, label %159, label %155

155:                                              ; preds = %151
  %156 = load i8, ptr %4, align 1
  %157 = sext i8 %156 to i32
  %158 = icmp eq i32 %157, 13
  br i1 %158, label %159, label %160

159:                                              ; preds = %155, %151
  store i32 1, ptr %7, align 4
  br label %173

160:                                              ; preds = %155
  %161 = load i8, ptr %4, align 1
  %162 = zext i8 %161 to i32
  %163 = icmp sgt i32 %162, 31
  br i1 %163, label %164, label %165

164:                                              ; preds = %160
  store i32 18, ptr %7, align 4
  store i8 1, ptr @storeChar, align 1
  br label %172

165:                                              ; preds = %160
  %166 = load i8, ptr %4, align 1
  %167 = sext i8 %166 to i32
  %168 = icmp eq i32 %167, -1
  br i1 %168, label %169, label %170

169:                                              ; preds = %165
  store i32 1, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %171

170:                                              ; preds = %165
  store i32 1, ptr %7, align 4
  br label %171

171:                                              ; preds = %170, %169
  br label %172

172:                                              ; preds = %171, %164
  br label %173

173:                                              ; preds = %172, %159
  br label %174

174:                                              ; preds = %173, %150
  store i32 0, ptr @depth, align 4
  br label %175

175:                                              ; preds = %174, %145
  br label %537

176:                                              ; preds = %3
  %177 = load i8, ptr %4, align 1
  %178 = sext i8 %177 to i32
  %179 = icmp eq i32 %178, 61
  %180 = zext i1 %179 to i64
  %181 = select i1 %179, i32 31, i32 1
  store i32 %181, ptr %7, align 4
  br label %537

182:                                              ; preds = %3
  %183 = load i8, ptr %4, align 1
  %184 = sext i8 %183 to i32
  %185 = icmp eq i32 %184, 61
  %186 = zext i1 %185 to i64
  %187 = select i1 %185, i32 38, i32 1
  store i32 %187, ptr %7, align 4
  br label %537

188:                                              ; preds = %3
  %189 = load i8, ptr %4, align 1
  %190 = sext i8 %189 to i32
  %191 = icmp eq i32 %190, 61
  %192 = zext i1 %191 to i64
  %193 = select i1 %191, i32 36, i32 1
  store i32 %193, ptr %7, align 4
  br label %537

194:                                              ; preds = %3
  %195 = load i8, ptr %4, align 1
  %196 = sext i8 %195 to i32
  %197 = icmp eq i32 %196, 38
  %198 = zext i1 %197 to i64
  %199 = select i1 %197, i32 42, i32 1
  store i32 %199, ptr %7, align 4
  br label %537

200:                                              ; preds = %3
  %201 = load i8, ptr %4, align 1
  %202 = sext i8 %201 to i32
  %203 = icmp eq i32 %202, 124
  %204 = zext i1 %203 to i64
  %205 = select i1 %203, i32 41, i32 1
  store i32 %205, ptr %7, align 4
  br label %537

206:                                              ; preds = %3
  %207 = load i8, ptr %4, align 1
  %208 = sext i8 %207 to i32
  %209 = icmp eq i32 %208, 61
  %210 = zext i1 %209 to i64
  %211 = select i1 %209, i32 34, i32 1
  store i32 %211, ptr %7, align 4
  br label %537

212:                                              ; preds = %3
  %213 = load i8, ptr %4, align 1
  %214 = sext i8 %213 to i32
  %215 = icmp eq i32 %214, 95
  %216 = zext i1 %215 to i64
  %217 = select i1 %215, i32 6, i32 1
  store i32 %217, ptr %7, align 4
  br label %537

218:                                              ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3
  store i32 1, ptr %7, align 4
  br label %537

219:                                              ; preds = %3
  %220 = load i8, ptr %4, align 1
  %221 = sext i8 %220 to i32
  %222 = call i32 @isdigit(i32 noundef %221) #15
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %225

224:                                              ; preds = %219
  store i32 8, ptr %7, align 4
  br label %226

225:                                              ; preds = %219
  store i32 1, ptr %7, align 4
  br label %226

226:                                              ; preds = %225, %224
  br label %537

227:                                              ; preds = %3
  %228 = load i8, ptr %4, align 1
  %229 = sext i8 %228 to i32
  %230 = call i32 @isdigit(i32 noundef %229) #15
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %232, label %233

232:                                              ; preds = %227
  store i32 8, ptr %7, align 4
  br label %244

233:                                              ; preds = %227
  %234 = load i8, ptr %4, align 1
  %235 = sext i8 %234 to i32
  %236 = icmp eq i32 %235, 101
  br i1 %236, label %241, label %237

237:                                              ; preds = %233
  %238 = load i8, ptr %4, align 1
  %239 = sext i8 %238 to i32
  %240 = icmp eq i32 %239, 69
  br i1 %240, label %241, label %242

241:                                              ; preds = %237, %233
  store i32 13, ptr %7, align 4
  br label %243

242:                                              ; preds = %237
  store i32 1, ptr %7, align 4
  br label %243

243:                                              ; preds = %242, %241
  br label %244

244:                                              ; preds = %243, %232
  br label %537

245:                                              ; preds = %3
  %246 = load i8, ptr %4, align 1
  %247 = sext i8 %246 to i32
  %248 = icmp eq i32 %247, 43
  br i1 %248, label %253, label %249

249:                                              ; preds = %245
  %250 = load i8, ptr %4, align 1
  %251 = sext i8 %250 to i32
  %252 = icmp eq i32 %251, 45
  br i1 %252, label %253, label %254

253:                                              ; preds = %249, %245
  store i32 16, ptr %7, align 4
  br label %262

254:                                              ; preds = %249
  %255 = load i8, ptr %4, align 1
  %256 = sext i8 %255 to i32
  %257 = call i32 @isdigit(i32 noundef %256) #15
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %260

259:                                              ; preds = %254
  store i32 15, ptr %7, align 4
  br label %261

260:                                              ; preds = %254
  store i32 1, ptr %7, align 4
  br label %261

261:                                              ; preds = %260, %259
  br label %262

262:                                              ; preds = %261, %253
  br label %537

263:                                              ; preds = %3
  %264 = load i8, ptr %4, align 1
  %265 = sext i8 %264 to i32
  %266 = call i32 @isdigit(i32 noundef %265) #15
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %269

268:                                              ; preds = %263
  store i32 15, ptr %7, align 4
  br label %270

269:                                              ; preds = %263
  store i32 1, ptr %7, align 4
  br label %270

270:                                              ; preds = %269, %268
  br label %537

271:                                              ; preds = %3
  %272 = load i8, ptr %4, align 1
  %273 = sext i8 %272 to i32
  %274 = call i32 @isxdigit(i32 noundef %273) #15
  %275 = icmp ne i32 %274, 0
  br i1 %275, label %276, label %277

276:                                              ; preds = %271
  store i32 12, ptr %7, align 4
  br label %278

277:                                              ; preds = %271
  store i32 1, ptr %7, align 4
  br label %278

278:                                              ; preds = %277, %276
  br label %537

279:                                              ; preds = %3
  %280 = load i8, ptr %4, align 1
  %281 = sext i8 %280 to i32
  %282 = call i32 @isxdigit(i32 noundef %281) #15
  %283 = icmp ne i32 %282, 0
  br i1 %283, label %284, label %285

284:                                              ; preds = %279
  store i32 12, ptr %7, align 4
  br label %286

285:                                              ; preds = %279
  store i32 1, ptr %7, align 4
  br label %286

286:                                              ; preds = %285, %284
  br label %537

287:                                              ; preds = %3
  %288 = load i8, ptr %4, align 1
  %289 = sext i8 %288 to i32
  %290 = icmp eq i32 %289, 10
  br i1 %290, label %291, label %294

291:                                              ; preds = %287
  %292 = load i32, ptr @CURRENTLINE, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, ptr @CURRENTLINE, align 4
  store i32 0, ptr %7, align 4
  br label %301

294:                                              ; preds = %287
  %295 = load i8, ptr %4, align 1
  %296 = sext i8 %295 to i32
  %297 = icmp eq i32 %296, -1
  br i1 %297, label %298, label %299

298:                                              ; preds = %294
  store i32 2, ptr %7, align 4
  br label %300

299:                                              ; preds = %294
  store i32 53, ptr %7, align 4
  br label %300

300:                                              ; preds = %299, %298
  br label %301

301:                                              ; preds = %300, %291
  store i8 0, ptr @storeChar, align 1
  br label %537

302:                                              ; preds = %3
  store i32 54, ptr %7, align 4
  %303 = load i8, ptr %4, align 1
  %304 = sext i8 %303 to i32
  %305 = icmp eq i32 %304, 42
  br i1 %305, label %306, label %315

306:                                              ; preds = %302
  %307 = call signext i8 @peekChar()
  %308 = sext i8 %307 to i32
  %309 = icmp eq i32 %308, 47
  br i1 %309, label %310, label %314

310:                                              ; preds = %306
  %311 = load i32, ptr @depth, align 4
  %312 = add nsw i32 %311, -1
  store i32 %312, ptr @depth, align 4
  %313 = call i32 @getchar()
  br label %314

314:                                              ; preds = %310, %306
  br label %336

315:                                              ; preds = %302
  %316 = load i8, ptr %4, align 1
  %317 = sext i8 %316 to i32
  %318 = icmp eq i32 %317, 47
  br i1 %318, label %319, label %328

319:                                              ; preds = %315
  %320 = call signext i8 @peekChar()
  %321 = sext i8 %320 to i32
  %322 = icmp eq i32 %321, 42
  br i1 %322, label %323, label %327

323:                                              ; preds = %319
  %324 = load i32, ptr @depth, align 4
  %325 = add nsw i32 %324, 1
  store i32 %325, ptr @depth, align 4
  %326 = call i32 @getchar()
  br label %327

327:                                              ; preds = %323, %319
  br label %335

328:                                              ; preds = %315
  %329 = load i8, ptr %4, align 1
  %330 = sext i8 %329 to i32
  %331 = icmp eq i32 %330, -1
  br i1 %331, label %332, label %333

332:                                              ; preds = %328
  store i32 2, ptr %7, align 4
  call void @handleError(i32 noundef 1) #12
  unreachable

333:                                              ; preds = %328
  store i32 54, ptr %7, align 4
  br label %334

334:                                              ; preds = %333
  br label %335

335:                                              ; preds = %334, %327
  br label %336

336:                                              ; preds = %335, %314
  %337 = load i32, ptr @depth, align 4
  %338 = icmp eq i32 %337, 0
  br i1 %338, label %339, label %340

339:                                              ; preds = %336
  store i32 0, ptr %7, align 4
  br label %340

340:                                              ; preds = %339, %336
  store i8 0, ptr @storeChar, align 1
  br label %537

341:                                              ; preds = %3
  %342 = load i8, ptr %4, align 1
  %343 = sext i8 %342 to i32
  %344 = icmp eq i32 %343, 34
  br i1 %344, label %345, label %346

345:                                              ; preds = %341
  store i32 26, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %375

346:                                              ; preds = %341
  %347 = load i8, ptr %4, align 1
  %348 = sext i8 %347 to i32
  %349 = icmp eq i32 %348, 92
  br i1 %349, label %350, label %351

350:                                              ; preds = %346
  store i32 19, ptr %7, align 4
  br label %374

351:                                              ; preds = %346
  %352 = load i8, ptr %4, align 1
  %353 = sext i8 %352 to i32
  %354 = icmp eq i32 %353, 10
  br i1 %354, label %359, label %355

355:                                              ; preds = %351
  %356 = load i8, ptr %4, align 1
  %357 = sext i8 %356 to i32
  %358 = icmp eq i32 %357, 13
  br i1 %358, label %359, label %360

359:                                              ; preds = %355, %351
  store i32 1, ptr %7, align 4
  br label %373

360:                                              ; preds = %355
  %361 = load i8, ptr %4, align 1
  %362 = zext i8 %361 to i32
  %363 = icmp sgt i32 %362, 31
  br i1 %363, label %364, label %365

364:                                              ; preds = %360
  store i32 18, ptr %7, align 4
  store i8 1, ptr @storeChar, align 1
  br label %372

365:                                              ; preds = %360
  %366 = load i8, ptr %4, align 1
  %367 = sext i8 %366 to i32
  %368 = icmp eq i32 %367, -1
  br i1 %368, label %369, label %370

369:                                              ; preds = %365
  store i32 1, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %371

370:                                              ; preds = %365
  store i32 1, ptr %7, align 4
  br label %371

371:                                              ; preds = %370, %369
  br label %372

372:                                              ; preds = %371, %364
  br label %373

373:                                              ; preds = %372, %359
  br label %374

374:                                              ; preds = %373, %350
  br label %375

375:                                              ; preds = %374, %345
  store i32 0, ptr @depth, align 4
  br label %537

376:                                              ; preds = %3
  %377 = load i8, ptr %4, align 1
  %378 = sext i8 %377 to i32
  %379 = icmp eq i32 %378, 34
  br i1 %379, label %380, label %381

380:                                              ; preds = %376
  store i32 22, ptr %7, align 4
  store i8 0, ptr @storeChar, align 1
  br label %382

381:                                              ; preds = %376
  store i32 1, ptr %7, align 4
  br label %382

382:                                              ; preds = %381, %380
  br label %537

383:                                              ; preds = %3
  %384 = load i8, ptr %4, align 1
  %385 = sext i8 %384 to i32
  %386 = call i32 @isalnum(i32 noundef %385) #15
  %387 = icmp ne i32 %386, 0
  br i1 %387, label %392, label %388

388:                                              ; preds = %383
  %389 = load i8, ptr %4, align 1
  %390 = sext i8 %389 to i32
  %391 = icmp eq i32 %390, 95
  br i1 %391, label %392, label %393

392:                                              ; preds = %388, %383
  store i32 6, ptr %7, align 4
  br label %394

393:                                              ; preds = %388
  store i32 1, ptr %7, align 4
  br label %394

394:                                              ; preds = %393, %392
  br label %537

395:                                              ; preds = %3
  %396 = load i8, ptr %4, align 1
  %397 = sext i8 %396 to i32
  %398 = icmp eq i32 %397, 61
  br i1 %398, label %399, label %400

399:                                              ; preds = %395
  store i32 32, ptr %7, align 4
  br label %401

400:                                              ; preds = %395
  store i32 1, ptr %7, align 4
  br label %401

401:                                              ; preds = %400, %399
  br label %537

402:                                              ; preds = %3
  store i32 1, ptr %7, align 4
  br label %537

403:                                              ; preds = %3
  store i8 0, ptr @storeChar, align 1
  %404 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %404)
  %405 = load i8, ptr %4, align 1
  %406 = sext i8 %405 to i32
  switch i32 %406, label %419 [
    i32 34, label %407
    i32 92, label %408
    i32 37, label %409
    i32 97, label %410
    i32 98, label %411
    i32 101, label %412
    i32 102, label %413
    i32 110, label %414
    i32 114, label %415
    i32 116, label %416
    i32 118, label %417
    i32 120, label %418
  ]

407:                                              ; preds = %403
  store i8 34, ptr %4, align 1
  br label %420

408:                                              ; preds = %403
  store i8 92, ptr %4, align 1
  br label %420

409:                                              ; preds = %403
  store i8 37, ptr %4, align 1
  br label %420

410:                                              ; preds = %403
  store i8 7, ptr %4, align 1
  br label %420

411:                                              ; preds = %403
  store i8 8, ptr %4, align 1
  br label %420

412:                                              ; preds = %403
  store i8 27, ptr %4, align 1
  br label %420

413:                                              ; preds = %403
  store i8 12, ptr %4, align 1
  br label %420

414:                                              ; preds = %403
  store i8 10, ptr %4, align 1
  br label %420

415:                                              ; preds = %403
  store i8 13, ptr %4, align 1
  br label %420

416:                                              ; preds = %403
  store i8 9, ptr %4, align 1
  br label %420

417:                                              ; preds = %403
  store i8 11, ptr %4, align 1
  br label %420

418:                                              ; preds = %403
  store i32 20, ptr %7, align 4
  br label %420

419:                                              ; preds = %403
  call void @handleError(i32 noundef 1) #12
  unreachable

420:                                              ; preds = %418, %417, %416, %415, %414, %413, %412, %411, %410, %409, %408, %407
  %421 = load i32, ptr %7, align 4
  %422 = icmp ne i32 %421, 20
  br i1 %422, label %423, label %424

423:                                              ; preds = %420
  store i32 18, ptr %7, align 4
  br label %424

424:                                              ; preds = %423, %420
  %425 = load ptr, ptr %6, align 8
  %426 = load i8, ptr %4, align 1
  call void @tokenAppend(ptr noundef %425, i8 noundef signext %426)
  br label %537

427:                                              ; preds = %3
  %428 = load i8, ptr %4, align 1
  %429 = sext i8 %428 to i32
  %430 = call i32 @isxdigit(i32 noundef %429) #15
  %431 = icmp ne i32 %430, 0
  br i1 %431, label %432, label %482

432:                                              ; preds = %427
  %433 = load i32, ptr @depth, align 4
  %434 = icmp eq i32 %433, 0
  br i1 %434, label %435, label %458

435:                                              ; preds = %432
  %436 = load i8, ptr %4, align 1
  %437 = call i32 @hexCharToInt(i8 noundef signext %436)
  %438 = icmp sgt i32 %437, 7
  br i1 %438, label %439, label %442

439:                                              ; preds = %435
  %440 = load i32, ptr @CURRENTLINE, align 4
  %441 = call i32 (ptr, ...) @printf(ptr noundef @.str.360, i32 noundef %440)
  call void @handleError(i32 noundef 1) #12
  unreachable

442:                                              ; preds = %435
  store i8 0, ptr @storeChar, align 1
  %443 = load i8, ptr %4, align 1
  %444 = call i32 @hexCharToInt(i8 noundef signext %443)
  %445 = mul nsw i32 %444, 16
  %446 = trunc i32 %445 to i8
  %447 = load ptr, ptr %6, align 8
  %448 = getelementptr inbounds %struct.Token, ptr %447, i32 0, i32 1
  %449 = load ptr, ptr %448, align 8
  %450 = load ptr, ptr %6, align 8
  %451 = getelementptr inbounds %struct.Token, ptr %450, i32 0, i32 2
  %452 = load i32, ptr %451, align 8
  %453 = sub nsw i32 %452, 1
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds i8, ptr %449, i64 %454
  store i8 %446, ptr %455, align 1
  store i32 20, ptr %7, align 4
  %456 = load i32, ptr @depth, align 4
  %457 = add nsw i32 %456, 1
  store i32 %457, ptr @depth, align 4
  br label %481

458:                                              ; preds = %432
  %459 = load i32, ptr @depth, align 4
  %460 = icmp eq i32 %459, 1
  br i1 %460, label %461, label %479

461:                                              ; preds = %458
  store i8 0, ptr @storeChar, align 1
  %462 = load i8, ptr %4, align 1
  %463 = call i32 @hexCharToInt(i8 noundef signext %462)
  %464 = load ptr, ptr %6, align 8
  %465 = getelementptr inbounds %struct.Token, ptr %464, i32 0, i32 1
  %466 = load ptr, ptr %465, align 8
  %467 = load ptr, ptr %6, align 8
  %468 = getelementptr inbounds %struct.Token, ptr %467, i32 0, i32 2
  %469 = load i32, ptr %468, align 8
  %470 = sub nsw i32 %469, 1
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i8, ptr %466, i64 %471
  %473 = load i8, ptr %472, align 1
  %474 = sext i8 %473 to i32
  %475 = add nsw i32 %474, %463
  %476 = trunc i32 %475 to i8
  store i8 %476, ptr %472, align 1
  store i32 18, ptr %7, align 4
  %477 = load i32, ptr @depth, align 4
  %478 = add nsw i32 %477, 1
  store i32 %478, ptr @depth, align 4
  br label %480

479:                                              ; preds = %458
  call void @handleError(i32 noundef 99) #12
  unreachable

480:                                              ; preds = %461
  br label %481

481:                                              ; preds = %480, %442
  br label %482

482:                                              ; preds = %481, %427
  br label %537

483:                                              ; preds = %3
  %484 = load i8, ptr %4, align 1
  %485 = sext i8 %484 to i32
  %486 = call i32 @isdigit(i32 noundef %485) #15
  %487 = icmp ne i32 %486, 0
  br i1 %487, label %488, label %489

488:                                              ; preds = %483
  store i32 14, ptr %7, align 4
  br label %490

489:                                              ; preds = %483
  store i32 1, ptr %7, align 4
  br label %490

490:                                              ; preds = %489, %488
  br label %537

491:                                              ; preds = %3
  %492 = load i8, ptr %4, align 1
  %493 = sext i8 %492 to i32
  %494 = call i32 @isdigit(i32 noundef %493) #15
  %495 = icmp ne i32 %494, 0
  br i1 %495, label %496, label %497

496:                                              ; preds = %491
  store i32 14, ptr %7, align 4
  br label %498

497:                                              ; preds = %491
  store i32 1, ptr %7, align 4
  br label %498

498:                                              ; preds = %497, %496
  br label %537

499:                                              ; preds = %3
  %500 = load i8, ptr %4, align 1
  %501 = call zeroext i1 @isWhiteSpace(i8 noundef signext %500)
  br i1 %501, label %502, label %503

502:                                              ; preds = %499
  store i8 0, ptr @storeChar, align 1
  store i32 22, ptr %7, align 4
  br label %504

503:                                              ; preds = %499
  store i32 23, ptr %7, align 4
  br label %504

504:                                              ; preds = %503, %502
  br label %537

505:                                              ; preds = %3
  %506 = load i8, ptr %4, align 1
  %507 = sext i8 %506 to i32
  %508 = icmp eq i32 %507, 34
  br i1 %508, label %509, label %510

509:                                              ; preds = %505
  store i32 25, ptr %7, align 4
  br label %516

510:                                              ; preds = %505
  %511 = load i8, ptr %4, align 1
  %512 = call zeroext i1 @isWhiteSpace(i8 noundef signext %511)
  br i1 %512, label %513, label %514

513:                                              ; preds = %510
  store i32 23, ptr %7, align 4
  br label %515

514:                                              ; preds = %510
  store i32 23, ptr %7, align 4
  br label %515

515:                                              ; preds = %514, %513
  br label %516

516:                                              ; preds = %515, %509
  br label %537

517:                                              ; preds = %3
  %518 = load i8, ptr %4, align 1
  %519 = sext i8 %518 to i32
  %520 = icmp eq i32 %519, 34
  br i1 %520, label %521, label %524

521:                                              ; preds = %517
  %522 = load i32, ptr @depth, align 4
  %523 = add nsw i32 %522, 1
  store i32 %523, ptr @depth, align 4
  store i32 25, ptr %7, align 4
  br label %527

524:                                              ; preds = %517
  %525 = load i8, ptr %4, align 1
  %526 = call zeroext i1 @isWhiteSpace(i8 noundef signext %525)
  store i32 0, ptr @depth, align 4
  store i32 23, ptr %7, align 4
  br label %527

527:                                              ; preds = %524, %521
  %528 = load i32, ptr @depth, align 4
  %529 = icmp eq i32 %528, 2
  br i1 %529, label %530, label %534

530:                                              ; preds = %527
  store i32 24, ptr %7, align 4
  %531 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %531)
  %532 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %532)
  %533 = load ptr, ptr %6, align 8
  call void @tokenRemoveLast(ptr noundef %533)
  br label %534

534:                                              ; preds = %530, %527
  br label %537

535:                                              ; preds = %3
  br label %536

536:                                              ; preds = %535, %3
  store i32 1, ptr %7, align 4
  br label %537

537:                                              ; preds = %536, %534, %516, %504, %498, %490, %482, %424, %402, %401, %394, %382, %375, %340, %301, %286, %278, %270, %262, %244, %226, %218, %212, %206, %200, %194, %188, %182, %176, %175, %140, %123, %94, %70, %58, %28, %18, %12
  %538 = load i32, ptr %7, align 4
  ret i32 %538
}

declare i32 @ungetc(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @tokenCreate(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %160 [
    i32 4, label %7
    i32 21, label %58
    i32 24, label %58
    i32 26, label %58
    i32 12, label %66
    i32 10, label %66
    i32 14, label %66
    i32 15, label %66
    i32 7, label %66
    i32 8, label %66
    i32 6, label %75
    i32 27, label %84
    i32 28, label %87
    i32 30, label %90
    i32 29, label %93
    i32 32, label %96
    i32 31, label %99
    i32 35, label %102
    i32 36, label %105
    i32 37, label %108
    i32 38, label %111
    i32 34, label %114
    i32 40, label %117
    i32 42, label %120
    i32 39, label %123
    i32 41, label %126
    i32 43, label %129
    i32 44, label %132
    i32 45, label %135
    i32 46, label %138
    i32 47, label %141
    i32 48, label %144
    i32 49, label %147
    i32 50, label %150
    i32 51, label %153
    i32 2, label %156
    i32 3, label %159
  ]

7:                                                ; preds = %2
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.Token, ptr %8, i32 0, i32 0
  store i32 47, ptr %9, align 8
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %37, %7
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [21 x %struct.ifjFunction], ptr @keywords, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.ifjFunction, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %40

17:                                               ; preds = %10
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.Token, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [21 x %struct.ifjFunction], ptr @keywords, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.ifjFunction, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 @strcmp(ptr noundef %20, ptr noundef %25) #14
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %36

28:                                               ; preds = %17
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [21 x %struct.ifjFunction], ptr @keywords, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.ifjFunction, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.Token, ptr %34, i32 0, i32 0
  store i32 %33, ptr %35, align 8
  br label %40

36:                                               ; preds = %17
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %10

40:                                               ; preds = %28, %10
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.Token, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %43, 34
  br i1 %44, label %45, label %48

45:                                               ; preds = %40
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.Token, ptr %46, i32 0, i32 5
  store i8 1, ptr %47, align 8
  br label %57

48:                                               ; preds = %40
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.Token, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %50, align 8
  %52 = icmp eq i32 %51, 33
  br i1 %52, label %53, label %56

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.Token, ptr %54, i32 0, i32 5
  store i8 0, ptr %55, align 8
  br label %56

56:                                               ; preds = %53, %48
  br label %57

57:                                               ; preds = %56, %45
  br label %165

58:                                               ; preds = %2, %2, %2
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %struct.Token, ptr %59, i32 0, i32 0
  store i32 46, ptr %60, align 8
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.Token, ptr %61, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.Token, ptr %64, i32 0, i32 5
  store ptr %63, ptr %65, align 8
  br label %165

66:                                               ; preds = %2, %2, %2, %2, %2, %2
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.Token, ptr %67, i32 0, i32 0
  store i32 48, ptr %68, align 8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.Token, ptr %69, i32 0, i32 1
  %71 = load ptr, ptr %70, align 8
  %72 = call double @atof(ptr noundef %71)
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.Token, ptr %73, i32 0, i32 5
  store double %72, ptr %74, align 8
  br label %165

75:                                               ; preds = %2
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.Token, ptr %76, i32 0, i32 0
  store i32 49, ptr %77, align 8
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.Token, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = call double @atof(ptr noundef %80)
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.Token, ptr %82, i32 0, i32 5
  store double %81, ptr %83, align 8
  br label %165

84:                                               ; preds = %2
  %85 = load ptr, ptr %4, align 8
  %86 = getelementptr inbounds %struct.Token, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  br label %165

87:                                               ; preds = %2
  %88 = load ptr, ptr %4, align 8
  %89 = getelementptr inbounds %struct.Token, ptr %88, i32 0, i32 0
  store i32 1, ptr %89, align 8
  br label %165

90:                                               ; preds = %2
  %91 = load ptr, ptr %4, align 8
  %92 = getelementptr inbounds %struct.Token, ptr %91, i32 0, i32 0
  store i32 3, ptr %92, align 8
  br label %165

93:                                               ; preds = %2
  %94 = load ptr, ptr %4, align 8
  %95 = getelementptr inbounds %struct.Token, ptr %94, i32 0, i32 0
  store i32 2, ptr %95, align 8
  br label %165

96:                                               ; preds = %2
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds %struct.Token, ptr %97, i32 0, i32 0
  store i32 10, ptr %98, align 8
  br label %165

99:                                               ; preds = %2
  %100 = load ptr, ptr %4, align 8
  %101 = getelementptr inbounds %struct.Token, ptr %100, i32 0, i32 0
  store i32 27, ptr %101, align 8
  br label %165

102:                                              ; preds = %2
  %103 = load ptr, ptr %4, align 8
  %104 = getelementptr inbounds %struct.Token, ptr %103, i32 0, i32 0
  store i32 6, ptr %104, align 8
  br label %165

105:                                              ; preds = %2
  %106 = load ptr, ptr %4, align 8
  %107 = getelementptr inbounds %struct.Token, ptr %106, i32 0, i32 0
  store i32 8, ptr %107, align 8
  br label %165

108:                                              ; preds = %2
  %109 = load ptr, ptr %4, align 8
  %110 = getelementptr inbounds %struct.Token, ptr %109, i32 0, i32 0
  store i32 7, ptr %110, align 8
  br label %165

111:                                              ; preds = %2
  %112 = load ptr, ptr %4, align 8
  %113 = getelementptr inbounds %struct.Token, ptr %112, i32 0, i32 0
  store i32 9, ptr %113, align 8
  br label %165

114:                                              ; preds = %2
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.Token, ptr %115, i32 0, i32 0
  store i32 11, ptr %116, align 8
  br label %165

117:                                              ; preds = %2
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.Token, ptr %118, i32 0, i32 0
  store i32 25, ptr %119, align 8
  br label %165

120:                                              ; preds = %2
  %121 = load ptr, ptr %4, align 8
  %122 = getelementptr inbounds %struct.Token, ptr %121, i32 0, i32 0
  store i32 26, ptr %122, align 8
  br label %165

123:                                              ; preds = %2
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.Token, ptr %124, i32 0, i32 0
  store i32 23, ptr %125, align 8
  br label %165

126:                                              ; preds = %2
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.Token, ptr %127, i32 0, i32 0
  store i32 24, ptr %128, align 8
  br label %165

129:                                              ; preds = %2
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds %struct.Token, ptr %130, i32 0, i32 0
  store i32 12, ptr %131, align 8
  br label %165

132:                                              ; preds = %2
  %133 = load ptr, ptr %4, align 8
  %134 = getelementptr inbounds %struct.Token, ptr %133, i32 0, i32 0
  store i32 13, ptr %134, align 8
  br label %165

135:                                              ; preds = %2
  %136 = load ptr, ptr %4, align 8
  %137 = getelementptr inbounds %struct.Token, ptr %136, i32 0, i32 0
  store i32 15, ptr %137, align 8
  br label %165

138:                                              ; preds = %2
  %139 = load ptr, ptr %4, align 8
  %140 = getelementptr inbounds %struct.Token, ptr %139, i32 0, i32 0
  store i32 16, ptr %140, align 8
  br label %165

141:                                              ; preds = %2
  %142 = load ptr, ptr %4, align 8
  %143 = getelementptr inbounds %struct.Token, ptr %142, i32 0, i32 0
  store i32 17, ptr %143, align 8
  br label %165

144:                                              ; preds = %2
  %145 = load ptr, ptr %4, align 8
  %146 = getelementptr inbounds %struct.Token, ptr %145, i32 0, i32 0
  store i32 18, ptr %146, align 8
  br label %165

147:                                              ; preds = %2
  %148 = load ptr, ptr %4, align 8
  %149 = getelementptr inbounds %struct.Token, ptr %148, i32 0, i32 0
  store i32 20, ptr %149, align 8
  br label %165

150:                                              ; preds = %2
  %151 = load ptr, ptr %4, align 8
  %152 = getelementptr inbounds %struct.Token, ptr %151, i32 0, i32 0
  store i32 19, ptr %152, align 8
  br label %165

153:                                              ; preds = %2
  %154 = load ptr, ptr %4, align 8
  %155 = getelementptr inbounds %struct.Token, ptr %154, i32 0, i32 0
  store i32 21, ptr %155, align 8
  br label %165

156:                                              ; preds = %2
  %157 = load ptr, ptr %4, align 8
  %158 = getelementptr inbounds %struct.Token, ptr %157, i32 0, i32 0
  store i32 53, ptr %158, align 8
  br label %165

159:                                              ; preds = %2
  br label %160

160:                                              ; preds = %159, %2
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.Token, ptr %161, i32 0, i32 0
  store i32 52, ptr %162, align 8
  %163 = load ptr, ptr %4, align 8
  %164 = getelementptr inbounds %struct.Token, ptr %163, i32 0, i32 3
  store i32 1, ptr %164, align 4
  br label %165

165:                                              ; preds = %160, %156, %153, %150, %147, %144, %141, %138, %135, %132, %129, %126, %123, %120, %117, %114, %111, %108, %105, %102, %99, %96, %93, %90, %87, %84, %75, %66, %58, %57
  %166 = load i32, ptr @CURRENTLINE, align 4
  %167 = load ptr, ptr %4, align 8
  %168 = getelementptr inbounds %struct.Token, ptr %167, i32 0, i32 4
  store i32 %166, ptr %168, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isWhiteSpace(i8 noundef signext %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  %4 = load i8, ptr %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp eq i32 %5, 10
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr @CURRENTLINE, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr @CURRENTLINE, align 4
  store i1 true, ptr %2, align 1
  br label %17

10:                                               ; preds = %1
  %11 = load i8, ptr %3, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 @isspace(i32 noundef %12) #15
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %10
  store i1 true, ptr %2, align 1
  br label %17

16:                                               ; preds = %10
  store i1 false, ptr %2, align 1
  br label %17

17:                                               ; preds = %16, %15, %7
  %18 = load i1, ptr %2, align 1
  ret i1 %18
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isalpha(i32 noundef) #10

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isdigit(i32 noundef) #10

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isalnum(i32 noundef) #10

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @tokenRemoveLast(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 2
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @handleError(i32 noundef 27) #12
  unreachable

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Token, ptr %9, i32 0, i32 2
  %11 = load i32, ptr %10, align 8
  %12 = add nsw i32 %11, -1
  store i32 %12, ptr %10, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Token, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.Token, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 8
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %15, i64 %19
  store i8 0, ptr %20, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isxdigit(i32 noundef) #10

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define signext i8 @peekChar() #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = call i32 @getchar()
  %4 = trunc i32 %3 to i8
  store i8 %4, ptr %2, align 1
  %5 = load ptr, ptr @__stdinp, align 8
  %6 = call i32 @ferror(ptr noundef %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %0
  call void @handleError(i32 noundef 99) #12
  unreachable

9:                                                ; preds = %0
  %10 = load i8, ptr %2, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  store i8 -1, ptr %1, align 1
  br label %23

14:                                               ; preds = %9
  %15 = load i8, ptr %2, align 1
  %16 = sext i8 %15 to i32
  %17 = load ptr, ptr @__stdinp, align 8
  %18 = call i32 @ungetc(i32 noundef %16, ptr noundef %17)
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  call void @handleError(i32 noundef 99) #12
  unreachable

21:                                               ; preds = %14
  %22 = load i8, ptr %2, align 1
  store i8 %22, ptr %1, align 1
  br label %23

23:                                               ; preds = %21, %13
  %24 = load i8, ptr %1, align 1
  ret i8 %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @hexCharToInt(i8 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  %4 = load i8, ptr %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp sge i32 %5, 48
  br i1 %6, label %7, label %15

7:                                                ; preds = %1
  %8 = load i8, ptr %3, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp sle i32 %9, 57
  br i1 %10, label %11, label %15

11:                                               ; preds = %7
  %12 = load i8, ptr %3, align 1
  %13 = sext i8 %12 to i32
  %14 = sub nsw i32 %13, 48
  store i32 %14, ptr %2, align 4
  br label %42

15:                                               ; preds = %7, %1
  %16 = load i8, ptr %3, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp sge i32 %17, 65
  br i1 %18, label %19, label %28

19:                                               ; preds = %15
  %20 = load i8, ptr %3, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp sle i32 %21, 70
  br i1 %22, label %23, label %28

23:                                               ; preds = %19
  %24 = load i8, ptr %3, align 1
  %25 = sext i8 %24 to i32
  %26 = sub nsw i32 %25, 65
  %27 = add nsw i32 %26, 10
  store i32 %27, ptr %2, align 4
  br label %42

28:                                               ; preds = %19, %15
  %29 = load i8, ptr %3, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp sge i32 %30, 97
  br i1 %31, label %32, label %41

32:                                               ; preds = %28
  %33 = load i8, ptr %3, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp sle i32 %34, 102
  br i1 %35, label %36, label %41

36:                                               ; preds = %32
  %37 = load i8, ptr %3, align 1
  %38 = sext i8 %37 to i32
  %39 = sub nsw i32 %38, 97
  %40 = add nsw i32 %39, 10
  store i32 %40, ptr %2, align 4
  br label %42

41:                                               ; preds = %32, %28
  store i32 -1, ptr %2, align 4
  br label %42

42:                                               ; preds = %41, %36, %23, %11
  %43 = load i32, ptr %2, align 4
  ret i32 %43
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @isspace(i32 noundef) #10

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @tokenDeInit(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Token, ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Token, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Token, ptr %11, i32 0, i32 1
  store ptr null, ptr %12, align 8
  br label %13

13:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semInit() #0 {
  call void @initScope(ptr noundef @semStack)
  %1 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.368, i32 noundef 0, i1 noundef zeroext true, ptr noundef null)
  %2 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.1.369, i32 noundef 0, i1 noundef zeroext true, ptr noundef null)
  %3 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.2.370, i32 noundef 1, i1 noundef zeroext true, ptr noundef null)
  %4 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.3.371, i32 noundef 1, i1 noundef zeroext true, ptr noundef null)
  %5 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.4.372, i32 noundef 2, i1 noundef zeroext true, ptr noundef null)
  %6 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.5.373, i32 noundef 1, i1 noundef zeroext true, ptr noundef null)
  %7 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.6.374, i32 noundef 3, i1 noundef zeroext true, ptr noundef null)
  %8 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.7.375, i32 noundef 1, i1 noundef zeroext true, ptr noundef null)
  %9 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.8.376, i32 noundef 1, i1 noundef zeroext true, ptr noundef null)
  %10 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef @.str.9.377, i32 noundef 2, i1 noundef zeroext true, ptr noundef null)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semEnterScope() #0 {
  call void @pushScope(ptr noundef @semStack)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semExitScope() #0 {
  call void @popScope(ptr noundef @semStack)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semVar(ptr noundef %0, i1 noundef zeroext %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  %8 = zext i1 %1 to i8
  store i8 %8, ptr %5, align 1
  store ptr %2, ptr %6, align 8
  %9 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  br label %32

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = load i8, ptr %5, align 1
  %17 = trunc i8 %16 to i1
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = call i32 @getTypeMask(i32 noundef %20)
  %22 = trunc i32 %21 to i8
  %23 = call i32 @declareVariable(ptr noundef @semStack, ptr noundef %15, i1 noundef zeroext %17, ptr noundef %18, i8 noundef zeroext %22)
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp eq i32 %24, 4
  br i1 %25, label %26, label %27

26:                                               ; preds = %13
  call void @handleError(i32 noundef 4) #12
  unreachable

27:                                               ; preds = %13
  %28 = load i32, ptr %7, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  call void @handleError(i32 noundef 99) #12
  unreachable

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31, %12
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @getTypeMask(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  switch i32 %4, label %9 [
    i32 46, label %5
    i32 48, label %6
    i32 50, label %7
    i32 34, label %8
    i32 33, label %8
  ]

5:                                                ; preds = %1
  store i32 2, ptr %2, align 4
  br label %10

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %10

7:                                                ; preds = %1
  store i32 4, ptr %2, align 4
  br label %10

8:                                                ; preds = %1, %1
  store i32 5, ptr %2, align 4
  br label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %9, %8, %7, %6, %5
  %11 = load i32, ptr %2, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semCheckVar(ptr noundef %0, i1 noundef zeroext %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  %7 = zext i1 %1 to i8
  store i8 %7, ptr %5, align 1
  store ptr %2, ptr %6, align 8
  %8 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %3
  br label %54

12:                                               ; preds = %3
  %13 = load i8, ptr %5, align 1
  %14 = trunc i8 %13 to i1
  br i1 %14, label %15, label %27

15:                                               ; preds = %12
  %16 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %17)
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %27

20:                                               ; preds = %15
  %21 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.AstNode, ptr %23, i32 0, i32 6
  %25 = call i32 @lookupSetter(ptr noundef @semStack, ptr noundef %22, ptr noundef %24)
  %26 = icmp eq i32 %25, 3
  br i1 %26, label %42, label %27

27:                                               ; preds = %20, %15, %12
  %28 = load i8, ptr %5, align 1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %54, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %32)
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %54

35:                                               ; preds = %30
  %36 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.AstNode, ptr %38, i32 0, i32 6
  %40 = call i32 @lookupGetter(ptr noundef @semStack, ptr noundef %37, ptr noundef %39)
  %41 = icmp eq i32 %40, 3
  br i1 %41, label %42, label %54

42:                                               ; preds = %35, %20
  %43 = load i8, ptr %5, align 1
  %44 = trunc i8 %43 to i1
  br i1 %44, label %45, label %49

45:                                               ; preds = %42
  %46 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = load ptr, ptr %6, align 8
  call void @regCall(ptr noundef %47, i32 noundef -2, ptr noundef %48)
  br label %53

49:                                               ; preds = %42
  %50 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %6, align 8
  call void @regCall(ptr noundef %51, i32 noundef -1, ptr noundef %52)
  br label %53

53:                                               ; preds = %49, %45
  br label %54

54:                                               ; preds = %53, %35, %30, %27, %11
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semCheckAssign(ptr noundef %0, i8 noundef zeroext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %6 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %2
  br label %30

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = call ptr @findSymbol(ptr noundef @semStack, ptr noundef %12)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %20, label %16

16:                                               ; preds = %10
  %17 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.10.388, ptr noundef %18)
  call void @handleError(i32 noundef 3) #12
  unreachable

20:                                               ; preds = %10
  %21 = load i8, ptr %4, align 1
  %22 = zext i8 %21 to i32
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.Symbol, ptr %23, i32 0, i32 3
  %25 = load i8, ptr %24, align 2
  %26 = zext i8 %25 to i32
  %27 = and i32 %22, %26
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %30, label %29

29:                                               ; preds = %20
  call void @handleError(i32 noundef 6) #12
  unreachable

30:                                               ; preds = %20, %9
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semGtr(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = call i32 @getTypeMask(i32 noundef %6)
  %8 = trunc i32 %7 to i8
  %9 = call i32 @declareGetter(ptr noundef @semStack, ptr noundef %4, i8 noundef zeroext %8)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semStr(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = call i32 @getTypeMask(i32 noundef %6)
  %8 = trunc i32 %7 to i8
  %9 = call i32 @declareSetter(ptr noundef @semStack, ptr noundef %4, i8 noundef zeroext %8)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semFnc(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  br label %24

11:                                               ; preds = %2
  store ptr null, ptr %5, align 8
  %12 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %4, align 4
  %15 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef %13, i32 noundef %14, i1 noundef zeroext true, ptr noundef %5)
  store i32 %15, ptr %6, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp eq i32 %16, 4
  br i1 %17, label %18, label %19

18:                                               ; preds = %11
  call void @handleError(i32 noundef 4) #12
  unreachable

19:                                               ; preds = %11
  %20 = load i32, ptr %6, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  call void @handleError(i32 noundef 99) #12
  unreachable

23:                                               ; preds = %19
  br label %24

24:                                               ; preds = %23, %10
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semCheckFnc(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  br label %43

12:                                               ; preds = %2
  store ptr null, ptr %5, align 8
  %13 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = load i32, ptr %4, align 4
  %16 = call i32 @lookupFunction(ptr noundef @semStack, ptr noundef %14, i32 noundef %15, ptr noundef %5)
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %19, label %33

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.Token, ptr %0, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %4, align 4
  %23 = call i32 @declareFunction(ptr noundef @semStack, ptr noundef %21, i32 noundef %22, i1 noundef zeroext false, ptr noundef %5)
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp eq i32 %24, 4
  br i1 %25, label %26, label %27

26:                                               ; preds = %19
  call void @handleError(i32 noundef 4) #12
  unreachable

27:                                               ; preds = %19
  %28 = load i32, ptr %7, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  call void @handleError(i32 noundef 99) #12
  unreachable

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31
  br label %43

33:                                               ; preds = %12
  %34 = load i32, ptr %6, align 4
  %35 = icmp eq i32 %34, 5
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @handleError(i32 noundef 5) #12
  unreachable

37:                                               ; preds = %33
  %38 = load i32, ptr %6, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  call void @handleError(i32 noundef 99) #12
  unreachable

41:                                               ; preds = %37
  br label %42

42:                                               ; preds = %41
  br label %43

43:                                               ; preds = %42, %32, %11
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semClean() #0 {
  call void @freeScope(ptr noundef @semStack)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @initStack(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = mul i64 %5, 8
  %7 = call ptr @malloc(i64 noundef %6) #11
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.AstNodeStack, ptr %8, i32 0, i32 0
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.AstNodeStack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load i8, ptr @__debug, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  call void @printDebug(ptr noundef @.str.399)
  br label %18

18:                                               ; preds = %17, %14
  call void @handleError(i32 noundef 99) #12
  unreachable

19:                                               ; preds = %2
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.AstNodeStack, ptr %20, i32 0, i32 1
  store i64 0, ptr %21, align 8
  %22 = load i64, ptr %4, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.AstNodeStack, ptr %23, i32 0, i32 2
  store i64 %22, ptr %24, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @resizeStack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.AstNodeStack, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = mul i64 %7, 2
  store i64 %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.AstNodeStack, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load i64, ptr %3, align 8
  %13 = mul i64 %12, 8
  %14 = call ptr @realloc(ptr noundef %11, i64 noundef %13) #13
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %1
  %18 = load i8, ptr @__debug, align 1
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @printDebug(ptr noundef @.str.1.400)
  br label %21

21:                                               ; preds = %20, %17
  call void @handleError(i32 noundef 99) #12
  unreachable

22:                                               ; preds = %1
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.AstNodeStack, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load i64, ptr %3, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.AstNodeStack, ptr %27, i32 0, i32 2
  store i64 %26, ptr %28, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @push(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.AstNodeStack, ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.AstNodeStack, ptr %8, i32 0, i32 2
  %10 = load i64, ptr %9, align 8
  %11 = sub i64 %10, 1
  %12 = icmp eq i64 %7, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = load ptr, ptr %3, align 8
  call void @resizeStack(ptr noundef %14)
  br label %15

15:                                               ; preds = %13, %2
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.AstNodeStack, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.AstNodeStack, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = getelementptr inbounds ptr, ptr %19, i64 %22
  store ptr %16, ptr %24, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @top(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.AstNodeStack, ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load i8, ptr @__debug, align 1
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  call void @printDebug(ptr noundef @.str.2.405)
  br label %13

13:                                               ; preds = %12, %9
  call void @handleError(i32 noundef 2) #12
  unreachable

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.AstNodeStack, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.AstNodeStack, ptr %18, i32 0, i32 1
  %20 = load i64, ptr %19, align 8
  %21 = sub i64 %20, 1
  %22 = getelementptr inbounds ptr, ptr %17, i64 %21
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %4, align 8
  store ptr %23, ptr %24, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @pop(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.AstNodeStack, ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %20

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.AstNodeStack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.AstNodeStack, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = add i64 %15, -1
  store i64 %16, ptr %14, align 8
  %17 = getelementptr inbounds ptr, ptr %12, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %4, align 8
  store ptr %18, ptr %19, align 8
  br label %20

20:                                               ; preds = %9, %2
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i1 @isEmpty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.AstNodeStack, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = icmp eq i64 %5, 0
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @emptyStack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = call ptr @createAstNode(i32 noundef 0)
  store ptr %4, ptr %3, align 8
  br label %5

5:                                                ; preds = %9, %1
  %6 = load ptr, ptr %2, align 8
  %7 = call zeroext i1 @isEmpty(ptr noundef %6)
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = load ptr, ptr %2, align 8
  call void @pop(ptr noundef %10, ptr noundef %3)
  br label %5

11:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @freeStack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.AstNodeStack, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @initScope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call ptr @malloc(i64 noundef 8) #11
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AstNodeStack, ptr %4, i32 0, i32 0
  store ptr %3, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.AstNodeStack, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @handleError(i32 noundef 99) #12
  unreachable

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.AstNodeStack, ptr %12, i32 0, i32 2
  store i64 1, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.AstNodeStack, ptr %14, i32 0, i32 1
  store i64 0, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  call void @pushScope(ptr noundef %16)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @pushScope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AstNodeStack, ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.AstNodeStack, ptr %7, i32 0, i32 2
  %9 = load i64, ptr %8, align 8
  %10 = icmp eq i64 %6, %9
  br i1 %10, label %11, label %33

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.AstNodeStack, ptr %12, i32 0, i32 2
  %14 = load i64, ptr %13, align 8
  %15 = mul i64 %14, 2
  store i64 %15, ptr %13, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.AstNodeStack, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.AstNodeStack, ptr %19, i32 0, i32 2
  %21 = load i64, ptr %20, align 8
  %22 = mul i64 8, %21
  %23 = call ptr @realloc(ptr noundef %18, i64 noundef %22) #13
  store ptr %23, ptr %3, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %11
  %27 = load ptr, ptr %2, align 8
  call void @freeScope(ptr noundef %27)
  call void @handleError(i32 noundef 99) #12
  unreachable

28:                                               ; No predecessors!
  br label %46

29:                                               ; preds = %11
  %30 = load ptr, ptr %3, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %struct.AstNodeStack, ptr %31, i32 0, i32 0
  store ptr %30, ptr %32, align 8
  br label %33

33:                                               ; preds = %29, %1
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.AstNodeStack, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds %struct.AstNodeStack, ptr %37, i32 0, i32 1
  %39 = load i64, ptr %38, align 8
  %40 = getelementptr inbounds %struct.Ast, ptr %36, i64 %39
  %41 = getelementptr inbounds %struct.Ast, ptr %40, i32 0, i32 0
  store ptr null, ptr %41, align 8
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds %struct.AstNodeStack, ptr %42, i32 0, i32 1
  %44 = load i64, ptr %43, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %43, align 8
  br label %46

46:                                               ; preds = %33, %28
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @freeScope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %4

4:                                                ; preds = %16, %1
  %5 = load i64, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.AstNodeStack, ptr %6, i32 0, i32 1
  %8 = load i64, ptr %7, align 8
  %9 = icmp ult i64 %5, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.AstNodeStack, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = load i64, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Ast, ptr %13, i64 %14
  call void @clearSymtable(ptr noundef %15)
  br label %16

16:                                               ; preds = %10
  %17 = load i64, ptr %3, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr %3, align 8
  br label %4

19:                                               ; preds = %4
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.AstNodeStack, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  call void @free(ptr noundef %22)
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.AstNodeStack, ptr %23, i32 0, i32 0
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.AstNodeStack, ptr %25, i32 0, i32 2
  store i64 0, ptr %26, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.AstNodeStack, ptr %27, i32 0, i32 1
  store i64 0, ptr %28, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @clearSymtable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Ast, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %5, %1
  br label %17

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.Ast, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @freeTree(ptr noundef %14)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Ast, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %10
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @freeTree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %16

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.AVLNode, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  call void @freeTree(ptr noundef %8)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.AVLNode, ptr %9, i32 0, i32 3
  %11 = load ptr, ptr %10, align 8
  call void @freeTree(ptr noundef %11)
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.AVLNode, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %15)
  br label %16

16:                                               ; preds = %5, %1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @topScope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.AstNodeStack, ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %18

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.AstNodeStack, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.AstNodeStack, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = sub i64 %15, 1
  %17 = getelementptr inbounds %struct.Ast, ptr %12, i64 %16
  store ptr %17, ptr %2, align 8
  br label %18

18:                                               ; preds = %9, %8
  %19 = load ptr, ptr %2, align 8
  ret ptr %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @popScope(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.AstNodeStack, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %7, label %14

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = call ptr @topScope(ptr noundef %8)
  call void @clearSymtable(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AstNodeStack, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  %13 = add i64 %12, -1
  store i64 %13, ptr %11, align 8
  br label %14

14:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @declareVariable(ptr noundef %0, ptr noundef %1, i1 noundef zeroext %2, ptr noundef %3, i8 noundef zeroext %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  %15 = zext i1 %2 to i8
  store i8 %15, ptr %8, align 1
  store ptr %3, ptr %9, align 8
  store i8 %4, ptr %10, align 1
  %16 = load i8, ptr %8, align 1
  %17 = trunc i8 %16 to i1
  br i1 %17, label %18, label %23

18:                                               ; preds = %5
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.AstNodeStack, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.Ast, ptr %21, i64 0
  br label %26

23:                                               ; preds = %5
  %24 = load ptr, ptr %6, align 8
  %25 = call ptr @topScope(ptr noundef %24)
  br label %26

26:                                               ; preds = %23, %18
  %27 = phi ptr [ %22, %18 ], [ %25, %23 ]
  store ptr %27, ptr %11, align 8
  %28 = call ptr @malloc(i64 noundef 16) #11
  store ptr %28, ptr %12, align 8
  %29 = load ptr, ptr %12, align 8
  %30 = icmp eq ptr %29, null
  br i1 %30, label %31, label %32

31:                                               ; preds = %26
  call void @handleError(i32 noundef 99) #12
  unreachable

32:                                               ; preds = %26
  %33 = load ptr, ptr %12, align 8
  %34 = getelementptr inbounds %struct.Symbol, ptr %33, i32 0, i32 2
  store i8 0, ptr %34, align 1
  %35 = load ptr, ptr %12, align 8
  %36 = getelementptr inbounds %struct.Symbol, ptr %35, i32 0, i32 1
  store i8 0, ptr %36, align 4
  %37 = load i8, ptr %8, align 1
  %38 = trunc i8 %37 to i1
  %39 = zext i1 %38 to i64
  %40 = select i1 %38, i32 1, i32 2
  %41 = load ptr, ptr %12, align 8
  %42 = getelementptr inbounds %struct.Symbol, ptr %41, i32 0, i32 0
  store i32 %40, ptr %42, align 8
  %43 = load i8, ptr %10, align 1
  %44 = load ptr, ptr %12, align 8
  %45 = getelementptr inbounds %struct.Symbol, ptr %44, i32 0, i32 3
  store i8 %43, ptr %45, align 2
  %46 = load ptr, ptr %11, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = call ptr @findInSymtable(ptr noundef %46, ptr noundef %47)
  %49 = icmp eq ptr %48, null
  br i1 %49, label %50, label %94

50:                                               ; preds = %32
  %51 = load i64, ptr @varCounter, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @varCounter, align 8
  %53 = load ptr, ptr %7, align 8
  %54 = call i64 @strlen(ptr noundef %53) #14
  %55 = add i64 3, %54
  %56 = add i64 %55, 1
  %57 = add i64 %56, 20
  %58 = add i64 %57, 1
  %59 = mul i64 1, %58
  %60 = call ptr @malloc(i64 noundef %59) #11
  %61 = load ptr, ptr %12, align 8
  %62 = getelementptr inbounds %struct.Symbol, ptr %61, i32 0, i32 4
  store ptr %60, ptr %62, align 8
  %63 = load ptr, ptr %12, align 8
  %64 = getelementptr inbounds %struct.Symbol, ptr %63, i32 0, i32 4
  %65 = load ptr, ptr %64, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %67, label %68

67:                                               ; preds = %50
  call void @handleError(i32 noundef 99) #12
  unreachable

68:                                               ; preds = %50
  %69 = load i8, ptr %8, align 1
  %70 = trunc i8 %69 to i1
  br i1 %70, label %71, label %82

71:                                               ; preds = %68
  %72 = load ptr, ptr %12, align 8
  %73 = getelementptr inbounds %struct.Symbol, ptr %72, i32 0, i32 4
  %74 = load ptr, ptr %73, align 8
  %75 = load ptr, ptr %12, align 8
  %76 = getelementptr inbounds %struct.Symbol, ptr %75, i32 0, i32 4
  %77 = load ptr, ptr %76, align 8
  %78 = call i64 @llvm.objectsize.i64.p0(ptr %77, i1 false, i1 true, i1 false)
  %79 = load ptr, ptr %7, align 8
  %80 = load i64, ptr @varCounter, align 8
  %81 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %74, i32 noundef 0, i64 noundef %78, ptr noundef @.str.424, ptr noundef %79, i64 noundef %80)
  br label %93

82:                                               ; preds = %68
  %83 = load ptr, ptr %12, align 8
  %84 = getelementptr inbounds %struct.Symbol, ptr %83, i32 0, i32 4
  %85 = load ptr, ptr %84, align 8
  %86 = load ptr, ptr %12, align 8
  %87 = getelementptr inbounds %struct.Symbol, ptr %86, i32 0, i32 4
  %88 = load ptr, ptr %87, align 8
  %89 = call i64 @llvm.objectsize.i64.p0(ptr %88, i1 false, i1 true, i1 false)
  %90 = load ptr, ptr %7, align 8
  %91 = load i64, ptr @varCounter, align 8
  %92 = call i32 (ptr, i32, i64, ptr, ...) @__sprintf_chk(ptr noundef %85, i32 noundef 0, i64 noundef %89, ptr noundef @.str.1.425, ptr noundef %90, i64 noundef %91)
  br label %93

93:                                               ; preds = %82, %71
  br label %95

94:                                               ; preds = %32
  call void @handleError(i32 noundef 4) #12
  unreachable

95:                                               ; preds = %93
  store i8 0, ptr %13, align 1
  %96 = load ptr, ptr %11, align 8
  %97 = load ptr, ptr %7, align 8
  %98 = load ptr, ptr %12, align 8
  %99 = call i32 @insertSymtable(ptr noundef %96, ptr noundef %97, ptr noundef %98, ptr noundef %13)
  store i32 %99, ptr %14, align 4
  %100 = load ptr, ptr %9, align 8
  %101 = icmp ne ptr %100, null
  br i1 %101, label %102, label %107

102:                                              ; preds = %95
  %103 = load ptr, ptr %11, align 8
  %104 = load ptr, ptr %7, align 8
  %105 = call ptr @findInSymtable(ptr noundef %103, ptr noundef %104)
  %106 = load ptr, ptr %9, align 8
  store ptr %105, ptr %106, align 8
  br label %107

107:                                              ; preds = %102, %95
  %108 = load i32, ptr %14, align 4
  ret i32 %108
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @findInSymtable(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.Ast, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %8, %2
  store ptr null, ptr %3, align 8
  br label %20

14:                                               ; preds = %8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.Ast, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = call ptr @findNode(ptr noundef %17, ptr noundef %18)
  store ptr %19, ptr %3, align 8
  br label %20

20:                                               ; preds = %14, %13
  %21 = load ptr, ptr %3, align 8
  ret ptr %21
}

declare i32 @__sprintf_chk(ptr noundef, i32 noundef, i64 noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @insertSymtable(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %26

12:                                               ; preds = %4
  %13 = load ptr, ptr %6, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %26

15:                                               ; preds = %12
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.Ast, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = call ptr @insertNode(ptr noundef %18, ptr noundef %19, ptr noundef %20, ptr noundef %21)
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.Ast, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  ret i32 0

26:                                               ; preds = %12, %4
  call void @handleError(i32 noundef 99) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @insertNode(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
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
  %12 = load ptr, ptr %6, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %53

14:                                               ; preds = %4
  %15 = call ptr @malloc(i64 noundef 40) #11
  store ptr %15, ptr %10, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  call void @handleError(i32 noundef 99) #12
  unreachable

19:                                               ; preds = %14
  %20 = load ptr, ptr %7, align 8
  %21 = call i64 @strlen(ptr noundef %20) #14
  %22 = add i64 %21, 1
  %23 = mul i64 1, %22
  %24 = call ptr @malloc(i64 noundef %23) #11
  store ptr %24, ptr %11, align 8
  %25 = load ptr, ptr %11, align 8
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %19
  %28 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %28)
  call void @handleError(i32 noundef 99) #12
  unreachable

29:                                               ; preds = %19
  %30 = load ptr, ptr %11, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = call i64 @strlen(ptr noundef %32) #14
  %34 = add i64 %33, 1
  %35 = mul i64 1, %34
  %36 = load ptr, ptr %11, align 8
  %37 = call i64 @llvm.objectsize.i64.p0(ptr %36, i1 false, i1 true, i1 false)
  %38 = call ptr @__memcpy_chk(ptr noundef %30, ptr noundef %31, i64 noundef %35, i64 noundef %37) #14
  %39 = load ptr, ptr %8, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = getelementptr inbounds %struct.AVLNode, ptr %40, i32 0, i32 1
  store ptr %39, ptr %41, align 8
  %42 = load ptr, ptr %10, align 8
  %43 = getelementptr inbounds %struct.AVLNode, ptr %42, i32 0, i32 4
  store i32 1, ptr %43, align 8
  %44 = load ptr, ptr %11, align 8
  %45 = load ptr, ptr %10, align 8
  %46 = getelementptr inbounds %struct.AVLNode, ptr %45, i32 0, i32 0
  store ptr %44, ptr %46, align 8
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr inbounds %struct.AVLNode, ptr %47, i32 0, i32 2
  store ptr null, ptr %48, align 8
  %49 = load ptr, ptr %10, align 8
  %50 = getelementptr inbounds %struct.AVLNode, ptr %49, i32 0, i32 3
  store ptr null, ptr %50, align 8
  %51 = load ptr, ptr %9, align 8
  store i8 1, ptr %51, align 1
  %52 = load ptr, ptr %10, align 8
  store ptr %52, ptr %5, align 8
  br label %99

53:                                               ; preds = %4
  %54 = load ptr, ptr %7, align 8
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr inbounds %struct.AVLNode, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = call i32 @strcmp(ptr noundef %54, ptr noundef %57) #14
  %59 = icmp slt i32 %58, 0
  br i1 %59, label %60, label %70

60:                                               ; preds = %53
  %61 = load ptr, ptr %6, align 8
  %62 = getelementptr inbounds %struct.AVLNode, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %62, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = load ptr, ptr %8, align 8
  %66 = load ptr, ptr %9, align 8
  %67 = call ptr @insertNode(ptr noundef %63, ptr noundef %64, ptr noundef %65, ptr noundef %66)
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.AVLNode, ptr %68, i32 0, i32 2
  store ptr %67, ptr %69, align 8
  br label %91

70:                                               ; preds = %53
  %71 = load ptr, ptr %7, align 8
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.AVLNode, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  %75 = call i32 @strcmp(ptr noundef %71, ptr noundef %74) #14
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %87

77:                                               ; preds = %70
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.AVLNode, ptr %78, i32 0, i32 3
  %80 = load ptr, ptr %79, align 8
  %81 = load ptr, ptr %7, align 8
  %82 = load ptr, ptr %8, align 8
  %83 = load ptr, ptr %9, align 8
  %84 = call ptr @insertNode(ptr noundef %80, ptr noundef %81, ptr noundef %82, ptr noundef %83)
  %85 = load ptr, ptr %6, align 8
  %86 = getelementptr inbounds %struct.AVLNode, ptr %85, i32 0, i32 3
  store ptr %84, ptr %86, align 8
  br label %90

87:                                               ; preds = %70
  %88 = load ptr, ptr %9, align 8
  store i8 0, ptr %88, align 1
  %89 = load ptr, ptr %6, align 8
  store ptr %89, ptr %5, align 8
  br label %99

90:                                               ; preds = %77
  br label %91

91:                                               ; preds = %90, %60
  br label %92

92:                                               ; preds = %91
  %93 = load ptr, ptr %6, align 8
  %94 = call i32 @updateHeight(ptr noundef %93)
  %95 = load ptr, ptr %6, align 8
  %96 = getelementptr inbounds %struct.AVLNode, ptr %95, i32 0, i32 4
  store i32 %94, ptr %96, align 8
  %97 = load ptr, ptr %6, align 8
  %98 = call ptr @rebalance(ptr noundef %97)
  store ptr %98, ptr %5, align 8
  br label %99

99:                                               ; preds = %92, %87, %29
  %100 = load ptr, ptr %5, align 8
  ret ptr %100
}

; Function Attrs: nounwind
declare ptr @__memcpy_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @updateHeight(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %35

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.AVLNode, ptr %8, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 @nodeHeight(ptr noundef %10)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.AVLNode, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @nodeHeight(ptr noundef %14)
  %16 = icmp sgt i32 %11, %15
  br i1 %16, label %17, label %22

17:                                               ; preds = %7
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.AVLNode, ptr %18, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @nodeHeight(ptr noundef %20)
  br label %27

22:                                               ; preds = %7
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.AVLNode, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 @nodeHeight(ptr noundef %25)
  br label %27

27:                                               ; preds = %22, %17
  %28 = phi i32 [ %21, %17 ], [ %26, %22 ]
  %29 = add nsw i32 %28, 1
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.AVLNode, ptr %30, i32 0, i32 4
  store i32 %29, ptr %31, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.AVLNode, ptr %32, i32 0, i32 4
  %34 = load i32, ptr %33, align 8
  store i32 %34, ptr %2, align 4
  br label %35

35:                                               ; preds = %27, %6
  %36 = load i32, ptr %2, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @rebalance(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call i32 @balanceFactor(ptr noundef %5)
  store i32 %6, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sge i32 %7, -1
  br i1 %8, label %9, label %14

9:                                                ; preds = %1
  %10 = load i32, ptr %4, align 4
  %11 = icmp sle i32 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = load ptr, ptr %3, align 8
  store ptr %13, ptr %2, align 8
  br label %58

14:                                               ; preds = %9, %1
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %17, label %35

17:                                               ; preds = %14
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.AVLNode, ptr %18, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @balanceFactor(ptr noundef %20)
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %17
  %24 = load ptr, ptr %3, align 8
  %25 = call ptr @rotateLeft(ptr noundef %24)
  store ptr %25, ptr %2, align 8
  br label %58

26:                                               ; preds = %17
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.AVLNode, ptr %27, i32 0, i32 3
  %29 = load ptr, ptr %28, align 8
  %30 = call ptr @rotateRight(ptr noundef %29)
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.AVLNode, ptr %31, i32 0, i32 3
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = call ptr @rotateLeft(ptr noundef %33)
  store ptr %34, ptr %2, align 8
  br label %58

35:                                               ; preds = %14
  %36 = load i32, ptr %4, align 4
  %37 = icmp slt i32 %36, -1
  br i1 %37, label %38, label %56

38:                                               ; preds = %35
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.AVLNode, ptr %39, i32 0, i32 2
  %41 = load ptr, ptr %40, align 8
  %42 = call i32 @balanceFactor(ptr noundef %41)
  %43 = icmp sle i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %38
  %45 = load ptr, ptr %3, align 8
  %46 = call ptr @rotateRight(ptr noundef %45)
  store ptr %46, ptr %2, align 8
  br label %58

47:                                               ; preds = %38
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.AVLNode, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  %51 = call ptr @rotateLeft(ptr noundef %50)
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.AVLNode, ptr %52, i32 0, i32 2
  store ptr %51, ptr %53, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = call ptr @rotateRight(ptr noundef %54)
  store ptr %55, ptr %2, align 8
  br label %58

56:                                               ; preds = %35
  %57 = load ptr, ptr %3, align 8
  store ptr %57, ptr %2, align 8
  br label %58

58:                                               ; preds = %56, %47, %44, %26, %23, %12
  %59 = load ptr, ptr %2, align 8
  ret ptr %59
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @balanceFactor(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.AVLNode, ptr %3, i32 0, i32 3
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 @nodeHeight(ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.AVLNode, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @nodeHeight(ptr noundef %9)
  %11 = sub nsw i32 %6, %10
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @rotateLeft(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AVLNode, ptr %4, i32 0, i32 3
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.AVLNode, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AVLNode, ptr %10, i32 0, i32 3
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.AVLNode, ptr %13, i32 0, i32 2
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @updateHeight(ptr noundef %15)
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.AVLNode, ptr %17, i32 0, i32 4
  store i32 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @updateHeight(ptr noundef %19)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.AVLNode, ptr %21, i32 0, i32 4
  store i32 %20, ptr %22, align 8
  %23 = load ptr, ptr %3, align 8
  ret ptr %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @rotateRight(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AVLNode, ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.AVLNode, ptr %7, i32 0, i32 3
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AVLNode, ptr %10, i32 0, i32 2
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.AVLNode, ptr %13, i32 0, i32 3
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @updateHeight(ptr noundef %15)
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.AVLNode, ptr %17, i32 0, i32 4
  store i32 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @updateHeight(ptr noundef %19)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.AVLNode, ptr %21, i32 0, i32 4
  store i32 %20, ptr %22, align 8
  %23 = load ptr, ptr %3, align 8
  ret ptr %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @nodeHeight(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.AVLNode, ptr %6, i32 0, i32 4
  %8 = load i32, ptr %7, align 8
  br label %10

9:                                                ; preds = %1
  br label %10

10:                                               ; preds = %9, %5
  %11 = phi i32 [ %8, %5 ], [ 0, %9 ]
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @findNode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store ptr null, ptr %3, align 8
  br label %49

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.AVLNode, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @strcmp(ptr noundef %10, ptr noundef %13) #14
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %22

16:                                               ; preds = %9
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.AVLNode, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = call ptr @findNode(ptr noundef %19, ptr noundef %20)
  store ptr %21, ptr %3, align 8
  br label %49

22:                                               ; preds = %9
  %23 = load ptr, ptr %5, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.AVLNode, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @strcmp(ptr noundef %23, ptr noundef %26) #14
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %22
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AVLNode, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = call ptr @findNode(ptr noundef %32, ptr noundef %33)
  store ptr %34, ptr %3, align 8
  br label %49

35:                                               ; preds = %22
  %36 = load ptr, ptr %5, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.AVLNode, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @strcmp(ptr noundef %36, ptr noundef %39) #14
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %46

42:                                               ; preds = %35
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.AVLNode, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  store ptr %45, ptr %3, align 8
  br label %49

46:                                               ; preds = %35
  br label %47

47:                                               ; preds = %46
  br label %48

48:                                               ; preds = %47
  store ptr null, ptr %3, align 8
  br label %49

49:                                               ; preds = %48, %42, %29, %16, %8
  %50 = load ptr, ptr %3, align 8
  ret ptr %50
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @declareFunction(ptr noundef %0, ptr noundef %1, i32 noundef %2, i1 noundef zeroext %3, ptr noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca [256 x i8], align 1
  %13 = alloca ptr, align 8
  %14 = alloca i8, align 1
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  %17 = zext i1 %3 to i8
  store i8 %17, ptr %10, align 1
  store ptr %4, ptr %11, align 8
  %18 = load i8, ptr @__debug, align 1
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %22

20:                                               ; preds = %5
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2.428)
  br label %22

22:                                               ; preds = %20, %5
  %23 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %24 = load ptr, ptr %8, align 8
  %25 = load i32, ptr %9, align 4
  %26 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %23, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.3.429, ptr noundef %24, i32 noundef %25)
  %27 = call ptr @malloc(i64 noundef 16) #11
  store ptr %27, ptr %13, align 8
  %28 = load ptr, ptr %13, align 8
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %31

30:                                               ; preds = %22
  call void @handleError(i32 noundef 99) #12
  unreachable

31:                                               ; preds = %22
  %32 = load i8, ptr %10, align 1
  %33 = trunc i8 %32 to i1
  %34 = load ptr, ptr %13, align 8
  %35 = getelementptr inbounds %struct.Symbol, ptr %34, i32 0, i32 2
  %36 = zext i1 %33 to i8
  store i8 %36, ptr %35, align 1
  %37 = load ptr, ptr %13, align 8
  %38 = getelementptr inbounds %struct.Symbol, ptr %37, i32 0, i32 1
  store i8 0, ptr %38, align 4
  %39 = load ptr, ptr %13, align 8
  %40 = getelementptr inbounds %struct.Symbol, ptr %39, i32 0, i32 0
  store i32 0, ptr %40, align 8
  %41 = load ptr, ptr %13, align 8
  %42 = getelementptr inbounds %struct.Symbol, ptr %41, i32 0, i32 3
  store i8 0, ptr %42, align 2
  %43 = load ptr, ptr %13, align 8
  %44 = getelementptr inbounds %struct.Symbol, ptr %43, i32 0, i32 4
  store ptr null, ptr %44, align 8
  store i8 0, ptr %14, align 1
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.AstNodeStack, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.Ast, ptr %47, i64 0
  %49 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %50 = load ptr, ptr %13, align 8
  %51 = call i32 @insertSymtable(ptr noundef %48, ptr noundef %49, ptr noundef %50, ptr noundef %14)
  store i32 %51, ptr %15, align 4
  %52 = load i8, ptr %14, align 1
  %53 = trunc i8 %52 to i1
  br i1 %53, label %81, label %54

54:                                               ; preds = %31
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds %struct.AstNodeStack, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.Ast, ptr %57, i64 0
  %59 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %60 = call ptr @findInSymtable(ptr noundef %58, ptr noundef %59)
  store ptr %60, ptr %16, align 8
  %61 = load ptr, ptr %16, align 8
  %62 = getelementptr inbounds %struct.Symbol, ptr %61, i32 0, i32 2
  %63 = load i8, ptr %62, align 1
  %64 = trunc i8 %63 to i1
  %65 = zext i1 %64 to i32
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %68

67:                                               ; preds = %54
  call void @handleError(i32 noundef 4) #12
  unreachable

68:                                               ; preds = %54
  %69 = load i8, ptr %10, align 1
  %70 = trunc i8 %69 to i1
  %71 = load ptr, ptr %16, align 8
  %72 = getelementptr inbounds %struct.Symbol, ptr %71, i32 0, i32 2
  %73 = zext i1 %70 to i8
  store i8 %73, ptr %72, align 1
  %74 = load ptr, ptr %11, align 8
  %75 = icmp ne ptr %74, null
  br i1 %75, label %76, label %79

76:                                               ; preds = %68
  %77 = load ptr, ptr %16, align 8
  %78 = load ptr, ptr %11, align 8
  store ptr %77, ptr %78, align 8
  br label %79

79:                                               ; preds = %76, %68
  %80 = load i32, ptr %15, align 4
  store i32 %80, ptr %6, align 4
  br label %94

81:                                               ; preds = %31
  %82 = load ptr, ptr %11, align 8
  %83 = icmp ne ptr %82, null
  br i1 %83, label %84, label %92

84:                                               ; preds = %81
  %85 = load ptr, ptr %7, align 8
  %86 = getelementptr inbounds %struct.AstNodeStack, ptr %85, i32 0, i32 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds %struct.Ast, ptr %87, i64 0
  %89 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %90 = call ptr @findInSymtable(ptr noundef %88, ptr noundef %89)
  %91 = load ptr, ptr %11, align 8
  store ptr %90, ptr %91, align 8
  br label %92

92:                                               ; preds = %84, %81
  %93 = load i32, ptr %15, align 4
  store i32 %93, ptr %6, align 4
  br label %94

94:                                               ; preds = %92, %79
  %95 = load i32, ptr %6, align 4
  ret i32 %95
}

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @declareSetter(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca [256 x i8], align 1
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  store i8 0, ptr %7, align 1
  %11 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %11, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.4.432, ptr noundef %12)
  %14 = call ptr @malloc(i64 noundef 16) #11
  store ptr %14, ptr %9, align 8
  %15 = load ptr, ptr %9, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  call void @handleError(i32 noundef 99) #12
  unreachable

18:                                               ; preds = %3
  %19 = load ptr, ptr %9, align 8
  %20 = getelementptr inbounds %struct.Symbol, ptr %19, i32 0, i32 2
  store i8 0, ptr %20, align 1
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.Symbol, ptr %21, i32 0, i32 1
  store i8 0, ptr %22, align 4
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.Symbol, ptr %23, i32 0, i32 0
  store i32 4, ptr %24, align 8
  %25 = load i8, ptr %6, align 1
  %26 = load ptr, ptr %9, align 8
  %27 = getelementptr inbounds %struct.Symbol, ptr %26, i32 0, i32 3
  store i8 %25, ptr %27, align 2
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr inbounds %struct.Symbol, ptr %28, i32 0, i32 4
  store ptr null, ptr %29, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AstNodeStack, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.Ast, ptr %32, i64 0
  %34 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %35 = load ptr, ptr %9, align 8
  %36 = call i32 @insertSymtable(ptr noundef %33, ptr noundef %34, ptr noundef %35, ptr noundef %7)
  store i32 %36, ptr %10, align 4
  %37 = load i8, ptr %7, align 1
  %38 = trunc i8 %37 to i1
  br i1 %38, label %40, label %39

39:                                               ; preds = %18
  call void @handleError(i32 noundef 4) #12
  unreachable

40:                                               ; preds = %18
  %41 = load i32, ptr %10, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @declareGetter(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca [256 x i8], align 1
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  store i8 0, ptr %7, align 1
  %11 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %11, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.5.435, ptr noundef %12)
  %14 = call ptr @malloc(i64 noundef 16) #11
  store ptr %14, ptr %9, align 8
  %15 = load ptr, ptr %9, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  call void @handleError(i32 noundef 99) #12
  unreachable

18:                                               ; preds = %3
  %19 = load ptr, ptr %9, align 8
  %20 = getelementptr inbounds %struct.Symbol, ptr %19, i32 0, i32 2
  store i8 0, ptr %20, align 1
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.Symbol, ptr %21, i32 0, i32 1
  store i8 0, ptr %22, align 4
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.Symbol, ptr %23, i32 0, i32 0
  store i32 3, ptr %24, align 8
  %25 = load i8, ptr %6, align 1
  %26 = load ptr, ptr %9, align 8
  %27 = getelementptr inbounds %struct.Symbol, ptr %26, i32 0, i32 3
  store i8 %25, ptr %27, align 2
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr inbounds %struct.Symbol, ptr %28, i32 0, i32 4
  store ptr null, ptr %29, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AstNodeStack, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.Ast, ptr %32, i64 0
  %34 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %35 = load ptr, ptr %9, align 8
  %36 = call i32 @insertSymtable(ptr noundef %33, ptr noundef %34, ptr noundef %35, ptr noundef %7)
  store i32 %36, ptr %10, align 4
  %37 = load i8, ptr %7, align 1
  %38 = trunc i8 %37 to i1
  br i1 %38, label %40, label %39

39:                                               ; preds = %18
  call void @handleError(i32 noundef 4) #12
  unreachable

40:                                               ; preds = %18
  %41 = load i32, ptr %10, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @findSymbol(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.AstNodeStack, ptr %8, i32 0, i32 1
  %10 = load i64, ptr %9, align 8
  store i64 %10, ptr %6, align 8
  br label %11

11:                                               ; preds = %28, %2
  %12 = load i64, ptr %6, align 8
  %13 = icmp ugt i64 %12, 0
  br i1 %13, label %14, label %31

14:                                               ; preds = %11
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.AstNodeStack, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %6, align 8
  %19 = sub i64 %18, 1
  %20 = getelementptr inbounds %struct.Ast, ptr %17, i64 %19
  %21 = load ptr, ptr %5, align 8
  %22 = call ptr @findInSymtable(ptr noundef %20, ptr noundef %21)
  store ptr %22, ptr %7, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %14
  %26 = load ptr, ptr %7, align 8
  store ptr %26, ptr %3, align 8
  br label %32

27:                                               ; preds = %14
  br label %28

28:                                               ; preds = %27
  %29 = load i64, ptr %6, align 8
  %30 = add i64 %29, -1
  store i64 %30, ptr %6, align 8
  br label %11

31:                                               ; preds = %11
  store ptr null, ptr %3, align 8
  br label %32

32:                                               ; preds = %31, %25
  %33 = load ptr, ptr %3, align 8
  ret ptr %33
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lookupFunction(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca [256 x i8], align 1
  %11 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %12 = getelementptr inbounds [256 x i8], ptr %10, i64 0, i64 0
  %13 = load ptr, ptr %7, align 8
  %14 = load i32, ptr %8, align 4
  %15 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %12, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.3.429, ptr noundef %13, i32 noundef %14)
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.AstNodeStack, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.Ast, ptr %18, i64 0
  %20 = getelementptr inbounds [256 x i8], ptr %10, i64 0, i64 0
  %21 = call ptr @findInSymtable(ptr noundef %19, ptr noundef %20)
  store ptr %21, ptr %11, align 8
  %22 = load ptr, ptr %11, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %31, label %24

24:                                               ; preds = %4
  %25 = load ptr, ptr %11, align 8
  %26 = getelementptr inbounds %struct.Symbol, ptr %25, i32 0, i32 2
  %27 = load i8, ptr %26, align 1
  %28 = trunc i8 %27 to i1
  %29 = zext i1 %28 to i32
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %24, %4
  store i32 3, ptr %5, align 4
  br label %46

32:                                               ; preds = %24
  %33 = load ptr, ptr %11, align 8
  %34 = getelementptr inbounds %struct.Symbol, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 8
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %32
  store i32 6, ptr %5, align 4
  br label %46

38:                                               ; preds = %32
  br label %39

39:                                               ; preds = %38
  %40 = load ptr, ptr %9, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %45

42:                                               ; preds = %39
  %43 = load ptr, ptr %11, align 8
  %44 = load ptr, ptr %9, align 8
  store ptr %43, ptr %44, align 8
  br label %45

45:                                               ; preds = %42, %39
  store i32 0, ptr %5, align 4
  br label %46

46:                                               ; preds = %45, %37, %31
  %47 = load i32, ptr %5, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lookupSetter(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [256 x i8], align 1
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %11 = load ptr, ptr %6, align 8
  %12 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %10, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.4.432, ptr noundef %11)
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.AstNodeStack, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.Ast, ptr %15, i64 0
  %17 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %18 = call ptr @findInSymtable(ptr noundef %16, ptr noundef %17)
  store ptr %18, ptr %9, align 8
  %19 = load ptr, ptr %9, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %22

21:                                               ; preds = %3
  store i32 3, ptr %4, align 4
  br label %29

22:                                               ; preds = %3
  %23 = load ptr, ptr %7, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load ptr, ptr %9, align 8
  %27 = load ptr, ptr %7, align 8
  store ptr %26, ptr %27, align 8
  br label %28

28:                                               ; preds = %25, %22
  store i32 0, ptr %4, align 4
  br label %29

29:                                               ; preds = %28, %21
  %30 = load i32, ptr %4, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lookupGetter(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [256 x i8], align 1
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %11 = load ptr, ptr %6, align 8
  %12 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %10, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.5.435, ptr noundef %11)
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.AstNodeStack, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.Ast, ptr %15, i64 0
  %17 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %18 = call ptr @findInSymtable(ptr noundef %16, ptr noundef %17)
  store ptr %18, ptr %9, align 8
  %19 = load ptr, ptr %9, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %22

21:                                               ; preds = %3
  store i32 3, ptr %4, align 4
  br label %29

22:                                               ; preds = %3
  %23 = load ptr, ptr %7, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load ptr, ptr %9, align 8
  %27 = load ptr, ptr %7, align 8
  store ptr %26, ptr %27, align 8
  br label %28

28:                                               ; preds = %25, %22
  store i32 0, ptr %4, align 4
  br label %29

29:                                               ; preds = %28, %21
  %30 = load i32, ptr %4, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @semCheckFuncDef(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.AstNodeStack, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.Ast, ptr %6, i64 0
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %1
  br label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Ast, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @checkNode(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %10
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @checkNode(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  br label %30

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.AVLNode, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  call void @checkNode(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.AVLNode, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.Symbol, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %26

16:                                               ; preds = %6
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.AVLNode, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.Symbol, ptr %19, i32 0, i32 2
  %21 = load i8, ptr %20, align 1
  %22 = trunc i8 %21 to i1
  %23 = zext i1 %22 to i32
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  call void @printDebug(ptr noundef @.str.6.444)
  call void @handleError(i32 noundef 3) #12
  unreachable

26:                                               ; preds = %16, %6
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.AVLNode, ptr %27, i32 0, i32 3
  %29 = load ptr, ptr %28, align 8
  call void @checkNode(ptr noundef %29)
  br label %30

30:                                               ; preds = %26, %5
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @regCall(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %9 = load i64, ptr @unresCallCount, align 8
  %10 = load i64, ptr @unresCallCap, align 8
  %11 = icmp eq i64 %9, %10
  br i1 %11, label %12, label %30

12:                                               ; preds = %3
  %13 = load i64, ptr @unresCallCap, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i64 8, ptr %7, align 8
  br label %19

16:                                               ; preds = %12
  %17 = load i64, ptr @unresCallCap, align 8
  %18 = mul i64 %17, 2
  store i64 %18, ptr %7, align 8
  br label %19

19:                                               ; preds = %16, %15
  %20 = load ptr, ptr @unresCall, align 8
  %21 = load i64, ptr %7, align 8
  %22 = mul i64 24, %21
  %23 = call ptr @realloc(ptr noundef %20, i64 noundef %22) #13
  store ptr %23, ptr %8, align 8
  %24 = load ptr, ptr %8, align 8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %27, label %26

26:                                               ; preds = %19
  call void @handleError(i32 noundef 99) #12
  unreachable

27:                                               ; preds = %19
  %28 = load ptr, ptr %8, align 8
  store ptr %28, ptr @unresCall, align 8
  %29 = load i64, ptr %7, align 8
  store i64 %29, ptr @unresCallCap, align 8
  br label %30

30:                                               ; preds = %27, %3
  %31 = load ptr, ptr %4, align 8
  %32 = call i64 @strlen(ptr noundef %31) #14
  %33 = add i64 %32, 1
  %34 = call ptr @malloc(i64 noundef %33) #11
  %35 = load ptr, ptr @unresCall, align 8
  %36 = load i64, ptr @unresCallCount, align 8
  %37 = getelementptr inbounds %struct.Call, ptr %35, i64 %36
  %38 = getelementptr inbounds %struct.Call, ptr %37, i32 0, i32 0
  store ptr %34, ptr %38, align 8
  %39 = load ptr, ptr @unresCall, align 8
  %40 = load i64, ptr @unresCallCount, align 8
  %41 = getelementptr inbounds %struct.Call, ptr %39, i64 %40
  %42 = getelementptr inbounds %struct.Call, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = icmp ne ptr %43, null
  br i1 %44, label %46, label %45

45:                                               ; preds = %30
  call void @handleError(i32 noundef 99) #12
  unreachable

46:                                               ; preds = %30
  %47 = load ptr, ptr @unresCall, align 8
  %48 = load i64, ptr @unresCallCount, align 8
  %49 = getelementptr inbounds %struct.Call, ptr %47, i64 %48
  %50 = getelementptr inbounds %struct.Call, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %4, align 8
  %53 = load ptr, ptr @unresCall, align 8
  %54 = load i64, ptr @unresCallCount, align 8
  %55 = getelementptr inbounds %struct.Call, ptr %53, i64 %54
  %56 = getelementptr inbounds %struct.Call, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = call i64 @llvm.objectsize.i64.p0(ptr %57, i1 false, i1 true, i1 false)
  %59 = call ptr @__strcpy_chk(ptr noundef %51, ptr noundef %52, i64 noundef %58) #14
  %60 = load i32, ptr %5, align 4
  %61 = load ptr, ptr @unresCall, align 8
  %62 = load i64, ptr @unresCallCount, align 8
  %63 = getelementptr inbounds %struct.Call, ptr %61, i64 %62
  %64 = getelementptr inbounds %struct.Call, ptr %63, i32 0, i32 1
  store i32 %60, ptr %64, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = load ptr, ptr @unresCall, align 8
  %67 = load i64, ptr @unresCallCount, align 8
  %68 = getelementptr inbounds %struct.Call, ptr %66, i64 %67
  %69 = getelementptr inbounds %struct.Call, ptr %68, i32 0, i32 2
  store ptr %65, ptr %69, align 8
  %70 = load i64, ptr @unresCallCount, align 8
  %71 = add i64 %70, 1
  store i64 %71, ptr @unresCallCount, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @resCALL(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca [256 x i8], align 1
  %5 = alloca ptr, align 8
  %6 = alloca [256 x i8], align 1
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %8

8:                                                ; preds = %139, %1
  %9 = load i64, ptr %3, align 8
  %10 = load i64, ptr @unresCallCount, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %142

12:                                               ; preds = %8
  %13 = load ptr, ptr @unresCall, align 8
  %14 = load i64, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Call, ptr %13, i64 %14
  %16 = getelementptr inbounds %struct.Call, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %97

19:                                               ; preds = %12
  %20 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %21 = load ptr, ptr @unresCall, align 8
  %22 = load i64, ptr %3, align 8
  %23 = getelementptr inbounds %struct.Call, ptr %21, i64 %22
  %24 = getelementptr inbounds %struct.Call, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr @unresCall, align 8
  %27 = load i64, ptr %3, align 8
  %28 = getelementptr inbounds %struct.Call, ptr %26, i64 %27
  %29 = getelementptr inbounds %struct.Call, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %20, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.3.429, ptr noundef %25, i32 noundef %30)
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.AstNodeStack, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.Ast, ptr %34, i64 0
  %36 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %37 = call ptr @findInSymtable(ptr noundef %35, ptr noundef %36)
  store ptr %37, ptr %5, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = icmp eq ptr %38, null
  br i1 %39, label %47, label %40

40:                                               ; preds = %19
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds %struct.Symbol, ptr %41, i32 0, i32 2
  %43 = load i8, ptr %42, align 1
  %44 = trunc i8 %43 to i1
  %45 = zext i1 %44 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %88

47:                                               ; preds = %40, %19
  %48 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %49 = load ptr, ptr @unresCall, align 8
  %50 = load i64, ptr %3, align 8
  %51 = getelementptr inbounds %struct.Call, ptr %49, i64 %50
  %52 = getelementptr inbounds %struct.Call, ptr %51, i32 0, i32 0
  %53 = load ptr, ptr %52, align 8
  %54 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %48, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.7.449, ptr noundef %53)
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.AstNodeStack, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.Ast, ptr %57, i64 0
  %59 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %60 = call ptr @findWrongArrityFunction(ptr noundef %58, ptr noundef %59)
  %61 = icmp ne ptr %60, null
  br i1 %61, label %62, label %75

62:                                               ; preds = %47
  %63 = load ptr, ptr @__stderrp, align 8
  %64 = load ptr, ptr @unresCall, align 8
  %65 = load i64, ptr %3, align 8
  %66 = getelementptr inbounds %struct.Call, ptr %64, i64 %65
  %67 = getelementptr inbounds %struct.Call, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = load ptr, ptr @unresCall, align 8
  %70 = load i64, ptr %3, align 8
  %71 = getelementptr inbounds %struct.Call, ptr %69, i64 %70
  %72 = getelementptr inbounds %struct.Call, ptr %71, i32 0, i32 1
  %73 = load i32, ptr %72, align 8
  %74 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %63, ptr noundef @.str.8.450, ptr noundef %68, i32 noundef %73) #14
  call void @handleError(i32 noundef 5) #12
  unreachable

75:                                               ; preds = %47
  %76 = load ptr, ptr @__stderrp, align 8
  %77 = load ptr, ptr @unresCall, align 8
  %78 = load i64, ptr %3, align 8
  %79 = getelementptr inbounds %struct.Call, ptr %77, i64 %78
  %80 = getelementptr inbounds %struct.Call, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = load ptr, ptr @unresCall, align 8
  %83 = load i64, ptr %3, align 8
  %84 = getelementptr inbounds %struct.Call, ptr %82, i64 %83
  %85 = getelementptr inbounds %struct.Call, ptr %84, i32 0, i32 1
  %86 = load i32, ptr %85, align 8
  %87 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %76, ptr noundef @.str.9.451, ptr noundef %81, i32 noundef %86) #14
  call void @handleError(i32 noundef 3) #12
  unreachable

88:                                               ; preds = %40
  %89 = load ptr, ptr %5, align 8
  %90 = load ptr, ptr @unresCall, align 8
  %91 = load i64, ptr %3, align 8
  %92 = getelementptr inbounds %struct.Call, ptr %90, i64 %91
  %93 = getelementptr inbounds %struct.Call, ptr %92, i32 0, i32 2
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds %struct.AstNode, ptr %94, i32 0, i32 6
  store ptr %89, ptr %95, align 8
  br label %96

96:                                               ; preds = %88
  br label %138

97:                                               ; preds = %12
  %98 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %99 = load ptr, ptr @unresCall, align 8
  %100 = load i64, ptr %3, align 8
  %101 = getelementptr inbounds %struct.Call, ptr %99, i64 %100
  %102 = getelementptr inbounds %struct.Call, ptr %101, i32 0, i32 0
  %103 = load ptr, ptr %102, align 8
  %104 = load ptr, ptr @unresCall, align 8
  %105 = load i64, ptr %3, align 8
  %106 = getelementptr inbounds %struct.Call, ptr %104, i64 %105
  %107 = getelementptr inbounds %struct.Call, ptr %106, i32 0, i32 1
  %108 = load i32, ptr %107, align 8
  %109 = icmp eq i32 %108, -1
  %110 = zext i1 %109 to i64
  %111 = select i1 %109, i32 103, i32 115
  %112 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %98, i64 noundef 256, i32 noundef 0, i64 noundef 256, ptr noundef @.str.10.452, ptr noundef %103, i32 noundef %111)
  %113 = load ptr, ptr %2, align 8
  %114 = getelementptr inbounds %struct.AstNodeStack, ptr %113, i32 0, i32 0
  %115 = load ptr, ptr %114, align 8
  %116 = getelementptr inbounds %struct.Ast, ptr %115, i64 0
  %117 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %118 = call ptr @findInSymtable(ptr noundef %116, ptr noundef %117)
  store ptr %118, ptr %7, align 8
  %119 = load ptr, ptr %7, align 8
  %120 = icmp eq ptr %119, null
  br i1 %120, label %121, label %129

121:                                              ; preds = %97
  %122 = load ptr, ptr @__stderrp, align 8
  %123 = load ptr, ptr @unresCall, align 8
  %124 = load i64, ptr %3, align 8
  %125 = getelementptr inbounds %struct.Call, ptr %123, i64 %124
  %126 = getelementptr inbounds %struct.Call, ptr %125, i32 0, i32 0
  %127 = load ptr, ptr %126, align 8
  %128 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %122, ptr noundef @.str.11.453, ptr noundef %127) #14
  call void @handleError(i32 noundef 3) #12
  unreachable

129:                                              ; preds = %97
  %130 = load ptr, ptr %7, align 8
  %131 = load ptr, ptr @unresCall, align 8
  %132 = load i64, ptr %3, align 8
  %133 = getelementptr inbounds %struct.Call, ptr %131, i64 %132
  %134 = getelementptr inbounds %struct.Call, ptr %133, i32 0, i32 2
  %135 = load ptr, ptr %134, align 8
  %136 = getelementptr inbounds %struct.AstNode, ptr %135, i32 0, i32 6
  store ptr %130, ptr %136, align 8
  br label %137

137:                                              ; preds = %129
  br label %138

138:                                              ; preds = %137, %96
  br label %139

139:                                              ; preds = %138
  %140 = load i64, ptr %3, align 8
  %141 = add i64 %140, 1
  store i64 %141, ptr %3, align 8
  br label %8

142:                                              ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @findWrongArrityFunction(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.Ast, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %8, %2
  store ptr null, ptr %3, align 8
  br label %20

14:                                               ; preds = %8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.Ast, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = call ptr @findNodeWithoutArity(ptr noundef %17, ptr noundef %18)
  store ptr %19, ptr %3, align 8
  br label %20

20:                                               ; preds = %14, %13
  %21 = load ptr, ptr %3, align 8
  ret ptr %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @findNodeWithoutArity(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store ptr null, ptr %3, align 8
  br label %59

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = call i64 @strlen(ptr noundef %11) #14
  %13 = trunc i64 %12 to i32
  store i32 %13, ptr %6, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.AVLNode, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = call i32 @strncmp(ptr noundef %14, ptr noundef %17, i64 noundef %19) #14
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %10
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.AVLNode, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = call ptr @findNodeWithoutArity(ptr noundef %25, ptr noundef %26)
  store ptr %27, ptr %3, align 8
  br label %59

28:                                               ; preds = %10
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.AVLNode, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = call i32 @strncmp(ptr noundef %29, ptr noundef %32, i64 noundef %34) #14
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %43

37:                                               ; preds = %28
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.AVLNode, ptr %38, i32 0, i32 3
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = call ptr @findNodeWithoutArity(ptr noundef %40, ptr noundef %41)
  store ptr %42, ptr %3, align 8
  br label %59

43:                                               ; preds = %28
  %44 = load ptr, ptr %5, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.AVLNode, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = load i32, ptr %6, align 4
  %49 = sext i32 %48 to i64
  %50 = call i32 @strncmp(ptr noundef %44, ptr noundef %47, i64 noundef %49) #14
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %43
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.AVLNode, ptr %53, i32 0, i32 1
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %3, align 8
  br label %59

56:                                               ; preds = %43
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  store ptr null, ptr %3, align 8
  br label %59

59:                                               ; preds = %58, %52, %37, %22, %9
  %60 = load ptr, ptr %3, align 8
  ret ptr %60
}

; Function Attrs: nounwind
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @clearCALL() #0 {
  %1 = alloca i64, align 8
  store i64 0, ptr %1, align 8
  br label %2

2:                                                ; preds = %12, %0
  %3 = load i64, ptr %1, align 8
  %4 = load i64, ptr @unresCallCount, align 8
  %5 = icmp ult i64 %3, %4
  br i1 %5, label %6, label %15

6:                                                ; preds = %2
  %7 = load ptr, ptr @unresCall, align 8
  %8 = load i64, ptr %1, align 8
  %9 = getelementptr inbounds %struct.Call, ptr %7, i64 %8
  %10 = getelementptr inbounds %struct.Call, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %11)
  br label %12

12:                                               ; preds = %6
  %13 = load i64, ptr %1, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr %1, align 8
  br label %2

15:                                               ; preds = %2
  %16 = load ptr, ptr @unresCall, align 8
  call void @free(ptr noundef %16)
  store ptr null, ptr @unresCall, align 8
  store i64 0, ptr @unresCallCount, align 8
  store i64 0, ptr @unresCallCap, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { allocsize(1) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noinline noreturn nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind willreturn memory(read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #11 = { allocsize(0) }
attributes #12 = { noreturn }
attributes #13 = { allocsize(1) }
attributes #14 = { nounwind }
attributes #15 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Apple clang version 17.0.0 (clang-1700.4.4.1)"}
!1 = !{i32 2, !"SDK Version", [2 x i32] [i32 26, i32 1]}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 1}
