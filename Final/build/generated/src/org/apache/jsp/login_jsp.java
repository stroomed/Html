package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("<!-- Materialize -->\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"utilidades/css/parallax.min.css\"  media=\"screen,projection\"/>\n");
      out.write("<!-- CSS -->\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"utilidades/css/style.css\" media=\"screen,projection\">\n");
      out.write("<!-- Optimizado para moviles -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n");
      out.write("<!-- Charset -->        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<!-- Titulo --> \n");
      out.write("        <title> Ingreso a plataforma </title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <nav class=\"green\" role=\"navigation\">\n");
      out.write("            <div class=\"nav-wrapper container\">\n");
      out.write("                <a href=\"#\" class=\"brand-logo\"> Ingreso al sistema </a>\n");
      out.write("            </div>\n");
      out.write("        </nav> \n");
      out.write("        <br>\n");
      out.write("        <div id=\"index-banner\" class=\"container\">\n");
      out.write("            <div class=\"section no-pad-bot\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <br>\n");
      out.write("                    <br>\n");
      out.write("                    <form name=\"ingreso\" action=\"validarusuario.do\" method=\"POST\">\n");
      out.write("<!-- Ingreso de personal -->\n");
      out.write("                        <h2 class=\"header center teal-text text-lighten-2\">Ingreso de Personal</h2>\n");
      out.write("                        <div class=\"row center\">\n");
      out.write("<!-- Ingreso de Nick -->\n");
      out.write("                            <h5 class=\"header col s12 blue-grey-text darken-4\">Ingrese su Nick</h5>   \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row center\">\n");
      out.write("                            <input type=\"text\" name=\"txtrut\" id=\"txtrut\" value=\"\" size=\"40\" maxlength=\"20\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row center\">\n");
      out.write("<!-- Ingreso de clave -->\n");
      out.write("                            <h5 class=\"header col s12 blue-grey-text darken-4\">Ingrese su Clave</h5>  \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row center\">\n");
      out.write("                            <input type=\"password\" name=\"txtpass\" id=\"txtpass\" value=\"\" size=\"40\" maxlength=\"20\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row center\">\n");
      out.write("<!-- Bonton de ingreso -->         \n");
      out.write("                            <input type=\"submit\" value=\"Ingresar\" class=\"btn-large waves-effect waves-light deep-orange darken-4\"/>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                    <br>\n");
      out.write("                    <br>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <footer class=\"page-footer teal lighten-2\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col 16 s12\">\n");
      out.write("                            <h5 class=\"black-text\">¿Quiénes somos?</h5>\n");
      out.write("                            <p class=\"grey-text text-darken-4\">Estudiantes del ramo \"Programación de componentes web\" que buscan realizar un buen proyecto final.</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footer-copyright\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <a class=\"brown-text lighten-2\">Hecho gracias a </a><a class=\"grey-text text-darken-4\" href=\"http://materializecss.com\">Materialize</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("        </div>               \n");
      out.write("        <script type=\"text/javascript\" src=\"js/parallax.min.js\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write("        <script src=\"utilidades/js/paralax.js\"></script>\n");
      out.write("        <script src=\"utilidades/js/init.parallax.js\"></script>        \n");
      out.write("    </body>    \n");
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
