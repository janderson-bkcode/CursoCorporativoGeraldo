const frm = document.querySelector("form")
const resp = document.querySelector("h3")
const resp2 = document.querySelector("h4")


frm.addEventListener("submit", (e) => {
    const moeda = Number(frm.inMoeda.value)
    var troco;

    e.preventDefault()

    if (moeda < 1) {
        resp.innerText = `Valor Insuficiente .Digite a partir de 1 Real`
    } else if (moeda >= 3) {
        troco = moeda - 3;
        resp.innerText = `Tempo : 120 minutos`;
        resp2.innerText = `Troco de ${troco.ToFixed(2)}`;
    } else if (moeda >= 1.75) {
        troco = moeda - 1.75;
        resp.innerText = `Tempo : 60 minutos`;
        resp2.innerText = `Troco de ${troco.ToFixed(2)}`;
    } else {
        troco = moeda - 1;
        resp.innerText = `Tempo : 30 minutos`;
        resp2.innerText = `Troco de ${troco.ToFixed(2)}`;
    }

})