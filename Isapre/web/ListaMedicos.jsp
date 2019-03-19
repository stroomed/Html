<%-- 
    Document   : ListaAfiliados
    Created on : 20-05-2018, 15:21:57
    Author     : Fabricio
--%>

<%@page import="cl.isapre.modelo.Medico"%>
<%@page import="cl.isapre.modelo.Afiliado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Medico> medicos=(ArrayList<Medico>)request.getSession().getAttribute("medico");

String s="";
try{
        Medico selec =null;
        String IDselec="";
        try{
            IDselec=request.getParameter("txtrut");
        }catch(Exception e)
        {s+="Rut no encontrado";}
            for (Medico u:medicos){
                if (IDselec.equals(u.getRut())) {
                    selec = u;
                }
            }
        s+=selec.toString();
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
            medicos.remove(selec);
        }else{
            s+="Ja!";
        }
            
    }catch(Exception e){
        if (request.getParameter("txtrut")!=null) {
        
            Medico selec=new Medico(
            request.getParameter("txtrut"),
            request.getParameter("txtnombres"),
            request.getParameter("txtapellidos"),
            request.getParameter("txtbeneficiario"),
            request.getParameter("txtdireccion"),
            request.getParameter("txtconvenio"),
            request.getParameter("txtplan"),
            request.getParameter("txtedad"),
            request.getParameter("txtgenero"),
            request.getParameter("txtclave"),
            request.getParameter("txtespecialidad")
            );
            medicos.add(selec);
        }
            
        
    }
    getServletContext().setAttribute("medicos", medicos);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Doctores</title>
    </head>
    <body>
        
        <%
                try{
            Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
            if(afiliado.getPrivilegio().equals("admin")){%>
                <form action="ListaMedicos.jsp" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th>Rut:</th>
                                <th><input type="text" name="txtrut" value="" /></th>
                                <th>Si desea modificar o eliminar, agregue el Rut del Medico para poder hacerlo</th>
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
                            <tr>
                                <th>Especialidad:</th>
                                <td><input type="text" name="txtespecialidad" value="" /></td>
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
                    <th>Especialidad</th>
                    <th>Privilegio</th>
                </tr>
            </thead>
            <tbody>
                <%for(Medico m:medicos){%> 
                <tr>
                    <td><%=m.getRut()%></td>
                    <td><%=m.getNombres()%></td>
                    <td><%=m.getApellidos()%></td>
                    <td><%=m.getBeneficiario()%></td>
                    <td><%=m.getDireccion()%></td>
                    <td><%=m.getConvenio()%></td>
                    <td><%=m.getPlan()%></td>
                    <td><%=m.getEdad()%></td>
                    <td><%=m.getGenero()%></td>
                    <td><%=m.getEspecialidad()%></td>
                    <td><%=m.getPrivilegio()%></td>
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
