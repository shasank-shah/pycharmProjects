#!/usr/bin/env raku

multi postcircumfix:<[ ]> (Str $_, Range \ran) { .substr(ran) }

my $num = â010â;
my %flips;

for ^$num.chars -> $L {
    for $L..^$num.chars -> $R {
    	%flips{â$L\t$Râ} = +($num[^$L] ~ (TR/01/10/ given $num[$L..$R]) ~ $num[$R^..*]).comb.grep: 1
    }
}

say .key for %flips.grep: *.value == max %flips.values
