namespace Programa01
{
    static class Program
    {
        static void Main(string[] args)
        {
            const double ano = 2022;
            Console.WriteLine($"Estamos no ano de {ano}");

            var textoDigitado = Console.ReadLine();

            Console.WriteLine($"Texto digitado = {textoDigitado}");

            Console.WriteLine($"A soma de 1 + 2 eh igual a {1 + 1}");
        }
    }
}