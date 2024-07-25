<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 26-05-2024
  Time: 08:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.DBConnect" %>
<%@ page import="dao.DoctorDao" %>

<html>
<head>
    <title>Admin Page</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>

    <%@include file="navbar.jsp"%>

    <c:if test="${empty adminObj}">
        <c:redirect url="admin_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">
        <p class="text-center fs-4">Admin Dashboard</p>
        <c:if test="${not empty errorMsg}">
            <p class="fs-4 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty SuccessMsg}">
            <p class="fs-4 text-center text-success" role="alert">${SuccessMsg}</p>
            <c:remove var="SuccessMsg" scope="session"/>
        </c:if>
    </div>

    <%
        DoctorDao dao = new DoctorDao(DBConnect.getCon());
    %>

    <div class="row mx-5">
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br/>
                    <p class="fs-4 text-center">Doctor<br/><%=dao.countDoctor()%></p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-3x"></i><br/>
                    <p class="fs-4 text-center">User<br/><%=dao.countUser()%></p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br/>
                    <p class="fs-4 text-center">Total Appointments<br/><%=dao.countAppointment()%></p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-2">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fas fa-calendar-check fa-3x"></i><br/>
                    <p class="fs-4 text-center">Specialist<br/><%=dao.countSpecialist()%></p>
                </div>
            </div>
        </div>
    </div>

    <!--Specialist Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Specialist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action = "../AddSpecialist" method="post">
                        <div class="form-group">
                            <label>Enter Specialist Name</label>
                            <input type="text" name = "specName" class = "form-control">
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class = "btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

