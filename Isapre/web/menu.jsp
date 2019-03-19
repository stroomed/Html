
<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="cl.isapre.modelo.Bonos"%>
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
          <h5>Bienvenid@:<%=afiliado.getNombres()%> <br>
              <%=afiliado.getApellidos()%> al sistema</h5>
      </a>
      
   
      
      <ul id="nav-mobile" class="right hide-on-med-and-down">
       <li><a href="ListaAfiliados.jsp">Lista afiliados</a></li>
       <li><a href="ListaPrestaciones.jsp">Prestaciones</a></li> 
       <li><a href="ListaMedicos.jsp">Medicos</a></li>
       <li><a href="CompraBono.jsp">Bonos</a></li>
       <li><a href="cerrar.jsp">Cerrar Sesion</a></li>
      </ul>
    </div>
  </nav>
   <%}else{%>
   No tienes permiso para acceder <a href="login.html">Volver a login</a>
   <%}%>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Rut</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=afiliado.getRut()%></td>
                    <td><%=afiliado.getNombres()%></td>
                    <td><%=afiliado.getApellidos()%></td>
                </tr>
            </tbody>
        </table>

   
       <br><br>
       
        
        
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

