system "cd src" // NB. I also need a tool for dynamic library loading.
\l Footy.q
system "cd .."

-1 "The team with the smallest goal difference was: ",.footy.minForAgainstGoalSpread read0 `:../data/football.dat;

exit 0
