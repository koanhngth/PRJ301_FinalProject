<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Loan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-4">
        <h2>Edit Loan Information</h2>

        <!-- Display success or error message -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>

        <form action="adminedit" method="post">
            <input type="hidden" name="id" value="${loan.loanId}">
            
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="${loan.username}" disabled>
            </div>
            
            <div class="mb-3">
                <label for="bookId" class="form-label">Book ID</label>
                <input type="text" class="form-control" id="bookId" name="bookId" value="${loan.bookId}" disabled>
            </div>

            <div class="mb-3">
                <label for="loanDate" class="form-label">Loan Date</label>
                <input type="text" class="form-control" id="loanDate" name="loanDate" value="${loan.loanDate}" disabled>
            </div>

            <div class="mb-3">
                <label for="returnDate" class="form-label">Return Date</label>
                <input type="date" class="form-control" id="returnDate" name="returnDate" value="${loan.returnDate != null ? loan.returnDate : ''}">
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-control" id="status" name="status">
                    <option value="borrowed" ${loan.status == 'pending' ? 'selected' : ''}>Borrowed</option>
                    <option value="returned" ${loan.status == 'returned' ? 'selected' : ''}>Returned</option>
                    
                </select>
            </div>

            <button type="submit" class="btn btn-primary" name="action" value="update">Update Loan</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
