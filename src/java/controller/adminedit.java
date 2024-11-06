package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Array;
import java.util.List;
import model.Loan;
import model.LoanDAO;

@WebServlet(name = "adminedit", urlPatterns = {"/adminedit"})
public class adminedit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        int loanId = Integer.parseInt(request.getParameter("id"));
        
        LoanDAO loanDAO = new LoanDAO();
        Loan loan = loanDAO.getLoanById(loanId);

        if (action != null && action.equals("update")) {
            // Handling the update of loan information
            String status = request.getParameter("status");
            String returnDate = request.getParameter("returnDate");
            Loan list= loanDAO.getLoanById(loanId);
            
            // Perform the update operation
            boolean isUpdated = loanDAO.updateLoan(loanId, status, returnDate);
            
            // Set message based on the result
            String message = isUpdated ? "Loan updated successfully." : "Failed to update loan.";
            if(isUpdated && status.equalsIgnoreCase("returned")){
                loanDAO.updatequantity(list.getBookId());
            }
            request.setAttribute("error", message);
            request.getRequestDispatcher("admininfo").forward(request, response);
        } else {
            // Display the current loan details in the form for editing
            request.setAttribute("loan", loan);
            request.getRequestDispatcher("adminedit.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin edit loan details servlet";
    }
}
