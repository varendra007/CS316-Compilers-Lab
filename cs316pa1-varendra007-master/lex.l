/* scanner for a toy Pascal-like language */

%{
/* need this for the call to atof() below */
#include <math.h>
#include<string.h>
%}

INTLITERAL    [0-9]+
DIGIT   [0-9]
IDENTIFIER      [a-zA-Z][a-zA-Z0-9]*




%%
{INTLITERAL}    {printf("Token Type: INTLITERAL\nValue: %s\n", yytext);}
{INTLITERAL}+"."{DIGIT}*        {printf("Token Type: FLOATLITERAL\nValue: %s\n", yytext);}
BEGIN           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
PROGRAM         {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
END             {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
FUNCTION        {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
READ            {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
WRITE           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
IF              {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
ELSE            {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
ENDIF           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
WHILE           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
ENDWHILE        {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
BREAK           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
CONTINUE        {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
RETURN          {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
INT             {printf("Token Type: KEYWORD\nValue: %s\n", yytext);} 
VOID            {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
STRING          {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
FLOAT           {printf("Token Type: KEYWORD\nValue: %s\n", yytext);}
{IDENTIFIER}    {printf("Token Type: IDENTIFIER\nValue: %s\n", yytext);}

":="            {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"+"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"-"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"*"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"/"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"="             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"!="            {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"<"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
">"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"("             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
")"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
";"             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
","             {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
"<="            {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
">="            {printf("Token Type: OPERATOR\nValue: %s\n", yytext);}
\"(\\.|[^"\\])*\" {printf("Token Type: STRINGLITERAL\nValue: %s\n", yytext);}
[ \t\n]+          /* eat up whitespace */
"//".* {}


.
%%
int yywrap(){}
int main( int argc, char **argv )
    {
    ++argv, --argc; 
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;
    yylex();
    }
