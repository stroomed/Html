<%@page import="Models.entity.Usuarios"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Models.Beans.*, Models.entity.*"%>

<jsp:useBean id="usuario" class="Models.Beans.UsuarioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="usuario" />

<% Usuarios user = usuario.findById();%>

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
        <title> Formulario de Usuarios </title>
    </head>
<body>
    <%
    Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
  %>
 

  <% if(u!=null){%>
        <nav class="orange darken-4">
            <a href="#" class=" brand-logo gray-text darken-4" >
                <h6>Bienvenido/a: <%=u.getNombre()%> <%=u.getApellido()%></h6>
            </a>
            <ul class="right hide-on-med-and-down ">
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
        </nav>
<br>
<center><h3>Formulario de Usuario</h3></center>
        <br>
<div class="container">
<form method="post" action="<%= application.getContextPath() %>/catalogoU/guardar.jsp">
    <input type="hidden" name="codigo" value="<%=user.getCodigo()%>"/>
    <table border="1">
        <tbody>
            <tr>
                <td><span>Nombre</span></td>
                <td><input size="40" type="text" name="nombre" value="<%=user.getNombre()==null?"":user.getNombre()%>"/></td>
            </tr>
            <tr>
                <td><span>Apellido</span></td>
                <td><input size="40" type="text" name="apellido" value="<%=user.getApellido()==null?"":user.getApellido()%>"/></td>
            </tr>
            <tr>
                <td><span>Usuario</span></td>
                <td><input type="text" name="usuario" value="<%=user.getUsuario()==null?"":user.getUsuario()%>"/></td>
            </tr>
            <tr>
                <td><span>Clave</span></td>
                <td><input type="text" name="clave" value="<%=user.getClave()==null?"":user.getClave()%>"/></td>
            </tr>
            <tr>
                <td><span>Privilegio</span></td>
                <td><input size="40" type="text" name="privilegio" value="<%=user.getPrivilegio()==0?"":user.getPrivilegio()%>"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="guardar" value="Guardar"/></td>
            </tr>
        </tbody>
    </table>
</form>
</div>
            <%}else{%>
   No tienes permiso para acceder <a href="../login.html">Volver a login</a>
   <%}%>
   <script type="text/javascript" src="../js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="../utilidades/js/paralax.js"></script>
        <script src="../utilidades/js/init.parallax.js"></script>
</body>
</html>