using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Brewgr.Web.Core.Data;
using Brewgr.Web.Core.Model;
using Brewgr.Web.Core.Service;
using Brewgr.Web.Models;
using StackExchange.Exceptional;
using ctorx.Core.Collections;
using ctorx.Core.Data;
using System.Web;
using System.Xml;
using System.Collections.Generic;
using ctorx.Core.Messaging;
using ctorx.Core.Security;

namespace Brewgr.Web.Controllers
{
	[ForceHttps]
	[Authorize]
	public class AdminController : BrewgrController
	{
		readonly IUnitOfWorkFactory<BrewgrContext> UnitOfWorkFactory;
		readonly IUserService UserService;
		readonly IAdminService AdminService;
		readonly IMarketingService MarketingService;
		readonly IRecipeDataService BrewDataService;
        readonly IBeerStyleService BeerStyleService;
		readonly IAffiliateService AffiliateService;
		readonly IAuthenticationService AuthenticationService;
		readonly ISendToShopService SendToShopService;

		/// <summary>
		/// ctor the Mighty
		/// </summary>
		public AdminController(IUnitOfWorkFactory<BrewgrContext> unitOfWorkFactory, IUserService userService, IAdminService adminService, 
			IMarketingService marketingService, IRecipeDataService brewDataService, IBeerStyleService beerStyleService,
			IAffiliateService affiliateService, IAuthenticationService authenticationService, ISendToShopService sendToShopService)
		{
			this.UnitOfWorkFactory = unitOfWorkFactory;
			this.UserService = userService;
			this.AdminService = adminService;
			this.MarketingService = marketingService;
			this.BrewDataService = brewDataService;
            this.BeerStyleService = beerStyleService;
			this.AffiliateService = affiliateService;
			this.AuthenticationService = authenticationService;
			this.SendToShopService = sendToShopService;
		}

		/// <summary>
		/// Fires on Authorization
		/// </summary>
		protected override void OnAuthorization(AuthorizationContext filterContext)
		{
            base.OnAuthorization(filterContext);

            // Additional Check to Veriy Admin User
            if (this.ActiveUser == null || !this.UserService.UserIsAdmin(this.ActiveUser.UserId))
            {
                this.Issue404();
            }
        }

		/// <summary>
		/// Executes the ImpersonateView
		/// </summary>
		public ActionResult Impersonate(string username)
		{
			var user = this.UserService.GetUserByUserName(username);

			if (user == null)
			{
				return this.Issue404();
			}

			this.AuthenticationService.SignOut();
			this.AuthenticationService.SignIn(user.UserId.ToString(), false);
			Session.Abandon();

			return RedirectToAction("Index", "Root");
		}
		

		/// <summary>
		/// Executes the View for Tools
		/// </summary>
		public ViewResult Tools()
		{
			var siteStats = this.AdminService.GetSiteStats();

			// Get Suggestions
			ViewBag.Suggestions = this.MarketingService.GetFeedback();

			// Get Custom Ingredients
			ViewBag.CustomFermentables = this.BrewDataService.GetNonPublicIngredients<Fermentable>(25);
			ViewBag.CustomHops = this.BrewDataService.GetNonPublicIngredients<Hop>(25);
			ViewBag.CustomYeasts = this.BrewDataService.GetNonPublicIngredients<Yeast>(25);
			ViewBag.CustomAdjuncts = this.BrewDataService.GetNonPublicIngredients<Adjunct>(25);

            ViewBag.Images = GetAllImages();

            return View(siteStats);
		}

        public string[] GetAllImages()
        {
            string[] allfiles = Directory.GetFiles(@"C:\Sites\Brewgr\Media\img\r", "*.jpg", SearchOption.AllDirectories);
            return allfiles;
        }

		/// <summary>
		/// Executes the View for Exceptions
		/// </summary>
		public ActionResult Exceptions(string resource, string subResource)
		{
			var context = System.Web.HttpContext.Current;
			var page = new HandlerFactory().GetHandler(context, Request.RequestType, Request.Url.ToString(), Request.PathInfo);
			page.ProcessRequest(context);

			return null;
		}

		/// <summary>
		/// Executes the UploadStyle View
		/// </summary>
		[HttpPost]
        public ActionResult UploadStyle(HttpPostedFileBase stylefile)
        {

            if (stylefile == null || stylefile.ContentLength < 1)
            {
                return this.Issue404();
            }

            using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
            {
                var document = new XmlDocument();
                document.Load(stylefile.InputStream);
                var bjcpStyles = this.BeerStyleService.GetStylesFromXMLDoc(document);
                this.BeerStyleService.UpdateStyles(bjcpStyles);
                var styleJSON = this.BeerStyleService.GetJSONFromStyles(bjcpStyles);
                TempData["StyleJSON"] = styleJSON;

                unitOfWork.Commit();
            }

            this.ForwardMessage(new SuccessMessage { Text = "Styles have been uploaded." });
            return Redirect(Request.UrlReferrer.ToString() + "#tab-tab-5");
        }

		/// <summary>
		/// Executes the View for ImportProducts
		/// </summary>
		public ViewResult Affiliates()
		{
			return View();
		}

		/// <summary>
		/// Executes the Http Post View for ImportMidwestProducts
		/// </summary>
		[HttpPost]
		public ActionResult ImportMidwestProducts(ImportProductsViewModel importProductsViewModel)
		{
			if (importProductsViewModel.ProductFeedFile == null)
			{
				this.ForwardMessage(new InfoMessage { Text = "Please select a file before clicking the button.  I'm not a mind reader." });
				return RedirectToAction("Affiliates");
			}

			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				try
				{
					this.AffiliateService.ImportProducts(1, importProductsViewModel.ProductFeedFile.InputStream);
					unitOfWork.Commit();
					this.ForwardMessage(new SuccessMessage { Text = "The product feed has been imported sucessfully" });
				}
				catch (Exception ex)
				{
					this.LogHandledException(ex);
					unitOfWork.Rollback();
					this.ForwardMessage(new ErrorMessage {Text = "Uh oh! Something happened with the import."});
				}
			}

			return RedirectToAction("Affiliates");
		}

		/// <summary>
		/// Executes the ResendSendToShopOrder action
		/// </summary>
		public ActionResult ResendSendToShopOrder(int sendToShopId)
		{
			this.SendToShopService.Notify(sendToShopId, "brewgr@brewgr.com");
			return Content("200 OK");
		}

		#region RESOURCES 

		/// <summary>
		/// Executes the View for AdminCss
		/// </summary>
		public FileResult AdminCss()
		{
			var filePath = Server.MapPath("../Views/Admin/admin.css");
			var bytes = System.IO.File.ReadAllBytes(filePath);
			return File(bytes, "text/css");
		}

		/// <summary>
		/// Executes the View for AdminJs
		/// </summary>
		public FileResult AdminJs()
		{
			var filePath = Server.MapPath("../Views/Admin/admin.js");
			var bytes = System.IO.File.ReadAllBytes(filePath);
			return File(bytes, "text/javascript");
		}

		#endregion

		#region AJAX ACTIONS 

		/// <summary>
		/// Executes the View for Resolvefeedback
		/// </summary>
		public EmptyResult Resolvefeedback(int userFeedbackId)
		{
			if (userFeedbackId < 1)
			{
				return this.Issue404();
			}

			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				this.AdminService.ResolveFeedback(userFeedbackId, this.ActiveUser.UserId);
				unitOfWork.Commit();
			}

			return null;
		}

		/// <summary>
		/// Executes the View for RemoveCacheItem
		/// </summary>
		public EmptyResult RemoveCacheItem(string key)
		{
			if(string.IsNullOrWhiteSpace(key))
			{
				return this.Issue404();
			}

			this.HttpContext.Cache.Remove(key);

			return new EmptyResult();
		}

		/// <summary>
		/// Executes the View for PromoteFermentable
		/// </summary>
		[HttpPost]
		public EmptyResult PromoteFermentable(PromoteIngredientViewModel promoteIngredientViewModel )
		{
			if (promoteIngredientViewModel == null)
			{
				return this.Issue404();
			}

			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				this.BrewDataService.PromoteCustomIngredient<Fermentable>(promoteIngredientViewModel.IngredientId, promoteIngredientViewModel.Category);
				unitOfWork.Commit();
			}

			return new EmptyResult();
		}

		/// <summary>
		/// Executes the View for PromoteHop
		/// </summary>
		[HttpPost]
		public EmptyResult PromoteHop(PromoteIngredientViewModel promoteIngredientViewModel)
		{
			if (promoteIngredientViewModel == null)
			{
				return this.Issue404();
			}

			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				this.BrewDataService.PromoteCustomIngredient<Hop>(promoteIngredientViewModel.IngredientId, promoteIngredientViewModel.Category);
				unitOfWork.Commit();
			}
			return new EmptyResult();
		}

		/// <summary>
		/// Executes the View for PromoteYeast
		/// </summary>
		[HttpPost]
		public EmptyResult PromoteYeast(PromoteIngredientViewModel promoteIngredientViewModel)
		{
			if (promoteIngredientViewModel == null)
			{
				return this.Issue404();
			}

			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				this.BrewDataService.PromoteCustomIngredient<Yeast>(promoteIngredientViewModel.IngredientId, promoteIngredientViewModel.Category);
				unitOfWork.Commit();
			}

			return new EmptyResult();
		}

		/// <summary>
		/// Executes the View for PromoteAdjunct
		/// </summary>
		[HttpPost]
		public EmptyResult PromoteAdjunct(PromoteIngredientViewModel promoteIngredientViewModel)
		{
			using (var unitOfWork = this.UnitOfWorkFactory.NewUnitOfWork())
			{
				this.BrewDataService.PromoteCustomIngredient<Adjunct>(promoteIngredientViewModel.IngredientId, promoteIngredientViewModel.Category);
				unitOfWork.Commit();
			}

			return new EmptyResult();
		}

		#endregion

	}
}