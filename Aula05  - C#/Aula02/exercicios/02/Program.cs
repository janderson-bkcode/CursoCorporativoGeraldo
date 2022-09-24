﻿using System;
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
            
            do
	        {                 
                Console.WriteLine("Digite o código do Pedido");
                int codigo = int.Parse(Console.WriteLine())
                Console.WriteLine("Digite a quantidade");
                int qtd = int.Parse(Console.WriteLine())
                int total;
                
                switch (codigo)
                {
                    case 100:
                    total += (1.2 * qtd);
                    Console.WriteLine($"Cachorro Quente (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 101:
                    total += (1.3 * qtd);
                    Console.WriteLine($"Bauru Simples (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;
                    
                    case 102:
                    total += (1.5 * qtd);
                    Console.WriteLine($"Bauro com OVO (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 103:
                    total += (1.2 * qtd);
                    Console.WriteLine($"Hamburguer (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 104:
                    total += (1.3* qtd);
                    Console.WriteLine($"ChesseBurguer  (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                    case 105:
                    total += (1* qtd);
                    Console.WriteLine($"Refrigerante (R$1,20 * {qtd}) = R${(qtd * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n"));
                    break;

                }

	        } while (codigo != 0);      

        }

    }
}

   