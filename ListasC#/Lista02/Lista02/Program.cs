using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lista02.Lista02
{

    class Program
    {
        public static void Main(string[] args)
        {
            // See https://aka.ms/new-console-template for more information
            Console.WriteLine("Hello, World!");
            List02.exec05();

        }
    }

    public class List02
    {

        public static void exec01()
        {

            System.Console.WriteLine($"{4 == 5}");
            System.Console.WriteLine($"{4 != 5}");
            System.Console.WriteLine($"{4 > 5}");
            System.Console.WriteLine($"{true == false}");
            System.Console.WriteLine($"{'a' == 'a'}");
            System.Console.WriteLine($"{'a' == 'b'}");
            System.Console.WriteLine($"{2 < 3 && 3 > 4}");
            System.Console.WriteLine($"{2 < 3 && 3 > 4}");
            System.Console.WriteLine($"{2 < 3 || 3 > 4}");
            System.Console.WriteLine($"{!(2 < 3 || 3 > 4)}");
        }

        public static void exec02()
        {
            double numeroInt = 20.34;
            int convert = Convert.ToInt32(Math.Round(numeroInt));
            System.Console.WriteLine(convert);
        }
        public static void exec03()
        {
            int um_numero;
            Console.WriteLine("Digite Um numero");
            um_numero = int.Parse(Console.ReadLine());
            if (um_numero > 0 && um_numero % 2 == 0)
            {
                Console.WriteLine("Numero Positivo e Par");
            }
            else if (um_numero > 0 && um_numero % 2 != 0)
            {
                System.Console.WriteLine("Numero positivo Impar");
            }
            else
            {
                System.Console.WriteLine("Numero Negativo");
            }

        }

        public static void exec04()
        {
            double horasTrabalhadas, salarioHora;
            System.Console.WriteLine("Digite as horas Trabalhadas");
            horasTrabalhadas = double.Parse(Console.ReadLine());
            System.Console.WriteLine("Digite o valor do Salario por hora");
            salarioHora = double.Parse(Console.ReadLine());

            if (horasTrabalhadas > 40)
            {
                salarioHora *= 2;
                horasTrabalhadas *= salarioHora;
                System.Console.WriteLine($"Valor da Remuneração Dobrada ${horasTrabalhadas} reais");
            }
            else
            {
                horasTrabalhadas *= salarioHora;
                System.Console.WriteLine($"Valor da Remuneração ${horasTrabalhadas} reais");
            }

        }
        public static void exec05()
        {
            int a, b, c, menor, maior;
            a = 2;
            b = 8;
            c = 3;
            menor = a;
            maior = a;

            if (menor > b)
                menor = b;
            if (menor > c)
                menor = c;

            if (maior < b)
                maior = b;
            if (maior < c)
                maior = c;

            System.Console.WriteLine($" Maior {maior} , Menor :{menor}");

        }
    }
}

