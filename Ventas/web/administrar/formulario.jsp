<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cl.ventasonline.beans.*, cl.ventasonline.modelo.*"%>

<jsp:useBean id="producto" class="cl.ventasonline.beans.ProductoBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="producto" />

<% Producto prod = producto.findById();%>

<!DOCTYPE html>
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
                        <form method="post" action="<%= application.getContextPath() %>/administrar/guardar.jsp">
    <input type="hidden" name="codigo" value="<%=prod.getCodigo()%>"/>
    <table border="1">
        <tbody>
            <tr>
                <td><span>Nombre</span></td>
                <td><input size="40" type="text" name="nombre" value="<%=prod.getNombre()==null?"":prod.getNombre()%>"/></td>
            </tr>
            <tr>
                <td><span>Cantidad</span></td>
                <td><input type="text" name="stock" value="<%=prod.getStock()==0?"":prod.getStock()%>"/></td>
            </tr>
            <tr>
                <td><span>Precio</span></td>
                <td><input type="text" name="precio" value="<%=prod.getPrecio()==0?"":prod.getPrecio()%>"/></td>
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
      response.sendRedirect("../inicio/CConProd.jsp");
}else{
      response.sendRedirect("/restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect("../restriccion.html");
    session.invalidate();
}
%>