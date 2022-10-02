using System.Globalization;
using System.Text;

Console.WriteLine("Informe um numero inteiro: ");
var numero = int.Parse(Console.ReadLine());

for (var i = 1; i <= numero; i++)
{
    for (var j = 1; j <= i; j++)
    {
        Console.Write(i);
    }

    Console.WriteLine("");
}

for (var i = 1; i <= numero; i++)
{
    for (var j = 1; j <= i; j++)
    {
        Console.Write(j);
    }

    Console.WriteLine("");
}

Console.WriteLine("-------------------------------------------------");

Console.WriteLine("Informe um numero inteiro para calcular a tabuada: ");
var indiceTabuada = int.Parse(Console.ReadLine());

Console.WriteLine($"Tabuada do {indiceTabuada}: ");
for (var i = 1; i <= 10; i++)
{
    Console.WriteLine($"{indiceTabuada} * {i} = {indiceTabuada * i}");
}

Console.WriteLine("Informe um range de dois numeros para efetuar o calculo: ");
var inicio = int.Parse(Console.ReadLine());
var fim = int.Parse(Console.ReadLine());

Console.WriteLine($"Tabuada do {indiceTabuada}: ");
for (var i = inicio; i <= fim; i++)
{
    Console.WriteLine($"{indiceTabuada} * {i} = {indiceTabuada * i}");
}

Console.WriteLine("-------------------------------------------------");

int codigo, quantidade;
StringBuilder itens = new();
double total = 0;

do
{
    Console.Clear();
    Console.WriteLine("Lanchonete do TIOZE");
    Console.WriteLine("Cardapio: ");
    Console.WriteLine(@"
    cod: 100 - Cachorro quente  - R$1,20
    cod: 101 - Bauru simples    - R$1,30
    cod: 102 - Bauru com ovo    - R$1,50
    cod: 103 - Hamburguer       - R$1,20
    cod: 104 - Cheese Burguer   - R$1,30
    cod: 105 - Refrigerante     - R$1,00
    ");

    Console.WriteLine("Codigo do produto e sua quantidade- (0 - para calcular o pedido)");
    codigo = int.Parse(Console.ReadLine());
    quantidade = int.Parse(Console.ReadLine());

    switch (codigo)
    {
        case 100:
            total += (1.2 * quantidade);
            itens.Append(
                $"Cachorro Quente (R$1,20 * {quantidade}) = R${(quantidade * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 101:
            total += (1.3 * quantidade);
            itens.Append(
                $"Bauru simples (R$1,30 * {quantidade}) = R${(quantidade * 1.3).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 102:
            total += (1.5 * quantidade);
            itens.Append(
                $"Bauru com ovo (R$1,50 * {quantidade}) = R${(quantidade * 1.5).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 103:
            total += (1.2 * quantidade);
            itens.Append(
                $"Hamburguer (R$1,20 * {quantidade}) = R${(quantidade * 1.2).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 104:
            total += (1.3 * quantidade);
            itens.Append(
                $"Cheese Burguer (R$1,30 * {quantidade}) = R${(quantidade * 1.3).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 105:
            total += (1 * quantidade);
            itens.Append(
                $"Refrigerante (R$1,00 * {quantidade}) = R${(quantidade * 1).ToString("F2", CultureInfo.InvariantCulture)}\n");
            break;
        case 0:
            itens.Append($"\nTotal = R${total.ToString("F2", CultureInfo.InvariantCulture)}");
            break;
    }
} while (codigo != 0);

Console.WriteLine(itens.ToString());