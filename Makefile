LATEX=xelatex
LATEXFLAGS=-interaction=nonstopmode -halt-on-error
OUTDIR=out

all: $(OUTDIR)/slides.pdf $(OUTDIR)/script.pdf

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/slides.pdf: slides.tex | $(OUTDIR)
	$(LATEX) $(LATEXFLAGS) -output-directory=$(OUTDIR) slides.tex
	$(LATEX) $(LATEXFLAGS) -output-directory=$(OUTDIR) slides.tex

$(OUTDIR)/script.pdf: script.tex | $(OUTDIR)
	$(LATEX) $(LATEXFLAGS) -output-directory=$(OUTDIR) script.tex
	$(LATEX) $(LATEXFLAGS) -output-directory=$(OUTDIR) script.tex

view-xpdf: $(OUTDIR)/slides.pdf
	xpdf $(OUTDIR)/slides.pdf & disown

view-okular: $(OUTDIR)/slides.pdf
	okular $(OUTDIR)/slides.pdf & disown

view-acroread: $(OUTDIR)/slides.pdf
	acroread $(OUTDIR)/slides.pdf & disown

clean:
	rm -rf $(OUTDIR)
