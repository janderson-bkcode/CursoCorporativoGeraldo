
const document = frm.document.querySelector("frm")
const resp = frm.document.querySelector("#outResp")


frm.addEventListener("submit", (e) => {
    e.preventDefault()                   
    const aluno = frm.inAluno.value

    if (!validarNome(aluno)) {
      alert("Informe o nome completo do aluno")
      frm.inAluno.focus()
      return
    }
    resp.innerText = "Senha: " + pegarSobrenome(aluno) + conteVogais(aluno)
  })
  
const validarNome = (nome) => nome.includes(" ");


const pegarSobrenome = (nome) => {
    const espacoFinal = nome.lastIndexOf(" ")
    return nome.substr(espacoFinal + 1).toLowerCase()
  }
  
  const conteVogais = (nome) => {
    let numero = 0
    for (const letra of nome) {
      const letraVogal = letra.toUpperCase()
      if (letraVogal == "A" || 
          letraVogal == "E" || 
          letraVogal == "I" || 
          letraVogal == "O" || 
          letraVogal == "U") {

        numero++
      }
    }
    return numero < 10 ? "0" + numero : numero
  }