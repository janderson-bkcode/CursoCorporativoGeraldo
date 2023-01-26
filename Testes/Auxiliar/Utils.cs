using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Auxiliar
{
    public class Utils{}
    
    // PARA SALVAR NO BANCO SQL O DATETIME NOW SEM PRECISAR USAR O GETDATE()
    // 

    //   SinceDate = (String.IsNullOrEmpty(request.SinceDate.ToString())) ? null : Convert.ToDateTime(request.SinceDate).ToString("yyyy-MM-dd 00:00:00"),
    //   UntilDate = (String.IsNullOrEmpty(request.UntilDate.ToString())) ? null : Convert.ToDateTime(request.UntilDate).ToString("yyyy-MM-dd 23:59:59"),
    // (String.IsNullOrEmpty(request.Description) ? null : "%" + request.Description?.Trim() + "%"),



                  DateTime CreateAt = Convert.ToDateTime(DateTime.Now).ToString("yyyy-MM-dd   HH:mm:ss"),
                  DateTime  UpdateAt = Convert.ToDateTime(DateTime.Now).ToString("yyyy-MM-dd   HH:mm:ss"),


    //EXEMPLO DE DIV PARA RECEBER UMA LISTA DE PARAMETROS, PRECISAR DO TIPO SELECTLIST
    //     @*      <div class="form-group has-feedback col-md-3">
    //                 <label asp-for="ProjectId">Projeto</label>
    //                 <select asp-items="Model.TagOptions" asp-for="ProjectId" id="ProjectId" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="2" tabindex="-1" aria-hidden="true">
    //                 </select>
    //             </div>*@
    // 
}