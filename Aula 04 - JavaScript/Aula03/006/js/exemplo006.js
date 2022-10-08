const frm = document.querySelector("form")
const resp  = document.querySelector("h3")
const campos = document.querySelector("input")
frm.addEventListener("submit",(e)=>{
 e.preventDefault();

    const nome = frm.inNome.value
    const masculino = frm.inMasculino.checked
    const altura = Number(frm.inAltura.value)

    let peso
    if(masculino){

        peso = 22* Math.pow(altura,2)
    }
    else{
        peso = 21 * Math.pow(altura,2)
    }

    resp.innerText = `${nome} : Seu Peso ideal é ${peso.toFixed(2)} kg`
});

function limparCampos(){
    resp.innerText = "";
}


