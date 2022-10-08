namespace VendasConsole.Models;

public class Cliente
{
    public Guid Id { get; private set; }
    public string Nome { get; private set; }

    public Cliente(string nome)
    {
        Id = new Guid();
        Nome = nome;
    }
}