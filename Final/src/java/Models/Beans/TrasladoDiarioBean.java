package Models.Beans;

import Models.Dao.ChoferDao;
import Models.Dao.MensualidadDao;
import Models.Dao.TrasladoDiarioDao;
import Models.entity.Chofer;
import Models.entity.Mensualidad;
import Models.entity.TrasladoDiario;
import java.util.List;


public class TrasladoDiarioBean extends TrasladoDiario {

    private TrasladoDiarioDao trasladoDiarioDao = new TrasladoDiarioDao();

    public List<TrasladoDiario> findAll() {
        return trasladoDiarioDao.findAll();
    }

    public TrasladoDiario findById() {
        TrasladoDiario trasladoDiario = null;
        if (codigo_tra > 0) {
            trasladoDiario = trasladoDiarioDao.findById(codigo_tra);
        } else {
            trasladoDiario = new TrasladoDiario();
        }
        return trasladoDiario;
    }

    public void save() {
        trasladoDiarioDao.save(this);
    }

    public void delete() {
        trasladoDiarioDao.delete(this);
    }
}
