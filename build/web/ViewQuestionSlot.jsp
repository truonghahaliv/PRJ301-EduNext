<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/newstyles.css">
    </head>
    <style>
        .bg-orange {
            background-color: orange !important;
        }
        .card-bg-gray {
            background-color: #f8f9fa;
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
        <div class="container mt-4">

            <h3><strong>(QUESTION)  ${question.name}</strong></h3>

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Content Section -->
                        <div class="card card-bg-gray" style="margin-top: 20px">
                            <div class="card-body">
                                <h5 class="card-title">Content</h5>
                                <hr style="margin-bottom: 8px; height: 5px;">
                                <p id="lessonContent" class="card-text">${question.content}</p>
                            </div>

                        </div>
                        <c:if test="${question.status eq 'Cancelled'}">
                            <div style="margin-top: 20px;"> 
                                <p style="color: #e83e8c;">Discussion time is over.</p>
                            </div>
                        </c:if>           
                            <c:if test="${question.status == 'On Going'}">
                            <div style="margin-top: 20px;"> 
                                <p style="color: #e83e8c;">Discussion time is contain.</p>
                            </div>
                        </c:if>        
                    </div>

                </div>
            </div>


        </div>

        <!-- Bootstrap CSS -->

        <!-- jQuery, Popper.js, and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>

