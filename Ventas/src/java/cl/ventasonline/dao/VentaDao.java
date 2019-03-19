/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.ventasonline.dao;

import cl.ventasonline.modelo.InstanceBD;
import cl.ventasonline.modelo.Usuario;
import cl.ventasonline.modelo.Ventas;
import cl.ventasonline.modelo.detallesventa;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author RAGNAR
 */
public class VentaDao {
    
    protected Connection getConnection() {
        return InstanceBD.getInstanceConnection();
    }
    public List<Ventas> findAllVentas() {
        List<Ventas> listaVenta = new LinkedList<Ventas>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM ventas";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Ventas ventas = new Ventas();
                ventas.setVentCodigo(result.getInt("vent_Codigo"));
                ventas.setVentFecha(result.getString("vent_fecha"));
                ventas.setUserCodigo(result.getInt("user_Codigo"));
                ventas.setVentTotalpagar(result.getDouble("vent_Totalpagar"));
                listaVenta.add(ventas);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaVenta;
    }
    public List<detallesventa> findAllDetalles() {
        List<detallesventa> listaVenta = new LinkedList<detallesventa>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM detalleventa";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                detallesventa ventas = new detallesventa();
                ventas.setVentCodigo(result.getInt("vent_Codigo"));
                ventas.setDetventaItem(result.getInt("detventa_item"));
                ventas.setProdCodigo(result.getInt("prod_codigo"));
                ventas.setDetventaCantidad(result.getInt("detventa_cantidad"));
                ventas.setDetventaSubtotal(result.getDouble("detventa_subtotal"));
                listaVenta.add(ventas);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaVenta;
    }
    
    protected void closeConnection() {
        InstanceBD.closeConnection();
    }
    
}
