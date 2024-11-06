<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Information</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${requestScope.error != null}">
            <div class="alert alert-danger text-center" role="alert">
                <h4 class="alert-heading">Error</h4>
                <p>${requestScope.error}</p>
            </div>
        </c:if>

        <div class="container mt-4">
            <!-- Lời chào người dùng và liên kết đăng xuất -->
            <div class="text-end">
                <span>Hello, ${sessionScope.username}</span>
                <a href="index.jsp" class="text-decoration-none">(Sign out)</a>
            </div>

            <!-- Tiêu đề trang và các nút điều hướng -->
            <div class="text-center">
                <h1 class="mb-4">Management Student</h1>
                <a href="ListLoginAdmin.jsp" class="btn btn-secondary mb-3">Back</a>
                <a href="admininfo" class="btn btn-danger mb-3">List</a>
            
            </div>

            <form action="adminSearchbyname" method="get" class="mb-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search by username" name="username" >
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </form>


            <!-- Bảng thông tin Loan -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Username</th>
                        <th>Book ID</th>
                        <th>Loan Date</th>
                        <th>Return Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Lặp qua danh sách Loan -->
                    <c:forEach items="${list}" var="p">
                        <tr>
                            <td>${p.loanId}</td>
                            <td>${p.username}</td>
                            <td>${p.bookId}</td>
                            <td>${p.loanDate}</td>
                            <td>${p.returnDate}</td>
                            <td>${p.status}</td>  
                            <td>
                                <a href="admindelete?id=${p.loanId}" class="btn btn-danger btn-sm">Delete</a>
                                <c:if test="${p.status != 'returned'}">
                                    <a href="adminedit?id=${p.loanId}" class="btn btn-warning btn-sm">Edit</a>
                                </c:if>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS và các thư viện liên quan -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
