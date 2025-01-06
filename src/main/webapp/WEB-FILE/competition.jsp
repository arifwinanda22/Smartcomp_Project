<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.classes.Competition" %>

<%
    System.out.println("==== JSP Processing Started ====");
    List<Competition> academicComps = (List<Competition>) request.getAttribute("competitionAcademic");
    List<Competition> nonAcademicComps = (List<Competition>) request.getAttribute("competitionNonAcademic");

    System.out.println("Academic competitions in JSP: " + (academicComps != null ? academicComps.size() : "null"));
    System.out.println("Non-academic competitions in JSP: " + (nonAcademicComps != null ? nonAcademicComps.size() : "null"));

    if (academicComps != null) {
        for (Competition comp : academicComps) {
            System.out.println("Academic competition: " + comp.getName());
        }
    }

    if (nonAcademicComps != null) {
        for (Competition comp : nonAcademicComps) {
            System.out.println("Non-academic competition: " + comp.getName());
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Competitions Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .card {
            transition: transform 0.2s;
            border-radius: 15px;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .card-img-top {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            height: 200px;
            object-fit: cover;
        }
        .badge {
            font-size: 0.8rem;
            padding: 0.5em 1em;
        }
        .competition-section {
            padding: 40px 0;
            background-color: #f8f9fa;
        }
        .section-title {
            margin-bottom: 30px;
            color: #333;
            font-weight: 600;
        }
        .competition-card {
            height: 100%;
        }
        .card-body {
            display: flex;
            flex-direction: column;
        }
        .card-footer {
            background-color: transparent;
            border-top: none;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <!-- Your existing navbar code here -->

    <!-- Main Content -->
    <div class="container-fluid py-5">
        <!-- Header Section -->
        <div class="text-center mb-5">
            <h1 class="display-4 fw-bold">Competitions</h1>
            <p class="lead text-muted">Discover and join exciting competitions that match your interests</p>
        </div>

        <!-- Academic Competitions Section -->
        <section class="competition-section mb-5">
            <div class="container">
                <h2 class="section-title text-center mb-4">Academic Competitions</h2>
                <div class="row g-4">
                    <%
                        List<Competition> competitionAcademic = (List<Competition>) request.getAttribute("competitionAcademic");
                        if (competitionAcademic == null || competitionAcademic.isEmpty()) {
                    %>
                        <div class="col-12 text-center">
                            <div class="alert alert-info" role="alert">
                                <i class="bi bi-info-circle me-2"></i>
                                No academic competitions available at the moment.
                            </div>
                        </div>
                    <%
                        } else {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
                            DecimalFormat priceFormat = new DecimalFormat("#,###");
                            for (Competition competition : competitionAcademic) {
                    %>
                        <div class="col-md-4">
                            <div class="card competition-card h-100">
                                <img src="https://via.placeholder.com/400x200"
                                     class="card-img-top"
                                     alt="<%=competition.getName()%>">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h5 class="card-title mb-0"><%=competition.getName()%></h5>
                                        <span class="badge bg-primary"><%=competition.getType()%></span>
                                    </div>
                                    <div class="card-text mb-3">
                                        <div class="mb-2">
                                            <i class="bi bi-calendar-event text-muted me-2"></i>
                                            <small>Start: <%=dateFormat.format(competition.getStartDate())%></small>
                                        </div>
                                        <div class="mb-2">
                                            <i class="bi bi-calendar-check text-muted me-2"></i>
                                            <small>End: <%=dateFormat.format(competition.getEndDate())%></small>
                                        </div>
                                        <div class="mb-2">
                                            <i class="bi bi-cash text-muted me-2"></i>
                                            <small>Fee: Rp <%=priceFormat.format(competition.getEntryFee())%></small>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge <%=competition.getStatus().equals("active") ? "bg-success" : "bg-danger"%>">
                                            <%=competition.getStatus().toUpperCase()%>
                                        </span>
                                        <% if("active".equalsIgnoreCase(competition.getStatus())) { %>
                                            <a href="competitionDetails?id=<%=competition.getId()%>"
                                               class="btn btn-primary btn-sm">
                                                <i class="bi bi-arrow-right-circle me-1"></i>
                                                Join Now
                                            </a>
                                        <% } else { %>
                                            <button class="btn btn-secondary btn-sm" disabled>
                                                <i class="bi bi-lock me-1"></i>
                                                Closed
                                            </button>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>

        <!-- Non-Academic Competitions Section -->
        <section class="competition-section">
            <div class="container">
                <h2 class="section-title text-center mb-4">Non-Academic Competitions</h2>
                <div class="row g-4">
                    <%
                        List<Competition> competitionNonAcademic = (List<Competition>) request.getAttribute("competitionNonAcademic");
                        if (competitionNonAcademic == null || competitionNonAcademic.isEmpty()) {
                    %>
                        <div class="col-12 text-center">
                            <div class="alert alert-info" role="alert">
                                <i class="bi bi-info-circle me-2"></i>
                                No non-academic competitions available at the moment.
                            </div>
                        </div>
                    <%
                        } else {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
                            DecimalFormat priceFormat = new DecimalFormat("#,###");
                            for (Competition competition : competitionNonAcademic) {
                    %>
                        <div class="col-md-4">
                            <div class="card competition-card h-100">
                                <img src="https://via.placeholder.com/400x200"
                                     class="card-img-top"
                                     alt="<%=competition.getName()%>">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h5 class="card-title mb-0"><%=competition.getName()%></h5>
                                        <span class="badge bg-success"><%=competition.getType()%></span>
                                    </div>
                                    <div class="card-text mb-3">
                                        <div class="mb-2">
                                            <i class="bi bi-calendar-event text-muted me-2"></i>
                                            <small>Start: <%=dateFormat.format(competition.getStartDate())%></small>
                                        </div>
                                        <div class="mb-2">
                                            <i class="bi bi-calendar-check text-muted me-2"></i>
                                            <small>End: <%=dateFormat.format(competition.getEndDate())%></small>
                                        </div>
                                        <div class="mb-2">
                                            <i class="bi bi-cash text-muted me-2"></i>
                                            <small>Fee: Rp <%=priceFormat.format(competition.getEntryFee())%></small>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge <%=competition.getStatus().equals("active") ? "bg-success" : "bg-danger"%>">
                                            <%=competition.getStatus().toUpperCase()%>
                                        </span>
                                        <% if("active".equalsIgnoreCase(competition.getStatus())) { %>
                                            <a href="competitionDetails?id=<%=competition.getId()%>"
                                               class="btn btn-primary btn-sm">
                                                <i class="bi bi-arrow-right-circle me-1"></i>
                                                Join Now
                                            </a>
                                        <% } else { %>
                                            <button class="btn btn-secondary btn-sm" disabled>
                                                <i class="bi bi-lock me-1"></i>
                                                Closed
                                            </button>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>