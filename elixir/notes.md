# Elixir


## repl
start a repl with iex

we can use `i/1` to get information about a value in the repl

## Files
elixir files have a `.exs` extension. We can invoke `elixir script.exs` to build
and run a given script

## Types
Has sensible built in types. Difference between float and int. `/` is for diving
floats.

`trunc` truncates a float to it's 'intgeger part'. `round` rounds a float to the
nearest int

### Atoms
Symbols. A constant with a value that is the constants name. True and False are
atoms in elixir

### Strings
are utf 8. Use double quotes. Can use string interpolation like so 

`"String #{"interpolation"}"`

### Linked Lists
Can be declared by wrapping values in square brackets. Lists can contain
heterogenus types. List concatenation is done with `++`.

There is also a `--` operator that is really weird. Seems to attempt to delete
values from the left side list that appear in the right side list

```
[1,2,3] -- [2] === [1,3]
[1,2,3] -- [4,5,6] === [1,2,3]
```

Lists are stored in memory as linked data structures. Tru linked lists

#### Lists of char codes
Elixir likes to translate lists of char codes into sort of strings.

eg
[104,101,108,108] turns into 'hell'

note the single quotes, which distinguishes this charlist from a
string. The two are not equivalent

### Tuples
Curly brackets are used to define tuples

`{:ok, "tuples"}`

Tuples are stored as a contiguous chunk of memory. Like an array. This means
that acceesing an element of a tuple is FAST

### Booleans
booleans are just atoms in elixir
there are boolean operations though, `not` `and` and `or`. These only accept
boolean arguments. And and or are lazy though, so in some cases you can provide
a non boolean value and still have your code compile.

We also have `||` `&&` and `!` which map to the operators you are probably
familiar with from JavaScript. These operators will work on any type. However
every possible value other than `false` or `nil` will be evaluated to true.

### Other operators
All the old faves. 

```
==
!=
<=
>=
>
<
```

but also 

```
===
!==
```

these are stricter when comparing floats and integers

```
1 == 1.0  // true
1 === 1.0 // false
```


## Functions
Are defined by both namd AND arity. 

### Documentation
In documentation you will see names like

`functionName/1`
`functionName/2`

where the identifier before the slash is the functions name, and the number
after the slash is the functions arity

in the repl we can use `h function/arity` to get the documentation for a given
function. Nice

### Anonymous Functions
use `fn` and `end`

eg

```
timesTwo = fn x -> x * 2 end
timesTwo.(4) // 8

```

weirdly there needs to be a dot between the function name and the the
parentheses that hold the argument. This is apparently to avoid ambiguity
between anonymous functions and named functions.. ?? 

### Type Checking
`is_function(function, arity)` -> returns false if the first argument isn't a
function, or if the arity does not match the second argument

## Pattern Matching!
Basically seems to be like destructuring in javascript

`{a,b} = {"hello", :wurld}`

but we can also match on a specific value
```
{:ok, x} = {:ok, 2}    // works
{:ok, x} = {:notok, 2} // throws a matcherror
```

### Case statements!!!!
```
case {1, 2, 3} do
  {4, 5, 6} -> "won't match"
  {1, x, 3} -> "will match and bind the variable x"
  _         -> "matches everything"
end
```

nice one

We can also pattern match against variables! This uses the pin operator again..
```
x = "hello"

case "hello" do 
        ^x -> "matches"
        _  -> "fallthru"
end
```

AND we can use guard statements

```
case 5 do
  x when x > 10 -> "bigger than ten"
  _             -> "#{x} was too small"
end
```

If none of our cases match we get an error. Which is _fine_. it would be nicer
if we had a type system though. 

#### Matching in anonymous functions
```
func = fn
  x, y when x < 0 ->  "something"
  x, y ->  "something else"
end
```

## Rebiding variables 
use the pin operator `^` to rebind

```
x = 1
^x = 2
```



## Processes / Concurrency
spawn function is used to start a new BEAM process. They entirely seperate
programs. No sharing of any data.

Different processes can only communicate by sending messages

We should expect to be running a LOT of processors.

BEAM has a scheduler, we typically run one scheduler per CPU. The schedulers
look after running our various processes.

### cool stuff this allows
If users connect via websockets - we can run a different process for every
single user


### When a process crashes

Everything else continues!!! A failure is local to a process.
This makes our systems more fault tolerant.

The scheduler rapidly switches context - distributing CPU time fairly between
all the running processes. This means that one slow long running process won't
cause latency spikes in other processes.

### Debugging

BEAM allows us to 'introspect' the system.

we can run an interactive elixir session on our running system.

We can also look at running processes using `Process.list()`

`Process.info(process)` allows us to see information about a given process

There's probably a lot to learn here. Should just look the Process docs.



## Interesting stuff to learn more about
`with` and `do` blocks - which seem to allow us to write in a similar style to
haskell do blocks
