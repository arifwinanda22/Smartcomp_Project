<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - About Us</title>
    <!-- Google Fonts & Bootstrap Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Montaga&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fafbff;
            color: #1f2040;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* ===== Navbar ===== */
        .landing-navbar {
            background-color: #999ae6 !important;
            padding: 10px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        .brand-logo {
            width: 38px !important;
            height: 38px !important;
            object-fit: contain;
        }

        .brand-name {
            font-family: 'Montaga', serif;
            font-size: 1.4rem;
            font-weight: 700;
            color: #1f2040;
        }

        .landing-navbar .nav-link {
            color: #1f2040 !important;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 8px 14px !important;
        }

        .landing-navbar .nav-link:hover,
        .landing-navbar .nav-link.active {
            font-weight: 600;
            opacity: 0.85;
        }

        .btn-nav-login {
            background-color: #1f2040 !important;
            color: #ffffff !important;
            border-radius: 8px;
            padding: 7px 20px;
            font-size: 0.9rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.2s ease;
        }

        .btn-nav-login:hover {
            background-color: #34356b !important;
            color: #ffffff !important;
        }

        /* ===== About Hero Section ===== */
        .about-hero {
            padding: 60px 0 40px;
        }

        .hero-badge {
            background-color: rgba(153, 154, 230, 0.2);
            color: #4b4fa2;
            font-weight: 600;
            font-size: 0.85rem;
            padding: 6px 16px;
            border-radius: 20px;
            display: inline-block;
        }

        .about-title {
            font-size: 2.3rem;
            line-height: 1.3;
            color: #1f2040;
        }

        .about-description {
            font-size: 1.05rem;
            line-height: 1.8;
            color: #5f6377;
            max-width: 850px;
            margin: 0 auto;
        }

        /* ===== Stats Grid Section ===== */
        .stat-card {
            background-color: #ffffff;
            border: 1px solid #eaebf2;
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            height: 100%;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 24px rgba(31, 32, 64, 0.08);
        }

        .stat-number {
            font-size: 2.4rem;
            font-weight: 700;
            color: #5c5fd2;
            margin-bottom: 8px;
            line-height: 1;
        }

        .stat-label {
            font-size: 0.92rem;
            color: #6a6f8a;
            margin-bottom: 0;
            line-height: 1.5;
        }

        /* ===== Call to Action Banner ===== */
        .cta-banner {
            background: linear-gradient(135deg, #7b7cd6 0%, #5c5fd2 100%);
            border-radius: 20px;
            padding: 45px 30px;
            color: #ffffff;
            text-align: center;
            margin: 50px 0 20px;
        }

        .cta-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .btn-cta {
            background-color: #ffffff !important;
            color: #1f2040 !important;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 10px;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-cta:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }

        /* ===== Footer Multi-Kolom Gelap ===== */
        .main-footer {
            background-color: #23253a !important;
            color: #ffffff !important;
            font-size: 0.88rem;
            width: 100%;
            margin-top: auto;
        }

        .footer-top {
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .footer-brand-title {
            font-family: 'Montaga', serif;
            font-size: 1.35rem;
            font-weight: 700;
            color: #ffffff;
        }

        .footer-desc-text {
            color: #a4a9c4;
            font-size: 0.85rem;
            line-height: 1.7;
        }

        .footer-heading {
            font-size: 0.95rem;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 18px;
        }

        .footer-menu li,
        .footer-contact-info li {
            margin-bottom: 10px;
            color: #a4a9c4;
        }

        .footer-menu a {
            color: #a4a9c4 !important;
            text-decoration: none !important;
            transition: color 0.2s ease, transform 0.2s ease;
            display: inline-block;
        }

        .footer-menu a:hover {
            color: #ffffff !important;
            transform: translateX(4px);
        }

        .text-muted-address {
            font-size: 0.82rem;
            line-height: 1.6;
            color: #7d82a3;
        }

        .footer-bottom {
            background-color: #1b1d2e !important;
            font-size: 0.82rem;
            color: #797e9e;
        }

        .footer-bottom a {
            color: #797e9e !important;
            text-decoration: none !important;
        }

        .footer-bottom a:hover {
            color: #ffffff !important;
        }
    </style>
</head>
<body>

    <!-- ===== Navbar ===== -->
    <nav class="navbar navbar-expand-lg landing-navbar sticky-top">
        <div class="container px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="SmartComp Logo" class="brand-logo" width="38" height="38" onerror="this.src='https://placehold.co/38x38?text=SC'">
                <span class="brand-name">SmartComp</span>
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#landingNav" aria-controls="landingNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="bi bi-list fs-2 text-dark"></i>
            </button>

            <div class="collapse navbar-collapse" id="landingNav">
                <ul class="navbar-nav ms-auto align-items-center gap-3">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/help.jsp">Help</a>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <a class="btn-nav-login" href="<%=request.getContextPath()%>/WEB-FILE/loginPage.jsp">Sign In</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- ===== Main Content ===== -->
    <main class="flex-grow-1">
        <div class="container">

            <!-- Hero Section -->
            <section class="about-hero text-center">
                <span class="badge hero-badge mb-3">About SmartComp</span>
                <h1 class="about-title fw-bold mb-3">
                    The BIGGEST Workshop &amp; Competition Event in Indonesia
                </h1>
                <p class="about-description">
                    SMARTCOMP adalah platform edukasi dan kompetisi teknologi terdepan yang digagas oleh mahasiswa Indonesia. Melalui rangkaian program workshop interaktif, mentoring intensif, dan panggung kompetisi bergengsi, kami hadir untuk mencetak talenta digital yang siap berinovasi dan berkolaborasi nyata di industri teknologi.
                </p>
            </section>

            <!-- Statistik Grid -->
            <section class="py-4">
                <div class="row g-4 justify-content-center">
                    <div class="col-6 col-md-3">
                        <div class="stat-card">
                            <div class="stat-number">3,600+</div>
                            <p class="stat-label">Staf &amp; Mentor Berdedikasi</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="stat-card">
                            <div class="stat-number">78,000+</div>
                            <p class="stat-label">Pengunjung Aktif Tiap Tahun</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="stat-card">
                            <div class="stat-number">120+</div>
                            <p class="stat-label">Sponsor &amp; Media Partner</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="stat-card">
                            <div class="stat-number">400+</div>
                            <p class="stat-label">Perusahaan Berpartisipasi</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Call to Action Banner -->
            <section class="cta-banner shadow-sm">
                <h2 class="cta-title">Let's Join, Conquer The World!</h2>
                <p class="text-white-50 mb-4">Siapkan langkah pertamamu sekarang dan wujudkan potensimu bersama ribuan inovator muda lainnya.</p>
                <a href="<%=request.getContextPath()%>/WEB-FILE/dashboardUser.jsp" class="btn btn-cta">
                    Jelajahi Program <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </section>

        </div>
    </main>

    <!-- ===== Footer Multi-Kolom ===== -->
    <footer class="main-footer mt-5">
        <div class="footer-top py-5">
            <div class="container">
                <div class="row g-4">

                    <div class="col-12 col-lg-4 pe-lg-5">
                        <div class="d-flex align-items-center gap-2 mb-3">
                            <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" class="brand-logo" width="36" height="36" onerror="this.src='https://placehold.co/36x36?text=SC'">
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
                            <li><a href="https://instagram.com" target="_blank" rel="noopener"><i class="bi bi-instagram me-