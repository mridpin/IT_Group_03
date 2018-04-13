<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Generator</title>
    </head>
    <body>
        <h1>Introduce la longitud de la contrase&ntilde;a a generar</h1>
        
        <form action="result.jsp" method="POST">
            
            Longitud: <input type="numeric" name="length" placeholder="Introduce el valor">
            <br>
            <input type="submit" name="enviar" value="Calcular">
            
        </form>
        
    </body>
</html>
