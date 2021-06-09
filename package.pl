#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Encode qw/encode_utf8/;

my @variants = <>;

for (@variants) {
    my ($name, $font_family, $font_weight) = split /\s+/, $_;

    system("rm", "-rf", "working/$name");
    system("mkdir", "-p", "working/$name");
    my $hash = `cd subsets/$name; sha256sum *.woff2 | sha256sum -`;
    $hash =~ s/[^0-9a-fA-F]//g;

    open my $fh, ">", "working/$name/$name.css";

    print $fh encode_utf8(<<'END');
@charset "UTF-8";

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

        system("cp", "subsets/$name/$name-$i.woff2", "working/$name/${name}-${hash}-${i}.woff2");
        system("cp", "subsets/$name/$name-$i.woff", "working/$name/${name}-${hash}-${i}.woff");

        print $fh encode_utf8(<<"END");
/* [$i] */
\@font-face {
    font-family: '$font_family';
    font-style: normal;
    font-weight: $font_weight;
    font-display: swap;
    src: url(./${name}-${hash}-${i}.woff2) format('woff2'),
        url(./${name}-${hash}-${i}.woff) format('woff');
    unicode-range: $range;
}

END
    }
    close $fh;

    my $version = `cat VERSION`;
    chomp $version;

    system("mkdir", "-p", "dist");
    system("cd working/$name; zip -r ../../dist/$name-$version.zip .");
}
