package javabeans;

import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getIid() {
        return iid;
    }

    public void setIid(String iid) {
        this.iid = iid;
    }

    public String getHashcode() {
        return hashcode;
    }

    public void setHashcode(String hashcode) {
        this.hashcode = hashcode;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getPubkey() {
        return pubkey;
    }

    public void setPubkey(String pubkey) {
        this.pubkey = pubkey;
    }

    public String getPrivkey() {
        return privkey;
    }

    public void setPrivkey(String privkey) {
        this.privkey = privkey;
    }

    public ArrayList<Identity> getAllIdentities() {
        ArrayList<Identity> identities = new ArrayList<Identity>();
        String sql="select * from idp_identities";
        ResultSet rs=db.getSelect(sql);
        try {
            while(rs.next()) {
                Identity i = new Identity(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                identities.add(i);
            }
            rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return identities;
    }

    public boolean getIdentityById(String id) {
        String sql="select * from idp_identities where u_id=?";
        ResultSet rs = db.getSelect(sql, id);
        try {
            rs.next();
            this.setAll(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6));
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
