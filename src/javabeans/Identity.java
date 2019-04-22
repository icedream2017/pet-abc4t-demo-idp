package javabeans;

import cryptography.Cryptography;
import database.DatabaseController;
import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Identity implements DatabaseController {
    private String uid = null;
    private String iid = null;
    private String hashcode = null;
    private String purpose = null;
    private String pubkey = null;
    private String privkey = null;
    // private int permission = 0x00;

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

    @SuppressWarnings("Duplicates")
    @Override
    public ArrayList<Identity> getAllElements() {
        ArrayList<Identity> identities = new ArrayList<Identity>();
        String sql="select * from idp_identities";
        ResultSet rs = db.getSelect(sql);
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

    @SuppressWarnings("Duplicates")
    public ArrayList<Identity> getIdentitiesByUid(String uid) {
        ArrayList<Identity> identities = new ArrayList<Identity>();
        String sql="select * from idp_identities where u_id=?";
        ResultSet rs = db.getSelect(sql, uid);
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

    @Override
    public boolean getElementById(String id) {
        String sql="select * from idp_identities where i_id=?";
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

    @Override
    public int add(String v[]) {
        String sql = "insert into idp_identities values(?,?,?,?,?,?)";
        return db.update(sql, v);
    }

    @Override
    public int delete(String id) {
        String sql = "delete from idp_identities where i_id=?";
        return db.update(sql, id);
    }

    @Override
    public int update(String id, String v[]) {
        // TODO This method is incomplete.
        String sql = "update idp_identities set --";
        return db.update(sql, v, id);
    }

    @Override
    public void close() {
        if(db!=null) db.close();
    }

    public static String generateOriginalInfo(Person person, Shadow shadow) {
        if(person==null||shadow==null) {
            return null;
        }
        String shadowedString = "|";
        byte mode = shadow.getMode();
        shadowedString += person.getTitle() + "|";
        shadowedString += person.getSurname() + "|";
        shadowedString += person.getGender() + "|";
        shadowedString += (mode & Shadow.S_TAXID)==64 ? person.getTaxID()+"|" : "x|";
        shadowedString += (mode & Shadow.S_FIRSTNAME)==32 ? person.getFirstname()+"|" : "x|";
        shadowedString += (mode & Shadow.S_BIRTHDATE)==16 ? person.getBirthdate()+"|" : "x|";
        shadowedString += (mode & Shadow.S_ADDRESS)==8 ? person.getAddress()+"|" : "x|";
        shadowedString += (mode & Shadow.S_EMAIL)==4 ? person.getEmail()+"|" : "x|";
        shadowedString += (mode & Shadow.S_PHONE)==2 ? person.getPhone()+"|" : "x|";
        shadowedString += (mode & Shadow.S_DESCRIPTION)==1 ? person.getDescription()+"|" : "x|";
        return shadowedString;
    }

    public static String generateNewIdentity(Person person, Shadow shadow) {
        try {
            return Cryptography.toSHA256(generateOriginalInfo(person,shadow));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String generateNewIdentity(String originalInfo) {
        try {
            return Cryptography.toSHA256(originalInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
