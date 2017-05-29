default in = FLUX_DIR + "bib-data.pica.gz";
default out = FLUX_DIR + "sample3-out.txt";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "simple-transformation.xml")
|encode-formeta(style="multiline")
|write(out);
