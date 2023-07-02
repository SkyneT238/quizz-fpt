<%-- 
    Document   : header
    Created on : Jun 19, 2023, 5:05:57 PM
    Author     : ducnl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="Style/headerCss.css"/>
        <title>JSP Page</title>
    </head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setCharacterEncoding("UTF-8"); %>
    <body>
        <div class="main">
            <div class="main-container">
                <header class="header">
                    <a class="header-title" href="home">
                        <h1 class="header-title">FPT Quiz</h1>
                    </a>
                    <div class="header-search">
                        <i class="fa-solid fa-magnifying-glass search-icon"></i>
                        <input class="search-input" type="text" placeholder="Search..."> </input>
                    </div>
                    <a class="header-btn" href="courses">Start Quiz</a>
                    <div class="header-user"  id="user-nav">
                        <div class="user-box"> 
                            <img class="header-user-img" src="../img.jpg" alt="">
                            <div class="header-user-name">${user.username}</div>
                        </div>
                        <div class="hearder-toggle" onclick="toggleHeaderInfo()">
                            <div class="toggle-line"></div>
                        </div>
                        <div id="header-info"   class="header-info">
                            <div class="info-item">
                                <i class="fa-solid fa-user info-icon"></i>
                                <a href="profileView.jsp " class="info-link">Profile</a>
                            </div>
                            <div class="info-item">
                                <i class="fa-solid fa-gear info-icon "></i>
                                <a  class="info-link" >Settings</a>
                            </div>
                            <div class="info-item">
                                <i class="fa-solid fa-arrow-right-from-bracket info-icon"></i>
                                <a  class="info-link" href="logout" >Log out</a>
                            </div>
                        </div>
                    </div>
                </header>
            </div>
        </div>
        <script src="js/showJs.js"></script>
    </body>
</html>

