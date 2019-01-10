\d .assert

equal:{[expected;actual]
    if[expected~actual; :1b];
    0b}
