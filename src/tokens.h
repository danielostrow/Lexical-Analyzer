/*
 * Daniel Ostrow
 * CMSC 430 Compiler Theory and Design - Project 1: Lexical Analyzer
 * June 24th, 2025
 * 
 * tokens.h - Token enumeration definitions for the lexical analyzer
 * 
 * This header file contains the enumerated type definition for all tokens
 * recognized by the lexical analyzer. Includes operators, reserved words,
 * literals, and identifiers with proper token codes for flex/bison integration.
 * Extended from skeleton to include additional operators and reserved words.
 */

// This file contains the enumerated type definition for tokens

enum Tokens {ADDOP = 256, MULOP, ANDOP, RELOP, ARROW, BEGIN_, CASE, CHARACTER, END,
     ENDSWITCH, FUNCTION, INTEGER, IS, LIST, OF, OTHERS, RETURNS, SWITCH, WHEN,
     // *** ADDED: Additional reserved word tokens for complete language support ***
     NUMBER, REAL, IF, THEN, FOLD, LEFT, RIGHT, ENDFOLD, ELSIF, ELSE, ENDIF,
     // *** ADDED: New operator tokens for logical, arithmetic, and other operations ***
     OROP, NOTOP, EXPOP, MODOP, ENDCASE,
     // *** MODIFIED: Added REAL_LITERAL and HEX_LITERAL to original literals ***
     IDENTIFIER, INT_LITERAL, REAL_LITERAL, CHAR_LITERAL, HEX_LITERAL};
