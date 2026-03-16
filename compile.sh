#!/bin/bash

echo "Compiling LaTeX presentation..."
echo "================================"

echo "First pass..."
pdflatex -interaction=nonstopmode -output-directory=build main.tex

echo "Second pass..."
pdflatex -interaction=nonstopmode -output-directory=build main.tex

if [ -f "build/main.pdf" ]; then
    mv build/main.pdf ./presentation.pdf
    echo "================================"
    echo "✓ Compilation successful!"
    echo "✓ PDF generated: presentation.pdf"
    echo "================================"
    ls -lh presentation.pdf
else
    echo "================================"
    echo "✗ Compilation failed!"
    echo "Check build/main.log for errors"
    echo "================================"
    exit 1
fi
