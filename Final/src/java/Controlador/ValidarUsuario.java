
package Controlador;

import Models.Beans.ChoferBean;
import Models.Beans.ColegioBean;
import Models.Beans.UsuarioBean;
import Models.entity.Chofer;
import Models.entity.Colegio;
import Models.entity.Usuarios;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ValidaUsuarioServlet", urlPatterns = {"/validarusuario.do"})
public class ValidarUsuario extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            UsuarioBean  usuario =new UsuarioBean();
        List<Usuarios> lista = usuario.findAll();
        
        String usuarios=request.getParameter("txtrut");
        String pass=request.getParameter("txtpass");
        String direccion="error.html";
        
        HttpSession sesion = request.getSession();
        if (sesion.isNew()) {
            sesion = request.getSession(true);
            sesion.setAttribute("usuarios", lista);
            //sesion.setAttribute("productos", productos);
        } else {
            //lista = (List<Usuarios>) sesion.getAttribute("usuarios");
            //productos = (ArrayList<Producto>) sesion.getAttribute("productos");
        }

        for (int i = 0; i < lista.size(); i++) {
            if ((lista.get(i).getUsuario().compareTo(usuarios) == 0) &&
                    (lista.get(i).getClave().compareTo(pass) == 0)) {
                sesion.setAttribute("usuarioInicio", lista.get(i));
                //Ir a la pagina segun el privilegio
                if (lista.get(i).getPrivilegio() == 1 ) {
                    //Ir a la pagina de Cliente
                    direccion="menu.jsp";
                } else {
                    //Ir a la pagina de Empleado
                    direccion="catalogo/ServletCConProd.jsp";
                }
                break;
            }
        }

         response.sendRedirect(direccion);
           
        
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
