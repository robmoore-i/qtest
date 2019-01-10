\d .rover

new:{[startX;startY;startDirection]`x`y`d!(startX;startY;startDirection)}
move:{[rover]
    rover[`y]+:$[`N~rover`d;1;-1];
    rover}
