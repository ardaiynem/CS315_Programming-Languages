parser: lex.yy.c y.tab.c
	gcc -o parser y.tab.c
y.tab.c: CS315_S23_Team6.yacc.y
	yacc CS315_S23_Team6.yacc.y
lex.yy.c: CS315_S23_Team6.lex.l
	lex CS315_S23_Team6.lex.l
