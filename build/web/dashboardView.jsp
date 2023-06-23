

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Your Page Title</title>
        <link rel="stylesheet" type="text/css" href="Style/dashboard.css">
    </head>
    
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__user">
                        <img class="user__data-img" src="assets/avatar.svg" />

                        <div class="user__data-content">
                            <div class="data-info">
                                <div class="data-info-name">${user.username}</div>
                                <div class="data-info-type">Bonus booster 24lv</div>
                            </div>
                            <div class="user__data-process">
                                <div class="data-progress-bar"></div>
                            </div>
                            <div class="data-paramenters">
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">
                                        <img class="item-img" src="assets/flag.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">
                                        <img class="item-img" src="assets/clock.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">
                                        <img class="item-img" src="assets/pass.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__collect">
                        <div class="collect__acheive">
                            <div class="acheive-tiltle">Acheivements</div>
                            <div class="acheive-board">
                                <div class="acheive-board-item medals-comback">
                                    <img src="assets/start1.svg" alt="" />
                                    <div>Comeback</div>
                                </div>
                                <div class="acheive-board-item medals-lucky">
                                    <img src="assets/start2.svg" alt="" />
                                    <div>Lucky</div>
                                </div>
                                <div class="acheive-board-item medals-winner">
                                    <img src="assets/start3.svg" alt="" />
                                    <div>Winner</div>
                                </div>
                            </div>
                        </div>
                        <div class="collect__cate">
                            <div class="cate-content">
                                <div class="cate-content-tiltle">Featured Category</div>
                                <a class="cate-content-view" href="courses">View All</a>
                            </div>
                            <div class="cate__gallary">
                                <c:forEach items="${c.featuredCourses}" var="i">
                                     <div class="gallary-item">
                                    <img src="<c:url value="${i.courseImg}"/>" class="gallary-item-img" />
                                    <div class="gallary-item-name">${i.courseName}</div>
                                </div>
                                </c:forEach>
                               
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>



