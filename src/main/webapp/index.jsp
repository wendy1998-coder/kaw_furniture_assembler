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
      <jsp:param name="pageTitle" value="Bookkeeper" />
    </jsp:include>
  </head>
  <body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-2 p-0" id="vue">
        <jsp:include page="includes/menu.jsp" />
      </div>
      <!--content-->
      <div class="col-10">
        <jsp:include page="includes/error.jsp" />
        <div class="row">
          <div class="col-sm-7">
            <jsp:include page="includes/overview/overview/overviewMain.jsp" />
          </div>
          <div class="col-sm-5">
            <jsp:include page="includes/overview/periodic/periodicMain.jsp" />
            <jsp:include page="includes/overview/snapshot/snapshotMain.jsp" />
            <div>
              <!--TODO: money accounts / calculations-->
              <jsp:include page="includes/overview/calculations/calculationsMain.jsp" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="includes/footer.jsp" />
  <script src="js/vue/home.js"></script>
  <script src="js/manageRequestForm.js"></script>
  <script src="js/manage-periodic-transfers.js"></script>
  <script src="js/datatables/datatableHome.js"></script>
  </body>
</html>
