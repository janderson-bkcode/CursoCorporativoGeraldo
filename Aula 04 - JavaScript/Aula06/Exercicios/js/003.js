const frm = document.querySelector("form") 
const resp1 = document.querySelector("#outDataLimite")
const resp2 = document.querySelector("#outComDesconto")

frm.addEventListener("submit", (e) => {         
  e.preventDefault()                             

  const data = frm.inData.value
  const valor = Number(frm.inValor.value)


  const dataLimite = new Date()


  const partes = data.split("-")

  dataLimite.setDate(Number(partes[2]))
  dataLimite.setMonth(Number(partes[1]) - 1)
  dataLimite.setFullYear(Number(partes[0]))

  const dia = dataLimite.getDate()   

  dataLimite.setDate(dia + 90)      
  const mes = dataLimite.getMonth() + 1
  const ano = dataLimite.getFullYear()

  const comDesconto = valor * 0.80

  resp1.innerText = "Data Limite para Pagto com Desconto: " + (dia < 10 ? "0" + dia : dia) + "/" + (mes < 10 ? "0" + mes : mes) + "/" + ano
  resp2.innerText = "Valor com Desconto R$: " + comDesconto.toFixed(2)
})
