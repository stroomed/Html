<%-- 
    Document   : finalizarcompra
    Created on : 18-05-2018, 1:22:22
    Author     : rruizhess
--%>
<%@page import="cl.isapre.modelo.Bonos"%>
<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
        HttpSession sesion=request.getSession();
        ArrayList<Bonos> carritoCompra=(ArrayList<Bonos>)sesion.getAttribute("bono");
        ArrayList<Prestacion> prestacion=(ArrayList<Prestacion>)sesion.getAttribute("prestacion");
        for(int i=0; i<carritoCompra.size(); i++){
            //Obtengo el producto que pedi por medio de mi Vector de Productos
            Prestacion prodTemp=carritoCompra.get(i).getDescripcionPrestacion();
            //Actualizo el stock del producto
            int stockActualizado=prodTemp.getStock() - carritoCompra.get(i).getCantidadPedida();
            prodTemp.setStock(stockActualizado);
            //Obtengo en que indice esta el elemento producto que voy actualizar
            int indiceActualizar=carritoCompra.get(i).getCodigo();
            //Remuevo ese elemento
            productos.remove(indiceActualizar);
            //Y lo actualizo con la nueva informacion
            productos.add(indiceActualizar, prodTemp);
        }
        sesion.setAttribute("productos", productos);
        sesion.removeAttribute("carrito");
      %>
        
        
        <table >
        <tr>
        <td><img src="img/carritorx8[1].jpg" width="84" height="77" /></td>
        <td><h1 style="color:#FFFFFF">Carrito de Compras con ArrayList y Sesiones</h1></td>
        </tr>
        <td>Se registro su pedido</td>
        </tr>
        <tr>
        <td><table>
        <tr>
        <td><h4>Nombre</h4></td>
        <td><h4>Stock</h4></td>
        <td><h4>Precio</h4></td>
        </tr>

<%
        for(int i=0; i<productos.size(); i++){
            if(i%2==0){ %>
                <tr>
                <td><%=productos.get(i).getNombreProducto()%></td>
                <td><%=productos.get(i).getStock()%></td>
                <td><%=productos.get(i).getPrecio()%></td>
                </tr>
           <% }else{%>
                <tr>
                <td><%=productos.get(i).getNombreProducto()%></td>
                <td><%=productos.get(i).getStock()%></td>
                <td><%=productos.get(i).getPrecio()%></td>
                </tr>
      <%      }
        }%>

        </table></td>
        </tr>
        
        </table>

      
      
      
        
    </body>
</html>
