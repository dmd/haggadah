REMOTE = dibblestan@dibblestan.org:dibblestan.org/seder/

default:
	asciidoctor haggadah.adoc

upload: default pdf
	rsync -r --delete haggadah.pdf haggadah.html media $(REMOTE)

pdf: default
	wkhtmltopdf haggadah.html haggadah.pdf

booklet: pdf
	pdfbook haggadah.pdf

all: booklet upload


clean:
	rm -f haggadah.html haggadah.pdf haggadah-book.pdf

