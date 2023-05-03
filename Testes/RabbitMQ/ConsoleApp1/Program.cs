using Newtonsoft.Json;

namespace ConsoleApp1
{
    class Program
    {
       public static void Main(string[] args)
        {
            //Consumindo api dos Correios
            HttpClient client = new HttpClient();

            //Aqui temos a url base do site que é o "https://viacep.com.br/ws que vamos consultar e faze a requisição
            // depois o valor do cep que é 14010080
            // e no final queremos o dados em json
            var response =  client.GetAsync("https://viacep.com.br/ws/14010080/json/").Result;

            //pegamos os dados da consulta e guardamos numa string, porém o formato é um objeto de dados em json
            var json = response.Content.ReadAsStringAsync().Result;

            //Deserialiamos o conteudo e guardamos na classe Endereço que tem propriedades com o mesmo nome
            Endereco endereco =  JsonConvert.DeserializeObject<Endereco>(json);

            //Imprimimos os dados
            Console.WriteLine($"Logradouro :{endereco.logradouro}, Cep{endereco.cep}");
            Console.ReadLine();
        }


    }

    // Classe para ser populada e guardar dados 
    public class Endereco
    {
        public string? cep { get; set; }
        public string? logradouro { get; set; }
    }
}