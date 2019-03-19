package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cerrar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("        ");

//response.setHeader("Content-Type","text/html;charset=windows-1252");
//response.setHeader("Pragma", "no-cache");
//response.setHeader("Expires", "Mon,30 Jan 2017 00:00:01 GMT");
//response.setHeader("Cache-Control", "no-store");
//response.setHeader("Cache-Control", "must-revalidate");
//response.setHeader("Cache-Control", "no-cache");

//        HttpSession actual=request.getSession(true);
 //       String id=actual.getId();
//        String nombre=(String)actual.getAttribute("user");
//        
//        if(actual.isNew()){
//          response.sendRedirect("login.jsp");
//          return;
//        }
//        
//        if(actual==null){
//        response.sendRedirect("login.jsp");
//        }else {
//          if(actual.getAttribute("user")==null){
//            response.sendRedirect("login.jsp");
//          }
//        }

//response.setContentType("text/html");
//response.setHeader("Cache-Control", "no-cache");
//response.setHeader("Cache-Control", "no-store");
//response.setHeader("Expires", "0");
//response.setHeader("Pragma", "no-cache");            
                
//        request.getSession().removeAttribute("user");
        session.invalidate();
        response.sendRedirect("login.html");
        
      out.write("\n");
      out.write("        ");
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
