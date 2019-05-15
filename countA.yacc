%{
#include <stdio.h>
#include <stdlib.h>

int count;

extern FILE *yyin;
%}

%start S
%token A 
%token B

%%
S	: A S {++count;}
	| B
	;
%%

void yyerror(char *err){
	fprintf(stderr, "%s\n", err);
}

int main(int argc, char* argv[]){
	char str[256];
	count = 0;

	while (1){
		str[0] = '\0';
		count = 0;
		printf(">>>");
	    	fgets(str, sizeof(str), stdin);		
		yy_scan_string(str);
		yyparse();
		printf("Number of a: %d\n", count);
	}

	return 0;
}
