import java.util.Properties;

public class Calculadora{
    
    private double resultado;

    // public double getResultado(){
    //     return this.resultado;
    // }

    // public void setResultado(double resultado){
    //     this.resultado = resultado;
    // }

    public double soma(double num1,double num2){
        this.resultado  = num1 + num2;
        return this.resultado ;
    }

    public double subtrair(double num1,double num2){
        this.resultado  = num1 - num2;
        return this.resultado ;
    }

    public double multiplicar(double num1,double num2){

        this.resultado  = num1 * num2;
        return this.resultado ;
    }

    public double dividir(double  num1,double num2){
        
        if(num2%2 == 0){

        this.resultado  = num1 / num2;
        return this.resultado ;
        }
        else{

            return 0;
        }
    }
}