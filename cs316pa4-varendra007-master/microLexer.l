%{
	#include "microParser.hpp"
	#include <stdio.h> 
	#include <stdlib.h> 
	#include <string.h> 
%}


%option yylineno
DIGIT [0-9]
IDENTIFIER [_a-zA-Z][_a-zA-Z0-9]*
SPACE [\r\n\t ]
STRINGLITERAL ["]
COMMENT "//".*
OPERATOR [:]|[+]|[-]|[*]|[/]|[=]|[!]|[<]|[>]|[(]|[)]|[,]|[;]

%%
{COMMENT}.+\n {}

{SPACE}+ {}

{DIGIT}+ {yylval.s = strdup(yytext);return INTLITERAL;}

{DIGIT}+"."{DIGIT}* {yylval.s = strdup(yytext);return FLOATLITERAL;}
IF  {return IF;}

END  {	return END;}

ELSE  {return ELSE;}
VOID  {return VOID;}
READ  {	return READ;}
BREAK {return BREAK;}
WRITE  {return WRITE;}
ENDIF  {return ENDIF;}
WHILE  {return WHILE;}
BEGIN  {return _BEGIN;}
RETURN  {return RETURN;}
STRING  {return STRING;}
PROGRAM  {return PROGRAM;}
CONTINUE  {return CONTINUE;}
ENDWHILE  {return ENDWHILE;}
FUNCTION  {	return FUNCTION;}
INT  {yylval.v = strdup(yytext); return INT;}
FLOAT  {yylval.v = strdup(yytext); return FLOAT;}

{STRINGLITERAL}[^"]+{STRINGLITERAL} {
	yylval.s = strdup(yytext);
	return STRINGLITERAL;
}

{IDENTIFIER} {yylval.s = strdup(yytext); return IDENTIFIER;}

{OPERATOR} {return *yytext;}

%%
int yywrap(){
  	return 1;
}