%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%
"EOF"	exit(0);
"a"	return A;
"b"	return B;
[ \t]+	;
. 	exit(1);
%%

int yywrap(){return 1;}
