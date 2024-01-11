/*  lex file takes to parameters as arguments to the main c function (see end of file)
    param 1: name of the input file 
    (optional) param 2: name of the output file 
*/
%option noyywrap
digit		    [0-9]
letter		    [A-Za-z]
punc		    [_]
alphanumeric	({letter}|{digit}|{punc})
nl              \n

%%
bool			    { return BOOL_TYPE; }
bool\[\]		    { return BOOL_LIST_TYPE; }
void			    { return VOID; }
(true)|(TRUE)		{   char a[4];
                        scanf(yytext, "%s", &a);
                        if(strcmp(a, "TRUE") || strcmp(a, "true"))
                            yylval.bool = 1;
                        return BOOL;
                    }

(false)|(FALSE)		{   char a[4]; 
                        scanf(yytext, "%s", &a);
                        if(strcmp(a, "FALSE") || strcmp(a, "false"))
                            yylval.bool = 0;
                        return BOOL;
                    }
func                { return FUNC; }
if			        { return IF; }
else			    { return ELSE; }
elif                { return ELIF; }
while			    { return WHILE; }
foreach			    { return FOREACH; }
begin			    { return BEG; }
end			        { return END; }
return			    { return RETURN; }
print			    { return PRINT; }
input			    { return INPUT; }
in			        { return IN; }
\)			        { return RP; }
\(			        { return LP; }
;			        { return SC; }
\{			        { return LCB; }
\}			        { return RCB; }
,			        { return COMMA; }
!|(not)			    { return NOT; }
(=)|(is)            { return ASSIGN; }
(<->)|(dimp)        { return DIMP; }
(->)|(imp)          { return IMP; }
&|(and)             { return AND; }
\||(or)             { return OR; }
#                   { return EMPTY; }
(==)                { return EQUALS; }
(!=)                { return NEQUALS; }
(\+=)               { return CONCAT; }
(--)                { return DEL; }

{letter}{alphanumeric}*		    { return ID; }
\"([^"])*\"			            { char *str = yytext;
                                    int i = 0;
                                    extern int lineno;
                                    while(str[i] != '\0') {
                                        if( str[i] == '\n' ) {
                                            lineno++;
                                        }
                                        i++;
                                    }
                                        return STR_LITERAL; }
\/\*([^/*])*\*\/ 		        { char *str = yytext;
                                    int i = 0;
                                    extern int lineno;
                                    while(str[i] != '\0') {
                                        if( str[i] == '\n' ) {
                                            lineno++;
                                        }
                                        i++;
                                    }
                                        return COMMENT; }

{nl}                    { extern int lineno; lineno++; }   
.                       {}                   

%%
/*
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
 
    yyparse();
    return 0;
}*/
