# Variables
REMOTE := "dibblestan@dibblestan.org:dibblestan.org/seder/"
REMOTE2 := "edges@3e.org:3e.org/seder/"

# Default recipe
default:
    asciidoctor haggadah.adoc

# Upload recipe depends on default and pdf
upload: default pdf
    rsync -r --delete haggadah-book.pdf haggadah.pdf haggadah.html media {{REMOTE}}
    rsync -r --delete haggadah-book.pdf haggadah.pdf haggadah.html media {{REMOTE2}}

# PDF recipe depends on default
pdf: default
    asciidoctor-pdf haggadah.adoc

# Booklet recipe depends on pdf
booklet: pdf
    pdfbook2 haggadah.pdf

# All recipe depends on booklet and upload
all: booklet upload

# Clean recipe
clean:
    rm -f haggadah.html haggadah.pdf haggadah-book.pdf
