<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Empowering Innovators</title>
    <!-- Google Fonts & Bootstrap Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Montaga&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ===== Base Reset ===== */
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

        /* ===== Navbar (Terkunci Rapi) ===== */
        .landing-navbar {
            background-color: #999ae6 !important;
            padding: 10px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        .brand-logo {
            width: 38px !important;
            height: 38px !important;
            max-width: 38px !important;
            max-height: 38px !important;
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
            transition: opacity 0.2s;
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

        /* ===== Hero Section ===== */
        .hero-section {
            flex: 1 0 auto;
            display: flex;
            align-items: center;
            padding: 60px 0;
        }

        .hero-badge {
            background-color: rgba(153, 154, 230, 0.2);
            color: #4b4fa2;
            font-weight: 600;
            font-size: 0.85rem;
            padding: 6px 14px;
            border-radius: 20px;
            display: inline-block;
        }

        .hero-title {
            font-size: 2.6rem;
            line-height: 1.25;
            color: #1f2040;
        }

        .highlight-text {
            color: #5c5fd2;
        }

        .hero-subtitle {
            font-size: 1rem;
            line-height: 1.7;
            color: #5f6377;
            max-width: 520px;
        }

        .btn-get-started {
            background-color: #999ae6 !important;
            color: #1f2040 !important;
            font-weight: 600;
            padding: 12px 28px;
            border-radius: 10px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            border: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 12px rgba(153, 154, 230, 0.35);
        }

        .btn-get-started:hover {
            background-color: #7b7cd6 !important;
            color: #ffffff !important;
            transform: translateY(-2px);
        }

        .btn-learn-more {
            background-color: transparent !important;
            color: #1f2040 !important;
            font-weight: 600;
            padding: 12px 24px;
            border-radius: 10px;
            border: 1px solid #d2d5e2 !important;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .btn-learn-more:hover {
            background-color: #edeef7 !important;
            color: #1f2040 !important;
        }

        /* Hero Image Card */
        .hero-image-card {
            background-color: #ffffff;
            border: 1px solid #eaebf2;
            border-radius: 20px;
            padding: 2.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 420px;
            width: 100%;
        }

        .hero-illustration {
            max-height: 280px;
            width: auto;
            object-fit: contain;
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
                        <a class="nav-link active" href="<%=request.getContextPath()%>/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/WEB-FILE/about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/WEB-FILE/help.jsp">Help</a>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <a class="btn-nav-login" href="<%=request.getContextPath()%>/WEB-FILE/loginPage.jsp">Sign In</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- ===== Hero Section ===== -->
    <main class="hero-section">
        <div class="container">
            <div class="row align-items-center g-5">
                
                <!-- Slogan & Intro Text -->
                <div class="col-12 col-lg-6 text-center text-lg-start">
                    <h1 class="hero-title fw-bold mb-3">
                        Welcome to <span class="highlight-text">SmartComp</span>
                    </h1>
                    <p class="hero-subtitle mb-4">
                        Empowering Future Innovators: wadah terpadu untuk mengasah keahlian digital lewat workshop interaktif dan menorehkan prestasi di panggung kompetisi bergengsi.
                    </p>
                    <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center justify-content-lg-start">
                        <a href="<%=request.getContextPath()%>/WEB-FILE/loginPage.jsp" class="btn-get-started">
                            Get Started <i class="bi bi-arrow-right ms-2"></i>
                        </a>
                        <a href="<%=request.getContextPath()%>/WEB-FILE/about.jsp" class="btn-learn-more">
                            Learn More
                        </a>
                    </div>
                </div>

                <!-- Hero Image Card -->
                <div class="col-12 col-lg-6 d-flex justify-content-center">
                    <div class="hero-image-card shadow-sm">
                        <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="SmartComp Illustration" class="img-fluid hero-illustration" onerror="this.src='https://placehold.co/350x350?text=SmartComp'">
                    </div>
                </div>

            </div>
        </div>
    </main>

    <!-- ===== Footer Multi-Kolom ===== -->
    <footer class="main-footer">
        <div class="footer-top py-5">
            <div class="container">
                <div class="row g-4">

                    <!-- Brand & Deskripsi -->
                    <div class="col-12 col-lg-4 pe-lg-5">
                        <div class="d-flex align-items-center gap-2 mb-3">
                            <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" class="brand-logo" width="36" height="36" onerror="this.src='https://placehold.co/36x36?text=SC'">
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
                            <li><a href="https://instagram.com" target="_blank" rel="noopener"><i class="bi bi-instagram me-1"></i> Instagram</a></li>
                            <li><a href="https://linkedin.com" target="_blank" rel="noopener"><i class="bi bi-linkedin me-1"></i> LinkedIn</a></li>
                            <li><a href="https://youtube.com" target="_blank" rel="noopener"><i class="bi bi-youtube me-1"></i> YouTube</a></li>
                            <li><a href="https://github.com" target="_blank" rel="noopener"><i class="bi bi-github me-1"></i> GitHub</a></li>
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
</body>
</html>