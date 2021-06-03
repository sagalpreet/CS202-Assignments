# Hangman
## _Perl_

> This is a markdown file, hence best viewed in an editor that supports markup (eg: https://dillinger.io/)

Hangman is a single player game.

- Complete exception handling.
- Random words are given.

## Game Instructions

- The player needs to guess the word in 6 trys at the most.
- Else the man hangs or game ends.


## Components

The zipped folder consists of the following files:

- Hangman.pl
- README.md

## How to run the program

For executing the program

```
perl Hangman.pl
```


## How to play

Following are the instructions to play the game:
- As indicated, enter the character you think occurs in the word.
- If you enter multiple characters, only the first one is taken as input, rest all are ignored.
- White space is an invalid input to the program and you'll be prompted to enter correct value.
- If you enter the character which you have already entered, you will be informed about the same and prompted to enter a new value, ignoring the previous one.
- Wrong inputs will prompt warnings and ask you to re-enter the values correctly.
- When the program asks you if you wish to replay or not, Y denotes that you want to continue, N denotes you want to exit.
