<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 21-05-2024
  Time: 05:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>User Registration</title>
    <%@include file="Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card{
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
        .click{
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@include file="Component/navbar.jsp"%>

<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 text-center">User Registration</p>

                    <c:if test = "${not empty SuccessMsg}">
                        <p class="fs-4 text-center text-success">${SuccessMsg}</p>
                        <c:remove var = "SuccessMsg" scope = "session"/>
                    </c:if>

                    <c:if test = "${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var = "errorMsg" scope = "session"/>
                    </c:if>

                    <form action="UserRegister" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input required name = "fullname" type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input required name = "email" type="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input required name = "password" type="password" class="form-control">
                        </div>
                        <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
