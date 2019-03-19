<%-- 
    Document   : ServletCConProd
    Created on : 16-05-2018, 0:38:58
    Author     : Leica
--%>

<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%//ArrayList<Producto> productos=(ArrayList<Producto>)request.getSession().getAttribute("productos");%>

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
       <li><a href="CompraBono.jsp">Bonos</a></li>
        <li><a href="carrito3.jsp">Carrito</a></li>
        <li><a href="cerrar.jsp">Salir</a></li>
      </ul>
    </div>
  </nav>
   <%}else{%>
   No tienes permiso para acceder <a href="login.html">Volver a login</a>
   <%}%>
       <br><br>
       <hr>
     <table>
        <tr>
       <td><img src="image/5-bono.jpg" width="84" height="77"/></td>
       <td><h4>Carrito de Compras con ArrayList y Sesiones</h4></td>
       </tr>   
     </table>


<div class="row">

  
         <table class="striped">
      
             <tr>
                 <th>Codigo</th>
                 <th>Nombre</th>
                 <th>Valor</th>
                 <th>Bonificacion</th>
                 <th>Copago</th>
                 <th>Adquirir</th>
             </tr>
  <%
       ArrayList<Prestacion> prestacion=(ArrayList<Prestacion>)request.getSession().getAttribute("prestacion");
      //ArrayList <Producto> productos=(ArrayList<Producto>)getServletContext().getAttribute("listaproducto");
        for(int i=0; i<prestacion.size(); i++){
            if(i%2==0){ %>
               <tr align="left">
               <td><%=prestacion.get(i).getCodigoPrestacion()%></td>    
               <td><%=prestacion.get(i).getDescripcionPrestacion()%></td>
               <td><%=prestacion.get(i).getValor()%></td>
               <td><%=prestacion.get(i).getBonificacionFinanciar()%></td>
               <td><%=prestacion.get(i).getCopagoBeneficiario()%></td>
               <td><a class="large material-icons" href="carrito2.jsp?indice=<%=i%>">add_shopping_cart</a></td>
               </tr>
           <% }else{%>
               <tr align="left">
               <td><%=prestacion.get(i).getCodigoPrestacion()%></td>    
               <td><%=prestacion.get(i).getDescripcionPrestacion()%></td>
               <td><%=prestacion.get(i).getValor()%></td>
               <td><%=prestacion.get(i).getBonificacionFinanciar()%></td>
               <td><%=prestacion.get(i).getCopagoBeneficiario()%></td>
               <td><a class="large material-icons" href="carrito2.jsp?indice=<%=i%>">add_shopping_cart</a></td>
               </tr>
      <%      }
        }%>

       </table>
</div>  
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

