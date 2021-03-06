\d .rover

dx:{[directionLetter](`N`S`E`W!0 0 1 -1)[directionLetter]}
dy:{[directionLetter](`N`S`E`W!1 -1 0 0)[directionLetter]}

new:{[startX;startY;startDirection]`x`y`d!(startX;startY;startDirection)}

move:{[rover]
    rover[`y]+:dy rover`d;
    rover[`x]+:dx rover`d;
    rover}

pickup:{[rover;itemDescription]
    if[not `collector in key rover;rover[`collector]:enlist "Just the aliens";];
    rover[`collector],:enlist itemDescription;
    rover}

savePositionToFile:{[rover;fileHandle]
    h:hopen fileHandle;
    (neg h) raze (string rover`x)," ",(string rover`y)," ",(string rover`d);
    hclose h;}

fromFile:{[fileHandle]`x`y`d!(0;0;`N)}
