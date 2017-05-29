default authoritydata = FLUX_DIR + "authority-persons.pica.gz";
default wikidata = FLUX_DIR + "wiki-persons.foma.gz";
default out = FLUX_DIR + "sample6-out.txt";

// Prepare GND data:

authoritydata
|open-file
|as-lines
|decode-pica
|stream-to-triples
|@X;

// Prepare Wikidata:

wikidata
|open-file
|as-lines
|decode-formeta
|morph(FLUX_DIR + "enrich-wiki.xml")
|stream-to-triples(redirect="true")
|@X;

// Join both by subject:

@X
|wait-for-inputs("2")
|sort-triples(by="subject")
|collect-triples
|encode-formeta(style="multiline")
|write(out);
