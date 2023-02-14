using ClosedXML.Excel;
using Microsoft.AspNetCore.Mvc;
using WebApplicationTesteFormUploadFileAndPersist.Data;
using WebApplicationTesteFormUploadFileAndPersist.Models;

namespace WebApplicationTesteFormUploadFileAndPersist.Controllers
{
    public class ExcelController : Controller
    {
        [Route("")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReceberArquivo(IFormFile arquivo)
        {
            if (arquivo != null && arquivo.Length > 0)
            {
                var dados = new List<DadosExcel>();

                using (var workbook = new XLWorkbook(arquivo.OpenReadStream()))
                {
                    var worksheet = workbook.Worksheet(1); // Usa a primeira planilha de trabalho
                    var range = worksheet.RangeUsed(); // verifica os ranges que estão sendo usados(d5:d6) por exemplo

                    for (int row = 7; row <= (range.RowCount() - 2); row++)// Eliminando a leitura das duas utimas linhas que são o total
                    {
                        var dado = new DadosExcel
                        {
                            Data = Convert.ToDateTime(range.Cell(row, 1).Value.ToString()),
                            Origem = range.Cell(row, 2).Value.ToString(),
                            Cnpj = range.Cell(row, 3).Value.ToString(),
                            Nome = range.Cell(row, 4).Value.ToString(),
                            TipoMovimento = range.Cell(row, 5).Value.ToString(),
                            Valor = Convert.ToDecimal(range.Cell(row, 6).Value.ToString()),
                            EndToEnd = range.Cell(row, 7).Value.ToString(),
                            Condicao = range.Cell(row, 8).Value.ToString(),
                            DescCondicao = range.Cell(row, 9).Value.ToString(),
                            NumeroRemessa = range.Cell(row, 10).Value.ToString(),
                            AgenciaOrigem = range.Cell(row, 11).Value.ToString(),
                            AgenciaDestino = range.Cell(row, 12).Value.ToString()
                        };

                        dados.Add(dado);
                    }
                }

                var query = from excel in dados
                            where excel.TipoMovimento.Equals("CREDITO") // PIX RECEBIDO
                            select excel;

                var query2 = from excel2 in dados
                             where excel2.TipoMovimento.Equals("DEBITO") //PIX ENVIADO
                             select excel2;

                foreach (var item in query)
                {
                    Console.WriteLine($"Credito {item.EndToEnd}");
                }
                foreach (var item in query2)
                {
                    Console.WriteLine($"Débito {item.EndToEnd}");
                }

                using (var contexto = new MeuDbContext())
                {
                    contexto.PixTransactionConciliation.AddRange(dados);
                    contexto.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View();
        }
    }
}