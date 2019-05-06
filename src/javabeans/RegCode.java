package javabeans;

import database.MyDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegCode {
    private String id = null;
    private int count = 1;

    private MyDatabase db = null;
	/*
	CREATE TABLE 'idp_regcode' (
	r_id char(10) not null,
	r_count int not null default 1,
	PRIMARY KEY (r_id)
	)
	*/

    public RegCode() {
        this.db = new MyDatabase();
    }

    public RegCode(String id, int count) {
        this.id=id;
        this.count=count;
    }

    public void setAll(String id, int count) {
        this.id=id;
        this.count=count;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public ArrayList<RegCode> getAllCodes() {
        ArrayList<RegCode> codes = new ArrayList<RegCode>();
        String sql="select * from idp_regcode";
        ResultSet rs=db.getSelect(sql);
        try {
            while(rs.next()) {
                RegCode u = new RegCode(rs.getString(1),rs.getInt(2));
                codes.add(u);
            }
            rs.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return codes;
    }

    public int getCodeCountById(String id) {
        String sql="select * from idp_regcode where r_id=?";
        ResultSet rs = db.getSelect(sql, id);
        try {
            rs.next();
            this.setAll(rs.getString(1),rs.getInt(2));
            return this.getCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int useCode() {
        String sql="update idp_regcode set r_count=r_count-1 where r_id=?";
        return db.update(sql, this.id);
    }

    public int useCode(String id) {
        String sql="update idp_regcode set r_count=r_count-1 where r_id=?";
        return db.update(sql, id);
    }

    public int addCode(String v[]) {
        String sql="insert into idp_regcode values(?,?)";
        return db.update(sql, v);
    }

    public int deleteCode(String id) {
        String sql="delete from idp_regcode where r_id=?";
        return db.update(sql, id);
    }

    public void close() {
        if(db!=null) db.close();
    }
}
