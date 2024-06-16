<%-- 
    Document   : cart
    Created on : Mar 16, 2024, 5:27:00 PM
    Author     : Acer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:42:04 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eTrade || Cart</title>
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
            <jsp:include page="../../common/homepage/axil-header-top.jsp"></jsp:include>
                <!-- Start Mainmenu Area  -->
                <div id="axil-sticky-placeholder"></div>
            <jsp:include page="../../common/homepage/axil-mainmenu.jsp"></jsp:include>
                <!-- End Mainmenu Area -->
            </header>
            <!-- End Header -->

            <main class="main-wrapper">

                <!-- Start Cart Area  -->
                <div class="axil-product-cart-area axil-section-gap">
                    <div class="container">
                        <div class="axil-product-cart-wrap">
                            <div class="product-table-heading">
                                <h4 class="title">Your Cart</h4>
                            </div>
                            <div class="table-responsive">
                                <table class="table axil-product-table axil-cart-table mb--40">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="product-remove"></th>
                                            <th scope="col" class="product-thumbnail">Product</th>
                                            <th scope="col" class="product-title"></th>
                                            <th scope="col" class="product-price">Price</th>
                                            <th scope="col" class="product-quantity">Quantity</th>
                                            <th scope="col" class="product-subtotal">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${cart.listOrderDetails}" var="od"> 
                                        <c:forEach items="${listProduct}" var="product"> 
                                            <c:if test="${product.id == od.productId}">
                                                <c:set var="p" value="${product}"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <tr>
                                            <td class="product-remove">
                                                <form action="payment?action=delete" method="post">
                                                    <input type="hidden" name="id" value="${p.id}"/>
                                                    <a href="#" class="remove-wishlist" onclick="return this.closest('form').submit()"><i class="fal fa-times"></i></a>
                                                </form>
                                            </td>
                                            <td class="product-thumbnail"><a href="single-product.html"><img src="${p.image}" alt="Digital Product"></a></td>
                                            <td class="product-title"><a href="single-product.html">${p.name}</a></td>
                                            <td class="product-price" data-title="Price"><span class="currency-symbol">$</span>${p.price}</td>

                                            <!--<form action="payment?action=change-quantity" method="post">-->

                                            <td class="product-quantity" data-title="Qty">
                                                <div class="pro-qty">
                                                    <form action="payment?action=change-quantity" method="POST">
                                                        <input type="hidden" name="id" value="${p.id}"/>
                                                        <span class="dec qtybtn" onclick="updateQuantity(this, -1)">-</span>
                                                        <input type="number" name="quantity" class="quantity-input" value="${od.quantity}" />
                                                        <span class="inc qtybtn" onclick="updateQuantity(this, 1)">+</span>
                                                    </form>
                                                </div>
                                            </td>
                                            <td class="product-subtotal" data-title="Subtotal"><span class="currency-symbol">$</span>${p.price * od.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                            <h3 style="color: blue">${line}</h3>
                        <div class="cart-update-btn-area">
                            <div class="input-group product-cupon" >
                                <div class="product-cupon-btn">
                                    <form action="shop">
                                        <button type="submit" class="axil-btn btn-outline">Continute Shopping</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 offset-xl-7 offset-lg-5">
                                <div class="axil-order-summery mt--80">
                                    <h5 class="title mb--20">Order Summary</h5>
                                    <div class="summery-table-wrap">
                                        <table class="table summery-table mb--30">
                                            <tbody>
                                                <tr class="order-subtotal">
                                                    <td>Subtotal</td>
                                                    <td id="subtotal">$117.00</td>
                                                </tr>
                                                <tr class="order-shipping">
                                                    <td>Shipping</td>
                                                    <td>
                                                        <div class="input-group">
                                                            <label for="radio1">Free Shipping</label>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr class="order-tax">
                                                    <td>State Tax</td>
                                                    <td>$8.00</td>
                                                </tr>
                                                <tr  class="order-total">
                                                    <td>Total</td>
                                                    <td id="totalcart" class="order-total-amount">$125.00</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <form action="checkout?action=check-out" method="post">
                                        <a href="#" class="axil-btn btn-bg-primary checkout-btn" 
                                           onclick="return this.closest('form').submit()">Process to Checkout</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Cart Area  -->

        </main>

        <jsp:include page="../../common/homepage/service-area.jsp"></jsp:include>

            <!-- Start Footer Area  -->
        <jsp:include page="../../common/homepage/footer-top.jsp"></jsp:include>
            <!-- End Footer Area  -->

            <!-- Product Quick View Modal Start -->

            <!-- Product Quick View Modal End -->

            <!-- Header Search Modal End -->

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

        <script>
                                               window.onload = updateSubTotal();
                                               function updateQuantity(element, change) {
                                                   let inputQuantity = element.parentElement.querySelector('input[name=quantity]');
                                                   let currentQuantity = parseInt(inputQuantity.value) + change;
                                                   if(currentQuantity < 1) {
                                                       currentQuantity = 1;
                                                   }
                                                   inputQuantity.value = currentQuantity;
                                                   element.closest('form').submit();
                                               }
                                               
                                               function updateSubTotal() {
                                                   let totalPriceOfEachProduct = document.querySelectorAll('td.product-subtotal');
                                                   let totalCart = 0;
                                                   totalPriceOfEachProduct.forEach(e => {
                                                       let totalPriceString = e.textContent.trim().replace('$', ''); // Loại bỏ ký tự "$"
                                                       let totalPrice = parseFloat(totalPriceString); // Chuyển đổi thành số dạng float
                                                       totalCart += totalPrice;
                                                   });
                                                   document.querySelector('#subtotal').innerHTML = "$" + totalCart;
                                                   document.querySelector('#totalcart').innerHTML = "$" + (totalCart + 8);
                                               }
        </script>

    </body>


    <!-- Mirrored from new.axilthemes.com/demo/template/etrade/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Mar 2024 09:42:04 GMT -->
</html>