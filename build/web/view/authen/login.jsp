<%-- 
    Document   : login
    Created on : Mar 16, 2024, 3:15:56 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:40:32 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eTrade || Sign In</title>
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


    <body>
        <div class="axil-signin-area">

            <!-- Start Header -->
            <div class="signin-header">
                <div class="row align-items-center">
                    <div class="col-sm-4">
                        <a href="<%=request.getContextPath()%>/home" class="site-logo"><img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="logo"></a>
                    </div>
                    <div class="col-sm-8">
                        <div class="singin-header-btn">
                            <p>Not a member?</p>
                            <a href="authen?action=signup" class="axil-btn btn-bg-secondary sign-up-btn">Sign Up Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Header -->

            <div class="row">
                <div class="col-xl-4 col-lg-6">
                    <div class="axil-signin-banner bg_image bg_image--9">
                        <h3 class="title">We Offer the Best Products</h3>
                    </div>
                </div>
                <div class="col-lg-6 offset-xl-2">
                    <div class="axil-signin-form-wrap">
                        <div class="axil-signin-form">
                            <h3 class="title">Sign in to eTrade.</h3>
                            <p class="b2 mb--55">Enter your detail below</p>
                            <form class="singin-form" action="authen?action=login" method="post">
                                <div class="form-group">
                                    <label>Email or Username</label>
                                    <input type="text" class="form-control" name="username" value="" placeholder="Enter your account">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password" value="" placeholder="Enter your password">
                                </div>
                                <span style="color: red"/>${error}
                                <div class="form-group d-flex align-items-center justify-content-between">
                                    <button type="submit" class="axil-btn btn-bg-primary submit-btn">Sign In</button>
                                    <a href="forgot-password.html" class="forgot-btn">Forget password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:40:32 GMT -->
</html>