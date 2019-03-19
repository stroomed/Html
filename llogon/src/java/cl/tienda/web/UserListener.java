
package cl.tienda.web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import cl.tienda.model.Producto;
import cl.tienda.model.User;
import java.util.ArrayList;
/**
 * Web application lifecycle listener.
 *
 * @author 11714291-4
 */
@WebListener()
public class UserListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

    ArrayList<User> lista=new ArrayList<User>();
    lista.add(new User("111-1","Camilo","Rojas Rojas","123"));
    lista.add(new User("222-2","Claudia","Heinz Arriagada","456"));
    lista.add(new User("333-3","Eugenia","Haeger Lard","789"));
    sce.getServletContext().setAttribute("listauser",lista);
    
    ArrayList<Producto> listaproductos=new ArrayList<Producto>();
    listaproductos.add(new Producto(1,"Coca Cola",500,5));
    listaproductos.add(new Producto(2,"Fanta",600,10));
    listaproductos.add(new Producto(3,"Sprite",700,2));
    
    sce.getServletContext().setAttribute("listaproductos", listaproductos);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
