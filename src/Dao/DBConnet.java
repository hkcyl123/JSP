package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnet {
    private String url = "jdbc:mysql://localhost:3306/ks1";
    private String user = "root";
    private String password = "hkcyl132457";
    private String driver = "com.mysql.jdbc.Driver";
    public Connection getCon() throws Exception {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
    }
    public static void getClose(Connection con) throws SQLException {
        if (con != null) {
            con.close();
        }
    }
}
