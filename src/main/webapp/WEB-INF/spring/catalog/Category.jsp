<%@ page import="org.mybatis.jpetstore.domain.Category" %>
<%@ page import="org.mybatis.jpetstore.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ include file="../common/IncludeTop.jsp"%>

<%
    Category category = (Category) request.getAttribute("category");
    List<Product> productList = (List<Product>) request.getAttribute("productList");
%>

<div id="BackLink"><a href="../mvc/Catalog.action">
	Return to Main Menu</a></div>

<div id="Catalog">

    <h2>${category.name}</h2>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>
                    <a href="?viewProduct=&productId=${product.productId}">${product.productId}</a>
                </td>
                <td>${product.name}</td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>


