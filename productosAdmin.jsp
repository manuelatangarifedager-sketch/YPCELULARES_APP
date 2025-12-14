<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null || !"admin".equals(usuario.getRol())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Administrador de Productos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        header {
            background: #222;
            color: #FFD700;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        .container {
            width: 95%;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            border-bottom: 2px solid #FFD700;
            padding-bottom: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #f0f0f0;
        }

        img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
        }

        .form-container {
            margin-top: 40px;
            padding: 20px;
            border-radius: 10px;
            background: #fafafa;
            border: 1px solid #ddd;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 8px;
            margin: 6px 0 12px;
        }

        .btn {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn:hover {
            background: #218838;
        }

        .acciones a {
            margin: 0 5px;
            color: #007bff;
            text-decoration: none;
        }

        .acciones a:hover {
            text-decoration: underline;
        }

        .top-links {
            text-align: right;
            margin-bottom: 15px;
        }

        .top-links a {
            margin-left: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>

<body>

<header>
    🛠️ Panel Administrador - Productos
</header>

<div class="container">

    <div class="top-links">
        <a href="${pageContext.request.contextPath}/CategoriaServlet">📂 Administrar Categorías</a>
        <a href="${pageContext.request.contextPath}/admin/panelAdmin.jsp">🏠 Inicio</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">🚪 Cerrar sesión</a>
    </div>

    <h2>Listado de Productos</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Categoría</th>
            <th>Acciones</th>
        </tr>

        <c:forEach var="p" items="${productos}">
            <tr>
                <td>${p.id}</td>
                <td>
                    <img src="${empty p.imagen_url ? 'img/no-image.png' : p.imagen_url}">
                </td>
                <td>${p.nombre}</td>
                <td>$${p.precio}</td>
                <td>${p.stock}</td>
                <td>${p.categoriaNombre}</td>
                <td class="acciones">
                    <a href="${pageContext.request.contextPath}/ProductoAdminServlet?accion=editar&id=${p.id}">
                        ✏️ Editar
                    </a>
                    <a href="${pageContext.request.contextPath}/ProductoAdminServlet?accion=eliminar&id=${p.id}"
                       onclick="return confirm('¿Eliminar este producto?')">
                        🗑️ Eliminar
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- ===================== -->
    <!-- FORMULARIO AGREGAR -->
    <!-- ===================== -->

    <div class="form-container">
        <h2>Agregar nuevo producto</h2>

        <form action="${pageContext.request.contextPath}/ProductoAdminServlet" method="post">
            <input type="hidden" name="accion" value="agregar">

            <label>Nombre</label>
            <input type="text" name="nombre" required>

            <label>Descripción</label>
            <input type="text" name="descripcion">

            <label>Precio</label>
            <input type="number" step="0.01" name="precio" required>

            <label>Stock</label>
            <input type="number" name="stock" required>

            <label>Imagen (URL)</label>
            <input type="text" name="imagen_url">

            <label>Categoría</label>
            <select name="categoriaId" required>
                <option value="">Seleccione categoría</option>
                <c:forEach var="c" items="${categorias}">
                    <option value="${c.id}">${c.nombre}</option>
                </c:forEach>
            </select>

            <button class="btn" type="submit">➕ Agregar producto</button>
        </form>
    </div>

</div>

</body>
</html>
