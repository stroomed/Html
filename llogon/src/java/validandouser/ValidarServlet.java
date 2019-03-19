/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package validandouser;

import cl.tienda.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 11714291-4
 */
@WebServlet(name = "ValidarServlet", urlPatterns = {"/validar.do"})
public class ValidarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rut=request.getParameter("txtrut");
        String cla=request.getParameter("txtpass");
        
        ArrayList <User> lista=(ArrayList) getServletContext().getAttribute("listauser");
        User user=null;
        for(User u:lista){
        if(rut.equals(u.getRut()) && cla.equals(u.getClave())){
          user=u;
        }
        }
        if(user!=null){
        // creacion de cokie para indicar el index rut que inicio session
        Cookie cookie=new Cookie("rut",rut);
        cookie.setMaxAge(60*10);// duracion de la cookie 10 minutos
        cookie.setPath("/"); // indica donde quedara guardada la cookie
        response.addCookie(cookie);
        // crear session y redireccionar hacia menu.jsp
        request.getSession().setAttribute("user", user);
        response.sendRedirect("menu.jsp");
        }else{
        // redireccionar error hacia index.jsp
            request.setAttribute("error","<h5><center>Datos Incorrectos</center></h5>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
