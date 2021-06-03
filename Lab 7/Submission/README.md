_It is advised to view this markdown file in some markdown editor like: https://dillinger.io/ (Ctrl+Click on the link and paste the content of this file there)_

# Truck.pl

## How to run ?

### Method 1
- In terminal, enter the following command:
    ```
    perl Truck.pl
    ```
- Type the string into console on being prompted to do so.
- On the basis of Regex match, ACCEPTED or REJECTED will be printed onto the console.

(This method works only for single line strings, for multi-line strings, follow Method 2)

### Method 2
- In the code Truck.pl, **uncomment** the line: local $/; (line number 5)
- Type the string you want to test in a file: test.txt
- In terminal enter the following command:
    ```
    perl Truck.pl < test.txt
    ```
- On the basis of Regex match, ACCEPTED or REJECTED will be printed onto the console.

#

# Gene.pl

## How to run ?

- In terminal, enter the following command:
    ```
    perl Gene.pl
    ```
- Type the string into console on being prompted to do so.
- On the basis of Regex match, ACCEPTED or REJECTED will be printed onto the console.

#

# Token.pl

## Assumptions
- Even if two or more tokens are encountered consecutively, only a single "\n" is printed for clarity.
- If there are two different tokens starting with same character, for example: "," and ", ". The one written first in the delimiters.txt will be given preference.
- Delimiters can be of any size comprised of ascii characters(recommended: not to have "\n" as a part of multi-character delimiter).
- Sample delimiters.txt provided in the submission considers all the characters in it as delimiters.

## How to run ?

- All the delimiters are typed in delimiters.txt, each in a separate line
- The input text to be tokenized is placed in input.txt
- In terminal, enter the following command:
    ```
    perl Token.pl
    ```
- The tokens are printed onto console, each in a different line.