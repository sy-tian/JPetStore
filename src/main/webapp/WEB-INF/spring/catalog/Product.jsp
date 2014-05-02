<%@ page import="org.mybatis.jpetstore.domain.Item" %>
<%@ page import="org.mybatis.jpetstore.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ include file="../common/IncludeTop.jsp" %>

<%
    Product product = (Product) request.getAttribute("product");
    List<Item> itemList = (List<Item>) request.getAttribute("itemList");
%>

<div id="BackLink">
    <a href="?viewCategory=&categoryId=${product.categoryId}">
        Return to ${product.categoryId}</a>
</div>

<div id="Catalog">

    <h2>${product.name}</h2>
    <table>
        <tr>
            <th>Item ID</th>
            <th>Product ID</th>
            <th>Description</th>
            <th>List Price</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach var="item" items="${itemList}">
            <tr>
                <td>
                    <a href="?viewItem=&itemId=${item.itemId}">${item.itemId}</a>
                </td>
                <td>${item.product.productId}</td>
                <td>${item.attribute1} ${item.attribute2} ${item.attribute3}
                        ${item.attribute4} ${item.attribute5} ${actionBean.product.name}</td>
                <td><fmt:formatNumber value="${item.listPrice}"
                                      pattern="$#,##0.00"/></td>
                <td><stripes:link class="Button"
                                  beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
                                  event="addItemToCart">
                    <stripes:param name="workingItemId" value="${item.itemId}"/>
                    Add to Cart
                </stripes:link></td>
            </tr>
        </c:forEach>
    </table>

</div>


<%@ include file="../common/IncludeBottom.jsp" %>





