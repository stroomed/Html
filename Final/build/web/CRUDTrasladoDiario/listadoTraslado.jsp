
<%@page import="Models.entity.Bus"%>
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.entity.TrasladoDiario"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Models.Beans.TrasladoDiarioBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="trasladoDiario" class="Models.Beans.TrasladoDiarioBean" scope="request"></jsp:useBean>
<jsp:useBean id="pasajero" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>
<jsp:useBean id="bus" class="Models.Beans.BusBean" scope="request"></jsp:useBean>
    
    
<%  List<TrasladoDiario> listadoTrasladoDiario = trasladoDiario.findAll();
    List<Pasajero> Lpa = pasajero.findAll();
    List<Bus> Lbus = bus.findAll();%>


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
        <title> Listado de Traslado </title>
    </head>
<!-- Body -->    
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %> 
<!-- NavBar -->
        <% if(u!=null){%>
        <nav class="pink" role="navigation">
            
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
            No tienes permiso para acceder <a href="../login.jsp">Volver a login</a>
        <%}%>
        <br>
        <center><h3>Listado de Traslado</h3></center>
        <br>
        <p><a href="<%=request.getContextPath() %>/CRUDTrasladoDiario/formularioTraslado.jsp">Agregar Traslado (+)</a></p>
        <div class="container">
            <table>
                <tr>
                    <th>#</th>
                    <th>Rut Pasajero</th>
                    <th>Patente Bus</th>
                    <th>Dia Traslado</th>
                    <th>Hora Salida Traslado</th>
                    <th>Hora Llegada Traslado</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
                <% for(TrasladoDiario p : listadoTrasladoDiario){ %>
                    <tr>
                        <td><%= p.getCodigo_tra() %></td>
			<td><%for (Pasajero c: Lpa) {
                        if(c.getCodigoP()==(p.getPasajero())){
                        %><%= c.getRut()%>
                        <%}}%></td>
			<td><%for (Bus b: Lbus) {
                        if(b.getCodigoB()==(p.getBus())){
                        %><%= b.getPatente_bus()%>
                        <%}}%></td>
			<td><%= p.getDia_traslado() %></td>
			<td><%= p.getHoraSalida_traslado() %></td>
                        <td><%= p.getHoraLlegada_traslado() %></td>
			<td><a href="<%= request.getContextPath() %>/CRUDTrasladoDiario/formularioTraslado.jsp?codigo_tra=<%=p.getCodigo_tra()%>">editar</a></td>
                        <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDTrasladoDiario/eliminarTraslado.jsp?codigo_tra=<%=p.getCodigo_tra()%>">eliminar</a></td>
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