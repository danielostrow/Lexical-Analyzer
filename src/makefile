#
# Daniel Ostrow
# CMSC 430 Compiler Theory and Design - Project 1: Lexical Analyzer
# June 24th, 2025
#
# makefile - Build configuration for the lexical analyzer project
#
# This makefile orchestrates the build process for the lexical analyzer,
# including flex code generation, compilation, and organized output to
# the build directory. Features include:
# - Organized directory structure with separate build output
# - Proper dependency management between generated and source files
# - Include path handling for header files
# - Clean build targets for development workflow
#

# CMSC 430 Compiler Theory and Design - Project 1
# *** MODIFIED: Updated makefile for new directory structure ***

# *** ADDED: Build directory variables for organized project structure ***
BUILD_DIR = ../build
SRC_DIR = .

# *** MODIFIED: Updated targets to use build directory instead of current directory ***
$(BUILD_DIR)/compile: $(BUILD_DIR)/scanner.o $(BUILD_DIR)/listing.o
	g++ -o $(BUILD_DIR)/compile $(BUILD_DIR)/scanner.o $(BUILD_DIR)/listing.o
	
$(BUILD_DIR)/scanner.o: $(BUILD_DIR)/scanner.c listing.h tokens.h
	# *** ADDED: Include path flag to find headers in src directory ***
	g++ -c $(BUILD_DIR)/scanner.c -I$(SRC_DIR) -o $(BUILD_DIR)/scanner.o

$(BUILD_DIR)/scanner.c: scanner.l
	mkdir -p $(BUILD_DIR)
	flex scanner.l
	# *** MODIFIED: Move generated file to build directory ***
	mv lex.yy.c $(BUILD_DIR)/scanner.c

$(BUILD_DIR)/listing.o: listing.cc listing.h
	mkdir -p $(BUILD_DIR)
	# *** MODIFIED: Output object file to build directory ***
	g++ -c listing.cc -o $(BUILD_DIR)/listing.o

# *** ADDED: Convenience targets ***
compile: $(BUILD_DIR)/compile

# *** MODIFIED: Clean target now removes entire build directory ***
clean:
	rm -rf $(BUILD_DIR)

# *** ADDED: Ensure build directory exists ***
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# *** ADDED: Phony targets declaration ***
.PHONY: compile clean
