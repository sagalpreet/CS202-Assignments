#!/usr/local/bin/perl

local $/; # to read the content of entire document in one go

open( $fh, "<", "micro.txt"); # open the file to read content

$x = <$fh>; # read the entire file into the string x

@matches = ($x =~ m!(\"[^\s\'-]{1,}\"|\"[^\s\'-]{1,}\s[^\s\'-]{1,}\")!g); # regex expression to get a list of all the matches in entire document

foreach $x (@matches)
{
    $x = substr($x, 1, -1); # removing leading and trailing double quotes
    @y = split(" ", $x); # splitting the words to print them
    print $y[0].' '.$y[1]."\n"; # print after removing the leading and trailing double quotes and any extra space in between
}