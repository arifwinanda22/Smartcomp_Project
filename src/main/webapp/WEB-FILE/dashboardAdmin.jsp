<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.classes.Competition" %>
<%@ page import="com.example.classes.Workshop" %>
<%@ page import="com.example.classes.ForumPost" %>
<%@ page import="com.example.classes.Payment" %>
<%!
    private static String esc(Object o) {
        if (o == null) return "";
        return String.valueOf(o).replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
%>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");
    DecimalFormat priceFormat = new DecimalFormat("#,###");

    List<Competition> competitions = (List<Competition>) request.getAttribute("competitions");
    List<Workshop> workshops = (List<Workshop>) request.getAttribute("workshops");
    List<ForumPost> forumPosts = (List<ForumPost>) request.getAttribute("forumPosts");
    List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");

    int totalComp = (competitions != null) ? competitions.size() : 0;
    int activeComp = 0;
    if (competitions != null) {
        for (Competition c : competitions) {
            if ("active".equalsIgnoreCase(c.getStatus())) activeComp++;
        }
    }

    int totalWs = (workshops != null) ? workshops.size() : 0;
    int activeWs = 0;
    if (workshops != null) {
        for (Workshop wItem : workshops) {
            if ("active".equalsIgnoreCase(wItem.getStatus())) activeWs++;
        }
    }

    String activeTab = (String) request.getAttribute("activeTab");
    if (activeTab == null) activeTab = request.getParameter("tab");
    if (activeTab == null) activeTab = "competition";

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - SmartComp</title>
    <!-- Bootstrap 5 & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom Admin CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboardAdmin.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" onerror="this.src='https://placehold.co/36x36?text=SC'">
                SmartComp Admin
            </a>
            <div class="ms-auto">
                <a href="<%=request.getContextPath()%>/logout" class="btn btn-outline-secondary btn-sm">
                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">

        <% if (successMessage != null && !successMessage.isEmpty()) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i><%=esc(successMessage)%>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i><%=esc(errorMessage)%>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <div class="page-header mb-4">
            <h1>Dashboard Admin</h1>
            <p>Kelola lomba, workshop, forum capaian belajar, dan transaksi peserta.</p>
        </div>

        <!-- 4 Kotak Statistik -->
        <div class="row g-3 mb-4">
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="stat-icon blue"><i class="bi bi-trophy"></i></div>
                    <div>
                        <div class="stat-value"><%=totalComp%></div>
                        <div class="stat-label">Total Competition</div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="stat-icon green"><i class="bi bi-check2-circle"></i></div>
                    <div>
                        <div class="stat-value"><%=activeComp%></div>
                        <div class="stat-label">Competition Aktif</div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="stat-icon purple"><i class="bi bi-mortarboard"></i></div>
                    <div>
                        <div class="stat-value"><%=totalWs%></div>
                        <div class="stat-label">Total Workshop</div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="stat-icon orange"><i class="bi bi-broadcast"></i></div>
                    <div>
                        <div class="stat-value"><%=activeWs%></div>
                        <div class="stat-label">Workshop Aktif</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Panel Navigasi Tab Manajemen -->
        <div class="management-card">
            <ul class="nav nav-tabs" id="manageTabs">
                <li class="nav-item">
                    <a class="nav-link <%= "competition".equalsIgnoreCase(activeTab) || (!"workshop".equalsIgnoreCase(activeTab) && !"forum".equalsIgnoreCase(activeTab) && !"payment".equalsIgnoreCase(activeTab)) ? "active" : "" %>" 
                       href="<%=request.getContextPath()%>/adminCompetition">
                        <i class="bi bi-trophy me-1"></i> Competition Management
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= "workshop".equalsIgnoreCase(activeTab) ? "active" : "" %>" 
                       href="<%=request.getContextPath()%>/adminWorkshop">
                        <i class="bi bi-mortarboard me-1"></i> Workshop Management
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= "forum".equalsIgnoreCase(activeTab) ? "active" : "" %>" 
                       href="<%=request.getContextPath()%>/adminForum">
                        <i class="bi bi-chat-square-text me-1"></i> Forum &amp; Testimoni
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= "payment".equalsIgnoreCase(activeTab) ? "active" : "" %>" 
                       href="<%=request.getContextPath()%>/adminPayment">
                        <i class="bi bi-credit-card me-1"></i> Payment &amp; Transaksi
                    </a>
                </li>
            </ul>

            <div class="tab-content pt-2">

                <!-- TAB COMPETITION -->
                <% if ("competition".equalsIgnoreCase(activeTab) || (!"workshop".equalsIgnoreCase(activeTab) && !"forum".equalsIgnoreCase(activeTab) && !"payment".equalsIgnoreCase(activeTab))) { %>
                <div class="tab-pane fade show active">
                    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                        <div>
                            <h2 class="h5 fw-bold mb-1">Competition Management</h2>
                            <p class="text-muted small mb-0">Kelola daftar lomba yang tampil di halaman user.</p>
                        </div>
                        <button class="btn btn-manage" data-bs-toggle="modal" data-bs-target="#addCompetitionModal">
                            <i class="bi bi-plus-lg me-1"></i> Add Competition
                        </button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Entry Fee</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if (competitions != null && !competitions.isEmpty()) {
                                   for (Competition c : competitions) {
                                       boolean isActive = "active".equalsIgnoreCase(c.getStatus());
                            %>
                                <tr>
                                    <td><%=c.getId()%></td>
                                    <td class="fw-semibold"><%=esc(c.getName())%></td>
                                    <td><span class="badge-type"><%=esc(c.getType())%></span></td>
                                    <td><%=c.getStartDate() != null ? dateFormat.format(c.getStartDate()) : "-"%></td>
                                    <td><%=c.getEndDate() != null ? dateFormat.format(c.getEndDate()) : "-"%></td>
                                    <td><%=c.getEntryFee() == 0 ? "Free" : "Rp " + priceFormat.format(c.getEntryFee())%></td>
                                    <td>
                                        <span class="badge-status <%= isActive ? "active" : "inactive" %>">
                                            <%= isActive ? "Active" : "Inactive" %>
                                        </span>
                                    </td>
                                    <td class="text-end text-nowrap">
                                        <button type="button" class="btn btn-sm btn-outline-primary" 
                                                onclick="openEditCompetitionModal(this)"
                                                data-id="<%=c.getId()%>"
                                                data-name="<%=esc(c.getName())%>"
                                                data-type="<%=esc(c.getType())%>"
                                                data-start-date="<%=c.getStartDate() != null ? c.getStartDate().toString() : ""%>"
                                                data-end-date="<%=c.getEndDate() != null ? c.getEndDate().toString() : ""%>"
                                                data-entry-fee="<%=(long)c.getEntryFee()%>"
                                                data-status="<%=esc(c.getStatus())%>"
                                                data-description="<%=esc(c.getDescription())%>"
                                                data-criteria="<%=esc(c.getCriteria())%>">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="confirmDelete('competition', <%=c.getId()%>)">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                            <%     }
                               } else { %>
                                <tr>
                                    <td colspan="8" class="text-center py-5 text-muted">Belum ada competition. Klik "Add Competition" untuk menambahkan.</td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } %>

                <!-- TAB WORKSHOP -->
                <% if ("workshop".equalsIgnoreCase(activeTab)) { %>
                <div class="tab-pane fade show active">
                    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                        <div>
                            <h2 class="h5 fw-bold mb-1">Workshop Management</h2>
                            <p class="text-muted small mb-0">Kelola kelas pelatihan dan workshop yang aktif.</p>
                        </div>
                        <button class="btn btn-manage" data-bs-toggle="modal" data-bs-target="#addWorkshopModal">
                            <i class="bi bi-plus-lg me-1"></i> Add Workshop
                        </button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Capacity</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if (workshops != null && !workshops.isEmpty()) {
                                   for (Workshop w : workshops) {
                                       boolean wsActive = "active".equalsIgnoreCase(w.getStatus());
                            %>
                                <tr>
                                    <td><%=w.getId()%></td>
                                    <td class="fw-semibold"><%=esc(w.getName())%></td>
                                    <td><span class="badge-type"><%=esc(w.getType())%></span></td>
                                    <td><%=w.getDate() != null ? dateFormat.format(w.getDate()) : "-"%></td>
                                    <td><%=w.getCapacity()%> Peserta</td>
                                    <td><%=w.getPrice() == 0 ? "Free" : "Rp " + priceFormat.format(w.getPrice())%></td>
                                    <td>
                                        <span class="badge-status <%= wsActive ? "active" : "inactive" %>">
                                            <%= wsActive ? "Active" : "Inactive" %>
                                        </span>
                                    </td>
                                    <td class="text-end text-nowrap">
                                        <button type="button" class="btn btn-sm btn-outline-primary" 
                                                onclick="openEditWorkshopModal(this)"
                                                data-id="<%=w.getId()%>"
                                                data-name="<%=esc(w.getName())%>"
                                                data-type="<%=esc(w.getType())%>"
                                                data-date="<%=w.getDate() != null ? w.getDate().toString() : ""%>"
                                                data-capacity="<%=w.getCapacity()%>"
                                                data-price="<%=(long)w.getPrice()%>"
                                                data-status="<%=esc(w.getStatus())%>"
                                                data-description="<%=esc(w.getDescription())%>"
                                                data-criteria="<%=esc(w.getCriteria())%>">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="confirmDelete('workshop', <%=w.getId()%>)">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                            <%     }
                               } else { %>
                                <tr>
                                    <td colspan="8" class="text-center py-5 text-muted">Belum ada workshop. Klik "Add Workshop" untuk menambahkan.</td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } %>

                <!-- TAB FORUM & TESTIMONI -->
                <% if ("forum".equalsIgnoreCase(activeTab)) { %>
                <div class="tab-pane fade show active">
                    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                        <div>
                            <h2 class="h5 fw-bold mb-1">Pengelolaan Forum &amp; Capaian Belajar</h2>
                            <p class="text-muted small mb-0">Pantau diskusi teknis, ulasan testimoni, dan hasil capaian belajar peserta.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nama Peserta</th>
                                    <th>Kategori</th>
                                    <th>Materi / Modul</th>
                                    <th>Capaian</th>
                                    <th>Rekomendasi Lomba</th>
                                    <th>Judul Postingan</th>
                                    <th class="text-end">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if (forumPosts != null && !forumPosts.isEmpty()) {
                                   for (ForumPost fp : forumPosts) {
                            %>
                                <tr>
                                    <td><%=fp.getId()%></td>
                                    <td class="fw-semibold"><%=esc(fp.getUserName())%></td>
                                    <td><span class="badge-type"><%=esc(fp.getCategory())%></span></td>
                                    <td><%=fp.getLearningSubject() != null && !fp.getLearningSubject().isEmpty() ? esc(fp.getLearningSubject()) : "-"%></td>
                                    <td>
                                        <% if (fp.getAchievementScore() > 0) { %>
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">
                                                <%=fp.getAchievementScore()%>% Tercapai
                                            </span>
                                        <% } else { %>
                                            <span class="text-muted small">-</span>
                                        <% } %>
                                    </td>
                                    <td><span class="text-primary fw-medium"><%=fp.getRecommendedCompName() != null && !fp.getRecommendedCompName().isEmpty() ? esc(fp.getRecommendedCompName()) : "-"%></span></td>
                                    <td class="text-truncate" style="max-width: 220px;" title="<%=esc(fp.getTitle())%>"><%=esc(fp.getTitle())%></td>
                                    <td class="text-end text-nowrap">
                                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="confirmDelete('forum', <%=fp.getId()%>)">
                                            <i class="bi bi-trash"></i> Hapus
                                        </button>
                                    </td>
                                </tr>
                            <%     }
                               } else { %>
                                <tr>
                                    <td colspan="8" class="text-center py-5 text-muted">Belum ada diskusi atau testimoni yang masuk di forum.</td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } %>

                <!-- TAB PAYMENT & TRANSAKSI -->
                <% if ("payment".equalsIgnoreCase(activeTab)) { %>
                <div class="tab-pane fade show active">
                    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                        <div>
                            <h2 class="h5 fw-bold mb-1">Pengelolaan Transaksi &amp; Pembayaran</h2>
                            <p class="text-muted small mb-0">Pantau status transaksi pendaftaran peserta melalui Midtrans Gateway.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Nama Peserta</th>
                                    <th>Agenda</th>
                                    <th>Kategori</th>
                                    <th>Total (Rp)</th>
                                    <th>Metode</th>
                                    <th>Status</th>
                                    <th>Waktu</th>
                                    <th class="text-end">Aksi Verifikasi</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if (paymentList != null && !paymentList.isEmpty()) {
                                   for (Payment py : paymentList) {
                                       String st = py.getTransactionStatus();
                            %>
                                <tr>
                                    <td class="font-monospace small fw-bold"><%=esc(py.getOrderId())%></td>
                                    <td class="fw-semibold"><%=esc(py.getUserName())%></td>
                                    <td class="text-truncate" style="max-width: 180px;"><%=esc(py.getEventName())%></td>
                                    <td><span class="badge-type"><%=esc(py.getEventType())%></span></td>
                                    <td class="fw-bold text-primary">Rp <%=priceFormat.format(py.getGrossAmount())%></td>
                                    <td><span class="small text-muted"><%=esc(py.getPaymentType())%></span></td>
                                    <td>
                                        <span class="badge-status <%=st != null ? st.toLowerCase() : "pending"%>">
                                            <%=st != null ? st.toUpperCase() : "PENDING"%>
                                        </span>
                                    </td>
                                    <td class="text-muted small"><%=py.getCreatedAt() != null ? dateFormat.format(py.getCreatedAt()) : "-"%></td>
                                    <td class="text-end text-nowrap">
                                        <% if (!"settlement".equalsIgnoreCase(st)) { %>
                                            <form action="<%=request.getContextPath()%>/adminPayment" method="POST" class="d-inline">
                                                <input type="hidden" name="action" value="manualVerify">
                                                <input type="hidden" name="orderId" value="<%=py.getOrderId()%>">
                                                <button type="submit" class="btn btn-sm btn-outline-success">
                                                    <i class="bi bi-check-lg"></i> Set Lunas
                                                </button>
                                            </form>
                                        <% } else { %>
                                            <span class="text-success small fw-medium"><i class="bi bi-shield-check"></i> Terverifikasi</span>
                                        <% } %>
                                    </td>
                                </tr>
                            <%     }
                               } else { %>
                                <tr>
                                    <td colspan="9" class="text-center py-5 text-muted">Belum ada riwayat transaksi masuk.</td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } %>

            </div>
        </div>
    </div>

    <!-- MODAL ADD COMPETITION -->
    <div class="modal fade" id="addCompetitionModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="modal-icon"><i class="bi bi-trophy"></i></span>Add Competition</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/adminCompetition" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Competition Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Type</label>
                                <select class="form-select" name="type" required>
                                    <option value="Academic">Academic</option>
                                    <option value="Non-Academic">Non-Academic</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Start Date</label>
                                <input type="date" class="form-control" name="startDate" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">End Date</label>
                                <input type="date" class="form-control" name="endDate" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Entry Fee (Rp)</label>
                                <input type="number" class="form-control" name="entryFee" required min="0" step="any">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select" name="status">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Deskripsi Kompetisi</label>
                            <textarea class="form-control" name="description" rows="3" placeholder="Jelaskan detail kompetisi..."></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Kriteria &amp; Syarat Peserta</label>
                            <textarea class="form-control" name="criteria" rows="2" placeholder="Ketentuan umum peserta..."></textarea>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-manage">Save Competition</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL EDIT COMPETITION -->
    <div class="modal fade" id="editCompetitionModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="modal-icon"><i class="bi bi-pencil-square"></i></span>Edit Detail Competition</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/adminCompetition" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" id="editCompId" name="id">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Competition Name</label>
                                <input type="text" class="form-control" id="editCompName" name="name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Type</label>
                                <select class="form-select" id="editCompType" name="type" required>
                                    <option value="Academic">Academic</option>
                                    <option value="Non-Academic">Non-Academic</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="editCompStartDate" name="startDate" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">End Date</label>
                                <input type="date" class="form-control" id="editCompEndDate" name="endDate" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Entry Fee (Rp)</label>
                                <input type="number" class="form-control" id="editCompEntryFee" name="entryFee" required min="0">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select" id="editCompStatus" name="status">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Deskripsi Kompetisi</label>
                            <textarea class="form-control" id="editCompDescription" name="description" rows="4"></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Kriteria &amp; Rulebook Kompetisi</label>
                            <textarea class="form-control" id="editCompCriteria" name="criteria" rows="3"></textarea>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-manage">Simpan Perubahan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL ADD WORKSHOP -->
    <div class="modal fade" id="addWorkshopModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="modal-icon"><i class="bi bi-mortarboard"></i></span>Add Workshop</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/adminWorkshop" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Workshop Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Type</label>
                                <select class="form-select" name="type" required>
                                    <option value="Academic">Academic</option>
                                    <option value="Non-Academic">Non-Academic</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Date</label>
                                <input type="date" class="form-control" name="date" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Capacity (Quota)</label>
                                <input type="number" class="form-control" name="capacity" required min="1">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Price (Rp)</label>
                                <input type="number" class="form-control" name="price" required min="0" step="any">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select" name="status">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Deskripsi Workshop</label>
                            <textarea class="form-control" name="description" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Kriteria &amp; Syarat Peserta</label>
                            <textarea class="form-control" name="criteria" rows="2"></textarea>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-manage">Save Workshop</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL EDIT WORKSHOP -->
    <div class="modal fade" id="editWorkshopModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="modal-icon"><i class="bi bi-pencil-square"></i></span>Edit Detail Workshop</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/adminWorkshop" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" id="editWsId" name="id">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nama Workshop</label>
                                <input type="text" class="form-control" id="editWsName" name="name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Kategori</label>
                                <select class="form-select" id="editWsType" name="type" required>
                                    <option value="Academic">Academic</option>
                                    <option value="Non-Academic">Non-Academic</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Tanggal Pelaksanaan</label>
                                <input type="date" class="form-control" id="editWsDate" name="date" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Kuota Peserta</label>
                                <input type="number" class="form-control" id="editWsCapacity" name="capacity" required min="1">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Biaya Pendaftaran (Rp)</label>
                                <input type="number" class="form-control" id="editWsPrice" name="price" required min="0">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select" id="editWsStatus" name="status">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Deskripsi Workshop</label>
                            <textarea class="form-control" id="editWsDescription" name="description" rows="4"></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Kriteria &amp; Persyaratan Peserta</label>
                            <textarea class="form-control" id="editWsCriteria" name="criteria" rows="3"></textarea>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-manage">Simpan Perubahan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL DELETE KONFIRMASI -->
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <div class="delete-icon"><i class="bi bi-trash"></i></div>
                    <h5 class="mb-2">Confirm Delete</h5>
                    <p class="text-muted small mb-4">Apakah Anda yakin ingin menghapus data ini?</p>
                    <form id="deleteForm" method="POST">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" id="deleteId" name="id">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const CTX = '<%=request.getContextPath()%>';

        function confirmDelete(type, id) {
            const form = document.getElementById('deleteForm');
            if (type === 'workshop') {
                form.action = CTX + '/adminWorkshop';
            } else if (type === 'competition') {
                form.action = CTX + '/adminCompetition';
            } else if (type === 'forum') {
                form.action = CTX + '/adminForum';
            }
            document.getElementById('deleteId').value = id;
            new bootstrap.Modal(document.getElementById('deleteConfirmationModal')).show();
        }

        function openEditWorkshopModal(btn) {
            document.getElementById('editWsId').value = btn.getAttribute('data-id');
            document.getElementById('editWsName').value = btn.getAttribute('data-name');
            document.getElementById('editWsType').value = btn.getAttribute('data-type');
            document.getElementById('editWsDate').value = btn.getAttribute('data-date');
            document.getElementById('editWsCapacity').value = btn.getAttribute('data-capacity');
            document.getElementById('editWsPrice').value = btn.getAttribute('data-price');
            document.getElementById('editWsStatus').value = btn.getAttribute('data-status');
            document.getElementById('editWsDescription').value = btn.getAttribute('data-description') || '';
            document.getElementById('editWsCriteria').value = btn.getAttribute('data-criteria') || '';

            const modalEl = document.getElementById('editWorkshopModal');
            const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
            modal.show();
        }

        function openEditCompetitionModal(btn) {
            document.getElementById('editCompId').value = btn.getAttribute('data-id');
            document.getElementById('editCompName').value = btn.getAttribute('data-name');
            document.getElementById('editCompType').value = btn.getAttribute('data-type');
            document.getElementById('editCompStartDate').value = btn.getAttribute('data-start-date');
            document.getElementById('editCompEndDate').value = btn.getAttribute('data-end-date');
            document.getElementById('editCompEntryFee').value = btn.getAttribute('data-entry-fee');
            document.getElementById('editCompStatus').value = btn.getAttribute('data-status');
            document.getElementById('editCompDescription').value = btn.getAttribute('data-description') || '';
            document.getElementById('editCompCriteria').value = btn.getAttribute('data-criteria') || '';

            const modalEl = document.getElementById('editCompetitionModal');
            const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
            modal.show();
        }
    </script>
</body>
</html>