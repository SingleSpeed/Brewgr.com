using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Brewgr.Web.Core.Model
{
    public class BjcpStyleGroup
    {
        /// <summary>
        /// Gets or sets the CategoryId
        /// </summary>
        public int CategoryId { get; set; }

        /// <summary>
        /// Gets or sets the CategoryName
        /// </summary>
        public string CategoryName { get; set; }

        /// <summary>
        /// Gets or sets the Recipes
        /// </summary>
        public IList<BjcpStyleSummary> BjcpStyleSummaries { get; set; }
    }
}
