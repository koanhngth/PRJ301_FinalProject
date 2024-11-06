<%-- 
    Document   : addBook
    Created on : Nov 6, 2024, 7:06:30 PM
    Author     : Tran Phong Hai - CE180803
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Book</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container mt-4">
            <c:if test="${requestScope.error != null}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.error}
                </div>
            </c:if>

            <div class="text-end mb-3">
                <span> Hello, ${sessionScope.username}</span> 
                <a href="index.jsp" class="text-decoration-none">(Sign out)</a>
            </div>

            <h2 class="text-center mb-4">Create New Book</h2>

            <form action="addBook" method="POST" class="needs-validation" novalidate>
                <!-- Book ID -->
                <div class="mb-3">
                    <label for="book_id" class="form-label">Book ID</label>
                    <input type="text" class="form-control" id="book_id" name="book_id" required />
                    <div class="invalid-feedback">Please enter a valid Book ID.</div>
                </div>

                <!-- Book Title -->
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required />
                    <div class="invalid-feedback">Please enter the book title.</div>
                </div>

                <!-- Author -->
                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="author" required />
                    <div class="invalid-feedback">Please enter the author's name.</div>
                </div>

                <!-- Year Published -->
                <div class="mb-3">
                    <label for="year_published" class="form-label">Year Published</label>
                    <input type="number" class="form-control" id="year_published" name="year_published" required min="1000" max="9999" />
                    <div class="invalid-feedback">Please enter a valid year of publication.</div>
                </div>

                <!-- Quantity Available -->
                <div class="mb-3">
                    <label for="quantity_available" class="form-label">Quantity Available</label>
                    <input type="number" class="form-control" id="quantity_available" name="quantity_available" required min="0" />
                    <div class="invalid-feedback">Please enter the quantity available.</div>
                </div>

                <!-- Total Quantity -->
                <div class="mb-3">
                    <label for="total_quantity" class="form-label">Total Quantity</label>
                    <input type="number" class="form-control" id="total_quantity" name="total_quantity" required min="0" />
                    <div class="invalid-feedback">Please enter the total quantity of the book.</div>
                </div>

                <!-- Image URL -->
                <div class="mb-3">
                    <label for="image_url" class="form-label">Image URL</label>
                    <input type="url" class="form-control" id="image_url" name="image_url" required />
                    <div class="invalid-feedback">Please enter a valid image URL.</div>
                </div>

                <!-- Submit and Back Buttons -->
                <div class="d-flex justify-content-start">
                    <button type="submit" class="btn btn-primary me-2">Save</button>
                    <a href="/listBook" class="btn btn-secondary">Back to List</a>
                </div>
            </form>
        </div>

        <script>
            // Client-side form validation
            (function () {
                'use strict';
                var forms = document.querySelectorAll('.needs-validation');
                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
            })();
        </script>
    </body>
</html>
