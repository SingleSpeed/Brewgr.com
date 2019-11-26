using System;
using System.Collections.Generic;
using System.Linq;

namespace Brewgr.Web.Core.Model
{
    public class BjcpStyleSummary
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
		/// Gets or sets the SubCategoryId
		/// </summary>
		public string SubCategoryId { get; set; }

		/// <summary>
		/// Gets or sets the SubCategoryName
		/// </summary>
		public string SubCategoryName { get; set; }

		/// <summary>
		/// Gets or sets the UrlFriendyName
		/// </summary>
		public string UrlFriendlyName { get; set; }

		/// <summary>
		/// Gets or sets the RecipeCount
		/// </summary>
		public int RecipeCount { get; set; }

		/// <summary>
		/// Gets or sets the Recipes
		/// </summary>
		public IList<Recipe> Recipes { get; set; }
	}
}