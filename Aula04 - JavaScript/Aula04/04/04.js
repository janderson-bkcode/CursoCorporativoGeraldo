alert ("Digite 0 para sair")

do {
    const num = Number(prompt("Número:"))

    if (num == 0 || isNaN(num)) {
        const sair = confirm("Confirmar Saída?")

        if (sair) {
            break
        }else{
            continue
        }
    }

    if(num %2 == 0){
        alert(`O dobro de ${num} é: ${num *2}`)
    }else{
        alert(`O Triplo de ${num} é: ${num *3}`)
    }
} while (true);
alert("Bye Bye ...")