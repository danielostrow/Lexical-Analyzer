/*
 * Daniel Ostrow
 * CMSC 430 Compiler Theory and Design - Project 1: Lexical Analyzer
 * June 24th, 2025
 * 
 * listing.cc - Implementation of compilation listing and error reporting functions
 * 
 * This file contains the bodies of the functions that produce the compilation 
 * listing with enhanced error reporting capabilities. Key features include:
 * - Multiple error tracking per line using vectors
 * - Separate counters for lexical, syntax, and semantic errors
 * - Proper success/failure reporting
 * - Enhanced error categorization and display
 */

// This file contains the bodies of the functions that produces the 
// compilation listing

#include <cstdio>
#include <string>
// *** ADDED: Vector support for handling multiple errors per line ***
#include <vector>

using namespace std;

#include "listing.h"

static int lineNumber;
// *** MODIFIED: Changed from single error string to vector for multiple errors per line ***
static vector<string> errors;
// *** ADDED: Separate counters for different error types as required ***
static int lexicalErrors = 0;
static int syntaxErrors = 0;
static int semanticErrors = 0;

static void displayErrors();

void firstLine()
{
	lineNumber = 1;
	printf("\n%4d  ",lineNumber);
}

void nextLine()
{
	displayErrors();
	lineNumber++;
	printf("%4d  ",lineNumber);
}

int lastLine()
{
	printf("\r");
	displayErrors();
	printf("     \n");
	
	// *** ADDED: Calculate total errors and display appropriate success/error message ***
	int totalErrors = lexicalErrors + syntaxErrors + semanticErrors;
	
	if (totalErrors == 0) {
		printf("Compiled Successfully\n");
	} else {
		if (lexicalErrors > 0)
			printf("Lexical Errors %d\n", lexicalErrors);
		if (syntaxErrors > 0)
			printf("Syntax Errors %d\n", syntaxErrors);
		if (semanticErrors > 0)
			printf("Semantic Errors %d\n", semanticErrors);
	}
	
	return totalErrors;
}
    
void appendError(ErrorCategories errorCategory, string message)
{
	string messages[] = { "Lexical Error, Invalid Character ", "",
		"Semantic Error, ", "Semantic Error, Duplicate ",
		"Semantic Error, Undeclared " };

	string errorMsg = messages[errorCategory] + message;
	// *** MODIFIED: Store errors in vector instead of single string for multiple errors per line ***
	errors.push_back(errorMsg);
	
	// *** ADDED: Track different error types separately for proper reporting ***
	switch (errorCategory) {
		case LEXICAL:
			lexicalErrors++;
			break;
		case SYNTAX:
			syntaxErrors++;
			break;
		default:
			semanticErrors++;
			break;
	}
}

void displayErrors()
{
	// *** MODIFIED: Display all errors from vector instead of single error string ***
	for (const string& error : errors) {
		if (!error.empty())
			printf("%s\n", error.c_str());
	}
	errors.clear();
}
