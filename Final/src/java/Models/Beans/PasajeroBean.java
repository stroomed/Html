
package Models.Beans;

import Models.Dao.PasajeroDao;
import Models.entity.Pasajero;
import java.util.List;

public class PasajeroBean extends Pasajero {
    
    private PasajeroDao pD = new PasajeroDao();
    
    public List<Pasajero> findAll(){
        return pD.findAll();
    }
    
    public Pasajero findById(){
        Pasajero p = null;
        if (codigoP > 0){
            p = pD.findById(codigoP);
        } else {
            p = new Pasajero();
        }
        return p;
    }
    
    public void save(){
        pD.save(this);
    }
    
    public void delete(){
        pD.delete(this);
    }
}
