
<%@page import="java.util.List"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="Models.entity.Chofer"%>
<%@page import="Models.entity.Bus"%>
<%@page import="Models.Beans.BusBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="bus" class="Models.Beans.BusBean" scope="request"></jsp:useBean>
<jsp:useBean id="Chofer" class="Models.Beans.ChoferBean" scope="request"></jsp:useBean>
    
<jsp:setProperty property="codigoB" name="bus" />

<% Bus b = bus.findById();
   List<Chofer> ch = Chofer.findAll();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<!-- Materialize -->
        <link type="text/css" rel="stylesheet" href="/utilidades/css/parallax.min.css"  media="screen,projection"/>
<!-- CSS -->
        <link type="text/css" rel="stylesheet" href="/utilidades/css/style.css" media="screen,projection">
<!-- Optimizado para moviles -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- Charset -->        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Titulo -->        
        <title> Formulario Bus </title>
    </head>
<body>
    <%
        Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
    %> 
<!-- NavBar -->
    <% if(u!=null){%>
        <nav>
            <a href="#" class="brand-logo">
                <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
            </a>
            <div class="nav-wrapper">
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
        <br>
        <center><h3> Formulario Bus </h3></center>
        <br>
        <div class="container">
            
                <form method="post" action="<%= application.getContextPath() %>/CRUDBus/guardarBus.jsp">
                    <input type="hidden" name="codigoB" value="<%=b.getCodigoB()%>"/> 
                    <table border="1">
                        <tbody>
                            <tr>
                            <td><span>Patente</span></td>
                            <td><input size="40" type="text" name="patente_bus" value="<%=b.getPatente_bus()==null?"":b.getPatente_bus()%>"/></td>
                            </tr>
                            <tr>
                            <td><span>Chofer</span></td>
                                <td><select name="rutChofer">
                                    <%for(Chofer c : ch){%>
                                        <option value="<%=c.getCodigo()%>"><%=c.getRut()%></option>
                                    <%}%> 
                                </select></td>
                            </tr>
                            <tr>
                                <td><span>Marca</span></td>
                                <td><input size="40" type="text" name="marca" value="<%=b.getMarca()==null?"":b.getMarca()%>"/></td>
                            </tr>
                            <tr>
                                <td><span>Modelo</span></td>
                                <td><input size="40" type="text" name="modelo" value="<%=b.getModelo()==null?"":b.getModelo()%>"/></td>
                            </tr>
                            <tr>
                                <td><span>Año</span></td>
                                <td><input size="40" type="text" name="year" value="<%=b.getYear()==0?"":b.getYear()%>"/></td>
                            </tr>
                            <tr>
                                <td><span>Capacidad</span></td>
                                <td><input size="40" type="text" name="capacidad" value="<%=b.getCapacidad()==0?"":b.getCapacidad()%>"/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name="guardar" value="Guardar"/></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            
        </div>
<!-- Scripts -->      
        <script type="text/javascript" src="../js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="/utilidades/js/paralax.js"></script>
        <script src="/utilidades/js/init.parallax.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('select').formSelect();
            } ); 
        </script>
    </body>
</html>