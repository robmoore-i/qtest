\l ../../../../qtest.q
\l ../../../../assertq.q
\l ../../../../termcolour.q

\l ../src/Weather.q

///// Integration Tests /////

.qtest.test["Can get the day with the smallest temperature spread";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          " ";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  79    70    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5";
          "   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8";
          "   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1";
          "   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4";
          "   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7";
          "   7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8";
          "   8  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3");

    .assert.equal[2;.weather.minTempSpreadDay rows];}]

.qtest.test["Can get the day with the smallest temperature spread when its the last day";{
    rows:("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
          " ";
          "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
          "   2  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3";
          "   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8";
          "   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1";
          "   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4";
          "   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7";
          "   7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8";
          "   8  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5");

    .assert.equal[7;.weather.minTempSpreadDay rows];}]

exit .qtest.report[]
