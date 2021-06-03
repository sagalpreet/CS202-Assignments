#!/usr/local/bin/perl

$word = '
  Microsoft Tester Dies Tragically At Hands of "Pal"
';

if ($word =~ /[^\w](\w)[^\w]+/g) # regex check
{
    print "$word\n"; # print the line
    $count += 1; # increment count
}