﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DataAccess
{
    public partial class SalesOrder
    {
        public SalesOrder()
        {
            SalesOrderDetails = new HashSet<SalesOrderDetail>();
            SalesOrderShipments = new HashSet<SalesOrderShipment>();
        }

        [Key]
        public int SalesOrderId { get; set; }
        public int ItemsCount { get; set; }
        [Column("SOTotal", TypeName = "decimal(10, 2)")]
        public decimal Sototal { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime OrderDate { get; set; }

        [InverseProperty(nameof(SalesOrderDetail.SalesOrder))]
        public virtual ICollection<SalesOrderDetail> SalesOrderDetails { get; set; }
        [InverseProperty(nameof(SalesOrderShipment.SalesOrder))]
        public virtual ICollection<SalesOrderShipment> SalesOrderShipments { get; set; }
    }
}