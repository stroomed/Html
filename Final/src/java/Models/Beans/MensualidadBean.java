package Models.Beans;

import Models.Dao.ChoferDao;
import Models.Dao.MensualidadDao;
import Models.entity.Chofer;
import Models.entity.Mensualidad;
import java.util.List;


public class MensualidadBean extends Mensualidad {

    private MensualidadDao mensualidadDao = new MensualidadDao();

    public List<Mensualidad> findAll() {
        return mensualidadDao.findAll();
    }

    public Mensualidad findById() {
        Mensualidad mensualidad = null;
        if (codigo_men > 0) {
            mensualidad = mensualidadDao.findById(codigo_men);
        } else {
            mensualidad = new Mensualidad();
        }
        return mensualidad;
    }

    public void save() {
        mensualidadDao.save(this);
    }

    public void delete() {
        mensualidadDao.delete(this);
    }
}
