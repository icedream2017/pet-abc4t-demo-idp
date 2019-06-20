/*
 * Author: Jiayi Zhao
 * This source code is used for my Master Project.
 * Non-commercial use only.
 */

package database;

import java.sql.*;

public class MyDatabase {

    private String driver;
    private String hostname;
    private String port;
    private String dbname;
    private String username;
    private String password;
    private Connection con=null;
    private Statement st=null;
    private PreparedStatement pst=null;
    private ResultSet res=null;

    public MyDatabase() {
        driver="com.mysql.jdbc.Driver";
        hostname="192.168.108.128";
        port="3306";
        dbname="db_pet_abc4t";
        username="mp_pet_dbuser";
        password="mp_db_PET";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection("jdbc:mysql://"+hostname+":"+port+"/"+dbname,username,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public MyDatabase(String driver, String hostname, String port, String dbname, String username, String password) {
        this.driver=driver;
        this.hostname=hostname;
        this.port=port;
        this.dbname=dbname;
        this.username=username;
        this.password=password;
        try {
            Class.forName(this.driver);
            this.con = DriverManager.getConnection("jdbc:mysql://"+this.hostname+":"+this.port+"/"+this.dbname,this.username,this.password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet getSelect(String sql) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            res=pst.executeQuery();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getSelect(String sql, String value) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            pst.setString(1, value);
            res=pst.executeQuery();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getSelect(String sql, String values[]) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            for(int i=0; i<values.length; i++)
            {
                pst.setString(i+1, values[i]);
            }
            res=pst.executeQuery();
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int update(String sql, String value) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            pst.setString(1, value);
            return pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int update(String sql, String values[]) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            for(int i=0; i<values.length; i++)
            {
                pst.setString(i+1, values[i]);
            }
            return pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int update(String sql, String values[], String condition) {
        try {
            if(pst!=null) pst.close();
            pst=con.prepareStatement(sql);
            for(int i=0; i<values.length; i++)
            {
                pst.setString(i+1, values[i]);
            }
            pst.setString(values.length+1, condition);
            return pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void close() {
        try {
            if(res!=null) res.close();
            if(st!=null) st.close();
            if(pst!=null) pst.close();
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

}
