package frmQLCafe;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    private static final String URL = "jdbc:mariadb://localhost:3306/cafe";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    
    private static Connection connection = null;
    
    private DatabaseConnection() {}
    
    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("org.mariadb.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Kết nối thành công!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Kết nối thất bại!");
        }
        return connection;
    }
}