system "cd src" // NB. I also need a tool for dynamic library loading.
\l Weather.q
system "cd .."

-1 "The day with the smallest recorded temperature range was: ",string .weather.minTempSpreadDay read0 `:../data/weather.dat;

exit 0
