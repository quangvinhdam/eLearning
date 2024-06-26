<%@tag description="Page layout" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="head" fragment="true"%>
<%@attribute name="nav" fragment="true"%>
<%@attribute name="script" fragment="true"%>
<%@attribute name="nav_active"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>eLEARNING</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <jsp:invoke fragment="head"/>
</head>
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="${pageContext.request.contextPath}" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="nav-item dropdown me-3">
                <a class="nav-link dropdown-toggle rounded" href="#" id="exploreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: 1px solid var(--bs-primary);">Explore</a>
                <ul class="dropdown-menu" aria-labelledby="exploreDropdown">
                    <c:forEach var="category" items="${category_list}">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/courses?category=${category}">${category}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <form action="${pageContext.request.contextPath}/search" class="d-flex me-3">
                <input class="form-control me-2" type="search" name="query" value="${requestScope.query}" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="${pageContext.request.contextPath}/contact.jsp" id="contact" class="nav-item nav-link ">Contact</a>
                <a href="${pageContext.request.contextPath}/about.jsp" id="about" class="nav-item nav-link">About</a>
                <a href="${pageContext.request.contextPath}/courses" id="courses" class="nav-item nav-link">Courses</a>
               
                <jsp:invoke fragment="nav"/>
                <c:if test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login" class="nav-item nav-link">Login</a>
                </c:if>
            </div>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Join Now<i class="fa fa-arrow-right ms-3"></i></a>
                </c:when>
                <c:otherwise>
                    <div class="d-none d-lg-block nav-item dropdown">
                        <a class="btn btn-primary py-4 px-lg-5 dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.firstName and not empty sessionScope.user.lastName}">
                                    ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                </c:when>
                                <c:otherwise>
                                    ${sessionScope.user.account.email}
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <div class="dropdown-menu fade-down m-0">
                            <a href="#" class="dropdown-item">Profile</a>
                            <a href="#" class="dropdown-item">Account</a>
                            <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    <!-- Navbar End -->

    <jsp:doBody/>

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Quick Link</h4>
                    <a class="btn btn-link" href="${pageContext.request.contextPath}/about.jsp">About Us</a>
                    <a class="btn btn-link" href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
                    <a class="btn btn-link" href="${pageContext.request.contextPath}">Privacy Policy</a>
                    <a class="btn btn-link" href="${pageContext.request.contextPath}">Terms & Condition</a>
                    <a class="btn btn-link" href="${pageContext.request.contextPath}">FAQs & Help</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Contact</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>FPT University, Hoa Lac, Thach That, Ha Noi, Viet Nam</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href="${pageContext.request.contextPath}"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social" href="${pageContext.request.contextPath}"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href="${pageContext.request.contextPath}"><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-light btn-social" href="${pageContext.request.contextPath}"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
               
            </div>
            
        </div>
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">eLEARNING</a>, All Right Reserved.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="${pageContext.request.contextPath}">Home</a>
                            <a href="${pageContext.request.contextPath}">Cookies</a>
                            <a href="${pageContext.request.contextPath}">Help</a>
                            <a href="${pageContext.request.contextPath}">FQAs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script>
        const message = '${requestScope.message}';
        if (message) {
            alert(message);
        }

        const navItems = document.getElementsByClassName("nav-item");
        for (let i = 0; i < navItems.length; i++) {
            if ('${nav_active}' === navItems[i].getAttribute('id')) {
                navItems[i].classList.add("active");
            }
        }
    </script>
    <jsp:invoke fragment="script"/>
</body>
