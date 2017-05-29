default authoritydata = FLUX_DIR + "authority-persons.pica.gz";
default bibdata = FLUX_DIR + "bib-data.pica.gz";
default out = FLUX_DIR + "sample7-out.txt";

// Prepare GND data:

authoritydata
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "summarize-authority-persons.xml")
|stream-to-triples
|@X;

// Prepare bib data (extract author IDs):

bibdata
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "morph-bib.xml")
|stream-to-triples(redirect="true")
|count-triples(countBy="subject")
|@X;

// Combine GND data and authorship counts:

@X
|wait-for-inputs("2")
|sort-triples(by="subject")
|collect-triples
|encode-formeta(style="verbose")
|write(out);
