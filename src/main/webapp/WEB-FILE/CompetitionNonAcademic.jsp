<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Competition Non-Academic</title>
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
        /* Navbar Biru Khas Kompetisi */
        .navbar-competition {
            background-color: #1a73e8;
            box-shadow: 0 2px 10px rgba(26, 115, 232, 0.2);
            padding: 0.85rem 1.5rem;
        }
        .navbar-competition .brand-name {
            font-weight: 700;
            font-size: 1.35rem;
            color: #ffffff;
            text-decoration: none;
        }
        .navbar-competition .nav-icon-btn {
            background: rgba(255, 255, 255, 0.15);
            border: none;
            color: #ffffff;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.15rem;
            transition: all 0.2s ease;
        }
        .navbar-competition .nav-icon-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            color: #ffffff;
        }
        .btn-search-comp {
            background-color: #0d47a1;
            color: white;
            border: none;
        }
        .btn-search-comp:hover {
            background-color: #002171;
            color: white;
        }
        /* Pills & Cards */
        .filter-pill {
            padding: 0.45rem 1.5rem;
            border-radius: 30px;
            font-weight: 500;
            text-decoration: none;
            border: 1px solid #1a73e8;
            color: #1a73e8;
            margin: 0 4px;
        }
        .filter-pill.active {
            background-color: #1a73e8;
            color: white;
        }
        .btn-category-trigger {
            background-color: #e8f0fe;
            color: #1a73e8;
            border: none;
            border-radius: 20px;
            padding: 0.4rem 1.2rem;
            font-weight: 600;
        }
        .competition-card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .competition-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.08) !important;
        }
        .card-img-holder {
            position: relative;
            height: 190px;
            overflow: hidden;
        }
        .card-img-holder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .badge-category {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(0, 0, 0, 0.65);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .price-tag {
            font-weight: 700;
            font-size: 1.1rem;
            color: #1a73e8;
        }
        .btn-action {
            background-color: #1a73e8;
            color: white;
            border-radius: 6px;
            padding: 0.4rem 1.25rem;
            font-weight: 500;
            text-decoration: none;
        }
        .btn-action:hover {
            background-color: #1557b0;
            color: white;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- ===== Navbar Biru Kompetisi ===== -->
    <nav class="navbar navbar-expand-lg navbar-competition sticky-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="36" height="36" onerror="this.src='https://placehold.co/36x36?text=SC'">
                <span class="brand-name">SmartComp</span>
            </a>

            <!-- Search Bar -->
            <form class="d-flex mx-auto" role="search" style="max-width: 450px; width: 100%;">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0">
                        <i class="bi bi-search text-muted"></i>
                    </span>
                    <input class="form-control border-start-0 ps-0" type="search" placeholder="Cari kompetisi..." aria-label="Search">
                    <button class="btn btn-search-comp" type="button">Search</button>
                </div>
            </form>

            <!-- Action Icons Putih -->
            <div class="d-flex align-items-center gap-2">
                <a href="<%=request.getContextPath()%>/payment" class="nav-icon-btn" title="Cart & Payments">
                    <i class="bi bi-cart2"></i>
                </a>
                <button class="nav-icon-btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications" title="Notifications">
                    <i class="bi bi-bell"></i>
                </button>
                <div class="dropdown">
                    <button class="nav-icon-btn" type="button" data-bs-toggle="dropdown">
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

    <!-- ===== Categories Offcanvas ===== -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategories">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title fw-bold">Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body p-0">
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><a href="<%=request.getContextPath()%>/index.jsp" class="text-decoration-none text-dark"><i class="bi bi-house-door me-3"></i> Home</a></li>
                <li class="list-group-item"><a href="<%=request.getContextPath()%>/WEB-FILE/WorkshopAcademic.jsp" class="text-decoration-none text-dark"><i class="bi bi-mortarboard me-3"></i> Workshop Academic</a></li>
                <li class="list-group-item"><a href="<%=request.getContextPath()%>/WEB-FILE/WorkshopNonAcademic.jsp" class="text-decoration-none text-dark"><i class="bi bi-book me-3"></i> Workshop Non-Academic</a></li>
                <li class="list-group-item active bg-primary"><a href="CompetitionAcademic.jsp" class="text-decoration-none text-white fw-bold"><i class="bi bi-trophy me-3"></i> Competition Academic</a></li>
                <li class="list-group-item"><a href="CompetitionNonAcademic.jsp" class="text-decoration-none text-dark"><i class="bi bi-award me-3"></i> Competition Non-Academic</a></li>
            </ul>
        </div>
    </div>

    <!-- ===== Main Content ===== -->
    <main class="flex-grow-1 py-5">
        <div class="container">
            <div class="text-center mb-5">
                <button type="button" class="btn btn-category-trigger mb-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories">
                    <i class="bi bi-grid-fill me-2"></i> Categories
                </button>
                <h2 class="fw-bold">Recommended Competition</h2>
                <p class="text-muted">Uji kompetensi dan raih penghargaan di kompetisi bergengsi</p>

                <!-- Toggle Filter Tabs -->
                <div class="mt-4">
                    <a href="CompetitionAcademic.jsp" class="filter-pill">Academic</a>
<a href="CompetitionNonAcademic.jsp" class="filter-pill active">Non-Academic</a>
                </div>
            </div>

            <!-- Grid Kartu Kompetisi -->
            <section class="container">
                <div class="row g-4 justify-content-center" id="competition-card-container">
                    <div class="col-12 text-center py-5">
                        <div class="spinner-border text-primary" role="status"></div>
                        <p class="text-muted mt-2">Memuat daftar kompetisi...</p>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <footer class="mt-auto py-3 bg-white border-top text-center text-muted small">
        Copyright &copy; 2026 SmartComp. All Rights Reserved.
    </footer>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var contextRoot = '<%=request.getContextPath()%>';

        function loadCompetitions(categoryType) {
            var container = document.getElementById("competition-card-container");
            if (!container) return;

            fetch(contextRoot + '/api/competitions?type=' + encodeURIComponent(categoryType))
                .then(function(res) {
                    if (!res.ok) throw new Error('Network error: ' + res.status);
                    return res.json();
                })
                .then(function(data) {
                    container.innerHTML = '';

                    if (data.length === 0) {
                        container.innerHTML = '<div class="col-12 text-center py-5 text-muted">' +
                            '<i class="bi bi-trophy fs-1 d-block mb-2 text-secondary"></i>' +
                            'Belum ada kompetisi kategori <b>' + categoryType + '</b> yang aktif.' +
                            '</div>';
                        return;
                    }

                    data.forEach(function(comp) {
                        var priceText = comp.entryFee > 0 
                            ? 'Rp ' + Number(comp.entryFee).toLocaleString('id-ID') 
                            : 'Gratis';

                        var cardHtml = 
                            '<div class="col-12 col-md-6 col-lg-4">' +
                                '<div class="card competition-card h-100 shadow-sm">' +
                                    '<div class="card-img-holder">' +
                                        '<img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=600&q=80" alt="' + comp.name + '">' +
                                        '<span class="badge-category">' + comp.type + '</span>' +
                                    '</div>' +
                                    '<div class="card-body d-flex flex-column">' +
                                        '<h5 class="card-title fw-bold">' + comp.name + '</h5>' +
                                        '<div class="d-flex justify-content-between text-muted small mb-3">' +
                                            '<span><i class="bi bi-calendar-check me-1"></i>Batas: ' + comp.endDate + '</span>' +
                                        '</div>' +
                                        '<div class="d-flex align-items-center justify-content-between pt-3 border-top mt-auto">' +
                                            '<span class="price-tag">' + priceText + '</span>' +
                                            '<a href="' + contextRoot + '/competitionDetail?id=' + comp.id + '" class="btn btn-action">Jelajahi</a>' +
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
                        'Gagal memuat data kompetisi. Pastikan API aktif.' +
                        '</div>';
                });
        }

        document.addEventListener("DOMContentLoaded", function() {
    loadCompetitions("Non-Academic");
});
    </script>
</body>
</html>