<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.User" %>

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
        <%
            User currentUser = (User) session.getAttribute("user");
            String currentUsername = currentUser.getUsername();
        %>
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
            <h3><strong>(QUESTION) ${question.name}</strong></h3>
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
                                    <p style="color: #e83e8c;">Start time ${question.start}</p>
                                    <p style="color: #e83e8c;">End time ${question.end}</p>
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
                <c:if test="${answer == 'false' && overtime == 'false'}">
                    <h5 style="margin-left: 15px">Discussion</h5>
                    <div class="submit" style="margin-left: 15px">
                        <form action="ViewQuestionSlot" method="get">
                            <input value="${id}" name="id" hidden="">
                            <textarea class="form-control" id="content" name="content" rows="5" style="resize: none;"></textarea>
                            <div class="d-flex justify-content-end" style="margin-top: 20px">
                                <button type="submit" class="btn btn-secondary">Submit</button>
                            </div>
                        </form>
                    </div>
                </c:if>
                <c:if test="${answer == 'true'}">
                    <h5 style="margin-left: 15px">Discussion</h5>
                    <div class="content" style="margin-left: 15px; margin-top: 20px">
                        <c:forEach items="${answerUsers}" var="a">
                            <c:set var="aid" value="${a.aid}"/>
                            <div class="content-cmt" style="margin-top: 30px">
                                <div class="mt-2 d-flex justify-content-between">
                                    <p><strong>${a.username}</strong></p>
                                    <c:if test="${a.username == currentUsername}">
                                        <div>
                                            <a href="#" class="btn btn-sm btn-warning mr-2" onclick="editComment('${a.aid}', '${a.content}')">
                                                <i class="fas fa-edit"></i> Edit

                                            </a
                                            >
                                            <a href="DeleteQuestion?id=${a.aid}" class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                                <textarea class="form-control" id="content-${a.aid}" name="content" rows="5" style="resize: none;" readonly>${a.content}</textarea>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${overtime == 'true' && answer == 'false'}">
                    <h5 style="margin-left: 15px">Discussion</h5>
                    <div class="content" style="margin-left: 15px; margin-top: 20px">
                        <c:forEach items="${answerUsers}" var="a">
                            <div class="content-cmt" style="margin-top: 30px">
                                <p><strong>${a.username}</strong></p>
                                <textarea class="form-control" id="content" name="content" rows="5" style="resize: none;" readonly>${a.content}</textarea>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </c:if>
        </div>

        <!-- jQuery, Popper.js, and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
                                                function editComment(id, content) {
                                                    var textarea = document.getElementById('content-' + id);
                                                    textarea.readOnly = false;
                                                    textarea.focus();

                                                    var form = document.createElement('form');
                                                    form.action = '';
                                                    form.method = 'post';

                                                    var hiddenId = document.createElement('input');
                                                    hiddenId.type = 'hidden';
                                                    hiddenId.name = 'aid';
                                                    hiddenId.value = id;

                                                    var hiddenContent = document.createElement('input');
                                                    hiddenContent.type = 'hidden';
                                                    hiddenContent.name = 'contentUpdate';
                                                    hiddenContent.value = content;

                                                    var submitBtn = document.createElement('button');
                                                    submitBtn.type = 'submit';
                                                    submitBtn.className = 'btn btn-sm btn-primary mt-2 btn-group-toggle float-right';
                                                    submitBtn.textContent = 'Edit';

                                                    form.appendChild(hiddenId);
                                                    form.appendChild(hiddenContent);
                                                    form.appendChild(submitBtn);

                                                    textarea.parentNode.appendChild(form);

                                                    textarea.oninput = function () {
                                                        hiddenContent.value = textarea.value;
                                                    };
                                                }
        </script>

    </body>
</html>
