<%-- 
    Document   : editBook
    Created on : Nov 6, 2024, 7:58:19 PM
    Author     : Tran Phong Hai - CE180803
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Book</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1>Edit Book</h1>
            <form action="editBook" method="POST" class="needs-validation" novalidate>

                <!-- Hiển thị thông báo lỗi nếu có -->
                <c:if test="${not empty requestScope.error}">
                    <div class="alert alert-danger">
                        ${requestScope.error}
                    </div>
                </c:if>

                <!-- Product ID (readonly) -->
                <div class="mb-3">
                    <label for="book_id" class="form-label">Book ID</label>
                    <input type="text" class="form-control" id="book_id" name="book_id" value="${requestScope.book.book_id}" readonly />
                </div>

                <!-- Title -->
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="${requestScope.book.title}" required />
                </div>

                <!-- Author -->
                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="author" value="${requestScope.book.author}" required />
                </div>

                <!-- Year Published -->
                <div class="mb-3">
                    <label for="year_published" class="form-label">Year Published</label>
                    <input type="number" class="form-control" id="year_published" name="year_published" value="${requestScope.book.year_published}" required />
                </div>

                <!-- Quantity Available -->
                <div class="mb-3">
                    <label for="quantity_available" class="form-label">Quantity Available</label>
                    <input type="number" class="form-control" id="quantity_available" name="quantity_available" value="${requestScope.book.quantity_available}" required />
                </div>

                <!-- Total Quantity -->
                <div class="mb-3">
                    <label for="total_quantity" class="form-label">Total Quantity</label>
                    <input type="number" class="form-control" id="total_quantity" name="total_quantity" value="${requestScope.book.total_quantity}" required />
                </div>

                <!-- Image URL -->
                <div class="mb-3">
                    <label for="image_url" class="form-label">Image URL</label>
                    <input type="text" class="form-control" id="image_url" name="image_url" value="${requestScope.book.image_url}" required />
                </div>

                <div class="d-flex justify-content-start">
                    <button type="submit" class="btn btn-primary me-2">Save</button>
                    <a href="listBook" class="btn btn-secondary">Back to List</a>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
