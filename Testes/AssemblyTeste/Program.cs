using System;
using System.Reflection;
using System;

namespace AssemblyTeste
{
    class Program
    {
        public static void Main(string[] args)
        {
            Assembly assembly = typeof(Program).Assembly;
            System.Console.WriteLine("Nome do Assembly");
            System.Console.WriteLine(assembly.FullName);

            AssemblyName assemblyName = assembly.GetName();
            System.Console.WriteLine("\nNome:{0}",assemblyName.Name);
            System.Console.WriteLine("\nVersion:{0}{1}",assemblyName.Version.Major,assemblyName.Version.Minor);

            System.Console.WriteLine("\nCode base");
            System.Console.WriteLine(assembly.CodeBase);

            System.Console.WriteLine("\nAssembly EntryPoint");
            System.Console.WriteLine(assembly.EntryPoint);

            System.Console.WriteLine();
            DateTime dataCriacao = File.GetCreationTime(assembly.Location);
            System.Console.WriteLine("\nData Criação",dataCriacao);

        }
    }
    
}