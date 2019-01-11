\l ../../qtest.q
\l ../../assertq.q

\l Rover.q

.qtest.test["The Rover can move north";{
    rover:.rover.new[0;0;`N];
    rover:.rover.move[rover];
    .assert.equal[1;rover`y];}]

.qtest.test["The Rover can move south";{
    rover:.rover.new[0;1;`S];
    rover:.rover.move[rover];
    .assert.equal[0;rover`y];}]

.qtest.test["The Rover can pick up a moon rock";{
    rover:.rover.new[0;1;`S];
    moonRock:"A shiny moon rock";
    rover:.rover.pickup[rover;moonRock];
    .assert.in[moonRock;rover`collector];}]

.qtest.testWithCleanup["The Rover can save its position to a file";{
    rover:.rover.new[3;4;`E];
    testFileHandle:`:TestRoverPosition.txt;
    .rover.savePositionToFile[rover;testFileHandle];
    fileContent:read0 testFileHandle;
    .assert.equal["3 4 E";first fileContent];};
    {
        hdel `:TestRoverPosition.txt;
    }]

.qtest.testWithSetupAndCleanup["The Rover can be created from a file";
    {
        h:hopen `:TestRoverPosition.txt;
        (neg h) "3 4 E";
        hclose h;
    };{
    -1 "\n  (This test is supposed to fail)";
    rover:.rover.fromFile[`:TestRoverPosition.txt];
    .assert.equal[`x`y`d!(3;4;`E);rover];};
    {
        hdel `:TestRoverPosition.txt;
    }]

exit .qtest.report[]
