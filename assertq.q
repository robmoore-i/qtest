\d .assert

\l ../../termcolour.q

equal:{[expected;actual]
    if[expected~actual; :1b];
    .termcolour.red "\tExpected: ",raze string expected;
    .termcolour.red "\tActual:   ",raze string actual;
    0b}
