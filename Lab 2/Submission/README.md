# Tic-Tac-Toe
## _OOP Concepts in Java_

> This is a markdown file, hence best viewed in an editor that supports markup (eg: https://dillinger.io/)

Tic-Tac-Toe is a 2 player game, can be played either in multiplayer mode or single player mode against the computer.

- Easily extendible to grids of higher sizes than 3
- Symbol for each player can be modified easily
- Board and player as classes, Computer class inherits most of its properties and behaviour from Player class

## Game Instructions

- The player who gets his symbol all accross the line (a column, a row or a diagonal) first, wins the game
- If none of the two players is able to do so, the game is declared to end in a draw
- Turns are taken alternately by the players, no turn can be skipped


## Components

The zipped folder consists of the following files:

- Computer.class
- Grid.class
- Player.class
- TicTacToe.class
- TicTacToe.java
- README.md

## How to run the program

For executing the program

```
java TicTacToe
```

For compiling source code

```
javac TicTacToe.java
```

## How to play

The game board is represented as a 3X3 board. Any location can be reffered to by specifying w space separated integers that represent row and column number respectively.

For example, in a 3X3 grid:
- 1 1 represents the top-right cell
- 3 3 represents the bottom-right cell

Following are the instructions to play the game:
- Enter 1 for "2 players" or 2 for playing "against computer" (an choice other thean 1 or 2 is invalid)
- Enter valid name for players (any name with atleast one character is valid)
- As per turn displayed on console, enter two numbers for location, where you want to mark. (You cannot mark on a cell which is already marked, the row and column indices must be either 1, 2 or 3)
- Wrong inputs will prompt warnings and ask you to re-enter the values correctly.
