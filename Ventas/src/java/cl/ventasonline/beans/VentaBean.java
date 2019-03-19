/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ventasonline.beans;

import cl.ventasonline.dao.VentaDao;
import cl.ventasonline.modelo.Usuario;
import cl.ventasonline.modelo.Ventas;
import cl.ventasonline.modelo.detallesventa;
import java.util.List;

/**
 *
 * @author RAGNAR
 */
public class VentaBean {
    private VentaDao ventaDao = new VentaDao();
    public List<Ventas> findAllVentas() {
        return ventaDao.findAllVentas();
    }
    public List<detallesventa> findAllDetalles() {
        return ventaDao.findAllDetalles();
    }
    
}
