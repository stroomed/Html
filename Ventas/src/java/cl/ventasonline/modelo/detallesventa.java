/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ventasonline.modelo;

/**
 *
 * @author RAGNAR
 */
public class detallesventa {
    
    private int ventCodigo;
    private int detventaItem;
    private int prodCodigo;
    private int detventaCantidad;
    private double detventaSubtotal;

    public detallesventa(int ventCodigo, int detventaItem, int prodCodigo, int detventaCantidad, double detventaSubtotal) {
        this.ventCodigo = ventCodigo;
        this.detventaItem = detventaItem;
        this.prodCodigo = prodCodigo;
        this.detventaCantidad = detventaCantidad;
        this.detventaSubtotal = detventaSubtotal;
    }
    public detallesventa(){
    }

    public void setVentCodigo(int ventCodigo) {
        this.ventCodigo = ventCodigo;
    }

    public void setDetventaItem(int detventaItem) {
        this.detventaItem = detventaItem;
    }

    public void setProdCodigo(int prodCodigo) {
        this.prodCodigo = prodCodigo;
    }

    public void setDetventaCantidad(int detventaCantidad) {
        this.detventaCantidad = detventaCantidad;
    }

    public void setDetventaSubtotal(double detventaSubtotal) {
        this.detventaSubtotal = detventaSubtotal;
    }

    public int getVentCodigo() {
        return ventCodigo;
    }

    public int getDetventaItem() {
        return detventaItem;
    }

    public int getProdCodigo() {
        return prodCodigo;
    }

    public int getDetventaCantidad() {
        return detventaCantidad;
    }

    public double getDetventaSubtotal() {
        return detventaSubtotal;
    }
    
    
    
    
}
