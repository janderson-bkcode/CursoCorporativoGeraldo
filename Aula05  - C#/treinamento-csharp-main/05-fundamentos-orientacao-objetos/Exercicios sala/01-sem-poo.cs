using System.Globalization;

string nomeProduto01, nomeProduto02;
double precoProduto01, precoProduto02;
double quantidadeProduto01, quantidadeProduto02;
bool statusProduto01, statusProduto02;

//inputando dados
Console.WriteLine("Entre com o nome, preco, quantidade, valor e status (1 - Ativo, 2 - Inativo) do primeiro produto.");
nomeProduto01 = Console.ReadLine();
precoProduto01 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
quantidadeProduto01 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
statusProduto01 = Console.ReadLine() == "1" ? true : false;

Console.WriteLine("Entre com o nome, preco, quantidade, valor e status (1 - Ativo, 2 - Inativo) do segundo produto.");
nomeProduto02 = Console.ReadLine();
precoProduto02 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
quantidadeProduto02 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
statusProduto02 = Console.ReadLine() == "1" ? true : false;

Console.WriteLine("");

// calculando o valor total de cada produto
double valorTotalProduto01 = precoProduto01 * quantidadeProduto01;
double valorTotalProduto02 = precoProduto02 * quantidadeProduto02;

// imprimindo dados dos produtos
Console.WriteLine($"Nome: {nomeProduto01}, Quantidade: {quantidadeProduto01}, Valor: {precoProduto01:F2}, Status: {statusProduto01}");
Console.WriteLine($"Nome: {nomeProduto02}, Quantidade: {quantidadeProduto02}, Valor: {precoProduto02:F2}, Status: {statusProduto02}");

Console.WriteLine();

// mostrando os valores
Console.WriteLine($"Valor total {nomeProduto01}: {valorTotalProduto01:F2}");
Console.WriteLine($"Valor total {nomeProduto02}: {valorTotalProduto02:F2}");

// valor total dos produtos
Console.WriteLine($"Valor total: {(valorTotalProduto01 + valorTotalProduto02):F2}");
