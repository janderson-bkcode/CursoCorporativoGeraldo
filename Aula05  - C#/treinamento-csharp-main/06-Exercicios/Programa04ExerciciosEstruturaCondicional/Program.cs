using System.Globalization;

Console.WriteLine("Digite o salario do colaborador: ");
var salario = double.Parse(Console.ReadLine());
var aumentoAplicado = 0;
double salarioComAumento = 0;

switch (salario)
{
    case <= 280:
        aumentoAplicado = 20;
        salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
        break;
    case > 280 and <= 700:
        aumentoAplicado = 15;
        salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
        break;
    case > 700 and <= 1500:
        aumentoAplicado = 10;
        salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
        break;
    default:
        aumentoAplicado = 5;
        salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
        break;
}

Console.WriteLine($"Salario antes do reajuste: R${salario.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Percentual de aumento aplicado: {aumentoAplicado}%");
Console.WriteLine($"Valor do aumento: R${(salarioComAumento - salario).ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Novo salario: R${salarioComAumento.ToString("F2", new CultureInfo("pt-br"))}");

Console.WriteLine("-----------------------------------------------------------");

Console.WriteLine("Digite um numero de 1 a 7");
int numero = int.Parse(Console.ReadLine());

var diaDaSemana = numero switch
{
    1 => "Segunda-Feira",
    2 => "Terca-Feira",
    3 => "Quarta-Feira",
    4 => "Quinta-Feira",
    5 => "Sexta-Feira",
    6 => "Sabado",
    7 => "Domingo",
    _ => "Dia invalido!"
};

Console.WriteLine(diaDaSemana);

Console.WriteLine("-----------------------------------------------------------");

Console.WriteLine("Qual o valor da sua hora?");
var valorHora = double.Parse(Console.ReadLine());

Console.WriteLine("Quantas horas trabalhadas?");
var horasTrabalhadas = int.Parse(Console.ReadLine());

var salarioBruto = valorHora * horasTrabalhadas;
double salarioLiquido, fgts, ir, sindicato, desconto;

ir = salarioBruto switch
{
    > 900 and <= 1500 => 0.05,
    > 1500 and <= 2500 => 0.1,
    _ => 0.2
};

sindicato = salarioBruto * 0.03;
fgts = salarioBruto * 0.11;
desconto = (ir * salarioBruto) + sindicato;
salarioLiquido = salarioBruto - desconto;

Console.WriteLine(
    $"Salario bruto: ({horasTrabalhadas} * {valorHora}): {salarioBruto.ToString("F2", new CultureInfo("pt-br"))}");

Console.WriteLine($"(-) IR({ir * 100}%): R${(salarioBruto * ir).ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"(-) SINDICATO(3%): R${sindicato.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"FGTS(11%): R${fgts.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Total descontos: R${desconto.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Salario liquido: R${salarioLiquido.ToString("F2", new CultureInfo("pt-br"))}");