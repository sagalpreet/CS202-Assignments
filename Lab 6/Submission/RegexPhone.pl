#!/usr/local/bin/perl

print "Enter the phone number to check if it is valid or not: ";
$phone = <STDIN>; # taking the phone number as input

if ($phone =~ /^([0-9]{10}|[0-9]{3}-[0-9]{3}-[0-9]{4}|[0-9]{3} [0-9]{3} [0-9]{4})\s$/) # regex check
{
    print "TRUE: This is a valid phone number.\n";
}
else
{
    print "FALSE: This is an invalid phone number.\n";
}
