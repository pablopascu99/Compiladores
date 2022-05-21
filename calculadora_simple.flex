%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "calculadora_simple.tab.h"

%}

%option noyywrap

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

"true"			{return TRUE;}
"false"			{return FALSE;}

"if"            {return IF;}
[0-9]+          {yylval.intVal = atoi(yytext); return ENT;}
[0-9]+"."[0-9]+ {yylval.floatVal = atof(yytext); return REAL;}
".+"       {yylval.stringVal = strdup(yytext);return STR;}
"\n"            {return DONE;}
.               {printf("Error: invlaid lexeme '%s'.\n", yytext); return 0;}

%%


