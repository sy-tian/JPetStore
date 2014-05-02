<%@ page import="org.mybatis.jpetstore.domain.Product" %>
<%@ page import="org.mybatis.jpetstore.domain.Item" %>
<%@ include file="../common/IncludeTop.jsp"%>

<%
    Product product = (Product) request.getAttribute("product");
    Item item = (Item) request.getAttribute("Item");
%>

<div id="BackLink">
    <a href="?viewProduct=&productId=${product.productId}">
    Return to ${product.productId}
    </a>
</div>

<div id="Catalog">

<table class="pure-table pure-table-horizontal">
	<tr>
		<td>${product.description}</td>
	</tr>
	<tr>
		<td><b> ${item.itemId} </b></td>
	</tr>
	<tr>
		<td><b><font size="4"> ${item.attribute1}
		${item.attribute2} ${item.attribute3}
		${item.attribute4} ${item.attribute5}
		${product.name} </font></b></td>
	</tr>
	<tr>
		<td>${product.name}</td>
	</tr>
	<tr>
		<td><c:if test="${item.quantity <= 0}">
        Back ordered.
      </c:if> <c:if test="${item.quantity > 0}">
      	${item.quantity} in stock.
	  </c:if></td>
	</tr>
	<tr>
		<td><fmt:formatNumber value="${item.listPrice}"
			pattern="$#,##0.00" /></td>
	</tr>

	<tr>
		<td><stripes:link class="Button"
			beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
			event="addItemToCart">
			<stripes:param name="workingItemId" value="${item.itemId}" />
       	Add to Cart
       </stripes:link></td>
	</tr>
</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>



