const frm = document.querySelector("form")
const respNome = document.querySelector("span")
const respLista = document.querySelector("pre")

const pacientes =[]


frm.addEventListener("submit",(e)=>{
    e.preventDefault();

    const nome = frm.inPaciente.value
    pacientes.push(nome)
    let lista =""

    // for (let index = 0; index < pacientes.length; index++) {
    //     lista += `${i+1}º ${pacientes[i]}\n`
        
    // }


    pacientes.forEach((pacientes,i)=>{
        lista += `${i+1}º ${pacientes}\n`
    });

    respLista.innerText = lista
    frm.inPaciente.value = ""
    frm.inPaciente.focus()
})