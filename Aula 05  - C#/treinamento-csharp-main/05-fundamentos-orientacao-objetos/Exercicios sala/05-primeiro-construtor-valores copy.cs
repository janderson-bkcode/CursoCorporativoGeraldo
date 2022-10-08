namespace ExemplosLP
{
    public class Produto
    {
        public string Nome { get; set; }
        public decimal Valor { get; set; }
        public int Quantidade { get; set; }
        public bool Status { get; set; }

        public Produto(string nome, decimal valor, int quantidade, bool status)
        {
            Nome = nome;
            Valor = valor;
            Quantidade = quantidade;
            Status = status;
        }

        public decimal ValorTotal()
        {
            return Valor * Quantidade;
        }

        public void AdicionarQuantidadeEstoque(int quantidade)
        {
            Quantidade += quantidade;
        }

        public void RemoverQuantidadeEstoque(int quantidade)
        {
            Quantidade -= quantidade;
        }
    }
}

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

// imprimir os dados com toString ou com as propriedades
Console.WriteLine($"Dados do produto: {produto}");

// adiciona quantidade

// imprime

// remove quantidade

// imprime
