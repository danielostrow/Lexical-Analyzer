#!/bin/bash

#
# Daniel Ostrow
# CMSC 430 Compiler Theory and Design - Project 1: Lexical Analyzer
# June 24th, 2025
#
# build.sh - Automated build script for the lexical analyzer project
#
# This script provides a convenient way to build the entire lexical analyzer
# project with proper error handling and user feedback. Automates the make
# process and provides helpful usage information for testing the analyzer.
#

set -e  # Exit on any error

echo "Building Lexical Analyzer..."
cd src
make
cd ..

echo "Build complete!"
echo ""
echo "Files generated:"
echo "   - build/compile         (main executable)"
echo "   - build/scanner.c       (generated from scanner.l)"
echo "   - build/*.o            (object files)"
echo ""
echo "Usage examples:"
echo "   cd src && ../build/compile < ../tests/test1.txt"
echo "   cd src && ../build/compile < ../tests/test_final.txt"
echo ""
echo "Check tokens: cat build/lexemes.txt"