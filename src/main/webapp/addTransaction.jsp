<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 9-1-2021
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="includes/head.jsp">
        <jsp:param name="pageTitle" value="Custom transaction" />
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-2 p-0" id="vue">
            <jsp:include page="includes/menu.jsp" />
        </div>
        <div class="col-8">
            <jsp:include page="includes/error.jsp" />
            <div class="row">
                <div class="col">
                    <h3>Add custom transaction</h3>
                    <c:choose>
                        <c:when test="${sessionScope.infoFactory == null}">
                            <p class="red">No transaction types were loaded,
                                go to the homepage and come back to fix this.</p>
                        </c:when>
                        <c:otherwise>
                            <form action="transactions" method="get">
                                <label>Date: <input name="date"
                                                    type="date"
                                                    required="required"
                                                    class="form-control"
                                /></label><br/>
                                <label>Amount: <input name="amount"
                                                      type="number"
                                                      step=".01"
                                                      class="form-control"
                                                      required="required"
                                /></label><br/>
                                <label>Account: <input name="account"
                                                       class="form-control"
                                                       required="required"
                                /></label><br/>
                                <label>Type of transaction: <select name="type" class="form-control">
                                    <c:forEach var="type" items="${sessionScope.infoFactory.transactionTypes.keySet()}">
                                        <option value="${type}">${type}</option>
                                    </c:forEach>
                                </select></label><br/>
                                <label>Tag: <input name="tag"
                                                   class="form-control"
                                                   required="required"
                                /></label><br/>
                                <label>
                                    <input type="checkbox" name="checkDup" checked="checked"> Check for duplicates
                                </label><br/>
                                <input type="submit" value="Add to database" class="submit">
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:if test="${requestScope.duplicates != null}">
                    <div class="col">
                        <p><span class="red">Some duplicates were found after check,
                            so transaction wasn't added to database.</span><br/>
                            Below, the found duplicates are displayed.
                            If you want to add the transaction after review,
                            send the form again without duplicates check and the transaction will be added.
                        </p>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <td>Date</td>
                                <td>Amount</td>
                                <td>Account</td>
                                <td>Type</td>
                                <td>Tagged description</td>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="transactionDB" items="${requestScope.duplicates}">
                                    <tr>
                                        <td>${transactionDB.dateString}</td>
                                        <td>${transactionDB.amount}</td>
                                        <td>${transactionDB.account}</td>
                                        <td>${transactionDB.type}</td>
                                        <td>${transactionDB.tag}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp" />
<script src="js/vue/addTransaction.js"></script>
</body>
</html>
