%{
	void yyerror (char *s);
	int yylex();
	#include <stdio.h>     /* C declarations used in actions */
	#include <stdlib.h>
	#include <ctype.h>
%}

%union {
	float val;
}

%start S
%token <val> NUM
%type <val> S E

%left '+' '-'
%left '*' '/'
%left UNARY

%%
S : E '\n'				{printf("Result = %0.2f\n", $1);}
  | S E '\n'			{printf("Result = %0.2f\n", $2);}
  | '$'					{exit(EXIT_SUCCESS);}
  | S '$'				{exit(EXIT_SUCCESS);}
  ;

E : NUM        	        { $$ = $1; }
  | E '+' E 		    { $$ = $1 + $3; }
  | E '-' E  		    { $$ = $1 - $3; }
  | E '*' E 		    { $$ = $1 * $3; }
  | E '/' E 		    { $$ = $1 / $3; }
  | '+' E  %prec UNARY  { $$ =  $2; }
  | '-' E  %prec UNARY  { $$ = -$2; }
  | '(' E ')'           { $$ =  $2; }
  ;
%%

int main () {
	return yyparse();
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
