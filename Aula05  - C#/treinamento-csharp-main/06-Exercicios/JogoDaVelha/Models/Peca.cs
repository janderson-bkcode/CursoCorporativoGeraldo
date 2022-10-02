namespace JogoDaVelha.Models;

public class Peca
{
    public int Linha { get; private set; }
    public int Coluna { get; private set; }

    public Peca(int linha, int coluna)
    {
        Linha = linha;
        Coluna = coluna;
    }

    public virtual string Imprimir()
    {
        return "  -  ";
    }

    public override string ToString()
    {
        return Imprimir();
    }

    public override bool Equals(object? obj)
    {
        if (obj is not Peca objParaComparar)
        {
            return false;
        }

        return objParaComparar.ToString() == ToString();
    }
    
    public static Peca GerarPecaNaPosicao(int linha, int coluna, TipoPeca tipoPeca)
    {
        return tipoPeca switch
        {
            TipoPeca.Circulo => new Circulo(linha, coluna),
            TipoPeca.Cruzado => new Cruzado(linha, coluna),
            _ => new Peca(linha, coluna)
        };
    }
    
}