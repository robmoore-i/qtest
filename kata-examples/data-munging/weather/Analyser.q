\d .analyser

minTempSpreadDay:{[parsedRows]
    withSpreads:update tempSpread:MxT-MnT from parsedRows;
    first exec Dy from withSpreads where tempSpread=min tempSpread}
