<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Producto" %>
<%@ page import="com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Producto p = (Producto) request.getAttribute("producto");
%>

<html>
<head><title>Editar Producto</title></head>
<body>

<h2>Editar Producto</h2>

<form action="ProductoAdminServlet" method="post">
    <input type="hidden" name="accion" value="actualizar">
    <input type="hidden" name="id" value="<%= p.getId() %>">

    Nombre:
    <input type="text" name="nombre" value="<%= p.getNombre() %>" required><br>

    Descripción:
    <input type="text" name="descripcion" value="<%= p.getDescripcion() %>" required><br>

    Precio:
    <input type="number" step="0.01" name="precio" value="<%= p.getPrecio() %>" required><br>

    Stock:
    <input type="number" name="stock" value="<%= p.getStock() %>" required><br>

    Imagen URL:
    <input type="text" name="imagen_url" value="<%= p.getImagen_url() %>"><br>

    Categoría:
    <select name="categoriaId" required>
        <c:forEach var="c" items="${categorias}">
            <option value="${c.id}"
                <c:if test="${c.id == p.categoriaId}">selected</c:if>>
                ${c.nombre}
            </option>
        </c:forEach>
    </select>
    <br>

    Activo:
    <input type="checkbox" name="activo" <%= p.isActivo() ? "checked" : "" %>><br>

    <input type="submit" value="Actualizar">
</form>

</body>
</html>
