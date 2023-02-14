using System.ComponentModel.DataAnnotations;

namespace WebApplicationTesteFormUploadFileAndPersist.Models
{
    public class DadosExcel
    {
        [Key]
        public int Id { get; set; }
        public DateTime? Data { get; set; }
        public string? Origem { get; set; }
        public string? Cnpj { get; set; }
        public string? Nome { get; set; }
        public string? TipoMovimento { get; set; }
        public decimal? Valor { get; set; }
        public string? EndToEnd { get; set; }
        public string? Condicao { get; set; }
        public string? DescCondicao { get; set; }
        public string? NumeroRemessa { get; set; }
        public string? AgenciaOrigem { get; set; }
        public string? AgenciaDestino { get; set; }

        public override string ToString()
        {
            return $"Data : {Data} Origem: {Origem} Cnpj=> {Cnpj} Nome => {Nome}{TipoMovimento}";
        }
    }                
}