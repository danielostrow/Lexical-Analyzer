// CMSC 430 Compiler Theory and Design
// Project 1 Skeleton
// UMGC CITE
// Summer 2023

// This file contains the enumerated type definition for tokens

enum Tokens {ADDOP = 256, MULOP, ANDOP, RELOP, ARROW, BEGIN_, CASE, CHARACTER, END,
     ENDSWITCH, FUNCTION, INTEGER, IS, LIST, OF, OTHERS, RETURNS, SWITCH, WHEN,
     // *** ADDED: Additional reserved word tokens for complete language support ***
     NUMBER, REAL, IF, THEN, FOLD, LEFT, RIGHT, ENDFOLD, ELSIF, ELSE, ENDIF,
     // *** ADDED: New operator tokens for logical, arithmetic, and other operations ***
     OROP, NOTOP, EXPOP, MODOP, ENDCASE,
     // *** MODIFIED: Added REAL_LITERAL and HEX_LITERAL to original literals ***
     IDENTIFIER, INT_LITERAL, REAL_LITERAL, CHAR_LITERAL, HEX_LITERAL};
