%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "calculadora_simple.tab.h"
int numLinea = 1;

%}

%option noyywrap
%option yylineno

digito [0-9]
letra [a-zA-Z]

%%

"+"             {return PLUS;}
"-"             {return MINUS;}
"/"             {return DIVIDE;}
"*"             {return MULTIPLY;}
"("             {return LEFT;}
")"             {return RIGHT;}

"<="			{return LESSEROREQUALSTHAN;}
">="			{return GREATEROREQUALSTHAN;}
"/="			{return DIFFERENTTHAN;}
"<"				{return LESSERTHAN;}
">"				{return GREATERTHAN;}
"="				{return EQUALS;}
";"				{return SEMI;}

"true"			                                        {return TRUE;}
"false"			                                        {return FALSE;}

"if"                                                    {return IF;}
"procedure"												{return PROCEDURE ;}
"is"                                                    {return IS;}
"end "{letra}+                                          {return END ;}


{digito}+                                               {yylval.intVal = atoi(yytext); return ENT;}
{digito}+"."{digito}+                                   {yylval.floatVal = atof(yytext); return REAL;}
{letra}({letra}|{digito}|"_")*                          {yylval.stringVal = strdup(yytext);return ID;}
"\n"                                                    {numLinea=yylineno; return SALTO;}
.                                                       {printf("Error: invlaid lexeme '%s'.\n", yytext); return 0;}

%%


