package Dao;

import Bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public User login(Connection con, User user) throws SQLException {//登录，判断账号密码是否正确
        User resultUser = null;
        String sql = "select * from user where UName=? and password=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, user.getUname());
        ps.setString(2, user.getPassword());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            resultUser = new User("","");
            resultUser.setUname(rs.getString("UName"));
            resultUser.setPassword(rs.getString("password"));
        }
        return resultUser;
    }

    public int adduser(Connection con, User U) throws SQLException{//注册
        String sql = "INSERT INTO user(UName,password,UEmail,UBirthday,USex) VALUE (?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, U.getUname());
        ps.setString(2, U.getPassword());
        ps.setString(3, U.getUEmail());
        ps.setString(4, U.getUBirthday());
        ps.setString(5, U.getUSex());
        return ps.executeUpdate();
    }
    public int selectname(Connection con,User U) throws SQLException{
        int name = 0;
        String sql = "select * from user where UName=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, U.getUname());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getInt("UID");
        }
        return name;
    }

    public User selectUserData(Connection con, User user) throws SQLException {//登录，判断账号密码是否正确
        User resultUser = null;
        String sql = "select * from user where UName=? ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, user.getUname());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            resultUser = new User("","");
            resultUser.setUname(rs.getString("UName"));
            resultUser.setPassword(rs.getString("password"));
            resultUser.setUEmail(rs.getString("UEmail"));
            resultUser.setUBirthday(rs.getString("UBirthday"));
            resultUser.setUSex(rs.getString("USex"));
            resultUser.setUSatement(rs.getString("USatement"));
        }
        return resultUser;
    }

    public int updatauser(Connection con, User U) throws SQLException{//注册
        String sql = "UPDATE USER SET UEmail=?,UBirthday=?,USex=?,USatement=? WHERE Uname=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, U.getUEmail());
        ps.setString(2, U.getUBirthday());
        ps.setString(3, U.getUSex());
        ps.setString(4, U.getUSatement());
        ps.setString(5, U.getUname());
        return ps.executeUpdate();
    }

    public int updatapassword(Connection con, User U) throws SQLException{//注册
        String sql = "UPDATE USER SET password=? WHERE Uname=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, U.getPassword());
        ps.setString(2, U.getUname());
        return ps.executeUpdate();
    }

    public int returnUID(Connection con, String Uname)throws SQLException{
        int resultUID = 0;
        String sql = "select * from user where UName=? ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, Uname);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            resultUID = rs.getInt("UID");
        }
        return resultUID;
    }
}
