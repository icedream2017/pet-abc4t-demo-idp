package test;

import javabeans.Identity;
import javabeans.Person;
import javabeans.Shadow;
import javabeans.Verification;

public class Test {
    public static void main(String[] args) {
        Person p = new Person("test","1234567890",null,"Potter","Harry",1,
                "1999/04/22","Hogwarts Street 1",
                "harry.potter@hogwarts.com","+441234567890","I am test data.");
        byte shadowMode = Shadow.FIRSTNAME | Shadow.ADDRESS | Shadow.EMAIL | Shadow.BIRTHDATE;
        Shadow s = new Shadow(shadowMode);
        String plainInfo = Identity.generateOriginalInfo(p,s);
        System.out.println("original info: ");
        System.out.println(plainInfo);
        System.out.println("Shadow Mode:");
        System.out.println(shadowMode);
        String hashedInfo = Identity.generateNewIdentity(plainInfo);
        System.out.println("generated identity: ");
        System.out.println(hashedInfo);
        System.out.println("Is Adult?");
        System.out.println(Verification.isAdult(p));
    }

    public static void log(Object object) {
        System.out.println(object);
    }
}
