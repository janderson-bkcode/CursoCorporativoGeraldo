using System.Globalization;

Console.WriteLine("Digite o seu nome");
string nomePessoa = Console.ReadLine();
Console.WriteLine("O seu nome eh {0}", nomePessoa);

Console.WriteLine("----------------------------------------------");

Console.WriteLine("Digite o primeiro numero: ");
int x = int.Parse(Console.ReadLine());

Console.WriteLine("Digite o segundo numero: ");
int y = int.Parse(Console.ReadLine());
int resultado = x + y;

Console.WriteLine($"O valor da soma entre {x} e {y} eh {resultado}");

Console.WriteLine("----------------------------------------------");

Console.WriteLine("Digite o primeiro numero com casas decimais(virgula): ");
double dx = double.Parse(Console.ReadLine(), new CultureInfo("pt-BR"));

Console.WriteLine("Digite o segundo numero com casas decimais(ponto): ");
double dy = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
double dResultado = dx + dy;

Console.WriteLine($"O valor da soma entre {dx} e {dy} eh {dResultado.ToString("F2", new CultureInfo("pt-br"))}");

Console.WriteLine("----------------------------------------------");
Console.WriteLine("Digite nome, idade, sexo e altura(em cm) consecutivamente separados por espaco.");
string[] dados = Console.ReadLine().Split(" ");

Console.WriteLine($"Ola, seu nome eh: {dados[0]} e voce tem {dados[1]} anos, seu sexo eh {dados[2]} e sua altura eh: {dados[3]}cm");