<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 4-1-2021
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id='cssmenu'>
    <ul>
        <li v-for="item in menuItems"><a :href="item.page" :class="{'active': item.active}">{{ item.name }}</a></li>
    </ul>
</div>
