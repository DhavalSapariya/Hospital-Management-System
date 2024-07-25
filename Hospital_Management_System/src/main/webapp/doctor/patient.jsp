<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 18-07-2024
  Time: 09:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="entity.Doctor" %>
<%@ page import="dao.AppointmentDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="entity.Appointment" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Patient Details</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card
        {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <c:if test = "${empty doctorObj}">
        <c:redirect url = "../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="container p-3">
        <div class="row">
            <div class = "col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>

                        <c:if test = "${not empty doctorObj}">
                            <p class = "fs-4 text-center text-success">${SuccessMsg}</p>
                            <c:remove var = "SuccessMsg" scope = "session"/>
                        </c:if>
                        <c:if test = "${empty doctorObj}">
                            <p class = "fs-4 text-center text-success">${errorMsg}</p>
                            <c:remove var = "errorMsg" scope = "session"/>
                        </c:if>

                    <table class = "table">
                        <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Age</th>
                            <th scope="col">Appointment Date</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mob No</th>
                            <th scope="col">Diseases</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Doctor d = (Doctor)session.getAttribute("doctorObj");
                            AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
                            List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                            for(Appointment ap : list)
                            {
                        %>
                        <tr>
                            <td><%=ap.getFullname()%></td>
                            <td><%=ap.getGender()%></td>
                            <td><%=ap.getAge()%></td>
                            <td><%=ap.getAppoinDate()%></td>
                            <td><%=ap.getEmail()%></td>
                            <td><%=ap.getPhoneno()%></td>
                            <td><%=ap.getDiseases()%></td>
                            <td><%=ap.getStatus()%></td>
                            <td>
                                <%
                                    if("Pending".equals(ap.getStatus()))
                                    {
                                    %>
                                        <a href="comment.jsp?id=<%= ap.getId() %>" class = "btn btn-success btn-sm">Comment</a>
                                    <%
                                    }
                                    else
                                    {%>
                                        <a href="#" class = "btn btn-success btn-sm disabled">Comment</a>
                                    <%}
                                %>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
