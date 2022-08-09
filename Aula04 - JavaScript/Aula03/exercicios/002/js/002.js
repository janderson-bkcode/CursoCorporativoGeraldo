const frm = document.querySelector("form")
const resp  = document.querySelector("h3")
const velocidadeP =  Number(frm.inVelocidadeP.value)
const velocidadeC = Number(frm.inVelocidadeC.value)

frm.addEventListener("submit",(e)=>{

         e.preventDefault()
        if(velocidadeC <= velocidadeP){
            resp.innerText = `Sem multa`
        
        }
        if(velocidadeC == (velocidadeP * 1.20)){

            resp.innerText = `Multa Leve`
        }
        else {
                
            resp.innerText = `Multa Grave`
        }
       
})
