package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cl.isapre.modelo.Afiliado;
import java.util.ArrayList;

public final class ListaAfiliados_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

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

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Lista de afiliados</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

                try{
            Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
            if(afiliado.getPrivilegio().equals("admin")){
      out.write("\n");
      out.write("                <form action=\"ListaAfiliados.jsp\" method=\"POST\">\n");
      out.write("                    <table>\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Rut:</th>\n");
      out.write("                                <th><input type=\"text\" name=\"txtrut\" value=\"\" /></th>\n");
      out.write("                                <th>Si desea modificar o eliminar, agregue el Rut del Afiliado para poder hacerlo</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Nombres:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtnombres\" value=\"\" /></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Apellidos:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtapellidos\" value=\"\" /></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Beneficiario:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtbeneficiario\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Direccion:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtdireccion\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Convenio:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtconvenio\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Plan:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtplan\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Edad:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtedad\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Genero:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtgenero\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            <tr>\n");
      out.write("                                <th>Clave:</th>\n");
      out.write("                                <td><input type=\"text\" name=\"txtclave\" value=\"\" /></td>\n");
      out.write("                            </tr> \n");
      out.write("                            \n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                    <input type=\"submit\" value=\"agregar\" name=\"enviar\" />\n");
      out.write("                    <input type=\"submit\" value=\"modificar\" name=\"enviar\" />\n");
      out.write("                    <input type=\"submit\" value=\"eliminar\" name=\"enviar\" /><br>\n");
      out.write("                </form> \n");
      out.write("            ");
}
      out.write("    \n");
      out.write("            \n");
      out.write("             \n");
      out.write("            ");
}catch(Exception e){}
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <table width=\"800\" border=\"1\" align=\"center\">\n");
      out.write("           \n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Rut</th>\n");
      out.write("                    <th>Nombres</th>\n");
      out.write("                    <th>Apellidos</th>\n");
      out.write("                    <th>Beneficiario</th>\n");
      out.write("                    <th>Direccion</th>\n");
      out.write("                    <th>Convenio</th>\n");
      out.write("                    <th>Plan</th>\n");
      out.write("                    <th>Edad</th>\n");
      out.write("                    <th>Genero</th>\n");
      out.write("                    <th>Privilegio</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
for(Afiliado a:afiliados){
      out.write(" \n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(a.getRut());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getNombres());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getApellidos());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getBeneficiario());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getDireccion());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getConvenio());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getPlan());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getEdad());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getGenero());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getPrivilegio());
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("        </table>\n");
      out.write("        ");
try{
                    
                    Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
                    if(afiliado.getPrivilegio().equals("admin")){
      out.write("\n");
      out.write("                        <h4 align=\"center\"><a href=\"administrador/adminMenu.jsp\">Volver al menu</a></h4>  \n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                        <h4 align=\"center\"><a href=\"menu.jsp\">Volver al menu</a></h4>  \n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                ");
}catch(Exception e){

                }
      out.write(" \n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
