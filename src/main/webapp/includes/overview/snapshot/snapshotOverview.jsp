<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 14-1-2021
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel-heading">
    <span class="panel-title">Last money snapshot</span>
</div>
<!--TODO: hide type from overview / mark database-->
<!--TODO: add new type-->
<div class="panel-body">
    <table class="table">
        <c:set var="transactionTypes" value="${sessionScope.infoFactory.transactionTypes}" />
        <c:forEach var="snapshotEntry" items="${sessionScope.infoFactory.moneySnapshot}">
            <c:if test="${snapshotEntry.key != 'date'}">
                <tr style="color: ${transactionTypes.containsKey(snapshotEntry.key) ? transactionTypes.get(snapshotEntry.key)[0] : "orange"}">
                    <td>${snapshotEntry.key.replaceAll("_", "-")} on: </td>
                    <td>${sessionScope.infoFactory.snapshotDate.toString()}</td>
                    <td>&euro; ${snapshotEntry.value}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>
<div class="panel-footer">

</div>

