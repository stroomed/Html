
package cl.ventasonline.dao;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import cl.ventasonline.modelo.Usuario;
import cl.ventasonline.modelo.InstanceBD;

public class UsuariosDao {
    protected Connection getConnection() {
        return InstanceBD.getInstanceConnection();
    }
    public List<Usuario> findAll() {
        List<Usuario> listaUsuario = new LinkedList<Usuario>();
        ResultSet result = null;

        try {

            String query = "SELECT * FROM usuarios";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setCodigo(result.getInt("user_Codigo"));
                usuario.setNombre(result.getString("user_Nombre"));
                usuario.setApellido(result.getString("user_Apellido"));
                usuario.setUsuario(result.getString("user_Usuario"));
                usuario.setClave(result.getString("user_Clave"));
                usuario.setPrivilegio(result.getInt("user_Privilegio"));
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
    
     public Usuario findById(int UsuarioCodigo) {
        ResultSet result = null;
        Usuario usuario = null;

        try {
            // Componemos la sentencia SQL para obtener los productos.
            String query = "SELECT * FROM usuarios WHERE  user_Codigo = ?";

            // Ejecutamos la query y obtenemos el resultado.
            PreparedStatement stmt = getConnection().prepareStatement(query);
            stmt.setInt(1,UsuarioCodigo);
            result = stmt.executeQuery();

            // Vemos si no ha devuelto ningun resultado.
            if (!result.next()) {
                throw new SQLException();
            }

            // Construimos una VO para el producto.
            usuario = new Usuario();
            usuario.setCodigo(result.getInt("user_Codigo"));
            usuario.setNombre(result.getString("user_nombre"));
            usuario.setApellido(result.getString("user_Apellido"));
            usuario.setUsuario(result.getString("user_Usuario"));
            usuario.setClave(result.getString("user_Clave"));
            usuario.setPrivilegio(result.getInt("user_Privilegio"));

            result.close();
            stmt.close();
            closeConnection();

        } catch (SQLException se) {
            System.err.println("Se ha producido un error de BD.");
            System.err.println(se.getMessage());
        }

        return usuario;
    }

    public void save(Usuario usuario) {

        PreparedStatement saveProduct;
        try {

            if (usuario.getCodigo() == 0) {
                saveProduct = getConnection().prepareStatement(
                        "INSERT INTO usuarios(user_Nombre ,user_Apellido ,user_Usuario,user_Clave, user_Privilegio) "
                        + "VALUES (?, ?, ?, ?, ?)");
                saveProduct.setString(1, usuario.getNombre());
                saveProduct.setString(2, usuario.getApellido());
                saveProduct.setString(3, usuario.getUsuario());
                saveProduct.setString(4, usuario.getClave());
                saveProduct.setInt(5, usuario.getPrivilegio());
                System.out.println("INSERT INTO ....");
            } else {
                saveProduct = getConnection().prepareStatement(
                "UPDATE usuarios SET user_Nombre = ?, user_Apellido = ?, user_Usuario = ?, user_Clave=?, user_Privilegio=? WHERE  user_Codigo= ?");
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

    public void delete(Usuario usuario) {
        PreparedStatement saveProduct;
        try {

            if (usuario.getCodigo()> 0) {
                saveProduct = getConnection().prepareStatement(
                        "DELETE FROM usuarios WHERE user_Codigo = ?");

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
        InstanceBD.closeConnection();
    }
    
}
