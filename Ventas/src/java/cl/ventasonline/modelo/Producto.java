/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.ventasonline.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Vector;

/**
 *
* @author academico */
public class Producto {
    protected int codigo;
    protected String nombre;
    protected int precio;
    protected double stock;

    public Producto(int codigo, String nombre, int precio, double stock) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }
    public Producto(){
    }
    protected Connection getConnection() {
        return InstanceBD.getInstanceConnection();
    }
    protected void closeConnection() {
        InstanceBD.closeConnection();
    }
    public Vector<Producto> getProductos() {
        Vector<Producto> listaProductos = new Vector<Producto>();
        ResultSet result = null;
        try {
            String query = "SELECT * FROM productos";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                int prodCodigo     = result.getInt("prod_Codigo");
                String prodNombre   = result.getString("prod_Nombre");
                int prodPrecio = result.getInt("prod_Precio");
                double prodStock  = result.getDouble("prod_Stock");
                listaProductos.add(new Producto(prodCodigo,prodNombre,prodPrecio,prodStock));
            }
            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaProductos;
    }
    
    public void update(String nombre,int precio, int stock, int codigo) {

        PreparedStatement saveProduct;
        try {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE productos SET prod_Nombre = ?, prod_Precio = ?, prod_Stock = ? WHERE  prod_Codigo = ?");
                saveProduct.setString(1, nombre);
                saveProduct.setInt(2, precio);
                saveProduct.setDouble(3, stock);
                saveProduct.setInt(4, codigo);

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }
    //vent_codigo - vent_fecha - user_codigo - vent_totalpagar
    public void venta(int userCodigo, double totalPagar) {
        Calendar c2 = new GregorianCalendar();
        StringBuilder buil = new StringBuilder();
        buil.append(Integer.toString(c2.get(Calendar.DATE)));
        buil.append("/");
        buil.append(Integer.toString(c2.get(Calendar.MONTH) + 1));
        buil.append("/");
        buil.append(Integer.toString(c2.get(Calendar.YEAR)));

        PreparedStatement saveProduct;
        try {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO ventas (vent_fecha,user_Codigo ,vent_totalpagar) "
                        + "VALUES (?, ?, ?)");
                saveProduct.setString(1, buil.toString());
                saveProduct.setInt(2, userCodigo);
                saveProduct.setDouble(3, totalPagar);

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }
    
    //vent_Codigo, detventa_item, prod_codigo, detventa_cantidad, detventa_subtotal    
    public void detallesventa(int ventCodigo, int detventaItem, int prodCodigo,int detventaCantidad, double detventaSubtotal) {
        PreparedStatement saveProduct;
        try {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO detalleventa (vent_Codigo, detventa_item, prod_codigo, detventa_cantidad, detventa_subtotal) "
                        + "VALUES (?, ?, ?, ?, ?)");
                saveProduct.setInt(1, ventCodigo);
                saveProduct.setInt(2, detventaItem);
                saveProduct.setInt(3, prodCodigo);
                saveProduct.setInt(4, detventaCantidad);
                saveProduct.setDouble(5, detventaSubtotal);

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }
    
    public int idVenta(){
        ResultSet result = null;
        int ventCodigo = 0;
        try {
            String query = "select max(vent_Codigo) as idVenta from ventas";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                ventCodigo = result.getInt("idVenta");
            }
            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
        return ventCodigo;
    }
    public double totalVenta(){
        ResultSet result = null;
        double total = 0;
        try {
            String query = "select vent_TotalPagar from ventas where vent_codigo = "+ idVenta() +"";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                total = result.getDouble("vent_TotalPagar");
            }
            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
        return total;
    }
    

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }
    
    @Override
    public String toString(){
        StringBuilder buil = new StringBuilder();
        buil.append("Codigo: ");
        buil.append(Integer.toString(getCodigo()));
        buil.append("Nombre: ");
        buil.append(getNombre());
        buil.append("Precio: ");
        buil.append(getPrecio());
        buil.append("Stock: ");
        buil.append(getStock());
        return buil.toString();
    }
}
