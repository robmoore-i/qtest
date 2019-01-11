\l ../../qtest.q
\l ../../assertq.q

\l Analyser.q

.qtest.test["Can get the day with the smallest temperature spread";{
    parsedRows:flip `Dy`MxT`MnT!(1 2 3;10 10 10;20 30 40);

    .assert.equal[3;.analyser.minTempSpreadDay parsedRows];}]

.qtest.test["Can get the day with the smallest temperature spread if its in the middle";{
    parsedRows:flip `Dy`MxT`MnT!(1 2 3;10 10 10;20 40 30);

    .assert.equal[2;.analyser.minTempSpreadDay parsedRows];}]

exit .qtest.report[]
