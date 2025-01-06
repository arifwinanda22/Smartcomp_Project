<%@ page import="com.example.classes.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Ambil data user dari object User yang sudah tersimpan di session
    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    String email = user.getEmail();
    String phone = user.getPhone() != null ? user.getPhone() : "-";
    String softSkills = user.getSoftSkills() != null ? user.getSoftSkills() : "-";
    String hardSkills = user.getHardSkills() != null ? user.getHardSkills() : "-";
%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="profile.css">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="profile-container bg-white p-4 rounded shadow">
        <div class="profile-header d-flex align-items-center mb-4">
            <div class="profile-image bg-secondary rounded-circle me-3" style="width: 80px; height: 80px;"></div>
            <div class="profile-details">
                <h1 class="h4 mb-1"><%= firstName %> <%= lastName %></h1>
                <p class="mb-0 text-muted">Email: <%= email %></p>
                <p class="mb-0 text-muted">Phone: <%= phone %></p>
                <p class="mb-0 text-muted">Soft Skills: <%= softSkills %></p>
                <p class="mb-0 text-muted">Hard Skills: <%= hardSkills %></p>
            </div>
        </div>

        <!-- Form update profile -->
        <h3 class="mb-3">Update Your Profile</h3>
        <form action="${pageContext.request.contextPath}/UpdateProfileServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" value="<%= email %>" readonly>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="tel" id="phone" name="phone" class="form-control" value="<%= phone %>">
            </div>

            <div class="mb-3">
                <label for="soft-skills" class="form-label">Soft Skills</label>
                <input type="text" id="soft-skills" name="softSkills" class="form-control" value="<%= softSkills %>">
            </div>

            <div class="mb-3">
                <label for="hard-skills" class="form-label">Hard Skills</label>
                <input type="text" id="hard-skills" name="hardSkills" class="form-control" value="<%= hardSkills %>">
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
