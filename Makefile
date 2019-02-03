.PHONY: all clean view

TARGET=gradu

gfx/%.pdf: gfx/%.dot
	dot -Tpdf < $< > $@ && pdfcrop $@ $@

all: $(patsubst %.dot,%.pdf,$(wildcard gfx/*.dot))
	latexmk $(TARGET).tex

clean:
	-rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc *.dvi *.fdb_latexmk gfx/*.pdf

view: all
	okular $(TARGET).pdf 2>/dev/null&
