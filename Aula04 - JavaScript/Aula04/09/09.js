const prompt = require("prompt-sync")()
const produto = prompt("Produto:")
const num = Number(prompt("Nº de Etiquetas"))
console.log("Programa Anos de Copa do Mundo\nDigite 0 para sair")



for (let index = 1; index <= num/2; index++) {
  
    console.log(`${produto.padEnd(30)} ${produto.padEnd(30)}`);
}
if (num %2 ==1) {
    console.log(produto);
}