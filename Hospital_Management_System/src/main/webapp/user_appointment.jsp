<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 16-07-2024
  Time: 07:08 PM
  To change this template use File | Settings | File Templates.
--%>

<%
response.setHeader("Cache-Control", "no-store, no-cache");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="entity.Doctor"  %>
<%@page import="java.util.List"  %>
<%@ page import="dao.DoctorDao" %>
<%@ page import="db.DBConnect" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Appointment</title>
    <%@include file="Component/allcss.jsp" %>
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
    <%@include file="Component/navbar.jsp" %>

    <div class="container-fluid back-Img p-5">
        <p class = "text-center fs-2 text-white"></p>
    </div>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 p-5 " style="display: flex;justify-content: center;align-items: center;">
                <img alt = "docter imaged" src = "images/d6.jpg" style="height: 80vh">
            </div>
            <div class="col-md-6">
                <div class="card paint-card " style="margin-top: 30px">
                    <div class="card-body">
                        <p class = "text-center fs-3">User Appointment</p>

                        <c:if test="${not empty SuccessMsg}">
                        <p class = "fs-4 text-center text-success">${SuccessMsg}</p>
                        <c:remove var="SuccessMsg" scope="session"/>
                        </c:if>

                        <c:if test="${empty errorMsg}">
                        <p class = "fs-4 text-center text-success">${errorMsg}</p>
                            <c:remove var="SuccessMsg" scope="session"/>
                        </c:if>

                        <form class = "row g-3" action="AppointmentServlet" method="post">

                            <input type="hidden" name = "userid" value = "${userObj.id}" />

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="inputEmail4" name="fullname" required>
                            </div>

                            <div class="col-md-6">
                                <label>Gender</label>
                                <select class="form-control" name="gender" style="margin-top: 8px" required>
                                    <option value="">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Age</label>
                                <input type="number" class="form-control" name="age" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Appointment Date</label>
                                <input type="date" class="form-control" name="appoint_date" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" name="phoneno" maxlength="10" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Diseases</label>
                                <input type="text" class="form-control" name="diseases" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Doctor</label>
                                <select class="form-control" name="doctor" required>
                                    <option value = "">---Select---</option>
                                    <% DoctorDao dao = new DoctorDao(DBConnect.getCon());
                                       List<Doctor> list = dao.getAllDoctor();
                                       for(Doctor d : list)
                                       {
                                       %>
                                            <option value= "<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpecialist()%>)</option>
                                       <%
                                       }
                                    %>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea name = "address" class="form-control" required>
                                </textarea>
                            </div>

                            <c:if test = "${empty userObj}">
                                <a href="user_login.jsp"
                                   class="col-md-6 offset md-3 btn btn-success">Submit</a>
                            </c:if>

                            <c:if test = "${not empty userObj}">
                                <button type="submit" class="col-md-12 offset md-3 btn btn-success">Submit</button>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
