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
            <div style="position: relative;" class="view">
                <div  class="body">
                    <div class="body__header">
                        <h1 class="body__header-title">${cInfo.courseName} Quiz!</h1>
                        <p class="body__header-desc">Answer the question below</p>
                    </div>
                    <c:set var="page" value="${requestScope.page}" />
                    <form action="quiz" method="GET">
                        <div style="position: absolute ; right: -1%; top: 60px; max-width: 280px; width: 100%; padding: 40px 20px; ; box-shadow: 0px 0px 16px 0px rgba(194, 198, 204, 0.60);
                             " class="pagination">
                            <div class="timer">
                                <p class="time">Times: </p>
                                <p class="count-down">5mins</p>
                            </div>
                            <div style="display: flex; gap: 10px; flex-wrap:wrap; margin-bottom: 30px" class="page">
                                <c:forEach var="i" begin="${1}" end="${requestScope.num}">
                                    <input type="hidden" name="prePage" value="${page}">
                                    <button style="font-size: 16px; width: 50px; height: 50px; font-weight: 600" class="${i==page?"active":""}" type="submit" name="page" value="${i}">${i}</button>
                                </c:forEach>
                            </div>
                            <a class="submit-quiz" href="resultView.jsp">Submit</a>
                        </div>
                        <c:forEach var="question" items="${data}">
                            <div class="body__quiz">
                                <div class="body__quiz-content">
                                    <div class="quiz-item">
                                        <div class="quiz-item-title">Question ${requestScope.page}/${requestScope.num}</div>
                                        <div class="quiz-item-desc">${question.questionContent}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="body__ans">
                                <div class="body__ans-title">Choose an answer</div>
                                <div class="body__ans-choose">
                                    <c:forEach var="answer" items="${question.answersList}" varStatus="loop">
                                        <div class="ans-item">
                                            <input type="radio" name="answer_${loop.count}" value="${answer}" ${sessionScope.ans[page-1] == answer ?"checked" : "" }  />${answer}  <br />
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </form>
                </div>
            </div>
        </section>
    </body>

    <script>
        const ansItems = document.querySelectorAll('.ans-item');
        ansItems.forEach(item => {
            item.addEventListener('click', () => {
                const isSelected = item.classList.contains('selected');
                ansItems.forEach(item => {
                    item.classList.remove('selected');
                    item.querySelector('input[type="radio"]').checked = false;
                });
                if (!isSelected) {
                    item.classList.add('selected');
                    item.querySelector('input[type="radio"]').checked = true;
                }
            });
        });
        window.onload = function () {
            const radioButtons = document.querySelectorAll('input[type="radio"]');

            radioButtons.forEach(function (radioButton) {
                if (radioButton.checked) {
                    const ansItem = radioButton.parentNode;
                    ansItem.classList.add('selected');
                }
            });
        };

    </script>

    <style>
        .selected {
            background-color: #00FF00;
        }

    </style>


</html>
