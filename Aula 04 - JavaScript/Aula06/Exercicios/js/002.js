const frm = document.querySelector("form") 
const resp = document.querySelector("h3")

frm.addEventListener("submit", (e) => {        
  e.preventDefault()                             
  const frase = frm.inFrase.value.toUpperCase()   
  const frase2 = frase.replace(/\s/g, "")
  const tam = frase2.length
  const metade = tam / 2
  const ultimo = tam - 1
  let iguais = true

  for (let i = 0; i < metade; i++) {
    if (frase2[i] != frase2[ultimo - i]) {
      iguais = false
      break
    }
  }  
  if (iguais){
    resp.innerText = `É palindromo`
  }else{
    resp.innerText = `Não é Palindromo`
  }
})
