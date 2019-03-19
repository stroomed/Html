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
public class Ventas {
    private int ventCodigo;
    private String ventFecha;
    private int userCodigo;
    private double ventTotalpagar;

    public int getVentCodigo() {
        return ventCodigo;
    }

    public void setVentCodigo(int ventCodigo) {
        this.ventCodigo = ventCodigo;
    }

    public String getVentFecha() {
        return ventFecha;
    }

    public void setVentFecha(String ventFecha) {
        this.ventFecha = ventFecha;
    }

    public int getUserCodigo() {
        return userCodigo;
    }

    public void setUserCodigo(int userCodigo) {
        this.userCodigo = userCodigo;
    }

    public double getVentTotalpagar() {
        return ventTotalpagar;
    }

    public void setVentTotalpagar(double ventTotalpagar) {
        this.ventTotalpagar = ventTotalpagar;
    }
    
    
    
}
