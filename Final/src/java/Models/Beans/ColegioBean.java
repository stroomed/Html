package Models.Beans;

import Models.Dao.ColegioDao;
import Models.entity.Colegio;
import java.util.List;


public class ColegioBean extends Colegio {

    private ColegioDao colegioDao = new ColegioDao();

    public List<Colegio> findAll() {
        return colegioDao.findAll();
    }

    public Colegio findById() {
        Colegio colegio = null;
        if (codigoC > 0) {
            colegio = colegioDao.findById(codigoC);
        } else {
            colegio = new Colegio();
        }
        return colegio;
    }

    public void save() {
        colegioDao.save(this);
    }

    public void delete() {
        colegioDao.delete(this);
    }
}
