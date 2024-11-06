/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tran Phong Hai - CE180803
 */
public class AccountDAO extends dal.DBContext {

    public boolean validate(String username, String password) {
        if (connection == null) {
            System.out.println("Lỗi: Kết nối cơ sở dữ liệu không tồn tại.");
            return false;
        }

        String query = "select username, password from Users where username = ? and password = ?";
        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);  

            try ( ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getFullname(String username) {
        String sql = "SELECT fullname FROM Users WHERE username = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("fullname");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addAccount(Account account) {
        String query = "INSERT INTO [dbo].[Users] ([username], [password], [email], [role]) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, account.getUsername());
            pstmt.setString(2, account.getPass()); // Bạn nên băm mật khẩu trước khi lưu
            pstmt.setString(3, account.getEmail());
            pstmt.setString(4, account.getRole());

            // Thực thi câu lệnh và kiểm tra kết quả
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
  
    
    public boolean isAccountExists(String username) {
    String query = "SELECT COUNT(*) FROM Users WHERE username = ?";
    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next() && rs.getInt(1) > 0) {
            return true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
} 

//    public static void main(String[] args) throws SQLException {
//        AccountDAO pd = new AccountDAO();
//        List<Account> list = pd.getAllProduct();
//        System.out.println("L");
//        for (Account product : list) {
//            System.out.println(product.toString());
//        }
//
//    }
}
