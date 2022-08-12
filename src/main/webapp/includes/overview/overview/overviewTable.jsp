<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wvandermeulen
  Date: 2/2/21
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="tab-pane fade in" id="table">
    <table class="table table-bordered" id="datatable">
        <thead>
        <tr>
            <td>Date</td>
            <td>Amount</td>
            <td>Account</td>
            <td>Type</td>
            <td>Tagged description</td>
            <td>&nbsp;</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="transactionDB"
                   items="${sessionScope.infoFactory.loadedTransactions}">
            <c:choose>
                <c:when test="${requestScope.to_modify != null && requestScope.to_modify == transactionDB.id}">
                    <c:set var="form" value="true" />
                </c:when>
                <c:otherwise>
                    <c:set var="form" value="false" />
                </c:otherwise>
            </c:choose>
            <tr style="background-color: ${sessionScope.infoFactory.transactionTypes[transactionDB.type][1]}">
                <c:if test="${form.equals('false')}">
                    <td>${transactionDB.dateString}</td>
                    <td>${transactionDB.amount}</td>
                    <td>${transactionDB.account}</td>
                    <td>${transactionDB.type}</td>
                    <td>${transactionDB.tag}</td>
                </c:if>
                <td ${form.equals("true") ? "colspan=6" : "colspan=1"}>
                    <form action="overview" method="post" id="modify-form">
                        <input type="hidden" name="origin" value="table">
                        <input type="hidden" name="action" value="${form.equals("false") ? "start-modify" : "modify"}">
                        <input type="hidden" name="to_modify" value="${transactionDB.id}">
                        <div class="row">
                            <c:if test="${form.equals('true')}">
                                <div class="col">
                                    <label><input class="form-control" type="date" name="date" value="${transactionDB.dateString}" /></label>
                                </div>
                                <div class="col">
                                    <label><input name="amount" type="number" step=".01" class="form-control" value="${transactionDB.amount}" /></label>
                                </div>
                                <div class="col">
                                    <label><input class="form-control" name="account" value="${transactionDB.account}" /></label>
                                </div>
                                <div class="col">
                                    <label><input class="form-control" name="type" value="${transactionDB.type}" /></label>
                                </div>
                                <div class="col">
                                    <label><input class="form-control" name="tag" value="${transactionDB.tag}" /></label>
                                </div>
                            </c:if>
                            <div class="col">
                                <input type="submit" class="btn btn-info" value="Modify transaction">
                            </div>
                        </div>

                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>