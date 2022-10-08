using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace exercicio02
{
    public class Program
    {
        static void Main(string[] args)
        {
           exec01();
        }
         public static void exec01()
         {
             
            Console.WriteLine("Informe um numero: ");
            var num = int.Parse(Console.ReadLine());

            for (var i = 1; i <= num; i++)
            {
                for (var j = 1; j <= i; j++)
                {
                    Console.Write(i);
                }

                Console.WriteLine("");
            }

            for (var i = 1; i <= num; i++)
            {
                for (var j = 1; j <= i; j++)
                {
                    Console.Write(j);
                }

                Console.WriteLine("");
            }
         }

        public static void exec02()
        {
            Console.WriteLine("---Tabuada---");
            Console.WriteLine("Digite um numero o para apresentar a tabuada");
            int num = int.Parse(Console.ReadLine());
            Console.WriteLine($"Tabuada do {num}");

            for (int i = 0; i < 10; i++)
			{
              Console.WriteLine($"{num} * {i} = {num * i}");
			}           

        }
        public static void exec02_2()
        {
            Console.WriteLine($"Digite um inicio de multiplicação");
            var numInicio = int.Parse(Console.ReadLine());

            Console.WriteLine("Digite um fim de multiplicação");
            var numfim = int.Parse(Console.ReadLine())

            for (int i = numInicio; i < numfim; i++)
			{
              Console.WriteLine($"{num} * {i} = {num * i}");
			}
        }

        public static void exec03()
        {
            int total;
            var listaItens = new List<string>();

            do
	        {                 
                Console.WriteLine("Digite o código do Pedido ou digite 0 para sair");
                int codigo = int.Parse(Console.WriteLine())
                Console.WriteLine("Digite a quantidade");
                int qtd = int.Parse(Console.WriteLine())

                switch (codigo)
                {
                    case 100:
                    total += (1.2 * qtd);
                    listaItens.Add($"Cachorro Quente (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 101:
                    total += (1.3 * qtd);
                    listaItens.Add($"Bauru Simples (R$1,30 * {qtd}) = R${(qtd * 1.3).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;
                    
                    case 102:
                    total += (1.5 * qtd);
                    listaItens.Add($"Bauru com OVO (R$1,50 * {qtd}) = R${(qtd * 1.5).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 103:
                    total += (1.2 * qtd);
                    listas.Add($"Hamburguer (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 104:
                    total += (1.3* qtd);
                    listaItens.Add(($"ChesseBurguer  (R$1,30 * {qtd}) = R${(qtd * 1.3).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 105:
                    total += (1* qtd);
                    listaItens.Add($"Refrigerante (R$1,00 * {qtd}) = R${(qtd * 1).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                }
             

	        } while (codigo != 0);      
            foreach (var item in listaItens)
	        {
                Console.WriteLine($"Itens{item}");
	        }
    }

    }
}

   