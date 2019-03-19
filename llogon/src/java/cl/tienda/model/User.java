
package cl.tienda.model;

public class User {
    private String rut;
    private String nombre;
    private String apellidos;
    private String clave;

    public User(String rut, String nombre, String apellidos, String clave) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.clave = clave;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
    
    
    
}
