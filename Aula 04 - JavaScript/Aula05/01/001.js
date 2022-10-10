const cidades = ['Sâo Paulo','Ribeirão Preto','aaa']

for(let i = 0; i < cidades.Length; i++){
 console.log(cidades[i])
}

console.log("-".repeat(40))
console.log(cidades.toString())
console.log(cidades.join(" - "))

cidades.forEach((cidades,i)=>{
  console.log(`${i+1}ª  Cidade:${cidades}`)
});

for(item of cidades){
    console.log(item)
}
for(item in cidades){
    console.log(item)
}
for(item in cidades){
    console.log(cidades[item])
}

