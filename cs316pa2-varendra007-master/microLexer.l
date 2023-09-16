%{
	#include "microParser.h"
%}


DIGIT [0-9]
IDENTIFIER [_a-zA-Z][_a-zA-Z0-9]*
STRINGLITERAL \"(\\.|[^"\\])*\"
COMMENT "//".*
OPERATOR [:]|[+]|[-]|[*]|[/]|[=]|[!]|[<]|[>]|[(]|[)]|[,]|[;] 
SPACE [\r\n\t ]
%%

IF  {return IF;}
END  {return END;}
INT  {return INT;}
READ  {return READ;}
ELSE  {return ELSE;}
VOID  {return VOID;}
BREAK {return BREAK;}
FLOAT  {return FLOAT;}
WRITE  {return WRITE;}
ENDIF  {return ENDIF;}
WHILE  {return WHILE;}
BEGIN  {return _BEGIN;}
RETURN  {return RETURN;}
STRING  {return STRING;}
PROGRAM  {return PROGRAM;}
CONTINUE  {return CONTINUE;}
ENDWHILE  {return ENDWHILE;}
FUNCTION  {return FUNCTION;}

{SPACE}+ {}
{COMMENT} {}
{OPERATOR} {return *yytext;}
{DIGIT}+ {return INTLITERAL;}
{IDENTIFIER} {return IDENTIFIER;}
{STRINGLITERAL} {return STRINGLITERAL;}
{DIGIT}+"."{DIGIT}* {return FLOATLITERAL;}
%%

int yywrap()
{
  	return 1;
}