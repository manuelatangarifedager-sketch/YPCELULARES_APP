<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Registro de Usuario</title>
</head>
<body style="font-family:Arial; text-align:center; margin-top:40px;">

<h2>📝 Registro de Usuario</h2>

<form action="RegistroServlet" method="post">

    <input type="text" name="nombre" placeholder="Nombre completo" required><br><br>

    <input type="email" name="correo" placeholder="Correo electrónico" required><br><br>

    <input type="password" name="password" placeholder="Contraseña" required><br><br>

    <input type="text" name="telefono" placeholder="Teléfono"><br><br>

    <textarea name="direccion" placeholder="Dirección" rows="3" cols="30"></textarea><br><br>

    <button type="submit">Registrarse</button>
</form>

<br>
<a href="login.jsp">⬅ Volver al login</a>

</body>
</html>
