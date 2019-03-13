package javabeans;

import database.MyDatabase;

public class Identity {
    private String uid = null;
    private String iid = null;
    private String hashcode = null;
    private String purpose = null;
    private String pubkey = null;
    private String privkey = null;

    private MyDatabase db = null;

    public Identity() {
        this.db = new MyDatabase();
    }

    public Identity(String uid, String iid, String hashcode,
                    String purpose, String pubkey, String privkey) {
        this.uid = uid;
        this.iid = iid;
        this.hashcode = hashcode;
        this.purpose = purpose;
        this.pubkey = pubkey;
        this.privkey = privkey;
    }

    public void setAll(String uid, String iid, String hashcode,
                       String purpose, String pubkey, String privkey) {
        this.uid = uid;
        this.iid = iid;
        this.hashcode = hashcode;
        this.purpose = purpose;
        this.pubkey = pubkey;
        this.privkey = privkey;
    }
}
