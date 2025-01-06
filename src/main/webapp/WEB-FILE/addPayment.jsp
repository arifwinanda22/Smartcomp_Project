<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2>Payment for Workshop</h2>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Payment Information</h5>

            <!-- Menampilkan informasi workshop yang dipilih -->
            <p><strong>Event Name:</strong> ${param.eventName}</p>
            <p><strong>Event Type:</strong> ${param.eventType}</p>
            <p><strong>Amount:</strong> $${param.amount}</p>

            <!-- Form untuk memasukkan data pembayaran -->
            <form action="payment" method="post">
                <input type="hidden" name="action" value="addPayment">
                <input type="hidden" name="eventName" value="${param.eventName}">
                <input type="hidden" name="eventType" value="${param.eventType}">
                <input type="hidden" name="amount" value="${param.amount}">
                <input type="hidden" name="status" value="Pending">

                <!-- Input untuk nama user -->
                <label for="user">Your Name:</label>
                <input type="text" class="form-control" id="user" name="user" required>

                <button type="submit" class="btn btn-primary mt-3">Submit Payment</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
