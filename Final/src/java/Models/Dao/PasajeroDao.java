
package Models.Dao;


import Models.entity.Pasajero;
import Utilidades.DataBaseInstance;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class PasajeroDao {
    
    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<Pasajero> findAll() {
        List<Pasajero> listaPasajero = new LinkedList<Pasajero>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM pasajero";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Pasajero pasajero = new Pasajero();
                pasajero.setCodigoP(result.getInt("pasajero_cod"));
                pasajero.setRut(result.getString("pasajero_rut"));
                pasajero.setColegio(result.getInt("pasajero_colegio"));
                pasajero.setNombreP(result.getString("pasajero_nombre"));
                pasajero.setApellido(result.getString("pasajero_apellido"));
                pasajero.setApoderado(result.getString("pasajero_apoderado"));
                pasajero.setDomicilio(result.getString("pasajero_domicilio"));
                listaPasajero.add(pasajero);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaPasajero;
    }

    public Pasajero findById(int pasajeroId) {
        ResultSet result = null;
        Pasajero pasajero = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM pasajero WHERE  pasajero_cod = ? ";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, pasajeroId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            pasajero = new Pasajero();
            pasajero.setCodigoP(result.getInt("pasajero_cod"));
            pasajero.setRut(result.getString("pasajero_rut"));
            pasajero.setColegio(result.getInt("pasajero_colegio"));
            pasajero.setNombreP(result.getString("pasajero_nombre"));
            pasajero.setApellido(result.getString("pasajero_apellido"));
            pasajero.setApoderado(result.getString("pasajero_apoderado"));
            pasajero.setDomicilio(result.getString("pasajero_domicilio"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return pasajero;
    }

    public void save(Pasajero pasajero) {

        PreparedStatement saveProduct;
        try {

            if (pasajero.getCodigoP() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO pasajero (pasajero_rut, pasajero_colegio, pasajero_nombre, pasajero_apellido, pasajero_apoderado, pasajero_domicilio) "
                        + "VALUES (?, ?, ? ,?, ?, ?)");
                saveProduct.setString(1, pasajero.getRut());
                saveProduct.setInt(2, pasajero.getColegio());
                saveProduct.setString(3, pasajero.getNombreP());
                saveProduct.setString(4, pasajero.getApellido());
                saveProduct.setString(5, pasajero.getApoderado());
                saveProduct.setString(6, pasajero.getDomicilio());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE pasajero SET pasajero_rut = ?,pasajero_colegio = ?, pasajero_nombre = ?, pasajero_apellido = ?, pasajero_apoderado = ?, pasajero_domicilio = ? WHERE  pasajero_cod = ?");
                saveProduct.setString(1, pasajero.getRut());
                saveProduct.setInt(2, pasajero.getColegio());
                saveProduct.setString(3, pasajero.getNombreP());
                saveProduct.setString(4, pasajero.getApellido());
                saveProduct.setString(5, pasajero.getApoderado());
                saveProduct.setString(6, pasajero.getDomicilio());
                saveProduct.setInt(7, pasajero.getCodigoP());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Pasajero pasajero) {
        PreparedStatement saveProduct;
        try {

            if (pasajero.getCodigoP() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM pasajero WHERE pasajero_cod = ?");

                saveProduct.setInt(1, pasajero.getCodigoP());
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
