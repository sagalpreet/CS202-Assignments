#!/usr/local/bin/perl

# ALGORITHM
## Read all the delimiters from the file delimiters.txt and store them in an array
## Read the input file input.txt line by line as a string
## For each line, iterate over it and try to match delimiters using regex.
### If a match is found at the beginning of line, we print "\n" and update the string to remaining part.
### Else, we print the first character and update the string to remaining part.
## Care is taken, not to print 2 consecutive "\n" by maintaining a boolean variable $return.

open( $fh1, "<", "input.txt" );                          # open file to take input from it

open( $fh2, "<", "delimiters.txt" );                     # take delimiters as input from file

$delimiter = <$fh2>;                                     # string to read line by line from file

%delimiters = ();                                        # array to store delimiters

while ($delimiter ne "")                                 # loop over the file containing delimiters until EOF
{
    if (substr($delimiter, -1) eq "\n")                  # check if it is a valid delimiter (valid if it is atleast 1 character long)
    {
        $delimiter = substr($delimiter, 0, -1);          # strip off the "\n" at the end
        push(@delimiters, $delimiter);                   # store all possible delimiters in an array
    }
    else
    {
        push(@delimiters, $delimiter);                   # store delimiter as it is as it has no "\n" at the end
    }
    $delimiter = <$fh2>; 
}

$inpLine = <$fh1>;                                       # string to read line by line from file

while ($inpLine ne "")                                   # loop over the file containing text
{
    $return = 0;                                         # to keep track of "\n" printed to console as we don't want 2 "\n" consecutively
    while ($inpLine ne "")
    {
        $found = 0;                                      # to keep track of whether delimiter was found or not
        for ($i = 0; $i <= $#delimiters; $i++)           # try to match with each possible delimiter
        {
            $delimiter = $delimiters[$i];                # obtain delimiter at i_th index
            if ($inpLine =~ /^\Q$delimiter\E(.*\n)$/)    # try regex match for delimiter
            {
                $inpLine = $1;                           # if matched update the remaining string to parse
                if ($return == 0)                        # if "\n" was not printed in previous iteration, we can print this time
                {
                    print("\n");
                    $return = 1;                         # update return to signify that in previous iteration "\n" was printed
                }
                $found = 1;                              # update found as match found
                last;
            }
        }
        if ($found == 0)                                 # if no match is found, we print it as it is
        {
            $nextChar = substr($inpLine, 0, 1);          # store the next character in nextChar
            if ($nextChar ne "\n")                       # check for "\n" to avoid 2 consecutive prints of "\n"
            {
                print($nextChar);
                $return = 0;
            }
            elsif ($return = 0)
            {
                print($nextChar);
                $return = 1;
            }
            $inpLine = substr($inpLine, 1);             # update remaining string
        }
    }
    $inpLine = <$fh1>;                                   # read it line by line
}