%{

#include <stdio.h>
#include <string.h>

int yywrap( );
void yyerror(const char* str);

/* the result variable */
float result2 = 0;
int result = 0;

%}

/* declare type possibilities of symbols */
%union {
  int intVal;
  float floatVal;
  struct atributos{
    float real;
    int entero;
  }st;
}

/* declare tokens (default is typeless) */
%token <floatVal> REAL
%token <intVal> ENT
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY
%token LEFT
%token RIGHT
%token DONE

%left PLUS MINUS
%left MULTIPLY DIVIDE

/* declare non-terminals */
%type <st> stmt expr term factor expr2 term2 factor2

/* give us more detailed errors */
%error-verbose

%%

/* one expression only followed by a new line */
stmt: expr DONE {result = $1.entero; return 0;}
    | expr2 DONE {result2 = $1.real; return 0;}

/* an expression uses + or - or neither */
expr: expr PLUS term {$$.entero = $1.entero + $3.entero;}
    | expr MINUS term {$$.entero = $1.entero - $3.entero;}
    | term {$$.entero = $1.entero;}

/* an expression uses * or / or neither */
term: term MULTIPLY factor {$$.entero = $1.entero * $3.entero;}
    | term DIVIDE factor {$$.entero = $1.entero / $3.entero;}
    | factor {$$.entero = $1.entero;}

factor: ENT {$$.entero = $1;}
      | LEFT expr RIGHT {$$.entero = $2.entero;}
      | MINUS ENT {$$.entero = -$2; }

/* an expression uses + or - or neither */
expr2: expr2 PLUS term2 {$$.real = $1.real + $3.real;}
    | expr2 MINUS term2 {$$.real = $1.real - $3.real;}
    | term2 {$$.real = $1.real;}

/* an expression uses * or / or neither */
term2: term2 MULTIPLY factor2 {$$.real = $1.real * $3.real;}
    | term2 DIVIDE factor2 {$$.real = $1.real / $3.real;}
    | factor2 {$$.real = $1.real;}

factor2: REAL {$$.real = $1;}
      | LEFT expr2 RIGHT {$$.real = $2.real;}
      | MINUS REAL {$$.real = -$2; }
%%

int yywrap( ) {
  return 1;
}

void yyerror(const char* str) {
  fprintf(stderr, "Compiler error: '%s'.\n", str);
}

int main( ) {
  yyparse( );
  printf("ENTERO %ld\n", result);
  printf("REAL %lf\n", result2);
  return 0;
}
