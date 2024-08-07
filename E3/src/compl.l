%option yylineno
%{

// yylineno    - variable to track line numbers 
//               that copies otherwise unmatched input to yyout.

#include "token.h"

%}

%%
"//".* /* ignore comments */
[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }
[0-9]+                    { return NUM; }
\"([^\\\"]|\\.)*\"        { return STR; }
\'([^\\\']|\\.)\'         { return CHAR; }
"function"|"integer"|"read"|"if"|"print" { return KEY; }
[:;()=,{}]                { return SYM; }
"<="                      { return SYMC; }
\n {/* ignore*/ }
[ \t] { /* ignore whitespace */ }
.                         { return ERROR; }
%%

int yywrap() {
    return 1;
}
