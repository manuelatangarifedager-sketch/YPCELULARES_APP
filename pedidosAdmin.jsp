<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Pedido" %>

<%
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
%>

<html>
<head>
    <title>Administrar Pedidos</title>

    <style>
        body { font-family: Arial; margin: 20px; }

        table { 
            border-collapse: collapse; 
            width: 95%; 
            margin: auto; 
        }

        th, td { 
            border: 1px solid #ccc; 
            padding: 10px; 
            text-align: center; 
        }

        th { 
            background-color: #f2f2f2; 
            font-weight: bold;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        
        .ver { background-color: #007bff; }
        .eliminar { background-color: #dc3545; }

    </style>
</head>
<body>

<h2 style="text-align:center;">📦 Administración de Pedidos</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Usuario</th>
        <th>Total</th>
        <th>Dirección</th>
        <th>Pago</th>
        <th>Seguimiento</th>
        <th>Fecha</th>
        <th>Acciones</th>
    </tr>

    <% if (pedidos != null && !pedidos.isEmpty()) {
        for (Pedido p : pedidos) { %>

        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getUsuario_id() %></td>
            <td>$<%= p.getTotal() %></td>
            <td><%= p.getDireccion_entrega() %></td>
            <td><%= p.getMetodo_pago() %></td>
            <td><%= p.getNumero_seguimiento() %></td>
            <td><%= p.getFecha_creacion() %></td>

            <td>
                <a href="PedidoAdminServlet?accion=ver&id=<%= p.getId() %>" class="btn ver">Ver</a>
                <a onclick="return confirm('¿Eliminar pedido?');"
                   href="PedidoAdminServlet?accion=eliminar&id=<%= p.getId() %>"
                   class="btn eliminar">Eliminar</a>
            </td>
        </tr>

    <% }} else { %>

        <tr><td colspan="8">No hay pedidos registrados.</td></tr>

    <% } %>
</table>

</body>
</html>
