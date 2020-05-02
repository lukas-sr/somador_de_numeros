
%{
#include <stdlib.h>

void yyerror(char *);

#include "y.tab.h"

/*
 *%token SPACE OP INT STR FLOAT '/n'
 */
%}

INTEIRO [0-9]+
STRING [[0-9]*[A-Za-z]+]

%%

[\n] { return '\n'; }

[ ] { return SPACE; }

{INTEIRO} { 
            return INT;
          }

{INTEIRO}[.]{INTEIRO} {
                      /*yylval = atof(yytext);*/
                      printf("%f\n", yylval);
                      return FLOAT;
                      }

{STRING} { return STR; }

[!] { return OP; }

. ;

%%

int yywrap(){
   return 1;
}
