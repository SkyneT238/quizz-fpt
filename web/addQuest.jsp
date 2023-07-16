<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="cate" class="DAO.CourseDAO" scope="session"/>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" type="text/css" href="Style/profilecss.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%@ include file="/includes/header.jsp" %>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="container">
                        <form style="margin-bottom: 40px;" action="addquest" method="post" class="form-group">
                            <select name="cate">                                  
                                <c:forEach items="${cate.allCourses}" var="i">
                                    <option value="${i.courseID}">${i.courseName}</option>
                                </c:forEach>

                            </select>
                            <select name="difficuilt">   
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                            <input type="text" name="question" value="" placeholder="Please input your question..." />
                            <input type="text" name="ans1" placeholder="Enter select answer" />
                            <input type="text" name="ans2" placeholder="Enter select  answer" />             
                            <input type="text" name="ans3" placeholder="Enter select  answer" />
                            <input type="text" name="key" placeholder="Enter right answer" />
                            <div class="button-group">
                                <button class="button" type="submit"><fmt:message key="profile.save"/></button>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </section>

    </body>
    <script>
        window.onload = function () {
            var status = '${status}';
            var title = '${title}';
            var message = '${message}';

            if (status && title && message) {
                Swal.fire({
                    icon: status,
                    title: title,
                    text: message
                });
            }
        };
    </script>
</html>