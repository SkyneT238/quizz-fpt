<%-- 
    Document   : instructionView
    Created on : Jun 23, 2023, 7:20:46 AM
    Author     : vohuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
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
                        <h1 class="body__header-title">History quiz</h1>
                        <p class="body__header-desc">Answer the question below</p>
                    </div>
                    <div class="body__quiz">
                        <div class="body__quiz-img">
                                <img class="" src="assets/form/formImg.png" />
                        </div>
                        <div class="body__quiz-content">
                            <div class="quiz-item">
                                <div class="quiz-item-title">Question 1/5</div>
                                <div class="quiz-item-desc">
                                    Guy Bailey, Roy Hackett and Paul Stephenson made history in
                                    1963, as part of a protest against a bus company that refused
                                    to employ black and Asian drivers in which UK city?
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__ans">
                        <div class="body__ans-title">Choose an answer</div>
                        <div class="body__ans-choose">
                            <div class="ans-item">
                                <div class="ans-item-circle"></div>
                                <p class="ans-item-text">London</p>
                            </div>
                            <div class="ans-item">
                                <div class="ans-item-circle"></div>
                                <p class="ans-item-text">Edinburg</p>
                            </div>
                            <div class="ans-item">
                                <div class="ans-item-circle"></div>
                                <p class="ans-item-text">Liverpool</p>
                            </div>
                            <div class="ans-item">
                                <div class="ans-item-circle"></div>
                                <p class="ans-item-text">Canary whart</p>
                            </div>
                        </div>
                        
                    </div>
                     <button class="body__submit-btn">Submit</button>
                </div>
        </section>
    </body>
</html>
