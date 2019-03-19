
<%@page import="Models.entity.Colegio"%>
<%@page import="java.util.List"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.Beans.PasajeroBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pasajero" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>
<jsp:useBean id="colegio" class="Models.Beans.ColegioBean" scope="request"></jsp:useBean>
<jsp:setProperty property="codigoP" name="pasajero" />

<% 
    Pasajero p = pasajero.findById();
    List<Colegio> col = colegio.findAll();
%>

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
        <title> Formulario Pasajero </title>
    </head>
    <body>
        <%Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");%>
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
        <center><h3> Formulario Pasajero </h3></center>
        <div class="container">
            <form method="post" action="<%= application.getContextPath() %>/CRUDPasajero/guardarPasajero.jsp">
                <input type="hidden" name="codigoP" value="<%=p.getCodigoP()%>"/>
                <table border="1">
                    <tbody>
                        <tr>
                            <td><span>Rut</span></td>
                            <td><input size="40" type="text" name="rut" value="<%=p.getRut()==null?"":p.getRut()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Colegio</span></td>
                                                    
                            <td>
                                <select name="colegio">
                                <%for (Colegio c: col){%>
                                <option value="<%=c.getCodigoC()%>"> <%=c.getCodigoC()%></option>
                                <%}%>
                            </select></td>
                        </tr>
                        <tr>
                            <td><span>Nombre</span></td>
                            <td><input size="40" type="text" name="nombreP" value="<%=p.getNombreP()==null?"":p.getNombreP()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Apellido</span></td>
                            <td><input size="40" type="text" name="apellido" value="<%=p.getApellido()==null?"":p.getApellido()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Apoderado</span></td>
                            <td><input size="40" type="text" name="apoderado" value="<%=p.getApoderado()==null?"":p.getApoderado()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Domicilio</span></td>
                            <td><input size="40" type="text" name="domicilio" value="<%=p.getDomicilio()==null?"":p.getDomicilio()%>"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" name="guardar" value="Guardar"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <!-- Scripts -->      
        <script type="text/javascript" src="/js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="/utilidades/js/paralax.js"></script>
        <script src="/utilidades/js/init.parallax.js"></script>
        
    </body>
</html>