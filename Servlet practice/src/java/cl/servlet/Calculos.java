package cl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Calculos", urlPatterns = {"/calculos.do"})
public class Calculos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                
                int nu1 = Integer.parseInt(request.getParameter("valor 1"));
                int nu2 = Integer.parseInt(request.getParameter("valor 2"));
                int suma = nu1 + nu2;
                
                out.println("<!DOCTYPE html>");
                
                out.println("<html>");
                
                out.println("<head>");
                out.println("<title> Servlet Calculos </title>");            
                out.println("</head>");
                
                out.println("<body>");
                out.println("<br>");
                out.println("<h1> Valor 1 " + nu1 + " + Valor 2 " + nu2 + " = " + suma + " </h1>"); 
                out.println("<br>");
                out.println("</body>");
                
                out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
