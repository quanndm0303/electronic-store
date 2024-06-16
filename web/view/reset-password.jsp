<%-- 
    Document   : reset-password
    Created on : Mar 18, 2024, 12:06:19 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/reset-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:42:05 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eTrade || Reset Password</title>
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
                    <div class="col-md-6">
                        <a href="<%=request.getContextPath()%>/home" class="site-logo"><img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="logo"></a>
                    </div>
                    <div class="col-md-6">
                        <div class="singin-header-btn">
                            <p>Already a member?</p>
                            <a href="authen?action=login" class="axil-btn btn-bg-secondary sign-up-btn">Sign In</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Header -->

            <div class="row">
                <div class="col-xl-4 col-lg-6">
                    <div class="axil-signin-banner bg_image bg_image--10">
                        <h2 class="title">We Offer the Best Products</h2>
                    </div>
                </div>
                <div class="col-lg-6 offset-xl-2">
                    <div class="axil-signin-form-wrap">
                        <div class="axil-signin-form">
                            <h3 class="title mb--35">Reset Password</h3>
                            <form class="singin-form" action="reset" method="post">
                                <div class="form-group">
                                    <label>New password</label>
                                    <input type="password" class="form-control" name="password1" value="" placeholder="Enter your new password">
                                </div>
                                <div class="form-group">
                                    <label>Confirm password</label>
                                    <input type="password" class="form-control" name="password2" value="" placeholder="Confirm your password">
                                </div>
                                <span style="color: red"/>${error}
                                <div class="form-group">
                                    <button type="submit" class="axil-btn btn-bg-primary submit-btn">Reset Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS
    ============================================ -->
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


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/reset-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:42:05 GMT -->
</html>