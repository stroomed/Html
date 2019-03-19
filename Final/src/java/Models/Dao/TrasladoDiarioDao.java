package Models.Dao;

import Models.entity.TrasladoDiario;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import Utilidades.DataBaseInstance;

public class TrasladoDiarioDao {

    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<TrasladoDiario> findAll() {
        List<TrasladoDiario> listaTrasladoDiario = new LinkedList<TrasladoDiario>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM traslado_diario";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                TrasladoDiario trasladoDiario = new TrasladoDiario();
                trasladoDiario.setCodigo_tra(result.getInt("traslado_codigo"));
                trasladoDiario.setPasajero(result.getInt("traslado_pasajero"));
                trasladoDiario.setBus(result.getInt("traslado_bus"));
                trasladoDiario.setDia_traslado(result.getString("traslado_dia"));
                trasladoDiario.setHoraSalida_traslado(result.getString("traslado_horasalida"));
                trasladoDiario.setHoraLlegada_traslado(result.getString("traslado_horallegada"));
                listaTrasladoDiario.add(trasladoDiario);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaTrasladoDiario;
    }

    public TrasladoDiario findById(int trasladoDiarioId) {
        ResultSet result = null;
        TrasladoDiario trasladoDiario = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM traslado_diario WHERE traslado_codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, trasladoDiarioId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            trasladoDiario = new TrasladoDiario();
            trasladoDiario.setCodigo_tra(result.getInt("traslado_codigo"));
            trasladoDiario.setPasajero(result.getInt("traslado_pasajero"));
            trasladoDiario.setBus(result.getInt("traslado_bus"));
            trasladoDiario.setDia_traslado(result.getString("traslado_dia"));
            trasladoDiario.setHoraSalida_traslado(result.getString("traslado_horasalida"));
            trasladoDiario.setHoraLlegada_traslado(result.getString("traslado_horallegada"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return trasladoDiario;
    }

    public void save(TrasladoDiario trasladoDiario) {

        PreparedStatement saveProduct;
        try {

            if (trasladoDiario.getCodigo_tra() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO traslado_diario (traslado_pasajero ,traslado_bus ,traslado_dia , traslado_horasalida, traslado_horallegada) "
                        + "VALUES (?, ?, ? , ?, ?)");
                saveProduct.setInt(1, trasladoDiario.getPasajero());
                saveProduct.setInt(2, trasladoDiario.getBus());
                saveProduct.setString(3, trasladoDiario.getDia_traslado());
                saveProduct.setString(4, trasladoDiario.getHoraSalida_traslado());
                saveProduct.setString(5, trasladoDiario.getHoraLlegada_traslado());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE traslado_diario SET traslado_pasajero = ?,traslado_bus = ?, traslado_dia = ?, traslado_horasalida = ?, traslado_horallegada = ? WHERE  traslado_codigo = ?");
                saveProduct.setInt(1, trasladoDiario.getPasajero());
                saveProduct.setInt(2, trasladoDiario.getBus());
                saveProduct.setString(3, trasladoDiario.getDia_traslado());
                saveProduct.setString(4, trasladoDiario.getHoraSalida_traslado());
                saveProduct.setString(5, trasladoDiario.getHoraLlegada_traslado());
                saveProduct.setInt(6, trasladoDiario.getCodigo_tra());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(TrasladoDiario trasladoDiario) {
        PreparedStatement saveProduct;
        try {

            if (trasladoDiario.getCodigo_tra() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM traslado_diario WHERE traslado_codigo = ?");

                saveProduct.setInt(1, trasladoDiario.getCodigo_tra());
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
