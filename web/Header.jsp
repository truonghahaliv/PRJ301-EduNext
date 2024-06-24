<%-- 
    Document   : Header
    Created on : Jun 25, 2024, 12:37:39 AM
    Author     : Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<header>
    <!-- header inner -->
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                    <div class="full">
                        <div class="center-desk">
                            @if (ViewBag.Users is not null) {
                                <div class="logo">
                                    <a style="font-size: 25px;text-shadow:
      -1px -1px 0 #000,
       1px -1px 0 #000,
      -1px  1px 0 #000,
       1px  1px 0 #000;" href="/Home/Admin">FPT Room</a>
                                </div>
                            } else {
                                <div class="logo">
                                    <a style="font-size: 25px; text-shadow:
      -1px -1px 0 #000,
       1px -1px 0 #000,
      -1px  1px 0 #000,
       1px  1px 0 #000;" href="/Home">FPT Room</a>
                                </div>

                            }
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                    <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                            <ul class="navbar-nav mr-auto">
                                @if (ViewBag.Users is not null) {
                                    <li class="nav-item" style="color:black; font-size: 20px">
                                        Hello @(ViewBag.Users)
                                    </li>
                                }
                            </ul>
                            @if (ViewBag.Users is null) {
                                <div class="sign_btn"><a href="/Home/Login">Login</a></div>
                            } else {
                                <div class="sign_btn"><a href="/Home/logOut">Log out</a></div>
                            }
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- end header inner -->
<!-- end header -->
<!-- banner -->
<section class="banner_main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-bg">
                    <div class="padding_lert">
                        <h1 style="color: darkorange; text-shadow:
      -1px -1px 0 #000,
       1px -1px 0 #000,
      -1px  1px 0 #000,
       1px  1px 0 #000; padding-top: 65px;">
                            WELCOME TO FPT Room
                        </h1>
                        <p style="text-shadow:
      -1px -1px 0 #000,
       1px -1px 0 #000,
      -1px  1px 0 #000,
       1px  1px 0 #000;">A website that helps students and faculty reserve classrooms on campus</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>