
<%@page import="java.util.List"%>
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.entity.Mensualidad"%>
<%@page import="Models.Beans.MensualidadBean"%>
<%@page import="Models.entity.Usuarios" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="mensualidad" class="Models.Beans.MensualidadBean" scope="request"></jsp:useBean>
<jsp:useBean id="pas" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>
<jsp:useBean id="uss" class="Models.Beans.UsuarioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo_men" name="mensualidad" />

<% 
    Mensualidad Mensualidad = mensualidad.findById();
    List<Pasajero> pasa = pas.findAll();
    List<Usuarios> use = uss.findAll();
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
        <title> Formulario Mensualidad </title>
    </head>
    <body>
        <%
            Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
        %> 
        <% if(u!=null){%>
        <nav>
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
        <br>
        <center><h3>Formulario mensualidad</h3></center>
        <br>
        <div class="container">
            <form method="post" action="<%= application.getContextPath() %>/CRUDMensualidad/guardarMensualidad.jsp">
                <input type="hidden" name="codigo_men" value="<%=Mensualidad.getCodigo_men()%>"/>
                <table border="1">
                    <tbody>
                        <tr>
                            <td><span>Pasajero</span></td>
                            <td>
                                <select name="pasajero">
                                    <%for(Pasajero p : pasa){ %>
                                        <option value="<%=p.getCodigoP()%>"><%=p.getRut()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Usuario</span></td>
                            <td>
                                <select name="usuario">
                                    <%for(Usuarios s : use){%>
                                        <option value="<%=s.getCodigo()%>"><%=s.getNombre()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Año Mensualidad</span></td>
                            <td><input size="40" type="text" name="year_mensualidad" value="<%=Mensualidad.getYear_mensualidad()==null?"":Mensualidad.getYear_mensualidad()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Mes Mensualidad</span></td>
                            <td><input type="text" name="mes_mensualidad" value="<%=Mensualidad.getMes_mensualidad()==null?"":Mensualidad.getMes_mensualidad()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Monto Mensualidad</span></td>
                            <td><input type="text" name="monto_mensualidad" value="<%=Mensualidad.getMonto_mensualidad()==0?"":Mensualidad.getMonto_mensualidad()%>"/></td>
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