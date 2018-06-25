package Dao;

import Bean.bbsreply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class bbsreplyDao {
    public ArrayList<bbsreply> selectallbbsreply(Connection con, bbsreply R) throws SQLException {
        //把所有回复帖子罗列出来成功后返回数组列表（只返回回复人，内容和跟贴时间）
        bbsreply result = null;
        ArrayList<bbsreply> list = new ArrayList<bbsreply>();
        String sql = "select * from v2 WHERE TID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, R.getTID());
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            result = new bbsreply();
            result.setUName(rs.getString("Uname"));
            result.setRContent(rs.getString("RContent"));
            result.setRTime(rs.getString("RTime"));
            list.add(result);
        }
        return list;
    }
    public int addbbsreply(Connection con, bbsreply R) throws SQLException{//发帖，成功后返回1
        String sql = "INSERT INTO bbsreply(TID,UID,RContent,RTime) VALUE (?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);//
        ps.setInt(1, R.getTID());
        ps.setInt(2, R.getUID());
        ps.setString(3, R.getRContent());
        ps.setString(4, R.getRTime());
        return ps.executeUpdate();
    }
    public void deletebbsreply(Connection con, bbsreply R) throws SQLException{//删帖，删除后返回1
        String sql = "DELETE FROM bbsreply WHERE TID=?";
        PreparedStatement ps=con.prepareStatement(sql);//
        ps.setInt(1, R.getTID());
        ps.executeUpdate();
    }
}
