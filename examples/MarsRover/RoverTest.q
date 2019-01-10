\l ../../qtest.q
\l ../../assertq.q

\l Rover.q

canMoveNorth:.qtest.test["The Rover can move north";{
    rover:.rover.new[0;0;`N];
    rover:.rover.move[rover];
    .assert.equal[1;rover`y]}]
