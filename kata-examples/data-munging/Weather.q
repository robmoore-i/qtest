\l Parser.q
\l Analyser.q

\d .weather

minTempSpreadDay:{[rows]
    parsedRows:.parser.parse rows;
    .analyser.minTempSpreadDay parsedRows}
