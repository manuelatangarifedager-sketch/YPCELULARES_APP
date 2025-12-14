<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Compra exitosa</title>
</head>
<body style="text-align:center; font-family:Arial; margin-top:50px;">

    <h2>🎉 ¡Compra realizada con éxito!</h2>
    <p>Tu pedido ha sido registrado correctamente.</p>

<div style="text-align:center; margin-top:20px;">
       <a href="<%= request.getContextPath() %>/ProductoServlet">
        🛍 Seguir comprando
    </a>
    |
    <a href="<%= request.getContextPath() %>/PrincipalClienteServlet">
        🏠 Volver al inicio
    </a>

</div>

</body>
</html>
