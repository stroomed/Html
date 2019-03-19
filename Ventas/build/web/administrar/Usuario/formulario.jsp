<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cl.ventasonline.beans.*, cl.ventasonline.modelo.*"%>

<jsp:useBean id="usuario" class="cl.ventasonline.beans.UsuarioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="usuario" />

<% Usuario user = usuario.findById();%>

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
                        <a href="<%= request.getContextPath() %>/administrar/Usuario/formulario.jsp" class="subNavBtn">Agregar Usuario [+]</a>
			<a href="<%= request.getContextPath() %>/logout" class="subNavBtn">Salir</a>
		</div>
	</div>

	<div class="section s1">
		<div class="inner">
                    <div id="centrar">
                        <form method="post" action="<%= application.getContextPath() %>/administrar/Usuario/guardar.jsp">
    <input type="hidden" name="codigo" value="<%=user.getCodigo()%>"/>
    <table border="1">
        <tbody>
            <tr>
                <td><span>Nombre</span></td>
                <td><input size="40" type="text" name="nombre" value="<%=user.getNombre()==null?"":user.getNombre()%>"/></td>
            </tr>
            <tr>
                <td><span>Apellido</span></td>
                <td><input type="text" name="apellido" value="<%=user.getApellido()==null?"":user.getApellido()%>"/></td>
            </tr>
            <tr>
                <td><span>Usuario</span></td>
                <td><input type="text" name="usuario" value="<%=user.getUsuario()==null?"":user.getUsuario()%>"/></td>
            </tr>
            <tr>
                <td><span>Clave</span></td>
                <td><input type="password"  name="clave" value="<%=user.getClave()==null?"":user.getClave()%>"/></td>
            </tr>
            <tr>
                <td><span>Privilegio</span></td>
                <td><input type="text" name="privilegio" value="<%=user.getPrivilegio()==0?"":user.getPrivilegio()%>"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="guardar" value="Guardar"/></td>
            </tr>
        </tbody>
    </table>
</form>
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
      response.sendRedirect(request.getContextPath() + "/restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect(request.getContextPath() + "/restriccion.html");
    session.invalidate();
}
%>