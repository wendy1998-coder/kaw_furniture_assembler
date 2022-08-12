<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wvandermeulen
  Date: 2/2/21
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="transactionTypes" value="${sessionScope.infoFactory.transactionTypes}" />
<div class="panel panel-default">
    <c:choose>
        <c:when test="${sessionScope.infoFactory.moneySnapshot != null}">
            <c:choose>
                <c:when test="${sessionScope.infoFactory.loadedTransactions != null}">
                    <c:choose>
                        <c:when test="${sessionScope.requestedStart.isBefore(sessionScope.infoFactory.snapshotDate)
                        or sessionScope.requestedStart.isEqual(sessionScope.infoFactory.snapshotDate)}">
                            <c:choose>
                                <c:when test="${
                              sessionScope.usedEnd ?
                                (sessionScope.requestedEnd.isAfter(sessionScope.infoFactory.snapshotDate) ?
                                  true: false)
                                : true}">
                                    <!--if an end was requested, check whether that end was after the snapshot date.
                                    If so, date is between start and end and calculations can be done.
                                    If no end was requested, end is today and calculations can also be done.-->
                                    <div class="panel-heading">
                                        <span class="panel-title">Calculated money in different types from last snapshot</span>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table">
                                            <c:forEach var="entry" items="${sessionScope.infoFactory.calculatedSnapshot}">
                                                <c:if test="${entry.key != 'date'}">
                                                    <tr style="color: ${transactionTypes.containsKey(entry.key) ?
                                      transactionTypes.get(entry.key)[0] : "orange"}">
                                                        <td>${entry.key} on: </td>
                                                        <td>${sessionScope.infoFactory.lastDate}</td>
                                                        <td>&euro; ${entry.value}</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <div class="panel-footer text-right">
                                        <form method="post" action="overview">
                                            <input type="hidden" name="action" value="save" />
                                            <input type="hidden" name="origin" value="snapshot" />
                                            <input class="btn btn-info" type="submit" value="save snapshot">
                                        </form>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <p class="red">calculations can only be done when snapshot
                                        date is somewhere between start and end date of the requested transactions.</p>
                                    <jsp:include page="snapshotOverview.jsp" />
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <p class="red">calculations can only be done when snapshot
                                date is somewhere between start and end date of the requested transactions.</p>
                            <jsp:include page="snapshotOverview.jsp" />
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <jsp:include page="snapshotOverview.jsp" />
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <p class="red">No money snapshot could be found, so no calculations could be done.
                Fix this by adding a snapshot.json file to the saved folder with type=amount value pairs.</p>
        </c:otherwise>
    </c:choose>
</div>
