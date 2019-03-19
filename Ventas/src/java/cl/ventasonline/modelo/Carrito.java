/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.ventasonline.modelo;

import cl.ventasonline.modelo.Usuario;

/**
 *
* @author academico */
public class Carrito {
    private int codigo;
    private Producto producto;
    private Usuario usuario;
    private int cantidadPedida;
    private float subTotal;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the producto
     */
    public Producto getProducto() {
        return producto;
    }

    /**
     * @param producto the producto to set
     */
    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    /**
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the cantidadPedida
     */
    public int getCantidadPedida() {
        return cantidadPedida;
    }

    /**
     * @param cantidadPedida the cantidadPedida to set
     */
    public void setCantidadPedida(int cantidadPedida) {
        this.cantidadPedida = cantidadPedida;
    }

    /**
     * @return the subTotal
     */
    public float getSubTotal() {
        return subTotal;
    }

    /**
     * @param subTotal the subTotal to set
     */
    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }
}
