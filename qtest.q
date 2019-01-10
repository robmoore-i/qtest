\d .qtest

\l ../../termcolour.q

test:{[description;testfunc]
    result:testfunc[];
    colourprint:$[result;.termcolour.green;.termcolour.red];
    colourprint description,$[result;"";": Failed!"];}
