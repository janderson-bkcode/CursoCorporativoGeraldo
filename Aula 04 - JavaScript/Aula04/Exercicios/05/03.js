const prompt = require("prompt-sync")()

var op = Number(prompt("Digite uma opção ou 0 para sair do aplicativo"))
var nomeFuncionario = prompt("Digite o nome do Funcionario")
var salarioFuncionario = Number(prompt("Digite o salario do Funcionário")) 


do {
    


} while (op!=0);



function Menu() {

    console.log(
        ` 1: Cadastro de Candidatos\n
          2: Numeros de Candidatos Femininos\n
          3: Números de Candidatos Masculinos\n
          ` );
    switch (op) {
        case 1:
            obterSalarioBruto(salarioFuncionario);
            break;
        case 2:
            obterSalarioLiquidoFuncionario(salarioFuncionario);
            break;
        case 3:
            obterTotalFolha()
            break;
        default:
            console.log("Saindo");
            break;
    }
}

function obterSalarioBruto(salario){

  return `Funcionario ${nomeFuncionario} recebe ${salario}`
}

function obterDescontoINSS(salario){

  if(salario <=1556.94)
   return salario - 0.08
  if(salario > 1556.94 && salario <= 2594.92)

    return salario - 0.09
  else{
    return salario - 0.11
  }

}

function obterDescontoIRPF(salario){
    if(salario <1903.98){
        console.log("Sem desconto")
    }
    if(salario >=1903.98 && salario <=2826.65){
        return salario -0.075
    }
    if(salario >= 2826.65 && salario <=3751.05){
        
    }
}



function obterTotalFolha(){

    totalFolha += salarioFuncionario
}



function obterValorTotalImpostoRenda(){

}


function calculoIRPF(){

}