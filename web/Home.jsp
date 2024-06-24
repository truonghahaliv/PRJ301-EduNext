<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/newstyles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">EduNext</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Student Home</h1>
        <div class="row">
            <div class="col-md-3">
                <form id="courseForm" action="home.jsp" method="post">
                    <div class="form-group">
                        <label for="courseSelect">Select Course</label>
                        <select class="form-control" id="courseSelect" name="courseSelect" onchange="document.getElementById('courseForm').submit();">
                            <option value="" disabled selected>Select a course</option>
                            <option value="1">Course 1</option>
                            <option value="2">Course 2</option>
                            <option value="3">Course 3</option>
                        </select>
                    </div>
                </form>
            </div>
            </div>
        <div class="row">
            <div class="col-md-12">
                <div id="courseInfo" class="card">
                    <div class="card-body">
                        <h5 class="card-title">Course Information</h5>
                        <p class="card-text">
                            <% String courseId = request.getParameter("courseSelect"); %>
                            <c:choose>
                                <c:when test="${courseId == '1'}">
                                    <strong>Course 1:</strong> This is a description of Course 1. It covers topics A, B, and C.
                                </c:when>
                                <c:when test="${courseId == '2'}">
                                    <strong>Course 2:</strong> This is a description of Course 2. It covers topics D, E, and F.
                                </c:when>
                                <c:when test="${courseId == '3'}">
                                    <strong>Course 3:</strong> This is a description of Course 3. It covers topics G, H, and I.
                                </c:when>
                                <c:otherwise>
                                    Please select a course to see the details.
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
