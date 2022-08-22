const prompt = require("prompt-sync")()
console.log("Programa Anos de Copa do Mundo\nDigite 0 para sair")

do {
    const ano = Number(prompt("Digite o Ano:"))
    if (ano ==0) {
        break
    }else if(ano == 1942 || ano == 1946)
        console.log(`Não houve copa em ${ano} Segunda Guerra Mundial`);
    else if( ano >= 1930 && ano %4 ==2){
        console.log(`Sim o ano ${ano} é ano de copa do Mundo`);
    }else{
        console.log(`Não, o ano ${ano} não é ano de copa do mundo`);
    }
} while (true);