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

                    for (int row = 7; row <= range.RowCount(); row++)
                    {
                        var dado = new DadosExcel
                        {
                            Data = range.Cell(row, 1).Value.ToString(),
                            Origem = range.Cell(row, 2).Value.ToString(),
                            Cnpj = range.Cell(row, 3).Value.ToString(),
                            Nome  = range.Cell(row, 4).Value.ToString(),
                            TipoMovimento = range.Cell(row, 5).Value.ToString(),
                            Valor = range.Cell(row, 6).Value.ToString(),
                            EndToEnd = range.Cell(row, 7).Value.ToString(),
                            Condicao = range.Cell(row, 8).Value.ToString(),
                            DescCondicao = range.Cell(row, 9).Value.ToString(),
                            NumeroRemessa = range.Cell(row, 10).Value.ToString(),
                            AgenciaOrigem = range.Cell(row, 11).Value.ToString(),
                            AgenciaDestino = range.Cell(row,12).Value.ToString()
                        };

                        dados.Add(dado);
                    }
                }



                using (var contexto = new MeuDbContext())
                {
                    contexto.Alunos.AddRange(dados);
                    contexto.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View();
        }

    }
}
