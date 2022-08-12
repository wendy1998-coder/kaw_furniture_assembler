<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="transactionTypes" value="${sessionScope.infoFactory.transactionTypes}" />
<div class="panel panel-default">
    <div class="panel-heading">
        <span class="panel-title">Periodic transactions</span>
    </div>
    <div class="panel-body">
        <c:choose>
            <c:when test="${sessionScope.infoFactory.periodicTransactions == null}">
                No periodic transactions found, use this form to create them.
                <form action="overview" method="post" id="add-form">
                    <input type="hidden" name="origin" value="periodic">
                    <input type="hidden" name="action" value="create">
                    <jsp:include page="periodicForm.jsp" />
                    <input type="submit" id="create-new-submit" class="hidden">
                </form>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${requestScope.containsKey('modify')}">
                        <form action="overview" method="post" id="modify-form">
                            <input type="hidden" name="origin" value="periodic">
                            <input type="hidden" name="action" value="create">
                            <jsp:include page="periodicForm.jsp" />
                            <input type="submit" id="modify-submit" class="hidden">
                        </form>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-3">
                                Amount
                            </div>
                            <div class="col">
                                Description
                            </div>
                        </div>
                        <c:forEach var="transactionEntry" items="${sessionScope.infoFactory.periodicTransactions}">
                            <c:if test="${transactionEntry.key != 'total'}">
                                <div class="row" style="color: ${transactionTypes.periodic[0]}">
                                    <div class="col-3">
                                        &euro; ${transactionEntry.value}
                                    </div>
                                    <div class="col">
                                            ${transactionEntry.key}
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <div class="row" style="color: ${transactionTypes.periodic[0]}">
                            <div class="col-3" style="border-top: 1px solid #fff">
                                &euro; ${sessionScope.infoFactory.periodicTransactions.get("total")}
                            </div>
                            <div class="col">
                                total
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="panel-footer text-right">
        <c:choose>
            <c:when test="${sessionScope.infoFactory.periodicTransactions == null}">
                <button class="btn btn-info" id="create-new-btn">Save periodic transactions</button>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${requestScope.containsKey('modify')}">
                        <button class="btn btn-warning" id="modify-btn">Save transactions</button>
                    </c:when>
                    <c:otherwise>
                        <form action="overview" method="post">
                            <input type="hidden" name="origin" value="periodic">
                            <input type="hidden" name="action" value="start-modify">
                            <input type="submit" class="btn btn-info" value="Modify transactions">
                        </form>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
</div>