# Arguments are assumed to be positive integers.

# Prints "coprime" if the arguments are relatively prime.
perl -e 'print "coprime\n" if "@{[1 x pop]} @{[1 x pop]}" !~ /^(11+)\1* \1+$/' 3 4
coprime

# Number of divisors. This solution shows off how to embed a loop in the
# regexp by forcing backtracking. In this case using the Perl (??{ ... })
# construct, but the techinique is generic.
perl -e '(1 x pop) =~ /^(1+)\1*$(??{++$t})/; print "$t\n"' 8
4

# Prime factorization.
perl -le '$_ = 1 x pop; print $+[1] and s/$1/1/g while /^(11+?)\1*$/' 60
2
2
3
5

# n mod m.
perl -e "(1 x shift) =~ /(1{@{[shift]}})*/; print length $'" 17 8
1

# Fraction reduction to lowest terms.
perl -le '$_ = "@{[1 x shift]} @{[1 x shift]}"; s/$1/1/g while /^(11+?)\1* \1+$/; print for map length, split' 60 24
5
2
