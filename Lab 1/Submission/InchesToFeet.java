import java.util.Scanner;

public class InchesToFeet {
    public static void main (String [] args){
        Scanner inp = new Scanner(System.in);
        int input = inp.nextInt();
        inp.close();
        int feet = input / 12;
        int inches = input % 12;
        System.out.print(input);
        System.out.print(" inches = ");
        System.out.print(feet);
        System.out.print(" feet, ");
        System.out.print(inches);
        System.out.println(" inches");
    }
}
