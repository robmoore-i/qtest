\d .qtest

\l ../../termcolour.q

.qtest.failures::()
.qtest.passes::()

test:{[description;testfunc]
    -1 "- ",description;
    err:@[testfunc;`;{x}];
    result:or[()~err;null err];
    $[result;.termcolour.green "\tPass";.termcolour.red "\tFail"];
    $[result;
        passes::passes,enlist description;
        failures::failures,enlist description];}

report:{
    nFails:count .qtest.failures;
    if[0~nFails;.termcolour.green "\n",(string count .qtest.passes), " tests passed"; :0];
    -1 "\nFailed tests:";
    .termcolour.red each "- ",/:.qtest.failures;
    .termcolour.red "\n",(string nFails)," tests failed";
    .termcolour.green (string count .qtest.passes), " tests passed";
    nFails}

testWithCleanup:{[description;testfunc;cleanupfunc]
    -1 "- ",description;
    err:@[testfunc;`;{x}];
    result:or[()~err;null err];
    $[result;.termcolour.green "\tPass";.termcolour.red "\tFail"];
    cleanupfunc[];
    $[result;
        passes::passes,enlist description;
        failures::failures,enlist description];}

testWithSetupAndCleanup:{[description;setupfunc;testfunc;cleanupfunc]
    -1 "- ",description;
    setupfunc[];
    err:`$@[testfunc;`;{x}];
    result:or[()~err;null err];
    $[result;.termcolour.green "\tPass";.termcolour.red "\tFail"];
    cleanupfunc[];
    $[result;
        passes::passes,enlist description;
        failures::failures,enlist description];}
