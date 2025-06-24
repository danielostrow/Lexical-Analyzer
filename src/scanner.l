/* CMSC 430 Compiler Theory and Design
   Project 1 Skeleton
   UMGC CITE
   Summer 2023 */

/* This file contains flex input file */

%{
#include <cstdio>
#include <string>

using namespace std;

#include "listing.h"
#include "tokens.h"

%}

%option noyywrap

ws		[ \t\r]+
comment		"//".*\n
newcomment	"--".*\n
line		[\n]
id		[A-Za-z]([A-Za-z0-9]|_{1,2}[A-Za-z0-9])*
digit		[0-9]
dec		{digit}+
real1		{digit}+\.{digit}+
real2		\.{digit}+
real3		{digit}+\.{digit}+[Ee][+-]?{digit}+
real4		\.{digit}+[Ee][+-]?{digit}+
real5		{digit}+[Ee][+-]?{digit}+
hex		#{digit}*[A-Fa-f]+{digit}*[A-Fa-f]*
char1		'[^\\']'
char2		'\\.'
punc		[\(\),:;]

/* *** CHANGES FROM ORIGINAL SKELETON ***
 * ADDED: newcomment - Support for Ada-style comments ("--")
 * MODIFIED: id - Updated identifier pattern from [A-Za-z]([A-Za-z0-9])* to allow underscores
 * ADDED: real1-real5 - Multiple real number formats (original only had basic integer)
 * ADDED: hex - Hexadecimal literal support (#2aF format)
 * MODIFIED: char1,char2 - Enhanced character literal support (original was just '.')
 */
%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine(); }
{newcomment}	{ ECHO; nextLine(); } /* *** ADDED: Handler for new Ada-style comments *** */
{line}		{ ECHO; nextLine(); }
"+"		{ ECHO; return(ADDOP); }
"-"		{ ECHO; return(ADDOP); } /* *** ADDED: Subtraction operator *** */
"*"		{ ECHO; return(MULOP); }
"/"		{ ECHO; return(MULOP); } /* *** ADDED: Division operator *** */
"%"		{ ECHO; return(MODOP); } /* *** ADDED: New arithmetic operators *** */
"^"		{ ECHO; return(EXPOP); }
"&"		{ ECHO; return(ANDOP); }
"|"		{ ECHO; return(OROP); } /* *** ADDED: New logical operators *** */
"!"		{ ECHO; return(NOTOP); }
"~"		{ ECHO; return(NOTOP); }
"<"		{ ECHO; return(RELOP); }
"<="		{ ECHO; return(RELOP); } /* *** ADDED: Additional relational operators *** */
">"		{ ECHO; return(RELOP); }
">="		{ ECHO; return(RELOP); }
"="		{ ECHO; return(RELOP); }
"/="		{ ECHO; return(RELOP); }
"<>"		{ ECHO; return(RELOP); }
"=>"		{ ECHO; return(ARROW); }
begin		{ ECHO; return(BEGIN_); }
case		{ ECHO; return(CASE); }
character	{ ECHO; return(CHARACTER); }
end		{ ECHO; return(END); }
endcase		{ ECHO; return(ENDCASE); } /* *** ADDED: New reserved word *** */
endswitch	{ ECHO; return(ENDSWITCH); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
list		{ ECHO; return(LIST); }
of		{ ECHO; return(OF); }
others		{ ECHO; return(OTHERS); }
returns		{ ECHO; return(RETURNS); }
switch		{ ECHO; return(SWITCH); }
when		{ ECHO; return(WHEN); }
number		{ ECHO; return(NUMBER); } /* *** ADDED: Additional reserved words *** */
real		{ ECHO; return(REAL); }
if		{ ECHO; return(IF); }
then		{ ECHO; return(THEN); }
fold		{ ECHO; return(FOLD); }
left		{ ECHO; return(LEFT); }
right		{ ECHO; return(RIGHT); }
endfold		{ ECHO; return(ENDFOLD); }
elsif		{ ECHO; return(ELSIF); }
else		{ ECHO; return(ELSE); }
endif		{ ECHO; return(ENDIF); }

{id}		{ ECHO; return(IDENTIFIER);}
{real1}		{ ECHO; return(REAL_LITERAL); } /* *** ADDED: Multiple real literal formats *** */
{real2}		{ ECHO; return(REAL_LITERAL); }
{real3}		{ ECHO; return(REAL_LITERAL); }
{real4}		{ ECHO; return(REAL_LITERAL); }
{real5}		{ ECHO; return(REAL_LITERAL); }
{hex}		{ ECHO; return(HEX_LITERAL); } /* *** ADDED: Hexadecimal literal support *** */
{dec}		{ ECHO; return(INT_LITERAL); }
{char1}		{ ECHO; return(CHAR_LITERAL); } /* *** MODIFIED: Enhanced character literals *** */
{char2}		{ ECHO; return(CHAR_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%

int main() {
	firstLine();
	
	// *** MODIFIED: Changed output path to build directory for organized project structure ***
	FILE *file = fopen("../build/lexemes.txt", "wa"); 
	int token = yylex();
	while (token) {
		fprintf(file, "%d %s\n", token, yytext);
		token = yylex();
	}
	lastLine();
	fclose(file);
	return 0;
}