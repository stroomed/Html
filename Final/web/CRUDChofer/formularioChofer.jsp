
<%@page import="Models.entity.Usuarios"%>
<%@page import="Models.entity.Chofer"%>
<%@page import="Models.Beans.ChoferBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="chofer" class="Models.Beans.ChoferBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="chofer" />

<% Chofer Chofer = chofer.findById();%>

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
        <title> Formulario Chofer </title>
    </head>
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
        <center><h3> Formulario Chofer </h3></center>
        <div class="container">
            <form method="post" action="<%= application.getContextPath() %>/CRUDChofer/guardarChofer.jsp">
                <input type="hidden" name="codigo" value="<%=Chofer.getCodigo()%>"/>
                <table border="1">
                    <tbody>
                        <tr>
                            <td><span>Rut</span></td>
                            <td><input size="40" type="text" name="rut" value="<%=Chofer.getRut()==null?"":Chofer.getRut()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Nombre</span></td>
                            <td><input size="40" type="text" name="nombre" value="<%=Chofer.getNombre()==null?"":Chofer.getNombre()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Apellido</span></td>
                            <td><input size="40" type="text" name="apellido" value="<%=Chofer.getApellido()==null?"":Chofer.getApellido()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Movil</span></td>
                            <td><input type="text" name="movil" value="<%=Chofer.getMovil()==0?"":Chofer.getMovil()%>"/></td>
                        </tr>
                        <tr>
                            <td><span>Sexo</span></td>
                            <td><input type="text" name="sexo" value="<%=Chofer.getSexo()==null?"":Chofer.getSexo()%>"/></td>
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
        <script src="../utilidades/js/paralax.js"></script>
        <script src="../utilidades/js/init.parallax.js"></script>
    </body>
</html>