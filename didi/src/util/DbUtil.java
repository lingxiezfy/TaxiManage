package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    /**
     * 从数据库获取连接
     * @return
     */
    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://localhost:3306/didi?useUnicode=true&characterEncoding=utf8";
            conn = DriverManager.getConnection(url, "root", "123");
        } catch (InstantiationException | IllegalAccessException
                | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 释放数据库连接
     * @param conn 已使用完的连接对象
     */
    public void freeConnection(Connection conn) {
        if (conn != null)
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }
}
