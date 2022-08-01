const frm = document.querySelector("form")
const resp = document.querySelector("h3")

frm.addEventListener("submit",(e)=>{

    const medicamento = frm.inMedicamento.value
    const preco = Number(frm.inPreco.value)

    const promocao = Math.floor(preco * 2);


    resp.innerText = `leve 2 por apenas R$: ${promocao.toFixed(2)}`

    e.preventDefault();

})


