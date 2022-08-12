<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 2-1-2021
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="includes/head.jsp">
        <jsp:param name="pageTitle" value="File Processor" />
    </jsp:include>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 p-0" id="vue">
                <jsp:include page="includes/menu.jsp" />
            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col-7">
                        <jsp:include page="includes/error.jsp" />
                    </div>
                    <div class="col-sm-3">
                        <form action="file" class="text-right">
                            <input type="hidden" value="load" name="action" />
                            <input class="btn btn-info" type="submit" value="Load files from disk">
                        </form>
                    </div>
                    <div class="col-sm-2">
                        <form action="file">
                            <input type="hidden" value="clean" name="action" />
                            <input class="btn btn-danger" type="submit" value="Clean out files">
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h3>Process file:</h3>
                        <c:choose>
                            <c:when test="${sessionScope.files.size() > 0}">
                                <form method="get" action="process">
                                    <label class="label">File to process: <select class="form-control" name="filename" id="fileSelector">
                                        <c:forEach var="file" items="${sessionScope.files}">
                                            <option value="${file}">${file}</option>
                                        </c:forEach>
                                    </select></label><br/>
                                    <label>
                                        <input type="checkbox" name="remove"> Remove File (after other processing if applicable)
                                    </label><br/>
                                    <label>
                                        <input type="checkbox" name="process" id="processCheck" checked="checked"> Process file
                                    </label><br/>
                                    <p class="red hidden" id="csv-warning">Can only process csv files.</p>
                                    <div id="separator">
                                        <label>
                                            Separator <select name="separator" class="form-control">
                                            <option value=";" selected="selected">;</option>
                                            <option value=",">,</option>
                                        </select>
                                        </label>
                                    </div>
                                    <input type="submit" value="Perform actions" class="submit" />
                                </form>
                            </c:when>
                            <c:otherwise>
                                <p class="red">No files loaded into memory, either load the files or upload a new one.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col">
                        <h3>Upload new file</h3>
                        <form action = "file" method = "post" enctype = "multipart/form-data">
                            <input type = "file" name = "file" size = "50" />
                            <br />
                            <input type = "submit" value = "Upload File" class="submit" />
                        </form>
                    </div>
                </div>
                <c:if test="${sessionScope.transactions != null}">
                    <c:if test="${sessionScope.transaction != null}">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Add transaction to database
                            </div>
                            <div class="panel-body">
                                <c:choose>
                                    <c:when test="${sessionScope.infoFactory.transactionTypes == null}">
                                        <p class="red">No transaction types were loaded,
                                            go to the homepage and come back to fix this.</p>
                                    </c:when>
                                    <c:otherwise>
                                        Transaction being added:
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Account</th>
                                                <th>External Party</th>
                                                <th>Amount</th>
                                                <th>Description</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:set var="transaction" value="${sessionScope.transaction}" />
                                                <tr>
                                                    <td>${transaction.dateString}</td>
                                                    <td>${transaction.account}</td>
                                                    <td>${transaction.to}</td>
                                                    <td>${transaction.amount}</td>
                                                    <td>${transaction.description}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <c:if test="${requestScope.duplicates != null}">
                                            <p class="red">
                                                Possible duplicates in database:
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
                                        </c:if>
                                        <form action="process" method="post">
                                            <input type="hidden" name="action" value="database" />
                                            <label>Type of transaction: <select name="type" class="form-control">
                                            <c:forEach var="type" items="${sessionScope.infoFactory.transactionTypes.keySet()}">
                                                <option value="${type}">${type}</option>
                                            </c:forEach>
                                            </select></label><br/>
                                            <label>Tag: <input name="tag" class="form-control" /></label><br/>
                                            <input type="submit" value="Add to database" class="submit">
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>
                    <div class="row">
                        <div class="col">
                            <h3>Loaded file transactions:</h3>
                        </div>
                        <div class="col text-right">
                            <form action="process" method="post">
                                <input type="hidden" name="index" value="all" />
                                <input type="hidden" name="action" value="remove" />
                                <input type="submit" class="btn btn-danger"
                                       value="Remove all transactions from memory">
                            </form>
                        </div>
                    </div>
                    <table class="table table-bordered table-striped" id="datatable">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Account</th>
                            <th>External Party</th>
                            <th>Amount</th>
                            <th>Added to Database</th>
                            <th> </th>
                            <th> </th>
                            <th> </th>
                            <th>Description</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="transaction" items="${sessionScope.transactions}">
                            <tr>
                                <td>${transaction.dateString}</td>
                                <td>${transaction.account}</td>
                                <td>${transaction.to}</td>
                                <td>${transaction.amount}</td>
                                <td><input type="checkbox" ${transaction.inDatabase ? "checked='checked'" : "' '"}></td>
                                <td>
                                    <form action="process" method="post">
                                        <input type="hidden" name="index" value="${sessionScope.transactions.indexOf(transaction)}" />
                                        <input type="hidden" name="action" value="inDatabase" />
                                        <input type="submit" class="btn btn-info btn-sm" value="Mark as already in database">
                                    </form>
                                </td>
                                <td>
                                    <form action="process" method="post">
                                        <input type="hidden" name="index" value="${sessionScope.transactions.indexOf(transaction)}" />
                                        <input type="hidden" name="action" value="database" />
                                        <input type="submit" class="btn btn-success btn-sm" value="Add to database">
                                    </form>
                                </td>
                                <td>
                                    <form action="process" method="post">
                                        <input type="hidden" name="index" value="${sessionScope.transactions.indexOf(transaction)}" />
                                        <input type="hidden" name="action" value="remove" />
                                        <input type="submit" class="btn btn-warning btn-sm" value="Remove from memory">
                                    </form>
                                </td>
                                <td>${transaction.description}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
    <jsp:include page="includes/footer.jsp" />
    <script src="js/manageProcessForm.js"></script>
    <script src="js/vue/processor.js"></script>
    <script src="js/datatables/datatableFileprocessing.js"></script>
</body>
</html>
