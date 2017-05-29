default in = FLUX_DIR + "input.foma.gz";
default out = FLUX_DIR + "sample2-out.txt";

in
|open-file
|as-lines
|log-object("Filtering: ")
|filter-strings("geburts", passMatches="false")
|log-object("Decoding: ")
|decode-formeta
|log-stream("Morphing 1: ")
|morph(FLUX_DIR + "mystery-morph-1.xml")
|log-stream("Morphing 2: ")
|morph(FLUX_DIR + "mystery-morph-2.xml")
|log-stream("Encoding: ")
|encode-literals
|log-object("Writing: ")
|write(out);
