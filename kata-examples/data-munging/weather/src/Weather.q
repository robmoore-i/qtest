\l ../src/Parser.q
\l ../../analyser/src/Analyser.q

\d .weather

minTempSpreadDay:{[rows].analyser.minTempSpreadDay .parser.parse rows}
