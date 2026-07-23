#!/bin/bash
# PDF Font Removal Script
# Iterates all PDF files in the current directory and removes embedded fonts using Ghostscript

# Check if Ghostscript (gs) is installed
if ! command -v gs &> /dev/null; then
    echo "Error: Ghostscript (gs) is not installed. Please install it first."
    exit 1
fi

# Iterate all PDF files in the current directory
for pdf_file in *.pdf; do
    # Check if any PDF files exist
    if [ ! -f "$pdf_file" ]; then
        echo "No PDF files found in the current directory."
        exit 0
    fi

    # Get filename without extension
    filename=$(basename "$pdf_file" .pdf)

    # Build output filename: original_name_nofont.pdf
    output_file="${filename}_nofont.pdf"

    echo "Processing: $pdf_file -> $output_file"

    # Execute Ghostscript command
    gs -o "$output_file" -dNoOutputFonts -sDEVICE=pdfwrite "$pdf_file"

    if [ $? -eq 0 ]; then
        echo "[OK] Success: $output_file"
    else
        echo "[FAIL] Failed: $pdf_file"
    fi

    echo "---"
done

echo "All done!"
