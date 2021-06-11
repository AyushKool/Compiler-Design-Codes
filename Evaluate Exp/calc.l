%{
	#include "y.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?([eE][0-9]+)?		{yylval.val = atof(yytext); return NUM;}
[+-/*()$\n]							{return yytext[0];}
.										{printf("Expression Invalid");exit(0);};
%%