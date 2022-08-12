<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 15-1-2021
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col">
        <input name="amount" type="number" step=".01" class="form-control" value="${param.amount}"/>
    </div>
    <div class="col">
        <input name="description" class="form-control" value="${param.description}"/>
    </div>
    <div class="col">
        <c:if test="${param.add_btn}">
            <div id="add-new-now-${param.btn_addon}" class="btn-responsive btn">
                <img src="includes/images/add.png" alt="add-sign" class="img-responsive add-image">
            </div>
        </c:if>
    </div>
</div>
