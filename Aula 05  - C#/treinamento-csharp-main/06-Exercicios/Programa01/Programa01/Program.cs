namespace Programa01
{
    static class Program
    {
        static void Main(string[] args)
        {
            var teste = new MyClass();
            var test2 = 2;
            funcaoTeste(ref test2);
        }

        static void funcaoTeste(ref int teste2)
        {
            var nome = "Willian";
        }
    }

    class MyClass
    {
        
    }
}