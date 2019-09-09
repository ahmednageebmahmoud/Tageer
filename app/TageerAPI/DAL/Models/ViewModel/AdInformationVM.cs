using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models.ViewModel
{
    public class AdInformationVM
    {
        
        public object CommentsCount { get; internal set; }
        public string Description { get; internal set; }
        public object FavoritesCount { get; internal set; }
        public int Id { get; internal set; }
        public IEnumerable<string> Images { get; internal set; }
        public string Price { get; internal set; }
        public string Province { get; internal set; }
        public string SinceDateTime { get; internal set; }
        public string Title { get; internal set; }
        public string UserName { get; internal set; }
        public List<PostFooterVM> FooterValues { get; set; }
        public bool IsFavorite { get; internal set; }
        public string AdPath { get; internal set; }
    }
}
