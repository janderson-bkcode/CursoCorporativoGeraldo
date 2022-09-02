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
            string endPoint = "https://kitsu.io/api/edge/anime?canonicalTitle=Naruto";
            HttpClient httpClient = new HttpClient();



            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, endPoint);
            request.Headers.Add("User-Agent", "HOST");



            HttpResponseMessage test = httpClient.SendAsync(request).Result;



            string json = test.Content.ReadAsStringAsync().Result;



            Console.WriteLine(json);
        }
    }
}
