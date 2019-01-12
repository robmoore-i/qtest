\d .parser

parseTeam:{[row]trim 7 13 sublist row}

parseGoalsFor:{[row]"J"$43 3 sublist row}

parseGoalsAgainst:{[row]"J"$50 3 sublist row}

parseRow:{[row](`Team`F`A)!(parseTeam row;parseGoalsFor row;parseGoalsAgainst row)}

.parser.parse:{[rows]parseRow each 1_rows}
