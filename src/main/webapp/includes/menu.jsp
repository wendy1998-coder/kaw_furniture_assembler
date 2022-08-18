<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 4-1-2021
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id='cssmenu' class="primary-bg quarternary-border thirtiary">
    <ul>
        <li v-for="item in menuItems">
            <a v-if="item.page" :href="item.page" :class="{'active': item.active}">{{ item.name }}</a>
            <a v-else-if="item.url" :href="item.url" :class="{'active': item.active}">{{ item.name }}</a>
        </li>
    </ul>
</div>
<div id="mobileMenu">
    <div id="mobileMenuTrigger" class="primary-bg quarternary-border thirtiary">
        Unfold menu
    </div>
    <div id="mobileMenuItems" class="primary-bg quarternary-border thirtiary">
        <ul>
            <li v-for="item in menuItems">
                <a v-if="item.page" :href="item.page" :class="{'active': item.active}">{{ item.name }}</a>
                <a v-else-if="item.url" :href="item.url" :class="{'active': item.active}">{{ item.name }}</a>
            </li>
            <li v-for="item in footerMenuItems" v-if="item.addToTop">
                <a v-if="item.page" :href="item.page" :class="{'active': item.active}">{{ item.name }}</a>
                <a v-else-if="item.url" :href="item.url" :class="{'active': item.active}">{{ item.name }}</a>
            </li>
        </ul>
    </div>
</div>
