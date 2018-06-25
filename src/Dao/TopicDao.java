package Dao;

import Bean.bbstopic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TopicDao {
    public ArrayList selectall(Connection con, bbstopic T) throws SQLException {
        //把所有帖子罗列出来，成功后返回数组列表(返回包括发帖人ID，回复数，标题，正文，时间)
        bbstopic result = null;
        ArrayList list = new ArrayList();
        String sql = "select * from v1 WHERE SID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, T.getSID());
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            result = new bbstopic();
            result.setTID(rs.getInt("TID"));
            result.setUName(rs.getString("Uname"));
            result.setReplyCount(rs.getString("ReplyCount"));
            result.setTopic(rs.getString("Topic"));
            result.setTCountents(rs.getString("TCountents"));
            result.setTTime(rs.getString("Time"));
            list.add(result);
        }
        return list;
    }

    public int addtopic(Connection con, bbstopic T) throws SQLException {//发帖，成功后返回1
        String sql = "INSERT INTO bbstopic(SID,UID,ReplyCount,Topic,TCountents,TTime) VALUE (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);//
        ps.setInt(1, T.getSID());
        ps.setInt(2, T.getUID());
        ps.setString(3, T.getReplyCount());
        ps.setString(4, T.getTopic());
        ps.setString(5, T.getTCountents());
        ps.setString(6, T.getTTime());
        return ps.executeUpdate();
    }

    public int deletetopic(Connection con, bbstopic T) throws SQLException {//删帖，删除后返回1
        String sql = "DELETE FROM bbstopic WHERE TID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, T.getTID());
        return ps.executeUpdate();
    }

    public int returnTID(Connection con, bbstopic T) throws SQLException {
        int a = 0;
        String sql = "select * from v1 WHERE Uname=? AND Time=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, T.getUName());
        ps.setString(2, T.getTTime());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            bbstopic result = null;
            result = new bbstopic();
            result.setTID(rs.getInt("TID"));
            a = result.getTID();
        }
        return a;
    }


    public bbstopic selectopic(Connection con, bbstopic T) throws SQLException {
        int a = 0;
        String sql = "select * from v1 WHERE TID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, T.getTID());
        ResultSet rs = ps.executeQuery();
        bbstopic bbstopic = null;
        if (rs.next()) {
            bbstopic result = null;
            result = new bbstopic();
            result.setTID(rs.getInt("TID"));
            result.setUName(rs.getString("Uname"));
            result.setTTime(rs.getString("Time"));
            result.setTopic(rs.getString("Topic"));
            result.setReplyCount(rs.getString("ReplyCount"));
            result.setTCountents(rs.getString("TCountents"));
            bbstopic = result;
        }
        return bbstopic;
    }

    public ArrayList<bbstopic> selectMyTopic(Connection con,bbstopic T)throws SQLException{
        bbstopic result = null;
        ArrayList list = new ArrayList();
        String sql = "select * from v1 WHERE Uname=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, T.getUName());
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            result = new bbstopic();
            result.setTID(rs.getInt("TID"));
            result.setUName(rs.getString("Uname"));
            result.setReplyCount(rs.getString("ReplyCount"));
            result.setTopic(rs.getString("Topic"));
            result.setTCountents(rs.getString("TCountents"));
            result.setTTime(rs.getString("Time"));
            list.add(result);
        }
        return list;
    }

    public void updatacount(Connection con, int TID)throws SQLException{
        int count = 0;
        String sql = "select * from bbstopic WHERE TID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, TID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("ReplyCount");
        }
        count++;
        String sql1 = "UPDATE bbstopic SET ReplyCount=? WHERE TID=?";
        PreparedStatement ps1=con.prepareStatement(sql1);
        ps1.setInt(1, count);
        ps1.setInt(2,TID);
        ps1.executeUpdate();
    }

    public ArrayList selectTopic(Connection con, String Topic) throws SQLException {
        //把所有帖子罗列出来，成功后返回数组列表(返回包括发帖人ID，回复数，标题，正文，时间)
        bbstopic result = null;
        ArrayList list = new ArrayList();
        String sql = "select * from v1 where Topic LIKE '%" + Topic + "%'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            result = new bbstopic();
            result.setTID(rs.getInt("TID"));
            result.setUName(rs.getString("Uname"));
            result.setReplyCount(rs.getString("ReplyCount"));
            result.setTopic(rs.getString("Topic"));
            result.setTCountents(rs.getString("TCountents"));
            result.setTTime(rs.getString("Time"));
            list.add(result);
        }
        return list;
    }
}