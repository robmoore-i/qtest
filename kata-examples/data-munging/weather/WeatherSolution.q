system "cd src"
\l Weather.q
system "cd .."

-1 "The day with the smallest recorded temperature range was: ",string .weather.minTempSpreadDay read0 `:../data/weather.dat;

exit 0
