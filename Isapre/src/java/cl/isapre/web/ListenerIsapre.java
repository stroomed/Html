/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.isapre.web;

import cl.isapre.modelo.Afiliado;
import cl.isapre.modelo.Bonos;
import cl.isapre.modelo.Medico;
import cl.isapre.modelo.Prestacion;
import java.util.ArrayList;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Web application lifecycle listener.
 *
 * @author Fabricio
 */
@WebListener()
public class ListenerIsapre implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ArrayList<Afiliado> afiliado=new ArrayList<Afiliado>();
        afiliado.add(new Afiliado("1111","Roberto Andres","Toro Sambrano","Toro Sambrano Roberto Andres","Lago Llanquihue 123","10.001 Megasalud","2FMAUE4815","45","M","123"));
        afiliado.add(new Afiliado("2222","Claudia Ximena","Heinz Arriagada","Heinz Arriagada Claudia Ximena","Merino Benitez 285","10.002 Clinica Universitaria","3AAAUE2365","40","F","123"));
        afiliado.add(new Afiliado("3333","Vanesa Del Carmen","Muñoz Fuentes","Muñoz Fuentes Vanesa Del Carmen","San Felipe 123","10.003 Clinica Puerto Montt","4FGHSH2877","30","F","123"));
        afiliado.add(new Afiliado("0000","admin","admin","admin","admin","admin","admin","1","M","admin"));
        
        sce.getServletContext().setAttribute("afiliado", afiliado);
        
        ArrayList<Prestacion> prestacion=new ArrayList<Prestacion>();
        prestacion.add(new Prestacion(101814,"MEDICINA GENERAL ADULTO",13930,9751,4179));
        prestacion.add(new Prestacion(101830,"PEDIATRIA NIÑOS",12830,7751,5079));
        prestacion.add(new Prestacion(101970,"TRAUMATOLOGO ADULTO",22830,8751,14079));
        
        sce.getServletContext().setAttribute("prestacion", prestacion);
        
        ArrayList<Bonos> bono=new ArrayList<Bonos>();
        bono.add(new Bonos("1111",101814,"MEDICINA GENERAL ADULTO",13930,9751,4179));
        bono.add(new Bonos("1111",101830,"PEDIATRIA NIÑOS",12830,7751,5079));
        bono.add(new Bonos("2222",101970,"TRAUMATOLOGO ADULTO",22830,8751,14079));
        bono.add(new Bonos("2222",101814,"MEDICINA GENERAL ADULTO",13930,9751,4179));
        bono.add(new Bonos("2222",101830,"PEDIATRIA NIÑOS",12830,7751,5079));
        bono.add(new Bonos("3333",101814,"MEDICINA GENERAL ADULTO",13930,9751,4179));
        
        sce.getServletContext().setAttribute("bono", bono);
        
        ArrayList<Medico> medico=new ArrayList<Medico>();
        medico.add(new Medico("6666","Roberto Andres","Toro Sambrano","Toro Sambrano Roberto Andres","Lago Llanquihue 123","10.001 Megasalud","2FMAUE4815","45","M","123","Pediatra"));
        medico.add(new Medico("7777","Rudy","Book","David Soto","Los Perdidos 123","10.002 Consalud","5FMAUE4815","20","M","123","Neurologo"));
        
        sce.getServletContext().setAttribute("medico", medico);
        
        
        
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
