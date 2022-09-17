# Fundamentos de orientacao a objetos

Ja sabemos e orientacao objetos eh um paradigma de programacao baseado no conceitos de objetos.

Sabemos tambem que existem diversos paradigmas como o funcional, imperativo, orientado a objetos e entre outros.

O principal intuito de se ter criado a orientacao a objetos era de aproximar nossos programas das coisas do mundo real, por isso chamamos de "objeto", algo generico o suficiente para representar qualquer coisa do mundo real.

## Classes e objetos

Antes de comecarmos a entender os "Pilares da orientacao a objetos", vamos dar um passo atras e entender primeiramente o que eh essa tal de "classe" e o tal do "objeto".

Para entender melhor vamos modelar um carro e aplicar os conceitos acima.

Imagina que queremos comprar um carro  e vamos fazer uma lista com todas as caracteristicas que desejamos que esse carro tenha, a minha lista ficaria mais ou menos assim: 

Carro: 

- Possuir 4 rodas
- Possuir 4 portas
- Cambio automatico
- Ter a cor preta

Essas sao algumas das caracteristicas que desejo no carro, sabemos que o carro vem por "padrao" com algumas funcionalidades como: 

- Acelerar
- Freiar
- Businar
- Aparelho multimidia e etc

Beleza, escolhemos como o nosso carro precisar ser para atender a minha necessidade.

O que acabamos de fazer aqui foi criar a nossa classe, ou seja, um conjunto de caracteristicas e comportamentos que definem o carro que queremos. 

Beleza, mas o que seria esse objeto? O carro em si, fisico, com todas as caractertisticas e pronto para andar.

Mas como podemos criar isso em um programa, e como a parte fisica se comporta?

Para criar uma classe que represente um carro em C#, podemos fazer assim: 

```C#
public class Carro {

    public int QuantidadeRodas {get; set;}
    public int QuantidadePortas {get; set;}
    public bool PossuiCambioAutomatico {get; set;}
    public Cor Cor {get; set;}

    public void Acelerar(){
        // ..... implementacao
    }

    public void Businar(){
        // ..... implementacao
    }
}

public enum Cor {
    Preto,
    Verde,
    Azul,
    Amarelo
}
```

Pronto, acabamos de criar nossa classe "Carro", ou seja, uma estrutura de dados que representa um carro.

Mas entao, o que seria o objeto? Ja que eh impossivel criar um carro real pelo computador? 

Precisamos agora abstrair o conceito, estamos criando um programa de computador e queremos representar uma regra de negocio com o carro.

Entao, quando estamos criando um "objeto", estamos criando um carro na memoria do nosso computador.

Por exemplo, quero criar um carro no nosso programa com a cor azul, como podemos fazer isso? 

```C#
var carroAzul = new Carro();
carroAzul.Cor = Cor.Azul;
```

Dessa forma, criamos um objeto na memoria do nosso computador e atribuimos a esse objeto a cor azul.

## Atributos e metodos

Ainda utilizando o exemplo anterior, vamos entender o que sao atributos e metodos.

### Atributos

Os atributos sao as caracteristicas do nosso carro, como por exemplo a cor, rodas, se possui piloto automatico e etc.

Atributos se assemelham com "Variaveis", porem eles possuem algumas outras caracteristicas que vamos aprender a frente.


### Metodos

Metodos nada mais eh do que o comportamento do nosso objeto, por exemplo, acelerar, freiar, businar e etc.

Um metodo se assemelha com uma funcao, porem, um metodo pertence a uma classe.

## Pilates da orientacao a objetos

Os pilares da orientacao a objetos sao: Abstracao, Encapsulamento, Heranca e Polimorfismo.

### Abstracao

Abstracao nada mais eh do que a capacidade de extrair informacoes do problema que estamos querendo resolver. 

Imaginem que estamos criando um programa para um e-commerce, podemos abstrair desse contexto os produtos, vendas, frete, pagamentos e entre outras coisas. Ou seja, estamos abstraindo um problema do mundo real e criando uma solucao para isso, trazendo apenas as informacoes que importam para o contexto do nosso problema.

Podemos abstrair na criacao de nossas classes, na criacao dos nossos metodos, atributos e entre outras coisas.

O conceito de abstracao abrange varias areas da tecnologia e aprender a usar isso ao nosso favor eh de grande importancia para nossa carreira.

### Encapsulamento

Quando projetamos as nossas classes, eh de estrema importancia garantir que as informacoes que estao naquela classe corresponda ao cenario que estamos utilizando, ou seja, o "estado" da nossa classe tem que ser preservado.

Precisamos garantir que quem utilizar essa classe, consiga ver apenas o necessario e tambem manipular apenas o necessario.

Mas como garantir todas essa "restricao" de acesso e modificacao? Simples, encapsulando.

O encapsulamento basicamente consiste restringir ou nao a manipulacao informacoes de dentro da nossa classe.

E como podemos fazer isso em C#? Utilizando os modificadores de acesso.

Em C# possuimos varios modificadores de acesso, alguns deles sao: 

- Private
    - Mantem a informacao visivel somente para a classe em que ela foi declarava, somente essa classe pode visualizar e alterar.

- Public
    - Toda a informacao fica disponivel para quem utilizar a classe, podendo ler e alterar a informacao.

- Protected
    - Toda a informacao fica disponivel para a classe e para quem herdar desta mesma classe, podendo ler e alterar a informacao.

- Internal
    - Toda a informacao fica disponivel para quem utilizar a classe dentro do mesmo assembly/projeto, podendo ler e alterar a informacao.

Esses modificadores podem ser utilizados em classes, metodos, atributos, enum e etc.

Em classes ainda podemos combinar alguns moficadores, mas nao vamos abordar isso pode agora, fica como curiosidade.

### Heranca

Heranca nada mais eh do que a capacidade de uma classe, herdar os atributos de uma outra classe. O conceito parece simples, mas ao utiliza-lo podemos aplicar uma serie de funcionalidades a mais em nossas classes.

Imagina que temos uma classe pessoa e ela possui apenas uma propriedade nome.

```C#
public class Pessoa 
{
    public string Nome { get; set; }
}
```

E agora precisamos de uma representacao de uma pessoa juridica e de uma pessoa fisica.

Poderiamos adicionar as propriedades na classe pessoa, mas isso nao seria uma ma pratica.

Uma boa pratica nesse exemplo ficticio seria criar duas classes que representem uma pessoa fisica e uma juridica, dessa forma: 

```C#
public class PessoaFisica
{
    public string Cpf { get; set; }
}

public class PessoaJuridica
{
    public string Cnpj { get; set; }
}
```
 Mas e a propriedade nome? Precisariamos adicionar em cada classe? Nao, podemos utilizar o recurso da heranca, onde as classes PessoaFisica e PessoaJuridica "herdam" a propriedade nome da classe Pessoa, dessa forma: 

```C#
public class PessoaFisica : Pessoa
{
    public string Cpf { get; set; }
}

public class PessoaJuridica : Pessoa
{
    public string Cnpj { get; set; }
}
```

Nesse contexto  a classe Pessoa eh chamada de classe Pai ou entao de classe base.

As classes PessoaFisica e PessoaJuridica, sao chamadas de classes filha ou subclasses.

Dessa forma, podemos acessa a propriedade nome em uma intancia de pessoa fisica e juridica, assim: 

```C#
var pessoaFisica = new PessoaFisica();

pessoaFisica.Nome = "Willian Menezes";
```

Ou seja, realizamos o conceito de heranca em nossas classes.

Mas as nossa subclasses herdan apenas os atributos? Nao, podemos herdar tambem metodos da classe Pai.

Vamos criar um metodo na classe Pessoa.

```C#
public class Pessoa
{
    public string Nome { get; set; }

    public void ImprimirDados()
    {
        Console.WriteLine($"Nome: {Nome}");
    }
}

// executando o metodo da classe pessoa

var pessoa = new Pessoa();
pessoa.Nome = "Willian Menezes";
pessoa.ImprimirDados(); // saida -> Willian Menezes
```

Realizando a heranca nas subclasses, esse mesmo metodo funcionaria tranquilamente em ambas as subclasses, vejamos um exemplo: 

```C#
public class PessoaFisica : Pessoa
{
    public string Cpf { get; set; }

    public void ImprimirDados()
    {
        Console.WriteLine($"Nome: {Nome}");
    }
}

// executando o metodo da classe pessoa

var pessoa = new PessoaFisica();
pessoa.Nome = "Willian Menezes";
pessoa.ImprimirDados(); // saida -> Willian Menezes
```

Mas e se quisessemos alterar esse metodo, ou que para cada classe ele criasse um output diferente? Veremos isso no proximo topico.

### Polimorfismo

Polimorfismo eh um recurso que permite que variaveis de um mesmo tipo mais generico apotem para variaveis de tipos especificos diferentes, permitindo ter comportamentos diferentes de acordo com cada tipo.

Esse conceito se chama sobrescrita de metodo/propriedade e podemos fazer isso utilizando algumas palavras reservadas tanto na classe pai, quanto na subclasse.

Na classe pai, precisamos colocar em nosso metodo a palavra virtual.

Essa palavra, informa para nosso programa que o metodo pode ser sobrescrito, ou seja, ele pode ter uma outra implementacao nas classes que herdarem a classe pai. Vejamos um exemplo: 

```C#
public class Pessoa
{
    public string Nome { get; set; }

    public virtual void ImprimirDados()
    {
        Console.WriteLine($"Nome: {Nome}");
    }
}

public class PessoaFisica : Pessoa
{
    public string Cpf { get; set; }

    public override void ImprimirDados()
    {
        Console.WriteLine($"Nome: {Nome} - " + $"{Cpf}");
    }
}

// executando o metodo da classe pessoa
var pessoa = new Pessoa();
pessoa.Nome = "Willian Menezes";
pessoa.ImprimirDados(); // saida -> Willian Menezes

// executando o metodo da classe pessoa fisica
var pessoa = new PessoaFisica();
pessoa.Nome = "Willian Menezes";
pessoa.Cpf = "000.000.000-00";
pessoa.ImprimirDados(); // saida -> Willian Menezes - 000.000.000-00
```

Com isso, podemos sobrescrever os metodos que estao marcados com o virtual, e criar nossa propria implementacao na classe derivada.
