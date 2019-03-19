
<%@page import="Models.Beans.TrasladoDiarioBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="trasladoDiario" class="Models.Beans.TrasladoDiarioBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="trasladoDiario" />
<%
    trasladoDiario.save();
    response.sendRedirect(request.getContextPath() + "/CRUDTrasladoDiario/listadoTraslado.jsp");
%>
