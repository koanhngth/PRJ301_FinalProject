/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tran Phong Hai - CE180803
 */
public class BookDAO extends dal.DBContext {

    // Method to fetch all books from the database
    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<>();
        String query = "SELECT * FROM Books";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            // Execute the query and retrieve results
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                // Create Book object and set its attributes from the ResultSet
                Book book = new Book(
                        rs.getString("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getInt("year_published"),
                        rs.getInt("quantity_available"),
                        rs.getInt("total_quantity"),
                        rs.getString("image_url")
                );
                // Add book to the list
                list.add(book);
            }

            rs.close(); // Close the ResultSet
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addBook(Book book) {
        String query = "INSERT INTO [dbo].[Books] "
                + "([book_id], [title], [author], [year_published], [quantity_available], [total_quantity], [image_url]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, book.getBook_id());
            pstmt.setString(2, book.getTitle());
            pstmt.setString(3, book.getAuthor());
            pstmt.setInt(4, book.getYear_published());
            pstmt.setInt(5, book.getQuantity_available());  // Đúng là quantity_available
            pstmt.setInt(6, book.getTotal_quantity());      // Đúng là total_quantity
            pstmt.setString(7, book.getImage_url());

            int affectedRows = pstmt.executeUpdate();  // Sử dụng affectedRows thay vì gọi đệ quy
            return affectedRows > 0;  // Nếu có ít nhất một bản ghi được thêm vào, trả về true
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Trả về false nếu có lỗi
    }

    public Book getBookId(String book_id) {
        String query = "Select * from Books where book_id= ?";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, book_id);
            try ( ResultSet rs = pstmt.executeQuery()) {
                if (rs.next() == true) {
                    return new Book(rs.getString("book_id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getInt("year_published"),
                            rs.getInt("quantity_available"),
                            rs.getInt("total_quantity"),
                            rs.getString("image_url")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteBook(String book_id) {
        String query = "DELETE FROM [dbo].[Books]\n" +
"      WHERE book_id=?";
        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, book_id);
            int rs = pstmt.executeUpdate();
            return rs > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UpdateBook(Book book) {
        String query = "UPDATE [dbo].[Books]"
                + "   SET [title] = ?"
                + "      ,[author] = ?"
                + "      ,[year_published] = ?"
                + "      ,[quantity_available] = ?"
                + "      ,[total_quantity] = ?"
                + "      ,[image_url] = ?"
                + " WHERE book_id = ?";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setInt(3, book.getYear_published());
            pstmt.setInt(4, book.getQuantity_available());  // Đúng là quantity_available
            pstmt.setInt(5, book.getTotal_quantity());      // Đúng là total_quantity
            pstmt.setString(6, book.getImage_url());
            pstmt.setString(7, book.getBook_id());  // Tham số book_id để xác định bản ghi cần cập nhật

            int affectedRows = pstmt.executeUpdate();  // Thực thi câu lệnh UPDATE
            return affectedRows > 0;  // Trả về true nếu ít nhất một bản ghi bị ảnh hưởng
        } catch (SQLException e) {
            // Log lỗi hoặc xử lý lỗi ở đây thay vì in ra console
            e.printStackTrace();
        }
        return false;  // Trả về false nếu có lỗi xảy ra
    }

    public int getTotalBooks() {
        String query = "SELECT COUNT(*) FROM Books";
        try ( Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    public int getBooksInStock() {
        String query = "SELECT SUM(quantity_available) FROM Books";
        try ( Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM Users";
        try ( Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

//    public int getBorrowedBooks() {
//        String query = "SELECT COUNT(*) FROM BorrowedBooks WHERE return_date IS NULL";
//        try ( Statement stmt = connection.createStatement()) {
//            ResultSet rs = stmt.executeQuery(query);
//            if (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return 0; // Trả về 0 nếu có lỗi
//    }

    // Main method for testing the BookDAO
    public static void main(String[] args) {

        BookDAO pd = new BookDAO();
        List<Book> list = pd.getAllBook();

        // Print all books
        System.out.println("List of books:");
        for (Book book : list) {
            System.out.println(book.toString()); // Assuming Book class has a toString() method
        }

        Book b = new Book("11", "Harry Potter", "J. K. Rowling", 1998, 25, 15, "https://isach.info/images/story/cover/harry_potter_va_hon_da_phu_thuy__j_k_rowling.jpg");
        pd.addBook(b);
        System.out.println("L");
        list = pd.getAllBook();
        for (Book book : list) {
            System.out.println(book.toString());
        }
    }

}
