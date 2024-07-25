<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 21-07-2024
  Time: 01:55 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="dao.AppointmentDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Appointment" %>
<%@ page import="dao.DoctorDao" %>
<%@ page import="entity.Doctor" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="col-md-12">
        <div class="card paint-card">
            <div class="card-body">
                <p class="fs-3 text-center">Patient Details</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Age</th>
                            <th scope="col">Appointment</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mob No</th>
                            <th scope="col">Diseases</th>
                            <th scope="col">Doctor Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
                        DoctorDao dao2  = new DoctorDao(DBConnect.getCon());
                        List<Appointment> list = dao.getAllAppointment();
                        for(Appointment ap : list) {
                            Doctor d = dao2.getDoctorById(ap.getDoctorId());
                        %>
                            <tr>
                                <th><%=ap.getFullname()%></th>
                                <td><%=ap.getGender()%></td>
                                <td><%=ap.getAge()%></td>
                                <td><%=ap.getAppoinDate()%></td>
                                <td><%=ap.getEmail()%></td>
                                <td><%=ap.getPhoneno()%></td>
                                <td><%=ap.getDiseases()%></td>
                                <td><%=d.getFullName()%></td>
                                <td><%=ap.getAddress()%></td>
                                <td><%=ap.getStatus()%></td>
                            </tr>
                        <%}
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
