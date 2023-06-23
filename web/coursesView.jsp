<%-- 
    Document   : coursesView
    Created on : Jun 20, 2023, 9:12:38 AM
    Author     : ducnl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<!DOCTYPE html>
<!--dang su dung usebean có thể xoá coursesServlet-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="Style/courses.css">-->
        <link rel="stylesheet" href="<c:url value="Style/courses.css"/>">
       
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">

                    <div class="body__content">
                        <div class="body__content-tiltle">Select Topic</div>
                        <div class="body__content-depcriptions">Featured Category</div>
                    </div>
                    <div class="body__gallery">
                        <c:forEach items="${c.allCourses}" var="i">
                            <div class="gallary-item">
                                <img src="<c:url value="${i.courseImg}"/>" class="gallary-item-img" />
                                <div class="gallary-item-name">${i.courseName}</div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

        </section>
    </body>
</html>
