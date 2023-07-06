<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>

<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />

<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="Style/result.css">
    </head>
    <%@ include file="/includes/header.jsp" %>

    <body>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="result-header">
                        <p class="header-tile">Quiz Result</p>
                        <div class="header-nav">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <a href="dashboardView.jsp" >Dashboard</a>                      
                        </div>        
                    </div>
                    <div class="result-table">
                        <div class="table-header">
                            <div class="table-col">Test ID</div>                           
                            <div style="border-left: 0" class="table-col">User name</div>
                            <div style="border-left: 0" class="table-col">Course</div>
                            <div style="border-left: 0" class="table-col">Time</div>
                            <div style="border-left: 0" class="table-col">Corrected</div>
                            <div style="border-left: 0" class="table-col">Point</div>
                            <div style="border-left: 0" class="table-col">Created At</div>
                        </div>
                        <div class="table-row">
                            <div style="border-top: 0" class="table-col">${testID}</div>                           
                            <div style="border-left: 0;border-top: 0" class="table-col">${user.username}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${courseID}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${time}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${corrected}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${point}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${start}</div>
                        </div>
                    </div>
                    <div class=""></div>
                </div>
            </div>
        </section>
</body>
</html>



