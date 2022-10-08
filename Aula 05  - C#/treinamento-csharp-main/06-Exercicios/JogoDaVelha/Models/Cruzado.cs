namespace JogoDaVelha.Models;

public class Cruzado : Peca
{
    public Cruzado(int linha, int coluna) : base(linha, coluna)
    {
    }

    public override string Imprimir()
    {
        return "  X  ";
    }
}