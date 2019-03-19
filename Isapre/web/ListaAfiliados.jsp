<%-- 
    Document   : ListaAfiliados
    Created on : 20-05-2018, 15:21:57
    Author     : Fabricio
--%>

<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Afiliado> afiliados=(ArrayList<Afiliado>)request.getSession().getAttribute("afiliado");
String m="";
try{
        Afiliado selec =null;
        String IDselec="";
        try{
            IDselec=request.getParameter("txtrut");
        }catch(Exception e)
        {m+="Rut no encontrado";}
            for (Afiliado u:afiliados){
                if (IDselec.equals(u.getRut())) {
                    selec = u;
                }
            }
        m+=selec.toString();
        if (request.getParameter("enviar").equals("agregar")) {
                
        }else if (request.getParameter("enviar").equals("modificar")) {
            selec.setRut(request.getParameter("txtrut"));
            selec.setNombres(request.getParameter("txtnombres"));
            selec.setApellidos(request.getParameter("txtapellidos"));
            selec.setBeneficiario(request.getParameter("txtbeneficiario"));
            selec.setDireccion(request.getParameter("txtdireccion"));
            selec.setConvenio(request.getParameter("txtconvenio"));
            selec.setPlan(request.getParameter("txtplan"));
            selec.setEdad(request.getParameter("txtedad"));
            selec.setGenero(request.getParameter("txtgenero"));
            selec.setClave(request.getParameter("txtclave"));
        }else if (request.getParameter("enviar").equals("eliminar")) {
            afiliados.remove(selec);
        }else{
            m+="Ja!";
        }
            
    }catch(Exception e){
        if (request.getParameter("txtrut")!=null) {
        
            Afiliado selec=new Afiliado(
            request.getParameter("txtrut"),
            request.getParameter("txtnombres"),
            request.getParameter("txtapellidos"),
            request.getParameter("txtbeneficiario"),
            request.getParameter("txtdireccion"),
            request.getParameter("txtconvenio"),
            request.getParameter("txtplan"),
            request.getParameter("txtedad"),
            request.getParameter("txtgenero"),
            request.getParameter("txtclave")
            );
            afiliados.add(selec);
        }
            
        
    }
    getServletContext().setAttribute("afiliados", afiliados);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de afiliados</title>
    </head>
    <body>
        <%
                try{
            Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
            if(afiliado.getPrivilegio().equals("admin")){%>
                <form action="ListaAfiliados.jsp" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th>Rut:</th>
                                <th><input type="text" name="txtrut" value="" /></th>
                                <th>Si desea modificar o eliminar, agregue el Rut del Afiliado para poder hacerlo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>Nombres:</th>
                                <td><input type="text" name="txtnombres" value="" /></td>
                            </tr>
                            <tr>
                                <th>Apellidos:</th>
                                <td><input type="text" name="txtapellidos" value="" /></td>
                            </tr>
                            <tr>
                                <th>Beneficiario:</th>
                                <td><input type="text" name="txtbeneficiario" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Direccion:</th>
                                <td><input type="text" name="txtdireccion" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Convenio:</th>
                                <td><input type="text" name="txtconvenio" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Plan:</th>
                                <td><input type="text" name="txtplan" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Edad:</th>
                                <td><input type="text" name="txtedad" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Genero:</th>
                                <td><input type="text" name="txtgenero" value="" /></td>
                            </tr> 
                            <tr>
                                <th>Clave:</th>
                                <td><input type="text" name="txtclave" value="" /></td>
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
                    <th>Rut</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Beneficiario</th>
                    <th>Direccion</th>
                    <th>Convenio</th>
                    <th>Plan</th>
                    <th>Edad</th>
                    <th>Genero</th>
                    <th>Privilegio</th>
                </tr>
            </thead>
            <tbody>
                <%for(Afiliado a:afiliados){%> 
                <tr>
                    <td><%=a.getRut()%></td>
                    <td><%=a.getNombres()%></td>
                    <td><%=a.getApellidos()%></td>
                    <td><%=a.getBeneficiario()%></td>
                    <td><%=a.getDireccion()%></td>
                    <td><%=a.getConvenio()%></td>
                    <td><%=a.getPlan()%></td>
                    <td><%=a.getEdad()%></td>
                    <td><%=a.getGenero()%></td>
                    <td><%=a.getPrivilegio()%></td>
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
