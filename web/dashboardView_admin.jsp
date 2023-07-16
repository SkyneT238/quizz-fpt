<%-- 
    Document   : dashboardView_admin
    Created on : Jul 16, 2023, 12:25:03 PM
    Author     : vohuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                $.ajax({
                    url: "/QuizletFPT/adminDashboard",
                    type: "post", //send it through get method
                    data: {
                        time: elapsedTime,
                        key: getSelectedAnswer(),
                        page: getPage()
                    },
                    success: function (data) {
                        window.location.href = "resultView.jsp";
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['Work', 11],
                    ['Eat', 2],
                    ['Commute', 2],
                    ['Watch TV', 2],
                    ['Sleep', 7]
                ]);

                var options = {
                    title: 'My Daily Activities',
                    is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    </body>
</html>
