%{
#include<stdio.h>
#include<string.h>
int MAX = -1, MIN = 2000;
char maxw[50] = "", minw[50] = "";

void setMinMax(char* word, int len)
{
	if(len < MIN)MIN = len, strcpy(minw, word); 
	if(len > MAX)MAX = len, strcpy(maxw, word);
}
%}

%%
[a-zA-Z]+ {printf("(%s:%d)\n", yytext, (int)strlen(yytext));setMinMax(yytext, yyleng);}//word
.|\n ;
%%

int yywrap(){}

int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
	printf("Words:\n");
    yylex();
    fprintf(yyout, "Max: %s\nMin: %s", maxw, minw);
    return 0;
}
//[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
