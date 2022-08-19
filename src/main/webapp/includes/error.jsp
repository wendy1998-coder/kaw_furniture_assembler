<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 31-12-2020
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${requestScope.errorMessage != null}">
    <p class="red">${requestScope.errorMessage}</p>
</c:if>
<c:if test="${requestScope.successMessage != null}">
    <p class="green">${requestScope.successMessage}</p>
</c:if>
