
<%@page import="Models.entity.Chofer"%>
<%@page import="Models.entity.Bus"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Models.Beans.BusBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="bus" class="Models.Beans.BusBean" scope="request"></jsp:useBean>
<jsp:useBean id="chofer" class="Models.Beans.ChoferBean" scope="request"></jsp:useBean>

<%  List<Bus> listadoBus = bus.findAll();
    List<Chofer> Lcho = chofer.findAll();%>

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
        <title> Listado de Buses </title>
    </head>
<!-- Body -->    
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %> 
<!-- NavBar -->
        <% if(u!=null){%>
            <nav class="yellow" role="navigation">
                
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
        <center><h3> Listado de Buses </h3></center>
        <br>
        <p><a href="<%=request.getContextPath() %>/CRUDBus/formularioBus.jsp"> Agregar Bus (+)</a></p>
        <div class="container">
            <table>
                <tr>
                    <th> # </th>
                    <th> Patente </th>
                    <th> Chofer </th>
                    <th> Marca </th>
                    <th> Modelo </th>
                    <th> Año </th>
                    <th> Capacidad </th>
                    <th> Modificar </th>
                    <th> Eliminar </th>
                </tr>
                <% for(Bus p : listadoBus){ %>
                    <tr>
                        <td> <%= p.getCodigoB() %> </td>
                        <td> <%= p.getPatente_bus() %> </td>
                        <td><%for (Chofer c: Lcho) {
                        if(c.getCodigo()==(p.getRutChofer())){
                        %><%=c.getRut()%>
                        <%}}%></td>
                        <td> <%= p.getMarca() %> </td>
                        <td> <%= p.getModelo() %> </td>
                        <td> <%= p.getYear() %> </td> 
                        <td> <%= p.getCapacidad() %> </td> 
                        <td><a href="<%= request.getContextPath() %>/CRUDBus/formularioBus.jsp?codigoB=<%=p.getCodigoB()%>"> Editar </a></td>
                        <td><a onclick="return confirm('¿Esta seguro?');" href="<%= request.getContextPath() %>/CRUDBus/eliminarBus.jsp?codigoB=<%=p.getCodigoB()%>"> Eliminar </a></td>
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
