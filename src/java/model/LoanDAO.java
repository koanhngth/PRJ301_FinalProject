package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class LoanDAO extends dal.DBContext {

    // Phương thức để lấy tất cả các bản ghi từ bảng Borrowings
    public List<Loan> getAllLoans() {
        List<Loan> loans = new ArrayList<>();
        String query = "SELECT loan_id, username, book_id, loan_date, return_date, status FROM Borrowings";

        try (PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Loan loan = new Loan();
                loan.setLoanId(rs.getInt("loan_id"));
                loan.setUsername(rs.getString("username"));
                loan.setBookId(rs.getString("book_id"));

                // Chuyển đổi từ SQL Date sang LocalDate
                java.sql.Date loanDateSql = rs.getDate("loan_date");
                java.sql.Date returnDateSql = rs.getDate("return_date");

                loan.setLoanDate(loanDateSql != null ? loanDateSql.toLocalDate() : null);
                loan.setReturnDate(returnDateSql != null ? returnDateSql.toLocalDate() : null);

                loan.setStatus(rs.getString("status"));
                loans.add(loan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return loans;
    }

    // Phương thức để thêm một bản ghi mới vào bảng Borrowings
    public boolean addLoan(Loan loan) {
        String query = "INSERT INTO Borrowings (username, book_id, loan_date, return_date, status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, loan.getUsername());
            pstmt.setString(2, loan.getBookId());
            pstmt.setDate(3, loan.getLoanDate() != null ? java.sql.Date.valueOf(loan.getLoanDate()) : null);
            pstmt.setDate(4, loan.getReturnDate() != null ? java.sql.Date.valueOf(loan.getReturnDate()) : null);
            pstmt.setString(5, loan.getStatus());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Phương thức để cập nhật ngày trả trong bảng Borrowings
    public boolean updateReturnDate(int loanId, LocalDate returnDate) {
        String query = "UPDATE Borrowings SET return_date = ? WHERE loan_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setDate(1, returnDate != null ? java.sql.Date.valueOf(returnDate) : null);
            pstmt.setInt(2, loanId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Phương thức kiểm tra xem bản ghi với loanId có tồn tại không
    public boolean isLoanExists(int loanId) {
        String query = "SELECT COUNT(*) FROM Borrowings WHERE loan_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, loanId);
            ResultSet rs = pstmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Phương thức để lấy một bản ghi theo loanId từ bảng Borrowings
    public List<Loan> getLoanByName(String username) {
    List<Loan> loans = new ArrayList<>();
    String query = "SELECT loan_id, username, book_id, loan_date, return_date, status FROM Borrowings WHERE username = ?";

    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Loan loan = new Loan();
            loan.setLoanId(rs.getInt("loan_id"));
            loan.setUsername(rs.getString("username"));
            loan.setBookId(rs.getString("book_id"));

            // Convert SQL Date to LocalDate
            java.sql.Date loanDateSql = rs.getDate("loan_date");
            java.sql.Date returnDateSql = rs.getDate("return_date");

            loan.setLoanDate(loanDateSql != null ? loanDateSql.toLocalDate() : null);
            loan.setReturnDate(returnDateSql != null ? returnDateSql.toLocalDate() : null);

            loan.setStatus(rs.getString("status"));
            loans.add(loan);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return loans; // Return the list of loans
}
    
    public Loan getLoanById(int loanId) {
    Loan loan = null;
    String query = "SELECT loan_id, username, book_id, loan_date, return_date, status FROM Borrowings WHERE loan_id = ?";

    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setInt(1, loanId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            loan = new Loan();
            loan.setLoanId(rs.getInt("loan_id"));
            loan.setUsername(rs.getString("username"));
            loan.setBookId(rs.getString("book_id"));
            loan.setLoanDate(rs.getDate("loan_date").toLocalDate());
            loan.setReturnDate(rs.getDate("return_date") != null ? rs.getDate("return_date").toLocalDate() : null);
            loan.setStatus(rs.getString("status"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return loan;
}

public boolean updateLoan(int loanId, String status, String returnDate) {
    String query = "UPDATE Borrowings SET status = ?, return_date = ? WHERE loan_id = ?";

    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setString(1, status);
        pstmt.setDate(2, returnDate != null && !returnDate.isEmpty() ? java.sql.Date.valueOf(returnDate) : null);
        pstmt.setInt(3, loanId);

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}

public boolean updatequantity(String id) {
    String query = "UPDATE [dbo].[Books]\n" +
"   SET \n" +
"      [quantity_available] += 1  \n" +
" WHERE book_id= ?";

    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setString(1, id);       
        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}

    // Phương thức để xóa một bản ghi theo loanId từ bảng Borrowings
    public boolean deleteLoan(int loanId) {
        String query = "DELETE FROM Borrowings WHERE loan_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, loanId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
