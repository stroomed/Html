
<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 //ArrayList <Producto> productos=(ArrayList<Producto>)getServletContext().getAttribute("listaproducto");    
ArrayList<Prestacion> prestacion = (ArrayList<Prestacion>) request.getSession().getAttribute("productos");
        int indice=Integer.parseInt(request.getParameter("indice"));
        Prestacion prod=prestacion.get(indice);
%>
       
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
       <br>
     <table>
        <tr>
       <td><img src="img/carritorx8[1].jpg" width="84" height="77"/></td>
       <td><h4>Carrito de bonos con ArrayList y Sesiones</h4></td>
       </tr>   
     </table>
 <div class="row">      
        <form name="frmPrincipal" method="post" action="carrito3.jsp">
        <table class="striped">
        0
        <tr>
        <td>Codigo</td>
        <td><label>
        <input type="text" name="txtIndice" id="txtIndice" readonly="readonly" value="<%=prod.getCodigoPrestacion()%>"/>
        </label></td>
        </tr>
        <tr>
        <td>Prestacion</td>
        <td><label>
        <input type="text" name="txtProducto" id="txtProducto" readonly="readonly" value="<%=prod.getDescripcionPrestacion()%>" />
        </label></td>
        </tr>
        
        <tr>
        <td>&nbsp;</td>
        <td><label>
        <input type="submit" name="button" id="button" value="Solicitar" />
        </label></td>
        </tr>
        </table>

        </form>
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