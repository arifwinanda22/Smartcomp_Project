<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Academic &amp; Competition Calendar</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FullCalendar v6 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    <!-- Custom CSS Terpisah -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/calendar.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-calendar sticky-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<%=request.getContextPath()%>/index.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" width="34" height="34" onerror="this.src='https://placehold.co/34x34?text=SC'">
                <span class="brand-name">SmartComp</span>
            </a>

            <div class="d-flex align-items-center gap-2 ms-auto">
                <a href="<%=request.getContextPath()%>/payment" class="nav-icon-btn" title="Keranjang">
                    <i class="bi bi-cart2"></i>
                </a>
                <button class="nav-icon-btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications" title="Notifikasi">
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

    <!-- Offcanvas Categories Drawer -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategories">
        <div class="offcanvas-header border-0 pb-0">
            <h5 class="offcanvas-title fw-semibold text-secondary">Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body p-3">
            <div class="card border rounded-3 overflow-hidden shadow-none">
                <ul class="list-group list-group-flush category-nav-list">
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/index.jsp" class="category-item-link"><i class="bi bi-house me-3"></i> Home</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/workshop" class="category-item-link"><i class="bi bi-gear me-3"></i> Workshop</a></li>
                    <li class="list-group-item py-3 active bg-primary"><a href="<%=request.getContextPath()%>/calendar" class="category-item-link text-white fw-bold"><i class="bi bi-calendar me-3"></i> Calendar</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/competition" class="category-item-link"><i class="bi bi-trophy me-3"></i> Competitions</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/forum" class="category-item-link"><i class="bi bi-chat-dots me-3"></i> Forum</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionAcademic.jsp" class="category-item-link"><i class="bi bi-mortarboard me-3"></i> Academic</a></li>
                    <li class="list-group-item py-3"><a href="<%=request.getContextPath()%>/WEB-FILE/CompetitionNonAcademic.jsp" class="category-item-link"><i class="bi bi-book me-3"></i> Non-Academic</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Main Container -->
    <main class="container py-4 flex-grow-1">
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-3">
            <div>
                <button type="button" class="btn btn-category-trigger mb-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories">
                    <i class="bi bi-grid-fill me-1"></i> Categories
                </button>
                <h3 class="fw-bold mb-1">Academic &amp; Event Calendar</h3>
                <p class="text-muted small mb-0">Pantau jadwal pelaksanaan workshop dan batas waktu penutupan lomba.</p>
            </div>

            <!-- Event Legend -->
            <div class="d-flex align-items-center gap-3 bg-white p-2 px-3 rounded-pill shadow-sm border">
                <div class="legend-item">
                    <span class="legend-dot ws"></span> Workshop
                </div>
                <div class="legend-item">
                    <span class="legend-dot comp"></span> Deadline Kompetisi
                </div>
            </div>
        </div>

        <!-- FullCalendar Render Box -->
        <div class="calendar-card">
            <div id="smartcomp-calendar"></div>
        </div>
    </main>

    <!-- Modal Detail Agenda yang Diklik -->
    <div class="modal fade" id="eventDetailModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header border-bottom-0 pb-0">
                    <span class="badge" id="modalBadge">Kategori</span>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-2">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="modal-event-icon" id="modalIcon">
                            <i class="bi bi-calendar-check"></i>
                        </div>
                        <div>
                            <h5 class="fw-bold mb-1" id="modalTitle">Judul Agenda</h5>
                            <span class="text-muted small" id="modalDate"><i class="bi bi-clock me-1"></i>Tanggal</span>
                        </div>
                    </div>

                    <div class="p-3 bg-light rounded-3 mb-3 border">
                        <div class="d-flex justify-content-between small py-1">
                            <span class="text-muted">Biaya / HTM:</span>
                            <span class="fw-bold text-primary" id="modalPrice">Rp 0</span>
                        </div>
                        <div class="d-flex justify-content-between small py-1">
                            <span class="text-muted">Tipe Program:</span>
                            <span class="fw-semibold" id="modalType">-</span>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <a href="#" id="modalDetailBtn" class="btn btn-primary py-2 fw-semibold">
                            <i class="bi bi-arrow-right-circle me-1"></i> Jelajahi &amp; Daftar
                        </a>
                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="downloadICal()">
                            <i class="bi bi-calendar-plus me-1"></i> Simpan ke Google / Apple Calendar (.ics)
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-auto py-3 bg-white border-top text-center text-muted small">
        Copyright &copy; 2026 SmartComp. All Rights Reserved.
    </footer>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var CTX = '<%=request.getContextPath()%>';
        var currentActiveEvent = null;

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('smartcomp-calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'id',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,listMonth'
                },
                buttonText: {
                    today: 'Hari Ini',
                    month: 'Bulan',
                    week: 'Minggu',
                    list: 'Daftar'
                },
                events: CTX + '/api/calendar-events',
                eventClick: function(info) {
                    info.jsEvent.preventDefault();
                    showEventModal(info.event);
                }
            });

            calendar.render();
        });

        function showEventModal(event) {
            currentActiveEvent = event;
            var props = event.extendedProps;

            document.getElementById('modalTitle').innerText = event.title;
            document.getElementById('modalDate').innerHTML = '<i class="bi bi-clock me-1"></i> ' + event.startStr;
            document.getElementById('modalType').innerText = props.category || 'Academic';
            
            var priceFormatted = props.price > 0 ? 'Rp ' + Number(props.price).toLocaleString('id-ID') : 'Gratis';
            document.getElementById('modalPrice').innerText = priceFormatted;

            var modalBadge = document.getElementById('modalBadge');
            var modalIcon = document.getElementById('modalIcon');
            var detailBtn = document.getElementById('modalDetailBtn');

            if (props.eventType === 'Workshop') {
                modalBadge.className = 'badge bg-primary-subtle text-primary border';
                modalBadge.innerText = 'Pelatihan Workshop';
                modalIcon.className = 'modal-event-icon bg-primary-subtle text-primary';
                modalIcon.innerHTML = '<i class="bi bi-mortarboard"></i>';
                detailBtn.href = CTX + props.detailUrl;
            } else {
                modalBadge.className = 'badge bg-warning-subtle text-warning-emphasis border';
                modalBadge.innerText = 'Batas Akhir Lomba';
                modalIcon.className = 'modal-event-icon bg-warning-subtle text-warning-emphasis';
                modalIcon.innerHTML = '<i class="bi bi-trophy"></i>';
                detailBtn.href = CTX + props.detailUrl;
            }

            var modalEl = document.getElementById('eventDetailModal');
            var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
            modal.show();
        }

        // Fitur Inovatif: Generate file .ics secara instan di sisi klien
        function downloadICal() {
            if (!currentActiveEvent) return;

            var dateRaw = currentActiveEvent.startStr.replace(/-/g, '');
            var title = currentActiveEvent.title;
            var icsContent = 
                "BEGIN:VCALENDAR\n" +
                "VERSION:2.0\n" +
                "PRODID:-//SmartComp//Academic Calendar//ID\n" +
                "BEGIN:VEVENT\n" +
                "SUMMARY:" + title + "\n" +
                "DTSTART;VALUE=DATE:" + dateRaw + "\n" +
                "DTEND;VALUE=DATE:" + dateRaw + "\n" +
                "DESCRIPTION:Agenda resmi platform SmartComp.\n" +
                "STATUS:CONFIRMED\n" +
                "END:VEVENT\n" +
                "END:VCALENDAR";

            var blob = new Blob([icsContent], { type: 'text/calendar;charset=utf-8' });
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.setAttribute('download', 'smartcomp-event.ics');
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    </script>
</body>
</html>