<%@page import="cl.ventasonline.modelo.Usuario"%>
<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 1 || usuarioInicio.getPrivilegio() == 2){
        String nombre = usuarioInicio.getNombre() + " " + usuarioInicio.getApellido();
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="cl.ventasonline.modelo.Producto"%>
<% Vector<Producto> productos=(Vector<Producto>)request.getSession().getAttribute("productos");%>
<% int indice = Integer.parseInt(request.getParameter("indice")); %>
<% Producto prod = productos.get(indice);%>
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
	 		<a href="../inicio/CConProd.jsp" class="subNavBtn">Home</a>
	 		<a href="../inicio/CConProd.jsp" class="subNavBtn">Consultar Producto</a> 
			<a href="../carrito/carrito.jsp" class="subNavBtn">Agregar al carrito [+]</a>
			<a href="../logout" class="subNavBtn">Salir</a>
                        <b class="subNavBtn"><%=nombre%></b>
		</div>
	</div>

	<div class="section s1">
		<div class="inner">
                    <div id="centrar">
                    <form name="frmPrincipal" method="post" action="../showcarrito">
                        <table width="100%">
                        <tr>
                            <td width="17%">Codigo</td>
                            <td width="83%"><label>
                            <input type="text" name="txtIndice" id="txtIndice" readonly="readonly" value=" <%= indice %> "/>
                            </label></td>
                        </tr>
                        <tr>
                            <td>Producto</td>
                            <td><label>
                                    <input type="text" name="txtProducto" id="txtProducto" readonly="readonly" value=" <%=prod.getNombre()%> " />
                            </label></td>
                        </tr>
                        <tr>
                            <td>Stock</td>
                            <td><input type="text" name="txtStock" id="txtStock" readonly="readonly" value="<%= prod.getStock()%>" /></td>
                        </tr>
                        <tr>
                            <td>Cantidad Pedir</td>
                            <td><input name="txtCantidad" type="text" id="txtCantidad" value="1"  /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><label>
                            <input type="submit" name="button" id="button" value="Solicitar" />
                            </label></td>
                        </tr>
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
<%}else{
      response.sendRedirect("../restriccion.html");
    }
}catch(NullPointerException e){
    response.sendRedirect("../login.html");
    session.invalidate();
}
%>