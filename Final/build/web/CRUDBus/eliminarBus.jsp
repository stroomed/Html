
<%@page import="Models.Beans.BusBean" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="bus" class="Models.Beans.BusBean" scope="request"></jsp:useBean>

<jsp:setProperty property="codigoB" name="bus" />
<%
    bus.delete();
    response.sendRedirect(request.getContextPath() + "/CRUDBus/listadoBus.jsp");
%>