using ExemplosLP;
using System.Globalization;


//inputando dados
Console.WriteLine("Entre com o nome do produto.");
var nome = Console.ReadLine();

Console.WriteLine("Entre com o valor do produto.");
var valor = decimal.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

Console.WriteLine("Entre com a quantidade do produto.");
var quantidade = int.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

Console.WriteLine("Entre com o status (1 - Ativo, 2 - Inativo) do produto.");
var status = Console.ReadLine() == "1" ? true : false;

var produto = new Produto(nome, valor, quantidade, status);

Console.WriteLine("");

Console.WriteLine($"Dados do produto: {produto}");
