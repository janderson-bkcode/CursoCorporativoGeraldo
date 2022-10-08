namespace VendasConsole.Models;

public class Produto
{
    public Guid Id { get; private set; }
    public string Nome { get; private set; }
    public decimal Valor { get; private set; }
    public bool Ativo { get; private set; }
    public int QuantidadeEstoque { get; private set; }

    public Produto(string nome, decimal valor, int quantidadeEstoque)
    {
        Id = new Guid();
        Nome = nome;
        Valor = valor;
        QuantidadeEstoque = quantidadeEstoque;
        Ativar();
        Validar();
    }

    public void Ativar() => Ativo = true;

    public void Desativar() => Ativo = false;

    public void AlterarNome(string nome)
    {
        if (string.IsNullOrWhiteSpace(nome))
        {
            throw new Exception("Nome invalido.");
        }
        
        Nome = nome;
    }

    public void AumentarQuantidadeEmEstoque(int quantidade)
    {
        if (quantidade <= 0)
        {
            throw new Exception("Quantidade deve ser maior que 0.");
        }
        
        QuantidadeEstoque += quantidade;
    }

    public void DiminuirQuantidadeEmEstoque(int quantidade)
    {
        if (quantidade <= 0)
        {
            throw new Exception("Quantidade deve ser maior que 0.");
        }
        
        if (quantidade > QuantidadeEstoque)
        {
            throw new Exception("Quantidade maior do que a disponivel.");
        }

        QuantidadeEstoque -= quantidade;
    }

    public void AlterarValor(decimal valor)
    {
        if (valor <= 0)
        {
            throw new Exception("Valor invalido.");
        }

        Valor = valor;
    }

    public void Validar()
    {
        if (string.IsNullOrEmpty(Nome))
        {
            throw new Exception("Forneça um nome para o produto.");
        }

        if (Valor <= 0)
        {
            throw new Exception("Valor deve ser maior que 0.");
        }

        if (QuantidadeEstoque < 0)
        {
            throw new Exception("Quantidade em estoque inválida.");
        }
    }
}