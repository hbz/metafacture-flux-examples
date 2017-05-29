default in = FLUX_DIR + "bib-data.pica.gz";
default out = FLUX_DIR +"sample1-out.txt";

in
|open-file
|as-lines
|decode-pica
|encode-formeta(style="multiline")
|write(out);
