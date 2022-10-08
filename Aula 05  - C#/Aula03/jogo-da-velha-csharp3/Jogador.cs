using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JogoDaVelha
{
    internal class Jogador
    {
        public string Nome { get; private set; }
        public Peca Peca { get; private set; }

        public Jogador(string nome, Peca peca)
        {
            Nome = nome;
            Peca = peca;
        }
    }
}
