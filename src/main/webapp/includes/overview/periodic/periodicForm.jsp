<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wvandermeulen
  Date: 1/29/21
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col">
        Amount
    </div>
    <div class="col">
        Description
    </div>
    <div class="col">

    </div>
</div>
<c:choose>
    <c:when test="${sessionScope.infoFactory.periodicTransactions == null}">
        <jsp:include page="periodicFormRow.jsp">
            <jsp:param name="amount" value=""/>
            <jsp:param name="description" value=""/>
            <jsp:param name="add_btn" value="true" />
            <jsp:param name="btn_addon" value="new" />
        </jsp:include>
    </c:when>
    <c:otherwise>
        <c:set var="count" value="0" scope="page" />
        <c:set var="btn" value="false" />
        <c:forEach var="transactionEntry" items="${sessionScope.infoFactory.periodicTransactions}">
            <c:if test="${transactionEntry.key != 'total'}">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <c:if test="${count == sessionScope.infoFactory.periodicTransactions.size() - 1}">
                    <c:set var="btn" value="true" />
                </c:if>
                <jsp:include page="periodicFormRow.jsp">
                    <jsp:param name="amount" value="${transactionEntry.value}" />
                    <jsp:param name="description" value="${transactionEntry.key}" />
                    <jsp:param name="add_btn" value="${btn}" />
                    <jsp:param name="btn_addon" value="modify" />
                </jsp:include>
            </c:if>
        </c:forEach>
    </c:otherwise>
</c:choose>
<div id="next-form-row" class="hidden row">
    <div class="col">
        <input name="amount" type="number" step=".01" class="form-control"/>
    </div>
    <div class="col">
        <input name="description" class="form-control" />
    </div>
    <div class="col">
        <div id="add-new-next" class="btn-responsive btn">
            <img src="includes/images/add.png" alt="add-sign" class="img-responsive add-image">
        </div>
    </div>
</div>
