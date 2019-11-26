using System;
using System.Collections.Generic;
using Brewgr.Web.Core.Model;

namespace Brewgr.Web.Models
{
	public class BjcpCategoryViewModel
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
		/// Gets or sets the RecipeCount
		/// </summary>
		public int RecipeCount { get; set; }

		/// <summary>
		/// Gets or sets the Styles
		/// </summary>
		public IList<BjcpStyleSummary> Styles { get; set; }
	}
}