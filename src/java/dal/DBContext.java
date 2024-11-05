package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//NGUYEN THANH PHAT CE180119
public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Library";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
      public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        if (dbContext.connection != null) {
            System.out.println("Kết nối thành công!");
        } else {
            System.out.println("Kết nối không thành công!");
        }
    }
}
