<%-- 
    Document   : NavBar
    Created on : Jun 30, 2024, 1:10:43 PM
    Author     : Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Profile and Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMt23cez/3paNdF+R9p6lF0BhqhbR5bgjRII0N7" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #ff9933;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        .navbar .brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar .nav-links {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .navbar .nav-links li {
            margin-left: 1rem;
            position: relative;
        }

        .navbar .nav-links a {
            text-decoration: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        .navbar .nav-links a:hover {
            background-color: #cc7a29;
        }

        .navbar .nav-links .profile-menu {
            cursor: pointer;
        }

        .navbar .nav-links .profile-menu .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #ff9933;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            min-width: 150px;
        }

        .navbar .nav-links .profile-menu .dropdown a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .navbar .nav-links .profile-menu .dropdown a:hover {
            background-color: #cc7a29;
        }

        .navbar .nav-links .profile-menu.show .dropdown {
            display: block;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="brand">My Website</div>
        <ul class="nav-links">
            <li class="profile-menu">
                <a href="#" onclick="toggleDropdown()">
                    <i class="fas fa-user-circle"></i>
                </a>
                <div class="dropdown">
                    <a href="#profile">View Profile</a>
                    <a href="logout">Logout</a>
                </div>
            </li>
        </ul>
    </nav>

    <script>
        function toggleDropdown() {
            document.querySelector('.profile-menu').classList.toggle('show');
        }

        window.onclick = function(event) {
            if (!event.target.matches('.profile-menu a')) {
                var dropdowns = document.getElementsByClassName("dropdown");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
</body>


