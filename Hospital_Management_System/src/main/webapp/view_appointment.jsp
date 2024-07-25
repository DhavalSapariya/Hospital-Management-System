<%--
Created by IntelliJ IDEA.
User: Dhaval
Date: 17-07-2024
Time: 08:27 PM
To change this template use File | Settings | File Templates.
--%>

<%@ page import="dao.AppointmentDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Appointment" %>
<%@ page import="dao.DoctorDao" %>
<%@ page import="entity.Doctor" %>
<%@ page import="entity.User" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Appointment</title>
    <%@include file="Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card{
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
        .back-Img{
            background: linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)),
            url("images/hosp1.1.jpeg");
            height: 25vh;
            width: 100%;
            background-size: cover;
            bakckground-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <%@include file="Component/navbar.jsp"%>

    <c:if test="${empty userObj}">
        <c:redirect url="user_login.jsp"/>
    </c:if>

    <div class="container-fluid back-Img p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appointment Date</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Status</th>
                            </tr>
                            </thead>
                                <tbody>
                                <%
                                    User user = (User) session.getAttribute("userObj");
                                    AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
                                    DoctorDao dao2 = new DoctorDao(DBConnect.getCon());
                                    List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                    for(Appointment ap : list)
                                    {
                                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                %>
                                    <tr>
                                        <th><%=ap.getFullname() %></th>
                                        <td><%=ap.getGender() %></td>
                                        <td><%=ap.getAge() %></td>
                                        <td><%=ap.getAppoinDate() %></td>
                                        <td><%=ap.getDiseases() %></td>
                                        <td><%=d.getFullName() %></td>
                                        <td>
                                            <%
                                            if("Pending".equals(ap.getStatus()))
                                            {%>
                                                <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                            <%}
                                            else
                                            {%>
                                                <%=ap.getStatus() %>
                                            <%}
                                            }%>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3 p-3">
                <img alt="" src="images/d88.jpg" style="height: 65vh" width="360px">
        </div>
    </div>
    </div>
</body>
</html>
