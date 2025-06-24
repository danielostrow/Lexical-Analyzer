# Daniel Ostrow - Project 1
## CMSC 430 Compiler Theory and Design
### June 24th, 2025

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

## Discussion of Approach

When I started working on this lexical analyzer, I knew I needed to take a systematic approach to extend the skeleton code while keeping everything clean and organized. The main goal was to build something that would handle all the required language features properly while being easy to understand and maintain.

For token recognition, I decided to use a comprehensive pattern-matching approach with flex regular expressions. The key was making sure I prioritized the longest-match principle, especially for complex tokens like real numbers with scientific notation. I also had to be really careful about the ordering of rules to prevent conflicts between similar patterns - for example, making sure identifiers didn't accidentally capture reserved words.

One of the biggest improvements I made was enhancing the error handling system. The original skeleton could only handle one error per line, but I extended it to handle multiple errors per line using vectors. I also implemented separate counters for different types of errors (lexical, syntax, semantic) and added a "Compiled Successfully" message for clean builds, which makes the user feedback much better.

I spent quite a bit of time restructuring the project organization. I moved everything into logical directories like src/, tests/, docs/, and build/, then updated the build system to support this organized structure. I also created an automated build script to make the development workflow much smoother.

For the actual language features, I added support for multiple real number formats including scientific notation, implemented hexadecimal literal recognition with flexible patterns that could handle various digit and letter combinations, enhanced the identifier pattern to support underscores properly, and added Ada-style comments alongside the existing C++ style comments.

When it came to technical decisions, I chose to use multiple real number patterns (real1 through real5) to handle different formats rather than trying to create one massive, complex pattern. This made the code much more maintainable and easier to debug. I also separated the character literal patterns for standard and escaped characters to keep things clear, and implemented a flexible hexadecimal pattern that could accept various valid combinations.

For the build system, I decided to separate source and build artifacts to maintain a clean development environment. I used relative paths and include directories to support the organized structure and implemented comprehensive makefile targets that would work well for the entire development workflow.

## Lessons Learned

Working on this lexical analyzer taught me a lot about both the technical aspects of compiler design and the practical side of software development. One of the biggest things I learned was that complex regular expression patterns are often better when you split them into multiple simpler patterns. When I first tried to create one massive regex for real numbers, it was a nightmare to debug and understand. Breaking it down into real1 through real5 made everything so much cleaner and easier to work with. The debugging time went way down, and anyone reading the code could actually understand what each pattern was supposed to match.

Another major insight was how much better vector-based error storage is compared to string concatenation. The original skeleton code could only handle one error per line, but switching to a vector of strings allowed me to properly handle multiple errors per line. This made a huge difference in the user experience because now people could see all the problems on a line at once instead of having to fix them one at a time.

Building comprehensive test cases early turned out to be one of the smartest things I did. I created test1.txt through test8.txt covering all kinds of edge cases and normal operations, and this caught several bugs that would have been really difficult to find later. I also learned the value of documenting changes as I made them. Adding detailed comments explaining each modification from the skeleton made code review and debugging much more efficient.

I ran into some interesting challenges. Initially, my identifier pattern was too greedy and kept capturing reserved words, which was frustrating. I learned that flex uses longest match, so the reserved word patterns needed to come first in the file. This taught me that order really matters in lexical analyzer rule specification.

Handling character literals properly was another challenge. I needed to support both regular characters and escape sequences, and trying to do it all in one pattern was messy. Using separate patterns (char1 and char2) for different character types worked much better and taught me that complex token types often need multiple pattern approaches.

The multi-format real numbers were probably the trickiest part. Supporting scientific notation, decimals, and various real formats seemed overwhelming at first, but creating a comprehensive set of patterns covering all the required formats worked well. This experience taught me that really thorough specification analysis upfront prevents incomplete implementations later.