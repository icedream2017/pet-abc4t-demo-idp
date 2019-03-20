package cryptography;

import java.util.Scanner;

public class CryptoTest {
    public static void main(String[] args) {
        System.out.println("input plain text: ");
        Scanner scanner = new Scanner(System.in);
        String inputString = scanner.nextLine();
        try {
            String outputString = Cryptography.toSHA256(inputString);
            System.out.println("cipher text: ");
            System.out.println(outputString);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
