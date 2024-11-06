<%-- 
    Document   : forgetPassword
    Created on : Nov 6, 2024, 12:41:53 PM
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
        <h2>Forgot Password Page</h2>
        <p>Enter your email address to reset your password!</p>
        <form action="SendRandomCodeServlet" method="post" class="needs-validation" novalidate>
             <div class="form-group">
                <label for="text">Username:</label>
                <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username" required>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
            <div class="form-group">
                <label for="email">Your Email:</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
                <div class="invalid-feedback">Please enter a valid email address!</div>
            </div>
           
            <button type="submit" class="btn btn-primary">Send request</button>
            
            <a href="Login.jsp" class="btn btn-secondary ml-2">Back to Login</a> 
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
