%{
#include<stdio.h>
%}

%%
"<"[^/><]*("/>"|">") fprintf(yyout, "%s\n", yytext);//Start or single tags
"</"[^/><]*">" fprintf(yyout, "%s\n", yytext);//end tags
.
\n
%%

int yywrap(){}

int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}