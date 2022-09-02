using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;


namespace ConsumoAPI
{
    public class Program
    {
        static void Main(string[] args)
        {
            string endPoint = "http://api.bcb.gov.br/dados/serie/bcdata.sgs.12/dados/ultimos/2?formato=json";
            HttpClient httpClient = new HttpClient();



            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, endPoint);
            request.Headers.Add("User-Agent", "HOST");



            HttpResponseMessage test = httpClient.SendAsync(request).Result;



            string json = test.Content.ReadAsStringAsync().Result;



            Console.WriteLine(json);
        }
    }
}
