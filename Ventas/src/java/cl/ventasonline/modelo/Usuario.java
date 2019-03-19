
package cl.ventasonline.modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class Usuario {

    protected int Codigo;
    protected String nombre;
    protected String apellido;
    protected String usuario;
    protected String clave;
    protected int privilegio;

    public Usuario(int Codigo, String nombre, String apellido, String usuario, String clave, int privilegio) {
        this.Codigo = Codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.usuario = usuario;
        this.clave = clave;
        this.privilegio = privilegio;
    }
    
    public Usuario(){
    }
    
    protected Connection getConnection() {
        return InstanceBD.getInstanceConnection();
    }
       
    public Vector<Usuario> getUsuarios() {
        Vector<Usuario> listaUsuario = new Vector<Usuario>();
        ResultSet result = null;
        try {

            String query = "SELECT * FROM usuarios";
            Statement stmt = getConnection().createStatement();
            result = stmt.executeQuery(query);

            while (result.next()) {
                int userCodigo      = result.getInt("user_Codigo");
                String userNombre   = result.getString("user_Nombre");
                String userApellido = result.getString("user_Apellido");
                String userUsuario  = result.getString("user_Usuario");
                String userClave    = result.getString("user_Clave");
                int userPrivilegio  = result.getInt("user_Privilegio");
                listaUsuario.add(new Usuario(userCodigo,userNombre,userApellido,userUsuario,userClave,userPrivilegio));
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

    
    
    
    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(int privilegio) {
        this.privilegio = privilegio;
    }
    @Override
    public String toString(){
        StringBuilder buil = new StringBuilder();
        buil.append("Codigo: ");
        buil.append(Integer.toString(getCodigo()));
        buil.append("Nombre: ");
        buil.append(getNombre());
        buil.append("Apellido: ");
        buil.append(getApellido());
        buil.append("Usuario: ");
        buil.append(getUsuario());
        buil.append("Clave: ");
        buil.append(getClave());
        buil.append("Privilegio: ");
        buil.append(getPrivilegio());
        return buil.toString();
    }
//    protected void closeConnection() {
//        InstanceBD.closeConnection();
//    }
  
}
