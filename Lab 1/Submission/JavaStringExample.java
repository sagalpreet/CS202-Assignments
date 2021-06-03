public class JavaStringExample {
    public static void main(String [] args) {
        /* String in java represents the character sequence. */

        /* creates new empty string */
        String str1 = new String ("");

        /* creates new string object whose content would be Hello World */
        String str2 = new String ("Hello World");

        /* creates new string object whose content would be Hello World */
        String str3 = "Hello World";

        /* IMPORTANT : Differences between above given two approaches is, 
        string object created using new operator will always return new string
        object. While the other may return the reference of already created 
        string object with same content, if any. */

        System.out.println(str1.length());
    }
}