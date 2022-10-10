using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JogoDaVelhaJotta
{  /// <summary>
/// Jogo da velha em C# Por Janderson Barbosa
/// 
/// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Tabuleiro T = new Tabuleiro();
            T.Jogar();

            Console.ReadKey();
        }
    }
}
