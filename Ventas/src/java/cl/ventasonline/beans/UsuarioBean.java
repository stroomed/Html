
package cl.ventasonline.beans;

import cl.ventasonline.dao.UsuariosDao;
import cl.ventasonline.modelo.Usuario;
import java.util.List;

public class UsuarioBean extends Usuario {
    
    private UsuariosDao usuarioDao = new UsuariosDao();

    public List<Usuario> findAll() {
        return usuarioDao.findAll();
    }

    public Usuario findById() {
        Usuario usuario = null;
        if (Codigo > 0) {
            usuario = usuarioDao.findById(Codigo);
        } else {
            usuario= new Usuario();
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
