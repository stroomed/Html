
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.entity.Mensualidad"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Models.Beans.MensualidadBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="mens" class="Models.Beans.MensualidadBean" scope="request"></jsp:useBean>
<jsp:useBean id="pasajero" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>
<jsp:useBean id="usuario" class="Models.Beans.UsuarioBean" scope="request"></jsp:useBean>
    
<%  List<Mensualidad> listadoMensualidad = mens.findAll();
    List<Pasajero> Lpa = pasajero.findAll();
    List<Usuarios> Lusu = usuario.findAll();%>

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
        <title> Listado de Mensualidades </title>
    </head>
<!-- Body -->    
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %> 
<!-- NavBar -->
        <% if(u!=null){%>
        <nav>
            
<!-- Logo -->
                    <a href="#" class="brand-logo">
                        <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
                    </a>
                    <div>
                    <ul class="right hide-on-med-and-down">
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
        <center><h3> Listado de Mensualidades </h3></center>
        <br>
        <p><a href="formularioMensualidad.jsp">Agregar Mensualidad (+)</a></p>
        <div class="container">
            <table>
                <tr>
                    <th>#</th>
                    <th>Rut</th>
                    <th>Usuario</th>
                    <th>año Mensualidad</th>
                    <th>Mes Mensualidad</th>
                    <th>Monto Mensualidad</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
                <% for(Mensualidad p : listadoMensualidad){ %>
                    <tr>
                        <td><%= p.getCodigo_men() %></td>
                        <td><%for (Pasajero c: Lpa) {
                        if(c.getCodigoP()==(p.getPasajero())){
                        %><%= c.getRut()%>
                        <%}}%></td>
                        <td><%for (Usuarios us: Lusu) {
                        if(us.getCodigo()==(p.getUsuario())){
                        %><%= us.getNombre()%>
                        <%}}%></td>
                        <td><%= p.getYear_mensualidad() %></td>
                        <td><%= p.getMes_mensualidad() %></td>
                        <td><%= p.getMonto_mensualidad() %></td>   
                        <td><a href="<%= request.getContextPath() %>/CRUDMensualidad/formularioMensualidad.jsp?codigo_men=<%=p.getCodigo_men()%>">editar</a></td>
                        <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDMensualidad/eliminarMensualidad.jsp?codigo_men=<%=p.getCodigo_men()%>">eliminar</a></td>
                    </tr>
                <%} %>
            </table>
        </div>
<!-- Scripts -->      
        <script type="text/javascript" src="../utilidades/js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="../utilidades/js/paralax.js"></script>
        <script src="../utilidades/js/init.parallax.js"></script>
    </body>
</html>