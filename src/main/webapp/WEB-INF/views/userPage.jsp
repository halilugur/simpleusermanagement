<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: halilugur
  Date: 29.09.2019
  Time: 00:08
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/all.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/bootstrap.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/bootstrap-grid.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/bootstrap-reboot.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/fontawesome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/regular.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/ui/css/solid.css"/>"/>

</head>
<body onload="createCaptcha()">

<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col" colspan="4">
                <button type="button" id="createUserButton" class="btn btn-success" data-toggle="modal" data-target="#createUserModal">
                    Kullanıcı Ekle
                </button>
            </th>
        </tr>
        <tr>
            <th scope="col">#</th>
            <th scope="col">İsim</th>
            <th scope="col">Soyisim</th>
            <th scope="col">Telefon Numarası</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.lastName}</td>
                <td>${user.handPhone}</td>
                <td>
                    <button type="button" class="btn btn-primary update-user"
                            data-user-id="${user.id}"
                            data-user-name="${user.name}"
                            data-user-last-name="${user.lastName}"
                            data-user-phone="${user.handPhone}"
                            data-toggle="modal" data-target="#createUserModal">
                        Güncelle
                    </button>
                    <button type="button" class="btn btn-danger delete-user" data-user-id="${user.id}"
                            data-toggle="modal" data-target="#deleteUserModal">
                        Sil
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="createUserModal" tabindex="-1" role="dialog" aria-labelledby="createUserModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form:form modelAttribute="userForm" action="${pageContext.request.contextPath}/" method="post"
                       id="createUserForm">
                <div class="modal-header">
                    <h5 class="modal-title" id="createUserModalLabel">Yeni Kullanıcı Oluştur</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id"/>
                    <div class="form-group">
                        <label for="name">İsim</label>
                        <input type="text" id="name" name="name" class="form-control">
                        <form:errors path="name" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Soyisim</label>
                        <input type="text" id="lastName" name="lastName" class="form-control">
                        <form:errors path="lastName" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="phone">Telefon</label>
                        <input type="text" id="phone" name="phone" class="form-control">
                        <form:errors path="phone" cssClass="error"/>
                    </div>
                    <div class="form-group">
                        <label for="phone">
                            <div id="captcha">
                            </div>
                        </label>
                        <input type="text" id="captchaText" placeholder="Güvenlik Kodu" name="captcha"
                               class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <button type="submit" class="btn btn-primary">Ekle</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-sm" id="deleteUserModal" tabindex="-1" role="dialog"
     aria-labelledby="deleteUserModal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <form id="deleteUser" action="${pageContext.request.contextPath}/delete" method="post">
            <div class="modal-content">
                <div class="modal-body">
                    Silmek istediğinize emin misiniz?
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="id" id="userId"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <button type="submit" class="btn btn-primary">Sil</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade bd-example-modal-sm" id="loading" tabindex="-1" role="dialog"
     aria-labelledby="loading" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body text-center">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/ui/js/jquery-3.3.1.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/bootstrap.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/all.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/jquery.maskedinput.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/bootstrap.bundle.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/fontawesome.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/regular.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/solid.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/captcha.js"/>" type="application/javascript"></script>
<script src="<c:url value="/ui/js/custom.js"/>" type="application/javascript"></script>

</body>
</html>
