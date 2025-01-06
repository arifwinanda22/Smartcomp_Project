<%--
    Document   : events
    Created on : 16 Dec 2024, 08.58.29
    Author     : arifwinanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Classes.Event" %>
<%@ page import="Classes.Competition" %>
<%@ page import="Classes.Workshop" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartComp - Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Event List</h1>

        <!-- Form to Add New Competition -->
        <h3>Add Competition</h3>
        <form action="event" method="post" class="mb-4">
            <input type="hidden" name="action" value="createCompetition">
            <div class="mb-3">
                <label for="competitionTitle" class="form-label">Competition Title</label>
                <input type="text" id="competitionTitle" name="title" class="form-control" placeholder="Enter competition title" required>
            </div>
            <div class="mb-3">
                <label for="competitionCategory" class="form-label">Category</label>
                <input type="text" id="competitionCategory" name="category" class="form-control" placeholder="Enter competition category" required>
            </div>
            <div class="mb-3">
                <label for="competitionLink" class="form-label">Registration Link</label>
                <input type="url" id="competitionLink" name="link" class="form-control" placeholder="Enter registration link" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Competition</button>
        </form>

        <!-- Form to Add New Workshop -->
        <h3>Add Workshop</h3>
        <form action="event" method="post" class="mb-4">
            <input type="hidden" name="action" value="createWorkshop">
            <div class="mb-3">
                <label for="workshopTitle" class="form-label">Workshop Title</label>
                <input type="text" id="workshopTitle" name="title" class="form-control" placeholder="Enter workshop title" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Workshop</button>
        </form>

        <!-- Display All Events -->
        <h3>All Events</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Type</th>
                    <th>Title</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Event> events = (List<Event>) request.getAttribute("events");
                    if (events != null && !events.isEmpty()) {
                        int index = 1;
                        for (Event event : events) {
                            if (event instanceof Competition) {
                                Competition competition = (Competition) event;
                %>
                                <tr>
                                    <td><%= index++ %></td>
                                    <td>Competition</td>
                                    <td><%= competition.getTitle() %></td>
                                    <td>
                                        Category: <%= competition.getCategory() %><br>
                                        Link: <a href="<%= competition.getRegistrationLink() %>" target="_blank">Register</a>
                                    </td>
                                </tr>
                <%
                            } else if (event instanceof Workshop) {
                                Workshop workshop = (Workshop) event;
                %>
                                <tr>
                                    <td><%= index++ %></td>
                                    <td>Workshop</td>
                                    <td><%= workshop.getTitle() %></td>
                                    <td>-</td>
                                </tr>
                <%
                            }
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4" class="text-center">No events available</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
