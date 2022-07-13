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
            List02.exec11();

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
        public static void exec06()
        {

            double nota1, nota2, media;
            string nomeAluno;
            System.Console.WriteLine("Digite o nome do Aluno");
            nomeAluno = Console.ReadLine();
            System.Console.WriteLine($"Digite a primeira nota do aluno {nomeAluno}");
            nota1 = double.Parse(Console.ReadLine());
            System.Console.WriteLine($"Digite a Segunda nota do aluno {nomeAluno}");
            nota2 = double.Parse(Console.ReadLine());
            media = (nota1 + nota2) / 2;

            if ((nota1 < 0 || nota1 > 10) || (nota2 < 0 || nota2 > 10))
            {
                System.Console.WriteLine("Valor de uma das notas Invalida digite um valor maior que zero e menor que 10");
            }
            else if (media > 8.0)
            {
                System.Console.WriteLine($"O aluno {nomeAluno} está aprovado com a nota final {media}");
            }
            else
            {
                System.Console.WriteLine($"O aluno {nomeAluno} está Reprovado com a nota final {media}");
            }
        }

        public static void exec07()
        {
            int nota;
            string mensagem;
            System.Console.WriteLine("Digite a nota do Aluno");
            nota = int.Parse(Console.ReadLine());

            mensagem = nota > 10 ? "Parabéns" : "Faça um novo Exame";
            System.Console.WriteLine(mensagem);
        }

        public static void exec08()
        {
            int ano;
            Console.WriteLine("Digite o ano");
            ano = int.Parse(Console.ReadLine());

            if (DateTime.IsLeapYear(ano))
            {
                System.Console.WriteLine($" o ano {ano} é bissexto");
            }
            else
            {
                System.Console.WriteLine($" o ano {ano} não é bissexto");
            }
        }

        // public static void exec09()
        // {
        //     int a, b, c;
        //     Console.WriteLine("Digite o primeiro Numero");
        //     a = int.Parse(Console.ReadLine());
        //     Console.WriteLine("Digite o Segundo Numero");
        //     b = int.Parse(Console.ReadLine());
        //     Console.WriteLine("Digite o Terceiro Numero");
        //     c = int.Parse(Console.ReadLine());

        //     if (a > b)
        //     {
        //         if (b > c) Console.WriteLine(a, b, c);
        //         else
        //         {
        //             if (a > c) Console.WriteLine(a, c, b);
        //             else Console.WriteLine(c, a, b);
        //         }


        //     }
        //     if (b > c)
        //     {
        //         if (a > c) Console.WriteLine(b, a, c);
        //         else Console.WriteLine(b, c, a);
        //     }
        //     else Console.WriteLine(c, b, a);
        // }

        public static void exec10()
        {
            string produto, TipoProduto;
            double valorProduto;
            System.Console.WriteLine("Digite o nome do Produto");
            produto = Console.ReadLine();
            System.Console.WriteLine($"Digite o tipo a Categoria do Produto: {produto}");
            TipoProduto = Console.ReadLine();
            System.Console.WriteLine($"Digite o valor do Produto: {produto}");
            valorProduto = double.Parse(Console.ReadLine());

            switch (TipoProduto)
            {
                case "Essencial":
                    System.Console.WriteLine($"Produto do Tipo Essencial, valor com ICMS ${Math.Round(valorProduto * 1.05, 3)}Reais");
                    break;
                case "Luxo":
                    System.Console.WriteLine($"Produto do Tipo Luxo, valor com ICMS ${Math.Round(valorProduto * 1.30, 3)}Reais");
                    break;
                default:
                    System.Console.WriteLine($"Produto do Tipo Geral, valor com ICMS ${Math.Round(valorProduto * 1.20, 3)}Reais");
                    break;
            }
        }

        public static void exec11()
        {

            int a, b, c;

            System.Console.WriteLine("Digite o Primeiro valor");
            a = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Digite o Segundo valor");
            b = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Digite o Terceiro valor");
            c = int.Parse(Console.ReadLine());

            if (a + b > c && a + c > b && b + c > a)
            {
                Console.WriteLine("Os 3 lados formam um triangulo!\n");
                if (a == b && a == c)
                    Console.WriteLine("Equilatero\n");
                else
                    if (a == b || a == c || b == c)
                    Console.WriteLine("Isosceles\n");
                else
                    Console.WriteLine("Escaleno\n");
            }
            else
                Console.WriteLine("Os 3 lados Não formam um triângulo!\n");

        }

        public static String exec12()
        {
            int numero = 2;
            string[] strUnidades = { "", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove" };

            if ((numero >= 0) && (numero <= 19))
            {
                return $"O numero{numero} por extenso é {strUnidades[numero]}";
            }
            else
            {
                return "Valor inválido";
            }

        }
    }
}

