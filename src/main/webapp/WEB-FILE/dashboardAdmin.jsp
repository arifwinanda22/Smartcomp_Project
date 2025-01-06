<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.classes.Competition" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Competition Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #999AE6;
        }
        .navbar-brand {
            color: white !important;
        }
        .management-card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .btn-manage {
            background-color: #4CAF50;
            color: white;
        }
        .btn-manage:hover {
            background-color: #45a049;
            color: white;
        }
        .invalid-feedback {
            display: block;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
              <img src="<%=request.getContextPath()%>/resources/images/gambar-removebg-preview.png" alt="Logo" height="30" class="d-inline-block align-text-top me-2">
                SmartComp Admin
            </a>
            <div class="ms-auto">
                <a href="<%=request.getContextPath()%>/logout" class="btn btn-light">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Alerts -->
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (successMessage != null && !successMessage.isEmpty()) {
        %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%=successMessage%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <%
            }
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%=errorMessage%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <%
            }
        %>

        <!-- Competition Management Section -->
        <div class="management-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Competition Management</h2>
                <button class="btn btn-manage" data-bs-toggle="modal" data-bs-target="#addCompetitionModal">
                    Add New Competition
                </button>
            </div>

            <!-- Competition Table -->
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Entry Fee</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            DecimalFormat priceFormat = new DecimalFormat("#,###");
                            List<Competition> competitions = (List<Competition>) request.getAttribute("competitions");
                            if(competitions != null) {
                                for(Competition competition : competitions) {
                        %>
                            <tr>
                                <td><%=competition.getId()%></td>
                                <td><%=competition.getName()%></td>
                                <td><%=competition.getType()%></td>
                                <td><%=dateFormat.format(competition.getStartDate())%></td>
                                <td><%=dateFormat.format(competition.getEndDate())%></td>
                                <td>Rp <%=priceFormat.format(competition.getEntryFee())%></td>
                                <td>
                                    <span class="badge <%=competition.getStatus().equals("active") ? "bg-success" : "bg-danger"%>">
                                        <%=competition.getStatus()%>
                                    </span>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="editCompetition(<%=competition.getId()%>)">
                                        Edit
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCompetition(<%=competition.getId()%>)">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Competition Modal -->
    <div class="modal fade" id="addCompetitionModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Competition</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="addCompetitionForm" action="<%=request.getContextPath()%>/adminCompetition" method="POST" novalidate>
                        <input type="hidden" name="action" value="add">

                        <div class="mb-3">
                            <label for="name" class="form-label">Competition Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                            <div class="invalid-feedback">Please enter a competition name</div>
                        </div>

                        <div class="mb-3">
                            <label for="type" class="form-label">Type</label>
                            <select class="form-select" id="type" name="type" required>
                                <option value="">Select Type</option>
                                <option value="academic">Academic</option>
                                <option value="nonacademic">Non-Academic</option>
                            </select>
                            <div class="invalid-feedback">Please select a type</div>
                        </div>

                        <div class="mb-3">
                            <label for="start_date" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" required
                                   pattern="\d{4}-\d{2}-\d{2}">
                            <div class="invalid-feedback">Please select a start date</div>
                        </div>

                        <div class="mb-3">
                            <label for="end_date" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" required
                                   pattern="\d{4}-\d{2}-\d{2}">
                            <div class="invalid-feedback">Please select an end date</div>
                        </div>

                        <div class="mb-3">
                            <label for="entry_fee" class="form-label">Entry Fee (Rp)</label>
                            <input type="number" class="form-control" id="entry_fee" name="entry_fee" required min="0">
                            <div class="invalid-feedback">Please enter a valid entry fee</div>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                            <div class="invalid-feedback">Please select a status</div>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-manage">Save Competition</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Competition Modal -->
    <div class="modal fade" id="editCompetitionModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Competition</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editCompetitionForm" action="<%=request.getContextPath()%>/adminCompetition" method="POST" novalidate>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" id="editId" name="id">

                        <div class="mb-3">
                            <label for="editName" class="form-label">Competition Name</label>
                            <input type="text" class="form-control" id="editName" name="name" required>
                            <div class="invalid-feedback">Please enter a competition name</div>
                        </div>

                        <div class="mb-3">
                            <label for="editType" class="form-label">Type</label>
                            <select class="form-select" id="editType" name="type" required>
                                <option value="academic">Academic</option>
                                <option value="nonacademic">Non-Academic</option>
                            </select>
                            <div class="invalid-feedback">Please select a type</div>
                        </div>

                        <div class="mb-3">
                            <label for="editStartDate" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="editStartDate" name="start_date" required
                                   pattern="\d{4}-\d{2}-\d{2}">
                            <div class="invalid-feedback">Please select a start date</div>
                        </div>

                        <div class="mb-3">
                            <label for="editEndDate" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="editEndDate" name="end_date" required
                                   pattern="\d{4}-\d{2}-\d{2}">
                            <div class="invalid-feedback">Please select an end date</div>
                        </div>

                        <div class="mb-3">
                            <label for="editEntryFee" class="form-label">Entry Fee (Rp)</label>
                            <input type="number" class="form-control" id="editEntryFee" name="entry_fee" required min="0">
                            <div class="invalid-feedback">Please enter a valid entry fee</div>
                        </div>

                        <div class="mb-3">
                            <label for="editStatus" class="form-label">Status</label>
                            <select class="form-select" id="editStatus" name="status" required>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                            <div class="invalid-feedback">Please select a status</div>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-manage">Update Competition</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this competition? This action cannot be undone.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="<%=request.getContextPath()%>/adminCompetition" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" id="deleteId" name="id">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        function validateForm(form) {
            let isValid = true;
            const formElements = form.elements;

            for (let i = 0; i < formElements.length; i++) {
                const element = formElements[i];
                if (element.hasAttribute('required')) {
                    if (!element.value.trim()) {
                        element.classList.add('is-invalid');
                        isValid = false;
                    } else {
                        element.classList.remove('is-invalid');
                    }
                }
            }

            // Validate dates
            const startDate = new Date(form.querySelector('[name="start_date"]').value);
            const endDate = new Date(form.querySelector('[name="end_date"]').value);

            if (endDate < startDate) {
                alert('End date must be after start date');
                return false;
            }

            return isValid;
        }

        // Add form submission handler
        document.getElementById('addCompetitionForm').addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
            }
        });

        // Edit form submission handler
        document.getElementById('editCompetitionForm').addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
            }
        });

        function editCompetition(id) {
            fetch('<%=request.getContextPath()%>/adminCompetition?action=edit&id=' + id)
                .then(response => response.json())
                .then(competition => {
                    document.getElementById('editId').value = competition.id;
                    document.getElementById('editName').value = competition.name;