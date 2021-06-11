%{

%}

%%
[a-zA-Z_][a-zA-Z_0-9]* 		{fprintf(yyout, "Valid ID\n");}
[^ \t\n\f\v\r\b]+				{fprintf(yyout, "Invalid ID\n");}
.|\n ;
%%

int main()
{
    yyin = fopen("input.txt", "r");//create it ur self
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}