<%@ page import="model.Blog" %>
<%@ page import="java.util.List" %><%--
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
        <a href="./blogs" class="navbar-brand">MyBlog</a>

        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link" href="./blogs">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Favourite</a>
            </li>
            <c:if test="${-1<0}">
                <li class="nav-item">
                    <a class="nav-link" href="#">Category</a>
                </li>
            </c:if>

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

        <%--        Tìm kiếm--%>
        <form method="get" action="/blogs">
            <div class="search-box d-flex">
                <input name="name" type="text" class="form-control form-control-dark" placeholder="Nhập tên blog ..."
                       style="width: 200px"/>
                <input name="action" value="searchBlogByName" hidden>
                <button class="nav-link" style="border: none; background: none">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>

        <button class="out" style="width: 70px; height: 20px">Log out</button>
    </div>
</header>

<!-- --------------------------- MAIN SECSION -----------------------  -->
<div id="main-secsion" class="mt-5">

    <%--    ------------------------ SLIDE ------------------------------%>
<%--        <%--%>
<%--                List<Blog> list = (List<Blog>) request.getAttribute("list");--%>
<%--                Blog b1 = list.get(0);--%>
<%--                Blog b2 = list.get(1);--%>
<%--                Blog b3 = list.get(2);--%>
<%--                request.setAttribute("b1", b1);--%>
<%--                request.setAttribute("b2", b2);--%>
<%--                request.setAttribute("b3", b3);--%>
<%--            %>--%>
<%--    <div class="row">--%>
<%--        <div id="carouselExampleCaptions" class="carousel slide container" data-bs-ride="carousel">--%>
<%--            <div class="carousel-indicators">--%>
<%--                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"--%>
<%--                        aria-current="true" aria-label="Slide 1"></button>--%>
<%--                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"--%>
<%--                        aria-label="Slide 2"></button>--%>
<%--                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"--%>
<%--                        aria-label="Slide 3"></button>--%>
<%--            </div>--%>
<%--            <div class="carousel-item active">--%>

<%--                <img src="${b1.image}" class="img-slide d-block w-100" alt="..."/>--%>
<%--                <div class="carousel-caption d-none d-md-block">--%>
<%--                    <h5>${b1.name}</h5>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="carousel-item">--%>
<%--                <img src="${b2.image}" class="img-slide d-block w-100" alt="..."/>--%>
<%--                <div class="carousel-caption d-none d-md-block">--%>
<%--                    <h5>${b2.name}</h5>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="carousel-item">--%>
<%--                <img src="${b3.image}" class="img-slide d-block w-100" alt="..."/>--%>
<%--                <div class="carousel-caption d-none d-md-block">--%>
<%--                    <h5>${b3.name}</h5>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"--%>
<%--                    data-bs-slide="prev">--%>
<%--                <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--                <span class="visually-hidden">Previous</span>--%>
<%--            </button>--%>
<%--            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"--%>
<%--                    data-bs-slide="next">--%>
<%--                <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--                <span class="visually-hidden">Next</span>--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>
    <%-- --------------------------------------- LIST BLOG -----------------------------------%>
    <div class="row">
        <div class="container-fluid">
            <div class="container">
                <div class="row text-center mt-5 mb-5">
                    <h1 class="text-title">All Blogs</h1>
                </div>
                <div class="mb-3 d-flex justify-content-end align-items-center">
                    <span style="width: 90px">Thể loại</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Chọn thể loại
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <c:forEach items="${listType}" var="type">
                                <li>
                                    <a class="dropdown-item"
                                       href="/blogs?action=selectBlogByType&id=${type.id}">${type.name}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <c:forEach items="${listType}" var="type">
                    <a class="dropdown-item"
                       href="/blogs?action=selectBlogByType&id=${type.id}">${type.name}
                    </a>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="blog" items="${list}">
                    <div class="col-md-3 col-sm-6 mb-5">
                        <div class="card" style="width: 100%;">
                            <img src="${blog.image}" class="card-img-top" alt="..." style="height: 200px">
                            <div class="card-body text-center">
                                <h5 class="card-title text-center">${blog.name}</h5>
                                <div class="d-flex justify-content-around mt-2 mb-3">
                                <span>
                                    <i class="fas fa-calendar-alt text-primary" style="margin-right: 10px"></i>
                                        ${blog.date}
                                </span> <br>
                                    <span>
                                    <i class="fas fa-keyboard text-primary" style="margin-right: 10px"></i>
                                        ${blog.typeBlog.name}
                                </span> <br>
                                </div>
                                <a href="#" class="btn btn-primary">Xem bài viết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%----------------------------------------- LIST BLOG -----------------------------------%>
        </div>
    </div>
    <!-- ----------XXXXXXX---------- MAIN SECSION ---------XXXXX--------  -->
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

