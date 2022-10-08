using System.Globalization;

string primeiroNome = "Willian";
int primeiraIdade = 26;

Console.WriteLine($"O {primeiroNome} possui {primeiraIdade} anos.");

string segundoNome = "Willian";
int segundaIdade = 26;

Console.WriteLine($"O {segundoNome} possui {segundaIdade} anos.");

string nomeEletronico = "PC Gamer";
decimal valorEletronico = 3000;

Console.WriteLine(
    $"O valor de um {nomeEletronico} eh R${valorEletronico.ToString("F2", new CultureInfo("pt-br"))} anos.");

string nomeMovel = "Cadeira escritorio";
decimal valorMovel = 1700;

Console.WriteLine(
    $"O valor de uma {nomeMovel} eh R${valorMovel.ToString("F2", new CultureInfo("pt-br"))} anos.");