<%@ page import="java.sql.Connection" %>
<%@ page import="db.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Index Page</title>
    <%@ include file="Component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<%@ include file="Component/navbar.jsp" %>

<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/hosp1.jpeg" class="d-block w-100" alt="First slide" height="570px">

        </div>
        <div class="carousel-item">
            <img src="images/hosp2.jpeg" class="d-block w-100 " alt="Second slide" height="570px">

        </div>
        <div class="carousel-item">
            <img src="images/hosp3.jpg" class="d-block w-100 " alt="Third slide" height="570px">

        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="container p-3">
    <p class="text-center fs-2"><b>Key Features of our Hospital</b></p>
    <div class="row">
        <div class="col-md-8 p-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5"><b>100% safety</b></p>
                            <p class="card-text">Our moto to provide 100% safety to our patients, and we always try to achieve our moto.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5"><b>Clean Environment</b></p>
                            <p class="card-text">We provide the Clean Environment and try to maintain positive atmosphere to our patients.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5"><b>Friendly Doctors</b></p>
                            <p class="card-text">Our Doctors are Friendly nature and Motivate to patients for recovery from Diseases. Always gives positive vibes.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5"><b>Medical Research</b></p>
                            <p class="card-text">We have dedicated Medical Research team which always try to do accountable work on diseases.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <img alt="" src="images/d6.jpg" height="320px" width="320px">
        </div>
    </div>
</div>

<hr>

<div class="container p-2">
    <p class="text-center fs-2"><b>Our Team</b></p>
    <div class="row">
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/d7.jpg" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr.Anandibai Gopalrao Joshi - First Women Doctor</p>
                    <p class="fs-7">(CEO & Chairman)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/d4.jpg" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr.Devi Shetty - Cardiac Surgeon</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/d5.jpg" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr.Naresh Trehan - Cardiac Surgeon</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/d1.jpg" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr.Prathap C. Reddy - Cardiologist</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="Component/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
