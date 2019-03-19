
package calculadora;

public class metodos {
// Declaración
    private int n1, n2;
// Getter
    public int getN1() {
        return n1;
    }
    public int getN2() {
        return n2;
    }
// Setter
    public void setN1(int n1) {
        this.n1 = n1;
    }
    public void setN2(int n2) {
        this.n2 = n2;
    }
// Suma   
    public String suma(){
        return "La suma es: "+(n1+n2);
    }
// Resta
    public String resta(){
        return "La resta es: "+(n1-n2);
    }
// Multiplicación
    public String multiplicacion(){
        return "La multiplicación es: "+(n1*n2);
    }
// División
    public String division(){
        return "La división es: "+(n1/n2);
    }
// Residuo
    public String residuo(){
        return "El residuo es: "+(n1%n2);
    }
}
