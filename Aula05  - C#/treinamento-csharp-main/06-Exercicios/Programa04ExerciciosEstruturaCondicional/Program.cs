using System.Globalization;

Console.WriteLine("Digite o salario do colaborador: ");
double salario = double.Parse(Console.ReadLine());
double salarioComAumento = 0;
int aumentoAplicado = 0;

if (salario <= 280)
{
    aumentoAplicado = 20;
    salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
}
else if (salario > 280 && salario <= 700)
{
    aumentoAplicado = 15;
    salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
}
else if (salario > 700 && salario <= 1500)
{
    aumentoAplicado = 10;
    salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
}
else
{
    aumentoAplicado = 5;
    salarioComAumento = salario + (salario * (aumentoAplicado / 100.0));
}

Console.WriteLine($"Salario antes do reajuste: R${salario.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Percentual de aumento aplicado: {aumentoAplicado}%");
Console.WriteLine($"Valor do aumento: R${(salarioComAumento - salario).ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"Novo salario: R${salarioComAumento.ToString("F2", new CultureInfo("pt-br"))}");