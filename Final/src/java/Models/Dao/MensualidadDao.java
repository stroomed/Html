package Models.Dao;

import Models.entity.Mensualidad;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import Utilidades.DataBaseInstance;

public class MensualidadDao {

    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<Mensualidad> findAll() {
        List<Mensualidad> listaMensualidad = new LinkedList<>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM mensualidad";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Mensualidad mensualidad = new Mensualidad();
                mensualidad.setCodigo_men(result.getInt("mensualidad_codigo"));
                mensualidad.setPasajero(result.getInt("mensualidad_pasajero"));
                mensualidad.setUsuario(result.getInt("mensualidad_usuario"));
                mensualidad.setYear_mensualidad(result.getString("mensualidad_year"));
                mensualidad.setMes_mensualidad(result.getString("mensualidad_mes"));
                mensualidad.setMonto_mensualidad(result.getInt("mensualidad_monto"));
                listaMensualidad.add(mensualidad);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaMensualidad;
    }

    public Mensualidad findById(int mensualidadId) {
        ResultSet result = null;
        Mensualidad mensualidad = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM mensualidad WHERE mensualidad_codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, mensualidadId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            mensualidad = new Mensualidad();
            mensualidad.setCodigo_men(result.getInt("mensualidad_codigo"));
            mensualidad.setPasajero(result.getInt("mensualidad_pasajero"));
            mensualidad.setUsuario(result.getInt("mensualidad_usuario"));
            mensualidad.setYear_mensualidad(result.getString("mensualidad_year"));
            mensualidad.setMes_mensualidad(result.getString("mensualidad_mes"));
            mensualidad.setMonto_mensualidad(result.getInt("mensualidad_monto"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return mensualidad;
    }

    public void save(Mensualidad mensualidad) {

        PreparedStatement saveProduct;
        try {

            if (mensualidad.getCodigo_men() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO mensualidad (mensualidad_pasajero ,mensualidad_usuario ,mensualidad_year , mensualidad_mes, mensualidad_monto) "
                        + "VALUES (?, ?, ? ,? ,?)");
                saveProduct.setInt(1, mensualidad.getPasajero());
                saveProduct.setInt(2, mensualidad.getUsuario());
                saveProduct.setString(3, mensualidad.getYear_mensualidad());
                saveProduct.setString(4, mensualidad.getMes_mensualidad());
                saveProduct.setInt(5, mensualidad.getMonto_mensualidad());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE mensualidad SET mensualidad_pasajero = ?,mensualidad_usuario = ?, mensualidad_year = ?, mensualidad_mes = ?, mensualidad_monto = ? WHERE  mensualidad_codigo = ?");
                saveProduct.setInt(1, mensualidad.getPasajero());
                saveProduct.setInt(2, mensualidad.getUsuario());
                saveProduct.setString(3, mensualidad.getYear_mensualidad());
                saveProduct.setString(4, mensualidad.getMes_mensualidad());
                saveProduct.setInt(5, mensualidad.getMonto_mensualidad());
                saveProduct.setInt(6, mensualidad.getCodigo_men());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Mensualidad mensualidad) {
        PreparedStatement saveProduct;
        try {

            if (mensualidad.getCodigo_men() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM mensualidad WHERE mensualidad_codigo = ?");

                saveProduct.setInt(1, mensualidad.getCodigo_men());
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
