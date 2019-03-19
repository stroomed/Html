
<%@page import="Models.entity.Pasajero"%>
<%@page import="Models.entity.Bus"%>
<%@page import="Models.entity.TrasladoDiario"%>
<%@page import="Models.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Models.Beans.TrasladoDiarioBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="trasladoDiario" class="Models.Beans.TrasladoDiarioBean" scope="request"></jsp:useBean>
<jsp:useBean id="bus" class="Models.Beans.BusBean" scope="request"></jsp:useBean>
<jsp:useBean id="pas" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo_tra" name="trasladoDiario" />

<% 
    TrasladoDiario TrasladoDiario = trasladoDiario.findById();
    List<Bus> Bus = bus.findAll();
    List<Pasajero> pasajero = pas.findAll();
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
        <title> Formulario de Traslado </title>
    </head>
<!-- Body -->    
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
        <center><h3>Formulario de Traslado</h3></center>
        <br>
        <div class="container">
            <form method="post" action="<%= application.getContextPath() %>/CRUDTrasladoDiario/guardarTraslado.jsp">
                <input type="hidden" name="codigo_tra" value="<%=TrasladoDiario.getCodigo_tra()%>"/>
                <table border="1">
                    <tbody>
                        <tr>
                            <td>
                                <span>Pasajero</span>
                            </td>
                            <td>
                                <select name="pasajero">
                                    <% for (Pasajero p : pasajero){ %>
                                        <option value="<%=p.getCodigoP()%>"><%=p.getRut()%></option>
                                    <% } %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Bus</span>
                            </td>
                            <td>
                                <select name="bus">
                                    <% for (Bus w : Bus){ %>
                                        <option value="<%=w.getCodigoB()%>"><%=w.getPatente_bus()%></option>
                                    <% } %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Día Traslado</span></td>
                            <td><input size="40" type="text" name="dia_traslado" value="<%=TrasladoDiario.getDia_traslado()==null?"":TrasladoDiario.getDia_traslado()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Hora Salida</span></td>
                            <td><input type="text" name="horaSalida_traslado" value="<%=TrasladoDiario.getHoraSalida_traslado()==null?"":TrasladoDiario.getHoraSalida_traslado()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Hora Llegada</span></td>
                            <td><input type="text" name="horaLlegada_traslado" value="<%=TrasladoDiario.getHoraLlegada_traslado()==null?"":TrasladoDiario.getHoraLlegada_traslado()%>"/></td>
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