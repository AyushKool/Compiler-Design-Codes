%s A B DEAD

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\r\n] BEGIN DEAD;
<INITIAL>(\r?\n) BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}

<A>1 BEGIN B;
<A>0 BEGIN DEAD;
<A>[^01\r\n] BEGIN DEAD;
<A>(\r?\n) BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}

<B>0 BEGIN B;
<B>1 BEGIN B;
<B>[^01\r\n] BEGIN DEAD;
<B>(\r?\n) BEGIN INITIAL; {fprintf(yyout, "Accepted\n");}

<DEAD>[^\r\n] BEGIN DEAD;
<DEAD>(\r?\n) BEGIN INITIAL; {fprintf(yyout, "Not Accepted\n");}
%%

int yywrap(){}
int main()
{
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	yylex();
}