package javabeans;

public class Shadow {
    private String uid = null;
    private String pid = null;
    private int type = 0;

    //public information
    private boolean title = true;
    private boolean surname = true;
    private boolean gender = true;

    //shadow information
    private boolean taxid = false;          // 0100 0000
    private boolean firstname = false;      // 0010 0000
    private boolean birthdate = false;      // 0001 0000
    private boolean address = false;        // 0000 1000
    private boolean email = false;          // 0000 0100
    private boolean phone = false;          // 0000 0010
    private boolean description = false;    // 0000 0001

    public static final byte S_TAXID = 64;
    public static final byte S_FIRSTNAME = 32;
    public static final byte S_BIRTHDATE = 16;
    public static final byte S_ADDRESS = 8;
    public static final byte S_EMAIL = 4;
    public static final byte S_PHONE = 2;
    public static final byte S_DESCRIPTION = 1;
    public static final byte S_HIDDEN = 0;

    //shadow mode in byte
    private byte mode = 0b00000000;

    //target person
    private Person person;

    public Shadow() {
    }

    public Shadow(byte mode) {
        this.mode = mode;
    }

    public String shadowInformation() {
        String shadowedString = "|";
        shadowedString += this.person.getTitle() + "|";
        shadowedString += this.person.getSurname() + "|";
        shadowedString += this.person.getGender() + "|";
        shadowedString += this.taxid ? this.person.getTaxID()+"|" : "x|";
        shadowedString += this.firstname ? this.person.getFirstname()+"|" : "x|";
        shadowedString += this.birthdate ? this.person.getBirthdate()+"|" : "x|";
        shadowedString += this.address ? this.person.getAddress()+"|" : "x|";
        shadowedString += this.email ? this.person.getEmail()+"|" : "x|";
        shadowedString += this.phone ? this.person.getPhone()+"|" : "x|";
        shadowedString += this.description ? this.person.getDescription()+"|" : "x|";
        return shadowedString;
    }

    public String shadowInformation(Person person) {
        String shadowedString = "|";
        shadowedString += person.getTitle() + "|";
        shadowedString += person.getSurname() + "|";
        shadowedString += person.getGender() + "|";
        shadowedString += this.taxid ? person.getTaxID()+"|" : "x|";
        shadowedString += this.firstname ? person.getFirstname()+"|" : "x|";
        shadowedString += this.birthdate ? person.getBirthdate()+"|" : "x|";
        shadowedString += this.address ? person.getAddress()+"|" : "x|";
        shadowedString += this.email ? person.getEmail()+"|" : "x|";
        shadowedString += this.phone ? person.getPhone()+"|" : "x|";
        shadowedString += this.description ? person.getDescription()+"|" : "x|";
        return shadowedString;
    }

    public byte getMode() {
        return mode;
    }

    public void setMode(byte mode) {
        this.mode = mode;
    }
}
