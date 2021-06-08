#!/usr/bin/env perl

use strict;
use warnings;

my ($name, $font_family, $font_weight) = @ARGV;

system("rm", "-rf", "dist/$name");
system("mkdir", "-p", "dist/$name");
my $hash = `cd subsets/$name; sha256sum *.woff2 | sha256sum -`;
$hash =~ s/[^0-9a-fA-F]//g;

open my $fh, ">", "dist/$name/$name.css";

print $fh <<"END";
/*
copyright 2021 Ichinose Shogo (@shogo82148) https://github.com/shogo82148/genjyuugothic-subsets
copyright 2014 自家製フォント工房 by MM. http://jikasei.me/font/genjyuu/
M+ OUTLINE FONTS is under the M+ FONTS LICENSE.
*/
END

for my $i(0..119) {
    open my $unicode, "<", "unicode-range/$i.txt";
    my $range = do { local $/; <$unicode>};
    chomp $range;
    close $unicode;

    system("cp", "subsets/$name/$name-$i.woff2", "dist/$name/${name}-${hash}-${i}.woff2");

    print $fh <<"END";
/* [$i] */
\@font-face {
    font-family: '$font_family';
    font-style: normal;
    font-weight: $font_weight;
    font-display: swap;
    src: url(./${name}-${hash}-${i}.woff2) format('woff2');
    unicode-range: $range;
}

END
}
close $fh;

system("cd dist/$name; zip -r ../$name.zip .");
