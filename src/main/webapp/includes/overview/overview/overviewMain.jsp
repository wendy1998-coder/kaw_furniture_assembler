<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wvandermeulen
  Date: 2/2/21
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="overview" method="get" style="border-bottom: 1px solid #fff">
    <div class="row">
        <div class="col">
            <label>Start date <input class="form-control" type="date" name="start-date" value="${sessionScope.infoFactory.beginDate}"></label>
        </div>
        <div class="col">
            <label class="text-center">Put in end date <br/><input type="checkbox" name="use-end-date" id="end-check"></label>
        </div>
        <div class="col">
            <label class="hidden" id="end-col">End date <input class="form-control" type="date" name="end-date"></label>
        </div>
        <div class="col">
            <input type="submit" value="Load transactions" class="submit" />
        </div>
    </div>
    <input type="hidden" name="from-form" value="true" />
</form>
<h3>Loaded transactions:</h3>
<c:choose>
    <c:when test="${sessionScope.infoFactory.loadedTransactions != null}">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs responsive mb-3" role="tablist">
            <li class="nav-item">
                <a href="#table" data-toggle="tab" role="tab" aria-controls="table" aria-selected="false"> Table </a>
            </li>
            <li class="nav-item">
                <a href="#overview" class="active" role="tab" data-toggle="tab" aria-controls="overview" aria-selected="true" id="overview-tab"> Overview </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content responsive">
            <jsp:include page="overviewTable.jsp" />
            <jsp:include page="overviewInteractive.jsp" />
        </div>
    </c:when>
    <c:otherwise>
        No loaded transactions
    </c:otherwise>
</c:choose>
