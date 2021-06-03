#!/usr/local/bin/perl

open( $fh, "<", "micro.txt"); # open the file to read content

$x = <$fh>; # read the first line

$count = 0; # initilize count

while ($x ne ''){ # loop until the end of file
    #print "--> $x";
    $x = substr($x, 0 ,-1); # stripping the newline character at the end of the line
    @words = split(' ', $x); # split the read line into words and store them in an array

    foreach $word (@words){
        #print "-> $word";
        if (substr($word, 1, -1) =~ /[A-Z]/) # regex check
        {
            print "$word\n"; # print the line
            $count += 1; # increment count
        }
    }
    $x = <$fh>; # read the next line
}

print "\nThe count is $count.\n";