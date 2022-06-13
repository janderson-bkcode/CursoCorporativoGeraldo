public class Acampamento {
    
    private String nome;
    private int idade;
    private String equipe;


    public String GetNome(){
        return this.nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public int getIdade(){
        return this.idade;
    }

    public void setIdade(int idade){
        this.idade = idade;
    }

    public string getEquipe (){
        return this.equipe;
    }

    public void setEquipe(String equipe){
        this.equipe = equipe;
    }


    public void imprimir(){

        System.out.printf("Nome: %s, idade: %i, Equipe: %s",this.nome,this,idade,this.equipe);
    }

    public void separarGrupo(){
        if(this.getIdade() >=6 && this.getIdade() <=10){
          setEquipe(getEquipe() == "A");    
        }
        if(this.getIdade() >=11 && this.idade() <=20){
            setEquipe(getEquipe() == "B");    
        }
        if(this.getIdade() >=21 ){
            setEquipe(getEquipe() == "C");    
        }
    }
}


public class PrincipalAcampamento{
    public static void main(String[]args){
        Acampamento ac = new Acampamento();
        ac.setNome("janderson");
        ac.setIdade(20);
        ac.imprimir();
        ac.separarGrupo();
        ac.imprimir();
    }
}
