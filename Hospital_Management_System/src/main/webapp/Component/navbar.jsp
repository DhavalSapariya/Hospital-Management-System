<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-chimney-medical"></i> MEDI CARE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

            <c:if test="${empty userObj}">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="./admin_login.jsp">
                        <i class="fa-solid fa-right-to-bracket"></i> Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="./doctor_login.jsp">Doctor</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="./user_appointment.jsp">Appointment</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="./user_login.jsp">User</a>
                </li>
            </c:if>

            <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./user_appointment.jsp">
                            Appointment</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./view_appointment.jsp">
                            View Appointment</a>
                    </li>

                    <div class="dropdown ">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"  style="display: flex; justify-content: center; align-items: center;">
                            <i class="fa-solid fa-circle-user fs-5" style="margin: 1px; padding: 2px;"></i>
                            <p style="margin: 1px; padding: 1px;">${userObj.fullName}</p>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="./change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="./UserLogout">Logout</a></li>
                        </ul>
                    </div>
            </c:if>

            </ul>
        </div>
    </div>
</nav>