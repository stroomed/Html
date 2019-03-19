package cl.ventasonline.dao;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import cl.ventasonline.modelo.Producto;
import cl.ventasonline.modelo.InstanceBD;

public class ProductoDao {

    protected Connection getConnection() {
        return InstanceBD.getInstanceConnection();
    }

    public List<Producto> findAll() {
        List<Producto> listaProducto = new LinkedList<Producto>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM productos";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Producto producto = new Producto();
                producto.setCodigo(result.getInt("prod_Codigo"));
                producto.setNombre(result.getString("prod_Nombre"));
                producto.setPrecio(result.getInt("prod_Precio"));
                producto.setStock(result.getDouble("prod_Stock"));
                listaProducto.add(producto);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaProducto;
    }

    public Producto findById(int productoId) {
        ResultSet result = null;
        Producto producto = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM productos WHERE  prod_Codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, productoId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            producto = new Producto();
            producto.setCodigo(result.getInt("prod_Codigo"));
            producto.setNombre(result.getString("prod_Nombre"));
            producto.setPrecio(result.getInt("prod_Precio"));
            producto.setStock(result.getDouble("prod_Stock"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return producto;
    }

    public void save(Producto producto) {

        PreparedStatement saveProduct;
        try {

            if (producto.getCodigo() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO productos (prod_Nombre,prod_Precio ,prod_Stock) "
                        + "VALUES (?, ?, ?)");
                saveProduct.setString(1, producto.getNombre());
                saveProduct.setInt(2, producto.getPrecio());
                saveProduct.setDouble(3, producto.getStock());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE productos SET prod_Nombre = ?, prod_Precio = ?, prod_Stock = ? WHERE  prod_Codigo = ?");
                saveProduct.setString(1, producto.getNombre());
                saveProduct.setInt(2, producto.getPrecio());
                saveProduct.setDouble(3, producto.getStock());
                saveProduct.setInt(4, producto.getCodigo());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Producto producto) {
        PreparedStatement saveProduct;
        try {

            if (producto.getCodigo() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM productos WHERE prod_Codigo = ?");

                saveProduct.setInt(1, producto.getCodigo());
                saveProduct.executeUpdate();
            }


            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    protected void closeConnection() {
        InstanceBD.closeConnection();
    }
}
