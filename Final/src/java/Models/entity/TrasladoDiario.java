
package Models.entity;

public class TrasladoDiario{
    protected int pasajero;
    protected int bus;
    protected int codigo_tra;
    protected String dia_traslado;
    protected String horaSalida_traslado;
    protected String horaLlegada_traslado;

    public int getCodigo_tra() {
        return codigo_tra;
    }

    public void setCodigo_tra(int codigo_tra) {
        this.codigo_tra = codigo_tra;
    }

    public int getPasajero() {
        return pasajero;
    }

    public void setPasajero(int pasajero) {
        this.pasajero = pasajero;
    }

    public int getBus() {
        return bus;
    }

    public void setBus(int bus) {
        this.bus = bus;
    }

    

    public String getDia_traslado() {
        return dia_traslado;
    }

    public void setDia_traslado(String dia_traslado) {
        this.dia_traslado = dia_traslado;
    }

    public String getHoraSalida_traslado() {
        return horaSalida_traslado;
    }

    public void setHoraSalida_traslado(String horaSalida_traslado) {
        this.horaSalida_traslado = horaSalida_traslado;
    }

    public String getHoraLlegada_traslado() {
        return horaLlegada_traslado;
    }

    public void setHoraLlegada_traslado(String horaLlegada_traslado) {
        this.horaLlegada_traslado = horaLlegada_traslado;
    }
    
    @Override
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigo_tra()));
        buf.append(" Pasajero: ");
        buf.append(getPasajero());
        buf.append(" Bus: ");
        buf.append(getBus());
        buf.append(" Dia Traslado ");
        buf.append(getDia_traslado());
        buf.append(" Hora Salida Traslado: ");
        buf.append(getHoraSalida_traslado());
        buf.append(" Hora Llegada Traslado: ");
        buf.append(getHoraLlegada_traslado());
        return buf.toString();
    }

}
