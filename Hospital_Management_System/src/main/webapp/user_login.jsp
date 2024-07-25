<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 21-05-2024
  Time: 05:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
    response.setHeader("cache-control", "no-cache");
    response.setHeader("cache-control", "no-store");
    response.setHeader("pragma", "no-cache");
    response.setDateHeader("expires", 0);
%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@page isELIgnored="false"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@page isELIgnored="false"%>--%>
<%--<%@page language="java" contentType="text/html; ISO-8859-1"--%>
<%--        pageEncoding="ISO-8859-1"%>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login Page</title>
    <%@include file="Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card
        {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
        .click
        {
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
                    <p class="fs-4 text-center">User Login</p>

                    <c:if test = "${not empty SuccessMsg}">
                        <p class="fs-4 text-center text-danger">${SuccessMsg}</p>
                        <c:remove var = "successMsg" scope = "session"/>
                    </c:if>

                    <c:if test = "${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var = "errorMsg" scope = "session"/>
                    </c:if>

                    <form action="./UserLogin" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input required name = "email" type="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name = "password"  class="form-control" required>
                        </div>
                        <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                    </form>
                    <br> Don't have an account?<a href="./signup.jsp" class="text-decoration-none"> Sign up</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>