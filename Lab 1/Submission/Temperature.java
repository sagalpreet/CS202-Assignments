public class Temperature {
    public static void main (String [] args) {
        double degFahreheit;
        double degCelsius;
        degFahreheit = 98.6;
        degCelsius = (degFahreheit - 32) / 1.8;
        System.out.print(degFahreheit);
        System.out.print(" degrees Fahrenheit equals ");
        System.out.print(degCelsius);
        System.out.println(" degrees Celsius");
    }
}