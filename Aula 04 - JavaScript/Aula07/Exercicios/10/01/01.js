const frm = document.querySelector("form") 
const InputMoeda = document.querySelector("inSomaMoeda") 
const containerMoedas = document.getElementById("moedas")
const tagBr = document.createElement("br")

window.addEventListener("DOMContentLoaded", (e) => {
    e.preventDefault()
    gerarMoedas(10,RamdomMoedas(10,6),"moeda10");
    gerarMoedas(25,RamdomMoedas(25,6),"moeda25");
    gerarMoedas(50,RamdomMoedas(50,6),"moeda50");
    gerarMoedas(1,RamdomMoedas(1,6),"moeda1");
});

frm.addEventListener("submit",(e)=>{
    e.preventDefault()
    const moedas = containerMoedas.querySelectorAll("img") 
    let totalMoedas = 0
    const soma = Number(frm.inSomaMoeda.value)    
    for (const moeda of moedas) {     
      switch(moeda.className){
        case "moeda10":
            totalMoedas += 0.10 
            break;
        case "moeda50":
            totalMoedas += 0.50
            break;
        case "moeda25":
            totalMoedas += 0.25
            break;
        default:
            totalMoedas += 1
        break;
      }
    }
    if (soma == totalMoedas.toFixed(2) ) {
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
          moedas.className = classDaMoeda
          containerMoedas.appendChild(moedas)
          containerMoedas.appendChild(tagBr)               
        }        
    }
    else{      
        throw "Moeda Inválida"
    }   
}
const RamdomMoedas = (moeda,qutMoedas) => {
    return moeda = Math.ceil(Math.random() * qutMoedas)  
}

