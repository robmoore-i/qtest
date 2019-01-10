\d .assert

\l ../../termcolour.q

equal:{[expected;actual]
    if[expected~actual; :1b];
    .termcolour.red "\tExpected: ",raze string expected;
    .termcolour.red "\tActual:   ",raze string actual;
    0b}

collectionIndentedString:{[collection]"\n\t\t",ssr[.Q.s collection;"\n";"\n\t\t"]}

.assert.in:{[member;collection]
    if[member in collection; :1b];
    .termcolour.red "\tExpected member: ",.Q.s member;
    .termcolour.red "\tIn collection:   ",(collectionIndentedString collection);
    .termcolour.red "\tWith count:      ",string count collection;
    0b}
