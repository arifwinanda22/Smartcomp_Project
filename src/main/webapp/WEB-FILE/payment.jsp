<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.classes.Payment" %>
<%
    List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");
    String errorMessage = request.getParameter("error");
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, HH:mm");
    DecimalFormat df = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Status Pembayaran</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .payment-card { background: white; border-radius: 14px; padding: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.04); border: none; }
        .badge-status { padding: .4rem .85rem; border-radius: 30px; font-weight: 500; font-size: 0.8rem; }
        .badge-status.settlement { background: #e6f4ea; color: #137333; }
        .badge-status.pending { background: #fef7e0; color: #b06000; }
        .badge-status.expire, .badge-status.cancel { background: #fce8e6; color: #c5221f; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top py-3">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="34" height="34" onerror="this.src='https://placehold.co/34x34?text=SC'">
                <span class="fw-bold">SmartComp Pay</span>
            </a>
            <div class="ms-auto">
                <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline-secondary btn-sm rounded-pill">
                    <i class="bi bi-house me-1"></i> Dashboard
                </a>
            </div>
        </div>
    </nav>

    <main class="container py-5 flex-grow-1">
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                <i class="bi bi-exclamation-octagon-fill me-2"></i>
                <strong>Kendala Midtrans:</strong> <%=errorMessage%>
                <div class="small mt-1 text-muted">Pastikan Server Key di file <code>MidtransService.java</code> sudah menggunakan key asli dari dashboard Sandbox.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold mb-1">Status &amp; Riwayat Pendaftaran</h3>
                <p class="text-muted small mb-0">Daftar transaksi pendaftaran kegiatan Anda di SmartComp.</p>
            </div>
        </div>

        <div class="payment-card">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Nama Agenda</th>
                            <th>Kategori</th>
                            <th>Biaya (IDR)</th>
                            <th>Waktu Pendaftaran</th>
                            <th>Status Pembayaran</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% if (paymentList != null && !paymentList.isEmpty()) {
                           for (Payment pay : paymentList) {
                               String status = pay.getTransactionStatus();
                    %>
                        <tr>
                            <td class="font-monospace small fw-bold"><%=pay.getOrderId()%></td>
                            <td class="fw-semibold"><%=pay.getEventName()%></td>
                            <td><span class="badge bg-secondary-subtle text-secondary-emphasis rounded-pill"><%=pay.getEventType()%></span></td>
                            <td class="fw-bold text-primary">Rp <%=df.format(pay.getGrossAmount())%></td>
                            <td class="text-muted small"><%=pay.getCreatedAt() != null ? sdf.format(pay.getCreatedAt()) : "-"%></td>
                            <td>
                                <span class="badge-status <%=status != null ? status.toLowerCase() : "pending"%>">
                                    <i class="bi <%= "settlement".equalsIgnoreCase(status) ? "bi-check-circle-fill" : "bi-hourglass-split" %> me-1"></i>
                                    <%=status != null ? status.toUpperCase() : "PENDING"%>
                                </span>
                            </td>
                        </tr>
                    <%     }
                       } else { %>
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                <i class="bi bi-receipt fs-1 d-block mb-2 text-secondary"></i>
                                Belum ada riwayat transaksi pendaftaran.
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer class="mt-auto py-3 bg-white border-top text-center text-muted small">
        Copyright &copy; 2026 SmartComp. Midtrans Payment Gateway Integration.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>