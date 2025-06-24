/*
 * Daniel Ostrow
 * CMSC 430 Compiler Theory and Design - Project 1: Lexical Analyzer
 * June 24th, 2025
 * 
 * listing.h - Function prototypes for compilation listing and error reporting
 * 
 * This header file contains the function prototypes and error category 
 * enumerations for the compilation listing system. Defines the interface
 * for error tracking, line numbering, and compilation result reporting.
 */

// CMSC 430 Compiler Theory and Design
// Project 1 Skeleton
// UMGC CITE
// Summer 2023

// This file contains the function prototypes for the functions that produce
// the compilation listing

enum ErrorCategories {LEXICAL, SYNTAX, GENERAL_SEMANTIC, DUPLICATE_IDENTIFIER,
	UNDECLARED};

void firstLine();
void nextLine();
int lastLine();
void appendError(ErrorCategories errorCategory, string message);

