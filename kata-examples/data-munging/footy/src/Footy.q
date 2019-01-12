\l ../src/Parser.q
\l ../../analyser/src/Analyser.q

\d .footy

minForAgainstGoalSpread:{[rows].analyser.minForAgainstGoalSpread .parser.parse rows}
