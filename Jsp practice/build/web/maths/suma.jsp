<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! private static final String DEFAULT_NAME = "World"; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Suma </title>
    </head>
    <% 
        String valor1 = request.getParameter("valor1");
        String valor2 = request.getParameter("valor2");
        if ((valor1 == null) || (valor1.length() == 0)){
            valor1 = "0";
        }
        if ((valor2 == null) || (valor2.length() == 0)){
            valor2 = "0";
        }
        int v1 = Integer.parseInt("valor1");
        int v2 = Integer.parseInt("valor2");
        int suma = v1+v2;
    %>
    <body bgcolor ="black">
        <h1> 
            <b style="color:white;">
                La suma es: <%= suma %>
            </b>
        </h1>
    </body>
</html>
