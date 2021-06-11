%{

%}

%%
[+-]?[0-9]
%%



int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}