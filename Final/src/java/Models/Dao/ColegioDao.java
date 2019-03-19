package Models.Dao;

import Models.entity.Colegio;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import Utilidades.DataBaseInstance;

public class ColegioDao {

    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<Colegio> findAll() {
        List<Colegio> listaColegio = new LinkedList<Colegio>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM colegio";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Colegio colegio = new Colegio();
                colegio.setCodigoC(result.getInt("colegio_codigo"));
                colegio.setNombre(result.getString("colegio_nombre"));
                colegio.setDireccion(result.getString("colegio_direccion"));
                listaColegio.add(colegio);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaColegio;
    }

    public Colegio findById(int codigoC) {
        ResultSet result = null;
        Colegio colegio = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM colegio WHERE  colegio_codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, codigoC);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            colegio = new Colegio();
            colegio.setCodigoC(result.getInt("colegio_codigo"));
            colegio.setNombre(result.getString("colegio_nombre"));
            colegio.setDireccion(result.getString("colegio_direccion"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return colegio;
    }

    public void save(Colegio colegio) {

        PreparedStatement saveProduct;
        try {

            if (colegio.getCodigoC() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO colegio (colegio_nombre ,colegio_direccion) "
                        + "VALUES (?, ?)");
                saveProduct.setString(1, colegio.getNombre());
                saveProduct.setString(2, colegio.getDireccion());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE colegio SET colegio_nombre = ?,colegio_direccion = ? WHERE colegio_codigo = ?");
                saveProduct.setString(1, colegio.getNombre());
                saveProduct.setString(2, colegio.getDireccion());
                saveProduct.setInt(3, colegio.getCodigoC());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Colegio colegio) {
        PreparedStatement saveProduct;
        try {

            if (colegio.getCodigoC() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM colegio WHERE colegio_codigo = ?");

                saveProduct.setInt(1, colegio.getCodigoC());
                saveProduct.executeUpdate();
            }


            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    protected void closeConnection() {
        DataBaseInstance.closeConnection();
    }
}
