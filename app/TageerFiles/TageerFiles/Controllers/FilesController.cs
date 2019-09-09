using DAL;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TageerFiles.Controllers
{
    [RoutePrefix("Tageer/Api/Files")]
    public class FilesController : ApiController
    {
        [Route("Post")]
        [HttpPost]
        public IHttpActionResult PostFile(FileVM file)
        {
            return Json(FileService.SaveFile(file));
        }

        [Route("Delete")]
        [HttpPost]
        public IHttpActionResult DeleteFile(List<string> files)
        {
            FileService.DeleteFile(files);
            return Ok();
        }
    }
}
