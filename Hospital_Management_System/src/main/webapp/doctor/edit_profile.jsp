<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 21-07-2024
  Time: 04:37 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="dao.SpecialistDao" %>
<%@ page import="db.DBConnect" %>
<%@ page import="entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="entity.Doctor" %>
<%@ page import="static db.DBConnect.con" %>


<%
    HttpSession ds = request.getSession();
    String em = (String) ds.getAttribute("em");

    String id = "";
    String fullname = "";
    String dob = "";
    String qualification = "";
    String specialist = "";
    String mobno = "";
    String email = "";

    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");

        String sql = "SELECT * FROM doctor where email = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, em);
        ResultSet rs = ps.executeQuery();

        while(rs.next())
        {
            id = rs.getString("id");
            fullname = rs.getString("fullname");
            dob = rs.getString("dob");
            qualification = rs.getString("qualification");
            specialist = rs.getString("specialist");
            mobno = rs.getString("mobno");
            email = rs.getString("email");
        }
    }
    catch (Exception e)
    {
        e.printStackTrace();
    }
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="../Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card
        {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test = "${empty doctorObj}">
        <c:redirect url = "../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card paint-card" style="padding: 10px">
                    <p class="text-center fs-3">Change Password</p>

                    <c:if test = "${not empty SuccessMsg}">
                        <p class="fs-4 text-center text-danger">${SuccessMsg}</p>
                        <c:remove var = "successMsg" scope = "session"/>
                    </c:if>

                    <c:if test = "${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var = "errorMsg" scope = "session"/>
                    </c:if>

                    <div class="card-body">
                        <form action="<%= request.getContextPath()%>/DoctorChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="password" name = "newPassword" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="password" name = "oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" value="${doctorObj.id}" name="uid">
                            <button class = "btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-5 offset-md-2">
                <div class = "card paint-card" style="padding: 20px">
                    <p class="text-center fs-3">Edit Profile</p>

                    <c:if test = "${not empty SuccessMsgd}">
                        <p class="fs-4 text-center text-danger">${SuccessMsgd}</p>
                        <c:remove var = "successMsgd" scope = "session"/>
                    </c:if>

                    <c:if test = "${not empty errorMsgd}">
                        <p class="fs-4 text-center text-danger">${errorMsgd}</p>
                        <c:remove var = "errorMsgd" scope = "session"/>
                    </c:if>

                    <div class = "cord-body">
                        <form action="../DoctorEditProfile" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input required name="fullname" type="text" class="form-control"
                                       value = "<%= fullname%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input required name="dob" type="date" class="form-control"
                                       value = "<%= dob%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input required name="qualification" type="text" class="form-control"
                                       value = "<%= qualification%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <select name = "specialist" class="form-control">
                                    <option><%= specialist%></option>
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
                                <input required name="mobno" type="text" class="form-control"
                                       value = "<%= mobno%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input required name="email" type="text" class="form-control" readonly
                                       value = "<%= email%>">
                            </div>
                            <input type="hidden" name="id" value="<%= id%>">

                            <button type="submit" class="btn btn-primary d-block mx-auto col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
