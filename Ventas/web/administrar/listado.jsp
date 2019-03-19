<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,cl.ventasonline.beans.*, cl.ventasonline.modelo.*"%>
<jsp:useBean id="producto" class="cl.ventasonline.beans.ProductoBean" scope="request"></jsp:useBean>

<% List<Producto> listadoProductos = producto.findAll();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sistema de ventas online</title>
<meta name="viewport" content="width=device-width">

<link href="../content/css/demo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="top"></div>
	<div class="subMenu" >
	 	<div class="inner">
	 		<a href="../inicio/EConProd.jsp" class="subNavBtn">Home</a>
	 		<a href="../administrar/listado.jsp" class="subNavBtn">Productos</a> 
                        <a href="../administrar/ventas/listado.jsp" class="subNavBtn">Ventas</a>
                        <a href="../administrar/Usuario/listado.jsp" class="subNavBtn">Usuarios</a>
			<a href="../administrar/formulario.jsp" class="subNavBtn">Agregar un producto [+]</a>
			<a href="../logout" class="subNavBtn">Salir</a>
		</div>
	</div>

	<div class="section s1">
		<div class="inner">
                    <div id="centrar">
                           <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr bgcolor="#FF530D">
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                        </tr>
                        <% for(Producto prod : listadoProductos){ %>
                                <tr>
                                        <td align='left' valign='top'><%= prod.getCodigo() %></td>
                                        <td align='left' valign='top'><%= prod.getNombre() %></td>
                                        <td align='left' valign='top'><%= prod.getPrecio() %></td>
                                        <td align='left' valign='top'><%= prod.getStock() %></td>
                                        <td align='right' valign='top'><a href="<%= request.getContextPath() %>/administrar/formulario.jsp?codigo=<%= prod.getCodigo()%>">
                                                <b>Editar</b></a></td>
                                        <td align='right' valign='top'><a onclick="return confirm('Esta seguro?');" href="<%= request.getContextPath() %>/administrar/eliminar.jsp?codigo=<%= prod.getCodigo()%>">
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
      response.sendRedirect("../inicio/CConProd.jsp");
}else{
      response.sendRedirect("../restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect("../restriccion.html");
    session.invalidate();
}
%>