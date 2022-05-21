%{

#include <stdio.h>
#include <string.h>

int yywrap( );
void yyerror(const char* str);
extern FILE *yyin;
extern FILE *yyout;

/* the result variable */
float result2 = 0;
int result = 0;
char* result3= "";
%}

/* declare type possibilities of symbols */
%union {
  int intVal;
  float floatVal;
  char* stringVal;
  struct atributos{
    float real;
    int entero;
    char* string;
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

%token LESSEROREQUALSTHAN
%token GREATEROREQUALSTHAN
%token DIFFERENTTHAN
%token LESSERTHAN
%token GREATERTHAN
%token EQUALS
%token THEN
%token IF
%token ELSE
%token SEMI
%token STR
%token TRUE
%token FALSE


%left PLUS MINUS
%left MULTIPLY DIVIDE

/* declare non-terminals */
%type <st> stmt expr term factor expr2 term2 factor2 boolean_var boolean_op bool

/* give us more detailed errors */
%error-verbose

%start command
%%
command: stmt DONE command
    | stmt

/* one expression only followed by a new line */
stmt: expr {result = $1.entero; }
    | expr2 {result2 = $1.real; }
    | bool {result3 = $1.string; }

/* an expression uses + or - or neither */
expr: expr PLUS term {$$.entero = $1.entero + $3.entero; printf( "ENTERO %ld\n", $$.entero);}
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
expr2: expr2 PLUS term2 {$$.real = $1.real + $3.real;printf( "REAL %lf\n", $$.real);}
    | expr2 MINUS term2 {$$.real = $1.real - $3.real;}
    | term2 {$$.real = $1.real;}

/* an expression uses * or / or neither */
term2: term2 MULTIPLY factor2 {$$.real = $1.real * $3.real;}
    | term2 DIVIDE factor2 {$$.real = $1.real / $3.real;}
    | factor2 {$$.real = $1.real;}

factor2: REAL {$$.real = $1;}
      | LEFT expr2 RIGHT {$$.real = $2.real;}
      | MINUS REAL {$$.real = -$2; }

boolean_op: EQUALS {$$.string = "=";}
	    | GREATERTHAN {$$.string=">";}
    	| LESSERTHAN {$$.string= "<";}
	    | GREATEROREQUALSTHAN {$$.string=">=";}
	    | LESSEROREQUALSTHAN {$$.string="<=";}
	    | DIFFERENTTHAN {$$.string="\\=";}
;

// VARIABLES BOOLEANAS
boolean_var: TRUE {$$.string="True\n";}
    	| FALSE {$$.string="False\n"; }
;

bool:expr boolean_op expr2 {printf("Operacion booleana variables\n");}
      | boolean_var boolean_op boolean_var {$$.string="Operacion booleana true/false \n";}

;

/* ifElse:  IF LEFT condition RIGHT THEN statment ELSE statment SEMI {printf("Accepted If/else\n");}
		|	IF LEFT condition RIGHT THEN statment SEMI {printf("Accepted If\n");}
		;
condition: expresion LESSEROREQUALSTHAN expresion
			| expresion GREATEROREQUALSTHAN expresion
      | expresion DIFFERENTTHAN expresion
      | expresion LESSERTHAN expresion
      | expresion GREATERTHAN expresion
      | expresion EQUALS expresion
			;
statment: expresion PLUS expresion
		  | expresion MINUS expresion
		  ;
expresion: ENT
	; */
%%

int yywrap( ) {
  return 1;
}

void yyerror(const char* str) {
  fprintf(stderr, "Compiler error: '%s'.\n", str);
}

/* int main( ) {
  yyparse( );
  printf("ENTERO %ld\n", result);
  printf("REAL %lf\n", result2);
  printf("STRING %s\n", result3);
  return 0;
} */
int main(int argc, char *argv[]) {

	if (argc == 1) {
		yyparse();
	}
	if (argc == 2) {
		yyout = fopen( "./prueba.txt", "wt" );

		yyin = fopen(argv[1], "rt");

		yyparse();
	}

	return 0;
}
