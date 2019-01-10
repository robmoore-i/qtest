\d .assert

equal:{[expected;actual]
    if[expected~actual; :1b];
    -1 "Test failed";}
