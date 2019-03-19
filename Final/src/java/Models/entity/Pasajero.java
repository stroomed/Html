
package Models.entity;

public class Pasajero{
    protected int codigoP;
    protected String rut;
    protected int colegio;
    protected String nombreP, apellido, apoderado, domicilio;

    public int getCodigoP() {
        return codigoP;
    }

    public void setCodigoP(int codigoP) {
        this.codigoP = codigoP;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public int getColegio() {
        return colegio;
    }

    public void setColegio(int colegio) {
        this.colegio = colegio;
    }

    
    
    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getApoderado() {
        return apoderado;
    }

    public void setApoderado(String apoderado) {
        this.apoderado = apoderado;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }
    
    @Override
    public String toString(){
        StringBuffer buf = new StringBuffer();
        buf.append(" Codigo: ");
        buf.append(Integer.toString(getCodigoP()));
        buf.append(" Rut: ");
        buf.append(getRut());
        buf.append(" Colegio: ");
        buf.append(getColegio());
        buf.append(" Nombre: ");
        buf.append(getNombreP());
        buf.append(" Apellido: ");
        buf.append(getApellido()); 
        buf.append(" Apoderado: ");
        buf.append(getApoderado());
        buf.append(" Domicilio: ");
        buf.append(getDomicilio());
        return buf.toString();
    }

}
