/*
 * Author: Jiayi Zhao
 * This source code is used for my Master Project.
 * Non-commercial use only.
 */

package javabeans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MyDatabase;

public class LoginHistory {
    private int hid=0;
    private int type=0; // 1= new user; 2= login; 3= new personal info;
    private String uid=null;
    private String addr=null;
    private String comment=null;
    private String datetime=null;
    private MyDatabase db=null;

    public LoginHistory() {
        db=new MyDatabase();
    }

    public LoginHistory(int hid, int type, String uid, String addr, String comment, String datetime) {
        this.hid=hid;
        this.setType(type);
        this.uid=uid;
        this.addr=addr;
        this.comment=comment;
        this.datetime=datetime;
    }

    public void setAll(int hid, int type, String uid, String addr, String comment, String datetime) {
        this.hid=hid;
        this.setType(type);
        this.uid=uid;
        this.addr=addr;
        this.comment=comment;
        this.datetime=datetime;
    }

    public int getHid() {
        return hid;
    }

    public int getType() {
        return type;
    }

    public String getUid() {
        return uid;
    }

    public String getAddr() {
        return addr;
    }

    public String getComment() {
        return comment;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    @SuppressWarnings("Duplicates")
    public ArrayList<LoginHistory> getAllLoginHistory() {
        ArrayList<LoginHistory> ar = new ArrayList<LoginHistory>();
        String sql="select * from idp_log";
        ResultSet rs=db.getSelect(sql);
        try {
            while(rs.next()) {
                LoginHistory a = new LoginHistory(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                ar.add(a);
            }
            rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }

    @SuppressWarnings("Duplicates")
    public ArrayList<LoginHistory> getMyLoginHistoryById(String id) {
        ArrayList<LoginHistory> ar = new ArrayList<LoginHistory>();
        String sql = "select * from idp_log where u_id=?";
        ResultSet rs=db.getSelect(sql,id);
        try {
            while(rs.next()) {
                LoginHistory a = new LoginHistory(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                ar.add(a);
            }
            rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }

    public void close() {
        if(db!=null) db.close();
    }
}
