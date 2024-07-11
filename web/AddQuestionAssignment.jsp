
<%-- 
    Document   : UpdateUser
    Created on : Mar 1, 2024, 6:10:16 PM
    Author     : Dan
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <div>
                <%@include file="SideBarTeacher.jsp" %>
            </div>
            <div class="container mt-5">


                <h1 style="margin-bottom: 40px">Add Question</h1>
                <form action="AddQuestionAssignment" onsubmit="return validateDates()" method="post">
                     <input value="${aid}" name="aid" hidden="">
                    <div class="form-row">

                       
                        <div class="form-group col-md-5">

                            <label for="inputUsername4" style="font-weight: bold"> Question Content </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder=" Content" required="" name="content">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="status" style="font-weight: bold">Status</label>
                            <select id="status" class="form-control" name="status" >
                                <option value="On Going">On Going</option>
                                <option value="Not Start">Not Start</option>
                                <option value="Cancelled">Cancelled</option>

                            </select>
                        </div>
                   

                    </div>


                    <button type="submit" class=" d-flex  btn btn-primary updateBtn">Add To System</button>
                </form>

            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script>
                    function validateDates() {
                        // Clear any previous error messages
                        document.getElementById('startError').innerHTML = '';
                        document.getElementById('endError').innerHTML = '';

                        const startDate = document.getElementById('start').value;
                        const endDate = document.getElementById('end').value;

                        if (new Date(endDate) <= new Date(startDate)) {
                            document.getElementById('endError').innerHTML = "End Date must be greater than Start Date";
                            return false; // prevent form submission
                        }
                        return true; // allow form submission
                    }
    </script>
</body>
</html>

