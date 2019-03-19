<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,cl.ventasonline.beans.*, cl.ventasonline.modelo.*"%>
<jsp:useBean id="ventas" class="cl.ventasonline.beans.VentaBean" scope="request"></jsp:useBean>

<% List<Ventas> listadoVentas = ventas.findAllVentas();%>
<% List<detallesventa> listadoDetalles = ventas.findAllDetalles();%>
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
	 		<a href="<%= request.getContextPath() %>/administrar/listado.jsp" class="subNavBtn">Productos</a> 
                        <a href="<%= request.getContextPath() %>/administrar/ventas/listado.jsp" class="subNavBtn">Ventas</a>
			<a href="<%= request.getContextPath() %>/administrar/ventas/listadod.jsp" class="subNavBtn">Detalles Venta</a>
			<a href="<%= request.getContextPath() %>/logout" class="subNavBtn">Salir</a>
		</div>
	</div>

	<div class="section s1">
		<div class="inner">
                    <div id="centrar">
                         <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                         <tr bgcolor="#FF530D">
                                     <th>#</th>
                                     <th>Fecha de Venta</th>
                                     <th>Codigo de Usuario</th>
                                     <th>Total</th>
                             </tr>
                             <% for(Ventas vent: listadoVentas){ %>
                                     <tr>

                                             <td align='right' valign='top'><%= vent.getVentCodigo() %></td>
                                             <td align='right' valign='top'><%= vent.getVentFecha() %></td>
                                             <td align='right' valign='top'><%= vent.getUserCodigo() %></td>
                                             <td align='right' valign='top'><%= vent.getVentTotalpagar() %></td>
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
      response.sendRedirect(request.getContextPath() + "/restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect(request.getContextPath() + "/restriccion.html");
    session.invalidate();
}
%>
        
        
        