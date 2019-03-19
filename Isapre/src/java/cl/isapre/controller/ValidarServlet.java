/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.isapre.controller;


import cl.isapre.modelo.Afiliado;
import cl.isapre.modelo.Bonos;
import cl.isapre.modelo.Medico;
import cl.isapre.modelo.Prestacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        ArrayList<Afiliado> afiliado=(ArrayList<Afiliado>) getServletContext().getAttribute("afiliado");
        ArrayList<Medico> medico=(ArrayList<Medico>) getServletContext().getAttribute("medico");
        ArrayList<Prestacion> presentaciones=(ArrayList<Prestacion>) getServletContext().getAttribute("presentaciones");
        ArrayList<Bonos> bono=(ArrayList<Bonos>) getServletContext().getAttribute("bono");
        //capturamos el user y pass 
        String usuario=request.getParameter("txtrut");
        String pass=request.getParameter("txtpass");
        String direccion="error.jsp";
        
        HttpSession sesion = request.getSession();
        if (sesion.isNew()) {
            sesion = request.getSession(true);
            sesion.setAttribute("afiliado", afiliado);
            sesion.setAttribute("medico", medico);
            sesion.setAttribute("presentaciones", presentaciones);
            sesion.setAttribute("bono",bono );
        } else {
            afiliado = (ArrayList<Afiliado>) sesion.getAttribute("afiliado");
            medico = (ArrayList<Medico>) sesion.getAttribute("medico");
            presentaciones = (ArrayList<Prestacion>) sesion.getAttribute("presentaciones");
            bono = (ArrayList<Bonos>) sesion.getAttribute("bono");
            
        }

        for (int i = 0; i < afiliado.size(); i++) {
            if ((afiliado.get(i).getRut().compareTo(usuario) == 0) &&
                    (afiliado.get(i).getClave().compareTo(pass) == 0)) {
                sesion.setAttribute("usuarioInicio", afiliado.get(i));
                //Ir a la pagina segun el privilegio
                if (afiliado.get(i).getPrivilegio().compareTo("paciente") == 0) {
                    //Ir a la pagina de Afiliado
                    direccion="menu.jsp";
                } else  {
                    
                    //Ir a la pag de Admin
                    direccion="administrador/adminMenu.jsp";
                    
                }
                break;
            }
        }
      

        response.sendRedirect(direccion);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // buscamos los usuario
        
        // buscamos, comparamos y validamos el usuario
        
//        for(User u:lista){
//            if(u.getUsuario().equals(usuario)&& u.getClave().equals(pass)){
//            user=u;
//            }
//        }
//        //asignar las credenciales 
//        if(user!=null){
//        Cookie cookie=new Cookie("rut",usuario);
//        cookie.setMaxAge(60*10);// duracion 10 minutos
//        cookie.setPath("/");// se almacenada la cookie en la raiz
//        response.addCookie(cookie);
//        // creamos la session
//        request.getSession().setAttribute("user", user);
//        response.sendRedirect("menu.jsp");
//        }else{
//        request.setAttribute("error","Usuario y/o pass no valido");
//        response.sendRedirect("login.jsp");
//        }
        
        
        
        
        
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
