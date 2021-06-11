%{
	void yyerror (char *s);
	int yylex();
	#include <stdio.h>     /* C declarations used in actions */
	#include <stdlib.h>
	#include <ctype.h>
	extern FILE* yyin, *yyout;
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

int yywrap(){return 1;}

int main()
{
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	return yyparse();
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
