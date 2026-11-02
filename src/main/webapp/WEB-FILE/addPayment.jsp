<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%
    // Ambil parameter dari WorkshopDetail.jsp atau CompetitionDetail.jsp
    String eventName = request.getParameter("eventName");
    String eventType = request.getParameter("eventType"); // Academic / Non-Academic
    String priceStr = request.getParameter("price");
    if (priceStr == null || priceStr.isEmpty()) {
        priceStr = request.getParameter("amount");
    }

    String workshopId = request.getParameter("workshopId");
    String competitionId = request.getParameter("competitionId");
    String eventId = (workshopId != null && !workshopId.isEmpty()) ? workshopId : competitionId;
    if (eventId == null) eventId = request.getParameter("eventId");

    // Tentukan kategori program (Workshop atau Competition)
    String eventCategory = "Workshop";
    if (competitionId != null && !competitionId.isEmpty()) {
        eventCategory = "Competition";
    }

    // Konversi harga untuk tampilan
    double price = 0;
    try {
        if (priceStr != null && !priceStr.isEmpty()) {
            price = Double.parseDouble(priceStr);
        }
    } catch (Exception ignored) {}

    DecimalFormat df = new DecimalFormat("#,###");
    String priceFormatted = (price == 0) ? "Gratis" : "Rp " + df.format(price);
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Konfirmasi Pembayaran - SmartComp</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar-brand { font-weight: 700; color: #1e1e2f; }
        .payment-box {
            background: white;
            border-radius: 16px;
            padding: 2.5rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            border: 1px solid #e9ecef;
            max-width: 650px;
            margin: 0 auto;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px dashed #e9ecef;
            font-size: 0.95rem;
        }
        .info-row:last-child { border-bottom: none; }
        .price-highlight {
            font-size: 1.4rem;
            font-weight: 700;
            color: #1a73e8;
        }
        .btn-pay-now {
            background-color: #1a73e8;
            border-color: #1a73e8;
            color: white;
            font-weight: 600;
            padding: 0.75rem;
            border-radius: 8px;
            transition: all 0.2s ease;
        }
        .btn-pay-now:hover {
            background-color: #1557b0;
            border-color: #1557b0;
            color: white;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Navbar Sederhana -->
    <nav class="navbar navbar-expand-lg bg-white border-bottom py-3">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="34" height="34" onerror="this.src='https://placehold.co/34x34?text=SC'">
                <span>SmartComp Pay</span>
            </a>
            <div class="ms-auto">
                <a href="javascript:history.back()" class="btn btn-outline-secondary btn-sm rounded-pill">
                    <i class="bi bi-arrow-left me-1"></i> Kembali
                </a>
            </div>
        </div>
    </nav>

    <!-- Konten Utama -->
    <main class="container py-5 flex-grow-1">
        <div class="payment-box">
            <div class="d-flex align-items-center gap-3 mb-4">
                <div class="rounded-circle bg-primary-subtle text-primary p-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                    <i class="bi bi-credit-card fs-4"></i>
                </div>
                <div>
                    <h4 class="fw-bold mb-0">Pembayaran <%=eventCategory%></h4>
                    <span class="text-muted small">Selesaikan pendaftaran untuk mengamankan tiket Anda</span>
                </div>
            </div>

            <!-- Rincian Acara -->
            <div class="p-3 bg-light rounded-3 mb-4 border">
                <div class="info-row">
                    <span class="text-muted">Nama Kegiatan:</span>
                    <span class="fw-semibold text-end text-dark"><%= (eventName != null) ? eventName : "Kegiatan SmartComp" %></span>
                </div>
                <div class="info-row">
                    <span class="text-muted">Kategori Program:</span>
                    <span class="badge bg-secondary-subtle text-secondary-emphasis rounded-pill px-3 py-1"><%= (eventType != null) ? eventType : "Academic" %></span>
                </div>
                <div class="info-row align-items-center pt-3">
                    <span class="fw-bold text-dark">Total Biaya Pendaftaran:</span>
                    <span class="price-highlight"><%= priceFormatted %></span>
                </div>
            </div>

            <!-- Form Checkout ke Servlet /payment -->
            <form action="<%=request.getContextPath()%>/payment" method="POST">
                <input type="hidden" name="action" value="checkout">
                <input type="hidden" name="eventType" value="<%=eventCategory%>">
                <input type="hidden" name="eventId" value="<%= (eventId != null) ? eventId : "1" %>">
                <input type="hidden" name="eventName" value="<%= (eventName != null) ? eventName : "Workshop / Competition" %>">
                <input type="hidden" name="price" value="<%=price%>">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Nama Lengkap Peserta</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="bi bi-person text-muted"></i></span>
                        <input type="text" class="form-control" name="userName" placeholder="Masukkan nama lengkap Anda..." required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold">Alamat Email</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="bi bi-envelope text-muted"></i></span>
                        <input type="email" class="form-control" name="email" placeholder="contoh: peserta@email.com" required>
                    </div>
                    <div class="form-text">Bukti pendaftaran dan instruksi akses kegiatan akan dikirimkan ke email ini.</div>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-pay-now">
                        <i class="bi bi-lock-fill me-2"></i> lanjut ke pembayaran
                    </button>
                    <a href="javascript:history.back()" class="btn btn-light text-muted btn-sm">Batal</a>
                </div>
            </form>
        </div>
    </main>

    <footer class="mt-auto py-3 bg-white border-top text-center text-muted small">
        Copyright &copy; 2026 SmartComp. Transaksi aman melalui Midtrans Sandbox Payment Gateway.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>