
package Models.entity;

public class Colegio {

    protected int codigoC;
    protected String nombre;
    protected String direccion;

    
    public int getCodigoC() {
        return codigoC;
    }

    public void setCodigoC(int codigoC) {
        this.codigoC = codigoC;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
            
    @Override
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(getCodigoC());
        buf.append(" Nombre: ");
        buf.append(getNombre());
        buf.append(" Direccion: ");
        buf.append(getDireccion());
        return buf.toString();
    }
}
