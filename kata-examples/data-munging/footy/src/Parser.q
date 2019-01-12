\d .parser

parseTeam:{[row]trim 7 13 sublist row}

parseRow:{[row](enlist `Team)!enlist parseTeam row}

.parser.parse:{[rows]parseRow each 1_rows}
