# Daniel Ostrow - Project 1
## CMSC 430 Compiler Theory and Design

### Project Summary

A complete lexical analyzer implementation for a custom programming language compiler. The project extends the provided skeleton code to support all required language features including additional reserved words, operators, literals, and enhanced error reporting. The implementation follows the recommended approach and passes all test cases with proper token recognition and error handling.

### Project Structure Changes

```diff
CompilerClass/
+ ├── src/                    # Source code
+ │   ├── scanner.l          # Flex lexer specification
+ │   ├── tokens.h           # Token definitions
+ │   ├── listing.cc         # Error reporting functions
+ │   ├── listing.h          # Function prototypes
+ │   └── makefile           # Build configuration
+ ├── tests/                 # Test files
+ │   ├── test1.txt - test8.txt
+ │   └── test_*.txt         # Development test files
+ ├── docs/                  # Documentation
+ │   └── Project 1 Approach.pdf
+ ├── build/                 # Build artifacts (auto-generated)
+ │   ├── compile            # Main executable
+ │   ├── scanner.c          # Generated C code
+ │   ├── *.o               # Object files
+ │   └── lexemes.txt       # Token output
+ └── README.md             # This file
- (Previously: all files in root directory)
```

### Changelog: Skeleton → Final Implementation

**Tokens Added:**
- Reserved words: `NUMBER`, `REAL`, `IF`, `THEN`, `FOLD`, `LEFT`, `RIGHT`, `ENDFOLD`, `ELSIF`, `ELSE`, `ENDIF`, `ENDCASE`
- Operators: `OROP`, `NOTOP`, `EXPOP`, `MODOP`
- Literals: `REAL_LITERAL`, `HEX_LITERAL`

**Scanner Enhancements:**
- Added Ada-style comments (`--`)
- Enhanced identifier pattern to support underscores
- Added multiple real number formats (scientific notation)
- Added hexadecimal literal support (`#2aF`)
- Enhanced character literal support (escape sequences)
- Added missing operators: `-`, `/`, `%`, `^`, `|`, `!`, `~`, `<=`, `>`, `>=`, `=`, `/=`, `<>`

**Error Reporting:**
- Implemented multiple errors per line support
- Added separate error type counting (lexical, syntax, semantic)
- Added "Compiled Successfully" message for error-free compilation
- Enhanced error display system

**Build System:**
- Organized directory structure with `src/`, `tests/`, `docs/`, `build/`
- Updated makefile for organized builds
- Added clean targets and include paths

**Testing:**
- Created test suite (test1.txt - test8.txt)
- All test cases pass with expected output
- Added development test files for edge cases