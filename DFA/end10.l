%{
%}
  
%s A B DEAD
  
%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}
  
<A>1 BEGIN A;
<A>0 BEGIN B;
<A>[^01\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}
  
<B>0 BEGIN INITIAL;
<B>1 BEGIN A;
<B>[^01\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Accepted\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 
%%

int main()
{
	//odd 0 and even 1
	printf("Enter String:\n");
	yylex();
	return 0;
}