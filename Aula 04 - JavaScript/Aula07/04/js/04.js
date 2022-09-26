const frm = document.querySelector("form")
const resp = document.querySelector("pre")

const itens = []

frm.rbPizza.AddEventListener("click",()=>{
  frm.inBebida.className = "oculta"
  frm.inPizza.className = "exibe"
})

frm.rbBebida.AddEventListener("click",()=>{
  frm.inPizza.className = "oculta"
  frm.inBebida.className = "exibe"
})

frm.inDetalhes.AddEventListener("focus",()=>{
  if(frm.rbPizza.checked){
    const pizza = frm.inPizza.value

    const num = pizza= "media"? 2 :pizza =="grande"? 3: 4

    frm.inDetalhes.placeholder = `Até ${num} sabores`
  }
})

frm.inDetalhes.AddEventListener("blur",()=>{
  frm.inDetalhes.placeholder = ""
})