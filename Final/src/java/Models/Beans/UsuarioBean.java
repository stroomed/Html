package Models.Beans;

import java.util.List;

import Models.Dao.UsuarioDao;

import Models.entity.Usuarios;

public class UsuarioBean extends Usuarios {

    private UsuarioDao usuarioDao = new UsuarioDao();

    public List<Usuarios> findAll() {
        return usuarioDao.findAll();
    }

    public Usuarios findById() {
        Usuarios usuario = null;
        if (codigo > 0) {
            usuario = usuarioDao.findById(codigo);
        } else {
            usuario = new Usuarios();
        }
        return usuario;
    }

    public void save() {
        usuarioDao.save(this);
    }

    public void delete() {
        usuarioDao.delete(this);
    }
}
