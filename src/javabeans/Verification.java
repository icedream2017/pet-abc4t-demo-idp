package javabeans;

import java.util.Calendar;
import java.util.Date;

public class Verification {

    public static String getIdentityPlainString(String hashcode) {
        if(hashcode==null) {
            return null;
        }
        Identity identity = new Identity();
        if(identity.getElementById(hashcode)) {
            Person person = new Person();
            boolean isPersonUser = person.getElementById(identity.getUid());
            person.close();
            Enterprise enterprise = new Enterprise();
            boolean isEnterpriseUser = enterprise.getElementById(identity.getUid());
            enterprise.close();
            if (isPersonUser) {
                return Identity.generatePersonalInfo(person, new Shadow(identity.getMask()), identity.getPurpose());
            } else if (isEnterpriseUser) {
                return Identity.generateEnterpriseInfo(enterprise);
            }
        }
        return "identity unavailable";
    }

    public static int validateCurrentUser(String uid, String pw) {
        User user = new User();
        int ut = user.identifyUser(uid,pw);
        return ut;
    }

    public static int validateUserTypeByIdentity(String hashcode) {
        return 0;
    }

    public static boolean isAdult(Person p) {
        Calendar current = Calendar.getInstance();
        Calendar birthDay = Calendar.getInstance();
        birthDay.setTime(new Date(p.getBirthdate().replace('-','/')));

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
