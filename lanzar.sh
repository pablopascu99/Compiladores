bison -d -v calculadora_simple.y
flex -o calculadora_simple.lex.c calculadora_simple.flex
gcc -o programa calculadora_simple.tab.c calculadora_simple.lex.c