%{
	void yyerror (char *s);
	int yylex();
	#include <stdio.h>     /* C declarations used in actions */
	#include <stdlib.h>
	#include <ctype.h>
%}

%union {
	int n;
	char *id;
}

%token<n> NUMBER 
%token<id> ID

%left '+' '-'
%left '*' '/'

%start S


%%
S : E '\n' {printf("Expression is valid\n\n>>Enter the expression\n");}
  | S E '\n' {printf("Expression is valid\n\n>>Enter the expression\n");}
	;

E : E'+'E
   |E'-'E
   |E'*'E
   |E'/'E
   |'('E')'
   |NUMBER
   |ID
   ;
%%

int main()
{
	printf(">>Enter the expression\n");
	yyparse();
}

void yyerror(char *s)
{
	printf("Expression is invalid\n");
	// exit(1);
}