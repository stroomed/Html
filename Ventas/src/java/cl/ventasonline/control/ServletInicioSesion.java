/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ventasonline.control;

import cl.ventasonline.modelo.Producto;
import cl.ventasonline.modelo.Usuario;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author academico */

@SuppressWarnings("UseOfObsoleteCollectionType")
public class ServletInicioSesion extends HttpServlet {

    private Vector<Producto> productos;
    private Vector<Usuario> usuarios;   
    public void inicializarUsuarios() {
        //Creando el vector de usuarios
        Usuario u = new Usuario();
        usuarios = new Vector<Usuario>();
        usuarios = u.getUsuarios();
    
    }

    //Metodo que va a crear productos y lo va adicionar al vector de productos
    public void inicializarProductos() {
        //Creando el vector de usuarios
        Producto p = new Producto();
        productos = new Vector<Producto>();
        productos = p.getProductos();       
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        inicializarProductos();
        inicializarUsuarios();
        String usuario = request.getParameter("txtUsuario");
        String clave = request.getParameter("txtClave");
        String tiempo = request.getParameter("txtTiempo");
        
        int tm = Integer.parseInt(tiempo);
        String direccion="error.html";         
        HttpSession sesion = request.getSession();
        if (sesion.isNew()) {
            sesion = request.getSession(true);
            sesion.setAttribute("usuarios", usuarios);
            sesion.setAttribute("productos", productos);
        } else {
            usuarios = (Vector<Usuario>) sesion.getAttribute("usuarios");
            productos = (Vector<Producto>) sesion.getAttribute("productos");
        }


        for (int i = 0; i < usuarios.size(); i++) {
            if ((usuarios.get(i).getUsuario().compareTo(usuario) == 0) &&
                    (usuarios.get(i).getClave().compareTo(clave) == 0)) {
                sesion.setAttribute("usuarioInicio", usuarios.get(i));
                sesion.setMaxInactiveInterval(tm);
                //Ir a la pagina segun el privilegio
                if (usuarios.get(i).getPrivilegio() == 1) {
                    //Ir a la pagina de Cliente
                    direccion="inicio/CConProd.jsp";
                } else {
                    //Ir a la pagina de Empleado
                    direccion="inicio/EConProd.jsp";
                }
                break;
            }
        }

         response.sendRedirect(direccion);


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
