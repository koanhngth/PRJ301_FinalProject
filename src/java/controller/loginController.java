/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import model.AccountDAO;

/**
 *
 * @author Tran Phong Hai - CE180803
 */
@WebServlet(name = "loginCotroller", urlPatterns = {"/login"})
public class loginController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginCotroller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginCotroller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        AccountDAO accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Kiểm tra username và password có rỗng không
//            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
//                request.setAttribute("error", "Username and password cannot be blank");
//                request.getRequestDispatcher("index.jsp").forward(request, response);
//                return;
//            }

            // Kiểm tra tài khoản và mật khẩu
            if (accountDAO.validate(username, password)) {
                // Nếu đăng nhập thành công
                HttpSession session = request.getSession();
                String fullname = accountDAO.getFullname(username);
                session.setAttribute("username", username); // Lưu username vào session

                // Lưu cookie với username
                String encodedUsername = URLEncoder.encode(username, StandardCharsets.UTF_8.toString());
                Cookie userCookie = new Cookie("txtUS", encodedUsername);
                userCookie.setMaxAge(3 * 24 * 60 * 60); // Cookie tồn tại trong 3 ngày
                response.addCookie(userCookie);

                // Điều hướng đến trang khác tùy theo role
                if ("admin".equals(username)) {
                    request.getRequestDispatcher("ListLoginAdmin.jsp").forward(request, response);
                } else {
                    response.sendRedirect("listLoginUser.jsp");
                }

            } else {
                // Nếu username hoặc password không đúng
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        }catch (UnsupportedEncodingException e) {
            // Xử lý lỗi liên quan đến việc mã hóa username
            e.printStackTrace(); // In ra thông báo lỗi vào console/log
            request.setAttribute("error", "An error occurred while processing your request.");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
        // Xử lý lỗi liên quan đến cơ sở dữ liệu
        // In ra thông báo lỗi vào console/log
         catch (Exception e) {
            // Bắt tất cả các loại ngoại lệ khác
            e.printStackTrace(); // In ra thông báo lỗi vào console/log
            request.setAttribute("error", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
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
