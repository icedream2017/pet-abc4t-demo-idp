package javabeans;

import database.DatabaseController;
import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User implements DatabaseController {
    private String uid = null; // unique user ID in database
    private String username = null; // login name
    private String password = null; // login password (hashed)
    private String securePass = null; // double identification password (preserved) (hashed)
    private int type = 0; // user type: 0= registered user, 1= personal user, 2= enterprise user, 100= administrator
    private int activeFlag = 0;
    private int banFlag = 0;

    private MyDatabase db = null;

    public User() {
        this.db = new MyDatabase();
    }

    public User(String uid, String username, String password, String securePass) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.securePass = securePass;
    }

    public User(String uid, String username, String password, String securePass, int type) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.securePass = securePass;
        this.type = type;
    }

    public User(String uid, String username, String password, String securePass, int type, int activeFlag, int banFlag) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.securePass = securePass;
        this.type = type;
        this.activeFlag = activeFlag;
        this.banFlag = banFlag;
    }

    public void setAll(String uid, String username, String password, String securePass, int type, int activeFlag, int banFlag) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.securePass = securePass;
        this.type = type;
        this.activeFlag = activeFlag;
        this.banFlag = banFlag;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSecurePass() {
        return securePass;
    }

    public void setSecurePass(String securePass) {
        this.securePass = securePass;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getActiveFlag() {
        return activeFlag;
    }

    public void setActiveFlag(int activeFlag) {
        this.activeFlag = activeFlag;
    }

    public int getBanFlag() {
        return banFlag;
    }

    public void setBanFlag(int banFlag) {
        this.banFlag = banFlag;
    }

    @Override
    public ArrayList<User> getAllElements() {
        ArrayList<User> users = new ArrayList<User>();
        String sql="select * from idp_users";
        ResultSet rs=db.getSelect(sql);
        try {
            while(rs.next()) {
                User u = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7));
                users.add(u);
            }
            rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean getElementById(String id) {
        String sql="select * from idp_users where u_id=?";
        ResultSet rs = db.getSelect(sql, id);
        try {
            rs.next();
            this.setAll(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getInt(5),
                    rs.getInt(6),
                    rs.getInt(7));
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int identifyUser(String id, String pw) {
        String sql = "select * from idp_users where u_id=?";
        ResultSet rs=db.getSelect(sql, new String[]{id});
        try {
            if(rs.next()) {
                if(rs.getString(1).equals(id)&&rs.getString(2).equals(pw)) {
                    this.setAll(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getInt(7));
                    rs.close();
                    return this.type;
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public int add(String v[]) {
        String sql="insert into idp_users values(?,?,?,?,0,0,0)";
        return db.update(sql, v);
    }

    @Override
    public int delete(String id) {
        String sql="delete from idp_users where u_id=?";
        return db.update(sql, id);
    }

    @Override
    public int update(String id, String v[]) {
        // TODO This method is incomplete.
        String sql="update idp_users set -- ";
        return db.update(sql, v, id);
    }

    public int updateType(int type) {
        String sql = "update idp_users set u_type="+type+" where u_id=?";
        return db.update(sql, this.uid);
    }

    public boolean changePassword(String id, String oldpw, String newpw) {
        if(identifyUser(id,oldpw)!=-1) {
            String sql = "update idp_users set u_pw=? where u_id=?";
            int res = db.update(sql, new String[]{newpw}, id);
            if(res==1) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public void saveLoginHistory(int type, String uid, String date, String addr, String comment) {
        String sql = "insert into idp_log values(null,?,?,?,?,?)";
        String[] values={String.valueOf(type),uid,date,addr,comment};
        db.update(sql, values);
    }

    @Override
    public void close() {
        if(db!=null) db.close();
    }
}
