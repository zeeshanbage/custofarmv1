﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace CustoFarmDalc.Models
{
    public partial class orderdetail
    {
        public int DetailID { get; set; }
        public int DetailOrderID { get; set; }
        public int DetailProductID { get; set; }
        public string DetailName { get; set; }
        public double DetailPrice { get; set; }
        public string DetailSKU { get; set; }
        public int DetailQuantity { get; set; }
    }
}