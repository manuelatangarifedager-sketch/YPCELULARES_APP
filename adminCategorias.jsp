<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Administrar Categorías</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }

        h2 {
            text-align: center;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
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
            background: #FFD700;
        }

        input[type=text] {
            padding: 6px;
            width: 70%;
        }

        button {
            padding: 6px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-add { background: #28a745; color: #fff; }
        .btn-edit { background: #007bff; color: #fff; }
        .btn-del { background: #dc3545; color: #fff; }

        .top {
            margin-bottom: 20px;
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>📂 Administrar Categorías</h2>

    <!-- FORM AGREGAR -->
    <div class="top">
        <form action="CategoriaServlet" method="post">
            <input type="hidden" name="accion" value="agregar">
            <input type="text" name="nombre" placeholder="Nueva categoría" required>
            <button class="btn-add" type="submit">Agregar</button>
        </form>
    </div>

    <!-- TABLA -->
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>

        <c:forEach var="c" items="${categorias}">
            <tr>
                <td>${c.id}</td>

                <td>
                    <form action="CategoriaServlet" method="post">
                        <input type="hidden" name="accion" value="editar">
                        <input type="hidden" name="id" value="${c.id}">
                        <input type="text" name="nombre" value="${c.nombre}">
                        <button class="btn-edit" type="submit">Guardar</button>
                    </form>
                </td>

                <td>
                    <form action="CategoriaServlet" method="post"
                          onsubmit="return confirm('¿Eliminar categoría?');">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="${c.id}">
                        <button class="btn-del" type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <div style="text-align:center;">
     <li><a href="ProductoAdminServlet">🚪 Volver al listado de productos</a></li>
    </div>

</div>

</body>
</html>
