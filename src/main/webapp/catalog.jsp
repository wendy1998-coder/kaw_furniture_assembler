<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 31-12-2020
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <jsp:include page="includes/head.jsp">
      <jsp:param name="pageTitle" value="KaW Furniture Assembler" />
    </jsp:include>
  </head>
  <body>
    <div id="vue">
      <jsp:include page="includes/header.jsp" />
      <div class="container-fluid" id="content">
        <c:if test="${requestScope.pieces != null}">
          <c:forEach var="furniture_piece" items="${requestScope.pieces}">
            <c:if test="${furniture_piece.getCatalogUrl() != null}">
              <img src="${furniture_piece.getCatalogUrl()}" alt="${furniture_piece.name}">
            </c:if>
          </c:forEach>
        </c:if>
      </div>
      <jsp:include page="includes/footer.jsp" />
    </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="js/vue/vue.js" type="text/javascript"></script>
    <script src="js/menuToggle.js"></script>
    <script src="js/vue/catalog.js"></script>
  </body>
</html>
