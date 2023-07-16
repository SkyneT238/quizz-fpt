<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="cate" class="Model.CourseDAO" scope="session"/>  
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
                        <form style="margin-bottom: 40px;" action="addcourse" method="post" class="form-group">
                            <select>
                                
                                <option value="value2">Lựa chọn 2</option>
                                <option value="value3">Lựa chọn 3</option>
                                 <c:forEach var="i" begin="${1}" end="${cate.allCourses}">
                                   <option value="value1">${i.courseName}</option>
                                </c:forEach>
                            </select>

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