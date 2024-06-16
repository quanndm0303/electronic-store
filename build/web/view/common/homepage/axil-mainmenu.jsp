<%-- 
    Document   : axil-mainmenu
    Created on : Mar 11, 2024, 4:13:51 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="axil-mainmenu">
    <div class="container">
        <div class="header-navbar">
            <div class="header-brand">
                <a href="${pageContext.request.contextPath}/home" class="logo logo-dark">
                    <img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="Site Logo">
                </a>

            </div>
            <div class="header-main-nav">
                <!-- Start Mainmanu Nav -->
                <nav class="mainmenu-nav">
                    <button class="mobile-close-btn mobile-nav-toggler"><i class="fas fa-times"></i></button>
                    <div class="mobile-nav-brand">
                        <a href="home" class="logo">
                            <img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="Site Logo">
                        </a>
                    </div>
                    <ul class="mainmenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/shop">Shop</a>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="axil-submenu">
                                <li><a href="payment">Cart</a></li>
                                <li><a href="forgot-password.html">Forgot Password</a></li>
                                <li><a href="reset">Reset Password</a></li>
                            </ul>
                        </li>
<!--                        <li><a href="about-us.html">About</a></li>
                        <li><a href="contact.html">Contact</a></li>-->
                    </ul>
                </nav>
                <!-- End Mainmanu Nav -->
            </div>
<!--                <form action="shop" method="get">
                        <input type="hidden" name="search" value="searchByName"/>
                        <div class="input-group">
                            <input type="search" class="form-control" name="keyword" id="prod-search" placeholder="Write Something....">
                            <button type="submit" class="axil-btn btn-bg-primary" onclick="return this.closest('form').submit()"><i class="far fa-search"></i></button>
                        </div>
                    </form>-->
            <div class="header-action">
                <ul class="action-list">
                    <li class="axil-search d-xl-block d-none">
                        <form action="shop" method="get">
                            <input type="hidden" name="search" value="searchByName"/>
                        <input type="search" class="placeholder product-search-input" name="keyword" id="search2" value="" maxlength="128" placeholder="What are you looking for?" autocomplete="off">
                        <button type="submit" class="icon wooc-btn-search" onclick="return this.closest('form').submit()>
                            <i class="flaticon-magnifying-glass"></i>
                        </button>
                        </form>
                    </li>
                    <li class="axil-search d-xl-none d-block">
                        <a href="javascript:void(0)" class="header-search-icon" title="Search">
                            <i class="flaticon-magnifying-glass"></i>
                        </a>
                    </li>
                    <li class="wishlist">
                        <a href="wishlist.html">
                            <i class="flaticon-heart"></i>
                        </a>
                    </li>
                    <li class="shopping-cart">
                        <a href="payment" >
                            <i class="flaticon-shopping-cart"></i>
                        </a>
                    </li>
                    
                    <li class="axil-mobile-toggle">
                        <button class="menu-btn mobile-nav-toggler">
                            <i class="flaticon-menu-2"></i>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
