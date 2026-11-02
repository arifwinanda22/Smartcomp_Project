<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.classes.Workshop" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    Workshop w = (Workshop) request.getAttribute("workshop");
    if (w == null) {
        response.sendRedirect(request.getContextPath() + "/WEB-FILE/WorkshopAcademic.jsp");
        return;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
    DecimalFormat df = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=w.getName()%> - SmartComp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .hero-banner {
            height: 320px;
            object-fit: cover;
            width: 100%;
            border-radius: 12px;
        }
        .detail-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

    <div class="container py-5">
        <a href="javascript:history.back()" class="btn btn-outline-secondary mb-4">
            <i class="bi bi-arrow-left me-1"></i> Kembali
        </a>

        <div class="row g-4">
            <!-- Kolom Konten Utama -->
            <div class="col-lg-8">
                <div class="detail-card mb-4">
                    <img src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=1200&q=80" class="hero-banner mb-4" alt="Banner">
                    <span class="badge bg-primary mb-2"><%=w.getType()%></span>
                    <h1 class="fw-bold mb-3"><%=w.getName()%></h1>

                    <h5 class="fw-bold mt-4 mb-2">Deskripsi Workshop</h5>
                    <p class="text-secondary" style="white-space: pre-line;">
                        <%= (w.getDescription() != null && !w.getDescription().isEmpty()) ? w.getDescription() : "Belum ada deskripsi yang ditambahkan oleh admin." %>
                    </p>

                    <h5 class="fw-bold mt-4 mb-2">Kriteria & Persyaratan Peserta</h5>
                    <p class="text-secondary" style="white-space: pre-line;">
                        <%= (w.getCriteria() != null && !w.getCriteria().isEmpty()) ? w.getCriteria() : "Terbuka untuk semua kalangan." %>
                    </p>
                </div>
            </div>

            <!-- Kolom Ringkasan & Form Pembayaran -->
            <div class="col-lg-4">
                <div class="detail-card sticky-top" style="top: 2rem;">
                    <h5 class="fw-bold mb-3">Informasi Pendaftaran</h5>
                    
                    <ul class="list-unstyled mb-4">
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-calendar-event me-2"></i>Tanggal</span>
                            <span class="fw-semibold"><%= w.getDate() != null ? sdf.format(w.getDate()) : "-" %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-people me-2"></i>Sisa Kuota</span>
                            <span class="fw-semibold"><%= w.getCapacity() %> Kursi</span>
                        </li>
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-tag me-2"></i>Biaya</span>
                            <span class="fw-bold text-primary fs-5">
                                <%= w.getPrice() == 0 ? "Gratis" : "Rp " + df.format(w.getPrice()) %>
                            </span>
                        </li>
                    </ul>

                    <!-- Form Integrasi ke Sistem Pembayaran -->
                    <form action="<%=request.getContextPath()%>/WEB-FILE/addPayment.jsp" method="POST">
                        <input type="hidden" name="action" value="initPayment">
                        <input type="hidden" name="workshopId" value="<%=w.getId()%>">
                        <input type="hidden" name="eventName" value="<%=w.getName()%>">
                        <input type="hidden" name="eventType" value="<%=w.getType()%>">
                        <input type="hidden" name="price" value="<%=w.getPrice()%>">
                        
                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-credit-card me-2"></i> Daftar & Lanjut Pembayaran
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>