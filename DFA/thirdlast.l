%{
%}
%s A B C D E F G DEAD
%%
<INITIAL>b BEGIN INITIAL;
<INITIAL>a BEGIN A;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf(" Not Accepted\n");}
<A>b BEGIN E;
<A>a BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}
<B>a BEGIN C;
<B>b BEGIN G;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");}
<C>b BEGIN G;
<C>a BEGIN C;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Accepted\n");}
<D>b BEGIN INITIAL;
<D>a BEGIN A;
<D>[^ab\n] BEGIN DEAD;
<D>\n BEGIN INITIAL; {printf("Accepted\n");}
<E>b BEGIN D;
<E>a BEGIN F;
<E>[^ab\n] BEGIN DEAD;
<E>\n BEGIN INITIAL; {printf("Not Accepted\n");}
<F>b BEGIN E;
<F>a BEGIN B;
<F>[^ab\n] BEGIN DEAD;
<F>\n BEGIN INITIAL; {printf("Accepted\n");}
<G>b BEGIN D;
<G>a BEGIN F;
<G>[^ab\n] BEGIN DEAD;
<G>\n BEGIN INITIAL; printf("Accepted\n");
<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}
%%
int main()
{
yylex();
return 0;
}
int yywrap(){}