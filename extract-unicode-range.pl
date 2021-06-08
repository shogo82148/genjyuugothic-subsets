#!/usr/bin/env perl

use utf8;
use strict;
use warnings;
use Encode qw/encode_utf8/;

system("rm", "-rf", "unicode-range");
system("mkdir", "-p", "unicode-range");
system("rm", "-rf", "unicode-range-text");
system("mkdir", "-p", "unicode-range-text");

my $css = do { local $/; <> };
my $i = 0;
while ($css =~ /unicode-range:\s*([^;]+);/g) {
    my $range = $1;

    open my $fh, ">", "unicode-range/$i.txt" or die "$!";
    print $fh "$range\n";
    close $fh;

    my @charatcters = ();
    while($range =~ /U\+([-0-9a-fA-F]+)/g) {
        my ($begin, $end) = split /-/, $1;
        if ($end) {
            for my $ch(hex($begin)..hex($end)) {
                push @charatcters, chr($ch);
            }
        } else {
            push @charatcters, chr(hex($begin));
        }
    }

    open $fh, ">", "unicode-range-text/$i.txt" or die "$!";
    print $fh encode_utf8(join '', @charatcters);
    close $fh;

    $i++;
}
