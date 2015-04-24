# A General Purpose Table Generator

A utility for generating and formatting tabular data.

An example is included in the form of a Prime Product table

## Usage

At the time of writing there is a single table generator for the product of primes at x y. Supply the number or primes to use:

    bundle exec bin/table_time --primes 10


       |  2  3   5   7  11  13  17  19  23  29
    ---+--------------------------------------
     2 |  4  6  10  14  22  26  34  38  46  58
     3 |  6  9  15  21  33  39  51  57  69  87
     5 | 10 15  25  35  55  65  85  95 115 145
     7 | 14 21  35  49  77  91 119 133 161 203
    11 | 22 33  55  77 121 143 187 209 253 319
    13 | 26 39  65  91 143 169 221 247 299 377
    17 | 34 51  85 119 187 221 289 323 391 493
    19 | 38 57  95 133 209 247 323 361 437 551
    23 | 46 69 115 161 253 299 391 437 529 667
    29 | 58 87 145 203 319 377 493 551 667 841

### Extending

The Table Formatter will accept any object that responds to

    xaxis: values for the x header row
    yaxis: values for the y header column
    value_at(x, y): value of the table at the given co-ordinates

## TODO

Add other types of tables available through the command line interface

Remove or improve the Prime Generator (just use the standard Ruby lib!)
