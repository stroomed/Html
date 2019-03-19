package cl.ventasonline.beans;

import java.util.List;
import cl.ventasonline.dao.ProductoDao;
import cl.ventasonline.modelo.Producto;

public class ProductoBean extends Producto {

    private ProductoDao productoDao = new ProductoDao();

    public List<Producto> findAll() {
        return productoDao.findAll();
    }

    public Producto findById() {
        Producto producto = null;
        if (codigo > 0) {
            producto = productoDao.findById(codigo);
        } else {
            producto = new Producto();
        }
        return producto;
    }

    public void save() {
        productoDao.save(this);
    }

    public void delete() {
        productoDao.delete(this);
    }
}
