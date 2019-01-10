\d .qtest

test:{[description;testfunc]
    if[testfunc[]; :1b];
    -1 description;
    -1 "\tTest failed";}
