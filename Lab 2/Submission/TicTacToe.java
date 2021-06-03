import java.util.Scanner;

// this class holds the main function, controls the appearance of the program, keeps a track of whose turn it is, declares the winner and ends the game.
// this class plays the role of a referee
class TicTacToe
{
    static Scanner input = new Scanner(System.in); // to use for taking input
    static Grid board = new Grid(3); // this stores the current state of the game board at any instant
    static Player p1, p2; // these are the two players, p2 maybe computer depending upon the choice of player
    public static void main(String [] args)
    {
        System.out.print("\nTic-Tac-Toe\n\nEnter 1 to play against another player\nEnter 2 to play against computer\nChoose the game mode: ");
        int choice = -1;
        while (choice != 1 && choice != 2)
        // this loop sets up the game by taking input from user as to whether he wants to play a multiplayer or vs. computer game.
        // this loop also takes the names of players as input.
        {
            choice = input.nextInt();
            if (choice == 1)
            {
                input.nextLine();
                String name = "";
                while (name.equals(""))
                {
                    System.out.print("\nEnter the name of First Player: ");
                    name = input.nextLine();
                    if (name.equals(""))
                    {
                        System.out.println("\nName must be atleast 1 character long");
                    }
                }
                p1 = new Player(name, 'X');
                name = "";
                while (name.equals(""))
                {
                    System.out.print("\nEnter the name of Second Player: ");
                    name = input.nextLine();
                    if (name.equals(""))
                    {
                        System.out.println("\nName must be atleast 1 character long");
                    }
                }
                p2 = new Player(name, 'O');
            }
            else if (choice == 2)
            {
                input.nextLine();
                String name = "";
                while (name.equals(""))
                {
                    System.out.print("\nEnter your name: ");
                    name = input.nextLine();
                    if (name.equals(""))
                    {
                        System.out.println("\nName must be atleast 1 character long");
                    }
                }
                p1 = new Player(name, 'X');
                p2 = new Computer("Computer", 'O');
            }
            else
            {
                System.out.print("Enter a valid choice !\n\nEnter 1 to play against another player\nEnter 2 to play against computer\nChoose the game mode: ");
            }
        }
        System.out.print("\n" + p1.getName() + " will get the first turn and will use the '" + p1.getSymbol() + "'\n" + p2.name + " will use the '" + p2.getSymbol() + "'\n\n");
        System.out.print("\n The location on the Tic-Tac-Toe board is represented by two space separated integers representing the row and column number respectively\n\n");
        int numCells = board.getSize() * board.getSize();
        String result = "The match has ended in a draw !\n";
        boolean gameEnded = false;
        board.displayGrid(); // the initial state of board is printed to the console
        for (int i = 0; i < numCells; i++)
        {
            if (i % 2 == 0)
            {
                if (p1.move()) // the method returns true if p1 claims that it has won
                {
                    result = p1.getName() + " has won the game !\n";
                    gameEnded = true;
                }
            }
            else
            {
                if (p2.move()) // the method returhns true if p2 claims that it has won
                {
                    result = p2.getName() + " has won the game !\n";
                    gameEnded = true;
                }
            }
            System.out.println();
            board.displayGrid();
            System.out.println();
            if (gameEnded)
                break;
        }
        System.out.println(result);
    }
}

class Grid
{
    private char [][] state; // 2d char array to store the current state of the Grid
    private int size;  // keeps a count of number of marked places on the board

    // constructor initiates the Grid of dimension size X size and assigns symbols to Player 1 and 2
    Grid(int size)
    {
        state = new char[size][size];
        for (int i = 0; i < size; i++)
            for (int j = 0; j < size; j++)
                state[i][j] = ' ';
        this.size = size;
    }

    // a bunch of getters and setters to restrict accesss to private attributes
    int getSize()
    {
        return this.size;
    }

    char getCell(int row, int column)
    {
        return state[row - 1][column - 1];
    }

    void markCell(int row, int column, char symbol)
    {
        state[row - 1][column - 1] = symbol;
    }

    void displayGrid()
    {
        String base = "--";
        for (int j = 0; j < size - 1; j++)
            base = base.concat("-|--");
        base = base.concat("-");
        for (int i = 0; i < size - 1; i++){
            String row = " " + state[i][0];
            for (int j = 1; j < size; j++)
                row = row.concat(" | " + state[i][j]);
            System.out.println(row);
            System.out.println(base);
        }
        String row = " " + state[size - 1][0];
        for (int j = 1; j < size; j++)
            row = row.concat(" | " + state[size - 1][j]);
        System.out.println(row);
    }
}

class Player
{
    protected String name;
    protected char symbol;

    Player(String name, char symbol)
    {
        this.name = name;
        this.symbol = symbol;
    }

    // a bunch of getters and setters to restrict accesss to private attributes

    String getName()
    {
        return name;
    }

    char getSymbol()
    {
        return symbol;
    }

    boolean move() // this method takes in a valid input from the player to mark a cell on the board
    {
        int row = -1, column = -1;

        while (true)
        {
            System.out.print("\nEnter the location you want to put a " + symbol + ", " + name + ": ");
            row = TicTacToe.input.nextInt();
            column = TicTacToe.input.nextInt();
            if (row > TicTacToe.board.getSize() || row < 1)
            {
                System.out.println("\nEnter valid location !\n");
                continue;
            }
            if (column > TicTacToe.board.getSize() || column < 1)
            {
                System.out.println("\nEnter valid location !\n");
                continue;
            }
            if (TicTacToe.board.getCell(row, column) != ' ')
            {
                System.out.println("\nEnter valid location !\n");
                continue;
            }
            break;
        }

        TicTacToe.board.markCell(row, column, symbol);

        if (hasWon(row, column))
            return true;
        return false;
    }

    boolean hasWon(int row, int column) // this method checks if the player has won after the recent move and returns true if so
    {
        boolean hasWon = true;
        for (int i = 1; i < TicTacToe.board.getSize(); i++)
            if (TicTacToe.board.getCell(i, column) != TicTacToe.board.getCell(i + 1, column))
            {
                hasWon = false;
                break;
            }
        if (hasWon) return true;
        hasWon = true;
        for (int i = 1; i < TicTacToe.board.getSize(); i++)
            if (TicTacToe.board.getCell(row, i) != TicTacToe.board.getCell(row, i + 1))
            {
                hasWon = false;
                break;
            }
        if (hasWon) return true;
        if (row == column)
        {
            hasWon = true;
            for (int i = 1; i < TicTacToe.board.getSize(); i++)
                if (TicTacToe.board.getCell(i, i) != TicTacToe.board.getCell(i + 1, i + 1))
                {
                    hasWon = false;
                    break;
                }
        }
        if (hasWon) return true;
        if (row + column == TicTacToe.board.getSize() + 1)
        {
            hasWon = true;
            for (int i = 1; i < TicTacToe.board.getSize(); i++)
                if (TicTacToe.board.getCell(i, row + column - i) != TicTacToe.board.getCell(i + 1, row + column - i - 1))
                {
                    hasWon = false;
                    break;
                }
        }
        if (hasWon) return true;
        return false;
    }
}

// Computer is indeed a player here, so we take the advantage of inheritance. The only behaviour difference is the functioning of move method
class Computer extends Player
{
    Computer(String name, char symbol)
    {
        super(name, symbol);
    }

    // move method functions greedily, it plays defensive, checks if it needs to block some cell to prevent loss. If no such cell exists, it marks the first encountered empty cell.
    boolean move()
    {
        int row = -1, column = -1;
        for (int i = 1; i <= TicTacToe.board.getSize(); i++)
        {
            int enemyMarks = 0;
            for (int j = 1; j <= TicTacToe.board.getSize(); j++)
            {
                if (TicTacToe.board.getCell(i, j) == 'X')
                    enemyMarks++;
            }
            if (enemyMarks + 1 == TicTacToe.board.getSize())
            {
                for (int j = 1; j <= TicTacToe.board.getSize(); j++)
                {
                    if (TicTacToe.board.getCell(i, j) == ' ')
                    {
                        row = i;
                        column = j;
                        break;
                    }
                }
                break;
            }
        }
        if (row != -1)
        {
            TicTacToe.board.markCell(row, column, symbol);
            System.out.println("The computer has chosen to mark a '" + symbol + "' at location " + Integer.toString(row) + " " + Integer.toString(column));
            return hasWon(row, column);
        }

        for (int i = 1; i <= TicTacToe.board.getSize(); i++)
        {
            int enemyMarks = 0;
            for (int j = 1; j <= TicTacToe.board.getSize(); j++)
            {
                if (TicTacToe.board.getCell(j, i) == 'X')
                    enemyMarks++;
            }
            if (enemyMarks + 1 == TicTacToe.board.getSize())
            {
                for (int j = 1; j <= TicTacToe.board.getSize(); j++)
                {
                    if (TicTacToe.board.getCell(j, i) == ' ')
                    {
                        column = i;
                        row = j;
                        break;
                    }
                }
                break;
            }
        }
        if (row != -1)
        {
            TicTacToe.board.markCell(row, column, symbol);
            System.out.println("The computer has chosen to mark a '" + symbol + "' at location " + Integer.toString(row) + " " + Integer.toString(column));
            return hasWon(row, column);
        }

        int enemyMarks = 0;
        for (int i = 1; i <= TicTacToe.board.getSize(); i++)
        {
            if (TicTacToe.board.getCell(i, i) == 'X')
                enemyMarks++;
        }
        if (enemyMarks + 1 == TicTacToe.board.getSize())
        {
            for (int i = 1; i <= TicTacToe.board.getSize(); i++)
            {
                if (TicTacToe.board.getCell(i, i) == ' ')
                {
                    row = i;
                    column = i;
                    break;
                }
            }
        }
        if (row != -1)
        {
            TicTacToe.board.markCell(row, column, symbol);
            System.out.println("The computer has chosen to mark a '" + symbol + "' at location " + Integer.toString(row) + " " + Integer.toString(column));
            return hasWon(row, column);
        }
        
        enemyMarks = 0;
        for (int i = 1; i <= TicTacToe.board.getSize(); i++)
        {
            if (TicTacToe.board.getCell(i, TicTacToe.board.getSize() + 1 - i) == 'X')
                enemyMarks++;
        }
        if (enemyMarks + 1 == TicTacToe.board.getSize())
        {
            for (int i = 1; i <= TicTacToe.board.getSize(); i++)
            {
                if (TicTacToe.board.getCell(i, TicTacToe.board.getSize() + 1 - i) == ' ')
                {
                    row = i;
                    column = TicTacToe.board.getSize() + 1 - i;
                    break;
                }
            }
        }
        if (row != -1)
        {
            TicTacToe.board.markCell(row, column, symbol);
            System.out.println("The computer has chosen to mark a '" + symbol + "' at location " + Integer.toString(row) + " " + Integer.toString(column));
            return hasWon(row, column);
        }
        for (int i = 1; i <= TicTacToe.board.getSize(); i++)
        {
            for (int j = 1; j <= TicTacToe.board.getSize(); j++)
            {
                if (TicTacToe.board.getCell(i, j) == ' ')
                {
                    row = i;
                    column = j;
                    break;
                }
            }
            if (row != -1)
                break;
        }
        TicTacToe.board.markCell(row, column, symbol);
        System.out.println("The computer has chosen to mark a '" + symbol + "' at location " + Integer.toString(row) + " " + Integer.toString(column));
        return hasWon(row, column);
    }
}
