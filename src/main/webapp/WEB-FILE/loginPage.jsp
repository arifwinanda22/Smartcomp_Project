<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %><%@page import="com.example.classes.Login"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/loginPage.css">
    <title>SmartComp - Login</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Montaga&display=swap" rel="stylesheet">
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://i.pinimg.com/564x/d9/b6/c1/d9b6c103d2b23d92820972245191951f.jpg" alt="SmartComp Logo">
                <span class="brand-name">SmartComp</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <ul class="nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="content container mt-5 d-flex justify-content-center align-items-center">
        <div class="row w-100">
            <div class="col-md-6">
                <div class="login-card p-4 shadow">
                    <h2 class="text-center mb-4">Login</h2>

                    <% if (request.getAttribute("successMessage") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("successMessage") %>
                        </div>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("errorMessage") %>
                        </div>
                    <% } %>

                    <!-- Login Form -->
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Sign In</button>
                    </form>
                    <p class="text-center mt-3">Don't have an account yet? <a href="signup.jsp">Sign up</a></p>
                    <p class="text-center"><a href="#">Forgot password?</a></p>
                </div>
            </div>
            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <img src="https://i.pinimg.com/564x/78/79/6d/78796d07e4792bb818cb079a1b57a791.jpg" alt="Learning Illustration" class="img-fluid">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer text-center text-white">
        <div class="container">
            &copy; 2024 SmartComp. All rights reserved.
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
