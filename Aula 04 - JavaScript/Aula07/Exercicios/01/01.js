const frm = document.querySelector("form")
const resp = document.querySelector("pre")


frm.addEventListener("submit",(e)=>{

e.preventDefault()

const atleta = frm.inAtleta.value
const idade = frm.inIdade.value

const tracos =  RetornarTracos(atleta)
const categoria = categorizarAluno(idade)

  resp = `Atleta ${tracos} categoria ${categoria}`
})


const RetornarTracos = (nome) =>{
  let tracos = "";

  for(letra of nome){
    if(letra != " "){
      tracos += "-"
    }else{
      tracos += " "
    }
    return tracos
  }

}
const categorizarAluno = (idade)=>{
  var categoria
  if (idade <=12) {
    categoria ="Infantil"
  }
  else if(idade >12 && idade <=18){
    categoria = "Juvenil"
  }
  else{
    categoria = "Adulto"
  }
  return categoria
}