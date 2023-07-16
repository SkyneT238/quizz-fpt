<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                            <div class="form-group">
                                <label class="label" for="cate-name"><fmt:message key="profile.fullname.input"/></label>
                                <input class="input" type="text" id="full-name" value="${user.fullname}" name="catename">
                            </div>
                            <div class="form-group">
                                <label class="label" for="cate-info"><fmt:message key="profile.username.input"/></label>
                                <input class="input" type="text" id="user-name" name="cateinfo" value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label class="label" for="cate-img"><fmt:message key="profile.email.input"/></label>
                                <input class="input" type="email" id="email" name="cateimg" value="${user.email}">
                            </div>
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