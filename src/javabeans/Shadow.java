package javabeans;

public class Shadow {
    private String uid = null;
    private String pid = null;
    private int type = 0;

    public static final byte S_PUBLIC = 127;
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
