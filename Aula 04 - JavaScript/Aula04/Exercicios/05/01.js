const prompt = require("prompt-sync")()
const nomeAluno = prompt("Nome do Aluno")
const disciplina = prompt("Disciplina")
var notas = [];


for (let index = 0; index <4; index++) {
    
     notas[index] = Number(prompt("Digite as notas:"))
}

notas.forEach((nota) =>{

    soma +=nota;
});

var mediaFinal = soma / 4;

const provacao = Number(prompt("Digite a PR"))
const EstudoDirigido = Number(prompt("Digite o ED "))

var mediaN = mediaFinal * 0.80
provacao = mediafinal * 0.40
EstudoDirigido = mediaFinal * 0.80

if(mediaFinal >= 6){
   var situacao =  console.log("Aluno Aprovado")
}
else{
    situacao = console.log("Aluno Reprovado")
}

console.log = `Nome do Aluno ${nomeAluno}\n
               Disciplina ${disciplina}\n
               Provacao ${provacao}\n
               Estudo Dirigido ${disciplina}
               Media Final ${mediaFinal}
               Situação ${situacao}`




