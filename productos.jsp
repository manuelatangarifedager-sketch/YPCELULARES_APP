<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>
<%
List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>

<html>
<head>
    <title>Catálogo de Productos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        h2 { text-align: center; }
        .btn { background-color: #28a745; color: white; border: none; padding: 5px 10px; cursor: pointer; }
        .btn:hover { background-color: #218838; }
        .link { text-decoration: none; color: #007bff; margin: 0 10px; }
        .img-prod { width: 80px; height: 80px; object-fit: cover; border-radius: 6px; }
    </style>
</head>
<body>

<h2>🛍️ Catálogo de Productos</h2>

<table>
    <tr>
        <th>Imagen</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Stock</th>
        <th>Acción</th>
    </tr>

<%
if (productos != null && !productos.isEmpty()) {
    for (Producto p : productos) {
%>
    <tr>
        <td>
            <%
                String img = (p.getImagen_url() == null || p.getImagen_url().trim().isEmpty())
                        ? "img/no-image.png"
                        : p.getImagen_url();
            %>
            <img class="img-prod" src="<%= img %>" alt="Producto">
        </td>

        <td><%= p.getNombre() %></td>
        <td><%= p.getDescripcion() %></td>
        <td>$<%= String.format("%.2f", p.getPrecio()) %></td>
        <td><%= p.getStock() %></td>

        <td>
            <form action="CarritoClienteServlet" method="post" style="margin:0;">
                <input type="hidden" name="accion" value="agregar">
                <input type="hidden" name="productoId" value="<%= p.getId() %>">
                <input type="number" name="cantidad" value="1" min="1" style="width:60px;">
                <input class="btn" type="submit" value="🛒 Agregar">
            </form>
        </td>
    </tr>
<%
    }
} else {
%>
    <tr>
        <td colspan="6">No hay productos disponibles.</td>
    </tr>
<%
}
%>
</table>

<div style="text-align:center; margin-top:20px;">
    <a class="link" href="CarritoClienteServlet">🛒 Ver carrito</a> |
    <a href="PrincipalClienteServlet">🏠 Volver al inicio</a>
</div>

</body>
</html>

