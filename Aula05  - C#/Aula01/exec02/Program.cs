using System;

namespace exec02
{
    class Program
	{
		static void Main(string[] args)
        {


        }

        public static void exec01()
        {
            
            double nota;
            double[] notas = new double[4];
            double soma ;

            for (int i = 0; i < notas.length; i++)
			{
                 Console.WriteLine($"Digite a Nota{i}º");
                 nota = double.Parse(Console.ReadLine());
                 notas[i] = nota;
			}

            for (int i = 0; i < notas.Length; i++)
            {
                soma += notas[i];
            }
            
            double media = soma / 4;

            Console.WriteLine($"A média das notas é {media} ");
            Console.ReadLine();
        }

        public static void exec02()
        {
            double valorHora;
            double horasTrabalhadas;
            Console.WriteLine("Digite o valor ganho por hora");
            valorHora = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Digite as horas trabalhadas");
            horasTrabalhadas = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine($"Salario Mensal {horasTrabalhadas * valorHora}");

        }
        public static void exec03(){

            double valorHora;
            double horasTrabalhadas;
            Console.WriteLine("Digite o valor ganho por hora");
            valorHora = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Digite as horas trabalhadas");
            horasTrabalhadas = Convert.ToDouble(Console.ReadLine());
            double salario = horasTrabalhadas * valorHora
            double inss = salario * 0.92;
            double impostoRenda = salario * 0.89;
            double sindicato = salario * 0.95;
            double descontos = 0.95 * 0.89 * 0.92;
            Console.WriteLine($"Salario Mensal {salario},INSS {inss},Imposto de renda{impostoRenda},Sindicato{sindicato},salario Liquido {salario * descontos},descontos{descontos}");

        }
	}
}
