#!/usr/local/bin/perl

open( $fh, "<", "micro.txt"); # open the file to read content

$x = <$fh>; # read the first line
$count = 0;

while ($x ne ''){ # loop until the end of file
    if ($x =~ /[jJ]ava/) # check for match with 'Java' or 'java'
    {
        print $x; # print the line
        $count += 1; # increment count
    }
    $x = <$fh>;
}

print "\nThe count is $count.\n";