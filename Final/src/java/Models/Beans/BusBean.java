
package Models.Beans;

import Models.Dao.BusDao;
import Models.entity.Bus;
import java.util.List;

public class BusBean extends Bus{
    
    private BusDao bD = new BusDao();
    
    public List<Bus> findAll(){
        return bD.findAll();
    }
    
    public Bus findById() {
        Bus b = null;
        if (codigoB > 0) {
            b = bD.findById(codigoB);
        } else {
            b = new Bus();
        }
        return b;
    }

    public void save() {
        bD.save(this);
    }

    public void delete() {
        bD.delete(this);
    }
    
}
