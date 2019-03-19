
package cl.controller;

import cl.modelo.user;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "validar", urlPatterns = {"/validar.do"})
public class validar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                ArrayList<user> lista = (ArrayList<user>) getServletContext().getAttribute("listauser");
                
                String usuario = request.getParameter("txtrut");
                String pass = request.getParameter("txtpass");
                
                user user = null;
                
                for (user u:lista){                    
                    if (u.getRut().equals(usuario) && u.getClave().equals(pass) ){                        
                        user = u;
                    }                    
                }
                
                if (user != null){
                    Cookie cookie = new Cookie ("rut", usuario);
                    cookie.setMaxAge (60*10);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("menu.jsp");
                } else {
                    request.setAttribute("ERROR ", ", usuario y/o contraseña no son válidos");
                    response.sendRedirect("login.jsp");
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
    }// </editor-fold>

}
