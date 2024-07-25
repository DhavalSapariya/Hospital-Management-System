<%@ page import="dao.AppointmentDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="entity.Appointment" %><%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 19-07-2024
  Time: 08:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Comment</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card
        {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }

        .back-Img{
            background: linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)),
            url("../images/hosp1.1.jpeg");
            height: 25vh;
            width: 100%;
            background-size: cover;
            bakckground-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <c:if test = "${empty doctorObj}">
        <c:redirect url = "../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="col-md-6 offset-md-3">
        <div class="paint-card">
            <div class="cord-body">
                <p class="text-center fs-4 " style="padding-top: 18px">Patient Comment</p>

                <% int id = Integer.parseInt(request.getParameter("id"));
                    AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
                    Appointment ap = dao.getAppointmentById(id);
                %>

                <form class = "row" style="padding: 20px" action = "../UpdateStatus" method = "POST">
                    <div class = "col-md-6">
                        <label>Patient Name</label>
                        <input type = "text" class = "form-control" value = "<%=ap.getFullname() %>" readonly>
                    </div>

                    <div class = "col-md-6">
                        <label>Age</label>
                        <input type = "text" value = "<%=ap.getAge() %>" class = "form-control" readonly>
                    </div>

                    <div class = "col-md-6">
                        <label>Mob No</label>
                        <input type = "text" value = "<%=ap.getPhoneno() %>" class = "form-control" readonly>
                    </div>

                    <div class = "col-md-6">
                        <label>Disease</label>
                        <input type = "text" value = "<%=ap.getDiseases() %>" class = "form-control" readonly>

                    </div>

                    <div class = "col-md-12">
                        <label>Comment</label>
                        <textarea class = "form-control" name = "comment" row = "3" cols = "" required></textarea>
                    </div>

                    <input type = "hidden" name = "id" value = "<%=ap.getId() %>" >
                    <input type = "hidden" name = "did" value = "<%=ap.getDoctorId() %>">

                    <button type = "submit" class = "mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
