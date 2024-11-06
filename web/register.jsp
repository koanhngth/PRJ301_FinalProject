<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>
        <!-- Nhúng Bootstrap và Font Awesome -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="text-center mb-3">
                <h1>Create Account</h1>
            </div>

            <form action="addAccount" method="POST">
                <!-- Username input -->
                <div class="form-group mb-4">
                    <label for="registerUsername">Username</label>
                    <input type="text" id="registerUsername" name="registerUsername" class="form-control" placeholder="Enter your username" required>
                </div>

                <!-- Email input -->
                <div class="form-group mb-4">
                    <label for="registerEmail">Email</label>
                    <input type="email" id="registerEmail" name="registerEmail" class="form-control" placeholder="Enter your email" required>
                </div>

                <!-- Password input -->
                <div class="form-group mb-4">
                    <label for="registerPassword">Password</label>
                    <input type="password" id="registerPassword" name="registerPassword" class="form-control" placeholder="Enter your password" required>
                </div>

                <!-- Repeat Password input -->
                <div class="form-group mb-4">
                    <label for="registerRepeatPassword">Repeat password</label>
                    <input type="password" id="registerRepeatPassword" class="form-control" placeholder="Repeat your password" required>
                </div>

                <!-- Checkbox -->
                <div class="form-check mb-4">
                    <input class="form-check-input" type="checkbox" value="" id="registerCheck" checked required>
                    <label class="form-check-label" for="registerCheck">
                        I have read and agree to the terms
                    </label>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-3">Register</button>
            </form>
        </div>

        <!-- Bootstrap và jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
