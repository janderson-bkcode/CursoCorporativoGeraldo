using System.Globalization;

Console.WriteLine("Digita uma data nesse formato (DD-MM-AAAA)");
string[] valores = Console.ReadLine().Split("-");

var dataSimples = new DateTime(int.Parse(valores[2]), int.Parse(valores[1]), int.Parse(valores[0]));
Console.WriteLine($"Data formatada: {DataFormatada(dataSimples)}");

string DataFormatada(DateTime data)
{
    return $"{data.Day} de {FormatarMesPorExtenso(data.Month)} de {data.Year}";
}

string FormatarMesPorExtenso(int mes)
{
    return mes switch
    {
        1 => "Janeiro",
        2 => "Fevereiro",
        3 => "Marco",
        4 => "Abriu",
        5 => "Maio",
        6 => "Junho",
        7 => "Julho",
        8 => "Agosto",
        9 => "Setembro",
        10 => "Outubro",
        11 => "Novembro",
        12 => "Dezembro",
        _ => "Mes invalido!"
    };
}

Console.WriteLine("-----------------------------------------");

double custo = 400;
double taxa = 0.1;
custo = SomaImposto(taxa, custo);
Console.WriteLine(custo);

double custo2 = 400;
double taxa2 = 0.1;
SomaImpostoRef(taxa2, ref custo2);
Console.WriteLine(custo2);

double SomaImposto(double taxa, double custo)
{
    return custo + (custo * taxa);
}

void SomaImpostoRef(double taxa, ref double custo)
{
    custo += (custo * taxa);
}

Console.WriteLine("-----------------------------------------");

Console.WriteLine("Qual o valor da prestacao? ");
double valorPrestacao = double.Parse(Console.ReadLine());

Console.WriteLine("Quantidade de dias em atraso? ");
int diasEmAtraso = int.Parse(Console.ReadLine());

Console.WriteLine(
    $"Valor da prestacao: R${ValorPagamento(valorPrestacao, diasEmAtraso).ToString("F2", new CultureInfo("pt-br"))}");

double ValorPagamento(double valorPrestacao, int diasEmAtraso)
{
    if (diasEmAtraso == 0)
        return valorPrestacao;

    return valorPrestacao + (valorPrestacao * 0.03) + ((valorPrestacao * 0.001) * diasEmAtraso);
}