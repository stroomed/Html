package Models.Dao;

import Models.entity.Chofer;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import Utilidades.DataBaseInstance;

public class ChoferDao {

    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<Chofer> findAll() {
        List<Chofer> listaChofer = new LinkedList<Chofer>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM chofer";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Chofer chofer = new Chofer();
                chofer.setCodigo(result.getInt("codigo"));
                chofer.setRut(result.getString("chofer_rut"));
                chofer.setNombre(result.getString("chofer_nombre"));
                chofer.setApellido(result.getString("chofer_apellido"));
                chofer.setMovil(result.getInt("chofer_movil"));
                chofer.setSexo(result.getString("chofer_sexo"));
                listaChofer.add(chofer);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaChofer;
    }

    public Chofer findById(int choferId) {
        ResultSet result = null;
        Chofer chofer = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM chofer WHERE  codigo = ? ";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, choferId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            chofer = new Chofer();
            chofer.setCodigo(result.getInt("codigo"));
            chofer.setRut(result.getString("chofer_rut"));
            chofer.setNombre(result.getString("chofer_nombre"));
            chofer.setApellido(result.getString("chofer_apellido"));
            chofer.setMovil(result.getInt("chofer_movil"));
            chofer.setSexo(result.getString("chofer_sexo"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return chofer;
    }

    public void save(Chofer chofer) {

        PreparedStatement saveProduct;
        try {

            if (chofer.getCodigo() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO chofer (chofer_rut, chofer_nombre, chofer_apellido, chofer_movil, chofer_sexo) "
                        + "VALUES (?, ?, ? ,?, ?)");
                saveProduct.setString(1, chofer.getRut());
                saveProduct.setString(2, chofer.getNombre());
                saveProduct.setString(3, chofer.getApellido());
                saveProduct.setInt(4, chofer.getMovil());
                saveProduct.setString(5, chofer.getSexo());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE chofer SET chofer_rut = ?,chofer_nombre = ?, chofer_apellido = ?, chofer_movil = ?, chofer_sexo = ? WHERE  codigo = ?");
                saveProduct.setString(1, chofer.getRut());
                saveProduct.setString(2, chofer.getNombre());
                saveProduct.setString(3, chofer.getApellido());
                saveProduct.setInt(4, chofer.getMovil());
                saveProduct.setString(5, chofer.getSexo());
                saveProduct.setInt(6, chofer.getCodigo());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Chofer chofer) {
        PreparedStatement saveProduct;
        try {

            if (chofer.getCodigo() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM chofer WHERE codigo = ?");

                saveProduct.setInt(1, chofer.getCodigo());
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
