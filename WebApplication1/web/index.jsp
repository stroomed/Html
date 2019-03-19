
<%@page import = "java.util.ArrayList" %>
<%@page import = "venta.agregar" %>
<%@page import = "agregar.ventas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title> Tienda </title>
        
    </head>
    
    <body>
        
        <form action ="venta.do" method="POST">
            
            Código: <input type="text" name="txtcode" value="" /><br>
            Nombre: <input type="text" name="txtname" value="" /><br>
            Precio: <input type="text" name="txtprice" value="" /><br>
            <input type="submit" value="agregar" /><br>
            
        </form>
        
        <table border="1">
            
            <thead>
                
                <tr>
                    
                    <th> Código </th>
                    <th> Nombre </th>
                    <th> Precio </th>
                    
                </tr>
                
            </thead>
            
            <tbody>
                
                <% for (agregar a:prod){ %>
                
                <tr>
                    
                    <td> <%= a.getCode() %> </td>
                    <td> <%= a.getName() %> </td>
                    <td> <%= a.getPrice() %> </td>
                    
                </tr>
                
                <% } %>
                
            </tbody>
            
        </table>

    </body>
    
</html>
