default in = FLUX_DIR + "bib-data.pica.gz";
default out = FLUX_DIR + "sample4-out.txt";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "count.xml")
|stream-to-triples
|count-triples(countBy="object")
|template("${o} | ${s}")
|write(out);
