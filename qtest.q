\d .qtest

test:{[description;testfunc]
    -1 description;
    if[testfunc[]; :1b];
    -1 "\tTest failed";}
