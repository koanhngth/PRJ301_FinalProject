<%-- 
    Document   : newPassword
    Created on : Nov 6, 2024, 6:22:07 PM
    Author     : Oanh Nguyen
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>New Password Page</h2>
        <p>Enter your OTP and new password!</p>
       
        <form action="checkOTP"  method="post" class="needs-validation" novalidate>
            <input type="hidden" name="otp" value="${sessionScope.otp}">
             <div class="form-group">
                <label for="text">OTP:</label>
                <input type="int" name="OTP" class="form-control" id="OTP" placeholder="Enter OTP" required>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
             <div class="form-group">
                <label for="string">Username:</label>
                <input type="string" name="user" class="form-control" id="user" value="<%= request.getAttribute("user") %>" readonly>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
            <div class="form-group">
                <label for="string">New Password:</label>
                <input type="password" name="newPass" class="form-control" id="newPass" placeholder="Enter new password" required>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
            <div class="form-group">
                <label for="string">Confirm New Password:</label>
                <input type="password" name="cNewPass" class="form-control" id="cNewPass" placeholder="Confirm your password" required>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
           
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="login.jsp" class="btn btn-secondary ml-2">Back to Login</a> 
        </form>
            
    </div>
    
    <script>
        // Form validation script (unchanged)
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>
