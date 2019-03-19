
<%@page import="Models.entity.Colegio"%>
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Models.Beans.PasajeroBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pasajero" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>
<jsp:useBean id="colegio" class="Models.Beans.ColegioBean" scope="request"></jsp:useBean>


<%  List<Pasajero> Lpa = pasajero.findAll();
    List<Colegio> Lcol = colegio.findAll();%>

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
        <title> Listado de Pasajeros </title>
    </head>
<!-- Body -->    
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %> 
<!-- NavBar -->
        <% if(u!=null){%>
        <nav class="blue-grey" role="navigation">
            
<!-- Logo -->
                    <a href="#" class="brand-logo">
                        <h6>Bienvenid/a:<%=u.getNombre()%>
                        <%=u.getApellido()%></h6>
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
                    <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <%}else{%>
            No tienes permiso para acceder <a href="../login.jsp">Volver a login</a>
        <%}%>
        <center><h3> Listado de Pasajeros </h3></center>
        <p><a href="<%=request.getContextPath() %>/CRUDPasajero/formularioPasajero.jsp"> Agregar Pasajero (+)</a></p>
        <div class="container">
            <table>
                <tr>
                    <th> # </th>
                    <th> Rut </th>
                    <th> Colegio </th>
                    <th> Nombre </th>
                    <th> Apellido </th>
                    <th> Apoderado </th>
                    <th> Domicilio </th>
                    <th> Modificar </th>
                    <th> Eliminar </th>
                </tr>
                <% for(Pasajero p : Lpa){ %>
                    <tr>
                        <td> <%= p.getCodigoP() %> </td>
                        <td> <%= p.getRut() %> </td>
                        <td><%for (Colegio c: Lcol) {
                        if(c.getCodigoC()==(p.getColegio())){
                        %><%= p.getColegio()%>
                        <%}}%></td>
                        <td> <%= p.getNombreP() %> </td>
                        <td> <%= p.getApellido() %> </td>
                        <td> <%= p.getApoderado() %> </td>
                        <td> <%= p.getDomicilio() %> </td>   
                        <td><a href="<%= request.getContextPath() %>/CRUDPasajero/formularioPasajero.jsp?codigoP=<%=p.getCodigoP()%>"> Editar </a></td>
                        <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDPasajero/eliminarPasajero.jsp?codigoP=<%=p.getCodigoP()%>"> Eliminar </a></td>
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