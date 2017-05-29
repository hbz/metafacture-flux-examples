default in = FLUX_DIR + "authority-data.pica.gz";
default out = FLUX_DIR + "sample5-out.txt";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "count.xml")
|stream-to-triples
|count-triples(countBy="predicate")
|template("${s}:\t ${o}")
|write(out);
