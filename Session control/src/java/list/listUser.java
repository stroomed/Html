package list;

import cl.modelo.user;
import java.util.ArrayList;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener()
public class listUser implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
        ArrayList <user> lista = new ArrayList<>();
        
        lista.add(new user ("1111", "Pepe", "Toledo", "123"));
        lista.add(new user ("2222", "Juan", "Hernandez", "234"));
        lista.add(new user ("3333", "Roberto", "Gonzales", "345"));
        lista.add(new user ("4444", "Claudia", "Schmidt", "456"));
        lista.add(new user ("5555", "Samantha", "Alarcon", "567"));
        
        sce.getServletContext().setAttribute("listauser",lista);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
