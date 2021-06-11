%{
#include<math.h>
int i = 0, f = 0;
%}

%%
[+-]?[0-9]+ 			 {printf("Integer: %s\n", yytext);++i;}
[+-]?[0-9]+"."[0-9]+  	 {printf("Float: %s\n", yytext);++f;}
[^ \t\n\f\v\r\b]+  	     {printf("Invalid input: %s (Expected an Int or float)\n", yytext);}
.|\n ;
%%

int yywrap(){}
//([0-9]|[^0-9\n\t ])* {printf("Not Integer: %s\n", yytext);}
int main()
{
	yylex();
	printf("\nInts: %d, Floats: %d\n", i, f);
}
