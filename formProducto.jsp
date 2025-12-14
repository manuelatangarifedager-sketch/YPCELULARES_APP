<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Agregar Producto</title>
    <style>
        /* Agrega estilos como en los otros formularios */
    </style>
</head>
<body>

<h2>Agregar Producto</h2>

<form action="ProductoAdminServlet" method="post">
    <input type="hidden" name="accion" value="agregar">

    <input type="text" name="nombre" placeholder="Nombre del Producto" required>

    <textarea name="descripcion" placeholder="Descripción del Producto" required></textarea>

    <input type="number" name="precio" step="0.01" placeholder="Precio" required>

    <input type="number" name="stock" placeholder="Stock" required>

    <input type="text" name="imagen_url" placeholder="URL de la imagen">

    <label>Categoría</label>
    <select name="categoriaId" required>
        <option value="">Seleccione una categoría</option>
        <c:forEach var="c" items="${categorias}">
            <option value="${c.id}">${c.nombre}</option>
        </c:forEach>
    </select>

    <button type="submit">Agregar Producto</button>
</form>
