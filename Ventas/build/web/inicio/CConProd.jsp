<%@page import="cl.ventasonline.modelo.Usuario"%>
<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 1 || usuarioInicio.getPrivilegio() == 2){
        String nombre = usuarioInicio.getNombre() + " " + usuarioInicio.getApellido();
 %>
<%@page import="java.util.Vector"%>
<%@page import="cl.ventasonline.modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Vector<Producto> productos=(Vector<Producto>)request.getSession().getAttribute("productos");%>
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
	 		<a href="CConProd.jsp" class="subNavBtn">Home</a>
	 		<a href="CConProd.jsp" class="subNavBtn">Consultar Producto</a> 
			<a href="../carrito/carrito.jsp" class="subNavBtn">Agregar al carrito [+]</a>
			<a href="../logout" class="subNavBtn">Salir</a>
                        <b class="subNavBtn"><%=nombre%></b>
		</div>
	</div>

	<div class="section s1">
		<div class="inner ">
                 <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr bgcolor="#FF530D">
                <td>Producto</td>
                <td>Stock</td>
                <td>Precio</td>
            </tr>
            </tr>
      <% for(int i=0; i<productos.size(); i++){%>
          <% if(i%2==0){ %>
                <tr bgcolor='#0977bc'>
                <td> <%= productos.get(i).getNombre()%> </td>
                <td align='right' valign='top'> <%=productos.get(i).getStock()%> </td>
                <td align='right' valign='top'> <%=productos.get(i).getPrecio()%> </td>
                </tr>
           <%}else{ %>
                <tr>
                <td>  <%= productos.get(i).getNombre() %> </td>
                <td align='right' valign='top'> <%=productos.get(i).getStock()%> </td>
                <td align='right' valign='top'> <%=productos.get(i).getPrecio()%> </td>
                </tr>
         <% } %>
       <%} %>
        </table>
		</div>
	</div>
    <div class="subMenu" >
	 	<div class="inner"></div>
	</div>

</body>
</html>

<%}else{
      response.sendRedirect("../restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect("../restriccion.html");
    session.invalidate();
}
%>