# Notes on this kata

Kent Beck once said: "First you learn the value of abstraction, then you learn the cost of abstraction, then you're ready to engineer"

In this kata, you may combine elements from these two application domains
(weather and football), but the cost of this abstraction is *coupling*. It is
a mark of a good engineer to know when to abstract (reduces duplication with
the cost of greater coupling) and when not to (reduces coupling with the cost
of greater duplication).

In this case, I would say that the code in the analyser represents unnecessary
duplication, and that it would be appropriate to introduce an abstraction layer,
but at the level of parsing, to introduce an abstraction layer would introduce
unnecessary dependency between the input formats of the weather and football
data.
