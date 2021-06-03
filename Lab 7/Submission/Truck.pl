#!/usr/local/bin/perl

print "Enter the string: ";                              # log to console and ask user to input the string

local $/;
$input = <STDIN>;                                        # take string as input

if ($input =~ /(?<!\w)((red\W+(\w*\W+)?(\w*\W+)?(pickup|pick-up|pick\sup)\W+truck)|((pickup|pick-up|pick\sup)\W+truck\W+(\w*\W+)?(\w*\W+)?red))\W+(\w*\W+)*\$\d\d?\d?((,\d\d\d)*|\d*)?(.\d+)?(?!\w)/) # regex check
{
    print "ACCEPTED\n";                                  # if regex matches
}
else
{
    print "REJECTED\n";                                  # if regex doesn't match
}
