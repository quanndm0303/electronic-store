<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/single-product.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:41:50 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eTrade || Single Product</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png">

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


    <body class="sticky-header overflow-md-visible">
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
            <jsp:include page="common/homepage/header-top-campaign.jsp"></jsp:include>
            </header>
            <!-- End Header -->

            <main class="main-wrapper">
                <!-- Start Shop Area  -->
                <div class="axil-single-product-area bg-color-white">
                    <div class="single-product-thumb axil-section-gap pb--20 pb_sm--0 bg-vista-white">
                        <div class="container">
                            <div class="row row--25">
                                <div class="col-lg-6 mb--40">
                                    <div class="h-100">
                                        <div class="position-sticky sticky-top">
                                            <div class="row row--10">
                                                <div class="col-6 mb--20">
                                                    <div class="single-product-thumbnail axil-product thumbnail-grid">
                                                        <div class="thumbnail">
                                                            <img class="img-fluid" src="${product.image}" alt="Product Images">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End .col -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 mb--40">
                                <div class="h-100">
                                    <div class="position-sticky sticky-top">
                                        <div class="single-product-content">
                                            <div class="inner">
                                                <h2 class="product-title">${product.name}</h2>
                                                <span class="price-amount">$ ${product.price}</span>
                                                <div class="product-rating">
                                                    <div class="star-rating">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </div>
                                                </div>
                                                <h4 class="primary-color mb--40 desc-heading">Description</h4>
                                                <p class="description">${product.description}</p>

                                                <div class="product-variations-wrapper">

                                                    <!-- Start Product Variation  -->
                                                    <!-- End Product Variation  -->
                                                </div>

                                                <!-- Start Product Action Wrapper  -->
                                                <form action="payment?action=add-product" method="post">
                                                    <input type="hidden" name="id" value="${product.id}"/>
                                                    <div class="product-action-wrapper d-flex-center">
                                                        <!-- Start Quentity Action  -->
                                                        <div class="pro-qty mr--20"><input type="text" name="quantity" value="1"></div>
                                                        <!-- End Quentity Action  -->

                                                        <!-- Start Product Action  -->
                                                        <ul class="product-action d-flex-center mb--0">
                                                            <li class="add-to-cart"><a href="#" class="axil-btn btn-bg-primary" onclick="return this.closest('form').submit()">
                                                                    Add to Cart</a></li>
                                                            <li class="wishlist"><a href="wishlist.html" class="axil-btn wishlist-btn"><i class="far fa-heart"></i></a></li>
                                                        </ul>
                                                        <!-- End Product Action  -->

                                                    </div>
                                                </form>
                                                <!-- End Product Action Wrapper  -->

                                                <div class="product-desc-wrapper pt--80 pt_sm--60">
                                                    <ul class="pro-des-features pro-desc-style-two">
                                                        <li class="single-features">
                                                            <div class="icon">
                                                                <img src="${pageContext.request.contextPath}/assets/images/product/product-thumb/icon-3.png" alt="icon">
                                                            </div>
                                                            Easy Returns
                                                        </li>
                                                        <li class="single-features">
                                                            <div class="icon">
                                                                <img src="${pageContext.request.contextPath}/assets/images/product/product-thumb/icon-2.png" alt="icon">
                                                            </div>
                                                            Quality Service
                                                        </li>
                                                        <li class="single-features">
                                                            <div class="icon">
                                                                <img src="${pageContext.request.contextPath}/assets/images/product/product-thumb/icon-1.png" alt="icon">
                                                            </div>
                                                            Original Product
                                                        </li>
                                                    </ul>
                                                    <!-- End .pro-des-features -->
                                                </div>
                                                <!-- End .product-desc-wrapper -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End .single-product-thumb -->

            </div>
            <!-- End Shop Area  -->
            <!-- Start Axil Newsletter Area  -->
            <jsp:include page="common/homepage/axil-newsletter-area.jsp"></jsp:include>

                <!-- End Axil Newsletter Area  -->
            </main>

        <jsp:include page="common/homepage/service-area.jsp"></jsp:include>

            <!-- Start Footer Area  -->
        <jsp:include page="common/homepage/footer-top.jsp"></jsp:include>
            <!-- End Footer Area  -->

            <!-- Product Quick View Modal Start -->
        
        <!-- Product Quick View Modal End -->

        <!-- Header Search Modal End -->
  
        <!-- Header Search Modal End -->



 

        <!-- JS
    ============================================ -->
        <!-- Modernizer JS -->
        <script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/assets/js/vendor/modernizr.min.js"></script>
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


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/single-product.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:41:53 GMT -->
</html>