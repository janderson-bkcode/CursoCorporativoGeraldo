const amigos  = [{nome:"Ana",idade:20},
                 {nome:"Bruno",idade:17},
                 {nome:"Cátia",idade:25}
                ]

const amigos2 = amigos.map(aux =>({nome: aux.nome,nasc:2022 - aux.idade}))

for(const amigo of amigos2){
    console.log(`${amigo.nome} - Nasceu em ${amigo.nasc}`);
}