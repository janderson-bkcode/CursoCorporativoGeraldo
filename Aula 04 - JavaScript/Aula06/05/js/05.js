const frm = document.querySelector("form") // obtém elementos da página
const resp = document.querySelector("h3")

frm.addEventListener("submit", (e) => {
  e.preventDefault() // evita envio do form
  const funcionario = frm.inFuncionario.value

  const partes  = funcionario.split(" ")
  let email =""
  const tam = partes.length

  for (let index = 0; index < tam -1; index++) {
    
    email+= partes[index].charAt(0)
  }

  email +=partes[tam-1] + "@empresa.com.br"

  resp.innerText = `Email :${email.toLowerCase()}`
})
