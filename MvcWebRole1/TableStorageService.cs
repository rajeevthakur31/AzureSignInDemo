using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace MvcWebRole1
{
    public class TableStorageService
    {
        public CloudTable GetCloudTable()
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("StorageConnectionString"));
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
            CloudTable table = tableClient.GetTableReference("UserInfo");
            table.CreateIfNotExists();
            return table;

        }
 
    }
    public class UserEntity : TableEntity
    {
        //public UserEntity(string UserName, string PhoneNo)
        //{
        //    this.PartitionKey = "UserName";
        //    this.RowKey = "PhoneNo";
        //}
        public UserEntity() { }

       
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string PictureUrl { get; set; }
        
    }
}