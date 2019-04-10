package javabeans;

import java.util.Calendar;
import java.util.Date;

public class Verification {
    public int verifyIdentity(String uid, String identity, String pubkey) {
        return 0;
    }

    public int verifyPermission(String identity) {
        return 0;
    }

    public String showInfo(String identity, String pubkey) {
        return null;
    }

    public int validateCurrentUser(String uid, String pw) {
        return 0;
    }

    public int validateCurrentUser(User u) {
        return 0;
    }

    public static boolean isAdult(Person p) {
        Calendar current = Calendar.getInstance();
        Calendar birthDay = Calendar.getInstance();
        birthDay.setTime(new Date(p.getBirthdate()));

        int year = current.get(Calendar.YEAR) - birthDay.get(Calendar.YEAR);
        if (year > 18) {
            return true;
        } else if (year < 18) {
            return false;
        }

        int month = current.get(Calendar.MONTH) - birthDay.get(Calendar.MONTH);
        if (month > 0) {
            return true;
        } else if (month < 0) {
            return false;
        }

        int day = current.get(Calendar.DAY_OF_MONTH) - birthDay.get(Calendar.DAY_OF_MONTH);
        return  day >= 0;
    }
}
