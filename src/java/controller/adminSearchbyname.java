/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Loan;
import model.LoanDAO;

/**
 *
 * @author Dinh Van Do - CE182224
 */
@WebServlet(name = "adminSearchbyname", urlPatterns = {"/adminSearchbyname"})
public class adminSearchbyname extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // Get the username from the request parameter
            String username = request.getParameter("username");
            
            // If username is not provided, show an appropriate message or all loans
            if (username == null || username.trim().isEmpty()) {
                request.setAttribute("error", "Please enter a username to search.");
                request.getRequestDispatcher("admininfo.jsp").forward(request, response);
                return;
            }
            
            // Create the DAO object and fetch loans by username
            LoanDAO loanDAO = new LoanDAO();
            List<Loan> loanList = loanDAO.getLoanByName(username);
            
            // If no loans found, show a message
            if (loanList.isEmpty()) {
                request.setAttribute("error", "No loans found for the username: " + username);
            }
            
            // Set the list of loans as a request attribute to forward to the JSP
            request.setAttribute("list", loanList);
            
            // Forward to the JSP page
            request.getRequestDispatcher("admininfo.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
