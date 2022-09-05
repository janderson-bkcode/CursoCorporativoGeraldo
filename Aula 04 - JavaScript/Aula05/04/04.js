
//Map
const amigos  = [{nome:"Ana",idade:20},
                 {nome:"Bruno",idade:17},
                 {nome:"Cátia",idade:25}
                ]

const amigos2 = amigos.map(aux =>({nome: aux.nome,nasc:2022 - aux.idade}))

for(const amigo of amigos2){
    console.log(`${amigo.nome} - Nasceu em ${amigo.nasc}`);
}

//Filter

const amigos3  = [{nome:"Ana",idade:20},
                 {nome:"Bruno",idade:17},
                 {nome:"Cátia",idade:25}
                ]

const amigos4 = amigos3.filter(aux => aux.idade >=21 || aux.nome.includes("B"))

for(const amigo of amigos4){
    console.log(`${amigo.nome} idade:${amigo.idade} anos`);
}


//Reduce

const amigos5  = [{nome:"Ana",idade:20},
                 {nome:"Bruno",idade:17},
                 {nome:"Cátia",idade:25}
                ]

const soma = amigos5.reduce((acumulador,amigo)=> acumulador + amigo.idade,0)
const todos = amigos.reduce((acumulador,amigo)=> acumulador + amigo.nome + " "," ")

console.log(`Soma: ${soma}`);
console.log(`Todos:${todos}`);