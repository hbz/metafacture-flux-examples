//-------------------------------------
// Exercise 3a
//-------------------------------------

default in = FLUX_DIR + "bib-data.pica.gz";
default out = "stdout";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "simple-transformation.xml")  // Please provide an implementation 
                                                // for this Metamorph script.
|encode-formeta(style="multiline")
|write(out);
