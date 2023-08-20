package edu.avocado.db;

import java.sql.*;

public interface DBC {

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);

}
