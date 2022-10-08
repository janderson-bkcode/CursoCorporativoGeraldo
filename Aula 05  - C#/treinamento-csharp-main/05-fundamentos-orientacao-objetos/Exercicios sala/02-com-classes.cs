namespace ExemplosLP
{
    public class Produto
    {
        public string Nome { get; set; }
        public decimal Valor { get; set; }
        public int Quantidade { get; set; }
        public bool Status { get; set; }
    }
}

using ExemplosLP;
using System.Globalization;

var produto01 = new Produto();
var produto02 = new Produto();

//inputando dados
Console.WriteLine("Entre com o nome, preco, quantidade, valor e status (1 - Ativo, 2 - Inativo) do primeiro produto.");
produto01.Nome = Console.ReadLine();
produto01.Valor = decimal.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
produto01.Quantidade = int.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
produto01.Status = Console.ReadLine() == "1" ? true : false;


Console.WriteLine("Entre com o nome, preco, quantidade, valor e status (1 - Ativo, 2 - Inativo) do segundo produto.");
produto02.Nome = Console.ReadLine();
produto02.Valor = decimal.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
produto02.Quantidade = int.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
produto02.Status = Console.ReadLine() == "1" ? true : false;

Console.WriteLine("");

// calculando o valor total de cada produto
decimal valorTotalProduto01 = produto01.Valor * produto01.Quantidade;
decimal valorTotalProduto02 = produto02.Valor * produto02.Quantidade;

// imprimindo dados dos produtos
Console.WriteLine($"Nome: {produto01.Nome}, Quantidade: {produto01.Quantidade}, Valor: {produto01.Valor:F2}, Status: {produto01.Status}");
Console.WriteLine($"Nome: {produto02.Nome}, Quantidade: {produto02.Quantidade}, Valor: {produto02.Valor:F2}, Status: {produto02.Status}");

Console.WriteLine();

// mostrando os valores
Console.WriteLine($"Valor total {produto01.Nome}: {valorTotalProduto01:F2}");
Console.WriteLine($"Valor total {produto02.Nome}: {valorTotalProduto02:F2}");

// valor total dos produtos
Console.WriteLine($"Valor total: {(valorTotalProduto01 + valorTotalProduto02):F2}");
