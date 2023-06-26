<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>

<%
    String courseID = request.getParameter("courseID");
    String courseName = request.getParameter("courseName");
    String courseImg = request.getParameter("courseImg");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.QuestionDAO"%>
<%@page import="Model.Question"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instruction</title>
        <link rel="stylesheet" type="text/css" href="Style/quiz.css">
    </head>
    <body>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__header">
                        <h1 class="body__header-title"><%= courseName %></h1>
                        <p class="body__header-desc">Answer the question below</p>
                    </div>
                    <div class="body__quiz">
                        <div class="body__quiz-img">
                            <img class="" src="<%= courseImg %>" alt="Course Image" />
                        </div>
                        <div class="body__quiz-content">
                            <div class="quiz-item">
                                <div class="quiz-item-title">Question 1/5</div>
                                <div class="quiz-item-desc">
                                    <%-- Lấy danh sách câu hỏi từ DAO dựa trên courseID --%>
                                    <% QuestionDAO questionDAO = new QuestionDAO(); %>
                                    <% List<Question> questionList = questionDAO.getQuestion(Integer.parseInt(courseID)); %>
                                    <%-- Hiển thị câu hỏi --%>
                                    <% if (questionList != null && questionList.size() > 0) { %>
                                    <% Question question = questionList.get(0); %> <!-- Lấy câu hỏi đầu tiên trong danh sách -->
                                    <p><%= question.getQuestionContent() %></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__ans">
                        <div class="body__ans-title">Choose an answer</div>
                        <div class="body__ans-choose">
                            <%-- Hiển thị các đáp án --%>
                            <% if (questionList != null && questionList.size() > 0) { %>
                            <% Question question = questionList.get(0); %> <!-- Lấy câu hỏi đầu tiên trong danh sách -->
                            <% List<String> answers = question.getAnswers(); %> <!-- Lấy danh sách các đáp án -->
                            <%-- Sử dụng JSTL để lặp qua danh sách các đáp án và hiển thị --%>
                            <c:forEach var="answer" items="<%= answers %>">
                                <div class="ans-item">
                                    <div class="ans-item-circle"></div>
                                    <p class="ans-item-text"><c:out value="${answer}"/></p>
                                </div>
                            </c:forEach>
                            <% } %>
                        </div>
                    </div>
                    <button class="body__submit-btn">Submit</button>
                </div>
            </div>
        </section>
    </body>
</html>
