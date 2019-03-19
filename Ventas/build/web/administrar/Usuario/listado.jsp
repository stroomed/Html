<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,cl.ventasonline.beans.*, cl.ventasonline.modelo.*"%>
<jsp:useBean id="usuario" class="cl.ventasonline.beans.UsuarioBean" scope="request"></jsp:useBean>

<% List<Usuario> listadoUsuarios = usuario.findAll();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sistema de ventas online</title>
<meta name="viewport" content="width=device-width">

<link href="<%= request.getContextPath() %>/content/css/demo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="top"></div>
	<div class="subMenu" >
	 	<div class="inner">
	 		<a href="<%= request.getContextPath() %>/inicio/EConProd.jsp" class="subNavBtn">Home</a>
	 		<a href="<%= request.getContextPath() %>/administrar/Usuario/listado.jsp" class="subNavBtn">Usuarios</a>
			<a href="<%= request.getContextPath() %>/administrar/Usuario/formulario.jsp" class="subNavBtn">Agregar Usuario[+] </a>
			<a href="<%= request.getContextPath() %>/logout" class="subNavBtn">Salir</a>
		</div>
	</div>

	<div class="section s1">
		<div class="inner">
                    <div id="centrar">
                        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr bgcolor="#FF530D">
		<th>#</th>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>Usuario</th>
		<th>Clave</th>
		<th>Privilegio</th>
                <th>Editar</th>
                <th>Eliminar</th>
	</tr>
	<% for(Usuario user: listadoUsuarios){ %>
		<tr>
                    
			<td align='right' valign='top'><%= user.getCodigo() %></td>
			<td align='right' valign='top'><%= user.getNombre() %></td>
			<td align='right' valign='top'><%= user.getApellido() %></td>
			<td align='right' valign='top'><%= user.getUsuario() %></td>
                        <td align='right' valign='top'><%= user.getClave() %></td>
                        <td align='right' valign='top'><%= user.getPrivilegio() %></td>
			<td align='right' valign='top'><a href="<%= request.getContextPath() %>/administrar/Usuario/formulario.jsp?codigo=<%= user.getCodigo()%>">
                                <b>Editar</b></a></td>
                        <td align='right' valign='top'><a onclick="return confirm('Esta seguro?');" href="<%= request.getContextPath() %>/administrar/Usuario/eliminar.jsp?codigo=<%= user.getCodigo()%>">
                                <b>Eliminar</b></a></td>
		</tr>
	<%} %>
</table>                         
                    </div>
		</div>
	</div>
    <div class="subMenu" >
	 	<div class="inner"></div>
	</div>

</body>
</html>
<%}else if(usuarioInicio.getPrivilegio() == 1){
      response.sendRedirect(request.getContextPath() +"/inicio/CConProd.jsp");
}else{
      response.sendRedirect(request.getContextPath() +"/restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect(request.getContextPath() + "/restriccion.html");
    session.invalidate();
}
%>
