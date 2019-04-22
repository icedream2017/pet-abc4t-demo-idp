package cryptography;

import java.util.Scanner;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.Signature;

import javax.crypto.Cipher;

public class CryptoTest {
    public static void main(String[] args) {
        try {
//            testSHA256();
            testEncryptionRSA();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void testSHA256() throws Exception {
        System.out.println("input plain text: ");
        Scanner scanner = new Scanner(System.in);
        String inputString = scanner.nextLine();
        String outputString = Cryptography.toSHA256(inputString);
        System.out.println("cipher text: ");
        System.out.println(outputString);
    }

    public static void testEncryptionRSA() throws Exception {
        //Creating a Signature object
        Signature sign = Signature.getInstance("SHA256withRSA");

        //Creating KeyPair generator object
        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");

        //Initializing the key pair generator
        keyPairGen.initialize(2048);

        //Generating the pair of keys
        KeyPair pair = keyPairGen.generateKeyPair();

        System.out.println("public key:");
        System.out.println(pair.getPublic().toString());
        System.out.println("private key:");
        System.out.println(pair.getPrivate().toString());

        //Creating a Cipher object
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");

        //Initializing a Cipher object
        cipher.init(Cipher.ENCRYPT_MODE, pair.getPublic());

        //Adding data to the cipher
        System.out.println("input plain text: ");
        Scanner scanner = new Scanner(System.in);
        String inputString = scanner.nextLine();
        byte[] input = inputString.getBytes();
        cipher.update(input);

        //encrypting the data
        byte[] cipherText = cipher.doFinal();
        System.out.println(new String(cipherText, "UTF8"));
    }
}
