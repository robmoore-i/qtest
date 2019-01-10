\l ../../qtest.q
\l ../../assertq.q

\l Rover.q

.qtest.test["The Rover can move north";{
    rover:.rover.new[0;0;`N];
    rover:.rover.move[rover];
    .assert.equal[1;rover`y]}]

.qtest.test["The Rover can move south";{
    rover:.rover.new[0;1;`S];
    rover:.rover.move[rover];
    .assert.equal[0;rover`y]}]

.qtest.test["The Rover can pick up a moon rock";{
    rover:.rover.new[0;1;`S];
    moonRock:"A shiny moon rock";
    rover:.rover.pickup[rover;moonRock];
    .assert.in[moonRock;rover`collector]}]

exit .qtest.report[]
