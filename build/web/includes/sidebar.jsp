<%-- 
    Document   : sidebar
    Created on : Jun 20, 2023, 8:08:33 AM
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
        <link rel="stylesheet" href="Style/sidebar.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <aside class="sidebar">
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-database"></i>
                <a href="dashboardView.jsp" class="sidebar__item-list">Dashboard</a>
            </div>
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-gamepad"></i>
                <a href="courses" class="sidebar__item-list">Quiz</a>
            </div>
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-headset"></i>
                <a href="#" class="sidebar__item-list">Support</a>
            </div>
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-bell"></i>
                <a href="#" class="sidebar__item-list">Notification</a>
            </div>
        </aside>
    </body>
</html>
