//Cria referência ao form e ao elemento h3(onde sera exibida a resposta)

const frm = document.querySelector("form")
const resp = document.querySelector("h3")


frm.addEventListener("submit",(e)=>{
    const nome = frm.InNome.value
    resp.innerHTML = `Olá ${nome}`
    e.preventDefault()
})