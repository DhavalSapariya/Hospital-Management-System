<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 21-07-2024
  Time: 03:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <%@include file="Component/allcss.jsp"%>
    <style type="text/css">
        .paint-card{
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <%@include file="Component/navbar.jsp"%>

    <c:if test="${empty userObj}">
    <c:redirect url="user_login.jsp"/>
    </c:if>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
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
                        <form action="./UserChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter Password</label>
                                <input type="password" name = "newPassword" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="password" name = "oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" value="${userObj.id}" name="uid">
                            <button class = "btn btn-success col-md-12">Change Password</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
