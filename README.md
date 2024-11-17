# Bland Math Tool

A simple CLI math tool for basic calculations and batch operations, written in Odin!

## Usage 

`blmath` takes at least two arguments: an operation and at least one number (`blmath <operation> <numbers>`).

Valid operations are: `add`, `sub`, `mult`, `div`, `mod`, `mean`, `median`, `range`, `sort`, and `rsort`.

You can also run `blmath help` to see the help menu. Running `blmath` with no arguments will return an error saying the command needs more arguments, but it will also print the help menu, if you prefer to do that. 

The numbers that are provided as arguments to the operation should be separated by spaces. Every operation can accept any amount of numbers as arguments. Non-numeric arguments will be silently ignored; this means that if you separate your numbers with commas, you will not get accurate results.

## Examples

```bash
blmath add 10 5             # Sum: 15
blmath add 10 g 5           # Sum: 15; notice that the 'g' is quietly ignored
blmath add sub 10 g 5       # Sum: 15; notice that the second command (sub) is also ignored
blmath add 10 5 3           # Sum: 18
blmath add 10 5 3 -8        # Sum: 10
blmath add 10, 5, 3, -8     # Sum: -8; notice that every number touching a comma is not considered a number 
#      add           -8     # Sum: -8; is equivalent to the line above
blmath add 10 , 5 , 3 , -8  # Sum: 10; this works, but I really don't see any reason not just to use spaces

blmath sub 100 75           # Difference: 25
blmath sub 100 75 5         # Difference: 20
blmath sub 100 75 5 0.5     # Difference: 19.50

blmath mult 20 4            # Product: 80
blmath mult 20 4 2          # Product: 160
blmath mult 20 4 2 0.5      # Product: 80

blmath div 1000 100         # Quotient: 10
blmath div 1000 100 2       # Quotient: 5

blmath mod 10 3             # Remainder: 1
blmath mod 10 2             # Remainder: 0

blmath mean 1 2 3 4 5       # Mean: 3
blmath mean 2 4 1 3 5       # Mean: 3

blmath median 1 2 3 4 5     # Median: 3
blmath median 2 4 1 3 5     # Median: 3

blmath range 1 2 3 4 10     # Range: 9
blmath range 1 2 3 100 4    # Range: 99

blmath sort 5 4 3 2 1       # Sorted: 1 2 3 4 5

blmath rsort 1 2 3 4 5      # Reverse Sorted: 5 4 3 2 1 
```
