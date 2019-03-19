<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="usuario" class="Models.Beans.UsuarioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="usuario" />
<%
usuario.delete();

response.sendRedirect(request.getContextPath() + "/catalogoU/listado.jsp");
%>
