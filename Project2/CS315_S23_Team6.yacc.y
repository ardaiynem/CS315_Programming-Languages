/* project_yac.y */
%{
#include <stdio.h>
%}

%union{ int bool; }

%token <bool> BOOL
%token FUNC BOOL_TYPE BOOL_LIST_TYPE VOID
%token IF ELSE ELIF WHILE FOREACH BEG END RETURN
%token PRINT INPUT IN RP LP SC LCB RCB COMMA
%token NOT ASSIGN DIMP IMP AND OR EQUALS NEQUALS CONCAT DEL EMPTY
%token ID STR_LITERAL COMMENT

%%
start: program_list 

program: BEG line_list END
       ;

program_list: program
            | comment_list program
            | comment_list program comment_list
            | program comment_list
            ;

comment_list: COMMENT
            | comment_list COMMENT
            ;

line: COMMENT
    | stmt
    | error SC
    ;

line_list: line
         | line line_list
         ;

stmt: dec_stmt SC 
    | assign_stmt SC
    | if_else_stmt
    | func_def 
    | func_call SC
    | return_stmt SC
    | while_stmt
    | foreach_stmt
    | input_stmt SC
    | output_stmt SC
    | del_expr SC
    ;

assign_stmt: ID ASSIGN expression
           | concat_stmt
           ;

dec_stmt: type declarators
        ;

declarators: declarator
           | declarators COMMA declarator
           ;

declarator: ID
          | ID ASSIGN expression
          | ID LP param_list RP BEG line_list END
          ;

func_def: FUNC return_type ID LP param_list RP BEG line_list END
        ;


if_else_stmt: if_stmt | if_stmt else_stmt
            ;

if_stmt: IF LP bool_expression RP BEG line_list END 
       | if_stmt elif_stmt
       ;

elif_stmt: ELIF LP bool_expression RP BEG line_list END
         ;

else_stmt: ELSE BEG line_list END

bool_expression: func_call 
               | relational_expr
               | expr
               | del_expr
	       | empty_expr
               ;
 
list_expression: LCB value_list RCB
               ;

expression: bool_expression | list_expression
          ;

expr: expr DIMP term1 | term1
    ;
term1: term1 IMP term2 | term2
     ;
term2: term2 OR term3 | term3
     ;
term3: term3 AND term4 | term4
     ;
term4: NOT term4 | term5
     ;
term5: ID | BOOL | LP expr RP
     ;

del_expr: ID DEL
        ;

empty_expr: EMPTY ID
          ;

param_list: 
          | type ID 
          | param_list COMMA type ID
          ;

func_call: ID LP value_list RP | ID LP RP 
         ;

value_list: ID | BOOL | value_list COMMA ID | value_list COMMA BOOL 
         ;

return_stmt: RETURN expression
           ;

while_stmt: WHILE LP bool_expression RP BEG line_list END
          ;
        
foreach_stmt: FOREACH LP ID IN foreach_input RP BEG line_list END
           ;

foreach_input: ID | LCB value_list RCB
            ;


input_stmt: INPUT LP id_list RP    
          ;

output_stmt: PRINT LP STR_LITERAL RP
           | PRINT LP expr_list RP
           ;

concat_stmt: ID CONCAT expression
           ;

relational_expr: ID EQUALS ID | ID NEQUALS ID
               ;

expr_list: expression | expr_list COMMA expression
       ;

id_list: ID | id_list COMMA ID
       ;

type: BOOL_TYPE | BOOL_LIST_TYPE
    ;

return_type: type | VOID 
           ;

%%
#include "lex.yy.c"
int lineno = 1;
int errcount = 0;

int main(int argc, char *argv[]) {
	
    extern FILE *yyin;

    if(argc != 2) {
	printf("usage: parser <inputfilename> \n");
	exit(1);
    }

    yyin = fopen(argv[1], "r");

    yyparse();
    
    if(errcount == 0)
        printf("\nprogram works\n"); 
    else 
        printf("\nprogram has %d syntax errors\n", errcount); 

    return 0;
}

yyerror(char *s) { printf("\nerror in line %d %s", lineno, s); 
		   yyerrok;
		   errcount ++; }
