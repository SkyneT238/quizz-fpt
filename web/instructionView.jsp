

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instruction</title>
        <link rel="stylesheet" type="text/css" href="Style/instruction.css">
    </head>
    <body>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__header">
                        <h1 class="body__header-title">History quiz</h1>
                        <p class="body__header-desc">Answer the question below</p>
                    </div>
                    <div class="body__quiz">
                        <div class="body__quiz-img">
                            <img class="" src="assets/form/formImg.png" />
                        </div>
                        <div class="body__quiz-content">
                            <div class="quiz-item">
                                <div class="quiz-item-title">Date:</div>
                                <div class="quiz-item-desc">
                                    26/6/2023
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title">Date:</div>
                                <div class="quiz-item-desc">
                                    26/6/2023
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title">Date:</div>
                                <div class="quiz-item-desc">
                                    26/6/2023
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title">Date:</div>
                                <div class="quiz-item-desc">
                                    26/6/2023
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__instruct">
                        <div class="body__instruct-title body__header-title">Instruction</div>
                        <div class="body__instruct-desc">This quiz consists of 5 multiple-choice questions. To be successful with the quizzes, it’s important to conversant with the topics. Keep the following in mind:
                        </div>
                        <div class="body__instruct-desc"> Timing - You need to complete each of your attempts in one sitting, as you are allotted 30 minutes to each attempt.
                            Answers - You may review your answer-choices and compare them to the correct answers after your final attempt.</div>
                        <div class="body__instruct-desc">  To start, click the "Start" button. When finished, click the "Submit " button..</div>
                        <a href="quizView.jsp" class="body__submit-btn">Start quiz</a>
                    </div>
                </div>
        </section>
    </body>
</html>
