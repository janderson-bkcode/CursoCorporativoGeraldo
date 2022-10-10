using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JogoDaVelha
{
    internal class Jogo
    {
        public List<Jogador> Jogadores { get; private set; }
        public bool FimDeJogo { get; private set; }
        public List<Posicao> Tabuleiro { get; private set; }
        public int JogadorDaVez { get; private set; }

        public Jogo()
        {
            JogadorDaVez = 0;
            Jogadores = new List<Jogador>();
            Tabuleiro = new List<Posicao>();
            IniciaJogo();
        }

        public void IniciaJogo()
        {
            Console.WriteLine("Insira o nome do jogador um");
            string nomeJogadorUm = Console.ReadLine();
            Jogador jogadorUm = new Jogador(nomeJogadorUm, Peca.Circulo);

            Console.WriteLine("Insira o nome do jogador dois");
            string nomeJogadorDois = Console.ReadLine();
            Jogador jogadorDois = new Jogador(nomeJogadorDois, Peca.Xis);

            Jogadores.Add(jogadorUm);
            Jogadores.Add(jogadorDois);


            CriaTabuleiro();
            FazJogada(Jogadores[JogadorDaVez]);
        }

        public void FazJogada(Jogador jogador)
        {
                Console.Clear();
                ImprimeTabuleiro();
                Console.WriteLine();
                Console.WriteLine($"{jogador.Nome} é sua vez! Escolha uma posição");
                Console.WriteLine("1   2   3");
                Console.WriteLine("4   5   6");
                Console.WriteLine("7   8   9");

                int posicao = int.Parse(Console.ReadLine()) - 1;

                if (Tabuleiro[posicao].Peca != Peca.Vazia)
                {
                    Console.WriteLine("Posição já ocupada. Pressione uma tecla para continuar.");
                    return;
                }

                Tabuleiro[posicao].Peca = jogador.Peca;


                
                VerificaVitoria();
        }

        public void ImprimeTabuleiro()
        {


            for (int i = 0; i <= 8; i++)
            {
                if(i == 2 || i == 5 || i == 8)
                {
                    Console.WriteLine(Tabuleiro[i].GetPeca());
                    continue;
                }

                Console.Write($"{Tabuleiro[i].GetPeca()}  ");
            }
        }

        public void VerificaVitoria()
        {

            //verifica linhas
            if ((Tabuleiro[0].Peca != Peca.Vazia && Tabuleiro[1].Peca != Peca.Vazia && Tabuleiro[2].Peca != Peca.Vazia) && Tabuleiro[0].Peca == Tabuleiro[1].Peca && Tabuleiro[0].Peca == Tabuleiro[2].Peca)
            {
                if(Tabuleiro[0].Peca != Peca.Vazia)
                FimDeJogo = true;
            }

            if ((Tabuleiro[3].Peca != Peca.Vazia && Tabuleiro[4].Peca != Peca.Vazia && Tabuleiro[5].Peca != Peca.Vazia) && Tabuleiro[3].Peca == Tabuleiro[4].Peca && Tabuleiro[3].Peca == Tabuleiro[5].Peca)
            {
                FimDeJogo = true;
            }

            if ((Tabuleiro[6].Peca != Peca.Vazia && Tabuleiro[7].Peca != Peca.Vazia && Tabuleiro[8].Peca != Peca.Vazia) && Tabuleiro[6].Peca == Tabuleiro[7].Peca && Tabuleiro[6].Peca == Tabuleiro[8].Peca)
            {
                FimDeJogo = true;
            }

            if (FimDeJogo)
            {
                Console.WriteLine($"Parabéns!! {Jogadores[JogadorDaVez].Nome} foi o ganhador");
            }

            //verifica Colunas
            if ((Tabuleiro[0].Peca != Peca.Vazia && Tabuleiro[3].Peca != Peca.Vazia && Tabuleiro[6].Peca != Peca.Vazia) && Tabuleiro[0].Peca == Tabuleiro[3].Peca && Tabuleiro[0].Peca == Tabuleiro[6].Peca)
            {
                if (Tabuleiro[0].Peca != Peca.Vazia)
                    FimDeJogo = true;
            }

            if ((Tabuleiro[1].Peca != Peca.Vazia && Tabuleiro[4].Peca != Peca.Vazia && Tabuleiro[7].Peca != Peca.Vazia) && Tabuleiro[1].Peca == Tabuleiro[4].Peca && Tabuleiro[1].Peca == Tabuleiro[7].Peca)
            {
                FimDeJogo = true;
            }

            if ((Tabuleiro[2].Peca != Peca.Vazia && Tabuleiro[5].Peca != Peca.Vazia && Tabuleiro[8].Peca != Peca.Vazia) && Tabuleiro[2].Peca == Tabuleiro[5].Peca && Tabuleiro[2].Peca == Tabuleiro[8].Peca)
            {
                FimDeJogo = true;
            }

            //verifica diagonais
            if((Tabuleiro[0].Peca != Peca.Vazia && Tabuleiro[4].Peca != Peca.Vazia && Tabuleiro[8].Peca != Peca.Vazia) && Tabuleiro[0].Peca == Tabuleiro[4].Peca && Tabuleiro[0].Peca == Tabuleiro[8].Peca)
            {
                FimDeJogo = true;
            }

            if ((Tabuleiro[2].Peca != Peca.Vazia && Tabuleiro[4].Peca != Peca.Vazia && Tabuleiro[6].Peca != Peca.Vazia) && Tabuleiro[2].Peca == Tabuleiro[4].Peca && Tabuleiro[2].Peca == Tabuleiro[6].Peca)
            {
                FimDeJogo = true;
            }

            if (FimDeJogo)
            {
                Console.Clear();
                ImprimeTabuleiro();
                Console.WriteLine($"Parabéns!! {Jogadores[JogadorDaVez].Nome} foi o ganhador");
                return;
            }

            while (!FimDeJogo)
            {
                if (JogadorDaVez == 0)
                {
                    JogadorDaVez = 1;
                }
                else
                {
                    JogadorDaVez = 0;
                }
                FazJogada(Jogadores[JogadorDaVez]);
            }

            
        }

        public void CriaTabuleiro()
        {
            for (int i = 0; i <= 8; i++)
            {
                Tabuleiro.Add(new Posicao());
            }
        }
    }
}
