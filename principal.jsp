<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Principal - YP CELULARES</title>

    <style>
        /* ====== ESTILO GENERAL ====== */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: #222;
            margin: 0;
            padding: 0;
        }

        /* ====== ENCABEZADO ====== */
        header {
            background-color: #FFD700;
            color: #000;
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        /* ====== MENU DESPLEGABLE ====== */
        .menu {
            background: #222;
            padding: 10px 30px;
        }

        .menu ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .menu .dropdown {
            position: relative;
            color: white;
            cursor: pointer;
            font-weight: 600;
            width: fit-content;
        }

        .menu .dropdown span {
            font-size: 16px;
        }

        /* 🔴 SE QUITÓ EL HOVER */
        .menu .dropdown-content {
            display: none;
            position: absolute;
            background: #fff;
            min-width: 260px;
            margin-top: 10px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            padding: 15px;
            z-index: 1000;
        }

        .menu .dropdown-content strong {
            display: block;
            margin-top: 10px;
            color: #000;
            border-bottom: 1px solid #FFD700;
            padding-bottom: 5px;
        }

        .menu .dropdown-content ul {
            margin-top: 5px;
        }

        .menu .dropdown-content ul li {
            padding: 6px 0;
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }

        .menu .dropdown-content ul li:hover {
            color: #FFD700;
        }

        /* ====== CONTENIDO ====== */
        .panel-container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-top: 6px solid #FFD700;
        }

        h2 {
            color: #111;
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }

        p {
            text-align: center;
            font-size: 16px;
            color: #333;
            margin-bottom: 30px;
        }

        h3 {
            color: #000;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 8px;
            margin-bottom: 15px;
        }

        ul.opciones {
            list-style: none;
            padding: 0;
        }

        ul.opciones li {
            background-color: #f8f8f8;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, background 0.3s;
        }

        ul.opciones li:hover {
            background-color: #FFD700;
            transform: scale(1.03);
        }

        ul.opciones li a {
            display: block;
            text-decoration: none;
            color: #000;
            padding: 15px;
            font-weight: 500;
            font-size: 16px;
        }

        hr {
            border: none;
            height: 2px;
            background-color: #FFD700;
            margin: 30px 0;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 600px) {
            .panel-container {
                width: 90%;
                padding: 25px;
            }
            header {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>

<header>
    YP CELULARES
</header>

<!-- ====== MENU CATEGORIAS ====== -->
<nav class="menu">
    <ul>
        <li class="dropdown">
            <!-- 🔴 SE CAMBIÓ A CLICK -->
            <span onclick="toggleCategorias()">☰ Categorías</span>

            <ul class="dropdown-content" id="menuCategorias">

                <li>
                    <strong>Celulares</strong>
                    <ul>
                        <c:forEach var="p" items="${celulares}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

                <li>
                    <strong>Tablets</strong>
                    <ul>
                        <c:forEach var="p" items="${tablets}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

                <li>
                    <strong>Accesorios</strong>
                    <ul>
                        <c:forEach var="p" items="${accesorios}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

            </ul>
        </li>
    </ul>
</nav>

<!-- ====== PANEL PRINCIPAL ====== -->
<div class="panel-container">

    <h2>Bienvenido, <%= usuario.getNombre() %>!</h2>
    <p>Rol: <%= usuario.getRol() %></p>

    <hr>

    <h3>Opciones disponibles:</h3>
    <ul class="opciones">
        <li><a href="ProductoServlet">🛍️ Ver productos</a></li>
         <li><a href="CarritoClienteServlet">🛒 Ver carrito</a></li>
        <li><a href="LogoutServlet">🚪 Cerrar sesión</a></li>
    </ul>

</div>

<!-- ====== SCRIPT MENU ====== -->
<script>
function toggleCategorias() {
    const menu = document.getElementById("menuCategorias");
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
}
</script>

</body>
</html>
