<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wvandermeulen
  Date: 2/2/21
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="tab-pane fade in active show" id="overview" role="tabpanel" aria-labelledby="overview-tab">
    <c:set var="transactionTypes" value="${sessionScope.infoFactory.transactionTypes}" />
    <div class="row">
        <c:forEach var="indices" items="${sessionScope.infoFactory.overviewTransactions.config}">
            <div class="col">
                <c:forEach var="index" items="${indices}">
                    <c:set var="date" value="${sessionScope.infoFactory.overviewTransactions.dates[index]}" />
                    <c:set var="notUsedDate" value="${true}" />
                    <c:set var="notUsedLine" value="${true}" />
                    <c:set var="transactionsMap"
                           value="${sessionScope.infoFactory.overviewTransactions.grouped.get(date)}" />
                    <c:set var="sumsMap"
                           value="${sessionScope.infoFactory.overviewTransactions.sums.get(date)}" />
                    <c:if test="${transactionsMap.containsKey('periodic')}">
                        <c:set var="color" value="${transactionTypes.get('periodic')[0]}" />
                        <c:forEach var="transaction" items="${transactionsMap.get('periodic')}">
                            <div class="row">
                                <div class="col-3">
                                    <c:if test="${notUsedDate}">
                                        <c:set var="notUsedDate" value="${false}" />
                                        ${date}
                                    </c:if>
                                </div>
                                <div class="col-4">
                                  <span style="color: ${color}">
                                    &euro; ${transaction.getAmount()}
                                  </span>
                                </div>
                                <div class="col-5">
                                  <span style="color: ${color}">
                                          ${transaction.getTag()}
                                  </span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:forEach var="transactionsMapEntry" items="${transactionsMap.entrySet()}">
                        <c:if test="${transactionsMapEntry.getKey() != 'periodic' && transactionsMapEntry.getKey() != 'regular'}">
                            <c:set var="color" value="${transactionTypes.get(transactionsMapEntry.getKey())[0]}" />
                            <c:forEach var="transaction" items="${transactionsMapEntry.getValue()}">
                                <div class="row">
                                    <div class="col-3">
                                        <c:if test="${notUsedDate}">
                                            <c:set var="notUsedDate" value="${false}" />
                                            ${date}
                                        </c:if>
                                    </div>
                                    <div class="col-4">
                                  <span style="color: ${color}">
                                    &euro; ${transaction.getAmount()}
                                  </span>
                                    </div>
                                    <div class="col-5">
                                  <span style="color: ${color}">
                                          ${transaction.getTag()}
                                  </span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    <c:if test="${transactionsMap.containsKey('regular')}">
                        <c:forEach var="transaction" items="${transactionsMap.get('regular')}">
                            <c:set var="color" value="${transactionTypes.get('regular')[0]}" />
                            <div class="row">
                                <div class="col-3">
                                    <c:if test="${notUsedDate}">
                                        <c:set var="notUsedDate" value="${false}" />
                                        ${date}
                                    </c:if>
                                </div>
                                <div class="col-4">
                                  <span style="color: ${color}">
                                    &euro; ${transaction.getAmount()}
                                  </span>
                                </div>
                                <div class="col-5">
                                  <span style="color: ${color}">
                                          ${transaction.getTag()}
                                  </span>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row">
                            <div class="col-3">

                            </div>
                            <div class="col-4" style="border-top: 1px solid #fff; color: ${color}">
                                <c:set var="notUsedLine" value="${false}" />
                                &euro; ${sumsMap.get('regular')}
                            </div>
                            <div class="col-5">

                            </div>
                        </div>
                    </c:if>
                    <c:if test="${transactionsMap.containsKey('periodic')}">
                        <div class="row">
                            <div class="col-3">

                            </div>
                            <div class="col-4" style="color: ${sessionScope.infoFactory.transactionTypes.get('periodic')[0]};
                                    ${notUsedLine ? 'border-top: 1px solid #fff' : ' '}">
                                <c:set var="notUsedLine" value="${false}" />
                                &euro; ${sumsMap.get('periodic')}
                            </div>
                            <div class="col-5">

                            </div>
                        </div>
                    </c:if>
                    <c:forEach var="transactionsMapEntry" items="${transactionsMap.entrySet()}">
                        <c:if test="${transactionsMapEntry.getKey() != 'periodic' && transactionsMapEntry.getKey() != 'regular'}">
                            <c:set var="color" value="${transactionTypes.get(transactionsMapEntry.getKey())[0]}" />
                            <div class="row">
                                <div class="col-3">

                                </div>
                                <div class="col-4" style="color: ${color};
                                        ${notUsedLine ? 'border-top: 1px solid #fff' : ' '}">
                                    <c:set var="notUsedLine" value="${false}" />
                                    &euro; ${sumsMap.get(transactionsMapEntry.getKey())}
                                </div>
                                <div class="col-5">

                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="row">
                        <p><br/></p>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
</div>
