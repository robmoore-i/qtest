\d .parser

maxTemp:{[rows;dayNum]"J"$5 3 sublist rows[dayNum]}

parseRow:{[maxTempProjection;dayNum]
    `MxT`Dy!(maxTempProjection dayNum;dayNum)}

.parser.parse:{[rows]
    maxTempProjection:maxTemp[rows;];
    parseRow[maxTempProjection;] each 1 2}
