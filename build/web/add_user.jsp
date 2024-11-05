<%-- 
    Document   : add_user
    Created on : Nov 4, 2024, 9:35:09 AM
    Author     : DELL-Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container body-content">
            <h2>ADD NEW ACCOUNT</h2>
            <div class="form-horizontal">
                <h5>New</h5>
                <hr />
                <a href="infoUser" class="btn btn-primary">
                    <i class="fas fa-door-open"></i> Back
                </a>
                <form action="addUser" method="POST">

                    <div class="form-group">
                        <label class="control-label col-md-2">Name</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="" name="name"required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Password</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" value="" name="password"required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Email</label>
                        <div class="col-md-10">
                            <input type="email" class="form-control" value="" name="email" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <input type="submit" value="Create" class="btn btn-warning" />
                            <input type="reset"  value="Reset" class="btn btn-info" />

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>


