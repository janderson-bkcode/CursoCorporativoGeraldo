namespace ExemplosLP
{
    public class Produto
    {
        public string Nome { get; set; }
        public decimal Valor { get; set; }
        public int Quantidade { get; set; }
        public bool Status { get; set; }

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

var produto = new Produto();

//inputando dados
Console.WriteLine("Entre com o nome do produto.");
produto.Nome = Console.ReadLine();

Console.WriteLine("Entre com o valor do produto.");
produto.Valor = decimal.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

Console.WriteLine("Entre com a quantidade do produto.");
produto.Quantidade = int.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

Console.WriteLine("Entre com o status (1 - Ativo, 2 - Inativo) do produto.");
produto.Status = Console.ReadLine() == "1" ? true : false;


Console.WriteLine("");

// imprimir os dados com toString ou com as propriedades
Console.WriteLine($"Dados do produto: {produto}");
