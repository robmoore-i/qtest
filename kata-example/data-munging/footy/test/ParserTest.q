\l ../../../../qtest.q
\l ../../../../assertq.q
\l ../../../../termcolour.q

\l ../src/Parser.q

.qtest.test["Can get the team with the smallest for-against goal spread from text rows";{
    rows:("        Team            P     W    L   D    F      A     Pts";
          "     1. Arsenal         38    26   9   3    79  -  36    87 ";
          "     2. Liverpool       38    24   8   6    67  -  30    80 ";
          "     3. Manchester_U    38    24   5   9    87  -  45    77 ";
          "     4. Newcastle       38    21   8   9    74  -  52    71 ");

    parsedRows:.parser.parse rows;

    .assert.equal["Arsenal";parsedRows[0;`Team]];}]

.qtest.test["Can parse fourth team name";{
    rows:("        Team            P     W    L   D    F      A     Pts";
          "     1. Arsenal         38    26   9   3    79  -  36    87 ";
          "     2. Liverpool       38    24   8   6    67  -  30    80 ";
          "     3. Manchester_U    38    24   5   9    87  -  45    77 ";
          "     4. Newcastle       38    21   8   9    74  -  52    71 ");

    parsedRows:.parser.parse rows;

    .assert.equal["Newcastle";parsedRows[3;`Team]];}]

.qtest.test["Can parse goals for";{
    rows:("        Team            P     W    L   D    F      A     Pts";
          "     1. Arsenal         38    26   9   3    79  -  36    87 ";
          "     2. Liverpool       38    24   8   6    67  -  30    80 ";
          "     3. Manchester_U    38    24   5   9    87  -  45    77 ";
          "     4. Newcastle       38    21   8   9    74  -  52    71 ");

    parsedRows:.parser.parse rows;

    .assert.equal[79;parsedRows[0;`F]];
    .assert.equal[74;parsedRows[3;`F]];}]

.qtest.test["Can parse goals against";{
    rows:("        Team            P     W    L   D    F      A     Pts";
          "     1. Arsenal         38    26   9   3    79  -  36    87 ";
          "     2. Liverpool       38    24   8   6    67  -  30    80 ";
          "     3. Manchester_U    38    24   5   9    87  -  45    77 ";
          "     4. Newcastle       38    21   8   9    74  -  52    71 ");

    parsedRows:.parser.parse rows;

    .assert.equal[30;parsedRows[1;`A]];
    .assert.equal[45;parsedRows[2;`A]];}]

exit .qtest.report[]
