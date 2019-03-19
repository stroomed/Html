<%@page import="cl.ventasonline.modelo.Usuario"%>
<% try{
    HttpSession sesion=request.getSession();
    Usuario usuarioInicio =(Usuario)sesion.getAttribute("usuarioInicio");
    if(usuarioInicio.getPrivilegio() == 2){
 %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="usuario" class="cl.ventasonline.beans.UsuarioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="*" name="usuario" />
<%
usuario.save();
response.sendRedirect(request.getContextPath() + "/administrar/Usuario/listado.jsp");
%>
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