# Prints "coprime" if the arguments are relatively prime.
perl -le 'print "coprime" if "@{[1 x pop]} @{[1 x pop]}" !~ /^(11+)\1* \1+$/' 3 4
coprime

# Number of divisors. This solution shows off how to embed a loop in the
# regexp by forcing backtracking. In this case using the Perl (??{ ... })
# construct, but the techinique is generic.
perl -le '(1 x pop) =~ /^(1+)\1*$(??{++$t})/; print $t' 8
4

# Prime factorization.
perl -le '$_ = 1 x pop; print $+[1] and s/$1/1/g while /^(11+?)\1*$/' 60
2
2
3
5

# n mod m.
perl -le "(1 x shift) =~ /(1{@{[shift]}})*/; print length $'" 17 8
1

# Fraction reduction to lowest terms.
perl -le '$_ = "@{[1 x shift]} @{[1 x shift]}"; s/$1/1/g while /^(11+?)\1* \1+$/; print length $& while /1+/g' 60 24
5
2

# Euler's phi function: number of positive integers less than or equal to n relatively prime to n.
perl -le '$n = pop; print~~grep {"@{[1 x $_]} @{[1 x $n]}" !~ /^(11+)\1* \1+$/} 1..$n' 60
16

# Greatest common divisor (gcd).
perl -le '"@{[1 x pop]} @{[1 x pop]}" =~ /(1+)\1* \1+$/ && print $+[1]' 27 36
9

# Square-free test: an integer is square-free if it is divisible by no perfect square (except 1).
perl -le '$_ = 1 x pop; s/$1/1/g && /^($&)+$/ && exit while /(11+?)\1*$/; print "square-free"' 15
square-free

# Perfect square test: an integer is a perfect square if it is equal to n^2 for some n.
perl -le '$_ = 1 x (pop||1); 1 while /^(11+?)\1*$/ && /^(($1){$+[1]})+$/ && s/$1/1/g; print "perfect square" if /^1$/' 64
perfect square

# Alternative perfect square test.
perl -le '$_ = 1 x pop; $n = 1; $n += 2 while s/1{$n}//; $_ || print "perfect square"' 64
perfect square

# Integer square root.
perl -le '$_ = 1 x pop; $n = 1; $n += 2 while s/1{$n}/0/; print tr/0//d' 2012
44
