<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workshop Detail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2>Workshop Detail</h2>
    <div class="card">
        <img src="https://i.pinimg.com/564x/cb/c7/6a/cbc76a054c9599cc13d5d69910029a15.jpg" class="card-img-top" alt="workshop-image">
        <div class="card-body">
            <h5 class="card-title">The Complete Web Development Academy</h5>
            <p class="card-text">Learn full-stack web development with this comprehensive course. Includes hands-on projects and interactive lessons.</p>
            <p><strong>Price:</strong> $99.99</p>
            <p><strong>Type:</strong> Workshop</p>
            <p><strong>Event Name:</strong> Web Development</p>

            <!-- Tombol untuk melanjutkan pembayaran -->
            <form action="addPayment.jsp" method="get">
                <input type="hidden" name="eventName" value="The Complete Web Development Academy">
                <input type="hidden" name="eventType" value="Workshop">
                <input type="hidden" name="amount" value="99.99">
                <button type="submit" class="btn btn-primary">Pay Now</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
