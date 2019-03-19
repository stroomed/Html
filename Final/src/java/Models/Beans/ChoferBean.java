package Models.Beans;

import Models.Dao.ChoferDao;
import Models.entity.Chofer;
import java.util.List;


public class ChoferBean extends Chofer {

    private ChoferDao choferDao = new ChoferDao();

    public List<Chofer> findAll() {
        return choferDao.findAll();
    }

    public Chofer findById() {
        Chofer chofer = null;
        if (codigo > 0) {
            chofer = choferDao.findById(codigo);
        } else {
            chofer = new Chofer();
        }
        return chofer;
    }

    public void save() {
        choferDao.save(this);
    }

    public void delete() {
        choferDao.delete(this);
    }
}
