package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cl.isapre.modelo.Prestacion;
import cl.isapre.modelo.Bonos;
import cl.isapre.modelo.Afiliado;
import java.util.ArrayList;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
//ArrayList<Producto> productos=(ArrayList<Producto>)request.getSession().getAttribute("productos");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write(" <head>\n");
      out.write(" <!--Import Google Icon Font-->\n");
      out.write(" <link href=\"http://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write(" <!--Import materialize.css-->\n");
      out.write(" <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.min.css\"\n");
      out.write("media=\"screen,projection\"/>\n");
      out.write(" <!--Let browser know website is optimized for mobile-->\n");
      out.write(" <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write(" </head>\n");
      out.write(" <body>\n");
      out.write("  ");

    //User user=(User) session.getAttribute("user");
    Afiliado afiliado=(Afiliado) session.getAttribute("usuarioInicio");
  
      out.write("\n");
      out.write(" \n");
      out.write("<div class=\"container\">\n");
      out.write("  ");
 if(afiliado!=null){
      out.write("\n");
      out.write("    <nav>\n");
      out.write("    <div class=\"nav-wrapper orange lighten-2\">\n");
      out.write("      <a href=\"#\" class=\"brand-logo\">\n");
      out.write("          Bienvenido:");
      out.print(afiliado.getNombres());
      out.write(' ');
      out.print(afiliado.getApellidos());
      out.write(" al sistema\n");
      out.write("      </a>\n");
      out.write("      <ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">\n");
      out.write("       <li><a href=\"ServletCConProd.jsp\">Lista afiliados</a></li>\n");
      out.write("       <li><a href=\"carrio.jsp\">Presentaciones</a></li> \n");
      out.write("       <li><a href=\"carrito3.jsp\">Bonos comprados</a></li>\n");
      out.write("       <li><a href=\"CarroPrestaciones.jsp\">Comprar bono</a></li>\n");
      out.write("       <li><a href=\"cerrar.jsp\">Cerrar Sesion</a></li>\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </nav>\n");
      out.write("   ");
}else{
      out.write("\n");
      out.write("   No tienes permiso para acceder <a href=\"login.jsp\">Volver a login</a>\n");
      out.write("   ");
}
      out.write("\n");
      out.write("        \n");
      out.write("        <table border=\"1\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Rut</th>\n");
      out.write("                    <th>Nombres</th>\n");
      out.write("                    <th>Apellidos</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(afiliado.getRut());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(afiliado.getNombres());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(afiliado.getApellidos());
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("   \n");
      out.write("       <br><br>\n");
      out.write("       \n");
      out.write("       \n");
      out.write("       \n");
      out.write("       <hr>\n");
      out.write("     <table>\n");
      out.write("        <tr>\n");
      out.write("       <td><img src=\"image/CONTRATO1.jpg\" width=\"84\" height=\"77\"/></td>\n");
      out.write("       <td><h4>Comprar Prestaciones</h4></td>\n");
      out.write("       </tr>   \n");
      out.write("     </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("\n");
      out.write("  \n");
      out.write("         <table class=\"striped\">\n");
      out.write("      \n");
      out.write("             <tr>\n");
      out.write("                 <th>CODIGO DE PRESENTACION</th>\n");
      out.write("                 <th>DESCRIPCION DE PRESENTACION</th>\n");
      out.write("                 <th>VALOR</th>\n");
      out.write("                 <th>BONIFICACION A FIANACIAR</th>\n");
      out.write("                 <th>COPAGO DE BENEFICIARIO</th>\n");
      out.write("                 <th>AGREGAR</th>\n");
      out.write("             </tr>\n");
      out.write("  ");

       ArrayList<Prestacion> prestaciones=(ArrayList<Prestacion>)request.getSession().getAttribute("prestaciones");
      //ArrayList <Producto> productos=(ArrayList<Producto>)getServletContext().getAttribute("listaproducto");
        for(int i=0; i<prestaciones.size(); i++){
            if(i%2==0){ 
      out.write("\n");
      out.write("               <tr align=\"left\">\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getCodigoPresentacion());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getDescripcionPresentacion());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getValor());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getBonificacionFinanciar());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getCopagoBeneficiario());
      out.write("</td>\n");
      out.write("               <td><a class=\"large material-icons\" href=\"carrito2.jsp?indice=");
      out.print(i);
      out.write("\">add_shopping_cart</a></td>\n");
      out.write("               </tr>\n");
      out.write("           ");
 }else{
      out.write("\n");
      out.write("               <tr align=\"left\">   \n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getCodigoPresentacion());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getDescripcionPresentacion());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getValor());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getBonificacionFinanciar());
      out.write("</td>\n");
      out.write("               <td>");
      out.print(prestaciones.get(i).getCopagoBeneficiario());
      out.write("</td>\n");
      out.write("               <td><a class=\"large material-icons\" href=\"carrito2.jsp?indice=");
      out.print(i);
      out.write("\">add_shopping_cart</a></td>\n");
      out.write("               </tr>\n");
      out.write("      ");
      }
        }
      out.write("\n");
      out.write("\n");
      out.write("       </table>\n");
      out.write("</div>  \n");
      out.write("</div>  \n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("         <!-- Contenido-->\n");
      out.write(" <!--Import jQuery before materialize.js-->\n");
      out.write(" <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write(" <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\n");
      out.write(" <script type=\"text/javascript\">\n");
      out.write("     $(document).ready(function() {\n");
      out.write(" $('select').material_select();\n");
      out.write(" });\n");
      out.write("     \n");
      out.write(" </script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("       </body>\n");
      out.write("       </html>\n");
      out.write("\n");
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
