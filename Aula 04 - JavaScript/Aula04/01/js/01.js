const frm = document.querySelector("form")
const resp = document.querySelector("pre")

frm.addEventListener("submit",(e)=>{
    e.preventDefault();

    const numero = Number(frm.InNumero.value)

    let resposta = ""

    for (let i = 0;  i <= 9; i++) {
        resposta +=numero + "x" + i + "=" + (numero *i)+ "\n"
        
    }

    resp.innerText = resposta
})