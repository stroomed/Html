
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="colegio" class="Models.Beans.ColegioBean" scope="request"></jsp:useBean>

<jsp:setProperty property="*" name="colegio" />
<%
    colegio.save();
    response.sendRedirect(request.getContextPath() + "/CRUDColegio/listadoColegio.jsp");
%>
