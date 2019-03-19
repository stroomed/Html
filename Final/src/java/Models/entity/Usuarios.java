package Models.entity;

public class Usuarios {

    protected int codigo;
    protected String nombre;
    protected String apellido;
    protected String usuario;
    protected String clave;
    protected int privilegio;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigo()));
        buf.append(" Nombre: ");
        buf.append(getNombre());
        buf.append(" Apellido: ");
        buf.append(getApellido());
        buf.append(" Usuario: ");
        buf.append(getUsuario());
        buf.append(" Clave: ");
        buf.append(getClave());
        buf.append(" Privilegio: ");
        buf.append(Integer.toString(getPrivilegio()));
        return buf.toString();
    }
}
