<%-- 
    Document   : edit_user
    Created on : Nov 4, 2024, 11:11:32 AM
    Author     : DELL-Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Web Application Development</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>


        <div class="container body-content">
            <h2>Edit Account</h2>
            <div class="form-horizontal">
                <hr />
                <form action="editUser" method="post"> <!-- Thêm thẻ <form> -->

                    <div class="form-group">
                        <div class="control-label col-md-2">Name</div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.name}" name="name"required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-md-2">Email</div>
                        <div class="col-md-10">
                            <input type="email" class="form-control" value="${account.email}" name="email"required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-md-2">Old password</div>
                        <div class="col-md-10">
                            <input type="password" class="form-control" value="" placeholder="Enter old password" name="oldPassword"required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-md-2">New Password</div>
                        <div class="col-md-10">
                            <input type="password" class="form-control" value="" placeholder="Enter new password" name="newPassword"required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <a href="infoUser" class="btn btn-primary">Back</a>
                            <input type="submit" value="Save" class="btn btn-danger" name="btnSave" /> 

                        </div>
                    </div>
                </form>
            </div>
            <%
            if(request.getAttribute("Error")!=null){
            String err=(String) request.getAttribute("Error");
            %>
            <h3 style="color: red"> <%=err%></h3>
            <%
        }
            %>
        </div>
    </body>
</html>
