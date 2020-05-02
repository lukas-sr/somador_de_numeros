%{

#include <stdio.h>

void yyerror(char *c);  //cabeçalho da função yyerror
int yylex(void);        //chama o yylex do arquivo lex
int fatorial(int n);

%}

%token SPACE INT STR FLOAT OP '\n'
%left SPACE 

%%

S:
   S A '\n' { printf("%.2f\n",(float) $2); } /*SOMA FLOAT+INT*/
   |
   ;

A:
   FLOAT {$$ = $1;}
   |INT {$$ = $1;}
   |A SPACE A {$$ = $1 + $3;}
          
  ;

%%

void yyerror(char *c){
   printf("Erro");
}

int fatorial(int n){
   if (n == 1) return 1;
   else return (n*fatorial(n-1));
}

int main(){
   yyparse();

   return 0;
}
