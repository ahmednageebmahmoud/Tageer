﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL.Models.ViewModel
{
    public class FileSaveVM
    {
        //    public HttpPostedFileBase File { get; set; }
        public string FileBase64 { get; set; }
        /// <summary>
        /// /Files/Images/Users/Profile/
        /// </summary>
        public string ServerPathSave { get; set; }
        public string SavedPath { get; set; }
        public string Extension { get; set; }
        public bool IsSave { get; set; }


    }
}
