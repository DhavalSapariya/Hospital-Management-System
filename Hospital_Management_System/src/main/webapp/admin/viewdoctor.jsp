<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 09-07-2024
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="dao.SpecialistDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.DoctorDao" %>
<%@ page import="entity.Doctor" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Doctor</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Doctor Details</p>

                    <c:if test = "${not empty SuccessMsg}">
                        <p class="fs-4 text-center text-success">${SuccessMsg}</p>
                        <c:remove var = "SuccessMsg" scope = "session"/>
                    </c:if>

                    <c:if test = "${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var = "errorMsg" scope = "session"/>
                    </c:if>

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">DOB</th>
                            <th scope="col">Qualification</th>
                            <th scope="col">Specialist</th>
                            <th scope="col">MobNo.</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            DoctorDao dao2 = new DoctorDao(DBConnect.getCon());
                            List<Doctor> list2 = dao2.getAllDoctor();
                            for(Doctor d : list2)
                            {
                        %>
                        <tr>
                            <td><%= d.getFullName() %></td>
                            <td><%= d.getDob() %></td>
                            <td><%= d.getQualification() %></td>
                            <td><%= d.getSpecialist() %></td>
                            <td><%= d.getMobno() %></td>
                            <td><%= d.getEmail() %></td>
                            <td>
                                <a href="editDoctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                                <a href="../deleteDoctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-danger ">Delete</a>
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
