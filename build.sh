#!/bin/bash

# CMSC 430 Project 1 - Lexical Analyzer Build Script

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