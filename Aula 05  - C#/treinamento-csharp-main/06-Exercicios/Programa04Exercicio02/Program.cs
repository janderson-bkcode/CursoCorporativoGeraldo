using System.Globalization;

Console.WriteLine("Digite a primeira nota: ");
double nota01 = double.Parse(Console.ReadLine());

Console.WriteLine("Digite a segunda nota: ");
double nota02 = double.Parse(Console.ReadLine());

Console.WriteLine("Digite a terceira nota: ");
double nota03 = double.Parse(Console.ReadLine());

Console.WriteLine("Digite a quarta nota: ");
double nota04 = double.Parse(Console.ReadLine());

Console.WriteLine($"A media das notas eh {(nota01 + nota02 + nota03 + nota04) / 4}");

Console.WriteLine("--------------------------------------------------");

Console.WriteLine("Quanto voce ganha por hora? ");
double valorHora = double.Parse(Console.ReadLine());

Console.WriteLine("Quantas horas voce trabalhou esse mes? ");
int horasTrabalhadas = int.Parse(Console.ReadLine());

string textoResultado = @$"
Voce ganha {valorHora.ToString("F2", new CultureInfo("pt-br"))} por hora e 
trabalhou {horasTrabalhadas} horas esse mes. 
O Total do seu salario eh: {(valorHora * horasTrabalhadas).ToString("F2", new CultureInfo("pt-br"))}";

Console.WriteLine(textoResultado);

Console.WriteLine("--------------------------------------------------");

Console.WriteLine("Quanto voce ganha por hora? ");
double valorHora2 = double.Parse(Console.ReadLine());

Console.WriteLine("Quantas horas voce trabalhou esse mes? ");
int horasTrabalhadas2 = int.Parse(Console.ReadLine());

double totalBruto = valorHora2 * horasTrabalhadas2;
double valorImpostoRenda = totalBruto * 0.11;
double valorINSS = totalBruto * 0.08;
double valorSindicato = totalBruto * 0.05;
double salarioLiquido = totalBruto - valorImpostoRenda - valorINSS - valorSindicato;

Console.WriteLine($"+ Salario bruto: R${totalBruto.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"- IR(11%): R${valorImpostoRenda.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"- INSS(8%): R${valorINSS.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"- Sindicato(5%): R${valorSindicato.ToString("F2", new CultureInfo("pt-br"))}");
Console.WriteLine($"= Salario liquido: R${string.Format(new CultureInfo("pt-br"), "{0:C}", salarioLiquido)}");