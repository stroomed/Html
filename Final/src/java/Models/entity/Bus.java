
package Models.entity;

public class Bus{
    protected int codigoB;
    protected String patente_bus;
    protected int rutChofer;
    protected String marca, modelo;
    protected int year, capacidad;

    public int getCodigoB() {
        return codigoB;
    }

    public void setCodigoB(int codigoB) {
        this.codigoB = codigoB;
    }

    public String getPatente_bus() {
        return patente_bus;
    }

    public void setPatente_bus(String patente_bus) {
        this.patente_bus = patente_bus;
    }

    public int getRutChofer() {
        return rutChofer;
    }

    public void setRutChofer(int rutChofer) {
        this.rutChofer = rutChofer;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    
    @Override
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigoB()));
        buf.append(" Patente: ");
        buf.append(getPatente_bus());
        buf.append(" Rut Chofer: ");
        buf.append(getRutChofer());
        buf.append(" Marca: ");
        buf.append(getMarca());
        buf.append(" Modelo: ");
        buf.append(getModelo());
        buf.append(" Año: ");
        buf.append(getYear());
        buf.append(" Capacidad: ");
        buf.append(getCapacidad());
        return buf.toString();
    }
    
}
