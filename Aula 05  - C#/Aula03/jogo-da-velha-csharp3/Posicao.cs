using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JogoDaVelha
{
    internal class Posicao
    {
        public Peca Peca { get; set; }

        public Posicao()
        {
            Peca = Peca.Vazia;
        }

        public string GetPeca()
        {
            switch (Peca)
            {
                case Peca.Circulo:
                    return "O";
                    break;
                case Peca.Xis:
                    return "X";
                    break;
                case Peca.Vazia:
                    return "-";
                    break;
                default:
                    return "-";
                    break;
            }
        }

    }
}
