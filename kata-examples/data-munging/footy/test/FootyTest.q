\l ../../../../qtest.q
\l ../../../../assertq.q
\l ../../../../termcolour.q

\l ../src/Footy.q

///// Integration Tests /////

.qtest.test["Can parse first team name";{
    rows:("        Team            P     W    L   D    F      A     Pts";
          "     1. Arsenal         38    26   9   3    79  -  36    87 ";
          "     2. Liverpool       38    24   8   6    67  -  30    80 ";
          "     3. Manchester_U    38    24   5   9    87  -  45    77 ";
          "     4. Newcastle       38    21   8   9    74  -  52    71 ");

    .assert.equal["Newcastle";.footy.minForAgainstGoalSpread rows];}]

exit .qtest.report[]
