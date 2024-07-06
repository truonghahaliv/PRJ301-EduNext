<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                            <div class="d-flex justify-content-between" style="margin-top: 20px;">
                                <c:if test="${overtime == 'true'}">
                                    <p style="color: #e83e8c;">Discussion is over </p>
                                </c:if>
                                <c:if test="${overtime == 'false'}">
                                    <p style="color: #e83e8c;">Start time  ${question.start}</p>
                                    <p style="color: #e83e8c;">End time  ${question.end}</p>
                                </c:if>
                            </div>
                        </c:if>   
                        <c:if test="${question.status == 'Not Start'}">
                            <div style="margin-top: 20px;"> 
                                <p style="color: #e83e8c;">This Question is not start.</p>
                            </div>
                        </c:if>  
                    </div>
                </div>
            </div>
            <c:if test="${question.status != 'Not Start'}">
                <c:if test="${answer == 'false'}">
                    <h5 style="margin-left: 15px">Discussion</h5>
                    <textarea class="form-control" id="content" name="content" rows="5" style="resize: none; margin-left: 15px"></textarea>
                </c:if>
                <c:if test="${answer == 'true'}">
                    <h5 style="margin-left: 15px" >Discussion</h5>
                    <div class="content" style="margin-left: 15px; margin-top: 20px">
                        <c:forEach items="${answerUsers}" var="a">
                            <div class="content-cmt" style=" margin-top: 30px">
                                <p><strong>${a.username}</strong></p>
                                <textarea class="form-control" id="content" name="content" rows="5" style="resize: none;" readonly>${a.content}</textarea>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </c:if>
        </div>
        <div class="container mt-3">
            <div class="textarea-container position-relative">
                <textarea class="form-control" id="editableContent" name="content" rows="5" style="resize: none; margin-left: 15px"></textarea>
                <div class="dropdown position-absolute" style="top: 5px; right: 5px;">
                    <i class="fas fa-ellipsis-v" id="dropdownMenuButton" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false" style="cursor: pointer;"></i>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#" id="editBtn"><i class="fas fa-edit"></i> Edit</a>
                        <a class="dropdown-item" href="#" id="deleteBtn"><i class="fas fa-trash-alt"></i> Delete</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery, Popper.js, and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

      <script>
            document.addEventListener('DOMContentLoaded', function () {
                const textarea = document.getElementById('editableContent');
                const editBtn = document.getElementById('editBtn');
                const deleteBtn = document.getElementById('deleteBtn');

                editBtn.addEventListener('click', function (e) {
                    e.preventDefault();
                    textarea.disabled = !textarea.disabled;
                    editBtn.innerHTML = textarea.disabled ? '<i class="fas fa-edit"></i> Edit' : '<i class="fas fa-save"></i> Save';
                });

                deleteBtn.addEventListener('click', function (e) {
                    e.preventDefault();
                    if (confirm('Are you sure you want to delete this content?')) {
                        textarea.value = '';
                    }
                });
            });
        </script>
    </body>
</html>
