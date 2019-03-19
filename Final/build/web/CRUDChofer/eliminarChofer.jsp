
<%@page import="Models.Beans.ChoferBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="chofer" class="Models.Beans.ChoferBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigo" name="chofer" />
<%
    chofer.delete();
    response.sendRedirect(request.getContextPath() + "/CRUDChofer/listadoChofer.jsp");
%>
