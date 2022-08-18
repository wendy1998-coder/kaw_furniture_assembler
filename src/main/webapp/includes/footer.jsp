<%--
  Created by IntelliJ IDEA.
  User: wbvandermeulen
  Date: 13-12-18
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="footerBar" class="secondary-bg">
    <div id="footerMenu" class="primary-bg quarternary-border thirtiary">
        <ul>
            <li v-for="item in footerMenuItems" class="quarternary-border">
                <a v-if="item.page" :href="item.page" :class="{'active': item.active}">{{ item.name }}</a>
                <a v-else-if="item.url" :href="item.url" :class="{'active': item.active}">{{ item.name }}</a>
            </li>
        </ul>
    </div>
</div>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="js/vue/vue.js" type="text/javascript"></script>