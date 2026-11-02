<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --brand: #999AE6;
            --brand-dark: #6f70c9;
            --brand-soft: #eeeefc;
            --ink: #1e1f3b;
            --muted: #6b6d86;
            --footer-bg: #232540;
            --page-bg: #f8f8fd;
            --cream: #fbeee0;
        }
        * { box-sizing: border-box; }
        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--page-bg);
            color: var(--ink);
        }

        /* ================= NAVBAR ================= */
        .navbar { background: var(--brand); padding: .75rem 1.5rem; box-shadow: 0 2px 8px rgba(0,0,0,.08); }
        .navbar-brand { display: flex; align-items: center; gap: .6rem; color: #fff; font-weight: 600; }
        .navbar-brand img { height: 34px; width: 34px; border-radius: 50%; object-fit: cover; }
        .nav-search { flex: 0 1 460px; }
        .nav-search .input-group-text { background: #fff; border: none; color: var(--muted); }
        .nav-search .form-control { border: none; box-shadow: none; font-size: .9rem; }
        .nav-search .btn-search { background: var(--ink); color: #fff; font-weight: 500; border-radius: 0 6px 6px 0; }
        .nav-search .btn-search:hover { background: #2f3057; color: #fff; }
        .btn-icon {
            background: transparent; border: none; color: #fff; font-size: 1.2rem;
            width: 40px; height: 40px; border-radius: 50%;
            display: inline-flex; align-items: center; justify-content: center;
        }
        .btn-icon:hover { background: rgba(255,255,255,.2); color: #fff; }

        /* ================= HERO CAROUSEL ================= */
        .hero-wrap { max-width: 1140px; margin: 1.75rem auto 0; padding: 0 1rem; }
        #heroCarousel { border-radius: 24px; overflow: hidden; box-shadow: 0 12px 32px rgba(111,112,201,.18); }
        .hero-slide { position: relative; min-height: 380px; display: flex; align-items: center; overflow: hidden; }
        .hero-slide .row { width: 100%; margin: 0; }

        /* Slide 1: cream background tailored to the illustration */
        .hero-1 {
            background:
                radial-gradient(circle at 85% 20%, rgba(255,214,102,.45) 0, transparent 40%),
                radial-gradient(circle at 10% 90%, rgba(153,154,230,.30) 0, transparent 45%),
                linear-gradient(135deg, #fdf3e7 0%, #f9e6d2 100%);
        }
        .hero-1 .hero-img { mix-blend-mode: multiply; }  /* blends the image's cream edge into the background */
        .hero-2 { background: linear-gradient(135deg, #8d8ee0 0%, #b9b9f2 100%); color: #fff; }
        .hero-3 { background: linear-gradient(135deg, #2d2f55 0%, #5a5cb8 100%); color: #fff; }

        .hero-content { padding: 3rem 2rem 3rem 3.5rem; z-index: 2; }
        .hero-eyebrow {
            display: inline-flex; align-items: center; gap: .4rem;
            background: rgba(255,255,255,.7); color: var(--brand-dark);
            padding: .3rem .85rem; border-radius: 999px; font-size: .78rem; font-weight: 600; margin-bottom: 1rem;
        }
        .hero-2 .hero-eyebrow, .hero-3 .hero-eyebrow { background: rgba(255,255,255,.22); color: #fff; }
        .hero-title { font-size: 2.1rem; font-weight: 700; line-height: 1.25; margin-bottom: .75rem; }
        .hero-text { font-size: .95rem; opacity: .85; max-width: 440px; margin-bottom: 1.5rem; }
        .btn-hero {
            background: var(--ink); color: #fff; font-weight: 500; border-radius: 999px; padding: .6rem 1.6rem; border: none;
        }
        .btn-hero:hover { background: #33345f; color: #fff; }
        .hero-2 .btn-hero, .hero-3 .btn-hero { background: #fff; color: var(--ink); }
        .hero-2 .btn-hero:hover, .hero-3 .btn-hero:hover { background: var(--brand-soft); color: var(--ink); }

        .hero-visual { display: flex; align-items: center; justify-content: center; height: 100%; padding: 1rem; }
        .hero-img { width: 100%; max-width: 520px; height: auto; border-radius: 20px; }

        .hero-icons { position: relative; width: 300px; height: 280px; }
        .hero-icons .bubble {
            position: absolute; width: 96px; height: 96px; border-radius: 28px;
            background: rgba(255,255,255,.22); backdrop-filter: blur(6px);
            display: flex; align-items: center; justify-content: center; font-size: 2.6rem; color: #fff;
            box-shadow: 0 10px 24px rgba(0,0,0,.12);
            animation: floaty 4s ease-in-out infinite;
        }
        .hero-icons .b1 { top: 0; left: 20px; }
        .hero-icons .b2 { top: 40px; right: 0; width: 120px; height: 120px; font-size: 3.4rem; animation-delay: .6s; }
        .hero-icons .b3 { bottom: 0; left: 70px; animation-delay: 1.2s; }
        @keyframes floaty { 0%,100% { transform: translateY(0); } 50% { transform: translateY(-10px); } }

        .carousel-indicators { margin-bottom: 1rem; }
        .carousel-indicators [data-bs-target] {
            width: 10px; height: 10px; border-radius: 50%; border: none; background: var(--ink); opacity: .25;
        }
        .carousel-indicators .active { width: 28px; border-radius: 999px; opacity: .8; }
        .hero-2-active ~ .carousel-indicators [data-bs-target] { background: #fff; }
        .carousel-control-prev, .carousel-control-next { width: 56px; }
        .carousel-ctrl {
            width: 40px; height: 40px; border-radius: 50%; background: rgba(255,255,255,.9); color: var(--ink);
            display: inline-flex; align-items: center; justify-content: center; box-shadow: 0 4px 12px rgba(0,0,0,.15);
        }

        /* ================= SECTION HEAD ================= */
        .section-head { text-align: center; margin: 3rem 0 1.5rem; }
        .section-head h2 { font-size: 1.6rem; font-weight: 700; margin-bottom: .25rem; }
        .section-head p { color: var(--muted); font-size: .92rem; margin: 0; }

        .type-toggle {
            display: inline-flex; background: #ececf9; border-radius: 999px; padding: 4px; margin-top: 1.25rem;
        }
        .type-toggle button {
            border: none; background: transparent; color: var(--muted); font-weight: 600; font-size: .88rem;
            padding: .5rem 1.4rem; border-radius: 999px; transition: all .2s;
        }
        .type-toggle button.active { background: var(--brand); color: #fff; box-shadow: 0 4px 10px rgba(153,154,230,.5); }

        /* ================= CATEGORY STRIP ================= */
        .strip-wrap { max-width: 1140px; margin: 0 auto; padding: 0 1rem; position: relative; }
        .strip-title { display: flex; justify-content: space-between; align-items: center; margin-bottom: .75rem; }
        .strip-title h3 { font-size: 1.05rem; font-weight: 600; margin: 0; }
        .strip-arrows button {
            width: 34px; height: 34px; border-radius: 50%; border: 1px solid #dcdcf0; background: #fff; color: var(--ink);
        }
        .strip-arrows button:hover { background: var(--brand); color: #fff; border-color: var(--brand); }
        .category-strip {
            display: flex; gap: 1rem; overflow-x: auto; scroll-snap-type: x mandatory; padding: .5rem .25rem 1rem;
            scrollbar-width: none; cursor: grab;
        }
        .category-strip::-webkit-scrollbar { display: none; }
        .category-strip.dragging { cursor: grabbing; scroll-snap-type: none; user-select: none; }
        .cat-card {
            flex: 0 0 168px; scroll-snap-align: start; background: #fff; border: 2px solid transparent;
            border-radius: 18px; padding: 1.1rem 1rem; text-align: left; box-shadow: 0 2px 10px rgba(30,31,59,.06);
            transition: all .2s; display: flex; flex-direction: column; gap: .6rem;
        }
        .cat-card:hover { transform: translateY(-3px); box-shadow: 0 8px 18px rgba(111,112,201,.2); }
        .cat-card.active { border-color: var(--brand); background: var(--brand-soft); }
        .cat-icon {
            width: 44px; height: 44px; border-radius: 12px; background: var(--brand-soft); color: var(--brand-dark);
            display: flex; align-items: center; justify-content: center; font-size: 1.3rem;
        }
        .cat-card.active .cat-icon { background: var(--brand); color: #fff; }
        .cat-name { font-weight: 600; font-size: .9rem; line-height: 1.2; }
        .cat-count { font-size: .76rem; color: var(--muted); }

        /* ================= KIND FILTER ================= */
        .kind-filter { display: flex; gap: .5rem; justify-content: center; flex-wrap: wrap; margin: .5rem 0 1.75rem; }
        .kind-filter button {
            border: 1px solid #dcdcf0; background: #fff; color: var(--muted); font-size: .84rem; font-weight: 500;
            border-radius: 999px; padding: .4rem 1.1rem; display: inline-flex; align-items: center; gap: .4rem;
        }
        .kind-filter button.active { background: var(--ink); border-color: var(--ink); color: #fff; }

        /* ================= COURSE CARDS ================= */
        .cards-wrap {
    max-width: 1140px;
    margin: 0 auto;
    padding: 0 1rem 3.5rem;
}

.course-card {
    background: #fff;
    border: none;
    border-radius: 18px;
    overflow: hidden;
    height: 100%;
    box-shadow: 0 2px 12px rgba(30, 31, 59, .07);
    transition: transform .2s, box-shadow .2s;
    display: flex;
    flex-direction: column;
}

.course-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 14px 28px rgba(111, 112, 201, .22);
}

.card-thumb {
    position: relative;
    height: 180px;
    overflow: hidden;
    background-color: #e9ecef;
}

.card-thumb-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    transition: transform 0.35s ease;
}

.course-card:hover .card-thumb-img {
    transform: scale(1.06);
}

.badge-cat {
    position: absolute;
    top: 12px;
    right: 12px;
    background: rgba(30, 31, 59, 0.85);
    backdrop-filter: blur(4px);
    color: #fff;
    font-size: .72rem;
    font-weight: 600;
    padding: .3rem .7rem;
    border-radius: 8px;
    z-index: 2;
}

.badge-kind {
    position: absolute;
    top: 12px;
    left: 12px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(4px);
    color: var(--brand-dark);
    font-size: .72rem;
    font-weight: 600;
    padding: .3rem .7rem;
    border-radius: 8px;
    display: inline-flex;
    align-items: center;
    gap: .3rem;
    z-index: 2;
}

.course-card .card-body {
    padding: 1.1rem 1.25rem 1.25rem;
    display: flex;
    flex-direction: column;
    flex: 1;
}

.card-title {
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: .4rem;
}

.card-desc {
    font-size: .84rem;
    color: var(--muted);
    margin-bottom: .9rem;
    flex: 1;
}

.card-meta {
    display: flex;
    justify-content: space-between;
    font-size: .78rem;
    color: var(--muted);
    margin-bottom: .9rem;
}

.card-meta i {
    margin-right: .3rem;
}

.card-foot {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #eeeef7;
    padding-top: .9rem;
}

.price {
    font-weight: 700;
    color: #4a4b9c;
    font-size: .95rem;
}

.btn-explore {
    background: var(--brand);
    color: #fff;
    font-weight: 600;
    font-size: .85rem;
    border: none;
    border-radius: 8px;
    padding: .45rem 1.1rem;
}

.btn-explore:hover {
    background: var(--brand-dark);
    color: #fff;
}

.empty-state {
    text-align: center;
    padding: 3rem 1rem;
    color: var(--muted);
}

.empty-state i {
    font-size: 3rem;
    color: #c9c9e6;
    display: block;
    margin-bottom: .5rem;
}

        /* ================= FOOTER ================= */
        .main-footer { background: var(--footer-bg); color: #c9cae6; }
        .footer-brand-title { color: #fff; font-weight: 600; font-size: 1.1rem; }
        .footer-desc-text { font-size: .85rem; line-height: 1.7; }
        .footer-title { color: #fff; font-weight: 600; font-size: .92rem; margin-bottom: 1rem; }
        .footer-menu li, .footer-contact-info li { margin-bottom: .55rem; font-size: .85rem; }
        .footer-menu a { color: #c9cae6; text-decoration: none; }
        .footer-menu a:hover { color: #fff; }
        .sub-footer { border-top: 1px solid rgba(255,255,255,.1); font-size: .8rem; }
        .sub-footer a { color: #c9cae6; text-decoration: none; }

        /* ================= OFFCANVAS ================= */
        .offcanvas .list-group-item { border: none; padding: .25rem 0; }
        .offcanvas .list-group-item .btn-link {
            color: var(--ink); text-decoration: none; font-weight: 500; border-radius: 10px; padding: .65rem .85rem;
        }
        .offcanvas .list-group-item .btn-link:hover { background: var(--brand-soft); color: var(--brand-dark); }
        .offcanvas .list-group-item .btn-link i { margin-right: .6rem; }
        .notification-card { border: none; background: var(--brand-soft); border-radius: 12px; }

        @media (max-width: 767px) {
            .hero-content { padding: 2rem 1.5rem 0; text-align: center; }
            .hero-text { margin-left: auto; margin-right: auto; }
            .hero-title { font-size: 1.6rem; }
            .hero-slide { min-height: 0; padding-bottom: 2.5rem; }
            .carousel-control-prev, .carousel-control-next { display: none; }
            .nav-search { order: 3; flex: 1 1 100%; margin-top: .6rem; }
        }
    </style>
</head>
<body>

    <!-- ================= NAVBAR ================= -->
    <nav class="navbar">
        <div class="container-fluid flex-wrap">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/WEB-FILE/dashboardUser.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="SmartComp Logo">
                <span>SmartComp</span>
            </a>

            <form class="d-flex nav-search" role="search" onsubmit="return false;">
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <input id="searchInput" class="form-control" type="search" placeholder="Search for competition or workshop" aria-label="Search">
                    <button class="btn btn-search" type="submit">Search</button>
                </div>
            </form>

            <div class="d-flex align-items-center gap-1">
                <button class="btn-icon" aria-label="Cart"><i class="bi bi-cart"></i></button>
                <button class="btn-icon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications" aria-label="Notifications">
                    <i class="bi bi-bell"></i>
                </button>
                <div class="dropdown">
                    <button class="btn-icon" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Profile">
                        <i class="bi bi-person-circle"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/WEB-FILE/Profile.jsp"><i class="bi bi-person me-2"></i>My Profile</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/WEB-FILE/UpdateProfile.jsp"><i class="bi bi-pencil-square me-2"></i>Update Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger fw-medium" href="<%=request.getContextPath()%>/logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- ================= NOTIFICATIONS ================= -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNotifications" aria-labelledby="offcanvasNotificationsLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasNotificationsLabel"><i class="bi bi-bell me-2"></i>Notifikasi</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <h6>Notifikasi</h6>
            <div class="card mb-3 p-2 notification-card">
                <h6>Dibuka pendaftaran lomba UI/UX</h6>
                <small class="text-muted">2 menit yang lalu</small>
            </div>
            <h6 class="mt-4">Pengingat Jadwal</h6>
            <div class="card mb-3 p-2 notification-card">
                <h6>Mentoring</h6>
                <small class="text-muted">29 Oktober 2077, 10:00 AM</small>
            </div>
            <h6 class="mt-4">Artikel Terkait</h6>
            <div class="card mb-3 p-2 notification-card">
                <h6>Mengenal Jenis-jenis Lomba dan Kriterianya</h6>
                <small class="text-muted">Panduan untuk memilih lomba yang tepat</small>
            </div>
            <h6 class="mt-4">Tips</h6>
            <div class="card mb-3 p-2 notification-card">
                <h6>Tips Produktivitas</h6>
                <small class="text-muted">5 cara meningkatkan fokus kerja</small>
            </div>
        </div>
    </div>

    <!-- ================= CATEGORIES MENU ================= -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel"><i class="bi bi-grid me-2"></i>Menu</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="list-group">
                <li class="list-group-item">
                    <button class="btn btn-link w-100 text-start" onclick="location.href='<%=request.getContextPath()%>/WEB-FILE/dashboardUser.jsp'">
                        <i class="bi bi-house-door"></i> Home
                    </button>
                </li>
                <li class="list-group-item">
                    <button class="btn btn-link w-100 text-start" onclick="location.href='<%=request.getContextPath()%>/WEB-FILE/WorkshopAcademic.jsp'">
                        <i class="bi bi-mortarboard"></i> Workshop
                    </button>
                </li>
                <li class="list-group-item">
                    <button class="btn btn-link w-100 text-start">
                        <i class="bi bi-calendar-event"></i> Calendar
                    </button>
                </li>
                <li class="list-group-item">
                    <button class="btn btn-link w-100 text-start" onclick="location.href='<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp'">
                        <i class="bi bi-trophy"></i> Competitions
                    </button>
                </li>
                <li class="list-group-item">
                    <button class="btn btn-link w-100 text-start" onclick="location.href='<%=request.getContextPath()%>/WEB-FILE/forum.jsp'">
                        <i class="bi bi-chat-dots"></i> Forum
                    </button>
                </li>
                <li class="list-group-item mt-2 pt-2 border-top">
                    <a href="<%=request.getContextPath()%>/logout" class="btn btn-link w-100 text-start text-danger">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- ================= HERO CAROUSEL ================= -->
    <section class="hero-wrap">
        <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5500" data-bs-touch="true">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <div class="carousel-inner">
                <!-- Slide 1 : ilustrasi utama -->
                <div class="carousel-item active">
                    <div class="hero-slide hero-1">
                        <div class="row align-items-center">
                            <div class="col-md-6 hero-content">
                                <span class="hero-eyebrow"><i class="bi bi-stars"></i> Platform pengembangan skill</span>
                                <h1 class="hero-title">Asah Hard Skill &amp; Soft Skill dalam Satu Tempat</h1>
                                <p class="hero-text">Temukan workshop dan lomba yang paling cocok dengan skill yang kamu miliki, lalu tumbuh bersama SmartComp.</p>
                                <a href="#explore" class="btn btn-hero">Mulai Jelajahi <i class="bi bi-arrow-right ms-1"></i></a>
                            </div>
                            <div class="col-md-6">
                                <div class="hero-visual">
                                    <!-- Simpan ilustrasi di /resources/images/hero-illustration.jpg -->
                                    <img class="hero-img" src="<%=request.getContextPath()%>/resources/images/Study-illustration.jpg" alt="Belajar dan berkembang">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Slide 2 : competition -->
                <div class="carousel-item">
                    <div class="hero-slide hero-2">
                        <div class="row align-items-center">
                            <div class="col-md-6 hero-content">
                                <span class="hero-eyebrow"><i class="bi bi-trophy"></i> Competition</span>
                                <h2 class="hero-title">Uji Kemampuanmu di Lomba Akademik &amp; Non-Akademik</h2>
                                <p class="hero-text">Dari hackathon hingga lomba kreatif, bangun portofolio dan raih pengalaman nyata.</p>
                                <a href="#explore" class="btn btn-hero" data-jump-kind="competition">Lihat Competition <i class="bi bi-arrow-right ms-1"></i></a>
                            </div>
                            <div class="col-md-6">
                                <div class="hero-visual">
                                    <div class="hero-icons">
                                        <div class="bubble b1"><i class="bi bi-code-slash"></i></div>
                                        <div class="bubble b2"><i class="bi bi-trophy-fill"></i></div>
                                        <div class="bubble b3"><i class="bi bi-lightbulb"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Slide 3 : workshop -->
                <div class="carousel-item">
                    <div class="hero-slide hero-3">
                        <div class="row align-items-center">
                            <div class="col-md-6 hero-content">
                                <span class="hero-eyebrow"><i class="bi bi-mortarboard"></i> Workshop</span>
                                <h2 class="hero-title">Perdalam Skill Lewat Workshop Pilihan</h2>
                                <p class="hero-text">Workshop direkomendasikan sesuai hard skill dan soft skill yang sudah kamu tambahkan di profil.</p>
                                <a href="#explore" class="btn btn-hero" data-jump-kind="workshop">Lihat Workshop <i class="bi bi-arrow-right ms-1"></i></a>
                            </div>
                            <div class="col-md-6">
                                <div class="hero-visual">
                                    <div class="hero-icons">
                                        <div class="bubble b1"><i class="bi bi-people"></i></div>
                                        <div class="bubble b2"><i class="bi bi-mortarboard-fill"></i></div>
                                        <div class="bubble b3"><i class="bi bi-mic"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                <span class="carousel-ctrl"><i class="bi bi-chevron-left"></i></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                <span class="carousel-ctrl"><i class="bi bi-chevron-right"></i></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <!-- ================= MAIN ================= -->
    <main id="explore">
        <div class="section-head">
            <button class="btn btn-sm mb-3 px-3 fw-semibold" style="background:var(--brand);color:#fff;border-radius:8px;"
                    data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling">
                <i class="bi bi-grid-fill me-1"></i> Categories
            </button>
            <h2>Recommended Workshop &amp; Competition</h2>
            <p id="sectionSubtitle">All the skills you need in one structured platform</p>

            <div class="type-toggle" role="group" aria-label="Filter type">
                <button type="button" class="active" data-type="academic">Academic</button>
                <button type="button" data-type="nonacademic">Non-Academic</button>
            </div>
        </div>

        <!-- Category strip (bisa digeser) -->
        <div class="strip-wrap">
            <div class="strip-title">
                <h3>Kategori Pembelajaran</h3>
                <div class="strip-arrows">
                    <button type="button" id="stripPrev" aria-label="Geser kiri"><i class="bi bi-chevron-left"></i></button>
                    <button type="button" id="stripNext" aria-label="Geser kanan"><i class="bi bi-chevron-right"></i></button>
                </div>
            </div>
            <div class="category-strip" id="categoryStrip"></div>
        </div>

        <!-- Filter workshop / competition -->
        <div class="kind-filter" id="kindFilter">
            <button type="button" class="active" data-kind="all"><i class="bi bi-grid"></i> Semua</button>
            <button type="button" data-kind="workshop"><i class="bi bi-mortarboard"></i> Workshop</button>
            <button type="button" data-kind="competition"><i class="bi bi-trophy"></i> Competition</button>
        </div>

        <!-- Cards -->
        <div class="cards-wrap">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="cardGrid"></div>
            <div class="empty-state d-none" id="emptyState">
                <i class="bi bi-search"></i>
                Belum ada workshop atau competition untuk filter ini.
            </div>
        </div>
    </main>

    <!-- ================= FOOTER ================= -->
    <footer class="main-footer">
        <div class="container py-5">
            <div class="row g-4">
                <div class="col-12 col-lg-4 pe-lg-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="38" height="38">
                        <span class="footer-brand-title">SmartComp.</span>
                    </div>
                    <p class="footer-desc-text">
                        Platform workshop dan kompetisi teknologi terdepan untuk mahasiswa Indonesia. Wadah berbagi inovasi, asah keahlian, dan bangun portofolio nyata.
                    </p>
                </div>
                <div class="col-6 col-sm-3 col-lg-2">
                    <h6 class="footer-title">Company</h6>
                    <ul class="list-unstyled footer-menu">
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/dashboardUser.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/about.jsp">About Us</a></li>
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp">Competition</a></li>
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/WorkshopAcademic.jsp">Workshop</a></li>
                    </ul>
                </div>
                <div class="col-6 col-sm-3 col-lg-2">
                    <h6 class="footer-title">Services</h6>
                    <ul class="list-unstyled footer-menu">
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/Profile.jsp">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/payment">Transactions</a></li>
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/help.jsp">FAQ &amp; Help</a></li>
                        <li><a href="<%=request.getContextPath()%>/WEB-FILE/help.jsp">Terms of Use</a></li>
                    </ul>
                </div>
                <div class="col-6 col-sm-3 col-lg-2">
                    <h6 class="footer-title">Social Media</h6>
                    <ul class="list-unstyled footer-menu">
                        <li><a href="https://instagram.com" target="_blank" rel="noopener"><i class="bi bi-instagram me-1"></i> Instagram</a></li>
                        <li><a href="https://linkedin.com" target="_blank" rel="noopener"><i class="bi bi-linkedin me-1"></i> LinkedIn</a></li>
                        <li><a href="https://youtube.com" target="_blank" rel="noopener"><i class="bi bi-youtube me-1"></i> YouTube</a></li>
                        <li><a href="https://github.com" target="_blank" rel="noopener"><i class="bi bi-github me-1"></i> GitHub</a></li>
                    </ul>
                </div>
                <div class="col-6 col-sm-3 col-lg-2">
                    <h6 class="footer-title">Contact Info</h6>
                    <ul class="list-unstyled footer-contact-info">
                        <li>+62 812-3456-7890</li>
                        <li>support@smartcomp.id</li>
                        <li class="mt-2">Jl. Telekomunikasi No. 1, Terusan Buahbatu, Bandung, 40257</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="sub-footer py-3">
            <div class="container d-flex flex-column flex-sm-row justify-content-between align-items-center gap-2">
                <span>Copyright &copy; 2026 SmartComp. All Rights Reserved.</span>
                <div>
                    <span class="me-3">Indonesia | IDR</span>
                    <a href="<%=request.getContextPath()%>/WEB-FILE/help.jsp">Privacy Policy</a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        /* ============================================================
           DATA CONTOH.
           Ganti dengan data dari database (misalnya lewat servlet yang
           mengirim JSON, atau render dengan scriptlet JSP).
           kind: workshop | competition   type: academic | nonacademic
           ============================================================ */
        const CATEGORIES = {
            academic: [
                { id: 'programming', name: 'Programming',      icon: 'bi-code-slash' },
                { id: 'design',      name: 'UI/UX & Design',   icon: 'bi-vector-pen' },
                { id: 'data',        name: 'Data & AI',        icon: 'bi-bar-chart-line' },
                { id: 'network',     name: 'Network & Security', icon: 'bi-shield-lock' },
                { id: 'research',    name: 'Riset & Karya Tulis', icon: 'bi-journal-text' }
            ],
            nonacademic: [
                { id: 'softskill',   name: 'Soft Skill',       icon: 'bi-chat-heart' },
                { id: 'creative',    name: 'Creative Art',     icon: 'bi-camera' },
                { id: 'leadership',  name: 'Leadership',       icon: 'bi-people' },
                { id: 'career',      name: 'Career Prep',      icon: 'bi-briefcase' },
                { id: 'media',       name: 'Audio & Media',    icon: 'bi-mic' }
            ]
        };

      const ITEMS = [
    // ---- Academic ----
    { kind:'workshop',    type:'academic',    cat:'programming', title:'Java Programming for Beginners',    desc:'Dasar OOP, struktur data, dan membangun project Java pertamamu.', date:'2026-10-30', quota:120, price:25000, image:'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=600&q=80' },
    { kind:'competition', type:'academic',    cat:'programming', title:'National Hackathon 2026',           desc:'Bangun solusi digital untuk masalah nyata dalam 48 jam.',        date:'2026-11-15', quota:200, price:50000, image:'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'academic',    cat:'design',      title:'UI/UX Designer in 30 Days',         desc:'Riset pengguna, wireframe, hingga prototype interaktif.',        date:'2026-11-02', quota:80,  price:35000, image:'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?auto=format&fit=crop&w=600&q=80' },
    { kind:'competition', type:'academic',    cat:'design',      title:'UI/UX Design Competition',          desc:'Rancang aplikasi yang solutif dan presentasikan ke juri industri.', date:'2026-11-20', quota:150, price:40000, image:'https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'academic',    cat:'data',        title:'AI Evaluate',                       desc:'Cara menguji dan mengevaluasi model AI secara terukur.',         date:'2026-11-05', quota:100, price:30000, image:'https://ftmm.unair.ac.id/wp-content/uploads/2026/04/Screenshot-2026-04-22-155630.png' },
    { kind:'competition', type:'academic',    cat:'data',        title:'Data Science Challenge',            desc:'Analisis dataset nyata dan buat prediksi terbaik.',              date:'2026-12-01', quota:120, price:45000, image:'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'academic',    cat:'network',     title:'Cyber Security Essentials',         desc:'Mengenal ancaman umum dan cara mengamankan aplikasi web.',       date:'2026-11-09', quota:90,  price:40000, image:'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=600&q=80' },
    { kind:'competition', type:'academic',    cat:'research',    title:'Lomba Karya Tulis Ilmiah',          desc:'Tulis gagasan inovatif dan bersaing di tingkat nasional.',       date:'2026-12-10', quota:300, price:0,     image:'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?auto=format&fit=crop&w=600&q=80' },

    // ---- Non-Academic ----
    { kind:'workshop',    type:'nonacademic', cat:'softskill',   title:'Public Speaking & Effective Pitching', desc:'Kuasai teknik berbicara di depan audiens dan cara pitching ide inovatif.', date:'2026-11-03', quota:60, price:75000, image:'https://images.unsplash.com/photo-1475721027785-f74eccf877e2?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'nonacademic', cat:'creative',    title:'Photography & Creative Content',    desc:'Komposisi visual, pencahayaan kamera, dan kurasi konten sosial media.', date:'2026-11-12', quota:50, price:90000, image:'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=600&q=80' },
    { kind:'competition', type:'nonacademic', cat:'creative',    title:'Short Video Creative Contest',      desc:'Ceritakan idemu dalam video pendek yang berkesan.',              date:'2026-12-05', quota:250, price:20000, image:'https://images.unsplash.com/photo-1536240478700-b869070f9279?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'nonacademic', cat:'leadership',  title:'Student Leadership & Team Dynamics', desc:'Strategi mengelola tim organisasi, resolusi konflik, dan eksekusi program kerja.', date:'2026-11-18', quota:70, price:0, image:'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=600&q=80' },
    { kind:'competition', type:'nonacademic', cat:'leadership',  title:'Debat & Kepemimpinan Mahasiswa',    desc:'Adu argumen dan kepemimpinan dalam format debat nasional.',      date:'2026-12-14', quota:96,  price:30000, image:'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'nonacademic', cat:'career',      title:'Personal Branding on LinkedIn & Career Prep', desc:'Bangun reputasi profesional sejak bangku kuliah dan optimasi profil.', date:'2026-11-22', quota:80, price:50000, image:'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=600&q=80' },
    { kind:'workshop',    type:'nonacademic', cat:'media',       title:'Audio Editing & Podcasting Fundamentals', desc:'Rekaman audio bersih, mixing suara, dan penerbitan podcast.', date:'2026-11-25', quota:40, price:65000, image:'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?auto=format&fit=crop&w=600&q=80' }
];

        /* ================= STATE ================= */
        const state = { type: 'academic', cat: 'all', kind: 'all', q: '' };

        const strip = document.getElementById('categoryStrip');
        const grid  = document.getElementById('cardGrid');
        const empty = document.getElementById('emptyState');

        const rupiah = n => n === 0 ? 'Gratis' : 'Rp ' + n.toLocaleString('id-ID');
        const esc = s => String(s).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));

        /* ================= RENDER ================= */
        function renderCategories() {
            const cats = CATEGORIES[state.type];
            const countOf = id => ITEMS.filter(i => i.type === state.type && (id === 'all' || i.cat === id)).length;

            let html = `
                <button type="button" class="cat-card ${state.cat === 'all' ? 'active' : ''}" data-cat="all">
                    <span class="cat-icon"><i class="bi bi-grid"></i></span>
                    <span class="cat-name">Semua Kategori</span>
                    <span class="cat-count">${countOf('all')} program</span>
                </button>`;
            cats.forEach(c => {
                html += `
                <button type="button" class="cat-card ${state.cat === c.id ? 'active' : ''}" data-cat="${c.id}">
                    <span class="cat-icon"><i class="bi ${c.icon}"></i></span>
                    <span class="cat-name">${esc(c.name)}</span>
                    <span class="cat-count">${countOf(c.id)} program</span>
                </button>`;
            });
            strip.innerHTML = html;
        }

        function renderCards() {
    const q = state.q.trim().toLowerCase();
    const catName = id => (CATEGORIES[state.type].find(c => c.id === id) || {}).name || '';

    const list = ITEMS.filter(i =>
        i.type === state.type &&
        (state.cat === 'all' || i.cat === state.cat) &&
        (state.kind === 'all' || i.kind === state.kind) &&
        (!q || (i.title + ' ' + i.desc + ' ' + catName(i.cat)).toLowerCase().includes(q))
    );

    grid.innerHTML = list.map(i => `
        <div class="col">
            <div class="course-card">
                <div class="card-thumb">
                    <img src="${i.image}" alt="${esc(i.title)}" class="card-thumb-img" loading="lazy" onerror="this.src='https://placehold.co/600x400?text=SmartComp'">
                    <span class="badge-kind"><i class="bi ${i.kind === 'workshop' ? 'bi-mortarboard' : 'bi-trophy'}"></i>${i.kind === 'workshop' ? 'Workshop' : 'Competition'}</span>
                    <span class="badge-cat">${esc(catName(i.cat))}</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">${esc(i.title)}</h5>
                    <p class="card-desc">${esc(i.desc)}</p>
                    <div class="card-meta">
                        <span><i class="bi bi-calendar-event"></i>${esc(i.date)}</span>
                        <span><i class="bi bi-people"></i>Kuota: ${i.quota}</span>
                    </div>
                    <div class="card-foot">
                        <span class="price">${rupiah(i.price)}</span>
                        <a href="#" class="btn btn-explore">Jelajahi</a>
                    </div>
                </div>
            </div>
        </div>`).join('');

    empty.classList.toggle('d-none', list.length > 0);
}

        function renderAll() { renderCategories(); renderCards(); }

        /* ================= EVENTS ================= */
        // Academic / Non-Academic
        document.querySelectorAll('.type-toggle button').forEach(btn => {
            btn.addEventListener('click', () => {
                document.querySelectorAll('.type-toggle button').forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                state.type = btn.dataset.type;
                state.cat = 'all';
                document.getElementById('sectionSubtitle').textContent = state.type === 'academic'
                    ? 'All the skills you need in one structured platform'
                    : 'Develop soft skills, creative arts, and non-academic leadership';
                strip.scrollTo({ left: 0, behavior: 'smooth' });
                renderAll();
            });
        });

        // Workshop / Competition filter
        function setKind(kind) {
            state.kind = kind;
            document.querySelectorAll('#kindFilter button').forEach(b => b.classList.toggle('active', b.dataset.kind === kind));
            renderCards();
        }
        document.querySelectorAll('#kindFilter button').forEach(btn => btn.addEventListener('click', () => setKind(btn.dataset.kind)));
        document.querySelectorAll('[data-jump-kind]').forEach(a => a.addEventListener('click', () => setKind(a.dataset.jumpKind)));

        // Category click (diabaikan kalau user sedang drag)
        let dragMoved = false;
        strip.addEventListener('click', e => {
            if (dragMoved) return;
            const card = e.target.closest('.cat-card');
            if (!card) return;
            state.cat = card.dataset.cat;
            renderAll();
        });

        // Search
        document.getElementById('searchInput').addEventListener('input', e => { state.q = e.target.value; renderCards(); });

        // Drag-to-scroll + tombol panah untuk category strip
        (function () {
            let down = false, startX = 0, startLeft = 0;
            strip.addEventListener('pointerdown', e => {
                if (e.pointerType === 'touch') return; // sentuh sudah native
                down = true; dragMoved = false; startX = e.clientX; startLeft = strip.scrollLeft;
            });
            window.addEventListener('pointermove', e => {
                if (!down) return;
                const dx = e.clientX - startX;
                if (Math.abs(dx) > 5) { dragMoved = true; strip.classList.add('dragging'); }
                strip.scrollLeft = startLeft - dx;
            });
            window.addEventListener('pointerup', () => {
                if (!down) return;
                down = false; strip.classList.remove('dragging');
                setTimeout(() => dragMoved = false, 0);
            });
            document.getElementById('stripPrev').addEventListener('click', () => strip.scrollBy({ left: -360, behavior: 'smooth' }));
            document.getElementById('stripNext').addEventListener('click', () => strip.scrollBy({ left:  360, behavior: 'smooth' }));
        })();

        renderAll();
    </script>
</body>
</html>
