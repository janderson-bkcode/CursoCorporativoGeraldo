
public class Apolice {

    public static void main(String []args){
        Apolice ap = new Apolice();
        ap.setNomeSegurado("Janderson");
        ap.setIdade(20);
        ap.setValorPremio(200);

        ap.imprimir();

    }

    
    private string nomeSegurado;
    private int idade;
    private double valorPremio;

    public string GetNomeSegurado(){
        return this.nomeSegurado;
    }

    public void setNomeSegurado(String nomeSegurado){
        this.nomeSegurado = nomeSegurado;
    }

    public int GetIdade (){
        return this.idade;
    }

    public void setIdade(int idade){
        this.idade = idade;
    }

    public double GetValorPremio(){
        return this.valorPremio;
    }

    public void setValorPremio(double valorPremio){
        this.valorPremio = valorPremio;
    }



    public void imprimir(){

        System.out.printf("Nome do Segurado: %s, idade do segurado: %i , Premio: %d",this.nomeSegurado,this,idade,this.valorPremio);
    }

    public void calcularPremioApolice(){
        if(this.GetIdade() > 18  && this.GetIdade() <=25){
           this.setValorPremio((GetValorPremio()*20)/100);
        }
        if(this.GetIdade() > 25  && this.GetIdade() <=36){
            this.setValorPremio((GetValorPremio()*15)/100);
        }
        else{
            this.setValorPremio((GetValorPremio()*10)/100);
        }
    }
    
    
    public void oferecerDesconto(String cidade){

        if(cidade.equals("Curitiba")  || cidade.equals("Curitiba")){
            this.setValorPremio(GetValorPremio()* 0.8);
        }
        if(cidade.equals("Rio de janeiro") || cidade.equals("rio de janeiro")){
            this.setValorPremio(GetValorPremio()* 0.85);
        }
        if(cidade.equals("Rio de janeiro") || cidade.equals("são paulo")){
            this.setValorPremio(GetValorPremio()* 0.9);
        }
        if(cidade.equals("Belo Horizonte")|| cidade.equals("belo horizonte")){
            this.setValorPremio(GetValorPremio()* 0.95);
        }
    }

 
}
