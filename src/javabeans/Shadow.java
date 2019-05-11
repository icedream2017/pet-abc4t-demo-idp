package javabeans;

public class Shadow {

    public static final byte PUBLIC = 127;
    public static final byte TAXID = 64;
    public static final byte FIRSTNAME = 32;
    public static final byte BIRTHDATE = 16;
    public static final byte ADDRESS = 8;
    public static final byte EMAIL = 4;
    public static final byte PHONE = 2;
    public static final byte DESCRIPTION = 1;
    public static final byte HIDDEN = 0;

    //shadow mode in byte
    private byte mode = 0b00000000;

    public Shadow() {
    }

    public Shadow(byte mode) {
        this.mode = mode;
    }

    public byte getMode() {
        return mode;
    }

    public void setMode(byte mode) {
        this.mode = mode;
    }
}
