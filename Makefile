all: latexsheet.pdf latexsheet-a4.pdf index.html latexsheet-0.png

clean:
	rm -f latexsheet.pdf latexsheet-a4.tex latexsheet-a4.pdf \
	      latexsheet-0.png latexsheet-1.png \
	      latexsheet.out latexsheet-a4.out


latexsheet.pdf: latexsheet.tex
	pdflatex latexsheet.tex
	rm -f latexsheet.aux latexsheet.log

# OK, this is kind of a hack to add 'a4paper' to the header
latexsheet-a4.tex: latexsheet.tex
	cat latexsheet.tex | sed -e 's/\\usepackage\[landscape\]/\\usepackage\[a4paper,landscape\]/' > latexsheet-a4.tex

latexsheet-a4.pdf: latexsheet-a4.tex
	pdflatex latexsheet-a4.tex
	rm -f latexsheet-a4.tex latexsheet-a4.aux latexsheet-a4.log

latexsheet-0.png: latexsheet.pdf
	convert -density 100x100 latexsheet.pdf latexsheet.png
