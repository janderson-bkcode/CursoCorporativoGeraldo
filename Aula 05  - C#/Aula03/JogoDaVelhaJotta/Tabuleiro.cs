using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JogoDaVelhaJotta
{
    class Tabuleiro
    {
        private char[,] Tab { get; set; }
        private int Jogadas { get; set; }
        private bool Venceu { get; set; }
        private char Jogador { get; set; }

        public Tabuleiro()
        {
            Tab = new char[3, 3];
            Jogadas = 0;
            Venceu = false;
            Jogador = 'X';
        }

        private void GerarTabuleiro()
        {
            Tab[0, 0] = '1';
            Tab[0, 1] = '2';
            Tab[0, 2] = '3';
            Tab[1, 0] = '4';
            Tab[1, 1] = '5';
            Tab[1, 2] = '6';
            Tab[2, 0] = '7';
            Tab[2, 1] = '8';
            Tab[2, 2] = '9';
        }

        private void ImprimirTabuleiro()
        {
            if (Jogadas == 0)
            {
                GerarTabuleiro();
            }
            Console.WriteLine("|-----------|");
            Console.WriteLine($"| {Tab[0, 0]} | {Tab[0, 1]} | {Tab[0, 2]} |");
            Console.WriteLine("|-----------|");
            Console.WriteLine($"| {Tab[1, 0]} | {Tab[1, 1]} | {Tab[1, 2]} |");
            Console.WriteLine("|-----------|");
            Console.WriteLine($"| {Tab[2, 0]} | {Tab[2, 1]} | {Tab[2, 2]} |");
            Console.WriteLine("|-----------|");
        }

        private void VerificarVitoria()
        {
            for (int i = 0; i < 3; i++)
            {
                for (int j = 0; j < 1; j++)
                {
                    if (Tab[i, j] == Tab[i, j + 1] && Tab[i, j + 1] == Tab[i, j + 2])
                    {
                        Venceu = true;
                        return;
                    }
                }
            }

            for (int i = 0; i < 1; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    if (Tab[i, j] == Tab[i + 1, j] && Tab[i + 1, j] == Tab[i + 2, j])
                    {
                        Venceu = true;
                        return;
                    }
                }
            }

            if ((Tab[0, 0] == Tab[1, 1] && Tab[1, 1] == Tab[2, 2]) || (Tab[2, 0] == Tab[1, 1] && Tab[1, 1] == Tab[0, 2])) Venceu = true;
        }

        public void Jogar()
        {
            while (!Venceu)
            {
                if (Jogador == 'X') Jogador = 'O';
                else Jogador = 'X';

                int pos;
                while (true)
                {
                    Console.WriteLine($"Vez do jogador: {Jogador}");

                    ImprimirTabuleiro();

                    Console.Write("Posição: ");
                    pos = Convert.ToInt32(Console.ReadLine());

                    if (pos < 1 || pos > 9)
                    {
                        Console.Clear();
                        Console.WriteLine("Posição não encontrada. Jogue novamente.");
                        continue;
                    }

                    string posString = Convert.ToString(pos);
                    bool posValida = false;

                    for (int i = 0; i < 3; i++)
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            if (Convert.ToString(Tab[i, j]) == posString)
                            {
                                posValida = true;
                            }
                        }
                    }

                    if (!posValida)
                    {
                        Console.Clear();
                        Console.WriteLine("Posição não é válida. Jogue novamente.");
                        continue;
                    }
                    break;
                }

                for (int i = 0; i < 3; i++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        if (Convert.ToString(Tab[i, j]) == Convert.ToString(pos))
                        {
                            Tab[i, j] = Jogador;
                        }
                    }
                }

                Jogadas++;
                VerificarVitoria();
                if (Venceu)
                {
                    Console.Clear();
                    Console.WriteLine("Vitória do jogador " + Jogador + "!");
                    ImprimirTabuleiro();
                    Console.WriteLine("Pressione qualquer tecla para fechar.");

                }

                else if (!Venceu && Jogadas < 9) Console.Clear();

                if (Jogadas == 9 && !Venceu)
                {
                    Console.Clear();
                    Console.WriteLine("VELHA! Nenhum jogador venceu.");
                    Venceu = true;
                    ImprimirTabuleiro();
                    Console.WriteLine("Pressione qualquer tecla para fechar.");
                }
            }
        }
    }
}
