using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.Storage.Table;
using Microsoft.WindowsAzure.Storage.Queue;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcWebRole1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            UserEntity user = (UserEntity)Session["LoggerInfo"];
            ViewBag.image = user.PictureUrl;
            ViewBag.user = user.PartitionKey;
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
    [HttpPost]
        public ActionResult Login(FormCollection frm1)
        {
            TableStorageService XYZ = new TableStorageService();
            CloudTable table = XYZ.GetCloudTable();
            TableOperation retrieve = TableOperation.Retrieve<UserEntity>(frm1["txtuserName"].ToString(), frm1["txtpassword"].ToString());
            TableResult result = table.Execute(retrieve);

            Session["LoggerInfo"] = result.Result;
            if (result.HttpStatusCode == 200)
            { return RedirectToAction("Index"); }
            else
            {
                BlobStorageService abc = new BlobStorageService();
                CloudQueue queue = abc.GetCloudQueue();
                queue.FetchAttributes();
                int count = Convert.ToInt32(queue.ApproximateMessageCount);
                ViewBag.msg = queue.GetMessage().AsString;
               //for (int i = 0; i <= count-1; i++)
               // {
               //     //if(i==1)

               //     var msg = queue.GetMessage();
               //     ViewBag.msg = msg.AsString;
               //     queue.DeleteMessage(msg);
                  
               
               // }
            }
            return View();
        }

        public ActionResult Register()
        {
 
               return View();
        }
    [HttpPost]
        public ActionResult Register(FormCollection frm, HttpPostedFileBase uploadfile)
        {
            TableStorageService XYZ = new TableStorageService();
            CloudTable table = XYZ.GetCloudTable();
      
            var query = (from x in table.CreateQuery<UserEntity>() where x.PartitionKey == frm["txtuserName"] select x).ToList();
            if (query.Count==0)
            {
                BlobStorageService abc = new BlobStorageService();
                CloudBlobContainer blobContainer = abc.GetCloudBlobContainer();
                CloudBlockBlob blockBlob = blobContainer.GetBlockBlobReference(uploadfile.FileName);
                blockBlob.UploadFromStream(uploadfile.InputStream);

                CloudQueue queue = abc.GetCloudQueue();
                CloudQueueMessage message = new CloudQueueMessage("Either user name or password are incorrect.Please enter correct input.");
                queue.AddMessage(message);

                UserEntity user = new UserEntity();
                user.PhoneNo = frm["txtphone"];
                user.PictureUrl = blockBlob.Uri.ToString();
                user.Email = frm["txtemail"].ToString();
                user.RowKey = frm["txtpassword"];
                user.PartitionKey = frm["txtuserName"];

                TableOperation insert = TableOperation.Insert(user);
                table.Execute(insert);
                return RedirectToAction("Login");
            }
            else
            {
                ViewBag.msg = "please try another user name";
                return View();
            }

            
        }
    }
}
