\d .parser

maxTemp:{[rows;dayNum]"J"$5 3 sublist rows[dayNum]}

minTemp:{[rows;dayNum]"J"$11 3 sublist rows[dayNum]}

parseRow:{[maxTempProjection;minTempProjection;dayNum]
    `Dy`MxT`MnT!(dayNum;maxTempProjection dayNum;minTempProjection dayNum)}

.parser.parse:{[rows]
    maxTempProjection:maxTemp[rows;];
    minTempProjection:minTemp[rows;];
    parseRow[maxTempProjection;minTempProjection;] each 1 2}
