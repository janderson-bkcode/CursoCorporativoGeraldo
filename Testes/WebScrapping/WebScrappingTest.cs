using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace 
{
    public class WebScrappingTest
    {
        using HtmlAgilityPack;
using System;
using System.Net;

class Program
{
    static void Main(string[] args)
    {
        // URL da página a ser raspada
        string url = "https://www.example.com";

        // Faz o download da página
        WebClient webClient = new WebClient();
        string html = webClient.DownloadString(url);

        // Carrega o HTML em um objeto HtmlDocument
        HtmlDocument doc = new HtmlDocument();
        doc.LoadHtml(html);

        // Seleciona todos os elementos com a tag "a"
        var links = doc.DocumentNode.SelectNodes("//a");

        // Imprime o conteúdo de cada link
        if (links != null)
        {
            foreach (var link in links)
            {
                Console.WriteLine(link.InnerText);
            }
        }
    }
}

    }
}