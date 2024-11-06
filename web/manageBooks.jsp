<%-- 
    Document   : listBook
    Created on : Nov 6, 2024, 5:58:14 PM
    Author     : Tran Phong Hai - CE180803
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - List Books</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Show error message -->
        <c:if test="${requestScope.error != null}">
            <h2 style="color: red;">${requestScope.error}</h2>
        </c:if>

        <div class="container mt-4">
            <!-- User Greeting and Sign Out Link -->
            <div class="text-end">
                <span>Hello, ${sessionScope.username}</span>
                <a href="index.jsp" class="text-decoration-none">(Sign out)</a>
            </div>

            <!-- Page Title and Buttons -->
            <div class="text-center">
                <h1>List of Books</h1>
                <a href="addBook" class="btn btn-primary mb-3">Add New Book</a>
                <a href="ListLoginAdmin.jsp" class="btn btn-secondary mb-3">Back</a>
            </div>

            <!-- Books Table -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Year Published</th>
                        <th>Quantity Available</th>
                        <th>Total Quantity</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Iterate through the list of books -->
                    <c:forEach items="${list}" var="p">
                        <tr>
                            <td>${p.book_id}</td>
                            <td>${p.title}</td>
                            <td>${p.author}</td>
                            <td>${p.year_published}</td>
                            <td>${p.quantity_available}</td>
                            <td>${p.total_quantity}</td>

                            <td>
                                <!-- Display Image if available -->
                                <c:if test="${not empty p.image_url}">
                                    <img src="${p.image_url}" alt="${p.title}" style="width: 100px; height: auto;">
                                </c:if>
                                <c:if test="${empty p.image_url}">
                                    <span>No Image</span>
                                </c:if>
                            </td>
                            <td>
                                <a href="editBook?id=${p.book_id}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="deleteBook?id=${p.book_id}" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
