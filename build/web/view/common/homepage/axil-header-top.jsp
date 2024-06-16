<%-- 
    Document   : axil-header-top
    Created on : Mar 11, 2024, 4:12:09 AM
    Author     : Acer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="axil-header-top">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-sm-6">
                <div class="header-top-dropdown">
                    <div class="dropdown">
                        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            English
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">English</a></li>
                            <li><a class="dropdown-item" href="#">Arabic</a></li>
                            <li><a class="dropdown-item" href="#">Spanish</a></li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            USD
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">USD</a></li>
                            <li><a class="dropdown-item" href="#">AUD</a></li>
                            <li><a class="dropdown-item" href="#">EUR</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="header-top-link">
                    <c:if test="${account != null}"> 
                        <ul class="quick-link">
                            <!--Nguoi dung-->
                            <c:if test="${account.roleId == 2}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard">My Account</a>
                                </li>
                            </c:if>
                            <!--Admin-->
                            <c:if test="${account.roleId == 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/dashboard">My Account</a>
                                </li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/authen?action=logout">Sign Out</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${account == null}"> 

                        <ul class="quick-link">
                            <li><a href="${pageContext.request.contextPath}/authen?action=signup">Sign Up</a></li>
                            <li><a href="${pageContext.request.contextPath}/authen?action=login">Sign In</a></li>
                        </ul>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
