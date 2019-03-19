<%-- 
    Document   : promedio
    Created on : 03-04-2018, 09:08:59 AM
    Author     : 19564044-0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculo de promedio</title>
    </head>
    <body>
        <form action="mostrarnotas.jsp" method="POST">
            <h1> Ingresa tus notas </h1>
            <input type="text" name="nota1" value="" /><br>
            <input type="text" name="nota2" value="" /><br>
            <input type="text" name="nota3" value="" /><br>
            <br>
                <input type="submit" value="Promediar" />
            </br>            
        </form>
    </body>
</html>
