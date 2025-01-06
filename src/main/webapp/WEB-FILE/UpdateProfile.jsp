<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile | SmartComp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://i.pinimg.com/564x/d9/b6/c1/d9b6c103d2b23d92820972245191951f.jpg" alt="SmartComp Logo" width="30" height="30" class="d-inline-block align-text-top">
                SmartComp
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-house"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-person"></i> My Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Profile Section -->
    <div class="container my-5">
        <div class="row">
            <div class="col-md-4">
                <!-- Profile Card -->
                <div class="card">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Profile Picture">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%= user.getFirstName() %> <%= user.getLastName() %></h5>
                        <p class="card-text"><%= user.getEmail() %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <!-- Update Form -->
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <h5>Update Profile</h5>
                    </div>
                    <div class="card-body">
                        <form action="updateProfile" method="post">
                            <div class="mb-3">
                                <label for="first-name" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="first-name" name="firstName" value="<%= user.getFirstName() %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="last-name" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="last-name" name="lastName" value="<%= user.getLastName() %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>">
                            </div>
                            <div class="mb-3">
                                <label for="soft-skills" class="form-label">Soft Skills</label>
                                <input type="text" class="form-control" id="soft-skills" name="softSkills" value="<%= user.getSoftSkills() %>">
                            </div>
                            <div class="mb-3">
                                <label for="hard-skills" class="form-label">Hard Skills</label>
                                <input type="text" class="form-control" id="hard-skills" name="hardSkills" value="<%= user.getHardSkills() %>">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 SmartComp. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
