using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


 namespace Exercicios04_07_22
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Exec.exec07();
            Console.ReadLine();
        }

       
    }

    public class Exec
    {
        public static void exec01()
        {

            Console.WriteLine("A soma de 3 +4 é {0}", 3 + 4);
        }

        public static void exec02()
        {
            Console.WriteLine("A divisão de 5 por 2 é {0}", 5 / 2);
        }

        public static void exec03()
        {
            Console.WriteLine("O resto da divisão de 40 por 3 é {0}", 40 % 3);
        }

        public static void exec04()
        {
            Console.WriteLine("Digite o Numero");
            var numero = Console.ReadLine();
            Console.WriteLine($"{numero}");
        }

        public static void exec05()
        {
            var num01 = 4.68805;
            var num02 = 4.8;
            var num03 = 5.9964;
            var num04 = 5.0;

            Console.WriteLine(
                $"{Math.Round(num01, 3)},{Math.Round(num02, 3)},{Math.Round(num03, 3)},{Math.Round(num04, 3)}\n" +
                $"{Math.Round(num01, 2)},{Math.Round(num02, 2)},{Math.Round(num03, 2)},{Math.Round(num04, 2)}\n" +
                $"{Math.Round(num01, 1)},{Math.Round(num02, 1)},{Math.Round(num03, 1)},{Math.Round(num04, 1)}"
                );
        }

        public static void exec06()
        {
            double num01 = 4.68805 /100;
            double num02 = 4.8 /100;
            double num03 = 5.9964/100;
            double num04 = 5.0/100;


            Console.WriteLine(num01.ToString(), num02.ToString(), num03.ToString(), num04.ToString());
        }

        public static void exec07()
        {
            Console.WriteLine("Digite 3 numeros");
            var num1 =  Console.ReadLine();
            var num2 = Console.ReadLine();
            var num3 = Console.ReadLine();
            
            Console.WriteLine($"{Math.Round(double.Parse(num1), 10)},{Math.Round(double.Parse(num2), 10)},{Math.Round(double.Parse(num3), 10)}".PadLeft(15));
        }
    }
}
