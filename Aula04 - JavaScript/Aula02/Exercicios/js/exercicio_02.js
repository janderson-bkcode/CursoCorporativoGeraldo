const frm = document.querySelector("form")
const resp = document.querySelector("h3")

frm.addEventListener("submit",(e)=>{

    const minutos = Number(frm.inValor.value)
    const tempo = Number(frm.inUso.value)

    valor = Number(Math.ceil(tempo / 15))

    valor_final = valor * minutos;
 


    resp.innerText = `Valor a pagar R$: ${valor_final.toFixed(2)}`

    e.preventDefault();

})


