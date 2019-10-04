# Binary Arithmetic

## Numbers
So far we've worked exclusively with 1 and 0. On and off.

If we treat sequences of binary digits as blocks - we can instead start to look
at these as numbers, in base 2.

eg 10010 - could be a binary number. Equalling 18

the rightmost digit in a binary number is the 'least significant bit'. This is
actually the same way we think about normal base 10 numbers

## Addition

Adding binary numbers is pretty obvious conceptually.

The main problem is overflow. If adding two binary numbers of a certain length -
we risk overflowing the buffer. If that happens generally the result is
truncated

eg

```
  1011 +
  0011
= 1110 

cool
```


```
  1100 +
  0100
= 0000   

oh noo
```

## Negatives

we reserve half of the possibile numbers for negative numbers. This sounds like
a lot, but actaully this essentially means that we treat the most significant
bit as a - or + sign. Adding one extra bit always doubles the possible numbers
we can represent!

any number beginning with 0 has a positive sign
any number beginning with a 1 has a negative sign

we use the negative complement system. Where

000 = 0
001 = 1
010 = 2
011 = 3
111 = -1
110 = -2
101 = -3
100 = -4

### Negating a number
take buffer of binary digits
add them to a buffer of the same length that is filled with 1s
then add 1 

eg

  010  (= 2)
+ 111

  101
+   1
= 110  (= -2) there
+ 111
= 001
+   1
= 010 (= 2)   and back again




## Arithmetic Logic Unit

three inputs

x :: Number
y :: Number
f :: Number -> Number -> Number

output :: Number


