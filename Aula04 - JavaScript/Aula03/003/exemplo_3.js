const prompt = require("prompt-sync")()
const salario = Number(prompt("Salario R$:"))
const tempo = Number(prompt("Tempo(anos)"))

const quadrienios = Math.floor(tempo /4)
const acrescimo = salario * quadrienios / 100

console.log(`Quadrienios ${quadrienios}`);
console.log(`Salario Final R$ ${(salario + acrescimo).toFixed(2)}`);