#!/usr/local/bin/perl

print "Enter the string: ";                              # log to console and ask user to input the string

$input = <STDIN>;                                        # take string as input

if ($input =~ /(ATG)([ACGT]{3})+(TAA|TAG|TGA)/)          # regex check
{
    print "ACCEPTED\n";                                  # if regex matches
}
else
{
    print "REJECTED\n";                                  # if regex doesn't match
}