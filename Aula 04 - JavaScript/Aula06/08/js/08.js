const frm = document.querySelector("form") // obtém elementos da página
const resp = document.querySelector("h3")
const taxa_multa = 2 / 100
const taxa_juros = 0.33 / 100

frm.addEventListener("submit", (e) => {
  e.preventDefault() // evita envio do form
  const dataVenc = frm.inDataVenc.value
  const valor = Number(frm.inValor.value)
  const hoje = new Date()
  const vencto = new Date()

  const partes = dataVenc.split("-")
  vencto.setDate(Number(partes[2]))
  vencto.setMonth(Number(partes[1])-1)
  vencto.setFullYear(Number(partes[0]))

  const atraso = hoje-vencto
  let multa = 0
  let juros = 0

  if (atraso >0){
    
    const dias = atraso / 86400000
    multa = valor * taxa_multa
    juros = valor * taxa_juros * dias
  }

  const total = valor + multa + juros

  frm.outMulta.value = multa.toFixed(2)
  frm.outJuros.value = juros.toFixed(2)
  frm.outTotal.value = total.toFixed(2)
  
 
})
