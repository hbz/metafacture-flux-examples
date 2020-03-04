//-------------------------------------
// Exercise 2a
//-------------------------------------

// Find out what this script is doing.
// log-stream and log-object help you
// to look into the stream of data.

"input.foma.gz"
|open-file
|as-lines
|filter-strings("geburts", passMatches="false")
|decode-formeta
|morph("mystery-morph-1.xml")
|morph("mystery-morph-2.xml")
|encode-literals
|write("stdout");
