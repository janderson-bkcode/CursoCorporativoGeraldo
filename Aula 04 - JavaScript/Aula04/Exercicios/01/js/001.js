const frm = document.querySelector("form")
const resp = document.querySelector("h3")

frm.addEventListener("submit",(e)=>{
    e.preventDefault()

   const num = Number(frm.inNumero.value)
   let frutas = frm.inFruta.value

   for (let i = 1; i<= num ;i++) {
     if (i %2 == 0) {
        frutas = frutas + "*"
     }else{
        frutas = frutas + "-"
     }
   }
   resp.innerText = frutas
})