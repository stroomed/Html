
package cl.modelo;

public class user {
    
    private String rut, nombre, apellido, clave;

// CONSTRUCTORES   
    public user(String rut, String clave) {
        this.rut = rut;
        this.clave = clave;
    }
    public user(String rut, String nombre, String apellido, String clave) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.clave = clave;
    }
    
// GETTER AND SETTER
    // RUT
    public String getRut() {
        return rut;
    }
    public void setRut(String rut) {
        this.rut = rut;
    }
    // NOMBRE
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    // APELLIDO
    public String getApellido() {
        return apellido;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    // CLAVE
    public String getClave() {
        return clave;
    }
    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
}
