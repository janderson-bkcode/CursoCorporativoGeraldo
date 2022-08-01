const frm = document.querySelector("form")
const resp = document.querySelector("#outResp1")
const resp2 = document.querySelector("#outResp2")

frm.addEventListener("submit",(e)=>{

    const produto = frm.inProduto.value
    const preco = Number(frm.inPreco.value)

    const produtoDesc = preco *0.5

    const promocao  = (preco *2) + produtoDesc

 


    resp.innerText = `Promoção Levando 3 por R$: ${promocao.toFixed(2)}`
    resp2.innerText = `O terceiro Produto R$: ${produtoDesc.toFixed(2)}`

    e.preventDefault();

})


