const frm = document.querySelector("form")
const resp = document.querySelector("h3")


frm.addEventListener("submit", (e) => {
    const LadoA = Number(frm.inLadoA.value)
    const LadoB = Number(frm.inLadoB.value)
    const LadoC = Number(frm.inLadoC.value)
    e.preventDefault()
    if (LadoA + LadoB > LadoC && LadoA + LadoC > LadoB && LadoB + LadoC > LadoA) {
        resp.innerText = `Os três Lados Formam um Triângulo`

        if (LadoA == LadoB && LadoA == LadoC) {

            resp.innerText = `Triângulo Equilátero`
        } else {
            if (LadoA == LadoB || LadoA == LadoC || LadoB == LadoC) {
                resp.innerText = `Triângulo Isósceles`
            } else {
                resp.innerText = `Triângulo Escaleno`
            }
        }
    } else {
        resp.innerText = `Os três Lados Não Formam um Triângulo`
    }

})