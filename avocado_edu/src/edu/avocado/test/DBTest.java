package edu.avocado.test;

import edu.avocado.db.*;
import java.sql.*;

public class DBTest {

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();
        String sql = "SELECT * FROM member";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while(rs.next()) {
            System.out.println(rs.getString("id"));
        }
    }

}
