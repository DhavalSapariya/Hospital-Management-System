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
    <title>Doctor</title>
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
            <div class="col-md-5 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Add Doctor</p>
                        <c:if test = "${not empty SuccessMsg}">
                            <p class="fs-4 text-center text-success">${SuccessMsg}</p>
                            <c:remove var = "SuccessMsg" scope = "session"/>
                        </c:if>

                        <c:if test = "${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var = "errorMsg" scope = "session"/>
                        </c:if>

                        <form action="../AddDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input required name="fullname" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input required name="dob" type="date" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input required name="qualification" type="tel" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <select name = "specialist" class="form-control" >
                                    <option>--Select--</option>
                                    <% SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
                                       List<Specialist> list = dao.getAllSpecialist();
                                       for(Specialist s : list)
                                       {%>
                                            <option><%= s.getSpecialistName() %></option>
                                        <%}
                                    %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile No.</label>
                                <input required name="mobno" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input required name="email" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input required name="password" type="password" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-primary d-block mx-auto col-md-12">Add Doctor</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
