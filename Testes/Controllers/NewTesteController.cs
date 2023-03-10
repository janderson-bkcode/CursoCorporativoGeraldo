using ClosedXML.Excel;
using Domain.Portal.Interface.Repository;
using Domain.Portal.Models.Entities;
using Domain.Portal.Models.Enums;
using Domain.Portal.Models.Request;
using Domain.Portal.Models.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Portal.Controllers
{
    public class PixTransactionConciliationController : BaseController
    {
        private readonly IPixTransactionConciliationRepository _IPixTransactionConciliationRepository;
        private readonly IExtractRepository _extractRepository;
        private readonly IRepository<PixMovimentoHistory> _repositoryPixMovimentoHistory;
        private readonly IRepository<PixTransactionConciliation> _repositoryPixTransactionConciliation;
        private readonly IRepository<Contact> _repositoryContact;
        private readonly IRepository<Extract> _repositoryExtract;
        private readonly IRepository<Transference> _repositoryTransference;
        private readonly IRepository<PixTransaction> _repositoryPixTransaction;

        public PixTransactionConciliationController(IPixTransactionConciliationRepository iPixTransactionConciliationRepository,
                                                    IExtractRepository extractRepository,
                                                    IRepository<PixMovimentoHistory> repository,
                                                    IRepository<PixTransactionConciliation> repositoryPixTransactionConciliation,
                                                    IRepository<Contact> repositoryContact,
                                                    IRepository<Transference> repositoryTransference,
                                                    IRepository<Extract> repositoryExtract,
                                                    IRepository<PixTransaction> repositoryPixTransaction
                                                    )
        {
            _IPixTransactionConciliationRepository = iPixTransactionConciliationRepository;
            _extractRepository = extractRepository;
            _repositoryPixMovimentoHistory = repository;
            _repositoryPixTransactionConciliation = repositoryPixTransactionConciliation;
            _repositoryContact = repositoryContact;
            _repositoryTransference = repositoryTransference;
            _repositoryExtract = repositoryExtract;
            _repositoryPixTransaction = repositoryPixTransaction;
        }

        public IActionResult Index()
        {
            return View();
        }

        public ActionResult _InsertSucess()
        {
            return View();
        }

        public IActionResult _DetailsTransactions(ListResponse<PixTransactionConciliation> pixTransactionConciliations, string parameters = null, string json = null)
        {
            ViewBag.Sucess = 1;
           
            ListResponse<Extract> listExtracts = _repositoryExtract.GetAllPaged(10000).Result;

            if (parameters != null) pixTransactionConciliations.Items = JsonConvert.DeserializeObject<List<PixTransactionConciliation>>(parameters);

            var filterExtracts = listExtracts.Items.Where(ex => pixTransactionConciliations.Items.Any(pix => pix.TransactionDate == ex.DateOperation)).ToList();
            var queryExtract = from extract in filterExtracts
                               where extract.StateId == 1 && extract.AuthenticationCode != null
                               select extract;

            ViewBag.Extract = queryExtract.ToList();
            ViewBag.PixTransaction = pixTransactionConciliations;
            return View("Index", pixTransactionConciliations);
        }

        public IActionResult _GridConciliation(ListResponse<PixTransactionConciliation> pixTransactionConciliations)
        {
            if (pixTransactionConciliations == null || pixTransactionConciliations.Items.Count <= 0)
            {
                ViewBag.Grid = -1;
            }

            ViewBag.Grid = 1;
            ViewBag.Sucess = 0;

            return View("Index", pixTransactionConciliations);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult LerArquivoEPopularClasse(IFormFile arquivo)
        {
            if (arquivo == null || arquivo.Length <= 0)
            {
                ViewBag.Message = "Nenhum arquivo Enviado";
                ViewBag.Sucess = -1;

                return View("Index");
            }

            string[] validImageTypes = new string[] { ".xlsx", ".xls" };

            string typeFile = arquivo.FileName.Substring(arquivo.FileName.LastIndexOf('.'));

            if (!validImageTypes.Contains(typeFile))
            {
                ViewBag.Message = "Formato de arquivo inválido, Envie apenas xlsx ou xls";
                ViewBag.Sucess = -1;

                return View("Index");
            }

            ListResponse<PixTransactionConciliation> pixTransactionConciliations = new ListResponse<PixTransactionConciliation>();
            pixTransactionConciliations.Items = new List<PixTransactionConciliation>();

            try
            {
                using (var workbook = new XLWorkbook(arquivo.OpenReadStream()))
                {
                    var worksheet = workbook.Worksheet(1);
                    var range = worksheet.RangeUsed();

                    for (int row = 7; row <= (range.RowCount() - 2); row++)
                    {
                        PixTransactionConciliation dado = new PixTransactionConciliation();
                        dado = dado.PopularClassePixTransactionConciliation(range, row);
                        pixTransactionConciliations.Items.Add(dado);
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = "Erro na leitura do arquivo";
                ViewBag.Sucess = -1;

                return View("Index");
            }

            return _DetailsTransactions(pixTransactionConciliations);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult LerExcelPopularClasse(IFormFile arquivo)
        {
            if (arquivo == null || arquivo.Length <= 0)
            {
                ViewBag.Message = "Nenhum arquivo Enviado";
                ViewBag.Sucess = -1;

                return View("Index");
            }

            string[] validImageTypes = new string[] { ".xlsx", ".xls" };

            string typeFile = arquivo.FileName.Substring(arquivo.FileName.LastIndexOf('.'));

            if (!validImageTypes.Contains(typeFile))
            {
                ViewBag.Message = "Formato de arquivo inválido, Envie apenas xlsx ou xls";
                ViewBag.Sucess = -1;

                return View("Index");
            }

            ListResponse<PixTransactionConciliation> pixTransactionConciliations = new ListResponse<PixTransactionConciliation>();
            pixTransactionConciliations.Items = new List<PixTransactionConciliation>();


            try
            {
                var excelDataList = new ConcurrentBag<PixTransactionConciliation>();
                using (var workbook = new XLWorkbook(arquivo.OpenReadStream()))
                {
                    var worksheet = workbook.Worksheet(1);
                    var rows = worksheet.RangeUsed();

                    Parallel.For(7, (rows.RowCount() - 2) + 1, row =>
                    {
                        PixTransactionConciliation dado = new PixTransactionConciliation();
                        dado = dado.PopularClassePixTransactionConciliation(worksheet, row);
                        excelDataList.Add(dado);
                    });
                    pixTransactionConciliations.Items = excelDataList.Cast<PixTransactionConciliation>().ToList();
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = "Erro na leitura do arquivo";
                ViewBag.Sucess = -1;

                return View("Index");
            }
            return _DetailsTransactions(pixTransactionConciliations);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult InserirConciliacao(string dataInicial, string dataFinal, IFormCollection form, string parameters = null)
        {
            string? submitButtonDenied = form["submitButtonDenied"];
            string? submitButtonApproved = form["submitButtonApproved"];

            ListResponse<PixTransactionConciliation> pixTransactionConciliations = new ListResponse<PixTransactionConciliation>();

            if (parameters != null) pixTransactionConciliations.Items = JsonConvert.DeserializeObject<List<PixTransactionConciliation>>(parameters);
            else
            {
                ViewBag.MessageTransaction = "Erro ao Conciliar";
                ViewBag.SucessTransaction = 0;

                return View("Index");
            }

            if (!string.IsNullOrEmpty(submitButtonApproved)) return InserirDadosConciliacaoAprovacao(pixTransactionConciliations, dataInicial, dataFinal);
            else if (!string.IsNullOrEmpty(submitButtonDenied)) return InserirTransacoesConciliacaoNegacao(pixTransactionConciliations, dataInicial, dataFinal);
            else
            {
                ViewBag.MessageTransaction = "Erro ao Conciliar";
                ViewBag.SucessTransaction = 0;

                return View("Index");
            }
        }

        public IActionResult InserirDadosConciliacaoAprovacao(ListResponse<PixTransactionConciliation> pixTransactionConciliations, string dataInicial, string dataFinal)
        {
            List<ExtractResponse> listExtracts = new List<ExtractResponse>();

            ListResponse<PixTransactionConciliation> listResponsePixTransactionGrid = new ListResponse<PixTransactionConciliation>();

            listResponsePixTransactionGrid.Items = new List<PixTransactionConciliation>();

            listExtracts = _extractRepository.GetExtractsPixTransactions().Result;

            var listPixNotInExtract = pixTransactionConciliations.Items
                .Where(pix => !listExtracts.Any(ex => pix.EndToEnd == ex.AuthenticationCode))
                .Where(pix => listExtracts.Any(ex => ex.DateOperation == pix.TransactionDate)).ToList();

            var compareTransactionsNotExists =
                      from transaction in listPixNotInExtract
                      where transaction.OperationType.Equals(1054) || transaction.OperationType.Equals(1072)
                      where transaction.TransactionDate >= Convert.ToDateTime(dataInicial) && transaction.TransactionDate <= Convert.ToDateTime(dataFinal)
                      select transaction;
            try
            {
                foreach (var transaction in compareTransactionsNotExists.Take(10).ToList())
                {
                    var insertedTransaction = _repositoryPixTransactionConciliation.Insert(transaction).Result;
                    listResponsePixTransactionGrid.Items.Add(insertedTransaction);
                }

                ViewBag.Aprovacao = true;
                ViewBag.PixTransactions = pixTransactionConciliations.Items;
                ViewBag.GridData = listResponsePixTransactionGrid;
                return _GridConciliation(pixTransactionConciliations);
            }
            catch (Exception e)
            {
                ViewBag.MessageTransaction = "Erro ao Inserir Transação";
                ViewBag.SucessTransaction = 0;
                ViewBag.PixTransactions = pixTransactionConciliations.Items;
                ViewBag.GridData = listResponsePixTransactionGrid;

                return _GridConciliation(pixTransactionConciliations);
            }
        }

        public IActionResult InserirTransacoesConciliacaoNegacao(ListResponse<PixTransactionConciliation> pixTransactionConciliations, string dataInicial, string dataFinal)
        {
            ListResponse<Extract> listResponseExtract = _repositoryExtract.GetAll().Result;

            ListResponse<PixTransactionConciliation> listResponsePixTransactionGrid = new ListResponse<PixTransactionConciliation>();

            listResponsePixTransactionGrid.Items = new List<PixTransactionConciliation>();

            var listExtractNotIntFile = listResponseExtract.Items.Where(ex => !pixTransactionConciliations.Items.Any(pix => pix.EndToEnd == ex.AuthenticationCode)).ToList();

            var compareTransactions =

                      from extract in listExtractNotIntFile
                      where extract.StateId.Equals(1)
                      where !string.IsNullOrWhiteSpace(extract.AuthenticationCode)
                      where extract.DateOperation >= Convert.ToDateTime(dataInicial) && extract.DateOperation <= Convert.ToDateTime(dataFinal)
                      select extract;

            try
            {
                foreach (var transaction in compareTransactions.Take(10).ToList())
                {
                    PixTransactionConciliation pixTransactionConciliation = new PixTransactionConciliation();
                    pixTransactionConciliation.EndToEnd = transaction.AuthenticationCode;
                    pixTransactionConciliation.TransactionDate = transaction.DateOperation;
                    pixTransactionConciliation.OperationType = transaction.OperationTypeId;
                    var insertedTransaction = _repositoryPixTransactionConciliation.Insert(pixTransactionConciliation).Result;
                    listResponsePixTransactionGrid.Items.Add(insertedTransaction);
                }
                ViewBag.Aprovacao = false;
                ViewBag.PixTransactions = pixTransactionConciliations.Items;

                return _GridConciliation(pixTransactionConciliations);
            }
            catch (Exception e)
            {
                ViewBag.MessageTransaction = "Erro ao Inserir Transação";
                ViewBag.SucessTransaction = 0;
                ViewBag.Aprovacao = false;
                ViewBag.PixTransactions = pixTransactionConciliations.Items;
                ViewBag.GridData = listResponsePixTransactionGrid;

                return _GridConciliation(pixTransactionConciliations);
            }
        }

        public IActionResult AprovarTransacao(string EndToEnd, string parameters)
        {
            ListResponse<PixTransactionConciliation> pixTransactionConciliations = new ListResponse<PixTransactionConciliation>();
            pixTransactionConciliations.Items = JsonConvert.DeserializeObject<List<PixTransactionConciliation>>(parameters);

            ListResponse<PixTransactionConciliation> listResponsePixTransactionGrid = new ListResponse<PixTransactionConciliation>();
            listResponsePixTransactionGrid.Items = JsonConvert.DeserializeObject<List<PixTransactionConciliation>>(parameters);

            ListResponse<PixMovimentoHistory> ListPixMovimento = _repositoryPixMovimentoHistory.GetAll().Result;

            ListResponse<Contact> listContact = _repositoryContact.GetAll().Result;

            try
            {
                var queryGetContact = from PixMovimentoHistory in ListPixMovimento.Items
                                      from Contact in listContact.Items
                                      from PixTransaction in pixTransactionConciliations.Items
                                      where pixTransactionConciliations.Items.Any(x => x.EndToEnd == EndToEnd)
                                      where Contact.NationalId == PixMovimentoHistory.CpfCnpj
                                      where PixMovimentoHistory.EndToEnd == EndToEnd
                                      select new { PixMovimentoHistory, Contact, PixTransaction };

                foreach (var data in queryGetContact.Where(x => x.PixTransaction.EndToEnd.Equals(EndToEnd)).Take(1).ToList())
                {
                    Extract extract = new Extract();
                    extract.ClientId = data.Contact.ClientId;
                    extract.StateId = 1;
                    extract.DateOperation = (DateTime)data.PixTransaction.TransactionDate;
                    extract.Date = data.PixMovimentoHistory.OperationDate;
                    extract.AuthenticationCode = EndToEnd;
                    extract.OperationTypeId = (int)data.PixTransaction.OperationType;
                    extract.Amount = data.PixTransaction.OperationType.Equals(1054) ? (double)data.PixTransaction.Amount * -1 : (double)data.PixTransaction.Amount;

                    Extract responseExtract = _repositoryExtract.Insert(extract).Result;

                    Transference transference = new Transference();
                    transference.ExtractId = responseExtract.ExtractId;
                    transference.RequestDate = responseExtract.DateOperation;
                    transference.Amount = (decimal)responseExtract.Amount;
                    transference.ContactId = data.Contact.ContactId;
                    transference.TransferenceTypeId = 1;

                    Transference responseTransference = _repositoryTransference.Insert(transference).Result;

                    PixTransaction pixTransaction = new PixTransaction();
                    pixTransaction.ExtractId = responseTransference.ExtractId;
                    pixTransaction.EndToEnd = EndToEnd;
                    pixTransaction.PixTransactionStatusId = responseExtract.OperationTypeId.Equals(1054) ? 1 : 6;

                    PixTransaction responsePixTransaction = _repositoryPixTransaction.Insert(pixTransaction).Result;

                    foreach (var pixTransactionConciliation in pixTransactionConciliations.Items.Where(x => x.EndToEnd.Equals(EndToEnd)).ToList())
                    {
                        pixTransactionConciliations.Items.Remove(pixTransactionConciliation);
                        pixTransactionConciliation.IsConciliated = true;
                        pixTransactionConciliation.UserNameId = user.UserNameId;
                        _repositoryPixTransactionConciliation.Update(pixTransactionConciliation);
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.MessageTransaction = "Erro ao Aprovar Transação";
                ViewBag.SucessTransaction = 0;
                ViewBag.Aprovacao = true;
                ViewBag.PixTransactions = listResponsePixTransactionGrid.Items;

                return _GridConciliation(pixTransactionConciliations);
            }
            ViewBag.MessageTransaction = "Transação Aprovada com Sucesso";
            ViewBag.SucessTransaction = 1;
            ViewBag.Aprovacao = true;
            ViewBag.PixTransactions = listResponsePixTransactionGrid.Items;

            return _GridConciliation(pixTransactionConciliations);
        }

        public IActionResult NegarTransacao(string EndToEnd, string parameters)
        {
            ListResponse<PixTransactionConciliation> pixTransactionConciliations = new ListResponse<PixTransactionConciliation>();

            pixTransactionConciliations.Items = JsonConvert.DeserializeObject<List<PixTransactionConciliation>>(parameters);

            ListResponse<Extract> listResponseExtract = _repositoryExtract.GetAll().Result;

            try
            {
                var queryGetExtractToDenied = from extract in listResponseExtract.Items
                                              where extract.AuthenticationCode == EndToEnd
                                              select extract;

                if (queryGetExtractToDenied == null) throw new ArgumentException("Erro na Conciliação");

                foreach (var extract in queryGetExtractToDenied.ToList())
                {
                    extract.StateId = (int)OperationStateEnum.Negado;
                    Extract responseExtract = _repositoryExtract.Update(extract).Result;

                    foreach (var pixTransactionConciliation in pixTransactionConciliations.Items.Where(x => x.EndToEnd.Equals(EndToEnd)).ToList())
                    {
                        pixTransactionConciliations.Items.Remove(pixTransactionConciliation);
                        pixTransactionConciliation.IsConciliated = true;
                        pixTransactionConciliation.UserNameId = user.UserNameId;
                        _repositoryPixTransactionConciliation.Update(pixTransactionConciliation);
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.MessageTransaction = "Erro ao Negar Transação";
                ViewBag.SucessTransaction = 0;
                ViewBag.Aprovacao = false;
                ViewBag.PixTransactions = pixTransactionConciliations.Items;

                return _GridConciliation(pixTransactionConciliations);
            }
            ViewBag.MessageTransaction = "Transação Negada com Sucesso";
            ViewBag.SucessTransaction = 1;
            ViewBag.Aprovacao = false;
            ViewBag.PixTransactions = pixTransactionConciliations.Items;

            return _GridConciliation(pixTransactionConciliations);
        }

        private ListResponse<PixTransactionConciliation> Pagination(ListResponse<PixTransactionConciliation> pixTransactionConciliations)
        {
            PaginationRequest request = new PaginationRequest()
            {
                Page = 1,
                PageSize = 999999,
            };
            request.User = user;
            PaginationResponse pagination = new PaginationResponse
            {
                Page = request.Page
            };
            pagination.TotalEntries = pixTransactionConciliations.Items.Count;
            pagination.Entries = pixTransactionConciliations.Items.Count;
            pagination.TotalPages = (int)Math.Ceiling(((double)pagination.TotalEntries / (double)request.PageSize));
            pixTransactionConciliations.Pagination = pagination;

            SetViewBagPagination(request.Page, pixTransactionConciliations.Pagination.TotalPages);

            return pixTransactionConciliations;
        }
    }
}