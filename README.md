# qtest

## Problem

I would like to do TDD in Q so that I can go faster and have high quality,
maintainable Q to show off to employers even though they only care about the
length of my CV anyway.

But there are no tools available. I looked some up but they are undocumented,
write-only landfills, like an unfortunate amount of Q code in existance. I am
also guilty of this.

## Solution

I wrote this tool and I will be doing experiments in TDD in Q in times to come.

There is also no assertions library for Q, so that is also going to be included
in this repository.

## Usage

The examples here can all be found in `examples/MarsRover/RoverTest.q`. This is
a variation on the Mars Rover kata (https://github.com/priyaaank/MarsRover).

### What to import

```
\l ../../qtest.q
\l ../../assertq.q
```

### Write a very simple test

```
.qtest.test["The Rover can move north";{
    rover:.rover.new[0;0;`N];
    rover:.rover.move[rover];
    .assert.equal[1;rover`y]}]
```

### Write a similarly simple test with a different assertion

```
.qtest.test["The Rover can pick up a moon rock";{
    rover:.rover.new[0;1;`S];
    moonRock:"A shiny moon rock";
    rover:.rover.pickup[rover;moonRock];
    .assert.in[moonRock;rover`collector]}]
```

### Write a test with some cleanup afterwards

```
.qtest.testWithCleanup["The Rover can save its position to a file";{
    rover:.rover.new[3;4;`E];
    testFileHandle:`:TestRoverPosition.txt;
    .rover.savePositionToFile[rover;testFileHandle];
    fileContent:read0 testFileHandle;
    .assert.equal["3 4 E";first fileContent]};
    {
        hdel `:TestRoverPosition.txt;
    }]
```

### Write a test with some setup before and some cleanup afterwards

```
.qtest.testWithSetupAndCleanup["The Rover can be created from a file";
    {
        h:hopen `:TestRoverPosition.txt;
        (neg h) "3 4 E";
        hclose h;
    };{
    rover:.rover.fromFile[`:TestRoverPosition.txt];
    .assert.equal[`x`y`d!(3;4;`E);rover]};
    {
        hdel `:TestRoverPosition.txt;
    }]
```

### Report the results at the end of the file after all the tests have run

```
exit .qtest.report[]
```