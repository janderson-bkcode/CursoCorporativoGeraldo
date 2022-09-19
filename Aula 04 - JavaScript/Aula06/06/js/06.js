const frm = document.querySelector("form") // obtém elementos da página
const resp = document.querySelector("h3")

frm.addEventListener("submit", (e) => {
  e.preventDefault() // evita envio do form

  const senha = frm.inSenha.value
  const erros = []

  if(senha.length <8 || senha.length>15){
    erros.push("Senha deve ter entre 8 e 15 caracteres")
  }

  if(senha.match(/[0-9]/g)==null){
    erros.push("possuir numeros (no mínimo,1)")
  }

  if(!senha.match(/[a-z]/g)){
    erros.push("possuir letras minusculas (no minimo 1)")
  }

  if(!senha.match(/[A-Z]/g)|| senha.match(/[A-Z]/g).length == 1){
    erros.push("possuir letras maiusculas (no minimo 1)")
  }

  if(!senha.match(/[\w]/g)){
    erros.push("possuir simbolos (no minimo 1)")
  }

  if(erros.length == 0){
    resp.innerText = "OK !Senha Valida"
  }else{
    resp.innerText = `Erro ... A senha deve ${(erros.join(","))}`
  }
})
