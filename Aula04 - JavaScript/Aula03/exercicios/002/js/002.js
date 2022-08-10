const frm = document.querySelector("form")
const resp = document.querySelector("h3")
const velocidadePermitida = Number(frm.inVelocidadeP.value)
const velocidadeCondutor = Number(frm.inVelocidadeC.value)
const velocidadeDaMulta = velocidadePermitida * 1.2
frm.addEventListener("submit", (e) => {

    e.preventDefault()

    if (velocidadeCondutor <= velocidadePermitida) {
        resp.innerText = `Sem multa`


    } else if (velocidadeCondutor <= velocidadeDaMulta) {
        resp.innerText = `Multa Leve`
    } else {

        resp.innerText = `Multa Grave`
    }

})