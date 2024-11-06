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
import model.AccountDAO;
import model.UserDAO;

/**
 *
 * @author Oanh Nguyen
 */
@WebServlet(name = "checkOTP", urlPatterns = {"/checkOTP"})
public class checkOTP extends HttpServlet {

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
            int OTP = Integer.parseInt(request.getParameter("OTP"));
            String newPass = request.getParameter("newPass");
            String cNewPass = request.getParameter("cNewPass");
            int a = Integer.parseInt(request.getParameter("otp"));
            String user = request.getParameter("user");
            String error = "";
            if (!newPass.equalsIgnoreCase(cNewPass) ) {
                error += "Passwords do not match. Please check again!";
            }
            if (OTP != a) {
                error += "Invalid OTP!";
            
            }
            if (newPass.equalsIgnoreCase(cNewPass) && OTP == a) {
                AccountDAO u = new AccountDAO();
                u.updatePassword(newPass, user);
                request.setAttribute("error",newPass);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }else{
            
                request.setAttribute("error",error);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                
            }
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
