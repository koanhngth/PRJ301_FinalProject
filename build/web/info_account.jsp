<%-- 
    Document   : info_account
    Created on : Nov 4, 2024, 10:39:28 AM
    Author     : DELL-Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Information of Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container body-content">
            <h2>Details</h2>
            <div class="form-horizontal">
                <hr />
                <p>
                    <!-- Nút "Back" với biểu tượng mũi tên ra cửa -->
                    <a href="index.jsp" class="btn btn-primary">
                        <i class="fas fa-door-open"></i> Back
                    </a>
                </p>

                <form action="InfoAcc" method="post">
                    <!-- Các trường thông tin của tài khoản -->
                    <div class="form-group">
                        <label class="control-label col-md-2">Name</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.name}" name="name" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Password</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" value="${account.password}" name="password" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Email</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.email}" name="email" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Role</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.role}" name="role" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Create Time</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.createAt}" name="creatTime" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Update Time</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${account.updateAt}" name="updateTime" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <a href="add_user.jsp" class="btn btn-info" style="margin-right: 5px;">New Account</a>
                            <a href="editUser" class="btn btn-success" style="margin-right: 5px;">Edit Account</a>
                            <a href="#" class="btn btn-danger" style="margin-right: 5px;" onclick="confirmDelete()">Delete Account</a>

                            <script type="text/javascript">
                                function confirmDelete() {
                                    event.preventDefault();
                                    if (confirm("Are you sure you want to delete this account?")) {
                                        window.location.href = "deleteUser";
                                    }
                                }

                                function confirmLogout() {
                                    event.preventDefault();
                                    if (confirm("Are you sure you want to log out?")) {
                                        window.location.href = "index.jsp";
                                    }
                                }
                            </script>
                            <!-- Nút Log out đã chỉnh sửa -->
                            <a href="#" class="btn btn-default" style="background-color: #f8f9fa; color: #d9534f; margin-right: 5px;" onclick="confirmLogout()">
                                <i class='fas fa-power-off'></i> Log out
                            </a>
                        </div>
                    </div>

                </form>

                <!-- Thông báo thành công -->
                <%
                    if (request.getAttribute("Success") != null) {
                        String successMessage = (String) request.getAttribute("Success");
                %>
                <h3 style="color: green; text-align: center; margin-top: 15px;">
                    <%= successMessage %>
                </h3>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
