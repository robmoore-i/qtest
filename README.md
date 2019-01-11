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

The examples below can all be found in `development-examples/MarsRover/RoverTest.q`.
This is a variation on the Mars Rover kata (https://github.com/priyaaank/MarsRover),
I was just playing about to explore how I wanted to write my unit tests in Q. The
meatier examples are in `kata-examples/data-munging`.

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
    .assert.equal[1;rover`y];}]
```

### Write a similarly simple test with a different assertion

```
.qtest.test["The Rover can pick up a moon rock";{
    rover:.rover.new[0;1;`S];
    moonRock:"A shiny moon rock";
    rover:.rover.pickup[rover;moonRock];
    .assert.in[moonRock;rover`collector];}]
```

### Write a test with some cleanup afterwards

```
.qtest.testWithCleanup["The Rover can save its position to a file";{
    rover:.rover.new[3;4;`E];
    testFileHandle:`:TestRoverPosition.txt;
    .rover.savePositionToFile[rover;testFileHandle];
    fileContent:read0 testFileHandle;
    .assert.equal["3 4 E";first fileContent];};
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
    .assert.equal[`x`y`d!(3;4;`E);rover];};
    {
        hdel `:TestRoverPosition.txt;
    }]
```

### Report the results at the end of the file after all the tests have run

```
exit .qtest.report[]
```

## Test output

Green and red coloured output as appropriate.

### Passing tests

```
Rob:MarsRover romo$ q RoverTest.q
KDB+ 3.6 2018.10.23 Copyright (C) 1993-2018 Kx Systems
m32/ 12()core 32768MB romo rob.local w.x.y.z NONEXPIRE

- The Rover can move north
	Pass
- The Rover can move south
	Pass
- The Rover can pick up a moon rock
	Pass
- The Rover can save its position to a file
	Pass
- The Rover can be created from a file
	Pass

5 tests passed
Rob:MarsRover romo$
```

### Failing tests

```
Rob:MarsRover romo$ q RoverTest.q
KDB+ 3.6 2018.10.23 Copyright (C) 1993-2018 Kx Systems
m32/ 12()core 32768MB romo rob.local w.x.y.z NONEXPIRE

- The Rover can move north
	Pass
- The Rover can move south
	Pass
- The Rover can pick up a moon rock
	Pass
- The Rover can save its position to a file
	Pass
- The Rover can be created from a file

  Assertion failed: .assert.equal
	Expected:   
		x| 3
		y| 4
		d| `E

	With count: 3
	Actual:     
		x| 0
		y| 0
		d| `N

	With count: 3
	Fail

Failed tests:
- The Rover can be created from a file

1 tests failed
4 tests passed
Rob:MarsRover romo$
```

### Run a test

```
Rob:MarsRover romo$ q RoverTest.q
```

## Inadequacies

- Not many types of assertions, but you can add your own fairly easily.

- Assertions are not deeply tested, but you can correct the implementation if it proves inadequate.

### Practice TDD

The Mars Rover kata (https://github.com/priyaaank/MarsRover) is excellent for
training your software design skills. When I am showing people TDD it is my goto.
If you're new to TDD I really recommend you have a go at it.

For Q, something more Q-ish will perhaps help more to convince people that TDD's
applicability is not limited to one language, framework or industry. I have chosen
the Data Munging kata (http://codekata.com/kata/kata04-data-munging/).
