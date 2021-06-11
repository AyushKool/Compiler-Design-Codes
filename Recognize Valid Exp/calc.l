%{
#define ID_LEN 3
#include"y.tab.h"
%}

%%
[0-9]+ 		 {yylval.n = atoi(yytext); return NUMBER;}
[a-zA-Z]+	 {if (yyleng <= ID_LEN) {yylval.id = yytext; return ID;}}
[-+/*()\n]							{return yytext[0];}
[ ] ;
. 			 ;
%%