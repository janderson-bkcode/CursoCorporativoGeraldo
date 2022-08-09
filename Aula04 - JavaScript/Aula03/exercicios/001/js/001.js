const frm = document.querySelector("form")
const resp  = document.querySelector("h3")


frm.addEventListener("submit",(e)=>{
    e.preventDefault()
    const numero = Number(frm.inNumero.value)
    var parImpar = numero %2 ==0?resp.innerText = `par`:resp.innerText = `Impar`

})
