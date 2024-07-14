<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            <c:if test="${teacher eq 'teacher'}">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="ListSlot">Teacher Manage</a>
                        </li>
                    </ul>
                </div>
            </c:if>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5">

            <div class="row">
                <div class="col-md-3">
                    <form >
                        <div class="form-group">
                            <label for="">Filter Activities</label>
                            <select class="form-control" id="courseSelect1" name="courseSelect" ">

                                <option value="">Cancelled</option>
                                <option value="">Not Start</option>
                                <option value="">On Going</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <form id="courseForm2" action="ViewCourseInfor" method="get">
                        <div class="form-group">
                            <label for="courseSelect2">Filter Slot</label>
                            <select class="form-control" id="courseSelect2" name="slot" onchange="document.getElementById('courseForm2').submit();">
                                <option value="">All Slot</option>
                                <c:forEach items="${lesson2}" var="l">
                                    <option value="${l.slot}" ${param.slot == l.slot ? 'selected' : ''}>Slot ${l.slot}</option>
                                </c:forEach>
                                <input value="${lid}" name="lid" hidden="">
                            </select>
                        </div>
                    </form>

                </div>
                                <c:if test="${student eq 'student'}">
                                    
                               
                <div class="col-md-3">
                    <div class="form-group" style="margin-top: 30px">
                        <a href="ViewAssignmentStudent" class="btn btn-success">View Assignment</a>
                    </div>
                </div>
 </c:if>


                <c:forEach items="${lesson}" var="l">
                    <c:set var="lid" value="${l.lessonId}"/> 
                    <div class="container" >
                        <div class="row" >
                            <div class="col-md-12" >

                                <!-- Content Section -->
                                <div class="card" style="margin-top: 20px">
                                    <div class="card-body">
                                        <h5 class="card-title">Slot ${l.slot}</h5>
                                        <p id="lessonContent" class="card-text">${l.lessonContent}</p>
                                    </div>

                                    <div class="card" id="questionsAccordion">
                                        <div class="card-header">
                                            <h2 class="mb-0">


                                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseQuestions" aria-expanded="true" aria-controls="collapseQuestions">
                                                    Show Question


                                                </button>
                                                <input value="${l.lessonId}" name="lid" hidden="">


                                            </h2>
                                        </div>
                                    
                                        <div id="collapseQuestions" class="collapse" aria-labelledby="headingQuestions" data-parent="#questionsAccordion">
                                            <div class="card-body">



                                                <c:forEach items="${question}" var="q">
                                                    <c:if test="${q.lessonId == l.lessonId}">
                                                        <c:if test="${q.name == null}">
                                                            <p>No questions available</p>
                                                        </c:if>
                                                        <c:if test="${q.name != null}">
                                                            <div class="d-flex justify-content-between">
                                                                <c:if test="${student eq 'student'}">
                                                                    <a href="ViewQuestionSlot?id=${q.questionId}">${q.name}</a>
                                                                </c:if>
                                                                <c:if test="${teacher eq 'teacher'}">
                                                                    <a href="TeacherViewQuestion?id=${q.questionId}">${q.name}</a>
                                                                </c:if>
                                                                <c:if test="${student eq 'student'}">
                                                                    <c:if test="${q.status eq 'Cancelled'}">
                                                                        <p style="color: #e83e8c;">${q.status}</p>
                                                                    </c:if>
                                                                    <c:if test="${q.status eq 'Not Start'}">
                                                                        <p >${q.status}</p>
                                                                    </c:if>
                                                                    <c:if test="${q.status eq 'On Going'}">
                                                                        <p style="color: #90EE90;">${q.status}</p>
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${teacher eq 'teacher'}">
                                                                    <form id="f1${q.questionId}" action="change-status" >
                                                                        <select class="form-control" name="sts" onchange="change(${q.questionId})">
                                                                            <option ${(q.status=="Cancelled")?'selected':''}  value="Cancelled">Cancelled</option>
                                                                            <option ${(q.status=="Not Start")?'selected':''} value="Not Start">No Start</option>
                                                                            <option ${(q.status=="On Going")?'selected':''} value="On Going">On Going</option>
                                                                        </select>
                                                                        <input type="hidden" name="id" value="${q.questionId}">
                                                                        <input type="hidden" name="lid" value="${lid}">

                                                                    </form>
                                                                </c:if>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>





            </div>
            <!-- Bootstrap CSS -->

            <!-- jQuery, Popper.js, and Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script type="text/javascript">
                                                                            function change() {
                                                                                document.getElementById("courseForm").submit();
                                                                            }
                                                                            function change(id) {
                                                                                document.getElementById("f1" + id).submit();
                                                                            }
            </script>
    </body>
</html>

