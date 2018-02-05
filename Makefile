OUTPUT_DIR=build/

TEX=lualatex
TEX_FLAGS=--output-dir=$(OUTPUT_DIR)

BIB=bibtex
BIB_FLAGS=

all: paper

# Build the paper specified in main.tex
paper: main.tex
	# Setup output directory
	mkdir -p $(OUTPUT_DIR)
	# Generate temp
	$(TEX) $(TEX_FLAGS) main.tex
	# Collect bib refs
	$(BIB) $(BIB_FLAGS) $(OUTPUT_DIR)/main.aux
	# Put refs in bibliography
	$(TEX) $(TEX_FLAGS) main.tex
	# Link in-text refs to bibliography numbering
	$(TEX) $(TEX_FLAGS) main.tex
