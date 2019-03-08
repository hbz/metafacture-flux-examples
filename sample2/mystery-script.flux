//-------------------------------------
// Exercise 2a
//-------------------------------------

// Find out what this script is doing.
// log-stream and log-object help you
// to look into the stream of data.

default in = FLUX_DIR + "input.foma.gz";
default out = FLUX_DIR + "output.txt.gz";

in
|open-file
|as-lines
|filter-strings("geburts", passMatches="false")
|decode-formeta
|morph(FLUX_DIR + "mystery-morph-1.xml")
|morph(FLUX_DIR + "mystery-morph-2.xml")
|encode-literals
|write(out);
