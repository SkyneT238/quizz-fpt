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
                        <div class="form-header">
                            <h1 class="title"><fmt:message key="profile.title.info"/></h1>
                            <div class="avatar"></div>
                        </div>
                        <form style="margin-bottom: 40px;" action="updateInfo" method="post" class="form-group">
                            <div class="form-group">
                                <label class="label" for="full-name"><fmt:message key="profile.fullname.input"/></label>
                                <input class="input" type="text" id="full-name" value="${user.fullname}" name="fullname">
                            </div>
                            <div class="form-group">
                                <label class="label" for="user-name"><fmt:message key="profile.username.input"/></label>
                                <input class="input" type="text" id="user-name" name="user-name" value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label class="label" for="email"><fmt:message key="profile.email.input"/></label>
                                <input class="input" type="email" id="email" name="email" value="${user.email}">
                            </div>
                            <div class="form-group">
                                <label class="label" for="contact-number"><fmt:message key="profile.contact.input"/></label>
                                <input class="input" type="tel"  value="${user.contactnumber}" id="contact-number" name="contactnumber">
                            </div>
                            <div class="button-group">
                                <button class="button" type="submit"><fmt:message key="profile.save"/></button>
                            </div>
                        </form>
                        <div class="form-header">
                            <h1 class="title"><fmt:message key="profile.title.password"/></h1>
                        </div>
                        <form action="changepass"  method="post">
                            <div class="form-group">
                                <div class="password-table">
                                    <div class="table">
                                        <label class="label" for="old-password"><fmt:message key="profile.oldpass.input"/></label>
                                        <input class="password-input" type="password" id="oldpassword" name="oldpassword">
                                    </div>
                                    <div class="table">
                                        <label class="label" for="new-password"><fmt:message key="profile.newpass.input"/></label>
                                        <input class="password-input" type="password" id="newpassword" name="newpassword">
                                    </div>
                                </div>
                            </div>
                            <div class="button-group">
                                <input  class="button" type="submit" value="<fmt:message key="profile.change"/>"></input>
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