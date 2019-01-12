\d .analyser

minTempSpreadDay:{[parsedRows]
    withSpreads:update tempSpread:MxT-MnT from parsedRows;
    first exec Dy from withSpreads where tempSpread=min tempSpread}

minForAgainstGoalSpread:{[parsedRows]
    withSpreads:update forAgainstGoalSpread:abs F-A from parsedRows;
    first exec Team from withSpreads where forAgainstGoalSpread=min forAgainstGoalSpread}
