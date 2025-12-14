<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>

<%
List<Producto> carrito = (List<Producto>) request.getAttribute("carrito");
Double total = (Double) request.getAttribute("total");
%>

<html>
<head>
    <title>Datos de Facturación</title>
</head>
<body style="font-family:Arial; margin:40px;">

<h2>🧾 Datos de Facturación</h2>

<form action="PedidoServlet" method="post">

    <input type="hidden" name="accion" value="confirmar">

    <h3>📍 Dirección de entrega</h3>
    <textarea name="direccion" required style="width:300px;height:60px;"></textarea>

    <h3>💳 Método de pago</h3>
    <select name="metodo_pago" required>
        <option value="Tarjeta">Tarjeta</option>
        <option value="Transferencia">Transferencia</option>
        <option value="Efectivo">Efectivo</option>
    </select>

    <h3>🛒 Resumen</h3>
    <ul>
        <% for (Producto p : carrito) { %>
            <li>
                <%= p.getNombre() %> 
                x <%= p.getCantidad() %> 
                = $<%= p.getPrecio() * p.getCantidad() %>
            </li>
        <% } %>
    </ul>

    <h3>Total: $<%= total %></h3>

    <br>
    <button type="submit">✅ Confirmar y pagar</button>
    <a href="CarritoClienteServlet">⬅ Volver al carrito</a>

</form>

</body>
</html>
