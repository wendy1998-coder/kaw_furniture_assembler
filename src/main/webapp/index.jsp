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
      <jsp:include page="includes/footer.jsp" />
    </div>
    <script src="js/vue/home.js"></script>
  </body>
</html>
