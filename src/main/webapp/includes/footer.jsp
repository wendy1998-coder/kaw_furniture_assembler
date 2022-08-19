<%--
  Created by IntelliJ IDEA.
  User: wbvandermeulen
  Date: 13-12-18
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="footerBar" class="row secondary-bg">
    <div class="col-9">
        <div id="footerMenu" class="menu primary-bg quarternary-border thirtiary">
            <ul class="menuItems">
                <li v-for="item in footerMenuItems" class="quarternary-border">
                    <a v-if="item.page" :href="item.page" :class="{'active': item.active}">{{ item.name }}</a>
                    <a v-else-if="item.url" :href="item.url" :class="{'active': item.active}">{{ item.name }}</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-3" id="copyright">
        © 2022 Gaia
    </div>
</div>