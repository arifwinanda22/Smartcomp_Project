<%--
    Document   : help
    Created on : 9 Dec 2024, 00.32.27
    Author     : arifwinanda
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="help.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <img src="../Image/gambar-removebg-preview.png" alt="Tree" width="60" height="60">
            <a class="navbar-brand">SmartComp</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="WEB-FILE/index.jsp">Home</a>
                    <a class="nav-link" href="about.jsp">About</a>
                    <a class="nav-link" href="WEB-FILE/help.jsp">Help</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Help Center Section -->
    <section class="content-wrap-help">
        <div class="help-header bg-emphasis text-black p-3">
            <h4 class="mx-20">Pusat Bantuan SmartComp</h4><br>
            <p>Selamat datang di Pusat Bantuan SmartComp! Di sini, kami siap membantu Anda untuk mendapatkan jawaban dan solusi atas pertanyaan atau kendala yang mungkin Anda alami saat menggunakan aplikasi SmartComp.</p>
            <p>SmartComp adalah aplikasi untuk membantu Anda mengakses berbagai layanan dan informasi terkait event, workshop, kompetisi, akademik, dan forum diskusi di dunia IT. Kami bertujuan untuk menyediakan platform yang nyaman dan mudah digunakan untuk meningkatkan pengalaman Anda dalam belajar dan berkolaborasi di dunia teknologi.</p>
        </div>
        <div class="input-group">
          <span class="input-group-text" id="search-icon">
              <i class="bi bi-search"></i>
          </span>
          <input class="form-control" type="search" placeholder="Ketuk untuk mencari" aria-label="Search">
      </div>
        <h6 class="mt-4">Topik populer</h6>
        <div class="accordion" id="accordionPanelsStayOpenExample">
            <c:forEach var="topic" items="${popularTopics}">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#${topic.id}" aria-expanded="false" aria-controls="${topic.id}">
                            ${topic.title}
                        </button>
                    </h2>
                    <div id="${topic.id}" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            ${topic.content}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
    <div class="call-center">
        <p>Tidak menemukan jawaban Anda?</p>
        <a href="contact.jsp">Hubungi Kami</a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <footer> &copy; 2024 SmartComp. All rights reserved.</footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
