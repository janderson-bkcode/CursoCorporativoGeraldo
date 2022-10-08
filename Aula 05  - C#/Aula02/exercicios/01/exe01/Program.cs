using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exe01
{
    public class Program
    {
        static void Main(string[] args)
        {
           using System.Globalization;

            Console.WriteLine("Digite o salario do colaborador: ");
            decimal salario = double.Parse(Console.ReadLine());
            decimal salarioNovo = 0;
            decimal porcentagem = 0;

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
                    case >1500
                        porcentagem = 1.05;
                        salarioNovo = salario * porcentagem;
                        break;

                }
            Console.WriteLine($"Salario antes do reajuste: R${salario.ToString("F2", new CultureInfo("pt-br"))}");
            Console.WriteLine($"Percentual de aumento aplicado: {porcentagem}%");
            Console.WriteLine($"Valor do aumento: R${(salarioNovo - salario).ToString("F2", new CultureInfo("pt-br"))}");
            Console.WriteLine($"Novo salario: R${salarioNovo.ToString("F2", new CultureInfo("pt-br"))}");
        }
    }
}
