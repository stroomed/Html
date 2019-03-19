package Models.Dao;

import Models.entity.Usuarios;
import java.sql.*;
import java.util.List;


import Utilidades.DataBaseInstance;
import java.util.LinkedList;

public class UsuarioDao {

    protected Connection getConnection() {
        return DataBaseInstance.getInstanceConnection();
    }

    public List<Usuarios> findAll() {
        List<Usuarios> listaUsuario = new LinkedList<Usuarios>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM usuarios";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setCodigo(result.getInt("codigo"));
                usuario.setNombre(result.getString("nombre"));
                usuario.setApellido(result.getString("apellido"));
                usuario.setUsuario(result.getString("usuario"));
                usuario.setClave(result.getString("clave"));
                usuario.setPrivilegio(result.getInt("privilegio"));
                listaUsuario.add(usuario);
            }

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.out.println(se.toString());
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return listaUsuario;
    }

    public Usuarios findById(int usuarioId) {
        ResultSet result = null;
        Usuarios usuario = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM usuarios WHERE  codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1, usuarioId);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            usuario = new Usuarios();
            usuario.setCodigo(result.getInt("codigo"));
            usuario.setNombre(result.getString("nombre"));
            usuario.setApellido(result.getString("apellido"));
            usuario.setUsuario(result.getString("usuario"));
            usuario.setClave(result.getString("clave"));
            usuario.setPrivilegio(result.getInt("privilegio"));
            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return usuario;
    }

    public void save(Usuarios usuario) {

        PreparedStatement saveProduct;
        try {

            if (usuario.getCodigo() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO usuarios (nombre ,apellido , usuario, clave, privilegio) "
                        + "VALUES (?, ?, ? ,? ,?)");
                saveProduct.setString(1, usuario.getNombre());
                saveProduct.setString(2, usuario.getApellido());
                saveProduct.setString(3, usuario.getUsuario());
                saveProduct.setString(4, usuario.getClave());
                saveProduct.setInt(5, usuario.getPrivilegio());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                        "UPDATE usuarios SET nombre = ?, apellido = ?, usuario = ?, clave = ?, privilegio = ? WHERE  codigo = ?");
                saveProduct.setString(1, usuario.getNombre());
                saveProduct.setString(2, usuario.getApellido());
                saveProduct.setString(3, usuario.getUsuario());
                saveProduct.setString(4, usuario.getClave());
                saveProduct.setInt(5, usuario.getPrivilegio());
                saveProduct.setInt(6, usuario.getCodigo());
            }

            saveProduct.executeUpdate();
            closeConnection();
        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }
    }

    public void delete(Usuarios usuario) {
        PreparedStatement saveProduct;
        try {

            if (usuario.getCodigo() > 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM usuarios WHERE codigo = ?");

                saveProduct.setInt(1, usuario.getCodigo());
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
