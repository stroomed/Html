<%-- 
    Document   : ListaAfiliados
    Created on : 20-05-2018, 15:21:57
    Author     : Fabricio
--%>

<%@page import="cl.isapre.modelo.Prestacion"%>
<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Prestacion> prestacion=(ArrayList<Prestacion>)request.getSession().getAttribute("prestacion");

String s="";
try{
        Prestacion selec =null;
        String IDselec="";
        try{
            IDselec=request.getParameter("txtrut");
        }catch(Exception e)
        {s+="Codigo no encontrado";}
            for (Prestacion u:prestacion){
                if (IDselec.equals(u.getCodigoPrestacion())) {
                    selec = u;
                }
            }
        s+=selec.toString();
        if (request.getParameter("enviar").equals("agregar")) {
                
        }else if (request.getParameter("enviar").equals("modificar")) {
            selec.setCodigoPrestacion(Integer.parseInt(request.getParameter("txtprestacion")));
            selec.setDescripcionPrestacion(request.getParameter("txtnombres"));
            selec.setValor(Integer.parseInt(request.getParameter("txtvalor")));
            selec.setBonificacionFinanciar(Integer.parseInt(request.getParameter("txtbonificacion")));
            selec.setCopagoBeneficiario(Integer.parseInt(request.getParameter("txtcopago")));
            
        }else if (request.getParameter("enviar").equals("eliminar")) {
            prestacion.remove(selec);
        }else{
            s+="Ja!";
        }
            
    }catch(Exception e){
        if (request.getParameter("txtrut")!=null) {
        
            Prestacion selec=new Prestacion(
            Integer.parseInt(request.getParameter("txtprestacion")),
            request.getParameter("txtnombres"),
            Integer.parseInt(request.getParameter("txtvalor")),
            Integer.parseInt(request.getParameter("txtbonificacion")),
            Integer.parseInt(request.getParameter("txtcopago"))
            );
            
            prestacion.add(selec);
        }
            
        
    }
    getServletContext().setAttribute("prestacion", prestacion);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Prestaciones</title>
    </head>
    <body>
        
        <%
                try{
            Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
            if(afiliado.getPrivilegio().equals("admin")){%>
                <form action="ListaPrestaciones.jsp" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th>Codigo de la prestacion:</th>
                                <th><input type="text" name="txtrut" value="" /></th>
                                <th>Si desea modificar o eliminar, agregue el codigo de la Prestacion para poder hacerlo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>Descripcion de la prestacion:</th>
                                <td><input type="text" name="txtnombres" value="" /></td>
                            </tr>
                            <tr>
                                <th>Valor de la prestacion:</th>
                                <td><input type="text" name="txtapellidos" value="" /></td>
                            </tr>
                            <tr>
                                <th>Bonificacion a financiar:</th>
                                <td><input type="text" name="txtbeneficiario" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Copago del beneficiado:</th>
                                <td><input type="text" name="txtdireccion" value="" /></td>
                            </tr> 
                            
                        </tbody>
                    </table>
                    <input type="submit" value="agregar" name="enviar" />
                    <input type="submit" value="modificar" name="enviar" />
                    <input type="submit" value="eliminar" name="enviar" /><br>
                </form> 
            <%}%>    
            
             
            <%}catch(Exception e){}%>
        
        
        <table width="800" border="1" align="center">
           
            <thead>
                <tr>
                    <th>Codigo de prestacion</th>
                    <th>Descripcion de prestacion</th>
                    <th>Valor de prestcion</th>
                    <th>Bonificacion a financiar</th>
                    <th>Copago del beneficiado</th>
                </tr>
            </thead>
            <tbody>
                <%for(Prestacion p:prestacion){%> 
                <tr>
                    <td><%=p.getCodigoPrestacion()%></td>
                    <td><%=p.getDescripcionPrestacion()%></td>
                    <td><%=p.getValor()%></td>
                    <td><%=p.getBonificacionFinanciar()%></td>
                    <td><%=p.getCopagoBeneficiario()%></td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <%try{
                    
                    Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
                    if(afiliado.getPrivilegio().equals("admin")){%>
                        <h4 align="center"><a href="administrador/adminMenu.jsp">Volver al menu</a></h4>  
                    <%}else{%>
                        <h4 align="center"><a href="menu.jsp">Volver al menu</a></h4>  
                    <%}%>
                <%}catch(Exception e){

                }%> 
    </body>
</html>
