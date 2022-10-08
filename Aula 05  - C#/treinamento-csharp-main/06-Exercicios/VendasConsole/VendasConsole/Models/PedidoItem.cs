using System.Runtime.CompilerServices;

namespace VendasConsole.Models;

public class PedidoItem
{
    public Guid Id { get; private set; }
    public Guid PedidoId { get; private set; }
    public Guid ProdutoId { get; private set; }
    public string NomeProduto { get; private set; }
    public int Quantidade { get; private set; }
    public decimal Valor { get; private set; }

    public PedidoItem(Guid produtoId, Guid pedidoId, string nomeProduto, int quantidade, decimal valor)
    {
        Id = new Guid();
        PedidoId = pedidoId;
        ProdutoId = produtoId;
        NomeProduto = nomeProduto;
        Quantidade = quantidade;
        Valor = valor;
    }

    public decimal CalcularValorTotal() => Quantidade * Valor;

    public void AtualizarQuantidade(int quantidade) => Quantidade = quantidade;
}