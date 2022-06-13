import Calculadora;

public class PrincipalCalculadora {
  

    public static void main(String []args){

           //Atributos
        double numero1 = 10;
        double numero2 = 5;
        //Objeto
        Calculadora calc = new Calculadora();  
        double divisao = calc.dividir(numero1, numero2);
        double soma  =calc.soma(numero1,numero2);
        double mult = calc.multiplicar(numero1,numero2);
        double sub = calc.subtrair(numero1, numero2);

        System.out.printf("Divisão %d \n, soma %d \n, multiplicação %d\n Divisão %d\n ",divisao,soma,mult,sub);

    
    } 

}
