<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.classes.Competition" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    Competition c = (Competition) request.getAttribute("competition");
    if (c == null) {
        response.sendRedirect(request.getContextPath() + "/competition");
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
    <title><%=c.getName()%> - SmartComp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .hero-banner { height: 320px; object-fit: cover; width: 100%; border-radius: 12px; }
        .detail-card { background: white; border-radius: 12px; padding: 2rem; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
    </style>
</head>
<body>

    <div class="container py-5">
        <a href="javascript:history.back()" class="btn btn-outline-secondary mb-4">
            <i class="bi bi-arrow-left me-1"></i> Kembali
        </a>

        <div class="row g-4">
            <div class="col-lg-8">
                <div class="detail-card mb-4">
                    <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&q=80" class="hero-banner mb-4" alt="Competition Banner">
                    <span class="badge bg-primary mb-2"><%=c.getType()%></span>
                    <h1 class="fw-bold mb-3"><%=c.getName()%></h1>

                    <h5 class="fw-bold mt-4 mb-2">Deskripsi Kompetisi</h5>
                    <p class="text-secondary" style="white-space: pre-line;">
                        <%= (c.getDescription() != null && !c.getDescription().isEmpty()) ? c.getDescription() : "Belum ada deskripsi yang ditambahkan oleh panitia." %>
                    </p>

                    <h5 class="fw-bold mt-4 mb-2">Ketentuan & Syarat Peserta</h5>
                    <p class="text-secondary" style="white-space: pre-line;">
                        <%= (c.getCriteria() != null && !c.getCriteria().isEmpty()) ? c.getCriteria() : "Terbuka untuk pelajar dan mahasiswa umum." %>
                    </p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="detail-card sticky-top" style="top: 2rem;">
                    <h5 class="fw-bold mb-3">Informasi Pendaftaran</h5>
                    
                    <ul class="list-unstyled mb-4">
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-calendar-event me-2"></i>Pendaftaran Buka</span>
                            <span class="fw-semibold"><%= c.getStartDate() != null ? sdf.format(c.getStartDate()) : "-" %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-calendar-check me-2"></i>Batas Akhir</span>
                            <span class="fw-semibold"><%= c.getEndDate() != null ? sdf.format(c.getEndDate()) : "-" %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-tag me-2"></i>Biaya Pendaftaran</span>
                            <span class="fw-bold text-primary fs-5">
                                <%= c.getEntryFee() == 0 ? "Gratis" : "Rp " + df.format(c.getEntryFee()) %>
                            </span>
                        </li>
                    </ul>

                    <!-- Arahkan Langsung ke Sistem Pembayaran -->
                    <form action="<%=request.getContextPath()%>/WEB-FILE/addPayment.jsp" method="POST">
                        <input type="hidden" name="action" value="initPayment">
                        <input type="hidden" name="competitionId" value="<%=c.getId()%>">
                        <input type="hidden" name="eventName" value="<%=c.getName()%>">
                        <input type="hidden" name="eventType" value="<%=c.getType()%>">
                        <input type="hidden" name="price" value="<%=c.getEntryFee()%>">
                        
                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-ticket-perforated me-2"></i> Daftar Kompetisi
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>