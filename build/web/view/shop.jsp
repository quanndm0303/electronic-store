<%-- 
    Document   : shop
    Created on : Mar 11, 2024, 8:22:21 AM
    Author     : Acer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:41:49 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eTrade || Shop</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">

        <!-- CSS
        ============================================ -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/flaticon/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/slick.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/slick-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/jquery-ui.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/sal.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
    </head>


    <body class="sticky-header">
        <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->
        <a href="#top" class="back-to-top" id="backto-top"><i class="fal fa-arrow-up"></i></a>
        <!-- Start Header -->
        <header class="header axil-header header-style-5">
            <jsp:include page="common/homepage/axil-header-top.jsp"></jsp:include>
                <!-- Start Mainmenu Area  -->
                <div id="axil-sticky-placeholder"></div>
            <jsp:include page="common/homepage/axil-mainmenu.jsp"></jsp:include>
                <!-- End Mainmenu Area -->
            </header>
            <!-- End Header -->

            <main class="main-wrapper">
                <!-- Start Breadcrumb Area  -->
                <div class="axil-breadcrumb-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-8">
                                <div class="inner">
                                    <ul class="axil-breadcrumb">
                                        <li class="axil-breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="separator"></li>
                                        <li class="axil-breadcrumb-item active" aria-current="page">Shop</li>
                                    </ul>
                                    <h1 class="title">Explore All Products</h1>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-4">
                                <div class="inner">
                                    <div class="bradcrumb-thumb">
                                        <img src="${pageContext.request.contextPath}/assets/images/product/product-45.png" alt="Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumb Area  -->
            <!-- Start Shop Area  -->
            <div class="axil-shop-area axil-section-gap bg-color-white">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="axil-shop-top">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="category-select">

                                            <!-- Start Single Select  -->
                                            <!-- c <select class="single-select">
                                                <option>Categories</option>
                                            
                                            -->
                                            </select>
                                            <select class="single-select" id="categorySelect">
                                                <option value="-1" ${cateId.toString() == '-1' ? 'selected':""} >Categories</option>
                                                <c:forEach items="${listCategory}" var="cate">
                                                    <option value="${cate.id}" ${cateId.toString() eq cate.id.toString() ? 'selected':""} >${cate.name}</option>
                                                </c:forEach>
                                            </select>

                                            <script>
                                                document.getElementById('categorySelect').addEventListener('change', function () {
                                                    var categoryId = this.value;
                                                    window.location.href = 'shop?search=category&categoryId=' + categoryId;
                                                });
                                            </script>

                                            <!-- End Single Select  -->

                                        </div>
                                    </div>
<!--                                    <div class="col-lg-3">
                                        <div class="category-select mt_md--10 mt_sm--10 justify-content-lg-end">
                                             Start Single Select  
                                            <select class="single-select">
                                                <option>Sort </option>
                                                <option>Sort by Name</option>
                                                <option>Sort by Price</option>
                                            </select>
                                             End Single Select  
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row--15">
                        <c:forEach items="${listProduct}" var="p"> 
                            <div class="col-xl-3 col-lg-4 col-sm-6">
                                <div class="axil-product product-style-one has-color-pick mt--40">
                                    <div class="thumbnail">
                                        <a href="product-detail?id=${p.id}">
                                            <!--<img src="${pageContext.request.contextPath}/assets/images/product/electric/product-01.png" alt="Product Images">-->
                                            <img src="${p.image}" alt="Product Images">
                                        </a>
               
                                        <div class="product-hover-action">
                                            <ul class="cart-action">
                                                <li class="select-option"><a href="product-detail?id=${p.id}">Add to Cart</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="inner">
                                            <h5 class="title"><a href="single-product.html">${p.name}</a></h5>
                                            <div class="product-price-variant">
                                                <span class="price current-price">$ ${p.price}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- End Single Product  -->
                    </div>
                    <!-- base.css -->
                    <div class="text-end pt--30">
                        <ul class="pagination">
                                <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                <li><a href="${pageControl.urlPattern}page=${pageNumber}">${pageNumber}</a></li>
                                </c:forEach>
                            <li><a href="#">&gt;</a></li>
                        </ul>
                    </div>

                </div>
                <!-- End .container -->
            </div>
            <!-- End Shop Area  -->
            <!-- Start Axil Newsletter Area  -->
            <jsp:include page="common/homepage/axil-newsletter-area.jsp"></jsp:include>
                <!-- End Axil Newsletter Area  -->
            </main>


        <jsp:include page="common/homepage/service-area.jsp"></jsp:include>
            <!-- Start Footer Area  -->
            <footer class="axil-footer-area footer-style-2">
                <!-- Start Footer Top Area  -->
            <jsp:include page="common/homepage/footer-top.jsp"></jsp:include>
                <!-- End Footer Top Area  -->
                <!-- Start Copyright Area  -->
                <!-- End Copyright Area  -->
            </footer>
            <!-- End Footer Area  -->



        <!-- Header Search Modal End -->
        <div class="header-search-modal" id="header-search-modal">
            <button class="card-close sidebar-close"><i class="fas fa-times"></i></button>
            <div class="header-search-wrap">
                <div class="card-header">
                    <form action="shop" method="get">
                        <input type="hidden" name="search" value="searchByName"/>
                        <div class="input-group">
                            <input type="search" class="form-control" name="keyword" id="prod-search" placeholder="Write Something....">
                            <button type="submit" class="axil-btn btn-bg-primary" onclick="return this.closest('form').submit()"><i class="far fa-search"></i></button>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div class="search-result-header">
                        <a href="shop" class="view-all">View All</a>
                    </div>
                    <div class="psearch-results">
                        <div class="axil-product-list">
                            <div class="thumbnail">
                                <a href="single-product.html">
                                    <img src="${pageContext.request.contextPath}/assets/images/product/electric/product-09.png" alt="Yantiti Leather Bags">
                                </a>
                            </div>
                            <div class="product-content">
                                <div class="product-rating">
                                    <span class="rating-icon">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fal fa-star"></i>
                                    </span>
                                    <span class="rating-number"><span>100+</span> Reviews</span>
                                </div>
                                <h6 class="product-title"><a href="single-product.html">Media Remote</a></h6>
                                <div class="product-price-variant">
                                    <span class="price current-price">$29.99</span>
                                    <span class="price old-price">$49.99</span>
                                </div>
                                <div class="product-cart">
                                    <a href="cart.html" class="cart-btn"><i class="fal fa-shopping-cart"></i></a>
                                    <a href="wishlist.html" class="cart-btn"><i class="fal fa-heart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header Search Modal End -->





        <!-- JS
    ============================================ -->
        <!-- Modernizer JS -->
        <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr.min.js"></script>
        <!-- jQuery JS -->
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/js.cookie.js"></script>
        <!-- <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.style.switcher.js"></script> -->
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.ui.touch-punch.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/sal.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/counterup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/waypoints.min.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    </body>


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:41:50 GMT -->
</html>
