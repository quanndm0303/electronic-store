<%-- 
    Document   : dashboard
    Created on : Mar 15, 2024, 2:14:25 PM
    Author     : Acer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colReorder-bootstrap4.css">
    </head>

    <body id="page-top">

        <jsp:include page="../common/admin/navbar.jsp"></jsp:include>
            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../common/admin/slideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                    <jsp:include page="../common/admin/breadCrumbs.jsp"></jsp:include>

                        <!-- Icon Cards-->
                    <%--<jsp:include page="../common/admin/iconCards.jsp"></jsp:include>--%>

                        <!-- DataTables Example -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i>
                                Product
                            </div>
                            Hello [${account.username}]
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th width="10%">Name</th>
                                                <th>Image</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Color</th>
                                                <th>Description</th>
                                                <th>Category</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listProduct}" var="p">
                                            <tr>
                                                <td name="id">${p.id}</td>
                                                <td name="name">${p.name}</td>
                                                <td name="image">
                                                    <img src="${p.image}" width="100" height="100" alt="alt"/>
                                                </td>
                                                <td name="quantity">${p.quantity}</td>
                                                <td name="price">${p.price}</td>
                                                <td name="color">${p.color}</td>
                                                <td name="description">${p.description}</td>
                                                <td name="category">
                                                    <c:forEach items="${listCategory}" var="c">
                                                        <c:if test="${c.id == p.categoryId}">
                                                            ${c.name}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-primary"
                                                            data-toggle="modal" 
                                                            data-target="#editProductModal"
                                                            onclick="editProductModal(this)">
                                                        Edit
                                                    </button>

                                                    <button type="button" class="btn btn-danger"
                                                            data-toggle="modal" data-target="#delete-product-modal"
                                                            onclick="deleteProductModal(${p.id})"/>
                                                    Delete
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>-->
                                </table>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>

                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
        <jsp:include page="../common/admin/logoutModal.jsp"></jsp:include>
        <jsp:include page="addProductModal.jsp"></jsp:include>
        <jsp:include page="deleteProductModal.jsp"></jsp:include>
        <jsp:include page="editProductModal.jsp"></jsp:include>
            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/assets/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/assets/js/admin/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/colReorder-bootstrap4-min.js"></script>


    </body>

</html>