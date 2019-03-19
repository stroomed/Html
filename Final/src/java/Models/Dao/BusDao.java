
package Models.Dao;

import Models.entity.Bus;
import Utilidades.DataBaseInstance;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BusDao {
    protected Connection getConnection(){
        return DataBaseInstance.getInstanceConnection();
    }
    
    protected void closeConnection() {
        DataBaseInstance.closeConnection();
    }
    
    public List<Bus> findAll(){
        List<Bus> listaBus = new LinkedList<>();
        ResultSet result = null;
        
        try {

            String query = "SELECT * FROM bus";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Bus b = new Bus();
                b.setCodigoB(result.getInt("bus_cod"));
                b.setPatente_bus(result.getString("bus_patente"));
                b.setRutChofer(result.getInt("bus_chofer"));
                b.setMarca(result.getString("bus_marca"));
                b.setModelo(result.getString("bus_modelo"));
                b.setYear(result.getInt("bus_year"));
                b.setCapacidad(result.getInt("bus_capacidad"));
                listaBus.add(b);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
        return listaBus;
    }
    
    public Bus findById(int busId) {
        ResultSet result = null;
        Bus b = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM bus WHERE bus_cod = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, busId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            b = new Bus();
            b.setCodigoB(result.getInt("bus_cod"));
            b.setPatente_bus(result.getString("bus_patente"));
            b.setRutChofer(result.getInt("bus_chofer"));
            b.setMarca(result.getString("bus_marca"));
            b.setModelo(result.getString("bus_modelo"));
            b.setYear(result.getInt("bus_year"));
            b.setCapacidad(result.getInt("bus_capacidad"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return b;
    }
    
    public void save(Bus b) {

        PreparedStatement sB;
        try {

            if (b.getCodigoB() == 0) {
                sB = getConnection().prepareStatement(
                        "INSERT INTO bus (bus_patente, bus_chofer, bus_marca, bus_modelo, bus_year, bus_capacidad) "
                        + "VALUES (?, ?, ?, ?, ?, ?)");
                sB.setString(1, b.getPatente_bus());
                sB.setInt(2, b.getRutChofer());
                sB.setString(3, b.getMarca());
                sB.setString(4, b.getModelo());
                sB.setInt(5, b.getYear());
                sB.setInt(6, b.getCapacidad());
                System.out.println("INSERT INTO ....");
            } else {
                sB = getConnection().prepareStatement(
                        "UPDATE bus SET bus_patente = ?, bus_chofer = ?, bus_marca = ?, bus_modelo = ?, bus_year = ?, bus_capacidad = ? WHERE  bus_cod = ?");
                sB.setString(1, b.getPatente_bus());
                sB.setInt(2, b.getRutChofer());
                sB.setString(3, b.getMarca());
                sB.setString(4, b.getModelo());
                sB.setInt(5, b.getYear());
                sB.setInt(6, b.getCapacidad());
                sB.setInt(7, b.getCodigoB());
            }

            sB.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }
    
    public void delete(Bus b) {
        PreparedStatement sB;
        try {
            if (b.getCodigoB() > 0) {
                sB = getConnection().prepareStatement(
                        "DELETE FROM bus WHERE bus_cod = ?");
                sB.setInt(1, b.getCodigoB());
                sB.executeUpdate();
            }
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }
    
}
