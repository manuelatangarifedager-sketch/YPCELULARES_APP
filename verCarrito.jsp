<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>
<%
List<Producto> carrito = (List<Producto>) request.getAttribute("carrito");
Double total = (Double) request.getAttribute("total");
%>

<html>
<head>
    <title>🛒 Mi Carrito</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { background-color: #dc3545; color: white; border: none; padding: 5px 10px; cursor: pointer; }
        .btn:hover { background-color: #c82333; }
        .btn-vaciar { background-color: #6c757d; margin-top: 10px; }
        .btn-vaciar:hover { background-color: #5a6268; }
        .link { text-decoration: none; color: #007bff; }
        .total { text-align: right; margin-right: 10%; font-size: 18px; font-weight: bold; }
    </style>
</head>
<body>

<h2 style="text-align:center;">🛒 Carrito de Compras</h2>

<% if (carrito == null || carrito.isEmpty()) { %>
    <p style="text-align:center;">Tu carrito está vacío.</p>
<% } else { %>
    <table>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
            <th>Acción</th>
        </tr>
        <% 
        for (Producto p : carrito) { 
            double subtotal = p.getPrecio() * p.getCantidad(); // Calcular subtotal
        %>
        <tr>
            <td><%= p.getNombre() %></td>
            <td>$<%= String.format("%.2f", p.getPrecio()) %></td>
            <td><%= p.getCantidad() %></td>
            <td>$<%= String.format("%.2f", subtotal) %></td>
            <td>
                <form action="CarritoClienteServlet" method="post" style="margin:0;">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input class="btn" type="submit" value="❌ Eliminar">
                </form>
            </td>
        </tr>
        <% } %>
    </table>

    <div class="total">Total: $<%= String.format("%.2f", total) %></div>

    <div style="text-align:center;">
        <form action="CarritoClienteServlet" method="post" style="display:inline;">
            <input type="hidden" name="accion" value="vaciar">
            <input class="btn btn-vaciar" type="submit" value="🗑 Vaciar carrito">
        </form>
    </div>
<% } %>

<div style="text-align:center; margin-top:20px;">
    <a class="link" href="ProductoServlet">⬅️ Seguir comprando</a> |
    <a href="PrincipalClienteServlet">🏠 Volver al inicio</a>
</div>
<form action="FacturacionServlet" method="get">
    <input class="btn btn-confirmar" type="submit" value="✅ Continuar con la compra">
</form>

</body>
</html>
