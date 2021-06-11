
%s A B C DEAD

%%
<INITIAL>[+-]?[0-9] BEGIN A;
<INITIAL>[_a-zA-Z] BEGIN C;
<INITIAL>. BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;

<A>[0-9] BEGIN A;
<A>\n {BEGIN INITIAL;printf("Valid Integer\n");}
<A>"." BEGIN B;
<A>. {BEGIN DEAD;}

<B>[0-9] BEGIN B;
<B>\n {BEGIN INITIAL;printf("Valid Float\n");}
<B>. {BEGIN DEAD;}

<C>[_a-zA_Z0-9] BEGIN C;
<C>\n {BEGIN INITIAL;printf("Valid Identifier\n");}
<C>. {BEGIN INITIAL;printf("Invalid input\n");}

<DEAD>. BEGIN DEAD;
<DEAD>\n {BEGIN INITIAL;printf("Invalid input\n");}
%%