namespace ExemplosLP
{
    public class Produto
    {
        public string Nome { get; set; }
        public decimal Valor { get; set; }
        public int Quantidade { get; set; }
        public bool Status { get; set; }

        public Produto()
        {

        }

        public Produto(string nome, decimal valor)
        {
            Nome = nome;
            Valor = valor;
            Quantidade = 0;
            Status = true;
        }

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
