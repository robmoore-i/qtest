\l ../../qtest.q
\l ../../assertq.q

\l Parser.q

.qtest.test["Can parse day number of first day";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5");

    parsedRows:.parser.parse rows;

    .assert.equal[1;parsedRows[0;`Dy]];}]

.qtest.test["Can parse day number of second day";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5");

    parsedRows:.parser.parse rows;

    .assert.equal[2;parsedRows[1;`Dy]];}]

.qtest.test["Can parse max temperature of first day";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5");

    parsedRows:.parser.parse rows;

    .assert.equal[88;parsedRows[0;`MxT]];}]

.qtest.test["Can parse max temperature of second day";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5");

    parsedRows:.parser.parse rows;

    .assert.equal[79;parsedRows[1;`MxT]];}]

exit .qtest.report[]
