<%@page import="Models.entity.Usuarios"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@page import="java.util.List,Models.Beans.*, Models.entity.*"%>

<jsp:useBean id="usuario" class="Models.Beans.UsuarioBean" scope="request"></jsp:useBean>

<% List<Usuarios> listadoUsuario = usuario.findAll();%>
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
        <title> Listado de Usuarios </title>
    </head>
<body>
    <%
    Usuarios u=(Usuarios) session.getAttribute("usuarioInicio");
  %>
 
  <% if(u!=null){%>
    <nav class="grey lighten-1" role="navigation">
      <a href="#" class="brand-logo">
          <h6>Bienvenido/a:<%=u.getNombre()%> <%=u.getApellido()%></h6>
      </a>
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
    
  </nav>
   
<center><h3>Listado de Usuarios</h3></center>
<p><a href="<%=request.getContextPath() %>/catalogoU/formulario.jsp">Agregar Usuario (+)</a></p>
<div class="container">
<table>
	<tr>
		<th>#</th>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>Usuario</th>
		<th>Clave</th>
                <th>Privilegio</th>
                <th>Modificar</th>
		<th>Eliminar</th>
	</tr>
	<% for(Usuarios p : listadoUsuario){ %>
		<tr>
			<td><%= p.getCodigo() %></td>
			<td><%= p.getNombre() %></td>
			<td><%= p.getApellido() %></td>
			<td><%= p.getUsuario() %></td>
                        <td><%= p.getClave() %></td>
                        <td><%= p.getPrivilegio() %></td>
			<td><a href="<%= request.getContextPath() %>/catalogoU/formulario.jsp?codigo=<%= p.getCodigo()%>">
			editar</a></td>
                        <td><a onclick="return confirm('Esta seguro?');" href="<%= request.getContextPath() %>/catalogoU/eliminar.jsp?codigo=<%= p.getCodigo()%>">
			eliminar</a></td>
		</tr>
	<%} %>
</table>
</div>
 <%}else{%>
   No tienes permiso para acceder <a href="../login.html">Volver a login</a>
   <%}%>
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
 <script type="text/javascript" src="../js/materialize.min.js"></script>

</body>
</html>