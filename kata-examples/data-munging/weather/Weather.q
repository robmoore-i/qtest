\l Parser.q
\l Analyser.q

\d .weather

minTempSpreadDay:{[rows].analyser.minTempSpreadDay .parser.parse rows}
