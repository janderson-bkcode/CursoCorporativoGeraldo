namespace JogoDaVelha.Models;

public class Circulo : Peca
{
    public Circulo(int linha, int coluna) : base(linha, coluna)
    {
    }
    
    public override string Imprimir()
    {
        return "  O  ";
    }
}