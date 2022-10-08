namespace JogoDaVelha.Models;

public class Jogador
{
    public string Nome { get; private set; }
    public TipoPeca PecaEscolhida { get; private set; }

    public Jogador(string nome, TipoPeca pecaEscolhida)
    {
        Nome = nome;
        PecaEscolhida = pecaEscolhida;
    }
}