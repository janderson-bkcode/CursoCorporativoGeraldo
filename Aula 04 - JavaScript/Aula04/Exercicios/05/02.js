const prompt = require("prompt-sync")()
var op = Number(prompt("Digite uma opção ou 0 para sair do aplicativo"))

var qtdCandidatos

do {
    Menu();
 
} while (op != 0 && op >0)

function Menu() {

    console.log(
        ` 1: Cadastro de Candidatos\n
          2: Numeros de Candidatos Femininos\n
          3: Números de Candidatos Masculinos\n
          4: Idade Média dos Homens com experiência\n
          5: Idade Média das mulheres com experiência\n
          6: Porcentagem de Homens com experiência entre 35 e 45 anos\n
          7: Menor idade entre as mulheres com Experiência\n
          8: Escolaridade do Candidato
          `              )
    switch (op) {
        case 1:
            Cadastro();
            break;
        case 2:
        case 3:
            ObterCandidatosSexo();
            break;
        case 4:
        case 5:
            ObterMediaExperiencia();
            break;
        case 6:
            ObterPercentagem_35_45anosHomens()
            break;
        case 7:
            ObterMenorIdadeMulheresComExperiencia()
        case 8:
            ObterNivelEscolar()
        default:
            console.log("Saindo");
            break;
    }
}


function Cadastro() {
    console.log("Cadastro de Candidatos")
    var nomeCandidato = prompt("Digite o nome do Candidato")
    var candidatoSexo = prompt("Digite o sexo do Candidato")
    var idadeCandidato = Number("Digite a Idade do Candidato")
    var experienciaCandidato = prompt("Possui Experiência? S para sim e N para Não")
    var escolaridadeCandidato = prompt("Digite a escolaridade do Candidato")
    qtdCandidatos++;
    ObterCandidatosSexo();
}


function ObterCandidatosSexo() {
    candidatoSexo == 'F' ? candidatoF++ : candidatoM++

}

function ObterIdadeMedia() {

    var soma = soma + idadeCandidato
    var media = soma / qtdCandidatos
    console.log(`Média de idade dos Candidatos${media}`)

    if (candidato = 'F') {

        soma += candidatoF
        mediaFeminina = soma / candidatoF


    } else {
        soma += candidatoM
        mediaMasculina = soma / candidatoM
    }
}
function ObterMediaExperiencia() {

    if (ObterCandidatosSexo() && experienciaCandidato == 'S') {
        soma += candidatoF
        mediaFemininaExp = soma / candidatoF
        console.log(`MédiaFeminina com Experiência ${mediaFeminina}`)
    }
    if (!ObterCandidatosSexo() && experienciaCandidato == 'S') {

        soma += candidatoM
        mediaMasculinaExp = soma / candidatoM
        console.log(`MédiaMasculina com Experiência ${mediaFeminina}`)
    }
    else {

        console.log(`Não há dados com experiência`)
    }
}

function ObterPercentagem_35_45anosHomens() {

    if (idadeCandidato > 34 && idadeCandidato <= 45 && !ObterCandidatosSexo) {

        qtdHomens3545++
        soma += mediaHomens3545
        porcentagem = soma /100
        
        console.log(`Porcentagem de Homenso com 35 a 45 anos com experiência
        ${porcentagem}`)
        
    }

}
function ObterMenorIdadeMulheresComExperiencia() {

    if (ObterCandidatosSexo() && experienciaCandidato == 'S') {

        menorIdadeMulheresExp = Math.min(idadeCandidato)
        console.log(`Menor idade das Mulheres com experiência ${menorIdadeMulheresExp}`)
    }


}
function ObterNivelEscolar() {

    console.log(`Escolaridade ${escolaridadeCandidato}`)
}
