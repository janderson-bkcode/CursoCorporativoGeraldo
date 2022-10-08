using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JogoDaVelha
{
    public class JogoDaVelha2
    {
        class JogoDaVelha
        {
            private bool fimDeJogo;
            //SABER SE O JOGO ESTA RODANDO OU NÃO

            private char[] posicoes;
            //POSIÇÕES DO JOGO DA VELHA

            private char vez;
            // DEFINIR DE QUEM É A VEZ

            private int quantidadePreenchida;
            public JogoDaVelha()
            {
                fimDeJogo = false;

                posicoes = new[] { '1', '2', '3', '4', '5', '6', '7', '8', '9' };
                // DEFENINDO POSIÇÕES DO JOGO

                vez = 'X';
                // APLICAÇÃO É INICIADA SEMPRE COM X

                quantidadePreenchida = 0;
            }

            // METODO PARA INICAR O JOGO UTILIZANDO O LOOP
            public void Iniciar()
            {
                while (!fimDeJogo) // enquanto não é o fim do jogo
                {
                    RenderizarTabela();
                    LerEscolhaDoUsuario();
                    RenderizarTabela();
                    VerificarFimDoJogo();
                    MudarVez();
                }
            }

            // METODOS PARA JOGAR
            private void MudarVez()
            {
                vez = vez == 'X' ? 'O' : 'X';
                // VEZ É = SI A VEZ É IGUAL AO 'X' ENTÃO A VEZ VAI SER 'O' SE NÃO É VEZ DO 'X'
            }

            private void VerificarFimDoJogo()
            {
                if (quantidadePreenchida < 5)
                    return;

                if (ExisteVitoriaDiagonal() || ExisteVitoriaVertical() || ExisteVitoriaHorizontal())
                {
                    fimDeJogo = true;
                    Console.WriteLine($"FIM DE JOGO ! VITORIA DE {vez}");
                    return;
                }

                if (quantidadePreenchida is 9)
                {
                    fimDeJogo = true;
                    Console.WriteLine($"FIM DE JOGO ! EMPATE");
                    return;
                }
            }

            private bool ExisteVitoriaHorizontal()
            {
                bool vitorialinha1 = posicoes[0] == posicoes[1] && posicoes[0] == posicoes[2];
                bool vitorialinha2 = posicoes[3] == posicoes[4] && posicoes[3] == posicoes[5];
                bool vitorialinha3 = posicoes[6] == posicoes[7] && posicoes[6] == posicoes[8];

                return vitorialinha1 || vitorialinha2 || vitorialinha3;
            }

            private bool ExisteVitoriaVertical()
            {
                bool vitorialinha1 = posicoes[0] == posicoes[3] && posicoes[0] == posicoes[6];
                bool vitorialinha2 = posicoes[1] == posicoes[4] && posicoes[1] == posicoes[7];
                bool vitorialinha3 = posicoes[2] == posicoes[5] && posicoes[2] == posicoes[8];

                return vitorialinha1 || vitorialinha2 || vitorialinha3;
            }
            private bool ExisteVitoriaDiagonal()
            {
                bool vitorialinha1 = posicoes[0] == posicoes[4] && posicoes[0] == posicoes[8];
                bool vitorialinha2 = posicoes[2] == posicoes[4] && posicoes[1] == posicoes[6];

                return vitorialinha1 || vitorialinha2;
            }

            private void LerEscolhaDoUsuario()
            {
                Console.WriteLine($"Agora é a vez de {vez}");

                bool conversao = int.TryParse(Console.ReadLine(), out int posicaoEscolhida);
                // O metodo tryParse retorna verdadeiro ou falso nos dizendo se é um numero inteiro ou não alterando a variavel posicaoEscolhida

                while (!conversao || !ValidarEscolhaDoUsuario(posicaoEscolhida))// enquanto não conseguiu converter ou validar posição escolhida
                {
                    Console.WriteLine("O campo escolhido é invalido, por favor digite um número entre 1 e 9 que esteja disponivel na tabela");
                    conversao = int.TryParse(Console.ReadLine(), out posicaoEscolhida); // para ler novamente o que o usario passar
                }

                PreencherEscolha(posicaoEscolhida);
            }

            private void PreencherEscolha(int posicaoEscolhida)
            {
                int indice = posicaoEscolhida - 1;
                posicoes[indice] = vez; // vai preencher a tabela de acordo com a vez do usuario sendo 'X' ou 'O
                quantidadePreenchida++;
            }

            private bool ValidarEscolhaDoUsuario(int posicaoEscolhida) // com base na escolha do usuario vai validar a resposta
            {
                int indice = posicaoEscolhida - 1; // para que o computador conte como Usuario 1, 2 ,3 e não 0, 1, 2

                if (posicoes[indice] == 'O' || posicoes[indice] == 'X') // SE POSICOES do indice é igual 'o' ou posicao escolhida é igual a 'x' 
                    return false;

                return true;
            }

            private void RenderizarTabela()
            {
                Console.Clear(); // para redesenhar a tabela no terminal ficando sómente uma sempre
                Console.WriteLine(ObterTabela()); // Desenha a tabela baseada no Metodo Obter Tabela

            }

            private string ObterTabela()
            {
                return $"__{posicoes[0]}__|__{posicoes[1]}__|__{posicoes[2]}__\n" +
                       $"__{posicoes[3]}__|__{posicoes[4]}__|__{posicoes[5]}__\n" +
                       $"  {posicoes[6]}  |  {posicoes[7]}  |  {posicoes[8]}  \n\n";
            }
        }
    }
}