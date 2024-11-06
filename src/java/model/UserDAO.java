/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DELL-Laptop
 */
public class UserDAO extends DBContext {

    public User getUserById(int id) {

        String sql = "SELECT * FROM Users WHERE user_id = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User e = new User(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("role"),
                            new Date(rs.getTimestamp("created_at").getTime()),
                            new Date(rs.getTimestamp("updated_at").getTime())
                    );
                    return e;
                }
            }

        } catch (Exception e) {
            System.out.println("Error when querying by ID: " + e.getMessage());
        }
        return null;
    }

    public void updateUser(User us) {
        String sql = "UPDATE [dbo].[Users] "
                + "SET username = ?, password = ?, email = ?, updated_at = ? "
                + "WHERE user_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, us.getName());
            st.setString(2, us.getPassword());
            st.setString(3, us.getEmail());
            st.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis())); // Thời gian cập nhật hiện tại
            st.setInt(5, us.getId());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại lỗi để dễ dàng kiểm tra
        }
    }
    
        

    public void addNewUser(User em) {
        String sql = "INSERT INTO [dbo].[Users] "
                + "(username, password, email, role) "
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getName());
            st.setString(2, em.getPassword());
            st.setString(3, em.getEmail());
            st.setString(4, em.getRole());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public boolean deleteUserById(int id) {
        String sql = "DELETE FROM [dbo].[Users] WHERE user_id=?";

        try {
            // Kiểm tra kết nối
            if (connection == null) {
                System.out.println("Connection is null!");
                return false; // Trả về false nếu không có kết nối
            }

            System.out.println("Executing SQL: " + sql);

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            // Thực hiện xóa
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Successfully deleted with ID: " + id);
                return true; // Trả về true nếu xóa thành công
            } else {
                System.out.println("No found with ID: " + id);
                return false; // Trả về false nếu không tìm thấy ID
            }
        } catch (Exception e) {
            System.out.println("Error during deletion: " + e.getMessage());
            e.printStackTrace(); // In ra stack trace để dễ dàng theo dõi lỗi
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

}
