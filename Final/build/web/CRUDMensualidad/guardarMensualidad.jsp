<%@page import="Models.Beans.MensualidadBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="mensualidad" class="Models.Beans.MensualidadBean" scope="request"></jsp:useBean>

<jsp:setProperty property="*" name="mensualidad" />
<%
    mensualidad.save();
    response.sendRedirect(request.getContextPath() + "/CRUDMensualidad/listadoMensualidad.jsp");
%>
