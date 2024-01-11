/*  lex file takes to parameters as arguments to the main c function (see end of file)
    param 1: name of the input file 
    (optional) param 2: name of the output file 
*/
%option noyywrap
digit		    [0-9]
letter		    [A-Za-z]
punc		    [_]
alphanumeric	({letter}|{digit}|{punc})
is              (=)|(is)
concat          (\+=)
dimp		    (<->)|(dimp)
imp		        (->)|(imp)
and		        &|(and)
or		        \||(or)
equals		    (==)
nequals		    (!=)
binary_op	    ({dimp}|{imp}|{and}|{or})
rel_op		    ({equals}|{nequals})
ass_op          ({is}|{concat})

%%
bool			    fprintf(yyout, "%s", "TYPE_BOOL ");
bool\[\]		    fprintf(yyout, "%s", "BOOL_LIST ");
boid			    fprintf(yyout, "%s", "VOID ");
(true)|(TRUE)		fprintf(yyout, "%s", "BOOL_CONST ");
(false)|(FALSE)		fprintf(yyout, "%s", "BOOL_CONST ");
if			        fprintf(yyout, "%s", "IF ");
else			    fprintf(yyout, "%s", "ELSE ");
while			    fprintf(yyout, "%s", "WHILE ");
foreach			    fprintf(yyout, "%s", "FOREACH ");
begin			    fprintf(yyout, "%s", "BEGIN ");
end			        fprintf(yyout, "%s", "END ");
return			    fprintf(yyout, "%s", "RETURN ");
print			    fprintf(yyout, "%s", "PRINT ");
input			    fprintf(yyout, "%s", "INPUT ");
in			        fprintf(yyout, "%s", "IN ");
\)			        fprintf(yyout, "%s", "RP ");
\(			        fprintf(yyout, "%s", "LP ");
;			        fprintf(yyout, "%s", "SC ");
\{			        fprintf(yyout, "%s", "LCB ");
\}			        fprintf(yyout, "%s", "RCB ");
,			        fprintf(yyout, "%s", "COMMA ");
!|(not)			    fprintf(yyout, "%s", "UNARY_OP ");
--                  fprintf(yyout, "%s", "DELETE ");
{binary_op}		    fprintf(yyout, "%s", "BINARY_OP ");
{rel_op}		    fprintf(yyout, "%s", "RELATIONAL_OP ");
{ass_op}			fprintf(yyout, "%s", "ASSIGN ");

{letter}{alphanumeric}*		    fprintf(yyout, "%s", "IDENTIFIER ");
\"([^"])*\"			            fprintf(yyout, "%s", "STR_LITERAL "); 
\/\*([^/*])*\*\/		        fprintf(yyout, "%s", "COMMENT ");

.                   fprintf(yyout, "%c", yytext[0]);
%%
int main(int argc, char *argv[])
{
    extern FILE *yyin, *yyout;

    if(argc == 2) {
        yyin = fopen(argv[1], "r");
        yyout = fopen("output.txt", "w");
    }

    if(argc == 3) {
        yyin = fopen(argv[1], "r");
        yyout = fopen(argv[2], "w");
    }
 
    yylex();
    return 0;
}