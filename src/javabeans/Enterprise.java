package javabeans;

import database.DatabaseController;
import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Enterprise implements DatabaseController {
    private String eid = null;
    private String uid = null;
    private String name = null;
    private String manager = null;
    private String website = null;
    private String date = null;
    private String address = null;
    private String email = null;
    private String phone = null;
    private String description = null;

    private MyDatabase db = null;

    public Enterprise() {
        this.db = new MyDatabase();
    }

    public Enterprise(String eid, String uid, String name, String manager, String website,
                      String date, String address, String email, String phone, String description) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.manager = manager;
        this.website = website;
        this.date = date;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.description = description;
    }

    public void setAll(String eid, String uid, String name, String manager, String website,
                      String date, String address, String email, String phone, String description) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.manager = manager;
        this.website = website;
        this.date = date;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.description = description;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public ArrayList<Enterprise> getAllElements() {
        ArrayList<Enterprise> persons = new ArrayList<>();
        String sql = "select * from idp_enterprises";
        ResultSet rs = db.getSelect(sql);
        try {
            while (rs.next()) {
                Enterprise p = new Enterprise(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
                persons.add(p);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return persons;
    }

    @Override
    public boolean getElementById(String id) {
        String sql = "select * from idp_enterprises where u_name=?";
        ResultSet rs = db.getSelect(sql, id);
        try {
            rs.next();
            this.setAll(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10));
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int add(String v[]) {
        String sql = "insert into idp_enterprises values(?,?,?,?,?,?,?,?,?,?)";
        return db.update(sql, v);
    }

    @Override
    public int delete(String id) {
        String sql = "delete from idp_enterprises where u_name=?";
        return db.update(sql, id);
    }

    @Override
    public int update(String id, String v[]) {
        // TODO This method is incomplete.
        String sql = "update idp_enterprises set --";
        return db.update(sql, v, id);
    }

    @Override
    public void close() {
        if(db!=null) db.close();
    }

}
