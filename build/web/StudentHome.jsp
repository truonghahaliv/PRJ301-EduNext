<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/newstyles.css">
    </head>
    <style>
        .bg-orange {
            background-color: orange !important;
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-orange">
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
                  
                        <div class="form-group">
                            <label for="courseSelect">Select Course</label>
                            <select class="form-control" id="courseSelect" name="courseSelect" onchange="document.getElementById('courseForm').submit();">
                                <option value="Summer 2024">Summer 2024</option>
                            </select>
                        </div>
              
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="courseInfo" class="card">
                        <div class="card-body">
                            <h5 class="card-title">Course Information</h5>
                            <div class="row">


                                <c:forEach items="${course}" var="c">
                                   
                                    <div class="col-md-3">
                                        <div class="card mb-4">
                                            <div class="card-body">

                                                <a href="ViewCourseInfor?id=${c.courseId}" class="card-title"> ${c.courseName} --  ${c.description}</a> 
                                               


                                                <p class="card-text">${c.className}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

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
