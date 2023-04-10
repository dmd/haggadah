REMOTE = dibblestan@dibblestan.org:dibblestan.org/seder/
REMOTE2 = edges@3e.org:3e.org/seder/

default:
	asciidoctor haggadah.adoc

upload: default pdf
	rsync -r --delete haggadah-book.pdf haggadah.pdf haggadah.html media $(REMOTE)
	rsync -r --delete haggadah-book.pdf haggadah.pdf haggadah.html media $(REMOTE2)

pdf: default
	asciidoctor-pdf haggadah.adoc

booklet: pdf
	pdfbook2 haggadah.pdf

all: booklet upload


clean:
	rm -f haggadah.html haggadah.pdf haggadah-book.pdf

