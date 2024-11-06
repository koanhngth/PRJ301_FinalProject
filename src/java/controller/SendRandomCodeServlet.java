package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.AccountDAO;

@WebServlet("/SendRandomCodeServlet")
public class SendRandomCodeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the email address & username from the form
        String toEmail = request.getParameter("email");
        String user = request.getParameter("username");

        AccountDAO a = new AccountDAO();
        if (!a.getEmail(toEmail, user)) {
            request.setAttribute("error", "Invalid username or email");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            // Sender's email credentials
            final String fromEmail = "Oanhntkce181400@fpt.edu.vn";
            final String password = "ihlx uonr qjdy qboa";

            // Generate a random 6-digit OTP
            Random random = new Random();
            int otp = 100000 + random.nextInt(900000); // Generates a 6-digit number
            HttpSession userSession = request.getSession();
            userSession.setAttribute("otp", otp);
            userSession.setAttribute("user", user);
//            request.setAttribute("otp", otp);
//            request.setAttribute("user", user);

            // Set properties for email
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            // Create a mail session
            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            try {
                // Create a MimeMessage
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                message.setSubject("Your OTP Code");
                message.setText("Dear user,\n\nYour OTP code is: " + otp + "\n\nRegards,\nSupport Team");

                // Send the message
                Transport.send(message);

//                session.setAttribute("username", user); // Lưu username vào session
                request.setAttribute("user", user);
                // Confirm successful sending
                request.getRequestDispatcher("newPassword.jsp").forward(request, response);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }

    }
}
