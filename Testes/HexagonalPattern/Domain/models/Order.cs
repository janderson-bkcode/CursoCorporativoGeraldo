using Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.models
{
    public class Order
    {
        public async Task<OrderComand> Create(OrderComand comand)
        {
            return comand;
        }

    }

    
}
