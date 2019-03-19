
<%@page import="Models.entity.Usuarios"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<!-- Materialize -->
        <link type="text/css" rel="stylesheet" href="utilidades/css/parallax.min.css"  media="screen,projection"/>
<!-- CSS -->
        <link type="text/css" rel="stylesheet" href="utilidades/css/style.css" media="screen,projection">
<!-- Optimizado para moviles -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- Charset -->        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Titulo -->        
        <title> Menu </title>
    </head>
<body>
    <%
        Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
    %> 
<!-- NavBar -->
    <% if(u!=null){%>    
        <nav>
            <div class="nav-wrapper orange darken-4">

                    <a href="#" class=" brand-logo gray-text darken-4" >
                        <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
                    </a>
 
                <ul class="right hide-on-med-and-down ">
                    <li><a href="CRUDMensualidad/listadoMensualidad.jsp"> Lista Mensualidad </a></li>
                    <li><a href="CRUDBus/listadoBus.jsp"> Lista Bus </a></li>     
                    <li><a href="CRUDTrasladoDiario/listadoTraslado.jsp"> Lista traslado </a></li>  
                    <li><a href="CRUDPasajero/listadoPasajero.jsp"> Lista Pasajero </a></li>         
                    <li><a href="catalogoU/listado.jsp"> Lista Usuario </a></li>
                    <li><a href="CRUDColegio/listadoColegio.jsp"> Lista Colegio </a></li>
                    <li><a href="CRUDChofer/listadoChofer.jsp"> Lista Chofer </a></li>
                    <li><a href="menu.jsp"> Volver a inicio </a></li>
                    <li><a href="cerrar.jsp"> Cerrar Sesion </a></li>
                </ul>
            </div>         
        </nav>
        <%}else{%>
            No tienes permiso para acceder <a href="login.jsp">Volver a login</a>
        <%}%>
        <br>
        <div class="container">
            <table border="1">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=u.getNombre()%></td>
                        <td><%=u.getApellido()%></td>
                    </tr>
                </tbody>
            </table>
        </div>   
        <br>
<!-- Scripts -->      
        <script type="text/javascript" src="../utilidades/js/parallax.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('select').material_select();
            } );           
            
        </script>
        
    </body>
</html>

