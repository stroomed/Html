
package cl.ventasonline.modelo;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public final class InstanceBD {
    private static Connection con;
    private static String user = "ventas";
    private static String pass = "123456";
    private static String url  = "jdbc:derby://localhost:1527/ventass";
    
    public static Connection getInstanceConnection(){
        if(!(con instanceof Connection)){
            System.out.println("Conectando a la base de datos . . .");
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                con = DriverManager.getConnection(url,user,pass);                
            }catch(SQLException e){
                System.out.println(e.getMessage());                
            }catch(ClassNotFoundException ex){
                System.out.println(ex.getMessage());
            }
        }
        System.out.println(con);
        return con;
    }
    
    public static void closeConnection(){
        try{
            if(con instanceof Connection){
                con.close();
                con = null;
                System.out.println("Se ha conectado a la base de datos con éxito ...");
            }
        }catch(SQLException e){
            System.out.println("No se ha podido establecer la conexion con la base de datos ...");
            System.out.println(e.getMessage());
        }
    }
    
    
    
}
