<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Workshop Academic</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Montaga&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="WorkshopAcademic.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- ===== Navbar ===== -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="SmartComp Logo" class="brand-logo" onerror="this.src='https://placehold.co/40x40?text=SC'">
                <span class="brand-name">SmartComp</span>
            </a>

            <!-- Search Bar -->
            <form class="d-flex nav-search mx-auto" role="search" action="<%=request.getContextPath()%>/workshop" method="get">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0">
                        <i class="bi bi-search text-muted"></i>
                    </span>
                    <input class="form-control border-start-0 ps-0" type="search" name="keyword" placeholder="Search for competition or workshop" aria-label="Search">
                    <button class="btn btn-search" type="submit">Search</button>
                </div>
            </form>

            <!-- Action Icons -->
            <div class="d-flex align-items-center gap-2 nav-actions">
                <a href="<%=request.getContextPath()%>/payment" class="nav-icon-btn" title="Cart & Payments">
                    <i class="bi bi-cart2"></i>
                </a>
                <button class="nav-icon-btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications" aria-label="Notifications" title="Notifications">
                    <i class="bi bi-bell"></i>
                </button>

                <div class="dropdown">
                    <button class="nav-icon-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Account">
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

    <!-- ===== Notifications Offcanvas ===== -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNotifications" aria-labelledby="offcanvasNotificationsLabel">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title fw-bold" id="offcanvasNotificationsLabel">Notifikasi</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <h6 class="text-uppercase text-muted small fw-bold mb-3">Terbaru</h6>
            <div class="card p-3 mb-2 notification-card">
                <span class="fw-semibold">Dibuka pendaftaran Workshop UI/UX</span>
                <small class="text-muted mt-1"><i class="bi bi-clock me-1"></i>2 menit yang lalu</small>
            </div>
            <div class="card p-3 mb-3 notification-card">
                <span class="fw-semibold">Jadwal Sesi Mentoring Java Enterprise</span>
                <small class="text-muted mt-1"><i class="bi bi-calendar-event me-1"></i>Besok, 10:00 WIB</small>
            </div>
        </div>
    </div>

    <!-- ===== Categories Offcanvas ===== -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategories" aria-labelledby="offcanvasCategoriesLabel">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title fw-bold" id="offcanvasCategoriesLabel">Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-0">
            <ul class="list-group list-group-flush category-list">
                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/index.jsp" class="category-link"><i class="bi bi-house-door me-3"></i> Home</a>
                </li>
                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/workshop" class="category-link"><i class="bi bi-gear me-3"></i> Workshop</a>
                </li>
                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp" class="category-link"><i class="bi bi-trophy me-3"></i> Competitions</a>
                </li>
                <li class="list-group-item">
                    <a href="WorkshopAcademic.jsp" class="category-link active"><i class="bi bi-mortarboard me-3"></i> Academic</a>
                </li>
                <li class="list-group-item">
                    <a href="WorkshopNonAcademic.jsp" class="category-link"><i class="bi bi-book me-3"></i> Non-Academic</a>
                </li>
            </ul>
        </div>
    </div>

    <!-- ===== Main Content ===== -->
    <main class="flex-grow-1 py-5">
        <div class="container">
            
            <!-- Hero / Header Section Terpusat -->
            <div class="header-section text-center mb-5">
                <button type="button" class="btn btn-category-trigger mb-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories">
                    <i class="bi bi-grid-fill me-2"></i> Categories
                </button>
                <h2 class="section-heading fw-bold">Recommended Workshop &amp; Competition</h2>
                <p class="section-subheading text-muted">All the skills you need in one structured platform</p>

                <!-- Filter Toggle Tabs -->
                <div class="filter-toggle mt-4">
                    <a href="WorkshopAcademic.jsp" class="btn filter-pill active">Academic</a>
                    <a href="WorkshopNonAcademic.jsp" class="btn filter-pill">Non-Academic</a>
                </div>
            </div>

<!-- Kontainer Target Kartu Dinamis -->
<section class="container card-section">
    <div class="row g-4 justify-content-center" id="workshop-card-container">
        <!-- Spinner Loading -->
        <div class="col-12 text-center py-5">
            <div class="spinner-border text-primary" role="status"></div>
            <p class="text-muted mt-2">Memuat daftar workshop...</p>
        </div>
    </div>
</section>
            
<%-- 
            <!-- Card Grid -->
            <div class="row g-4 justify-content-center">

                <!-- Kartu 1: UI/UX -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card workshop-card h-100">
                        <div class="card-img-holder">
                            <img src="https://i.pinimg.com/564x/82/7f/8c/827f8c8170a5842d2560da75249117af.jpg" class="card-img-top" alt="UI/UX Designer">
                            <span class="badge-category">Workshop</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold">UI/UX Designer For 30 Days</h5>
                            <p class="card-text text-muted small flex-grow-1">Pelajari prinsip user research, interactive wireframe, dan pembuatan design system Figma.</p>
                            <div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top">
                                <span class="price-tag">Rp 120.000</span>
                                <a href="#" class="btn btn-action">Jelajahi</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Kartu 2: Web Dev (Form Payment Tetap Utuh) -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card workshop-card h-100">
                        <div class="card-img-holder">
                            <img src="https://i.pinimg.com/564x/cb/c7/6a/cbc76a054c9599cc13d5d69910029a15.jpg" class="card-img-top" alt="Web Development">
                            <span class="badge-category">Academy</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold">The Complete Web Development Academy</h5>
                            <p class="card-text text-muted small flex-grow-1">Panduan lengkap arsitektur MVC, database PostgreSQL, dan REST API untuk aplikasi web.</p>
                            <form action="${pageContext.request.contextPath}/payment" method="post" class="mt-auto">
                                <input type="hidden" name="action" value="addPayment">
                                <input type="hidden" name="eventType" value="Academic">
                                <input type="hidden" name="eventName" value="The Complete Web Development Academy">
                                <div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top">
                                    <span class="price-tag">Rp 150.000</span>
                                    <button type="submit" class="btn btn-action">Jelajahi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Kartu 3: Java -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card workshop-card h-100">
                        <div class="card-img-holder">
                            <img src="https://i.pinimg.com/564x/bd/89/3a/bd893a529d494acb0977cf90413987f1.jpg" class="card-img-top" alt="Java Development">
                            <span class="badge-category">Workshop</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold">Project Development Using JAVA in 2026</h5>
                            <p class="card-text text-muted small flex-grow-1">Terapkan OOP murni, koneksi JDBC database, dan servlet enterprise untuk kebutuhan industri.</p>
                            <div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top">
                                <span class="price-tag">Gratis</span>
                                <a href="#" class="btn btn-action">Jelajahi</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Kartu 4: UI/UX Advanced -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card workshop-card h-100">
                        <div class="card-img-holder">
                            <img src="https://i.pinimg.com/564x/82/7f/8c/827f8c8170a5842d2560da75249117af.jpg" class="card-img-top" alt="UI/UX Pro">
                            <span class="badge-category">Workshop</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold">UI/UX Design Masterclass &amp; Case Study</h5>
                            <p class="card-text text-muted small flex-grow-1">Studi kasus mendalam perancangan antarmuka pengguna siap uji pakai dan user testing.</p>
                            <div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top">
                                <span class="price-tag">Rp 85.000</span>
                                <a href="#" class="btn btn-action">Jelajahi</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Kartu 5: Web Dev Modern -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card workshop-card h-100">
                        <div class="card-img-holder">
                            <img src="https://i.pinimg.com/564x/cb/c7/6a/cbc76a054c9599cc13d5d69910029a15.jpg" class="card-img-top" alt="Web Dev Advanced">
                            <span class="badge-category">Academy</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold">Backend Web Service &amp; Database Design</h5>
                            <p class="card-text text-muted small flex-grow-1">Struktur relasi tabel PostgreSQL, keamanan query injection, dan optimasi performa web.</p>
                            <div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top">
                                <span class="price-tag">Rp 100.000</span>
                                <a href="#" class="btn btn-action">Jelajahi</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div> --%>
    </main>

    <!-- ===== Footer Multi-Kolom ===== -->
    <footer class="main-footer mt-auto">
        <div class="footer-top py-5">
            <div class="container">
                <div class="row g-4">
                    <!-- Brand & Deskripsi -->
                    <div class="col-12 col-lg-4 pe-lg-5">
                        <div class="d-flex align-items-center gap-2 mb-3">
                            <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="36" height="36" onerror="this.src='https://placehold.co/36x36?text=SC'">
                            <span class="footer-brand-title">SmartComp.</span>
                        </div>
                        <p class="footer-desc-text">
                            Platform workshop dan kompetisi teknologi terdepan untuk mahasiswa Indonesia. Wadah berbagi inovasi, asah keahlian, dan bangun portofolio nyata.
                        </p>
                    </div>

                    <!-- Company -->
                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Company</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                            <li><a href="<%=request.getContextPath()%>/about.jsp">About Us</a></li>
                            <li><a href="<%=request.getContextPath()%>/competition">Competition</a></li>
                            <li><a href="<%=request.getContextPath()%>/workshop">Workshop</a></li>
                        </ul>
                    </div>

                    <!-- Services -->
                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Services</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="<%=request.getContextPath()%>/WEB-FILE/Profile.jsp">My Account</a></li>
                            <li><a href="<%=request.getContextPath()%>/payment">Transactions</a></li>
                            <li><a href="<%=request.getContextPath()%>/help.jsp">FAQ &amp; Help</a></li>
                            <li><a href="<%=request.getContextPath()%>/help.jsp">Terms of Use</a></li>
                        </ul>
                    </div>

                    <!-- Social Media -->
                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Social Media</h6>
                        <ul class="list-unstyled footer-menu">
                            <li><a href="https://instagram.com" target="_blank"><i class="bi bi-instagram me-1"></i> Instagram</a></li>
                            <li><a href="https://linkedin.com" target="_blank"><i class="bi bi-linkedin me-1"></i> LinkedIn</a></li>
                            <li><a href="https://youtube.com" target="_blank"><i class="bi bi-youtube me-1"></i> YouTube</a></li>
                            <li><a href="https://github.com" target="_blank"><i class="bi bi-github me-1"></i> GitHub</a></li>
                        </ul>
                    </div>

                    <!-- Kontak & Alamat -->
                    <div class="col-6 col-sm-3 col-lg-2">
                        <h6 class="footer-heading">Contact Info</h6>
                        <ul class="list-unstyled footer-contact-info">
                            <li>+62 812-3456-7890</li>
                            <li>support@smartcomp.id</li>
                            <li class="mt-2 text-muted-address">
                                Jl. Telekomunikasi No. 1, Terusan Buahbatu, Bandung, 40257
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sub-footer Bar -->
        <div class="footer-bottom py-3">
            <div class="container d-flex flex-column flex-sm-row justify-content-between align-items-center gap-2">
                <span class="copyright-text">Copyright &copy; 2026 SmartComp. All Rights Reserved.</span>
                <div class="sub-links">
                    <span class="me-3">Indonesia | IDR</span>
                    <a href="<%=request.getContextPath()%>/help.jsp">Privacy Policy</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
<script>
    var contextRoot = '<%=request.getContextPath()%>';

    function loadWorkshops(categoryType) {
        var container = document.getElementById("workshop-card-container");
        if (!container) return;

        fetch(contextRoot + '/api/workshops?type=' + encodeURIComponent(categoryType))
            .then(function(res) {
                if (!res.ok) throw new Error('Network error: ' + res.status);
                return res.json();
            })
            .then(function(data) {
                container.innerHTML = '';

                if (data.length === 0) {
                    container.innerHTML = '<div class="col-12 text-center py-5 text-muted">' +
                        '<i class="bi bi-calendar-x fs-1 d-block mb-2 text-secondary"></i>' +
                        'Belum ada workshop kategori <b>' + categoryType + '</b> yang aktif.' +
                        '</div>';
                    return;
                }

                data.forEach(function(ws) {
                    var priceText = ws.price > 0 
                        ? 'Rp ' + Number(ws.price).toLocaleString('id-ID') 
                        : 'Gratis';

                    var cardHtml = 
                        '<div class="col-12 col-md-6 col-lg-4">' +
                            '<div class="card workshop-card h-100 shadow-sm">' +
                                '<div class="card-img-holder">' +
                                    '<img src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="' + ws.name + '">' +
                                    '<span class="badge-category">' + ws.type + '</span>' +
                                '</div>' +
                                '<div class="card-body d-flex flex-column">' +
                                    '<h5 class="card-title fw-bold">' + ws.name + '</h5>' +
                                    '<div class="d-flex justify-content-between text-muted small mb-3">' +
                                        '<span><i class="bi bi-calendar-event me-1"></i>' + ws.date + '</span>' +
                                        '<span><i class="bi bi-people me-1"></i>Kuota: ' + ws.capacity + '</span>' +
                                    '</div>' +
                                    '<div class="card-footer-action d-flex align-items-center justify-content-between pt-3 border-top mt-auto">' +
                                        '<span class="price-tag">' + priceText + '</span>' +
                                        '<!-- Tombol Jelajahi mengarah ke WorkshopDetail Controller -->' +
                                        '<a href="' + contextRoot + '/workshopDetail?id=' + ws.id + '" class="btn btn-action">Jelajahi</a>' +
                                    '</div>' +
                                '</div>' +
                            '</div>' +
                        '</div>';

                    container.insertAdjacentHTML('beforeend', cardHtml);
                });
            })
            .catch(function(err) {
                console.error(err);
                container.innerHTML = '<div class="col-12 text-center text-danger py-4">' +
                    'Gagal memuat data workshop. Pastikan servlet API aktif.' +
                    '</div>';
            });
    }

    document.addEventListener("DOMContentLoaded", function() {
        loadWorkshops("Academic");
    });
</script>
</body>
</html>