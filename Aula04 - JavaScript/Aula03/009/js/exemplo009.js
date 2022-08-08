const frm = document.querySelector("form")
const resp  = document.querySelector("#outResp1")
const resp2  = document.querySelector("#outResp2")
const resp3  = document.querySelector("#outResp3")

frm.addEventListener("submit",(e)=>{
    e.preventDefault()
    const saque  = Number(frm.inSaque.value)

    if(saque % 10 != 0){
        alert("Valor inválido para notas disponíveis (R$ 10,50,100)")
        frm.inSaque.focus()
        return;
    }
})

