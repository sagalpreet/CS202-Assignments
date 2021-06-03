#!/usr/local/bin/perl

print "Enter the time number to check if it is valid or not: ";
$time = <STDIN>; # taking the time number as input

if ($time =~ /^(0?[1-9]|1[0-2])\.[0-5][0-9] (a|p)m\s$/) # regex check
{
    print "TRUE: This is a valid time.\n";
}
else
{
    print "FALSE: This is an invalid time.\n";
}
