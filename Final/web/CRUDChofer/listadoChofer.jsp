
<%@page import="Models.entity.Chofer"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="chofer" class="Models.Beans.ChoferBean" scope="request"></jsp:useBean>

<% List<Chofer> listadoChofer = chofer.findAll();%>
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
        <title> Listado de Choferes </title>
    </head>
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %>  
        <% if(u!=null){%>
<!-- NavBar -->        
            <nav class="grey lighten-1" role="navigation">
               
                    <a href="#" class="brand-logo">
                        <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
                    </a> 
                     <div >
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
                </div>
            </nav>
        <%}else{%>
            No tienes permiso para acceder <a href="../login.jsp">Volver a login</a>
        <%}%>
        <center><h3> Listado de Chofer </h3></center>
        <p><a href="<%=request.getContextPath() %>/CRUDChofer/formularioChofer.jsp"> Agregar Chofer (+)</a></p>
        <div class="container">
            <table>
                <tr>
                    <th> # </th>
                    <th> Rut </th>
                    <th> Nombre </th>
                    <th> Apellido </th>
                    <th> Movil </th>
                    <th> Sexo </th>
                    <th> Modificar </th>
                    <th> Eliminar </th>
                </tr>
                <% for(Chofer p : listadoChofer){ %>
                    <tr>
                        <td> <%= p.getCodigo() %> </td>
                        <td> <%= p.getRut() %> </td>
                        <td> <%= p.getNombre() %> </td>
                        <td> <%= p.getApellido() %> </td>
                        <td> <%= p.getMovil() %> </td>
                        <td> <%= p.getSexo() %> </td>   
                        <td><a href="<%= request.getContextPath() %>/CRUDChofer/formularioChofer.jsp?codigo=<%=p.getCodigo()%>"> Editar </a></td>
                        <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDChofer/eliminarChofer.jsp?codigo=<%=p.getCodigo()%>"> Eliminar </a></td>
                    </tr>
                <%} %>
            </table>
        </div>
        <script type="text/javascript" src="../js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="../utilidades/js/paralax.js"></script>
        <script src="../utilidades/js/init.parallax.js"></script>
    </body>
</html>