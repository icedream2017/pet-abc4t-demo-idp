package javabeans;

public interface Verification {
    int verifyIdentity(String uid, String identity, String pubkey);
    int verifyPermission(String identity);
    String showInfo(String identity, String pubkey);
    int validateCurrentUser(String uid, String pw);
    int validateCurrentUser(User u);
    boolean isAdult(Person p);
}
