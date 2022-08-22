const prompt = require("prompt-sync")()
const valor = Number(prompt("Valor R$:"))
const num = Number(prompt("Nº de parcelas"))
const valorParcelas = Math.floor(valor/num)
const valorFinal = valorParcelas + (valor % num)
for (let index = 1; index < num; index++) {

    console.log(`${index}ª parcela: R$ ${valorFinal.toFixed(2)}\n\n`);
    
}