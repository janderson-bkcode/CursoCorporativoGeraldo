using JogoDaVelha.Models;

namespace JogoDaVelha;

public class Jogo
{
    private const int _linhas = 3;
    private const int _colunas = 3;
    private Peca[,] _pecas;

    public Jogo()
    {
        _pecas = new Peca[_linhas, _colunas];
    }

    public void CriarJogo()
    {
        for (var i = 0; i < _linhas; i++)
        {
            for (var j = 0; j < _colunas; j++)
            {
                _pecas[i, j] = new Peca(i, j);
            }
        }
    }

    public void Jogar()
    {
        Console.Write("Jogador 01. ");
        var primeiroJogador = CriarJogador(TipoPeca.Circulo);

        Console.Write("Jogador 02. ");
        var segundoJogador = CriarJogador(TipoPeca.Cruzado);

        var final = false;
        var rodada = true;

        while (!final)
        {
            ImprimirJogo();

            if (rodada)
            {
                var resultadoJogada = RealizarJogada(primeiroJogador);
                if (resultadoJogada)
                    rodada = false;
            }
            else
            {
                var resultadoJogada = RealizarJogada(segundoJogador);
                if (resultadoJogada)
                    rodada = true;
            }

            if (VerificarVelha())
            {
                final = true;
                ImprimirJogo();
                Console.WriteLine("Jogo empatado, boa sorte na proxima partida");
            }

            if (VerificarVencedor())
            {
                var nomeVencedor = !rodada ? primeiroJogador.Nome : segundoJogador.Nome;
                final = true;
                ImprimirJogo();
                Console.WriteLine($"Final de jogo, o jogador {nomeVencedor} foi o vencedor");
            }
        }
    }

    private Jogador CriarJogador(TipoPeca tipoPeca)
    {
        Console.Write("Digite o seu nome: ");
        var nome = Console.ReadLine();
        return new Jogador(nome, tipoPeca);
    }

    private void ImprimirJogo()
    {
        Console.Clear();
        for (var i = 0; i < _linhas; i++)
        {
            for (var j = 0; j < _colunas; j++)
            {
                if (j == 2)
                {
                    Console.WriteLine(_pecas[i, j].ToString());
                    break;
                }

                Console.Write(_pecas[i, j].ToString());
            }
        }
    }
    
    private bool ColocarPecaNaPosicao(int linha, int coluna, TipoPeca tipoPeca)
    {
        if (!PosicaoLivre(linha, coluna)) return false;

        _pecas[linha, coluna] = Peca.GerarPecaNaPosicao(linha, coluna, tipoPeca);
        return true;
    }
    
    private bool PosicaoLivre(int linha, int coluna)
    {
        return _pecas[linha, coluna] is not Circulo && _pecas[linha, coluna] is not Cruzado;
    }

    private bool VerificarVelha()
    {
        var quantidadePecasVerificadas = 0;

        for (var i = 0; i < _linhas; i++)
        {
            for (var j = 0; j < _colunas; j++)
            {
                if (_pecas[i, j] is Circulo || _pecas[i, j] is Cruzado)
                {
                    quantidadePecasVerificadas++;
                }
            }
        }

        return quantidadePecasVerificadas == (_linhas * _colunas);
    }

    private bool VerificarVencedorLinhas()
    {
        for (var i = 0; i < _linhas; i++)
        {
            var resultado = _pecas[i, 0].Equals(_pecas[i, 1]) && _pecas[i, 0].Equals(_pecas[i, 2]) &&
                            (_pecas[i, 0] is Circulo || _pecas[i, 0] is Cruzado);

            if (resultado)
                return true;
        }

        return false;
    }

    private bool VerificarVencedorColunas()
    {
        for (var i = 0; i < _linhas; i++)
        {
            var resultado = _pecas[0, i].Equals(_pecas[1, i]) && _pecas[0, i].Equals(_pecas[2, i]) &&
                            (_pecas[0, i] is Circulo || _pecas[0, i] is Cruzado);

            if (resultado)
                return true;
        }

        return false;
    }

    private bool VerificarVencedorDiagonal()
    {
        var diagonalPrimaria = _pecas[0, 0].Equals(_pecas[1, 1]) && _pecas[0, 0].Equals(_pecas[2, 2]) &&
                               (_pecas[1, 1] is Circulo || _pecas[1, 1] is Cruzado);

        var diagonalSecundaria = _pecas[2, 0].Equals(_pecas[1, 1]) && _pecas[2, 0].Equals(_pecas[0, 2]) &&
                                 (_pecas[1, 1] is Circulo || _pecas[1, 1] is Cruzado);

        return diagonalPrimaria || diagonalSecundaria;
    }

    private bool VerificarVencedor()
    {
        return VerificarVencedorLinhas() || VerificarVencedorColunas() || VerificarVencedorDiagonal();
    }

    private bool RealizarJogada(Jogador jogador)
    {
        Console.WriteLine(
            $"Jogador  {jogador.Nome} escolha uma posição: \n[0,0] - [0,1] - [0,2] \n[1,0] - [1,1] - [1,2]\n[2,0] - [2,1] - [2,2] ");
        var posicoesJogador = Console.ReadLine().Replace(" ", "").Split(",");
        return ColocarPecaNaPosicao(int.Parse(posicoesJogador[0]), int.Parse(posicoesJogador[1]),
            jogador.PecaEscolhida);
    }
}