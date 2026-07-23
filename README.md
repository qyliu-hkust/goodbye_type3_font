# PDF Font Removal Script

A simple Bash script to batch-remove embedded fonts from PDF files using Ghostscript.

## What It Does

Converts text in PDFs from font-dependent rendering to pure vector outlines, eliminating the need for embedded fonts while preserving visual appearance.

## Requirements

- [Ghostscript](https://www.ghostscript.com/) (`gs` command)

### Install Ghostscript

```bash
# macOS
brew install ghostscript

# Ubuntu/Debian
sudo apt-get install ghostscript

# Fedora
sudo dnf install ghostscript
```

## Usage

1. Place the script in the folder containing your PDF files.
2. Run it:

```bash
bash pdf_nofont_batch.sh
```

## Output

For each `input.pdf`, a new file `input_nofont.pdf` is created in the same directory. Original files are left untouched.

## Example

```
Processing: report.pdf -> report_nofont.pdf
[OK] Success: report_nofont.pdf
---
All done!
```

## Technical Note

The `-dNoOutputFonts` flag instructs Ghostscript to convert glyphs into vector paths. Text remains searchable but is no longer editable as font-based text.

## License

Public domain. Use at your own risk.
