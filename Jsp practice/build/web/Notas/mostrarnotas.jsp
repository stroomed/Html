
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
// nota 1
        double n1 = Double.parseDouble(request.getParameter("nota1"));
// nota 2
        double n2 = Double.parseDouble(request.getParameter("nota2"));
// nota 3
        double n3 = Double.parseDouble(request.getParameter("nota3"));
// promedio
        double suma = n1 + n2 + n3;
        double prom = suma / 3;
        %>
// mostrar
        <% if (prom <= 3.9){ %>
            <b style="color:red;">
                Reprobado, tu promedio es: <%= prom %>
            </b>
        <% }
            else { %>
                <b style="color:blue;">
                    Aprobado, tu promedio es: <%= prom %>
                </b>
        <% } %>
        
    </body>
</html>