<%-- 
    Document   : ingreso
    Created on : 03-04-2018, 10:46:26 AM
    Author     : 19564044-0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="procesar.jsp" method="POST">
            <h1> Ingrese los valores a operar </h1><br>
            Valor 1: <input type="text" name="valor1" value="" /><br>
            Valor 2: <input type="text" name="valor2" value="" /><br>
            <input type="checkbox" name="operacion" value="sumar" /> + Sumar 
            <br>
            <input type="checkbox" name="operacion" value="restar" /> - Restar 
            <br>
            <input type="checkbox" name="operacion" value="multiplicar" /> * Multiplicar 
            <br>
            <input type="checkbox" name="operacion" value="dividir" /> / Dividir 
            <br>
            <input type="checkbox" name="operacion" value="resto" /> % Resto 
            <br>
            <input type="submit" value="Calcular" />
        </form>
    </body>
</html>
