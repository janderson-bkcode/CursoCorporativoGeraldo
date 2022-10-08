# Um pouco mais sobre C#

Neste capitulo vamos entender sobre alguns outros recursos muito importantes dentro do dotnet e C#.

Vamos entender o que sao e como utilizar array, vamos entender o que sao tipo genericos e como utiliza-los na pratica e tambem vamos brincar com listas, list, lambda e etc.

## Array

Uma array nada mais eh do que uma estrutura de dados que contem um conjunto de elementos representados pelo mesmo tipo de dado, onde podemos acessar cada um desses elementos atraves de um indice (um numero inteiro).

Um array de uma dimensao eh conhecido como vetor e um array com mais de uma dimensao eh conhecido como matriz.

Vamos entender alguns conceitos gerais sobre arrays.

- O tamanho de um array (Quantidade de elementos que ele suporta) sao estabelecidos na sua criacao.

- O valores padroes dos campos de um array eh definido de acordo com o tipo que utilizamos para cria-la, para tipos reference type o valor padrao eh null e para value types o valor padrao do tipo declarado eh assumido.

- O primeiro elemento de um array pode ser acessado atraves do indice 0.

- Um array/matriz eh um tipo de referencia.

Vamos entender como criar alguns arrays: 

```C#
int[] valores; // declarando um array de qualquer tamanho
valores = new int[5]; // atribuindo uma instancia de array com 5 elementos
valores = new int[50]; // atribuindo uma instancia de array com 50 elementos

valores[0] = 999; // atribuindo valor na primeira posicao do array
valores[1] = 1000;// atribuindo valor na segunda posicao do array
```

Podemos instanciar/criar um array de algumas formas, vejamos algumas a seguir: 

```C#
// declarando e depois instanciando um array
int[] valores; 
valores = new int[5]; 

// definindo seu tamanho
int[] valores = new int[5]; 

// definindo seu tamanho e inicianlizando os elementos
int[] valores = new int[3] { 1, 2, 3 };

// inicianlizando os elementos sem informar o tamanho
int[] valores = new int[] { 1, 2, 3 };

// inicianlizando os elementos sem utilizar o new
int[] valores = { 1, 2, 3 };
```

### Percorrendo os elementos de um array

Agora imagine que o nosso array tem um tamanho de 1000 elementos, e que para cada elemento desse temos que adicionar uma unidade ao seu valor, como poderiamos resolver isso? Vejamos uma solucao "inocente e trabalhosa" : 

```C#
int[] milElementos = new int[1000] {1, 2, 3 ......etc}

milElementos[0] = milElementos[0] + 1;
milElementos[1] = milElementos[1] + 1;
milElementos[2] = milElementos[2] + 1;
milElementos[3] = milElementos[3] + 1;

// ...... etc
```

Imagina fazer isso para os mil elementos? Muito trabalho.

Vamos resolver isso de uma forma mais elegante, lembra dos lacos de repeticao? Bora utiliza-los para resolver esse problema.

```C#
int[] milElementos = new int[1000] {1, 2, 3 ......etc}

for (int i = 0; i < milElementos.Length; i++)
{
    milElementos[i] = milElementos[i] + 1;
}
```

Conseguir enxergar a solucao? Muito mais simples nao? 

Percorremos cada indice do array com o nosso indice do laco "for", se olhar com carinho vai ver que o limite de execucao do for corresponde ao tamanho do nosso array e a cada nova iteracao avancamos um indice e somamos o valor +1.

Tambem podemos percorrer arrays com o While, Do e com o Foreach. Mas por enquanto vamos apenas utilizar o for e com o tempos vamos treinando utilizaer as outras estruturas de dados na pratica.

## Generics

Microsoft:
Os genéricos introduz o conceito de parâmetros de tipo para .NET, o que possibilita criar classes e métodos que adiam a especificação de um ou mais tipos até que a classe ou o método seja declarado e instanciado pelo código do cliente.

Onde podemos usar Generics:
- Classes
- Interfaces
- Metodos
- Eventos
- Delegates

Muitas vezes, precisamos utilizar o tipo de dados de uma variavel ou de uma classe para determinar alguma logica, utilizando generics isso pode parecer complicado de se fazer, mas as informações sobre os tipos que são usados em um tipo de dado genérico podem ser obtidas no tempo de execução por meio de reflexão.

Exemplo no [MIRO](https://miro.com/app/board/o9J_l951cMY=/)

## List<T>, LINQ e Lambda

### LIST

O tipo List representa uma lista fortemente tipada, que podem ser acessados via indice. List eh um tipo generico e nesta classe contem diversas funcoes para classificar e manipular listas. 

Ao longo desse capitulo vamos ver exemplos de como trabalhar com uma classe List<T> e a realizar operacoes LINQ nesta classe.

### LINQ 

LINQ nada mais eh do que um conjunto de tecnologias com base na integracao de recursos de consulta diretamente na linguagem C#. 

Com a implementacao do LINQ, nao precisamos mais depender de uma linquagem de consulta como o SQL e estar susetivel a erros como digitacao errada na string da consulta.

Com a implementacao no LINQ agora temos um sintaxe unificada, idenpendente da fongte de dados que estamos realizando a consulta a sintaxe eh a mesma e eh provider daquela fonte de dados se vira para implementar a consulta corretamente.

Com o LINQ tamebm temos a ajuda do intelisense e verificacao do tipo em tempo de desenvolvimento.

Realizar consultas com LINQ consistem em 3 operacoes.

- Obter uma fonte de dados (Banco de dados, XML, JSON).
- Criar uma consulta
- Executar a consulta

Quando pensamos na execucao na consulta temos que ter alguns conceitos bem claros, podemos trabalhar de duas formas.

- Execucao adiada
    - A variavel apenas armazena os comandos da consulta, ou seja, a execucao real da consula eh adiada ate que voce itere sobre a variavel ou acione alguns metodos LINQ.

- Execucao imediata
    - Podemos realizar a execucao imediata executando funcoes de agregacao como: First, Max, Sum.
    - Podemos tambem utilizar os metodos .ToList(), ou .ToArray() por exemplo.

#### Em que tipo de variavel podemos executar uma consulta LINQ?

Basicamente, para podermos utilizar o LINQ basta a fonte de dados implementar a interface generica IEnumerable<T> ou alguma interface derivada.

Tipos que podemos realizar consultas LINQ sao chamados de "Tipos passiveis de consulta."

#### Formas de realizar consultas LINQ

Podemos realizar consultas LINQ de duas formas: 

- Consultas baseadas em metodos de extensao.
- Sintaxe de expressao de consulta. (Parecido com o SQL)

Vamos praticar e entender como que funciona algumas partes do LINQ.

# Referencias

- [Documentacao Oficial .NET - Matrizes](https://docs.microsoft.com/pt-br/dotnet/csharp/programming-guide/arrays/)