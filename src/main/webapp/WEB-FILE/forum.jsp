<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.classes.ForumPost" %>
<%
    List<ForumPost> posts = (List<ForumPost>) request.getAttribute("posts");
    String currentFilter = (String) request.getAttribute("currentFilter");
    if (currentFilter == null) currentFilter = "All";
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, HH:mm");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Forum &amp; Capaian Belajar</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Forum CSS Terpisah -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/forum.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <nav class="navbar navbar-expand-lg navbar-forum sticky-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="34" height="34" onerror="this.src='https://placehold.co/34x34?text=SC'">
                <span class="brand-name">SmartComp</span>
            </a>

            
            <form class="d-flex nav-search mx-auto" role="search" action="<%=request.getContextPath()%>/forum" method="GET">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0">
                        <i class="bi bi-search text-muted"></i>
                    </span>
                    <input class="form-control border-start-0 ps-0" type="search" name="keyword" placeholder="Search forum discussions or topics..." aria-label="Search">
                    <button class="btn btn-search-nav" type="submit">Search</button>
                </div>
            </form>

       
            <div class="d-flex align-items-center gap-2 ms-auto">
                <button class="btn btn-create-post me-2 d-none d-sm-inline-flex align-items-center" data-bs-toggle="modal" data-bs-target="#newPostModal">
                    <i class="bi bi-pencil-square me-1"></i> Buat Diskusi / Testimoni
                </button>

                <a href="<%=request.getContextPath()%>/payment" class="nav-icon-btn" title="Keranjang & Transaksi">
                    <i class="bi bi-cart2"></i>
                </a>
                <button class="nav-icon-btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications" title="Notifikasi">
                    <i class="bi bi-bell"></i>
                </button>

                <div class="dropdown">
                    <button class="nav-icon-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Akun Saya">
                        <i class="bi bi-person-circle"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/WEB-FILE/Profile.jsp"><i class="bi bi-person me-2"></i>My Profile</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/WEB-FILE/UpdateProfile.jsp"><i class="bi bi-pencil-square me-2"></i>Update Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="<%=request.getContextPath()%>/logout"><i class="bi bi-box-arrow-right me-2"></i>Sign Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- ===== Drawer Notifikasi ===== -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNotifications">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title fw-bold">Notifikasi</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <h6 class="text-uppercase text-muted small fw-bold mb-3">Terbaru</h6>
            <div class="card p-3 mb-2 border shadow-none">
                <span class="fw-semibold">Capaian Modul Java disetujui!</span>
                <small class="text-muted mt-1"><i class="bi bi-clock me-1"></i>5 menit yang lalu</small>
            </div>
        </div>
    </div>

    <!-- ===== Drawer Kategori (Model Boxed) ===== -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategories">
        <div class="offcanvas-header border-0 pb-0">
            <h5 class="offcanvas-title fw-semibold text-secondary">Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body p-3">
            <div class="card border rounded-3 overflow-hidden shadow-none">
                <ul class="list-group list-group-flush category-nav-list">
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/WEB-FILE/dashboardUser.jsp" class="category-item-link"><i class="bi bi-house me-3"></i> Home</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/workshop" class="category-item-link"><i class="bi bi-gear me-3"></i> Workshop</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/calendar" class="category-item-link"><i class="bi bi-calendar me-3"></i> Calendar</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/competition" class="category-item-link"><i class="bi bi-trophy me-3"></i> Competitions</a></li>
                    <li class="list-group-item py-3 active bg-primary"><a href="<%=request.getContextPath()%>/forum" class="category-item-link text-white fw-bold"><i class="bi bi-chat-dots me-3"></i> Forum</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp" class="category-item-link"><i class="bi bi-mortarboard me-3"></i> Academic</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionNonAcademic.jsp" class="category-item-link"><i class="bi bi-book me-3"></i> Non-Academic</a></li>
                </ul>
            </div>
        </div>
    </div>


    <main class="container py-5 flex-grow-1">

    
        <div class="hero-achievement mb-5">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <span class="badge bg-warning text-dark mb-2 fw-semibold px-3 py-1">Hasil Belajar Terbaru</span>
                    <h2 class="fw-bold mb-2">Pembelajaran Coding &amp; Arsitektur MVC</h2>
                    <p class="mb-3 opacity-90">Progress belajar kamu telah mencapai <b>80%</b> dengan nilai evaluasi sempurna. Berdasarkan hasil ini, kamu memenuhi kualifikasi untuk mengikuti kompetisi tingkat lanjut!</p>
                    <div class="d-flex align-items-center gap-3">
                        <div class="progress flex-grow-1 bg-white bg-opacity-25" style="height: 12px; border-radius: 6px;">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 80%;"></div>
                        </div>
                        <span class="fw-bold">80% Tercapai</span>
                    </div>
                </div>
                <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                    <a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp" class="btn btn-light text-primary fw-semibold px-4 py-2 shadow-sm">
                        <i class="bi bi-trophy me-1"></i> Ikuti Rekomendasi Lomba
                    </a>
                </div>
            </div>
        </div>

        <!-- Tombol Kategori & Navigasi Filter -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-3">
            <div>
                <button type="button" class="btn btn-category-trigger mb-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories">
                    <i class="bi bi-grid-fill me-1"></i> Categories
                </button>
                <h4 class="fw-bold mb-0">Forum Diskusi, Capaian &amp; Testimoni</h4>
            </div>
            <div class="d-flex gap-2">
                <a href="<%=request.getContextPath()%>/forum?filter=All" class="filter-pill <%= "All".equalsIgnoreCase(currentFilter) ? "active" : "" %>">Semua</a>
                <a href="<%=request.getContextPath()%>/forum?filter=Capaian Belajar" class="filter-pill <%= "Capaian Belajar".equalsIgnoreCase(currentFilter) ? "active" : "" %>">Capaian Belajar</a>
                <a href="<%=request.getContextPath()%>/forum?filter=Testimoni" class="filter-pill <%= "Testimoni".equalsIgnoreCase(currentFilter) ? "active" : "" %>">Testimoni</a>
                <a href="<%=request.getContextPath()%>/forum?filter=Diskusi" class="filter-pill <%= "Diskusi".equalsIgnoreCase(currentFilter) ? "active" : "" %>">Diskusi</a>
            </div>
        </div>

        <!-- Grid Kartu Diskusi & Capaian -->
        <div class="row g-4">
            <% if (posts != null && !posts.isEmpty()) {
                   for (ForumPost p : posts) {
            %>
            <div class="col-12 col-md-6">
                <div class="card forum-card shadow-sm p-4 h-100 d-flex flex-column">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill px-3 py-1"><%=p.getCategory()%></span>
                        <small class="text-muted"><%=p.getCreatedAt() != null ? sdf.format(p.getCreatedAt()) : ""%></small>
                    </div>
                    <h5 class="fw-bold mb-2"><%=p.getTitle()%></h5>
                    <p class="text-secondary small flex-grow-1" style="white-space: pre-line;"><%=p.getContent()%></p>

                    <!-- Khusus Capaian Belajar -->
                    <% if (p.getAchievementScore() > 0 || (p.getLearningSubject() != null && !p.getLearningSubject().isEmpty())) { %>
                    <div class="p-3 bg-light rounded-3 mb-3 border">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="small fw-semibold text-dark"><i class="bi bi-journal-code me-1"></i><%=p.getLearningSubject()%></span>
                            <span class="score-badge"><%=p.getAchievementScore()%>% Tercapai</span>
                        </div>
                        <% if (p.getRecommendedCompName() != null && !p.getRecommendedCompName().isEmpty()) { %>
                        <div class="small text-muted mt-2">
                            <i class="bi bi-stars text-warning me-1"></i> Rekomendasi Lomba: <b><%=p.getRecommendedCompName()%></b>
                        </div>
                        <% } %>
                    </div>
                    <% } %>

                    <div class="d-flex align-items-center justify-content-between pt-2 border-top text-muted small mt-auto">
                        <span><i class="bi bi-person-circle me-1"></i><%=p.getUserName()%></span>
                        <span class="text-success"><i class="bi bi-patch-check-fill me-1"></i>Terverifikasi</span>
                    </div>
                </div>
            </div>
            <%     }
               } else { %>
            <div class="col-12 text-center py-5 text-muted">
                <i class="bi bi-chat-square-dots fs-1 d-block mb-2 text-secondary"></i>
                Belum ada postingan dalam kategori ini. Jadilah yang pertama berdiskusi!
            </div>
            <% } %>
        </div>
    </main>

    <!-- ===== Footer Multi-Kolom SmartComp ===== -->
    <footer class="main-footer mt-auto">
        <div class="footer-top">
            <div class="container">
                <div class="row g-4">
                    <div class="col-12 col-lg-4 pe-lg-5">
                        <div class="d-flex align-items-center gap-2 mb-3">
                            <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="36" height="36" onerror="this.src='https://placehold.co/36x36?text=SC'">
                            <span class="footer-brand-title">SmartComp.</span>
                        </div>
                        <p class="footer-desc-text">
                            Platform workshop dan kompetisi teknologi terdepan untuk mahasiswa Indonesia. Wadah berbagi inovasi, asah keahlian, dan bangun portofolio nyata.
                        </p>
                    </div>

                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Company</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                            <li><a href="<%=request.getContextPath()%>/about.jsp">About Us</a></li>
                            <li><a href="<%=request.getContextPath()%>/competition">Competition</a></li>
                            <li><a href="<%=request.getContextPath()%>/workshop">Workshop</a></li>
                        </ul>
                    </div>

                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Services</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="<%=request.getContextPath()%>/WEB-FILE/Profile.jsp">My Account</a></li>
                            <li><a href="<%=request.getContextPath()%>/payment">Transactions</a></li>
                            <li><a href="<%=request.getContextPath()%>/help.jsp">FAQ &amp; Help</a></li>
                            <li><a href="<%=request.getContextPath()%>/help.jsp">Terms of Use</a></li>
                        </ul>
                    </div>

                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Social Media</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="https://instagram.com" target="_blank"><i class="bi bi-instagram me-1"></i> Instagram</a></li>
                            <li><a href="https://linkedin.com" target="_blank"><i class="bi bi-linkedin me-1"></i> LinkedIn</a></li>
                            <li><a href="https://youtube.com" target="_blank"><i class="bi bi-youtube me-1"></i> YouTube</a></li>
                            <li><a href="https://github.com" target="_blank"><i class="bi bi-github me-1"></i> GitHub</a></li>
                        </ul>
                    </div>

                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Contact Info</h6>
                        <ul class="list-unstyled footer-contact-info">
                            <li>+62 812-3456-7890</li>
                            <li>support@smartcomp.id</li>
                            <li class="mt-2 text-muted">
                                Jl. Telekomunikasi No. 1, Terusan Buahbatu, Bandung, 40257
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom py-3">
            <div class="container d-flex flex-column flex-sm-row justify-content-between align-items-center gap-2">
                <span>Copyright &copy; 2026 SmartComp. All Rights Reserved.</span>
                <div>
                    <span class="me-3">Indonesia | IDR</span>
                    <a href="<%=request.getContextPath()%>/help.jsp">Privacy Policy</a>
                </div>
            </div>
        </div>
    </footer>


    <div class="modal fade" id="newPostModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold">Buat Diskusi / Testimoni</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/forum" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Nama Anda</label>
                            <input type="text" class="form-control" name="userName" placeholder="Contoh: Arif Winanda" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Kategori</label>
                            <select class="form-select" name="category" required>
                                <option value="Capaian Belajar">Capaian Belajar</option>
                                <option value="Testimoni">Testimoni</option>
                                <option value="Diskusi">Diskusi Teknis</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Judul Postingan</label>
                            <input type="text" class="form-control" name="title" required placeholder="Contoh: Pengalaman Lulus Modul Pemrograman">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Materi / Modul Belajar</label>
                                <input type="text" class="form-control" name="learningSubject" placeholder="Contoh: Java Backend">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Persentase Capaian (%)</label>
                                <input type="number" class="form-control" name="achievementScore" min="0" max="100" placeholder="Contoh: 80">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Rekomendasi Lomba Terkait</label>
                            <input type="text" class="form-control" name="recommendedCompName" placeholder="Contoh: Hackathon SmartComp 2026">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Isi Testimoni / Diskusi</label>
                            <textarea class="form-control" name="content" rows="4" required placeholder="Bagikan insight, tantangan, atau ulasan workshop..."></textarea>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-primary" style="background-color: #7059e2; border-color: #7059e2;">Publikasikan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>