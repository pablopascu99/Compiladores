/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     REAL = 258,
     ENT = 259,
     STR = 260,
     INTEGER = 261,
     FLOAT = 262,
     STRING = 263,
     PLUS = 264,
     MINUS = 265,
     DIVIDE = 266,
     MULTIPLY = 267,
     LEFT = 268,
     RIGHT = 269,
     DONE = 270,
     LESSEROREQUALSTHAN = 271,
     GREATEROREQUALSTHAN = 272,
     DIFFERENTTHAN = 273,
     LESSERTHAN = 274,
     GREATERTHAN = 275,
     EQUALS = 276,
     THEN = 277,
     IS = 278,
     IF = 279,
     ELSE = 280,
     SEMI = 281,
     TRUE = 282,
     FALSE = 283,
     END = 284,
     PROCEDURE = 285,
     ID = 286,
     POINTS = 287,
     ASSIGN = 288,
     BEEGIN = 289,
     COMMENT = 290
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1685 of yacc.c  */
#line 19 "calculadora_simple.y"

  int intVal;
  float floatVal;
  char* stringVal;
  struct atributos{
    float real;
    int entero;
    char* string;
    char* type;
  }st;



/* Line 1685 of yacc.c  */
#line 100 "calculadora_simple.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


