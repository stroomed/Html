
package Models.entity;

public class Mensualidad{
    protected int codigo_men;
    protected int pasajero;
    protected int usuario;
    protected String year_mensualidad;
    protected String mes_mensualidad;
    protected int monto_mensualidad;

    public int getCodigo_men() {
        return codigo_men;
    }

    public void setCodigo_men(int codigo_men) {
        this.codigo_men = codigo_men;
    }

    public int getPasajero() {
        return pasajero;
    }

    public void setPasajero(int pasajero) {
        this.pasajero = pasajero;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

  


    public String getYear_mensualidad() {
        return year_mensualidad;
    }

    public void setYear_mensualidad(String year_mensualidad) {
        this.year_mensualidad = year_mensualidad;
    }

    public String getMes_mensualidad() {
        return mes_mensualidad;
    }

    public void setMes_mensualidad(String mes_mensualidad) {
        this.mes_mensualidad = mes_mensualidad;
    }

    public int getMonto_mensualidad() {
        return monto_mensualidad;
    }

    public void setMonto_mensualidad(int monto_mensualidad) {
        this.monto_mensualidad = monto_mensualidad;
    }

    
    
    @Override
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigo_men()));
        buf.append(" Pasajero: ");
        buf.append(getPasajero());
        buf.append(" Usuario: ");
        buf.append(getUsuario());
        buf.append(" Año Mensualidad ");
        buf.append(getYear_mensualidad());
        buf.append(" Mes Mensualidad: ");
        buf.append(getMes_mensualidad());
        buf.append(" Monto Mensualidad: ");
        buf.append(getMonto_mensualidad());
        return buf.toString();
    }
    
}
