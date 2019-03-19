<%-- 
    Document   : carrito3
    Created on : 17-05-2018, 09:59:06 PM
    Author     : 11714291-4
--%>
<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="cl.isapre.modelo.Bonos"%>
<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!--Import Google Icon Font-->
 <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

 <!--Import materialize.css-->
 <link type="text/css" rel="stylesheet" href="css/materialize.min.css"
media="screen,projection"/>
 <!--Let browser know website is optimized for mobile-->
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 </head>
 <body>
  <%
    //User user=(User) session.getAttribute("user");
    Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
  %>
      
<div class="container">
  <% if(afiliado!=null){%>
    <nav>
    <div class="nav-wrapper orange lighten-2">
      <a href="#" class="brand-logo">
          Bienvenido:<%=afiliado.getNombres()%> <%=afiliado.getApellidos()%> al sistema
      </a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
       <li><a href="CompraBono.jsp">Productos</a></li>
        <li><a href="cerrar.jsp">Salir</a></li>
      </ul>
    </div>
  </nav>
   <%}else{%>
   No tienes permiso para acceder <a href="login.html">Volver a login</a>
   <%}%>

       <%
       
        HttpSession sesion=request.getSession();
        ArrayList<Bonos> carritoCompra=null;
        ArrayList<Prestacion> prestacion=(ArrayList<Prestacion>) sesion.getAttribute("prestacion");
        Afiliado usuario=(Afiliado)sesion.getAttribute("usuarioInicio");
        //Si se creo la sesion con el atributo de carrito
        if(sesion.getAttribute("Bonos")!=null){
            //Si existe una sesion con ese atributo, se obtiene los datos de esa sesion
            carritoCompra=(ArrayList<Bonos>)sesion.getAttribute("Bonos");
        }else{
            //Si no existe esa sesion se crea el carrito de compras
            carritoCompra=new ArrayList<Bonos>();

        }
        //Obtenemos los valores de la cajas de texto
        int indice=Integer.parseInt(request.getParameter("txtIndice").trim());
        String descripcion=request.getParameter("txtIndice");
        int subTotal=prestacion.get(indice).getValor();
        float total=0;
        
        //Creo el elemento carrito
        Bonos car=new Bonos();
        car.setRutPrestador(request.getParameter(usuario.getRut()));
        car.setCodigoPrestador(indice);
        car.setDescripcionPrestacion(descripcion);
        car.setBonificacionFinanciar(request.getParameter(prestacion));
        car.setCopagoBeneficiario(subTotal);
        //Agrego el carrito a mi vector
        carritoCompra.add(car);
        sesion.setAttribute("bono",carritoCompra);
        //PrintWriter out=response.getWriter();
%>
       
        <table class="striped">
        <tr>
        <td><img src="img/carritorx8[1].jpg" width="84" height="77" /></td>
        <td><h1>Carrito de Compras con ArrayList y Sesiones</h1></td>
        </tr>
        </table> 
        
       <table class="striped">
        <tr>
        <td><table>
        <tr>
        <td><h4>Rut del prestador</td>
        <td><h4>Codigo de la prestacion</td>
        <td><h4>Descripcion Prestacion</h4></td>
        <td><h4>Boificacion a financiar</h4></td>
        </tr>
       
       
        <% for(int i=0; i<carritoCompra.size(); i++){
              total=total+subTotal;
            if(i%2==0){%>
                <tr>
                <td><%=carritoCompra.get(i).getProducto().getNombreProducto() %></td>
                <td><%=carritoCompra.get(i).getCantidadPedida()%></td>
                <td><%=carritoCompra.get(i).getSubTotal()%></td>
                
                </tr>
           <% }else{ %>
                <tr>
                <td><%=carritoCompra.get(i).getProducto().getNombreProducto()%></td>
                <td><%=carritoCompra.get(i).getCantidadPedida()%></td>
                <td><%=carritoCompra.get(i).getSubTotal()%></td>

                </tr>
                <%       }%>
              
                     <%=total%>
                     <% } %>

        </table></td>
        </tr>
        <tr>
        <td colspan="2" aling="center"><a href="finalizarcompra.jsp">FINALIZAR COMPRA</a></td>
        <td colspan="2" aling="center"><a href="CompraBono.jsp">SEGUIR COMPRANDO</a></td>
        </tr>
        </table>
       
</div>       
         <!-- Contenido-->
 <!--Import jQuery before materialize.js-->
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
 <script type="text/javascript" src="js/materialize.min.js"></script>
 <script type="text/javascript">
     $(document).ready(function() {
 $('select').material_select();
 });
     
 </script>       
  </body>
</html>
