\d .qtest

\l ../../termcolour.q

.qtest.failures::()
.qtest.passes::()

test:{[description;testfunc]
    -1 "- ",description;
    result:testfunc[];
    $[result;.termcolour.green "\tPass";.termcolour.red "\tFail"];
    $[result;
        passes::passes,enlist description;
        failures::failures,enlist description];}

report:{
    nFails:count .qtest.failures;
    if[0~nFails;.termcolour.green (string count .qtest.passes), " tests passed."; :0];
    -1 "\nFailed tests:";
    .termcolour.red each "- ",/:.qtest.failures;
    .termcolour.red "\n",(string nFails)," tests failed";
    .termcolour.green (string count .qtest.passes), " tests passed";
    1}
