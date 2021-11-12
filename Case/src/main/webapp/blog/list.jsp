<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12-Nov-21
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../style/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
          integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>MyBlog</title>
</head>
<body>
<!-- ----------------------- HEADER ---------------------------- -->
<header style="background-color: #f8f9fa; position: sticky; top: 0; z-index: 111111;">
    <div class="container d-flex">
        <a href="./index.html" class="navbar-brand">MyBlog</a>

        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Favourite</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Category</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fab fa-facebook-f"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fab fa-twitter"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fab fa-instagram"></i>
                </a>
            </li>
        </ul>

        <div class="search-box d-flex">
            <input type="search" class="form-control form-control-dark" placeholder="Nhập tên blog ..."
                   aria-label="Search" style="width: 200px"/>
            <a href="#" class="nav-link">
                <i class="fas fa-search"></i>
            </a>
        </div>

        <button class="out" style="width: 70px; height: 20px">Log out</button>
    </div>
</header>
<!-- ----------------------- HEADER ---------------------------- -->

<!-- --------------------------- MAIN SECSION -----------------------  -->
<div id="main-secsion" class="mt-5">

    <%--    ------------------------ SLIDE ------------------------------%>
    <div id="carouselExampleCaptions" class="carousel slide container" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./img/anh-1.jpg" class="img-slide d-block w-100" alt="..."/>
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./img/anh-2.jpg" class="img-slide d-block w-100" alt="..."/>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./img/anh-3.jfif" class="img-slide d-block w-100" alt="..."/>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <%--    ------------------------ SLIDE ------------------------------%>

    <%-- --------------------------------------- LIST BLOG -----------------------------------%>
    <div class="container-fluid">
        <div class="row text-center mt-5 mb-5">
            <h1 class="text-title">All Blogs</h1>
        </div>

        <div class="row">
            <c:forEach var="blog" items="${list}">
                <div class="col-md-3 col-sm-6">
                    <div class="card" style="width: 100%;">
                        <img src="${blog.image}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${blog.name}</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <%----------------------------------------- LIST BLOG -----------------------------------%>
</div>
<!-- --------------------------- MAIN SECSION -----------------------  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>

