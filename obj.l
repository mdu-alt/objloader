%{
#include <stdio.h>
%}

%option noyywrap

%%

-?[[:digit:]]   { printf("integer %s\n", yytext); }

-?[[:digit:]]+"."[[:digit:]]*       {
        printf("float %s\n", yytext);
}

 /* vertex data */
"v"       |
"vt"      |
"vn"      |
"vp"      { printf("vertex data %s\n", yytext); }

"p"       |
"l"       |
"f"       |
"curv"    |
"curv2"   |
"surf"    { printf("%s\n", yytext); }

"parm"    |
"trim"    |
"hole"    |
"scrv"    |
"sp"      |
"end"     { printf("free-form curve/surface body %s\n", yytext); }

"con"     { printf("connectivity %s\n", yytext); }

"g"       |
"s"       |
"mg"      |
"o"       { printf("grouping %s\n", yytext); }

"bevel"         |
"c_interp"      |
"d_interp"      |
"lod"           |
"usemtl"        |
"mtllib"        |
"shadow_obj"    |
"trace_obj"     |
"ctech"         |
"stech"         { printf("display/render attributes %s\n", yytext); }

#.*             { printf("comment %s\n", yytext); }
[[:space:]]+    { /* ignore whitespace */ }
.

%%

int main(int argc, char *argv[]) {
        if (argc > 1) {
                if (!(yyin = fopen(argv[1], "r"))) {
                        perror(argv[1]);
                        return (1);
                }
        }
        while (yylex());

        return 0;
}
