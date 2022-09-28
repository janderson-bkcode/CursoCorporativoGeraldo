const frm = document.querySelector("form") 
const InputMoeda = document.querySelector("inSomaMoeda") 
const containerMoedas = document.getElementById("moedas")
const tagBr = document.createElement("br")

window.addEventListener("load", (e) => {
    e.preventDefault()
    let moeda10 = Math.ceil(Math.random() * 6)
    let moeda25 = Math.ceil(Math.random() * 6)
    let moeda50 = Math.ceil(Math.random() * 6)
    let moeda1real = Math.ceil(Math.random() * 6)

    gerarMoedas(10,moeda10,"moeda10");
    gerarMoedas(25,moeda25,"moeda25");
    gerarMoedas(50,moeda50,"moeda50");
    gerarMoedas(1,moeda1real,"moeda1");
});

frm.addEventListener("submit",(e)=>{
    e.preventDefault()
    const moedas = containerMoedas.querySelectorAll("img") 
    let totalMoedas = 0
    let soma = Number(frm.inSomaMoeda.value) 
    for (const moeda of moedas) {
      if (moeda.className == "moeda10") {
        totalMoedas += 0.10 
      } else if (moeda.className == "moeda50") {
        totalMoedas += 0.50
      } else if (moeda.className == "moeda25") {
        totalMoedas += 0.25 
      } else {
        totalMoedas += 0.1
      }
    }
    if (soma = totalMoedas.toFixed(2) ) {
        alert(`Parabéns você acertou a resposta do valor ${totalMoedas}`)
    }
    else{
        alert(`Que pena Você errou , O valor correto era ${totalMoedas}`)
    }
})

frm.addEventListener("reset", () => {
    window.location.reload()
})

const gerarMoedas = (valorMoeda,numeroMoedas,classDaMoeda) =>{

    if (valorMoeda == 10 || valorMoeda == 25 || valorMoeda ==50 || valorMoeda == 1) {
      for (let index = 0; index < numeroMoedas; index++) {
          const moedas = document.createElement("img");
          moedas.src = `../img/0_${valorMoeda}.jpg`
          moedas.classList.add = classDaMoeda
          containerMoedas.appendChild(moedas)
          containerMoedas.appendChild(tagBr)               
        }
        
    }
      
}
