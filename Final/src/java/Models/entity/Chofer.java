
package Models.entity;

public class Chofer {
    protected int codigo;
    protected String rut;
    protected String nombre;
    protected String apellido;
    protected int movil;
    protected String sexo;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getMovil() {
        return movil;
    }

    public void setMovil(int movil) {
        this.movil = movil;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    
    
    @Override
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigo()));
        buf.append(" Rut: ");
        buf.append(getRut());
        buf.append(" Nombre: ");
        buf.append(getNombre());
        buf.append(" Apellido: ");
        buf.append(getApellido());
        buf.append(" Movil: ");
        buf.append(getMovil());
        buf.append(" Sexo: ");
        buf.append(getSexo());
        return buf.toString();
    }
}
