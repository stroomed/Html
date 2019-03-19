
<%@page import="Models.Beans.PasajeroBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="pasajero" class="Models.Beans.PasajeroBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigoP" name="pasajero" />
<%
pasajero.delete();

response.sendRedirect(request.getContextPath() + "/CRUDPasajero/listadoPasajero.jsp");
%>