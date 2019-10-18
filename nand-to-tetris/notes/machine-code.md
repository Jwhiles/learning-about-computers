# Is a terrible programming language

looks like this 

```
01001001001
11001011010
```

We can sort of read it, by splitting the sequences into logical chunks. We have to look at this meaningless sequence of 1s and 0s and then mentally translate it

Usually we prefer to go the other way - by moving from a higher level language, to the machine language


## Types of memory
Our computer can have a variety of types of memory.

Eg. 
Registers - inside the cpu, small and fast
Cache - bigger, but slower
etc...

The memory access gets slower for large forms of memory, on the memory addresses get longer


## Types of addressing
There are different ways we can talk about our forms of memory.

One example would be `Add R1 R2` sets R2 to bitwise addition of R2. 
We could conceive of other ways of writing or interpreting this command.

## Input / Output
How do we interact with things?

Maybe moving a mouse writes the last location of the mouse to a specific register?

## Control Flow
We typically expect our machine langauges instructions to happen sequentially.
But what if we want a loop? Or an if?

We could use something like a GOTO, telling our computer to jump to a certain instruction

```
101 Add 1 R1
102 Jump 101
```


### Conditional jumps
If we could only jump to locations, our programs would all be loops.
SO, we need to be able to Jump based on certain conditions.

```
101 JGT R1 0 103 // jump to 103 if R1 is greater than 0
102 Subtract R1, 0 // Negate R1
103 ....

```



## Hack Computer
Has three registers
D - holds a 16 bit value
A - holds a 16 bit value
M represents the 16-bit RAM regsiter addressed by A

So A and M are fundamentally linked

### A-instruction
`@value` - sets the A register to the value

When we do something like `@value5` - we are putting `5` in the A register, but
also changing the M register to point at the RAM regsiter at address 5


So to set a RAM register to contain the value -1  
```
@100 // A=100, M now points at RAM[100]
M=-1 // M is RAM[100] - is now set to contain -1
```

### C-instruction
contains a computation, and an optional computer, and optional jump

- the computation is just a bunch of maths and logic operators. woo

- destination is where we want to store the result of the computation. We are
allowed to store the result in several places at once

- The jump directive uses some comparison operator, with the computation result
  and 0 as its parameters. If the comparison resolves to True - then we jump to
  then we jump to the instruction in ROM[A]



