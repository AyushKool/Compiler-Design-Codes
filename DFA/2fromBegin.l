%s A B DEAD

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n\r] BEGIN DEAD;
<INITIAL>(\n|\r)+ BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}

<A>1 BEGIN B;
<A>0 BEGIN DEAD;
<A>[^01\n\r] BEGIN DEAD;
<A>(\n|\r)+ BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}

<B>0 BEGIN B;
<B>1 BEGIN B;
<B>[^01\n\r] BEGIN DEAD;
<B>(\n|\r)+ BEGIN INITIAL; {fprintf(yyout, "Accepted\n");}

<DEAD>[^\n\r] BEGIN DEAD;
<DEAD>(\n|\r)+ BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}
%%

int yywrap(){}
int main()
{
	yyin = fopen("input.txt", "r");
	// yyout = fopen("output.txt", "w");
	yylex();
}