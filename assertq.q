\d .assert

\l ../../termcolour.q

indentedString:{"\n\t\t",ssr[.Q.s x;"\n";"\n\t\t"]}

equal:{[expected;actual]
    if[expected~actual; :1b];
    .termcolour.red "\tExpected:   ",indentedString expected;
    .termcolour.red "\tWith count: ",string count expected;
    .termcolour.red "\tActual:     ",indentedString actual;
    .termcolour.red "\tWith count: ",string count actual;
    0b}

.assert.in:{[member;collection]
    if[member in collection; :1b];
    .termcolour.red "\tExpected member: ",.Q.s member;
    .termcolour.red "\tIn collection:   ",(indentedString collection);
    .termcolour.red "\tWith count:      ",string count collection;
    0b}
