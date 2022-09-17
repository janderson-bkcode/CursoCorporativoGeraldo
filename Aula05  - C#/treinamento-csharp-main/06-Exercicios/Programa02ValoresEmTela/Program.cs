using System.Globalization;

namespace Programa02ValoresEmTela
{
    static class Program
    {
        static void Main(string[] args)
        {
            // colocando valores em tela sem pular linha
            Console.Write("Valor 01");
            Console.Write("Valor 02");

            // colocando valores em tela pulando linha
            Console.WriteLine("Valor 03");
            Console.WriteLine("Valor 04");

            // concatenando strings
            string nome = "Willian Menezes";
            Console.WriteLine("Ola, meu nome eh: " + nome + ", sejam bem vindos!");

            // interpolacao, placeholder e concatenacao
            int idade = 26;
            int anoNascimento = 1995;

            // concatenacao
            Console.WriteLine("Ola, eu tenho " + idade + " anos e nasci em " + anoNascimento);

            // interpolacao
            Console.WriteLine($"Ola, eu tenho {idade} anos e nasci em {anoNascimento}");

            // placeholder
            Console.WriteLine("Ola, eu tenho {0} anos e nasci em {1}", idade, anoNascimento);
            
            // formatando numeros e casas decimais
            decimal valorApartamento = 150000m;
            float valorCarro = 75000f;
            double valorMoto = 30000;

            Console.WriteLine($"O valor do apartamento eh: {valorApartamento:F2}");
            Console.WriteLine("O valor do carro eh: " + valorCarro.ToString("F2", new CultureInfo("pt-br")));
            Console.WriteLine($"O valor da moto eh: {0.ToString("F2", CultureInfo.InvariantCulture)}", valorMoto);
        }
    }
}