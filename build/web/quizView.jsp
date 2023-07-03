<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>

<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Time</title>
        <link rel="stylesheet" type="text/css" href="Style/quiz.css">
    </head>
    <body>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__header">
                            <h1 class="body__header-title">${cInfo.courseName} Quiz!</h1>
                            <p class="body__header-desc">Answer the question below</p>
                        </div>
                    <c:forEach var="question" items="${ques}" varStatus="loop">                  
                        <div class="body__quiz">
                            <div class="body__quiz-img">
                                <img class="body__quiz-img" src="${cInfo.courseImg}" alt="Course Image" />
                            </div>
                            <div class="body__quiz-content">
                                <div class="quiz-item">
                                    <div class="quiz-item-title">Question ${loop.index + 1}/5</div>
                                    <div class="quiz-item-desc"> ${question.questionContent}                            
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body__ans">
                            <div class="body__ans-title">Choose an answer</div>
                            <div class="body__ans-choose">                
                                <div class="ans-item">
                                    <div class="ans-item-circle"></div>
                                    <p class="ans-item-text">${question.answersList[0]}</p>
                                </div>
                                <div class="ans-item">
                                    <div class="ans-item-circle"></div>
                                    <p class="ans-item-text">${question.answersList[1]}</p>
                                </div>
                                <div class="ans-item">
                                    <div class="ans-item-circle"></div>
                                    <p class="ans-item-text">${question.answersList[2]}</p>
                                </div>
                                <div class="ans-item">
                                    <div class="ans-item-circle"></div>
                                    <p class="ans-item-text">${question.answersList[3]}</p>
                                </div>
                            </div>
                        </div>
                        <button class="body__submit-btn">Submit</button>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>