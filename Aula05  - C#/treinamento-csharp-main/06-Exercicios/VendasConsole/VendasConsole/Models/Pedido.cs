namespace VendasConsole.Models;

public class Pedido
{
    public Guid Id { get; private set; }
    public Guid ClienteId { get; private set; }
    public StatusPedido Status { get; private set; }
    public decimal ValorTotal { get; private set; }
    public DateTime DataCadastro { get; private set; }
    public List<PedidoItem> _itensDoPedido;
    public IReadOnlyCollection<PedidoItem> ItensDoPedido => _itensDoPedido;

    public Pedido(Guid clienteId)
    {
        _itensDoPedido = new List<PedidoItem>();
        DataCadastro = DateTime.UtcNow;
        Status = StatusPedido.Novo;
        ClienteId = clienteId;
    }

    public void AdicionarItemNoPedido(PedidoItem item)
    {
        PedidoItem itemEncontrado = null;
        foreach (var itemPedido in _itensDoPedido)
        {
            if (item.ProdutoId == itemPedido.ProdutoId)
            {
                itemEncontrado = itemPedido;
            }
        }

        if (itemEncontrado != null)
        {
            itemEncontrado.AtualizarQuantidade(item.Quantidade);
            itemEncontrado.CalcularValorTotal();
        }
        else
        {
            item.CalcularValorTotal();
            _itensDoPedido.Add(item);
        }

        CalcularValorTotal();
    }

    public void RemoverItemDoPedido(PedidoItem item)
    {
        PedidoItem itemEncontrado = null;
        foreach (var itemPedido in _itensDoPedido)
        {
            if (item.ProdutoId == itemPedido.ProdutoId)
            {
                itemEncontrado = itemPedido;
            }
        }

        if (itemEncontrado == null)
        {
            throw new Exception("Item nao encontrado.");
        }

        _itensDoPedido.Remove(itemEncontrado);
        CalcularValorTotal();
    }

    public void AtualizarQuantidadeItem(PedidoItem item, int quantidade)
    {
        PedidoItem itemEncontrado = null;
        foreach (var itemPedido in _itensDoPedido)
        {
            if (item.ProdutoId == itemPedido.ProdutoId)
            {
                itemEncontrado = itemPedido;
            }
        }

        if (itemEncontrado == null)
        {
            throw new Exception("Item nao encontrado.");
        }

        itemEncontrado.AtualizarQuantidade(quantidade);
        itemEncontrado.CalcularValorTotal();
        CalcularValorTotal();
    }

    private void CalcularValorTotal()
    {
        decimal valorTotal = 0;
        foreach (var item in _itensDoPedido)
        {
            valorTotal += item.CalcularValorTotal();
        }

        ValorTotal = valorTotal;
    }
}

public enum StatusPedido
{
    Novo,
    AguardandoPagamento,
    Finalizado
}