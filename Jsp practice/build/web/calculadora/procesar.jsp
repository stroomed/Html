<%-- 
    Document   : procesar
    Created on : 03-04-2018, 10:53:50 AM
    Author     : 19564044-0
--%>
<%@page import="calculadora.metodos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            metodos m = new metodos();
            
            int nu1 = Integer.parseInt(request.getParameter("valor 1"));
            int nu2 = Integer.parseInt(request.getParameter("valor 2"));
            
            m.setN1(nu1);
            m.setN2(nu2);
            
            String text = "";
            text = text + " - Número 1" + m.getN1() + "<br>";
            text = text + " - Número 2" + m.getN2() + "<br>";
            
            String [] metodos = request.getParameterValues("operacion");
            
            if (metodos != null){
                for (int i=0;i<metodos.length;i++){
                    if (metodos[i].matches("Sumar")){
                        text = text + " - " + m.suma() + "<br>";
                    }
                    if (metodos[i].matches("Restar")){
                        text = text + " - " + m.resta() + "<br>";
                    }
                    if (metodos[i].matches("Multiplicar")){
                        text = text + " - " + m.multiplicacion() + "<br>";
                    }
                    if (metodos[i].matches("Dividir")){
                        text = text + " - " + m.division() + "<br>";
                    }
                    if (metodos[i].matches("Resto")){
                        text = text + " - " + m.residuo() + "<br>";
                    }
                }
            }
            else{
                text = text + "No ha seleccionado una operación.";
            }
        %>
        <%= text %>
    </body>
</html>
