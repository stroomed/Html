/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.isapre.modelo;

/**
 *
 * @author Fabricio
 */
public class Bonos {
    private String rutPrestador;
    private int codigoPrestador;
    private String descripcionPrestacion;
    private int valor;
    private int BonificacionFinanciar;
    private int CopagoBeneficiario;

    public Bonos(String rutPrestador, int codigoPrestador, String descripcionPrestacion, int valor, int BonificacionFinanciar, int CopagoBeneficiario) {
        this.rutPrestador = rutPrestador;
        this.codigoPrestador = codigoPrestador;
        this.descripcionPrestacion = descripcionPrestacion;
        this.valor = valor;
        this.BonificacionFinanciar = BonificacionFinanciar;
        this.CopagoBeneficiario = CopagoBeneficiario;
    }

    public String getRutPrestador() {
        return rutPrestador;
    }

    public void setRutPrestador(String rutPrestador) {
        this.rutPrestador = rutPrestador;
    }

    public int getCodigoPrestador() {
        return codigoPrestador;
    }

    public void setCodigoPrestador(int codigoPrestador) {
        this.codigoPrestador = codigoPrestador;
    }

    public String getDescripcionPrestacion() {
        return descripcionPrestacion;
    }

    public void setDescripcionPrestacion(String descripcionPrestacion) {
        this.descripcionPrestacion = descripcionPrestacion;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public int getBonificacionFinanciar() {
        return BonificacionFinanciar;
    }

    public void setBonificacionFinanciar(int BonificacionFinanciar) {
        this.BonificacionFinanciar = BonificacionFinanciar;
    }

    public int getCopagoBeneficiario() {
        return CopagoBeneficiario;
    }

    public void setCopagoBeneficiario(int CopagoBeneficiario) {
        this.CopagoBeneficiario = CopagoBeneficiario;
    }

    
    
}
