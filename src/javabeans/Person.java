package javabeans;

import database.DatabaseController;
import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Person implements DatabaseController {
    private String uid = null; // FK to class User
    private String taxID = null; // tax ID for a person
    private String title = null;
    private String surname = null;
    private String firstname = null;
    private int gender = 0; // 0= female, 1= male
    private String birthdate = null; // in format YYYYMMDD
    private String address = null;
    private String email = null;
    private String phone = null;
    private String description = null;

    private MyDatabase db = null;

    public Person() {
        this.db = new MyDatabase();
    }

    public Person(String uid, String taxID, String title, String surname, String firstname,
                  int gender, String birthdate, String address, String email, String phone, String description) {
        this.uid = uid;
        this.taxID = taxID;
        this.title = title;
        this.surname = surname;
        this.firstname = firstname;
        this.gender = gender;
        this.birthdate = birthdate;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.description = description;
    }

    public void setAll(String uid, String taxID, String title, String surname, String firstname,
                       int gender, String birthdate, String address, String email, String phone, String description) {
        this.uid = uid;
        this.taxID = taxID;
        this.title = title;
        this.surname = surname;
        this.firstname = firstname;
        this.gender = gender;
        this.birthdate = birthdate;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.description = description;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTaxID() {
        return taxID;
    }

    public void setTaxID(String taxID) {
        this.taxID = taxID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
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
    public ArrayList<Person> getAllElements() {
        ArrayList<Person> persons = new ArrayList<Person>();
        String sql = "select * from idp_persons";
        ResultSet rs = db.getSelect(sql);
        try {
            while (rs.next()) {
                Person p = new Person(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
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
        String sql = "select * from idp_persons where u_id=?";
        ResultSet rs = db.getSelect(sql, id);
        try {
            rs.next();
            this.setAll(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10),
                    rs.getString(11));
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int add(String v[]) {
        String sql = "insert into idp_persons values(?,?,?,?,?,0,?,?,?,?,?)";
        return db.update(sql, v);
    }

    @Override
    public int delete(String id) {
        String sql = "delete from idp_persons where p_id=?";
        return db.update(sql, id);
    }

    @Override
    public int update(String id, String v[]) {
        // TODO This method is incomplete.
        String sql = "update idp_persons set --";
        return db.update(sql, v, id);
    }

    @Override
    public void close() {
        if(db!=null) db.close();
    }

}
