%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "calculadora_simple.tab.h"

%}

%option noyywrap
letra [a-zA-Z]
digito [0-9]
int (Integer|integer)
float (Float|float)
string (String|string)

%%

{int} {return INTEGER;}
{float} {return FLOAT;}
{string} {return STRING;}

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
":"				{return POINTS;}
":="			{return ASSIGN ;}

"true"			{return TRUE;}
"false"			{return FALSE;}

"if"            {return IF;}
"is"            {return IS;}
"procedure"     {return PROCEDURE;}
"end"			{return END ;}

[0-9]+          {yylval.intVal = atoi(yytext); return ENT;}
[0-9]+"."[0-9]+ {yylval.floatVal = atof(yytext); return REAL;}
\"([^\\\"]|\\.)*\"            {yylval.stringVal = strdup(yytext);return STR;}
{letra}({letra}|{digito}|"_")*							{yylval.stringVal=strdup(yytext); return ID ;}

"\n"            {return DONE;}
" "             {;}
.               {printf("Error: invlaid lexeme '%s'.\n", yytext); return 0;}

%%


