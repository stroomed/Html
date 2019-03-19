
<%@page import="Models.entity.Usuarios"%>
<%@page import="Models.entity.Colegio"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>

<jsp:useBean id="colegio" class="Models.Beans.ColegioBean" scope="request"></jsp:useBean>

<% List<Colegio> listadoColegio = colegio.findAll();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<!-- Materialize -->
        <link type="text/css" rel="stylesheet" href="../utilidades/css/parallax.min.css"  media="screen,projection"/>
<!-- CSS -->
        <link type="text/css" rel="stylesheet" href="../utilidades/css/style.css" media="screen,projection">
<!-- Optimizado para moviles -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- Charset -->        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Titulo -->        
        <title> Listado de Colegios </title>
    </head>
<!-- Body -->
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %>
<!-- NavBar -->
        <% if(u!=null){%>
        <nav class="grey light-blue" role="navigation">
           
<!-- Logo -->
                    <a href="#" class="brand-logo">
                        <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
                    </a>
                     <div>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="../CRUDMensualidad/listadoMensualidad.jsp"> Lista Mensualidad </a></li>
                        <li><a href="../CRUDBus/listadoBus.jsp"> Lista Bus </a></li>     
                        <li><a href="../CRUDTrasladoDiario/listadoTraslado.jsp"> Lista traslado </a></li>  
                        <li><a href="../CRUDPasajero/listadoPasajero.jsp"> Lista Pasajero </a></li>         
                        <li><a href="../catalogoU/listado.jsp"> Lista Usuario </a></li>
                        <li><a href="../CRUDColegio/listadoColegio.jsp"> Lista Colegio </a></li>
                        <li><a href="../CRUDChofer/listadoChofer.jsp"> Lista Chofer </a></li>
                        <li><a href="../menu.jsp"> Volver a inicio </a></li>
                        <li><a href="../cerrar.jsp"> Cerrar Sesion </a></li>
                    </ul>
                    <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <%}else{%>
            No tienes permiso para acceder <a href="login.jsp">Volver a login</a>
        <%}%>
        <center><h3>Listado de Colegios</h3></center>
        <br>
        <p><a href="<%=request.getContextPath() %>/CRUDColegio/formularioColegio.jsp">Agregar Colegio (+)</a></p>
        <div class="container">
        <table>
            <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Direccion</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <% for(Colegio p : listadoColegio){ %>
                <tr>
                    <td><%= p.getCodigoC()%></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getDireccion() %></td>
                    <td><a href="<%= request.getContextPath() %>/CRUDColegio/formularioColegio.jsp?codigoC=<%=p.getCodigoC()%>">editar</a></td>
                    <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDColegio/eliminarColegio.jsp?codigoC=<%= p.getCodigoC()%>">eliminar</a></td>
                </tr>
            <%} %>
        </table>
        </div>
<!-- Scripts -->      
        <script type="text/javascript" src="../js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="../utilidades/js/paralax.js"></script>
        <script src="../utilidades/js/init.parallax.js"></script>
    </body>
</html>