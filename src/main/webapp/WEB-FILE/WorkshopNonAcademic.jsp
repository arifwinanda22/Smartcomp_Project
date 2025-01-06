<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="WorkshopNonAcademic.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://i.pinimg.com/564x/d9/b6/c1/d9b6c103d2b23d92820972245191951f.jpg" alt="SmartComp Logo" class="logo">
                <span>SmartComp</span>
            </a>

            <form class="d-flex w-50">
                <div class="input-group">
                    <span class="input-group-text" id="search-icon">
                        <i class="bi bi-search"></i>
                    </span>
                    <input class="form-control" type="search" placeholder="Search for competition or workshop" aria-label="Search">
                </div>
                <button class="btn btn-outline-success ms-2" type="submit">Search</button>
            </form>

            <div class="d-flex align-items-center">
                <button class="btn btn-custom me-2"><i class="bi bi-cart"></i></button>
                <button class="btn btn-custom me-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNotifications">
                    <i class="bi bi-bell"></i>
                </button>

                <div class="btn-group">
                    <button type="button" class="btn btn-custom"><i class="bi bi-person"></i></button>
                    <button type="button" class="btn btn-custom dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">My Profile</a></li>
                        <li><a class="dropdown-item" href="#">Update Profile</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>


<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNotifications" aria-labelledby="offcanvasNotificationsLabel">
    <div class="offcanvas-header">
        <h5 id="offcanvasNotificationsLabel">Notifikasi</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <!-- Section Notifikasi -->
        <h6>Notifikasi</h6>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Dibuka pendaftaran lomba UI/UX</h6>
            <small class="text-muted">2 menit yang lalu</small>
        </div>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Dibuka pendaftaran lomba UI/UX</h6>
            <small class="text-muted">2 menit yang lalu</small>
        </div>

        <!-- Section Pengingat Jadwal -->
        <h6 class="mt-4">Pengingat Jadwal</h6>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Mentoring</h6>
            <small class="text-muted">29 Oktober 2077, 10:00 AM</small>
        </div>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Mentoring</h6>
            <small class="text-muted">29 Oktober 2077, 10:00 AM</small>
        </div>

        <!-- Section Artikel Terkait -->
        <h6 class="mt-4">Artikel Terkait</h6>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Mengenal Jenis-jenis Lomba dan Kriterianya</h6>
            <small class="text-muted">Panduan untuk memilih lomba yang tepat</small>
        </div>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Mengenal Jenis-jenis Lomba dan Kriterianya</h6>
            <small class="text-muted">Panduan untuk memilih lomba yang tepat</small>
        </div>

        <!-- Section Tips -->
        <h6 class="mt-4">Tips</h6>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Tips Produktivitas</h6>
            <small class="text-muted">5 cara meningkatkan fokus kerja</small>
        </div>
        <div class="card mb-3 p-2 shadow-sm notification-card">
            <h6>Tips Produktivitas</h6>
            <small class="text-muted">5 cara meningkatkan fokus kerja</small>
        </div>
    </div>
</div>

<div class="categories-btn-container">
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">Categories</button>
</div>


<!--div class="carousel-container">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://i.pinimg.com/564x/a4/b2/db/a4b2db41bc119f3b0d78721cdab179fd.jpg" class="d-block w-100" alt="carouselIcon">
            </div>
            <div class="carousel-item">
                <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div-->

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Categories</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="list-group">
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-house-door"></i> Home
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-gear"></i> Workshop
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-calendar"></i> Calendar
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-trophy"></i> Competitions
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-chat-dots"></i> Forum
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-mortarboard"></i> Academic
                </button>
            </li>
            <li class="list-group-item">
                <button class="btn btn-link w-100 text-start">
                    <i class="bi bi-book"></i> Non-Academic
                </button>
            </li>
        </ul>
    </div>
</div>



        <div class="text-center mt-5">
            <p>Recommended Workshop and Competition from us <br> All the skills you need in one place</p>
            <button class="btn btn-secondary">Academic</button>
            <button class="btn btn-light">Non-Academic</button>
        </div>

        <div class="container mt-5" style="min-height: 100vh;">
            <!-- Row for 3 cards -->
            <div class="row justify-content-center">
                <!-- Card 1 -->
                <div class="col-md-4">
                    <div class="card" style="max-width: 18rem; max-height: 300px; overflow-y: auto;">
                        <img src="https://i.pinimg.com/564x/cc/27/2e/cc272e5581bbd170b5cf1b62f92ab5df.jpg" class="card-img-top" alt="pubgMobile">
                        <div class="card-body p-3 text-center">
                            <h5 class="card-title">PUBG Tutorial For 30 days</h5>
                            <a href="#" class="btn btn-primary mt-5">Jelajahi</a>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-md-4">
                    <div class="card" style="max-width: 18rem; max-height: 300px; overflow-y: auto;">
                        <img src="https://i.pinimg.com/564x/31/89/19/31891953c5805b3b27693e3aa3350811.jpg" class="card-img-top" alt="running">
                        <div class="card-body p-3 text-center">
                            <h5 class="card-title">Ultimate Guide For Running from Beginners to Experts</h5>
                            <a href="#" class="btn btn-primary mt-4">Jelajahi</a>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col-md-4">
                    <div class="card" style="max-width: 18rem; max-height: 300px; overflow-y: auto;">
                        <img src="https://i.pinimg.com/564x/51/9f/c6/519fc6cef4035bd7d4fd3cae6afdb2ce.jpg" class="card-img-top" alt="boxing">
                        <div class="card-body p-3 text-center">
                            <h5 class="card-title text-center">Learn Boxing For 30 days</h5>
                            <a href="#" class="btn btn-primary mt-4">Jelajahi</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Row for 2 cards -->
            <div class="row justify-content-center mt-4">
                <!-- Card 4 -->
                <div class="col-md-4">
                    <div class="card" style="max-width: 18rem; max-height: 300px; overflow-y: auto;">
                        <img src="https://i.pinimg.com/736x/89/3e/81/893e814078618d295f4daaa2cc831a52.jpg" class="card-img-top" alt="guitar">
                        <div class="card-body p-3 text-center">
                            <h5 class="card-title">Complete Guitar Lesson Systems</h5>
                            <a href="#" class="btn btn-primary mt-5">Jelajahi</a>
                        </div>
                    </div>
                </div>
                <!-- Card 5 -->
                <div class="col-md-4">
                    <div class="card" style="max-width: 18rem; max-height: 300px; overflow-y: auto;">
                        <img src="https://i.pinimg.com/564x/c2/44/20/c244205784bd56cea117916b1b0014df.jpg" class="card-img-top" alt="photographer">
                        <div class="card-body p-3 text-center">
                            <h5 class="card-title">Photography-Become a Great Photographer</h5>
                            <a href="#" class="btn btn-primary mt-4">Jelajahi</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="mt-5 bg-custom text-black text-center p-3">
                <p>&copy; 2024 SmartComp. All rights reserved.</p>
            </footer>
        </div>


</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</html>
