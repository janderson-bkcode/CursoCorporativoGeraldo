using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace execircio01
{
    public class Program
    {
        static void Main(string[] args)
        {
            exec01();
            exec02();
            exec03();
        }
         public static void exec01()
         {
            Console.WriteLine("Digite o salario do colaborador: ");
            double salario = double.Parse(Console.ReadLine());
            double salarioNovo = 0;
            double porcentagem = 0;

                switch (salario)
                {
                    case <=280:
                        porcentagem = 1.20;
                        salarioNovo = salario * porcentagem;
                        break;
                    case >280 and <=700:
                            porcentagem = 1.15;
                        salarioNovo = salario * porcentagem;
                        break ;
                        case >700 and <=1500:
                        porcentagem = 1.15;
                        salarioNovo = salario * porcentagem;
                        break;
                    case >1500:
                        porcentagem = 1.05;
                        salarioNovo = salario * porcentagem;
                        break;

                }
            Console.WriteLine($"Salario antes do reajuste: R${salario.ToString("F2", new CultureInfo("pt-br"))}");
            Console.WriteLine($"Percentual de aumento aplicado: {porcentagem}%");
            Console.WriteLine($"Valor do aumento: R${(salarioNovo - salario).ToString("F2", new CultureInfo("pt-br"))}");
            Console.WriteLine($"Novo salario: R${salarioNovo.ToString("F2", new CultureInfo("pt-br"))}");
        }

        public static void exec02()
        {
             Console.WriteLine("Digite um numero ");
             double numero = double.Parse(Console.ReadLine());
             string dia  = numero switch
             {
                 1 => "Segunda",
                 2 => "Terça",
                 3 => "Quarta",
                 4 => "Quinta",
                 5 => "Sexta",
                 6 => "Sábado",
                 7 => "Domingo",
                 _=> "Dia Inválido!"
             }; 
             
            Console.WriteLine($"Dia da semana :{dia}");
        }

        public static void exec03()
        {
           
            double desconto;
            double ir = 0.95;
            double sindicato = 0.97;
            double fgts = 0.89;
            double totalDescontos = ir * sindicato * fgts * desconto;
            double salarioLiquido = salarioLiquido*  totalDescontos;
            double salarioBruto;

            Console.WriteLine("Digite Horas trabalhadas: ");
            double horasTrabalhadas = double.Parse(Console.ReadLine());
            Console.WriteLine("Digite o valor por hora");
            double valorHora = double.Parse(Console.ReadLine());
            salarioBruto = valorHora * horasTrabalhadas; ;

            switch (salarioBruto)
            {
                case <= 980:
                    desconto = 1;
                    break;
                case > 980 and <= 1500:
                    desconto = 0.95;
                case >1500 and <=2500:
                    desconto = 0.90;
                case > 2500:
                    desconto = 0.80;

            }
            Console.WriteLine($"" +
                $"Salario Bruto{salarioBruto.ToString("F2", new CultureInfo("pt-br"))}\n IR - {ir}(20)%\n" +
                $"Sindicato{sindicato}(3)%\n" +
                $"FGTS{fgts}(11%)\n" +
                $"Total de Descontos{totalDescontos}\n" +
                $"SalarioLiquido{salarioLiquido.ToString("F2", new CultureInfo("pt-br"))}");

        }

    }
}
