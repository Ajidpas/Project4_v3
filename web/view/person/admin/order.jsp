<%-- 
    Document   : order
    Created on : 17.01.2016, 2:15:31
    Author     : Sasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="controller.properties.text" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="${title}" /></title>
    </head>
    <body>
        <c:if test="${not empty errorMessage}" >
            <fmt:message key="${errorMessage}" />
            <c:remove var="errorMessage" scope="session" />
        </c:if>
        <c:if test="${not empty message}" >
            <fmt:message key="${message}" />
            <c:remove var="message" scope="session" />
        </c:if>
        <h4><fmt:message key="administration.user.text.firstname" />: ${concreteUser.firstName}</h4>
        <h4><fmt:message key="administration.user.text.lastname" />: ${concreteUser.lastName}</h4>
        <h4><fmt:message key="administration.user.text.email" />: ${concreteUser.email}</h4>
        
        <h3><fmt:message key="order.text.ordernumber" /> ${order.id}</h3>
        <h5>
            <fmt:formatDate type="time" value="${order.date}" />
            <fmt:formatDate type="date" value="${order.date}" />
        </h5>
        <table>
            <tr>
                <td><h3><fmt:message key="order.table.mealname" /></h3></td>
                <td><h3><fmt:message key="order.table.mealdescription" /></h3></td>
                <td><h3><fmt:message key="order.table.mealprice" /></h3></td>
                <td><h3><fmt:message key="order.table.mealnumber" /></h3></td>
                <td><h3><fmt:message key="order.table.itemprice" /></h3></td>
            </tr>
            <c:forEach items="${order.orderItems}" var="item" >
                <tr>
                    <td><c:out value="${item.meal.name}" /></td>
                    <td><c:out value="${item.meal.description}" /></td>
                    <td><fmt:formatNumber value="${item.meal.price}" 
                           type="currency" currencyCode="USD" /></td>
                    <td><c:out value="${item.mealAmount}" /></td>
                    <td><fmt:formatNumber value="${item.totalPrice}"
                           type="currency" currencyCode="USD" /></td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><h3><fmt:message key="order.table.totalprice" /></h3></td>
                <td><h3><fmt:formatNumber value="${order.totalPrice}"
                           type="currency" currencyCode="USD" /></h3></td>
            </tr>
        </table>
            <h3>  
                <form action="servlet" method="post" >
                    <c:choose>
                        <c:when test="${order.status == 'CREATED'}">
                            <fmt:message key="order.status.created" />
                            <input type="submit" value="<fmt:message key="administration.user.order.button.sendtokitchen" />" />
                            <input type="hidden" name="postAction" value="sendToKitchen" />
                            <input type="hidden" name="orderId" value="${order.id}" />
                        </c:when>
                        <c:when test="${order.status == 'ACCEPTED'}">
                            <fmt:message key="order.status.accepted" />
                        </c:when>
                        <c:when test="${order.status == 'PREPARED'}">
                            <fmt:message key="order.status.prepared" />
                            <input type="submit" value="<fmt:message key="administration.user.order.button.confirmpreparedorder" />" />
                            <input type="hidden" name="postAction" value="confirmPreparedOrder" />
                            <input type="hidden" name="orderId" value="${order.id}" />
                        </c:when>
                        <c:when test="${order.status == 'READY'}">
                            <fmt:message key="order.status.ready" />
                        </c:when>
                        <c:when test="${order.status == 'PAYED'}">
                            <fmt:message key="order.status.payed" />
                        </c:when>
                        <c:otherwise>undefined</c:otherwise>
                    </c:choose>  
                </form>
            </h3> 
    </body>
</html>
