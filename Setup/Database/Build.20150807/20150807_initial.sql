/* ===========================================================================================================
	BREWGR DATABASE CREATION SCRIPT																			   
	Last Updated: 8/7/2015

	This script will create the initial database and all data required for the application to run.
	It will not seed the database with users or recipes however.
=========================================================================================================== */

/* ===================================================== */
/* TABLES */
/* ===================================================== */

/****** Object:  Table [dbo].[Adjunct]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adjunct](
	[AdjunctId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [int] NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](5000) NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePromoted] [datetime] NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Adjunct] PRIMARY KEY CLUSTERED 
(
	[AdjunctId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdjunctUsageType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdjunctUsageType](
	[AdjunctUsageTypeId] [int] NOT NULL,
	[AdjunctUsageTypeName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_AdjunctUsage] PRIMARY KEY CLUSTERED 
(
	[AdjunctUsageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BjcpStyle]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BjcpStyle](
	[Class] [varchar](10) NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[SubCategoryID] [varchar](5) NOT NULL,
	[SubCategoryName] [varchar](50) NULL,
	[aroma] [varchar](5000) NULL,
	[appearance] [varchar](5000) NULL,
	[flavor] [varchar](5000) NULL,
	[mouthfeel] [varchar](5000) NULL,
	[impression] [varchar](5000) NULL,
	[comments] [varchar](5000) NULL,
	[ingredients] [varchar](5000) NULL,
	[og_low] [float] NULL,
	[og_high] [float] NULL,
	[fg_low] [float] NULL,
	[fg_high] [float] NULL,
	[ibu_low] [int] NULL,
	[ibu_high] [int] NULL,
	[srm_low] [float] NULL,
	[srm_high] [float] NULL,
	[abv_low] [float] NULL,
	[abv_high] [float] NULL,
	[examples] [varchar](5000) NULL,
 CONSTRAINT [PK_BJCPStyle] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BjcpStyleUrlFriendlyName]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BjcpStyleUrlFriendlyName](
	[SubCategoryId] [varchar](5) NOT NULL,
	[UrlFriendlyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BjcpStyleUrlFriendlyName] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BrewSession]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BrewSession](
	[BrewSessionId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[BrewDate] [datetime] NOT NULL,
	[Notes] [varchar](8000) NULL,
	[GrainWeight] [float] NULL,
	[GrainTemp] [float] NULL,
	[BoilTime] [float] NULL,
	[BoilVolumeEst] [float] NULL,
	[FermentVolumeEst] [float] NULL,
	[TargetMashTemp] [float] NULL,
	[MashThickness] [float] NULL,
	[TotalWaterNeeded] [float] NULL,
	[StrikeWaterTemp] [float] NULL,
	[StrikeWaterVolume] [float] NULL,
	[FirstRunningsVolume] [float] NULL,
	[SpargeWaterVolume] [float] NULL,
	[BrewKettleLoss] [float] NULL,
	[WortShrinkage] [float] NULL,
	[MashTunLoss] [float] NULL,
	[BoilLoss] [float] NULL,
	[MashGrainAbsorption] [float] NULL,
	[SpargeGrainAbsorption] [float] NULL,
	[MashPH] [float] NULL,
	[MashStartTemp] [float] NULL,
	[MashEndTemp] [float] NULL,
	[MashTime] [int] NULL,
	[MashTunCapacity] [float] NULL,
	[HLTMTHeatLoss] [float] NULL,
	[BoilVolumeActual] [float] NULL,
	[PreBoilGravity] [float] NULL,
	[BoilTimeActual] [int] NULL,
	[PostBoilVolume] [float] NULL,
	[FermentVolumeActual] [float] NULL,
	[OriginalGravity] [float] NULL,
	[FinalGravity] [float] NULL,
	[ConditionDate] [datetime] NULL,
	[ConditionTypeId] [int] NULL,
	[PrimingSugarType] [varchar](150) NULL,
	[PrimingSugarAmount] [float] NULL,
	[KegPSI] [int] NULL,
	[IsPublic] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_BrewSession] PRIMARY KEY CLUSTERED 
(
	[BrewSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BrewSessionComment]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BrewSessionComment](
	[BrewSessionCommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BrewSessionId] [int] NOT NULL,
	[CommentText] [varchar](2000) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RecipeBrewComment_IsActive]  DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_RecipeBrewComment_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecipeBrewComment] PRIMARY KEY CLUSTERED 
(
	[BrewSessionCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ShortName] [varchar](25) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_ShortName] UNIQUE NONCLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentType](
	[ContentTypeId] [int] NOT NULL,
	[ContentTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentType] PRIMARY KEY CLUSTERED 
(
	[ContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exceptions]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exceptions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[IsProtected] [bit] NOT NULL DEFAULT ((0)),
	[Host] [nvarchar](100) NULL,
	[Url] [nvarchar](500) NULL,
	[HTTPMethod] [nvarchar](10) NULL,
	[IPAddress] [varchar](40) NULL,
	[Source] [nvarchar](100) NULL,
	[Message] [nvarchar](1000) NULL,
	[Detail] [nvarchar](max) NULL,
	[StatusCode] [int] NULL,
	[SQL] [nvarchar](max) NULL,
	[DeletionDate] [datetime] NULL,
	[FullJson] [nvarchar](max) NULL,
	[ErrorHash] [int] NULL,
	[DuplicateCount] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fermentable]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fermentable](
	[FermentableId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](5000) NULL,
	[Ppg] [int] NOT NULL,
	[Lovibond] [int] NOT NULL,
	[DefaultUsageTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Fermentable_IsActive]  DEFAULT ((1)),
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF_Fermentable_IsPublic]  DEFAULT ((0)),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Fermentable_DateCreated]  DEFAULT (getdate()),
	[DatePromoted] [datetime] NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Fermentable] PRIMARY KEY CLUSTERED 
(
	[FermentableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FermentableUsageType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FermentableUsageType](
	[FermentableUsageTypeId] [int] NOT NULL,
	[FermentableUsageTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FermentableUsageType] PRIMARY KEY CLUSTERED 
(
	[FermentableUsageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hop]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hop](
	[HopId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](5000) NULL,
	[AA] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePromoted] [datetime] NULL,
	[Country] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Hop] PRIMARY KEY CLUSTERED 
(
	[HopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HopType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HopType](
	[HopTypeId] [int] NOT NULL,
	[HopTypeName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_HopType] PRIMARY KEY CLUSTERED 
(
	[HopTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HopUsageType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HopUsageType](
	[HopUsageTypeId] [int] NOT NULL,
	[HopUsageTypeName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_HopUsageType] PRIMARY KEY CLUSTERED 
(
	[HopUsageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IbuFormula]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IbuFormula](
	[IbuFormulaId] [int] NOT NULL,
	[IbuFormulaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IbuFormula] PRIMARY KEY CLUSTERED 
(
	[IbuFormulaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientCategory]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientCategory](
	[IngredientTypeId] [int] NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Rank] [int] NULL CONSTRAINT [DF_IngredientCategory_Rank]  DEFAULT ((9999)),
 CONSTRAINT [PK_IngredientCategory] PRIMARY KEY CLUSTERED 
(
	[IngredientTypeId] ASC,
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientType](
	[IngredientTypeId] [int] NOT NULL,
	[IngredientTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IngredientType] PRIMARY KEY CLUSTERED 
(
	[IngredientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MashStep]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MashStep](
	[MashStepId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [int] NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](5000) NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_MashStep_DateCreated]  DEFAULT (getdate()),
	[DatePromoted] [datetime] NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_MashStep] PRIMARY KEY CLUSTERED 
(
	[MashStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsletterSignup]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsletterSignup](
	[NewsletterSignupId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](250) NOT NULL,
	[IPAddress] [varchar](25) NOT NULL,
	[Source] [varchar](25) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsletterSignup] PRIMARY KEY CLUSTERED 
(
	[NewsletterSignupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificationType](
	[NotificationTypeId] [int] NOT NULL,
	[NotificationTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OAuthProvider]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OAuthProvider](
	[OAuthProviderId] [int] NOT NULL,
	[OAuthProviderName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OAuthProvider] PRIMARY KEY CLUSTERED 
(
	[OAuthProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Partner](
	[PartnerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Token] [varchar](10) NOT NULL,
	[ContactName] [varchar](100) NULL,
	[ContactAddress1] [varchar](50) NULL,
	[ContactAddress2] [varchar](50) NULL,
	[ContactCity] [varchar](50) NULL,
	[ContactStateProvince] [varchar](50) NULL,
	[ContactPostalCode] [varchar](50) NULL,
	[ContactCountry] [varchar](2) NULL,
	[ContactPhone] [varchar](15) NULL,
	[ContactFax] [varchar](15) NULL,
	[ContactEmail] [varchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartnerSendToShopIngredient]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerSendToShopIngredient](
	[PartnerId] [int] NOT NULL,
	[IngredientTypeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
 CONSTRAINT [PK_PartnerSendToShopIngredient_1] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC,
	[IngredientTypeId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerSendToShopSettings]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartnerSendToShopSettings](
	[PartnerId] [int] NOT NULL,
	[SendToShopMethodTypeId] [int] NOT NULL,
	[SendToShopFormatTypeId] [int] NOT NULL,
	[DayStart] [int] NOT NULL,
	[DayEnd] [int] NOT NULL,
	[HourStart] [int] NOT NULL,
	[HourEnd] [int] NOT NULL,
	[AllowOutOfRangeOrders] [bit] NOT NULL,
	[DeliveryEmailAddress] [varchar](255) NULL,
	[ConfirmationMessageText] [varchar](2000) NOT NULL,
	[ContactPartnerMessageText] [varchar](2000) NOT NULL,
	[ReadyForPickupMessageText] [varchar](2000) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_PartnerSendToShopSettings] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartnerService]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerService](
	[PartnerId] [int] NOT NULL,
	[PartnerServiceTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF_PartnerService_IsPublic]  DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_PartnerService] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC,
	[PartnerServiceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerServiceType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartnerServiceType](
	[PartnerServiceTypeId] [int] NOT NULL,
	[PartnerServiceTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerServiceType] PRIMARY KEY CLUSTERED 
(
	[PartnerServiceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeTypeId] [int] NULL,
	[OriginalRecipeId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[BjcpStyleSubCategoryId] [varchar](5) NULL,
	[RecipeName] [varchar](100) NOT NULL,
	[ImageUrlRoot] [varchar](255) NULL,
	[Description] [varchar](2000) NULL,
	[BatchSize] [float] NOT NULL,
	[BoilSize] [float] NOT NULL,
	[BoilTime] [int] NOT NULL,
	[Efficiency] [float] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Recipe_IsActive]  DEFAULT ((1)),
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF_Recipe_IsPublic]  DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Recipe_DateCreated_1]  DEFAULT (getdate()),
	[DateModified] [datetime] NULL,
	[Og] [float] NOT NULL,
	[Fg] [float] NOT NULL,
	[SRM] [float] NOT NULL,
	[IBU] [float] NOT NULL,
	[BGGU] [float] NOT NULL,
	[ABV] [float] NOT NULL,
	[Calories] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL CONSTRAINT [DF_Recipe_UnitTypeId]  DEFAULT ((10)),
	[IbuFormulaId] [int] NOT NULL CONSTRAINT [DF_Recipe_IbuFormulaId]  DEFAULT ((10)),
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeAdjunct]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeAdjunct](
	[RecipeAdjunctId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[AdjunctUsageTypeId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Unit] [varchar](25) NOT NULL,
	[Rank] [int] NOT NULL CONSTRAINT [DF_RecipeAdjunct_Rank]  DEFAULT ((0)),
 CONSTRAINT [PK_RecipeAdjunct] PRIMARY KEY CLUSTERED 
(
	[RecipeAdjunctId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeBrew]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeBrew](
	[RecipeBrewId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[BrewedBy] [int] NOT NULL,
	[BrewDate] [datetime] NOT NULL,
	[PostalCode] [varchar](25) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_RecipeBrew] PRIMARY KEY CLUSTERED 
(
	[RecipeBrewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeComment]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeComment](
	[RecipeCommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[CommentText] [varchar](2000) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Comment_IsActive]  DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Comment_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[RecipeCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeFermentable]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeFermentable](
	[RecipeFermentableId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Ppg] [int] NOT NULL,
	[Lovibond] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[FermentableUsageTypeId] [int] NOT NULL,
	[Rank] [int] NOT NULL CONSTRAINT [DF_RecipeFermentable_Rank]  DEFAULT ((0)),
 CONSTRAINT [PK_RecipeFermentable] PRIMARY KEY CLUSTERED 
(
	[RecipeFermentableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeHop]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeHop](
	[RecipeHopId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[HopUsageTypeID] [int] NOT NULL,
	[HopTypeId] [int] NOT NULL,
	[AlphaAcidAmount] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeInMinutes] [int] NOT NULL,
	[Rank] [int] NOT NULL CONSTRAINT [DF_RecipeHop_Rank]  DEFAULT ((0)),
	[Ibu] [float] NOT NULL CONSTRAINT [DF_RecipeHop_Ibu]  DEFAULT ((0)),
 CONSTRAINT [PK_RecipeHop] PRIMARY KEY CLUSTERED 
(
	[RecipeHopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeMashStep]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeMashStep](
	[RecipeMashStepId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[Temp] [float] NOT NULL,
	[Time] [int] NOT NULL,
	[Rank] [int] NOT NULL,
 CONSTRAINT [PK_RecipeMashStep] PRIMARY KEY CLUSTERED 
(
	[RecipeMashStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeStep]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeStep](
	[RecipeStepId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Rank] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_RecipeStep] PRIMARY KEY CLUSTERED 
(
	[RecipeStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipeType](
	[RecipeTypeId] [int] NOT NULL,
	[RecipeTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RecipeType] PRIMARY KEY CLUSTERED 
(
	[RecipeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeYeast]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeYeast](
	[RecipeYeastId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Attenuation] [float] NOT NULL,
	[Rank] [int] NOT NULL CONSTRAINT [DF_RecipeYeast_Rank]  DEFAULT ((0)),
 CONSTRAINT [PK_RecipeYeast] PRIMARY KEY CLUSTERED 
(
	[RecipeYeastId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SendToShopFormat]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendToShopFormat](
	[SendToShopFormatTypeId] [int] NOT NULL,
	[SendToShopFormatName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SendToShopFormat] PRIMARY KEY CLUSTERED 
(
	[SendToShopFormatTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SendToShopMethod]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendToShopMethod](
	[SendToShopMethodTypeId] [int] NOT NULL,
	[SendToShopMethodName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SendToShopMethod] PRIMARY KEY CLUSTERED 
(
	[SendToShopMethodTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SendToShopOrder]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendToShopOrder](
	[SendToShopOrderId] [int] IDENTITY(1001,1) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[SendToShopOrderStatusId] [int] NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[EmailAddress] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](25) NOT NULL,
	[AllowTextMessages] [bit] NOT NULL,
	[Comments] [varchar](5000) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_SendToShopOrder] PRIMARY KEY CLUSTERED 
(
	[SendToShopOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SendToShopOrderItem]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendToShopOrderItem](
	[SendToShopOrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[SendToShopOrderId] [int] NOT NULL,
	[IngredientTypeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Unit] [varchar](25) NOT NULL,
	[Instructions] [varchar](1000) NULL,
 CONSTRAINT [PK_SendToShopOrderItem] PRIMARY KEY CLUSTERED 
(
	[SendToShopOrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SendToShopOrderStatus]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendToShopOrderStatus](
	[SendToShopOrderStatusId] [int] NOT NULL,
	[SendToShopOrderStatusName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SendToShopOrderStatus] PRIMARY KEY CLUSTERED 
(
	[SendToShopOrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TastingNote]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TastingNote](
	[TastingNoteId] [int] IDENTITY(1,1) NOT NULL,
	[BrewSessionId] [int] NULL,
	[RecipeId] [int] NULL,
	[UserId] [int] NOT NULL,
	[TasteDate] [datetime] NOT NULL,
	[Rating] [float] NOT NULL,
	[Notes] [varchar](1000) NULL,
	[IsPublic] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_TastingNote] PRIMARY KEY CLUSTERED 
(
	[TastingNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeId] [int] NOT NULL,
	[UnitTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UnitType] PRIMARY KEY CLUSTERED 
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(100000,1) NOT NULL,
	[Username] [varchar](50) NULL CONSTRAINT [DF_User_Username]  DEFAULT (newid()),
	[EmailAddress] [varchar](255) NOT NULL,
	[Password] [varbinary](256) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[HasCustomUsername] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CalculatedUsername]  AS (case when [HasCustomUsername]=(1) then [Username] else 'Brewer '+CONVERT([varchar],[UserId],0) end),
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[Bio] [varchar](450) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_User_EmailAddress] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_User_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAdmin]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin](
	[UserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UserAdmin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAuthToken]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAuthToken](
	[UserAuthTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AuthToken] [varchar](500) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserAuthToken] PRIMARY KEY CLUSTERED 
(
	[UserAuthTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserConnection]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserConnection](
	[UserId] [int] NOT NULL,
	[FollowedById] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_UserConnection] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FollowedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFeedback]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFeedback](
	[UserFeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Feedback] [varchar](1000) NOT NULL,
	[UserHostAddress] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateResponded] [datetime] NULL,
	[RespondedBy] [int] NULL,
 CONSTRAINT [PK_UserFeedback] PRIMARY KEY CLUSTERED 
(
	[UserFeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [int] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotificationType]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotificationType](
	[UserId] [int] NOT NULL,
	[NotificationTypeId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UserNotificationType] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[NotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOAuthUserId]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserOAuthUserId](
	[UserId] [int] NOT NULL,
	[OAuthProviderId] [int] NOT NULL,
	[OAuthUserId] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_UserOAuthUserId_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_UserOAuthUserId] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[OAuthProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserPartnerAdmin]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPartnerAdmin](
	[UserId] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_UserPartnerAdmin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSuggestion]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSuggestion](
	[UserSuggestionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[SuggestionText] [varchar](500) NOT NULL,
	[UserHostAddress] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UserSuggestion] PRIMARY KEY CLUSTERED 
(
	[UserSuggestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Yeast]    Script Date: 8/7/2015 2:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yeast](
	[YeastId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [int] NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](5000) NULL,
	[Attenuation] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePromoted] [datetime] NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Yeast] PRIMARY KEY CLUSTERED 
(
	[YeastId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Adjunct]  WITH CHECK ADD  CONSTRAINT [FK_Adjunct_User] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Adjunct] CHECK CONSTRAINT [FK_Adjunct_User]
GO
ALTER TABLE [dbo].[BrewSession]  WITH CHECK ADD  CONSTRAINT [FK_BrewSession_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[BrewSession] CHECK CONSTRAINT [FK_BrewSession_Recipe]
GO
ALTER TABLE [dbo].[BrewSession]  WITH CHECK ADD  CONSTRAINT [FK_BrewSession_UnitType] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitType] ([UnitTypeId])
GO
ALTER TABLE [dbo].[BrewSession] CHECK CONSTRAINT [FK_BrewSession_UnitType]
GO
ALTER TABLE [dbo].[BrewSession]  WITH CHECK ADD  CONSTRAINT [FK_BrewSession_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BrewSession] CHECK CONSTRAINT [FK_BrewSession_User]
GO
ALTER TABLE [dbo].[BrewSessionComment]  WITH CHECK ADD  CONSTRAINT [FK_BrewSessionComment_BrewSession] FOREIGN KEY([BrewSessionId])
REFERENCES [dbo].[BrewSession] ([BrewSessionId])
GO
ALTER TABLE [dbo].[BrewSessionComment] CHECK CONSTRAINT [FK_BrewSessionComment_BrewSession]
GO
ALTER TABLE [dbo].[BrewSessionComment]  WITH CHECK ADD  CONSTRAINT [FK_RecipeBrewComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BrewSessionComment] CHECK CONSTRAINT [FK_RecipeBrewComment_User]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentType] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentType] ([ContentTypeId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentType]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_User]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_User1]
GO
ALTER TABLE [dbo].[Fermentable]  WITH CHECK ADD  CONSTRAINT [FK_Fermentable_User] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Fermentable] CHECK CONSTRAINT [FK_Fermentable_User]
GO
ALTER TABLE [dbo].[Hop]  WITH CHECK ADD  CONSTRAINT [FK_Hop_User] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Hop] CHECK CONSTRAINT [FK_Hop_User]
GO
ALTER TABLE [dbo].[MashStep]  WITH CHECK ADD  CONSTRAINT [FK_MashStep_User] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[MashStep] CHECK CONSTRAINT [FK_MashStep_User]
GO
ALTER TABLE [dbo].[PartnerSendToShopIngredient]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopIngredient_IngredientType] FOREIGN KEY([IngredientTypeId])
REFERENCES [dbo].[IngredientType] ([IngredientTypeId])
GO
ALTER TABLE [dbo].[PartnerSendToShopIngredient] CHECK CONSTRAINT [FK_PartnerSendToShopIngredient_IngredientType]
GO
ALTER TABLE [dbo].[PartnerSendToShopIngredient]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopIngredient_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerSendToShopIngredient] CHECK CONSTRAINT [FK_PartnerSendToShopIngredient_Partner]
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopSettings_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings] CHECK CONSTRAINT [FK_PartnerSendToShopSettings_Partner]
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopSettings_SendToShopFormat] FOREIGN KEY([SendToShopFormatTypeId])
REFERENCES [dbo].[SendToShopFormat] ([SendToShopFormatTypeId])
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings] CHECK CONSTRAINT [FK_PartnerSendToShopSettings_SendToShopFormat]
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopSettings_SendToShopMethod] FOREIGN KEY([SendToShopMethodTypeId])
REFERENCES [dbo].[SendToShopMethod] ([SendToShopMethodTypeId])
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings] CHECK CONSTRAINT [FK_PartnerSendToShopSettings_SendToShopMethod]
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopSettings_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings] CHECK CONSTRAINT [FK_PartnerSendToShopSettings_User]
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings]  WITH CHECK ADD  CONSTRAINT [FK_PartnerSendToShopSettings_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PartnerSendToShopSettings] CHECK CONSTRAINT [FK_PartnerSendToShopSettings_User1]
GO
ALTER TABLE [dbo].[PartnerService]  WITH CHECK ADD  CONSTRAINT [FK_PartnerService_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerService] CHECK CONSTRAINT [FK_PartnerService_Partner]
GO
ALTER TABLE [dbo].[PartnerService]  WITH CHECK ADD  CONSTRAINT [FK_PartnerService_PartnerServiceType] FOREIGN KEY([PartnerServiceTypeId])
REFERENCES [dbo].[PartnerServiceType] ([PartnerServiceTypeId])
GO
ALTER TABLE [dbo].[PartnerService] CHECK CONSTRAINT [FK_PartnerService_PartnerServiceType]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_BJCPStyle] FOREIGN KEY([BjcpStyleSubCategoryId])
REFERENCES [dbo].[BjcpStyle] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_BJCPStyle]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Recipe] FOREIGN KEY([OriginalRecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Recipe]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_RecipeType] FOREIGN KEY([RecipeTypeId])
REFERENCES [dbo].[RecipeType] ([RecipeTypeId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_RecipeType]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_User]
GO
ALTER TABLE [dbo].[RecipeAdjunct]  WITH CHECK ADD  CONSTRAINT [FK_RecipeAdjunct_Adjunct] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Adjunct] ([AdjunctId])
GO
ALTER TABLE [dbo].[RecipeAdjunct] CHECK CONSTRAINT [FK_RecipeAdjunct_Adjunct]
GO
ALTER TABLE [dbo].[RecipeAdjunct]  WITH CHECK ADD  CONSTRAINT [FK_RecipeAdjunct_AdjunctUsageType] FOREIGN KEY([AdjunctUsageTypeId])
REFERENCES [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId])
GO
ALTER TABLE [dbo].[RecipeAdjunct] CHECK CONSTRAINT [FK_RecipeAdjunct_AdjunctUsageType]
GO
ALTER TABLE [dbo].[RecipeAdjunct]  WITH CHECK ADD  CONSTRAINT [FK_RecipeAdjunct_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeAdjunct] CHECK CONSTRAINT [FK_RecipeAdjunct_Recipe]
GO
ALTER TABLE [dbo].[RecipeBrew]  WITH CHECK ADD  CONSTRAINT [FK_RecipeBrew_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeBrew] CHECK CONSTRAINT [FK_RecipeBrew_Recipe]
GO
ALTER TABLE [dbo].[RecipeBrew]  WITH CHECK ADD  CONSTRAINT [FK_RecipeBrew_User] FOREIGN KEY([BrewedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RecipeBrew] CHECK CONSTRAINT [FK_RecipeBrew_User]
GO
ALTER TABLE [dbo].[RecipeComment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RecipeComment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[RecipeComment]  WITH CHECK ADD  CONSTRAINT [FK_RecipeComment_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeComment] CHECK CONSTRAINT [FK_RecipeComment_Recipe]
GO
ALTER TABLE [dbo].[RecipeFermentable]  WITH CHECK ADD  CONSTRAINT [FK_RecipeFermentable_Fermentable] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Fermentable] ([FermentableId])
GO
ALTER TABLE [dbo].[RecipeFermentable] CHECK CONSTRAINT [FK_RecipeFermentable_Fermentable]
GO
ALTER TABLE [dbo].[RecipeFermentable]  WITH CHECK ADD  CONSTRAINT [FK_RecipeFermentable_FermentableUsageType] FOREIGN KEY([FermentableUsageTypeId])
REFERENCES [dbo].[FermentableUsageType] ([FermentableUsageTypeId])
GO
ALTER TABLE [dbo].[RecipeFermentable] CHECK CONSTRAINT [FK_RecipeFermentable_FermentableUsageType]
GO
ALTER TABLE [dbo].[RecipeFermentable]  WITH CHECK ADD  CONSTRAINT [FK_RecipeFermentable_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeFermentable] CHECK CONSTRAINT [FK_RecipeFermentable_Recipe]
GO
ALTER TABLE [dbo].[RecipeHop]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHop_Hop] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Hop] ([HopId])
GO
ALTER TABLE [dbo].[RecipeHop] CHECK CONSTRAINT [FK_RecipeHop_Hop]
GO
ALTER TABLE [dbo].[RecipeHop]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHop_HopType] FOREIGN KEY([HopTypeId])
REFERENCES [dbo].[HopType] ([HopTypeId])
GO
ALTER TABLE [dbo].[RecipeHop] CHECK CONSTRAINT [FK_RecipeHop_HopType]
GO
ALTER TABLE [dbo].[RecipeHop]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHop_HopUsage] FOREIGN KEY([HopUsageTypeID])
REFERENCES [dbo].[HopUsageType] ([HopUsageTypeId])
GO
ALTER TABLE [dbo].[RecipeHop] CHECK CONSTRAINT [FK_RecipeHop_HopUsage]
GO
ALTER TABLE [dbo].[RecipeHop]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHop_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeHop] CHECK CONSTRAINT [FK_RecipeHop_Recipe]
GO
ALTER TABLE [dbo].[RecipeMashStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeMashStep_MashStep] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[MashStep] ([MashStepId])
GO
ALTER TABLE [dbo].[RecipeMashStep] CHECK CONSTRAINT [FK_RecipeMashStep_MashStep]
GO
ALTER TABLE [dbo].[RecipeMashStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeMashStep_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeMashStep] CHECK CONSTRAINT [FK_RecipeMashStep_Recipe]
GO
ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStep_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Recipe]
GO
ALTER TABLE [dbo].[RecipeYeast]  WITH CHECK ADD  CONSTRAINT [FK_RecipeYeast_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeYeast] CHECK CONSTRAINT [FK_RecipeYeast_Recipe]
GO
ALTER TABLE [dbo].[RecipeYeast]  WITH CHECK ADD  CONSTRAINT [FK_RecipeYeast_Yeast] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Yeast] ([YeastId])
GO
ALTER TABLE [dbo].[RecipeYeast] CHECK CONSTRAINT [FK_RecipeYeast_Yeast]
GO
ALTER TABLE [dbo].[SendToShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrder_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[SendToShopOrder] CHECK CONSTRAINT [FK_SendToShopOrder_Partner]
GO
ALTER TABLE [dbo].[SendToShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrder_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[SendToShopOrder] CHECK CONSTRAINT [FK_SendToShopOrder_Recipe]
GO
ALTER TABLE [dbo].[SendToShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrder_SendToShopOrderStatus] FOREIGN KEY([SendToShopOrderStatusId])
REFERENCES [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId])
GO
ALTER TABLE [dbo].[SendToShopOrder] CHECK CONSTRAINT [FK_SendToShopOrder_SendToShopOrderStatus]
GO
ALTER TABLE [dbo].[SendToShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrder_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[SendToShopOrder] CHECK CONSTRAINT [FK_SendToShopOrder_User]
GO
ALTER TABLE [dbo].[SendToShopOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrderItem_IngredientType] FOREIGN KEY([IngredientTypeId])
REFERENCES [dbo].[IngredientType] ([IngredientTypeId])
GO
ALTER TABLE [dbo].[SendToShopOrderItem] CHECK CONSTRAINT [FK_SendToShopOrderItem_IngredientType]
GO
ALTER TABLE [dbo].[SendToShopOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_SendToShopOrderItem_SendToShopOrder] FOREIGN KEY([SendToShopOrderId])
REFERENCES [dbo].[SendToShopOrder] ([SendToShopOrderId])
GO
ALTER TABLE [dbo].[SendToShopOrderItem] CHECK CONSTRAINT [FK_SendToShopOrderItem_SendToShopOrder]
GO
ALTER TABLE [dbo].[TastingNote]  WITH CHECK ADD  CONSTRAINT [FK_TastingNote_BrewSession] FOREIGN KEY([BrewSessionId])
REFERENCES [dbo].[BrewSession] ([BrewSessionId])
GO
ALTER TABLE [dbo].[TastingNote] CHECK CONSTRAINT [FK_TastingNote_BrewSession]
GO
ALTER TABLE [dbo].[TastingNote]  WITH CHECK ADD  CONSTRAINT [FK_TastingNote_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[TastingNote] CHECK CONSTRAINT [FK_TastingNote_Recipe]
GO
ALTER TABLE [dbo].[TastingNote]  WITH CHECK ADD  CONSTRAINT [FK_TastingNote_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[TastingNote] CHECK CONSTRAINT [FK_TastingNote_User]
GO
ALTER TABLE [dbo].[UserAdmin]  WITH CHECK ADD  CONSTRAINT [FK_UserAdmin_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAdmin] CHECK CONSTRAINT [FK_UserAdmin_User]
GO
ALTER TABLE [dbo].[UserAuthToken]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthToken_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAuthToken] CHECK CONSTRAINT [FK_UserAuthToken_User]
GO
ALTER TABLE [dbo].[UserConnection]  WITH CHECK ADD  CONSTRAINT [FK_UserConnection_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserConnection] CHECK CONSTRAINT [FK_UserConnection_User]
GO
ALTER TABLE [dbo].[UserConnection]  WITH CHECK ADD  CONSTRAINT [FK_UserConnection_User1] FOREIGN KEY([FollowedById])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserConnection] CHECK CONSTRAINT [FK_UserConnection_User1]
GO
ALTER TABLE [dbo].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_User]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_User]
GO
ALTER TABLE [dbo].[UserNotificationType]  WITH CHECK ADD  CONSTRAINT [FK_UserNotificationType_NotificationType] FOREIGN KEY([NotificationTypeId])
REFERENCES [dbo].[NotificationType] ([NotificationTypeId])
GO
ALTER TABLE [dbo].[UserNotificationType] CHECK CONSTRAINT [FK_UserNotificationType_NotificationType]
GO
ALTER TABLE [dbo].[UserNotificationType]  WITH CHECK ADD  CONSTRAINT [FK_UserNotificationType_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserNotificationType] CHECK CONSTRAINT [FK_UserNotificationType_User]
GO
ALTER TABLE [dbo].[UserOAuthUserId]  WITH CHECK ADD  CONSTRAINT [FK_UserOAuthUserId_OAuthProvider] FOREIGN KEY([OAuthProviderId])
REFERENCES [dbo].[OAuthProvider] ([OAuthProviderId])
GO
ALTER TABLE [dbo].[UserOAuthUserId] CHECK CONSTRAINT [FK_UserOAuthUserId_OAuthProvider]
GO
ALTER TABLE [dbo].[UserOAuthUserId]  WITH CHECK ADD  CONSTRAINT [FK_UserOAuthUserId_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserOAuthUserId] CHECK CONSTRAINT [FK_UserOAuthUserId_User]
GO
ALTER TABLE [dbo].[UserPartnerAdmin]  WITH CHECK ADD  CONSTRAINT [FK_UserPartnerAdmin_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[UserPartnerAdmin] CHECK CONSTRAINT [FK_UserPartnerAdmin_Partner]
GO
ALTER TABLE [dbo].[UserPartnerAdmin]  WITH CHECK ADD  CONSTRAINT [FK_UserPartnerAdmin_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserPartnerAdmin] CHECK CONSTRAINT [FK_UserPartnerAdmin_User]
GO
ALTER TABLE [dbo].[UserSuggestion]  WITH CHECK ADD  CONSTRAINT [FK_UserSuggestion_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserSuggestion] CHECK CONSTRAINT [FK_UserSuggestion_User]
GO
ALTER TABLE [dbo].[Yeast]  WITH CHECK ADD  CONSTRAINT [FK_Yeast_User] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Yeast] CHECK CONSTRAINT [FK_Yeast_User]
GO

/* ===================================================== */
/* VIEWS */
/* ===================================================== */
/****** Object:  View [dbo].[RecipeSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------
-- Recipe Summary View -- 
--------------------------------------
CREATE VIEW [dbo].[RecipeSummary] AS

SELECT
	rcp.RecipeId
 ,	rcp.RecipeTypeId
 ,	rcp.OriginalRecipeId
 ,	[OriginalRecipeName] = orig.RecipeName
 ,	rcp.CreatedBy
 ,	CreatedByUserName = usr.CalculatedUsername
 ,	CreatedByUserEmail = usr.EmailAddress
 ,	rcp.UnitTypeId
 ,	rcp.IbuFormulaId
 ,	rcp.BjcpStyleSubCategoryId
 ,	[BJCPStyleName] = ISNULL(sty.SubCategoryName, 'Unknown Style')
 ,	rcp.RecipeName
 ,	rcp.ImageUrlRoot
 ,	rcp.Description
 ,	rcp.BatchSize
 ,	rcp.BoilSize
 ,	rcp.BoilTime
 ,	rcp.Efficiency
 ,	rcp.IsActive
 ,	rcp.IsPublic
 ,	rcp.DateCreated
 ,	rcp.DateModified
 ,	rcp.Og
 ,	rcp.Fg
 ,	rcp.Srm
 ,	rcp.Ibu
 ,	rcp.BgGu
 ,	rcp.Abv
 ,	rcp.Calories
 ,	[UserIsAdmin] = CAST(CASE WHEN adm.UserId IS NOT NULL THEN 1 ELSE 0 END AS BIT)
 ,	[BrewSessionCount] = ISNULL(brwcount.BrewSessionCount, 0)
FROM
	Recipe rcp with(nolock)
JOIN
	[User] usr with(nolock)
	 ON rcp.CreatedBy = usr.UserId
LEFT JOIN
	[Recipe] orig with(nolock)
	 ON rcp.OriginalRecipeId = orig.RecipeId
LEFT JOIN
	[BJCPStyle] sty with(nolock)
	 ON rcp.BjcpStyleSubCategoryId = sty.SubCategoryID
LEFT JOIN
	[UserAdmin] adm with(nolock)
	 ON rcp.CreatedBy = adm.UserId
LEFT JOIN
	(SELECT 
		RecipeId
	  ,	BrewSessionCount = COUNT(BrewSessionId) 
	 FROM 
		[BrewSession] brw (nolock)
	 WHERE
		IsActive = 1
		AND IsPublic = 1
	 GROUP BY
		RecipeId
	) brwcount
	 ON rcp.RecipeId = brwcount.RecipeId


GO
/****** Object:  View [dbo].[TastingNoteSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TastingNoteSummary]
AS

SELECT
	note.TastingNoteId
 ,	note.BrewSessionId
 ,	RecipeID = ISNULL(rec.RecipeId, recalt.RecipeId)
 ,	RecipeName = ISNULL(rec.RecipeName, recalt.RecipeName)
 ,	[RecipeStyleName] = ISNULL(rec.BJCPStyleName, recalt.BJCPStyleName)
 ,	[RecipeImage] = ISNULL(rec.ImageUrlRoot, recalt.ImageUrlRoot)
 ,	[RecipeSrm] = ISNULL(rec.Srm, recalt.Srm)
 ,	note.UserId
 ,	[TastingUsername] = usr.CalculatedUserName
 ,	[TastingUserEmailAddress] = usr.EmailAddress
 ,	note.TasteDate
 ,	note.Rating
 ,	note.Notes
 ,	note.DateCreated
FROM
	TastingNote note with(nolock)
LEFT JOIN
	BrewSession brew with(nolock)
	 on brew.BrewSessionId = note.BrewSessionID
LEFT JOIN
	RecipeSummary rec with(nolock)
	 ON note.RecipeId = rec.RecipeId
LEFT JOIN
	RecipeSummary recalt with(nolock)
	 ON brew.RecipeId = recalt.RecipeId
JOIN
	[User] usr with(nolock)
	 ON usr.UserId = note.UserId
WHERE
	note.IsActive = 1
	AND note.IsPublic = 1
	AND (rec.RecipeId IS NULL OR (rec.IsActive = 1 AND rec.IsPublic = 1))
	AND (note.BrewSessionID IS NULL OR (brew.IsActive = 1 AND brew.IsPublic = 1))



GO
/****** Object:  View [dbo].[RecipeMetaData]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RecipeMetaData]
AS

SELECT
	rec.RecipeId
 ,	AverageRating = ISNULL(AVG(nte.Rating), CAST(0 AS FLOAT))
 ,	TastingNoteCount = COUNT(nte.TastingNoteId)
 ,	BrewSessionCount = COUNT(brw.BrewSessionId)
 ,	CommentCount = COUNT(rcom.RecipeCommentId)
 ,	CloneCount = COUNT(clon.RecipeId)
FROM
	Recipe rec with(nolock)
LEFT JOIN
	BrewSession brw with(nolock)
	 ON rec.RecipeId = brw.RecipeId
	  AND brw.IsPublic = 1
	  AND brw.IsActive = 1
LEFT JOIN
	TastingNoteSummary nte with(nolock)
	 ON rec.RecipeId = nte.RecipeId
LEFT JOIN
	RecipeComment rcom with(nolock)
	 ON rec.RecipeId = rcom.RecipeId
	  AND rcom.IsActive = 1
LEFT JOIN
	Recipe clon with(nolock)
	 ON clon.OriginalRecipeId = rec.RecipeId
WHERE
	rec.IsActive = 1
GROUP BY
	rec.RecipeId


GO
/****** Object:  View [dbo].[BjcpStyleSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[BjcpStyleSummary]
AS

SELECT
	sty.SubCategoryId
 ,	SubCategoryName
 ,	CategoryId
 ,	CategoryName
 ,	frnm.UrlFriendlyName
 ,	[RecipeCount] = COUNT(rcp.RecipeId)
FROM
	BjcpStyle sty with(nolock)
JOIN
	BjcpStyleUrlFriendlyName frnm with(nolock)
	 ON sty.SubCategoryId = frnm.SubCategoryId
LEFT JOIN
	Recipe rcp with(nolock)
	 ON sty.SubCategoryId = rcp.BjcpStyleSubCategoryId
	 AND rcp.IsActive = 1
	 AND rcp.IsPublic = 1
GROUP BY
	sty.SubCategoryId
 ,	SubCategoryName
 ,	CategoryId
 ,	CategoryName
 ,	frnm.UrlFriendlyName





GO
/****** Object:  View [dbo].[BrewSessionSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------
-- BrewSession Summary View -- 
--------------------------------------
CREATE VIEW [dbo].[BrewSessionSummary]
AS

SELECT
	brw.BrewSessionId
 ,	brw.RecipeId
 ,	rcp.RecipeTypeId
 ,	rcp.RecipeName
 ,	[RecipeBjcpStyleSubCategoryId] = rcp.BjcpStyleSubCategoryId
 ,	[RecipeBjcpStyleName] = ISNULL(sty.SubCategoryName, 'Unknown Style')	
 ,	[BrewedBy] = brw.UserId
 ,	[BrewedByUsername] = usr.CalculatedUsername
 ,	[BrewedByUserEmail] = usr.EmailAddress
 ,	brw.BrewDate
 ,	RecipeImageUrlRoot = rcp.ImageUrlRoot
 ,	Summary = LEFT(RTRIM(LTRIM(brw.Notes)), 1000)
 ,	HasWaterInfusion = CAST (
		CASE WHEN
			[GrainWeight] IS NOT NULL
				OR
			[GrainTemp] IS NOT NULL
				OR
			brw.[BoilTime] IS NOT NULL
				OR
			[BoilVolumeEst] IS NOT NULL
				OR
			[FermentVolumeEst] IS NOT NULL
				OR
			[TargetMashTemp] IS NOT NULL
				OR
			[MashThickness] IS NOT NULL
		THEN 1 ELSE 0 END
	AS BIT)
 ,	HasMashBoil = CAST(
		CASE WHEN
			[MashPH] IS NOT NULL
				OR
			[MashStartTemp] IS NOT NULL
				OR
			[MashEndTemp] IS NOT NULL
				OR
			[MashTime] IS NOT NULL
				OR
			[BoilVolumeActual] IS NOT NULL
				OR
			[PreBoilGravity] IS NOT NULL
				OR
			[BoilTimeActual] IS NOT NULL
				OR
			[PostBoilVolume] IS NOT NULL
		THEN 1 ELSE 0 END
	AS BIT)
 ,	HasFermentation = CAST(
		CASE WHEN
			[FermentVolumeActual] IS NOT NULL
				OR
			[OriginalGravity] IS NOT NULL
				OR
			[FinalGravity] IS NOT NULL
		THEN 1 ELSE 0 END
	AS BIT)
 ,	HasConditioning = CAST(
		CASE WHEN 
			[ConditionDate] IS NOT NULL
				OR
			[ConditionTypeId] IS NOT NULL
				OR
			[PrimingSugarType] IS NOT NULL
				OR
			[PrimingSugarAmount] IS NOT NULL
				OR
			[KegPSI] IS NOT NULL
		THEN 1 ELSE 0 END 
	AS BIT)
 ,	HasTastingNotes = CAST(CASE WHEN tast.[Count] IS NOT NULL THEN 1 ELSE 0 END AS BIT)
 ,	[RecipeSrm] = rcp.Srm
 ,	brw.IsActive
 ,	brw.IsPublic
 ,	brw.DateCreated
 ,	brw.DateModified
FROM
	BrewSession brw with(nolock)
JOIN
	[User] usr with(nolock)
	 ON usr.UserId = brw.UserId
JOIN
	Recipe rcp with(nolock)
	 ON rcp.RecipeId = brw.RecipeId
LEFT JOIN
	[BJCPStyle] sty with(nolock)
	 ON rcp.BjcpStyleSubCategoryId = sty.SubCategoryID
LEFT JOIN
	(
		SELECT 
			BrewSessionId 
		 ,	[Count] = COUNT(*)
		FROM
			TastingNote with(nolock)
		GROUP BY
			BrewSessionId
	) tast
	 ON tast.BrewSessionId = brw.BrewSessionId
WHERE
	rcp.IsActive = 1
	AND rcp.IsPublic = 1

GO
/****** Object:  View [dbo].[MiniUserSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[MiniUserSummary]
AS

SELECT
	UserId
 ,	Username = CalculatedUsername
 ,	EmailAddress
FROM
	[User] with(nolock)


GO
/****** Object:  View [dbo].[PartnerSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PartnerSummary]
AS

SELECT
	PartnerId
 ,	Name
FROM
	Partner
WHERE
	IsActive = 1
GO



GO
/****** Object:  View [dbo].[RecipeCommentSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[RecipeCommentSummary]
AS

SELECT
	cmt.RecipeCommentId
 ,	cmt.UserId
 ,	cmt.RecipeId
 ,	UserName = usr.CalculatedUsername
 ,	usr.EmailAddress
 ,	cmt.CommentText
 ,	cmt.DateCreated
 ,	cmt.IsActive
FROM
	RecipeComment [cmt] with(nolock)
JOIN
	[User] usr with(nolock)
	 ON cmt.UserId = usr.UserId
	 




GO
/****** Object:  View [dbo].[UserSummary]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UserSummary]
AS

SELECT
	usr.UserId
 ,	Username = usr.CalculatedUsername
 ,	EmailAddress
 ,	FirstName
 ,	LastName
 ,	usr.DateCreated
 ,	usr.Bio
 ,	usr.IsActive
 ,	[RecipeCount] = ISNULL(rcpcount.RecipeCount, 0)
 ,	[BrewSessionCount] = ISNULL(brewcount.BrewSessionCount, 0)
 ,	[CommentCount] = ISNULL(commcount.[CommentCount], 0) 
 ,	[IsAdmin] = CAST(CASE WHEN adm.UserId IS NOT NULL THEN 1 ELSE 0 END AS BIT)
 ,	[IsPartner] = padm.IsPartner
 ,	[HasCustomUsername] = usr.HasCustomUsername
FROM
	[User] usr with(nolock)
LEFT JOIN
	[UserAdmin] adm with(nolock)
	 ON usr.UserId = adm.UserId
	  AND adm.IsActive = 1
LEFT JOIN
	(
		SELECT
			usr.UserId
		 ,	IsPartner = CAST(CASE WHEN COUNT(padm.UserId) > 0 THEN 1 ELSE 0 END AS BIT)
		FROM
			[User] usr with(nolock)
		LEFT JOIN
			UserPartnerAdmin padm with(nolock)
			 ON usr.UserId = padm.UserId
			  AND padm.IsActive = 1
		GROUP BY
			usr.UserId
	) padm
	 ON usr.UserId = padm.UserId
LEFT JOIN
(
	SELECT CreatedBy, [RecipeCount] = COUNT(*)
	FROM Recipe with(nolock)
	WHERE IsActive = 1
	AND IsPublic = 1
	GROUP BY CreatedBy
) rcpcount
	ON usr.UserId = rcpcount.CreatedBy
LEFT JOIN
(
	SELECT BrewedBy = UserId, [BrewSessionCount] = COUNT(*)
	FROM BrewSession with(nolock)
	WHERE IsActive = 1
	AND IsPublic = 1
	GROUP BY UserId
) brewcount
	ON usr.UserId = brewcount.BrewedBy
LEFT JOIN
(
	SELECT UserId, [CommentCount] = COUNT(*)
	FROM RecipeComment with(nolock)
	WHERE IsActive = 1
	GROUP BY UserId
) commcount
	ON usr.UserId = commcount.UserId

GO
/****** Object:  View [dbo].[vw_UserActivityReport]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_UserActivityReport] 
AS

SELECT
	usr.UserId
 ,	usr.FirstName
 ,	usr.LastName
 ,	usr.Username
 ,	lgn.LoginCount
 ,	RecipeCount = ISNULL(rcp.RecipeCount, 0)
 ,	BrewCount = ISNULL(sess.BrewCount, 0)
 ,	CommentCount = ISNULL(cmt.CommentCount, 0)
 ,	HasOAuth = CASE WHEN oath.UserId IS NOT NULL THEN 1 ELSE 0 END
 ,	CustomIngredients = ISNULL(ing.Total, 0)
 ,	EmailOptIn = CASE WHEN news.EmailAddress IS NOT NULL THEN 1 ELSE 0 END
 ,	Suggestions = ISNULL(sugg.SuggestionTotal, 0)
FROM
	[User] usr with(nolock)
JOIN
	(
		SELECT UserId, LoginCount = COUNT(*)
		FROM UserLogin with(nolock) GROUP BY UserId
	) lgn
	 ON usr.UserId = lgn.UserId
LEFT JOIN
(
	SELECT
		CreatedBy
	 ,	RecipeCount = COUNT(*)
	 FROM
	 	Recipe with(nolock)
	GROUP BY
		CreatedBy
) rcp
 ON usr.UserId = rcp.CreatedBy
LEFT JOIN
(
	SELECT
		BrewedBy = UserId
	 ,	BrewCount = COUNT(BrewSessionId)
	FROM
		BrewSession with(nolock)
	GROUP BY
		UserId
) sess
 ON usr.UserId = sess.BrewedBy
LEFT JOIN
(
	SELECT
		UserId
	 ,	CommentCount = COUNT(*)
	FROM
		RecipeComment with(nolock)
	GROUP BY
		UserId
) cmt
 ON usr.UserId = cmt.UserId
LEFT JOIN
	dbo.UserOAuthUserId oath with(nolock)
	 ON usr.UserId = oath.UserId
LEFT JOIN
(
	SELECT 
		UserId = CreatedByUserId
	 ,	Total = SUM(Total)
	FROM
	(
		SELECT CreatedByUserId, Total = COUNT(*) FROM Fermentable with(nolock) WHERE CreatedByUserId IS NOT NULL GROUP BY CreatedByUserId UNION
		SELECT CreatedByUserId, Total = COUNT(*) FROM Hop with(nolock) WHERE CreatedByUserId IS NOT NULL GROUP BY CreatedByUserId UNION
		SELECT CreatedByUserId, Total = COUNT(*) FROM Yeast with(nolock) WHERE CreatedByUserId IS NOT NULL GROUP BY CreatedByUserId UNION
		SELECT CreatedByUserId, Total = COUNT(*) FROM Adjunct with(nolock) WHERE CreatedByUserId IS NOT NULL GROUP BY CreatedByUserId
	) T
	GROUP BY
		CreatedByUserId
) ing
 ON usr.UserId = ing.UserId
LEFT JOIN
	dbo.NewsletterSignup news with(nolock)
	 ON usr.EmailAddress = news.EmailAddress
LEFT JOIN
(
	SELECT
		UserId
	 ,	SuggestionTotal = COUNT(*)
	FROM
		dbo.UserSuggestion sugg with(nolock)
	GROUP BY
		UserId
) sugg
 ON usr.UserId = sugg.UserId
GROUP BY
	usr.UserId
 ,	usr.FirstName
 ,	usr.LastName
 ,	usr.Username
 ,	lgn.LoginCount
 ,	rcp.RecipeCount
 ,	sess.BrewCount
 ,	cmt.CommentCount
 ,	oath.UserId
 ,	ing.Total
 ,	news.EmailAddress
 ,	sugg.SuggestionTotal
GO


/* ===================================================== */
/* STORED PROCEDURES */
/* ===================================================== */
/****** Object:  StoredProcedure [dbo].[GetObjectIdsForDashboard]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetObjectIdsForDashboard]
(
	@UserId INT
 ,	@Amount INT = 10
 ,	@OlderThanDate DATETIME = NULL
)
AS

SELECT
	[Type]
 ,	[Id]
 ,	[Date]
FROM
(
	SELECT
		objs.UserId
	 ,	objs.[Type]
	 ,	objs.Id
	 ,	objs.[Date]
	 ,	RowNumber = ROW_NUMBER() OVER (ORDER BY objs.[Date] DESC)
	FROM
		UserConnection conn with(nolock)
	JOIN
	(
		SELECT
			[UserId] = CreatedBy
		 ,	[Type] = 'Recipe'
		 ,	[Id] = RecipeId
		 ,	[Date] = DateCreated
		FROM
			Recipe with(nolock)
		WHERE
			DateCreated < ISNULL(@OlderThanDate, GETDATE())
			AND IsActive = 1
			AND IsPublic = 1
		UNION
	
		SELECT
			[UserId] = UserId
		 ,	[Type] = 'BrewSession'
		 ,	[Id] = BrewSessionId
		 ,	[Date] = BrewDate	
		FROM
			BrewSession with(nolock)
		WHERE
			BrewDate < ISNULL(@OlderThanDate, GETDATE())
			AND IsActive = 1
			AND IsPublic = 1
		UNION

		SELECT
			[UserId] = UserId
		 ,	[Type] = 'TastingNote'
		 ,	[Id] = TastingNoteId
		 ,	[Date] = TasteDate
		FROM
			TastingNoteSummary with(nolock)
		WHERE
			DateCreated < ISNULL(@OlderThanDate, GETDATE()) 

	) objs
	 ON 
		conn.UserId = objs.UserId
	 WHERE
		conn.FollowedById = @UserId
		AND
		conn.IsActive = 1
) T
WHERE
	RowNumber <= @Amount





GO
/****** Object:  StoredProcedure [dbo].[GetObjectIdsForDashboardNewest]    Script Date: 8/7/2015 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetObjectIdsForDashboardNewest]
(
	@Amount INT = 10
 ,	@OlderThanDate DATETIME = NULL
)
AS

SELECT
	[Type]
 ,	[Id]
 ,	[Date]
FROM
(
	SELECT
		objs.UserId
	 ,	objs.[Type]
	 ,	objs.Id
	 ,	objs.[Date]
	 ,	RowNumber = ROW_NUMBER() OVER (ORDER BY objs.[Date] DESC)
	 FROM
	(
		SELECT
			[UserId] = CreatedBy
		 ,	[Type] = 'Recipe'
		 ,	[Id] = RecipeId
		 ,	[Date] = DateCreated
		FROM
			Recipe with(nolock)
		WHERE
			DateCreated < ISNULL(@OlderThanDate, GETDATE())
			AND IsActive = 1
			AND IsPublic = 1
		UNION
	
		SELECT
			[UserId] = UserID
		 ,	[Type] = 'BrewSession'
		 ,	[Id] = BrewSessionId
		 ,	[Date] = BrewDate	
		FROM
			BrewSession with(nolock)
		WHERE
			BrewDate < ISNULL(@OlderThanDate, GETDATE())
			AND IsActive = 1
			AND IsPublic = 1

		UNION

		SELECT
			[UserId] = UserId
		 ,	[Type] = 'TastingNote'
		 ,	[Id] = TastingNoteId
		 ,	[Date] = TasteDate
		FROM
			TastingNoteSummary with(nolock)
		WHERE
			DateCreated < ISNULL(@OlderThanDate, GETDATE()) 
	) objs
) T
WHERE
	RowNumber <= @Amount
GO


/* ===================================================== */
/* TYPE DATA, STATUS DATA, ETC.  */
/* ===================================================== */
INSERT [dbo].[ContentType] ([ContentTypeId], [ContentTypeName]) VALUES (10, N'Web')
GO
INSERT [dbo].[ContentType] ([ContentTypeId], [ContentTypeName]) VALUES (20, N'Email')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (10, N'Mash')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (20, N'Boil')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (25, N'FlameOut')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (30, N'Primary')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (40, N'Secondary')
GO
INSERT [dbo].[AdjunctUsageType] ([AdjunctUsageTypeId], [AdjunctUsageTypeName]) VALUES (50, N'Bottle')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 10, N'American Ale', N'10A', N'American Pale Ale', N'Usually moderate to strong hop aroma from dry hopping or late kettle additions of American hop varieties.  A citrusy hop character is very common, but not required. Low to moderate maltiness supports the hop presentation, and may optionally show small amounts of specialty malt character (bready, toasty, biscuity).  Fruity esters vary from moderate to none.  No diacetyl.  Dry hopping (if used) may add grassy notes, although this character should not be excessive.', N'Pale golden to deep amber.  Moderately large white to off-white head with good retention.  Generally quite clear, although dry-hopped versions may be slightly hazy.', N'Usually a moderate to high hop flavor, often showing a citrusy American hop character (although other hop varieties may be used).  Low to moderately high clean malt character supports the hop presentation, and may optionally show small amounts of specialty malt character (bready, toasty, biscuity).  The balance is typically towards the late hops and bitterness, but the malt presence can be substantial.  Caramel flavors are usually restrained or absent.  Fruity esters can be moderate to none.  Moderate to high hop bitterness with a medium to dry finish.  Hop flavor and bitterness often lingers into the finish.  No diacetyl. Dry hopping (if used) may add grassy notes, although this character should not be excessive.', N'Medium-light to medium body.  Carbonation moderate to high.  Overall smooth finish without astringency often associated with high hopping rates.', N'Refreshing and hoppy, yet with sufficient supporting malt.', N'There is some overlap in color between American pale ale and American amber ale.  The American pale ale will generally be cleaner, have a less caramelly malt profile, less body, and often more finishing hops.', N'Pale ale malt, typically American two-row.  American hops, often but not always ones with a citrusy character.  American ale yeast.  Water can vary in sulfate content, but carbonate content should be relatively low.  Specialty grains may add character and complexity, but generally make up a relatively small portion of the grist.  Grains that add malt flavor and richness, light sweetness, and toasty or bready notes are often used (along with late hops) to differentiate brands.', 1.045, 1.06, 1.01, 1.015, 30, 45, 5, 14, 4.5, 6.2, N'Sierra Nevada Pale Ale, Stone Pale Ale, Great Lakes Burning River Pale Ale, Bear Republic XP Pale Ale, Anderson Valley Poleeko Gold Pale Ale, Deschutes Mirror Pond, Full Sail Pale Ale, Three Floyds X-Tra Pale Ale, Firestone Pale Ale, Left Hand Brewing Jackman''s Pale Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 10, N'American Ale', N'10B', N'American Amber Ale', N'Low to moderate hop aroma from dry hopping or late kettle additions of American hop varieties.  A citrusy hop character is common, but not required.  Moderately low to moderately high maltiness balances and sometimes masks the hop presentation, and usually shows a moderate caramel character. Esters vary from moderate to none.  No diacetyl.', N'Amber to coppery brown in color.  Moderately large off-white head with good retention.  Generally quite clear, although dry-hopped versions may be slightly hazy.', N'Moderate to high hop flavor from American hop varieties, which often but not always has a citrusy quality.  Malt flavors are moderate to strong, and usually show an initial malty sweetness followed by a moderate caramel flavor (and sometimes other character malts in lesser amounts).  Malt and hop bitterness are usually balanced and mutually supportive.  Fruity esters can be moderate to none.  Caramel sweetness and hop flavor/bitterness can linger somewhat into the medium to full finish.  No diacetyl.', N'Medium to medium-full body.  Carbonation moderate to high.  Overall smooth finish without astringency often associated with high hopping rates.  Stronger versions may have a slight alcohol warmth.', N'Like an American pale ale with more body, more caramel richness, and a balance more towards malt than hops (although hop rates can be significant).', N'Can overlap in color with American pale ales.  However, American amber ales differ from American pale ales not only by being usually darker in color, but also by having more caramel flavor, more body, and usually being balanced more evenly between malt and bitterness.  Should not have a strong chocolate or roast character that might suggest an American brown ale (although small amounts are OK).', N'Pale ale malt, typically American two-row.  Medium to dark crystal malts.  May also contain specialty grains which add additional character and uniqueness.  American hops, often with citrusy flavors, are common but others may also be used. Water can vary in sulfate and carbonate content.', 1.045, 1.06, 1.01, 1.015, 25, 40, 10, 17, 4.5, 6.2, N'North Coast Red Seal Ale, Tröegs HopBack Amber Ale, Deschutes Cinder Cone Red, Pyramid Broken Rake, St. Rogue Red Ale, Anderson Valley Boont Amber Ale, Lagunitas Censored Ale, Avery Redpoint Ale, McNeill''s Firehouse Amber Ale, Mendocino Red Tail Ale, Bell''s Amber')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 10, N'American Ale', N'10C', N'American Brown Ale', N'Malty, sweet and rich, which often has a chocolate, caramel, nutty and/or toasty quality.  Hop aroma is typically low to moderate.  Some interpretations of the style may feature a stronger hop aroma, a citrusy American hop character, and/or a fresh dry-hopped aroma (all are optional).  Fruity esters are moderate to very low.  The dark malt character is more robust than other brown ales, yet stops short of being overly porter-like.  The malt and hops are generally balanced.  Moderately low to no diacetyl.', N'Light to very dark brown color.  Clear.  Low to moderate off-white to light tan head.', N'Medium to high malty flavor (often with caramel, toasty and/or chocolate flavors), with medium to medium-high bitterness.  The medium to medium-dry finish provides an aftertaste having both malt and hops.  Hop flavor can be light to moderate, and may optionally have a citrusy character.  Very low to moderate fruity esters.  Moderately low to no diacetyl.', N'Medium to medium-full body.  More bitter versions may have a dry, resiny impression.  Moderate to moderately high carbonation.  Stronger versions may have some alcohol warmth in the finish.', N'Can be considered a bigger, maltier, hoppier interpretation of Northern English brown ale or a hoppier, less malty Brown Porter, often including the citrus-accented hop presence that is characteristic of American hop varieties.', N'A strongly flavored, hoppy brown beer, originated by American home brewers.  Related to American Pale and American Amber Ales, although with more of a caramel and chocolate character, which tends to balance the hop bitterness and finish.  Most commercial American Browns are not as aggressive as the original homebrewed versions, and some modern craft brewed examples.  IPA-strength brown ales should be entered in the Specialty Beer category (23).', N'Well-modified pale malt, either American or Continental, plus crystal and darker malts should complete the malt bill.  American hops are typical, but UK or noble hops can also be used. Moderate carbonate water would appropriately balance the dark malt acidity.', 1.045, 1.06, 1.01, 1.016, 20, 40, 18, 35, 4.3, 6.2, N'Bell''s Best Brown, Smuttynose Old Brown Dog Ale, Big Sky Moose Drool Brown Ale, North Coast Acme Brown, Brooklyn Brown Ale, Lost Coast Downtown Brown, Left Hand Deep Cover Brown Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 11, N'English Brown Ale', N'11A', N'Mild', N'Low to moderate malt aroma, and may have some fruitiness.  The malt expression can take on a wide range of character, which can include caramelly, grainy, toasted, nutty, chocolate, or lightly roasted.  Little to no hop aroma.  Very low to no diacetyl.', N'Copper to dark brown or mahogany color.  A few paler examples (medium amber to light brown) exist. Generally clear, although is traditionally unfiltered.  Low to moderate off-white to tan head.  Retention may be poor due to low carbonation, adjunct use and low gravity.', N'Generally a malty beer, although may have a very wide range of malt- and yeast-based flavors (e.g., malty, sweet, caramel, toffee, toast, nutty, chocolate, coffee, roast, vinous, fruit, licorice, molasses, plum, raisin).  Can finish sweet or dry.  Versions with darker malts may have a dry, roasted finish.  Low to moderate bitterness, enough to provide some balance but not enough to overpower the malt.  Fruity esters moderate to none.  Diacetyl and hop flavor low to none.', N'Light to medium body.  Generally low to medium-low carbonation.  Roast-based versions may have a light astringency.  Sweeter versions may seem to have a rather full mouthfeel for the gravity.', N'A light-flavored, malt-accented beer that is readily suited to drinking in quantity.  Refreshing, yet flavorful.  Some versions may seem like lower gravity brown porters.', N'Most are low-gravity session beers in the range 3.1-3.8%, although some versions may be made in the stronger (4%+) range for export, festivals, seasonal and/or special occasions.  Generally served on cask; session-strength bottled versions don''t often travel well.  A wide range of interpretations are possible.', N'Pale English base malts (often fairly dextrinous), crystal and darker malts should comprise the grist.  May use sugar adjuncts.  English hop varieties would be most suitable, though their character is muted.  Characterful English ale yeast.', 1.03, 1.038, 1.008, 1.013, 10, 25, 12, 25, 2.8, 4.5, N'Moorhouse Black Cat, Gale''s Festival Mild, Theakston Traditional Mild, Highgate Mild, Sainsbury Mild, Brain''s Dark, Banks''s Mild, Coach House Gunpowder Strong Mild, Woodforde''s Mardler''s Mild, Greene King XX Mild, Motor City Brewing Ghettoblaster')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 11, N'English Brown Ale', N'11B', N'Southern English Brown', N'Malty-sweet, often with a rich, caramel or toffee-like character. Moderately fruity, often with notes of dark fruits such as plums and/or raisins.  Very low to no hop aroma.  No diacetyl.', N'Light to dark brown, and can be almost black.  Nearly opaque, although should be relatively clear if visible.  Low to moderate off-white to tan head.', N'Deep, caramel- or toffee-like malty sweetness on the palate and lasting into the finish.  Hints of biscuit and coffee are common.  May have a moderate dark fruit complexity.  Low hop bitterness.  Hop flavor is low to non-existent.  Little or no perceivable roasty or bitter black malt flavor.  Moderately sweet finish with a smooth, malty aftertaste.  Low to no diacetyl.', N'Medium body, but the residual sweetness may give a heavier impression.  Low to moderately low carbonation.  Quite creamy and smooth in texture, particularly for its gravity.', N'A luscious, malt-oriented brown ale, with a caramel, dark fruit complexity of malt flavor.  May seem somewhat like a smaller version of a sweet stout or a sweet version of a dark mild.', N'Increasingly rare; Mann''s has over 90% market share in Britain.  Some consider it a bottled version of dark mild, but this style is sweeter than virtually all modern examples of mild.', N'English pale ale malt as a base with a healthy proportion of darker caramel malts and often some roasted (black) malt and wheat malt.  Moderate to high carbonate water would appropriately balance the dark malt acidity.  English hop varieties are most authentic, though with low flavor and bitterness almost any type could be used.', 1.033, 1.042, 1.011, 1.014, 12, 20, 19, 35, 2.8, 4.1, N'Mann''s Brown Ale (bottled, but not available in the US), Harvey''s Nut Brown Ale, Woodeforde''s Norfolk Nog')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 11, N'English Brown Ale', N'11C', N'Northern English Brown Ale', N'Light, sweet malt aroma with toffee, nutty and/or caramel notes.  A light but appealing fresh hop aroma (UK varieties) may also be noticed.  A light fruity ester aroma may be evident in these beers, but should not dominate.  Very low to no diacetyl.', N'Dark amber to reddish-brown color.  Clear.  Low to moderate off-white to light tan head.', N'Gentle to moderate malt sweetness, with a nutty, lightly caramelly character and a medium-dry to dry finish.  Malt may also have a toasted, biscuity, or toffee-like character.  Medium to medium-low bitterness.  Malt-hop balance is nearly even, with hop flavor low to none (UK varieties).  Some fruity esters can be present; low diacetyl (especially butterscotch) is optional but acceptable.', N'Medium-light to medium body.  Medium to medium-high carbonation.', N'Drier and more hop-oriented that southern English brown ale, with a nutty character rather than caramel.', N'English brown ales are generally split into sub-styles along geographic lines.', N'English mild ale or pale ale malt base with caramel malts. May also have small amounts darker malts (e.g., chocolate) to provide color and the nutty character.  English hop varieties are most authentic. Moderate carbonate water.', 1.04, 1.052, 1.008, 1.014, 20, 30, 12, 22, 4.2, 5.4, N'Newcastle Brown Ale, Samuel Smith''s Nut Brown Ale, Riggwelter Yorkshire Ale, Wychwood Hobgoblin, Tröegs Rugged Trail Ale, Alesmith Nautical Nut Brown Ale, Avery Ellie''s Brown Ale, Goose Island Nut Brown Ale, Samuel Adams Brown Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 12, N'Porter', N'12A', N'Brown Porter', N'Malt aroma with mild roastiness should be evident, and may have a chocolaty quality.  May also show some non-roasted malt character in support (caramelly, grainy, bready, nutty, toffee-like and/or sweet).  English hop aroma moderate to none.  Fruity esters moderate to none.  Diacetyl low to none.', N'Light brown to dark brown in color, often with ruby highlights when held up to light.  Good clarity, although may approach being opaque.  Moderate off-white to light tan head with good to fair retention.', N'Malt flavor includes a mild to moderate roastiness (frequently with a chocolate character) and often a significant caramel, nutty, and/or toffee character.  May have other secondary flavors such as coffee, licorice, biscuits or toast in support.  Should not have a significant black malt character (acrid, burnt, or harsh roasted flavors), although small amounts may contribute a bitter chocolate complexity.  English hop flavor moderate to none.  Medium-low to medium hop bitterness will vary the balance from slightly malty to slightly bitter.  Usually fairly well attenuated, although somewhat sweet versions exist.  Diacetyl should be moderately low to none.  Moderate to low fruity esters.', N'Medium-light to medium body.  Moderately low to moderately high carbonation.', N'A fairly substantial English dark ale with restrained roasty characteristics.', N'Differs from a robust porter in that it usually has softer, sweeter and more caramelly flavors, lower gravities, and usually less alcohol.  More substance and roast than a brown ale.  Higher in gravity than a dark mild.  Some versions are fermented with lager yeast.  Balance tends toward malt more than hops.  Usually has an "English" character.  Historical versions with Brettanomyces, sourness, or smokiness should be entered in the Specialty Beer category (23).', N'English ingredients are most common.  May contain several malts, including chocolate and/or other dark roasted malts and caramel-type malts. Historical versions would use a significant amount of brown malt.  Usually does not contain large amounts of black patent malt or roasted barley.  English hops are most common, but are usually subdued.  London or Dublin-type water (moderate carbonate hardness) is traditional.  English or Irish ale yeast, or occasionally lager yeast, is used.  May contain a moderate amount of adjuncts (sugars, maize, molasses, treacle, etc.).', 1.04, 1.052, 1.008, 1.014, 18, 35, 20, 30, 4, 5.4, N'Fuller''s London Porter, Samuel Smith Taddy Porter, Burton Bridge Burton Porter, RCH Old Slug Porter, Nethergate Old Growler Porter, Hambleton Nightmare Porter, Harvey''s Tom Paine Original Old Porter, Salopian Entire Butt English Porter, St. Peters Old-Style Porter, Shepherd Neame Original Porter, Flag Porter, Wasatch Polygamy Porter')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 12, N'Porter', N'12B', N'Robust Porter', N'Roasty aroma (often with a lightly burnt, black malt character) should be noticeable and may be moderately strong. Optionally may also show some additional malt character in support (grainy, bready, toffee-like, caramelly, chocolate, coffee, rich, and/or sweet).  Hop aroma low to high (US or UK varieties).  Some American versions may be dry-hopped.  Fruity esters are moderate to none.  Diacetyl low to none.', N'Medium brown to very dark brown, often with ruby- or garnet-like highlights.  Can approach black in color.  Clarity may be difficult to discern in such a dark beer, but when not opaque will be clear (particularly when held up to the light).  Full, tan-colored head with moderately good head retention.', N'Moderately strong malt flavor usually features a lightly burnt, black malt character (and sometimes chocolate and/or coffee flavors) with a bit of roasty dryness in the finish.  Overall flavor may finish from dry to medium-sweet, depending on grist composition, hop bittering level, and attenuation. May have a sharp character from dark roasted grains, although should not be overly acrid, burnt or harsh.  Medium to high bitterness, which can be accentuated by the roasted malt.  Hop flavor can vary from low to moderately high (US or UK varieties, typically), and balances the roasted malt flavors.  Diacetyl low to none.  Fruity esters moderate to none.', N'Medium to medium-full body.  Moderately low to moderately high carbonation.  Stronger versions may have a slight alcohol warmth.  May have a slight astringency from roasted grains, although this character should not be strong.', N'A substantial, malty dark ale with a complex and flavorful roasty character.', N'Although a rather broad style open to brewer interpretation, it may be distinguished from Stout as lacking a strong roasted barley character.  It differs from a brown porter in that a black patent or roasted grain character is usually present, and it can be stronger in alcohol.  Roast intensity and malt flavors can also vary significantly.  May or may not have a strong hop character, and may or may not have significant fermentation by-products; thus may seem to have an "American" or "English" character.', N'May contain several malts, prominently dark roasted malts and grains, which often include black patent malt (chocolate malt and/or roasted barley may also be used in some versions).  Hops are used for bittering, flavor and/or aroma, and are frequently UK or US varieties.  Water with moderate to high carbonate hardness is typical.  Ale yeast can either be clean US versions or characterful English varieties.', 1.048, 1.065, 1.012, 1.016, 25, 50, 22, 35, 4.8, 6.5, N'Great Lakes Edmund Fitzgerald Porter, Meantime London Porter, Anchor Porter, Smuttynose Robust Porter, Sierra Nevada Porter, Deschutes Black Butte Porter,  Boulevard Bully! Porter, Rogue Mocha Porter, Avery New World Porter, Bell''s Porter, Great Divide Saint Bridget''s Porter')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 12, N'Porter', N'12C', N'Baltic Porter', N'Rich malty sweetness often containing caramel, toffee, nutty to deep toast, and/or licorice notes.  Complex alcohol and ester profile of moderate strength, and reminiscent of plums, prunes, raisins, cherries or currants, occasionally with a vinous Port-like quality.  Some darker malt character that is deep chocolate, coffee or molasses but never burnt.  No hops.  No sourness.  Very smooth.', N'Dark reddish copper to opaque dark brown (not black).  Thick, persistent tan-colored head.  Clear, although darker versions can be opaque.', N'As with aroma, has a rich malty sweetness with a complex blend of deep malt, dried fruit esters, and alcohol.  Has a prominent yet smooth schwarzbier-like roasted flavor that stops short of burnt.  Mouth-filling and very smooth.  Clean lager character; no diacetyl.  Starts sweet but darker malt flavors quickly dominates and persists through finish.  Just a touch dry with a hint of roast coffee or licorice in the finish.  Malt can have a caramel, toffee, nutty, molasses and/or licorice complexity.  Light hints of black currant and dark fruits.  Medium-low to medium bitterness from malt and hops, just to provide balance.  Hop flavor from slightly spicy hops (Lublin or Saaz types) ranges from none to medium-low.', N'Generally quite full-bodied and smooth, with a well-aged alcohol warmth (although the rarer lower gravity Carnegie-style versions will have a medium body and less warmth).  Medium to medium-high carbonation, making it seem even more mouth-filling.  Not heavy on the tongue due to carbonation level.  Most versions are in the 7-8.5% ABV range.', N'A Baltic Porter often has the malt flavors reminiscent of an English brown porter and the restrained roast of a schwarzbier, but with a higher OG and alcohol content than either.  Very complex, with multi-layered flavors.', N'May also be described as an Imperial Porter, although heavily roasted or hopped versions should be entered as either Imperial Stouts (13F) or Specialty Beers (23).', N'Generally lager yeast (cold fermented if using ale yeast).  Debittered chocolate or black malt.  Munich or Vienna base malt.  Continental hops.  May contain crystal malts and/or adjuncts.  Brown or amber malt common in historical recipes.', 1.06, 1.09, 1.016, 1.024, 20, 40, 17, 30, 5.5, 9.5, N'Sinebrychoff Porter (Finland), Okocim Porter (Poland), Zywiec Porter (Poland), Baltika #6 Porter (Russia), Carnegie Stark Porter (Sweden), Aldaris Porteris (Latvia), Utenos Porter (Lithuania), Stepan Razin Porter (Russia), Nøgne ø porter (Norway), Neuzeller Kloster-Bräu Neuzeller Porter (Germany), Southampton Imperial Baltic Porter')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13A', N'Dry Stout', N'Coffee-like roasted barley and roasted malt aromas are prominent; may have slight chocolate, cocoa and/or grainy secondary notes.  Esters medium-low to none.  No diacetyl.  Hop aroma low to none.', N'Jet black to deep brown with garnet highlights in color.  Can be opaque (if not, it should be clear).  A thick, creamy, long-lasting, tan- to brown-colored head is characteristic.', N'Moderate roasted, grainy sharpness, optionally with light to moderate acidic sourness, and medium to high hop bitterness.  Dry, coffee-like finish from roasted grains.  May have a bittersweet or unsweetened chocolate character in the palate, lasting into the finish.  Balancing factors may include some creaminess, medium-low to no fruitiness, and medium to no hop flavor.  No diacetyl.', N'Medium-light to medium-full body, with a creamy character. Low to moderate carbonation.  For the high hop bitterness and significant proportion of dark grains present, this beer is remarkably smooth.  The perception of body can be affected by the overall gravity with smaller beers being lighter in body.  May have a light astringency from the roasted grains, although harshness is undesirable.', N'A very dark, roasty, bitter, creamy ale.', N'This is the draught version of what is otherwise known as Irish stout or Irish dry stout.  Bottled versions are typically brewed from a significantly higher OG and may be designated as foreign extra stouts (if sufficiently strong).  While most commercial versions rely primarily on roasted barley as the dark grain, others use chocolate malt, black malt or combinations of the three.  The level of bitterness is somewhat variable, as is the roasted character and the dryness of the finish; allow for interpretation by brewers.', N'The dryness comes from the use of roasted unmalted barley in addition to pale malt, moderate to high hop bitterness, and good attenuation.  Flaked unmalted barley may also be used to add creaminess. A small percentage (perhaps 3%) of soured beer is sometimes added for complexity (generally by Guinness only).  Water typically has moderate carbonate hardness, although high levels will not give the classic dry finish.', 1.036, 1.05, 1.007, 1.011, 30, 45, 25, 40, 4, 5, N'Guinness Draught Stout (also canned), Murphy''s Stout, Beamish Stout, O''Hara''s Celtic Stout, Russian River O.V.L. Stout, Three Floyd''s Black Sun Stout, Dorothy Goodbody''s Wholesome Stout, Orkney Dragonhead Stout, Old Dominion Stout, Goose Island Dublin Stout, Brooklyn Dry Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13B', N'Sweet Stout', N'Mild roasted grain aroma, sometimes with coffee and/or chocolate notes.  An impression of cream-like sweetness often exists.  Fruitiness can be low to moderately high.  Diacetyl low to none.  Hop aroma low to none.', N'Very dark brown to black in color.  Can be opaque (if not, it should be clear).  Creamy tan to brown head.', N'Dark roasted grains and malts dominate the flavor as in dry stout, and provide coffee and/or chocolate flavors.  Hop bitterness is moderate (lower than in dry stout).  Medium to high sweetness (often from the addition of lactose) provides a counterpoint to the roasted character and hop bitterness, and lasts into the finish.  Low to moderate fruity esters.  Diacetyl low to none.  The balance between dark grains/malts and sweetness can vary, from quite sweet to moderately dry and somewhat roasty.', N'Medium-full to full-bodied and creamy.  Low to moderate carbonation.  High residual sweetness from unfermented sugars enhances the full-tasting mouthfeel.', N'A very dark, sweet, full-bodied, slightly roasty ale.  Often tastes like sweetened espresso.', N'Gravities are low in England, higher in exported and US products.  Variations exist, with the level of residual sweetness, the intensity of the roast character, and the balance between the two being the variables most subject to interpretation.', N'The sweetness in most Sweet Stouts comes from a lower bitterness level than dry stouts and a high percentage of unfermentable dextrins.   Lactose, an unfermentable sugar, is frequently added to provide additional residual sweetness.  Base of pale malt, and may use roasted barley, black malt, chocolate malt, crystal malt, and adjuncts such as maize or treacle.  High carbonate water is common.', 1.044, 1.06, 1.012, 1.024, 20, 40, 30, 40, 4, 6, N'Mackeson''s XXX Stout, Watney''s Cream Stout, Farson''s Lacto Stout, St. Peter''s Cream Stout, Marston''s Oyster Stout, Sheaf Stout, Hitachino Nest Sweet Stout (Lacto), Samuel Adams Cream Stout, Left Hand Milk Stout, Widmer Snowplow Milk Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13C', N'Oatmeal Stout', N'Mild roasted grain aromas, often with a coffee-like character.  A light sweetness can imply a coffee-and-cream impression.  Fruitiness should be low to medium. Diacetyl medium-low to none.  Hop aroma low to none (UK varieties most common).  A light oatmeal aroma is optional.', N'Medium brown to black in color.  Thick, creamy, persistent tan- to brown-colored head.  Can be opaque (if not, it should be clear).', N'Medium sweet to medium dry palate, with the complexity of oats and dark roasted grains present.  Oats can add a nutty, grainy or earthy flavor.  Dark grains can combine with malt sweetness to give the impression of milk chocolate or coffee with cream.  Medium hop bitterness with the balance toward malt.  Diacetyl medium-low to none.  Hop flavor medium-low to none.', N'Medium-full to full body, smooth, silky, sometimes an almost oily slickness from the oatmeal.  Creamy. Medium to medium-high carbonation.', N'A very dark, full-bodied, roasty, malty ale with a complementary oatmeal flavor.', N'Generally between sweet and dry stouts in sweetness.  Variations exist, from fairly sweet to quite dry.  The level of bitterness also varies, as does the oatmeal impression.  Light use of oatmeal may give a certain silkiness of body and richness of flavor, while heavy use of oatmeal can be fairly intense in flavor with an almost oily mouthfeel.  When judging, allow for differences in interpretation.', N'Pale, caramel and dark roasted malts and grains.', 1.048, 1.065, 1.01, 1.018, 25, 40, 22, 40, 4.2, 5.9, N'Samuel Smith Oatmeal Stout, Young''s Oatmeal Stout, McAuslan Oatmeal Stout, Maclay''s Oat Malt Stout, Broughton Kinmount Willie Oatmeal Stout, Anderson Valley Barney Flats Oatmeal Stout, Tröegs Oatmeal Stout, New Holland The Poet, Goose Island Oatmeal Stout, Wolaver''s Oatmeal Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13D', N'Foreign Extra Stout', N'Roasted grain aromas moderate to high, and can have coffee, chocolate and/or lightly burnt notes.  Fruitiness medium to high.  Some versions may have a sweet aroma, or molasses, licorice, dried fruit, and/or vinous aromatics.  Stronger versions can have the aroma of alcohol (never sharp, hot, or solventy).  Hop aroma low to none.  Diacetyl low to none.', N'Very deep brown to black in color.  Clarity usually obscured by deep color (if not opaque, should be clear).  Large tan to brown head with good retention.', N'Tropical versions can be quite sweet without much roast or bitterness, while export versions can be moderately dry (reflecting impression of a scaled-up version of either sweet stout or dry stout).  Roasted grain and malt character can be moderate to high, although sharpness of dry stout will not be present in any example.  Tropical versions can have high fruity esters, smooth dark grain flavors, and restrained bitterness; they often have a sweet, rum-like quality.  Export versions tend to have lower esters, more assertive roast flavors, and higher bitterness.  The roasted flavors of either version may taste of coffee, chocolate, or lightly burnt grain.  Little to no hop flavor.  Very low to no diacetyl.', N'Medium-full to full body, often with a smooth, creamy character.  May give a warming (but never hot) impression from alcohol presence.  Moderate to moderately-high carbonation.', N'A very dark, moderately strong, roasty ale.  Tropical varieties can be quite sweet, while export versions can be drier and fairly robust.', N'A rather broad class of stouts, these can be either fruity and sweet, dry and bitter, or even tinged with Brettanomyces (e.g., Guinness Foreign Extra Stout; this type of beer is best entered as a Specialty Beer – Category 23).  Think of the style as either a scaled-up dry and/or sweet stout, or a scaled-down Imperial stout without the late hops.  Highly bitter and hoppy versions are best entered as American-style Stouts (13E).', N'Similar to dry or sweet stout, but with more gravity.  Pale and dark roasted malts and grains.  Hops mostly for bitterness.  May use adjuncts and sugar to boost gravity.  Ale yeast (although some tropical stouts are brewed with lager yeast).', 1.056, 1.075, 1.01, 1.018, 30, 70, 30, 40, 5.5, 8, N'Lion Stout (Sri Lanka), Dragon Stout (Jamaica), ABC Stout (Singapore), Royal Extra "The Lion Stout" (Trinidad), Jamaica Stout (Jamaica), Export-Type: Freeminer Deep Shaft Stout, Guinness Foreign Extra Stout (bottled, not sold in the US), Ridgeway of Oxfordshire Foreign Extra Stout, Coopers Best Extra Stout, Elysian Dragonstooth Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13E', N'American Stout', N'Moderate to strong aroma of roasted malts, often having a roasted coffee or dark chocolate quality.  Burnt or charcoal aromas are low to none.  Medium to very low hop aroma, often with a citrusy or resiny American hop character.  Esters are optional, but can be present up to medium intensity.  Light alcohol-derived aromatics are also optional.  No diacetyl.', N'Generally a jet black color, although some may appear very dark brown.  Large, persistent head of light tan to light brown in color.  Usually opaque.', N'Moderate to very high roasted malt flavors, often tasting of coffee, roasted coffee beans, dark or bittersweet chocolate.  May have a slightly burnt coffee ground flavor, but this character should not be prominent if present.  Low to medium malt sweetness, often with rich chocolate or caramel flavors.  Medium to high bitterness.  Hop flavor can be low to high, and generally reflects citrusy or resiny American varieties.  Light esters may be present but are not required.  Medium to dry finish, occasionally with a light burnt quality.  Alcohol flavors can be present up to medium levels, but smooth.  No diacetyl.', N'Medium to full body.  Can be somewhat creamy, particularly if a small amount of oats have been used to enhance mouthfeel.  Can have a bit of roast-derived astringency, but this character should not be excessive.  Medium-high to high carbonation.  Light to moderately strong alcohol warmth, but smooth and not excessively hot.', N'A hoppy, bitter, strongly roasted Foreign-style Stout (of the export variety).', N'Breweries express individuality through varying the roasted malt profile, malt sweetness and flavor, and the amount of finishing hops used.  Generally has bolder roasted malt flavors and hopping than other traditional stouts (except Imperial Stouts).', N'Common American base malts and yeast.  Varied use of dark and roasted malts, as well as caramel-type malts.  Adjuncts such as oatmeal may be present in low quantities.  American hop varieties.', 1.05, 1.075, 1.01, 1.022, 35, 75, 30, 40, 5, 7, N'Rogue Shakespeare Stout, Deschutes Obsidian Stout, Sierra Nevada Stout, North Coast Old No. 38, Bar Harbor Cadillac Mountain Stout, Avery Out of Bounds Stout, Lost Coast 8 Ball Stout, Mad River Steelhead Extra Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 13, N'Stout', N'13F', N'Russian Imperial Stout', N'Rich and complex, with variable amounts of roasted grains, maltiness, fruity esters, hops, and alcohol.  The roasted malt character can take on coffee, dark chocolate, or slightly burnt tones and can be light to moderately strong.  The malt aroma can be subtle to rich and barleywine-like, depending on the gravity and grain bill.  May optionally show a slight specialty malt character (e.g., caramel), but this should only add complexity and not dominate.  Fruity esters may be low to moderately strong, and may take on a complex, dark fruit (e.g., plums, prunes, raisins) character.  Hop aroma can be very low to quite aggressive, and may contain any hop variety.  An alcohol character may be present, but shouldn''t be sharp, hot or solventy.  Aged versions may have a slight vinous or port-like quality, but shouldn''t be sour.  No diacetyl.  The balance can vary with any of the aroma elements taking center stage.  Not all possible aromas described need be present; many interpretations are possible.  Aging affects the intensity, balance and smoothness of aromatics.', N'Color may range from very dark reddish-brown to jet black. Opaque.  Deep tan to dark brown head.  Generally has a well-formed head, although head retention may be low to moderate.  High alcohol and viscosity may be visible in "legs" when beer is swirled in a glass.', N'Rich, deep, complex and frequently quite intense, with variable amounts of roasted malt/grains, maltiness, fruity esters, hop bitterness and flavor, and alcohol.  Medium to aggressively high bitterness.  Medium-low to high hop flavor (any variety).  Moderate to aggressively high roasted malt/grain flavors can suggest bittersweet or unsweetened chocolate, cocoa, and/or strong coffee.  A slightly burnt grain, burnt currant or tarry character may be evident.  Fruity esters may be low to intense, and can take on a dark fruit character (raisins, plums, or prunes).  Malt backbone can be balanced and supportive to rich and barleywine-like, and may optionally show some supporting caramel, bready or toasty flavors.  Alcohol strength should be evident, but not hot, sharp, or solventy.  No diacetyl.  The palate and finish can vary from relatively dry to moderately sweet, usually with some lingering roastiness, hop bitterness and warming character.  The balance and intensity of flavors can be affected by aging, with some flavors becoming more subdued over time and some aged, vinous or port-like qualities developing.', N'Full to very full-bodied and chewy, with a velvety, luscious texture (although the body may decline with long conditioning).  Gentle smooth warmth from alcohol should be present and noticeable.  Should not be syrupy and under-attenuated.  Carbonation may be low to moderate, depending on age and conditioning.', N'An intensely flavored, big, dark ale. Roasty, fruity, and bittersweet, with a noticeable alcohol presence. Dark fruit flavors meld with roasty, burnt, or almost tar-like sensations.  Like a black barleywine with every dimension of flavor coming into play.', N'Variations exist, with English and American interpretations (predictably, the American versions have more bitterness, roasted character, and finishing hops, while the English varieties reflect a more complex specialty malt character and a more forward ester profile).  The wide range of allowable characteristics allow for maximum brewer creativity.', N'Well-modified pale malt, with generous quantities of roasted malts and/or grain.  May have a complex grain bill using virtually any variety of malt.  Any type of hops may be used.  Alkaline water balances the abundance of acidic roasted grain in the grist.  American or English ale yeast.', 1.075, 1.115, 1.018, 1.03, 50, 90, 30, 40, 8, 12, N'Three Floyd''s Dark Lord, Bell''s Expedition Stout, North Coast Old Rasputin Imperial Stout, Stone Imperial Stout, Samuel Smith Imperial Stout, Scotch Irish Tsarina Katarina Imperial Stout, Thirsty Dog Siberian Night, Deschutes The Abyss, Great Divide Yeti, Southampton Russian Imperial Stout, Rogue Imperial Stout, Bear Republic Big Bear Black Stout, Great Lakes Blackout Stout, Avery The Czar, Founders Imperial Stout, Victory Storm King, Brooklyn Black Chocolate Stout')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 14, N'India Pale Ale(IPA)', N'14A', N'English IPA', N'A moderate to moderately high hop aroma of floral, earthy or fruity nature is typical, although the intensity of hop character is usually lower than American versions.  A slightly grassy dry-hop aroma is acceptable, but not required.  A moderate caramel-like or toasty malt presence is common.  Low to moderate fruitiness, either from esters or hops, can be present.  Some versions may have a sulfury note, although this character is not mandatory.', N'Color ranges from golden amber to light copper, but most are pale to medium amber with an orange-ish tint.  Should be clear, although unfiltered dry-hopped versions may be a bit hazy.  Good head stand with off-white color should persist.', N'Hop flavor is medium to high, with a moderate to assertive hop bitterness.  The hop flavor should be similar to the aroma (floral, earthy, fruity, and/or slightly grassy).  Malt flavor should be medium-low to medium-high, but should be noticeable, pleasant, and support the hop aspect.  The malt should show an English character and be somewhat bready, biscuit-like, toasty, toffee-like and/or caramelly.  Despite the substantial hop character typical of these beers, sufficient malt flavor, body and complexity to support the hops will provide the best balance. Very low levels of diacetyl are acceptable, and fruitiness from the fermentation or hops adds to the overall complexity.  Finish is medium to dry, and bitterness may linger into the aftertaste but should not be harsh.  If high sulfate water is used, a distinctively minerally, dry finish, some sulfur flavor, and a lingering bitterness are usually present.  Some clean alcohol flavor can be noted in stronger versions.  Oak is inappropriate in this style.', N'Smooth, medium-light to medium-bodied mouthfeel without hop-derived astringency, although moderate to medium-high carbonation can combine to render an overall dry sensation in the presence of malt sweetness.  Some smooth alcohol warming can and should be sensed in stronger (but not all) versions.', N'A hoppy, moderately strong pale ale that features characteristics consistent with the use of English malt, hops and yeast.  Has less hop character and a more pronounced malt flavor than American versions.', N'A pale ale brewed to an increased gravity and hop rate.  Modern versions of English IPAs generally pale in comparison (pun intended) to their ancestors.  The term "IPA" is loosely applied in commercial English beers today, and has been (incorrectly) used in beers below 4% ABV.  Generally will have more finish hops and less fruitiness and/or caramel than English pale ales and bitters.  Fresher versions will obviously have a more significant finishing hop character.', N'Pale ale malt (well-modified and suitable for single-temperature infusion mashing); English hops; English yeast that can give a fruity or sulfury/minerally profile. Refined sugar may be used in some versions.  High sulfate and low carbonate water is essential to achieving a pleasant hop bitterness in authentic Burton versions, although not all examples will exhibit the strong sulfate character.', 1.05, 1.075, 1.01, 1.018, 40, 60, 8, 14, 5, 7.5, N'Meantime India Pale Ale, Freeminer Trafalgar IPA, Fuller''s IPA, Ridgeway Bad Elf, Summit India Pale Ale, Samuel Smith''s India Ale, Hampshire Pride of Romsey IPA, Burton Bridge Empire IPA,Middle Ages ImPailed Ale, Goose Island IPA, Brooklyn East India Pale Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 14, N'India Pale Ale(IPA)', N'14B', N'American IPA', N'A prominent to intense hop aroma with a citrusy, floral, perfume-like, resinous, piney, and/or fruity character derived from American hops.  Many versions are dry hopped and can have an additional grassy aroma, although this is not required.  Some clean malty sweetness may be found in the background, but should be at a lower level than in English examples.  Fruitiness, either from esters or hops, may also be detected in some versions, although a neutral fermentation character is also acceptable.  Some alcohol may be noted.', N'Color ranges from medium gold to medium reddish copper; some versions can have an orange-ish tint.  Should be clear, although unfiltered dry-hopped versions may be a bit hazy.  Good head stand with white to off-white color should persist.', N'Hop flavor is medium to high, and should reflect an American hop character with citrusy, floral, resinous, piney or fruity aspects.  Medium-high to very high hop bitterness, although the malt backbone will support the strong hop character and provide the best balance.  Malt flavor should be low to medium, and is generally clean and malty sweet although some caramel or toasty flavors are acceptable at low levels. No diacetyl.  Low fruitiness is acceptable but not required.  The bitterness may linger into the aftertaste but should not be harsh.  Medium-dry to dry finish.  Some clean alcohol flavor can be noted in stronger versions.  Oak is inappropriate in this style.  May be slightly sulfury, but most examples do not exhibit this character.', N'Smooth, medium-light to medium-bodied mouthfeel without hop-derived astringency, although moderate to medium-high carbonation can combine to render an overall dry sensation in the presence of malt sweetness.  Some smooth alcohol warming can and should be sensed in stronger (but not all) versions.  Body is generally less than in English counterparts.', N'A decidedly hoppy and bitter, moderately strong American pale ale.', N'', N'Pale ale malt (well-modified and suitable for single-temperature infusion mashing); American hops; American yeast that can give a clean or slightly fruity profile. Generally all-malt, but mashed at lower temperatures for high attenuation.  Water character varies from soft to moderately sulfate.  Versions with a noticeable Rye character ("RyePA") should be entered in the Specialty category.', 1.056, 1.075, 1.01, 1.018, 40, 70, 6, 15, 5.5, 7.5, N'Bell''s Two-Hearted Ale, AleSmith IPA, Russian River Blind Pig IPA, Stone IPA, Three Floyds Alpha King, Great Divide Titan IPA, Bear Republic Racer 5 IPA, Victory Hop Devil, Sierra Nevada Celebration Ale, Anderson Valley Hop Ottin'',  Dogfish Head 60 Minute IPA, Founder''s Centennial IPA, Anchor Liberty Ale, Harpoon IPA, Avery IPA')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 14, N'India Pale Ale(IPA)', N'14C', N'Imperial IPA', N'A prominent to intense hop aroma that can be derived from American, English and/or noble varieties (although a citrusy hop character is almost always present).  Most versions are dry hopped and can have an additional resinous or grassy aroma, although this is not absolutely required.  Some clean malty sweetness may be found in the background.  Fruitiness, either from esters or hops, may also be detected in some versions, although a neutral fermentation character is typical.  Some alcohol can usually be noted, but it should not have a "hot" character.', N'Color ranges from golden amber to medium reddish copper; some versions can have an orange-ish tint.  Should be clear, although unfiltered dry-hopped versions may be a bit hazy.  Good head stand with off-white color should persist.', N'Hop flavor is strong and complex, and can reflect the use of American, English and/or noble hop varieties.  High to absurdly high hop bitterness, although the malt backbone will generally support the strong hop character and provide the best balance.  Malt flavor should be low to medium, and is generally clean and malty although some caramel or toasty flavors are acceptable at low levels. No diacetyl.  Low fruitiness is acceptable but not required.  A long, lingering bitterness is usually present in the aftertaste but should not be harsh.  Medium-dry to dry finish.  A clean, smooth alcohol flavor is usually present.  Oak is inappropriate in this style.  May be slightly sulfury, but most examples do not exhibit this character.', N'Smooth, medium-light to medium body.  No harsh hop-derived astringency, although moderate to medium-high carbonation can combine to render an overall dry sensation in the presence of malt sweetness.  Smooth alcohol warming.', N'An intensely hoppy, very strong pale ale without the big maltiness and/or deeper malt flavors of an American barleywine.  Strongly hopped, but clean, lacking harshness, and a tribute to historical IPAs.  Drinkability is an important characteristic; this should not be a heavy, sipping beer.  It should also not have much residual sweetness or a heavy character grain profile.', N'Bigger than either an English or American IPA in both alcohol strength and overall hop level (bittering and finish).  Less malty, lower body, less rich and a greater overall hop intensity than an American Barleywine.  Typically not as high in gravity/alcohol as a barleywine, since high alcohol and malt tend to limit drinkability.  A showcase for hops.', N'Pale ale malt (well-modified and suitable for single-temperature infusion mashing); can use a complex variety of hops (English, American, noble). American yeast that can give a clean or slightly fruity profile. Generally all-malt, but mashed at lower temperatures for high attenuation.  Water character varies from soft to moderately sulfate.', 1.07, 1.09, 1.01, 1.02, 60, 120, 8, 15, 7.5, 10, N'Russian River Pliny the Elder, Three Floyd''s Dreadnaught, Avery Majaraja, Bell''s Hop Slam, Stone Ruination IPA, Great Divide Hercules Double IPA, Surly Furious, Rogue I2PA, Moylan''s Hopsickle Imperial India Pale Ale, Stoudt''s Double IPA, Dogfish Head 90-minute IPA, Victory Hop Wallop')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 15, N'German Wheat and Rye Beer', N'15A', N'Weizen/Weissbier', N'Moderate to strong phenols (usually clove) and fruity esters (usually banana).  The balance and intensity of the phenol and ester components can vary but the best examples are reasonably balanced and fairly prominent.  Noble hop character ranges from low to none.  A light to moderate wheat aroma (which might be perceived as bready or grainy) may be present but other malt characteristics should not.  No diacetyl or DMS.  Optional, but acceptable, aromatics can include a light, citrusy tartness, a light to moderate vanilla character, and/or a low bubblegum aroma.  None of these optional characteristics should be high or dominant, but often can add to the complexity and balance.', N'Pale straw to very dark gold in color.  A very thick, moussy, long-lasting white head is characteristic.  The high protein content of wheat impairs clarity in an unfiltered beer, although the level of haze is somewhat variable.  A beer "mit hefe" is also cloudy from suspended yeast sediment (which should be roused before drinking).  The filtered Krystal version has no yeast and is brilliantly clear.', N'Low to moderately strong banana and clove flavor.  The balance and intensity of the phenol and ester components can vary but the best examples are reasonably balanced and fairly prominent.  Optionally, a very light to moderate vanilla character and/or low bubblegum notes can accentuate the banana flavor, sweetness and roundness; neither should be dominant if present.  The soft, somewhat bready or grainy flavor of wheat is complementary, as is a slightly sweet Pils malt character.  Hop flavor is very low to none, and hop bitterness is very low to moderately low.  A tart, citrusy character from yeast and high carbonation is often present.  Well rounded, flavorful palate with a relatively dry finish.  No diacetyl or DMS.', N'Medium-light to medium body; never heavy.  Suspended yeast may increase the perception of body.  The texture of wheat imparts the sensation of a fluffy, creamy fullness that may progress to a light, spritzy finish aided by high carbonation.  Always effervescent.', N'A pale, spicy, fruity, refreshing wheat-based ale.', N'These are refreshing, fast-maturing beers that are lightly hopped and show a unique banana-and-clove yeast character. These beers often don''t age well and are best enjoyed while young and fresh.  The version "mit hefe" is served with yeast sediment stirred in; the krystal version is filtered for excellent clarity.  Bottles with yeast are traditionally swirled or gently rolled prior to serving.  The character of a krystal weizen is generally fruitier and less phenolic than that of the hefe-weizen.', N'By German law, at least 50% of the grist must be malted wheat, although some versions use up to 70%; the remainder is Pilsner malt.  A traditional decoction mash gives the appropriate body without cloying sweetness.  Weizen ale yeasts produce the typical spicy and fruity character, although extreme fermentation temperatures can affect the balance and produce off-flavors.  A small amount of noble hops are used only for bitterness.', 1.044, 1.052, 1.01, 1.014, 8, 15, 2, 8, 4.3, 5.6, N'Weihenstephaner Hefeweissbier, Schneider Weisse Weizenhell, Paulaner Hefe-Weizen, Hacker-Pschorr Weisse, Plank Bavarian Hefeweizen, Ayinger Bräu Weisse, Ettaler Weissbier Hell, Franziskaner Hefe-Weisse, Andechser Weissbier Hefetrüb, Kapuziner Weissbier, Erdinger Weissbier, Penn Weizen, Barrelhouse Hocking Hills HefeWeizen, Eisenbahn Weizenbier')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 15, N'German Wheat and Rye Beer', N'15B', N'Dunkelweizen', N'Moderate to strong phenols (usually clove) and fruity esters (usually banana).  The balance and intensity of the phenol and ester components can vary but the best examples are reasonably balanced and fairly prominent.  Optionally, a low to moderate vanilla character and/or low bubblegum notes may be present, but should not dominate.  Noble hop character ranges from low to none.  A light to moderate wheat aroma (which might be perceived as bready or grainy) may be present and is often accompanied by a caramel, bread crust, or richer malt aroma (e.g., from Vienna and/or Munich malt).  Any malt character is supportive and does not overpower the yeast character.  No diacetyl or DMS.  A light tartness is optional but acceptable.', N'Light copper to mahogany brown in color.  A very thick, moussy, long-lasting off-white head is characteristic.  The high protein content of wheat impairs clarity in this traditionally unfiltered style, although the level of haze is somewhat variable.  The suspended yeast sediment (which should be roused before drinking) also contributes to the cloudiness.', N'Low to moderately strong banana and clove flavor.  The balance and intensity of the phenol and ester components can vary but the best examples are reasonably balanced and fairly prominent.    Optionally, a very light to moderate vanilla character and/or low bubblegum notes can accentuate the banana flavor, sweetness and roundness; neither should be dominant if present. The soft, somewhat bready or grainy flavor of wheat is complementary, as is a richer caramel and/or melanoidin character from Munich and/or Vienna malt.  The malty richness can be low to medium-high, but shouldn''t overpower the yeast character.  A roasted malt character is inappropriate.  Hop flavor is very low to none, and hop bitterness is very low to low.  A tart, citrusy character from yeast and high carbonation is sometimes present, but typically muted.  Well rounded, flavorful, often somewhat sweet palate with a relatively dry finish.  No diacetyl or DMS.', N'Medium-light to medium-full body.  The texture of wheat as well as yeast in suspension imparts the sensation of a fluffy, creamy fullness that may progress to a lighter finish, aided by moderate to high carbonation.  The presence of Munich and/or Vienna malts also provide an additional sense of richness and fullness.  Effervescent.', N'A moderately dark, spicy, fruity, malty, refreshing wheat-based ale.  Reflecting the best yeast and wheat character of a hefeweizen blended with the malty richness of a Munich dunkel.', N'The presence of Munich and/or Vienna-type barley malts gives this style a deep, rich barley malt character not found in a hefeweizen.  Bottles with yeast are traditionally swirled or gently rolled prior to serving. ', N'By German law, at least 50% of the grist must be malted wheat, although some versions use up to 70%; the remainder is usually Munich and/or Vienna malt.  A traditional decoction mash gives the appropriate body without cloying sweetness.  Weizen ale yeasts produce the typical spicy and fruity character, although extreme fermentation temperatures can affect the balance and produce off-flavors.  A small amount of noble hops are used only for bitterness.', 1.044, 1.056, 1.01, 1.014, 10, 18, 14, 23, 4.3, 5.6, N'Weihenstephaner Hefeweissbier Dunkel, Ayinger Ur-Weisse, Franziskaner Dunkel Hefe-Weisse, Schneider Weisse (Original), Ettaler Weissbier Dunkel, Hacker-Pschorr Weisse Dark, Tucher Dunkles Hefe Weizen, Edelweiss Dunkel Weissbier, Erdinger Weissbier Dunkel, Kapuziner Weissbier Schwarz')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 15, N'German Wheat and Rye Beer', N'15C', N'Weizenbock', N'Rich, bock-like melanoidins and bready malt combined with a powerful aroma of dark fruit (plums, prunes, raisins or grapes).  Moderate to strong phenols (most commonly vanilla and/or clove) add complexity, and some banana esters may also be present.  A moderate aroma of alcohol is common, although never solventy.  No hop aroma, diacetyl or DMS.', N'Dark amber to dark, ruby brown in color.  A very thick, moussy, long-lasting light tan head is characteristic.  The high protein content of wheat impairs clarity in this traditionally unfiltered style, although the level of haze is somewhat variable.  The suspended yeast sediment (which should be roused before drinking) also contributes to the cloudiness.', N'A complex marriage of rich, bock-like melanoidins, dark fruit, spicy clove-like phenols, light banana and/or vanilla, and a moderate wheat flavor.  The malty, bready flavor of wheat is further enhanced by the copious use of Munich and/or Vienna malts.  May have a slightly sweet palate, and a light chocolate character is sometimes found (although a roasted character is inappropriate).  A faintly tart character may optionally be present.  Hop flavor is absent, and hop bitterness is low.  The wheat, malt, and yeast character dominate the palate, and the alcohol helps balance the finish. Well-aged examples may show some sherry-like oxidation as a point of complexity.  No diacetyl or DMS.', N'Medium-full to full body.  A creamy sensation is typical, as is the warming sensation of substantial alcohol content.  The presence of Munich and/or Vienna malts also provide an additional sense of richness and fullness.  Moderate to high carbonation.  Never hot or solventy.', N'A strong, malty, fruity, wheat-based ale combining the best flavors of a dunkelweizen and the rich strength and body of a bock.', N'A dunkel-weizen beer brewed to bock or doppelbock strength.  Now also made in the Eisbock style as a specialty beer.  Bottles may be gently rolled or swirled prior to serving to rouse the yeast.', N'A high percentage of malted wheat is used (by German law must be at least 50%, although it may contain up to 70%), with the remainder being Munich- and/or Vienna-type barley malts.  A traditional decoction mash gives the appropriate body without cloying sweetness.  Weizen ale yeasts produce the typical spicy and fruity character.  Too warm or too cold fermentation will cause the phenols and esters to be out of balance and may create off-flavors.  A small amount of noble hops are used only for bitterness.', 1.064, 1.09, 1.015, 1.022, 15, 30, 12, 25, 6.5, 8, N'Schneider Aventinus, Schneider Aventinus Eisbock, Plank Bavarian Dunkler Weizenbock, Plank Bavarian Heller Weizenbock, AleSmith Weizenbock, Erdinger Pikantus, Mahr''s Der Weisse Bock, Victory Moonglow Weizenbock, High Point Ramstein Winter Wheat, Capital Weizen Doppelbock, Eisenbahn Vigorosa')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 15, N'German Wheat and Rye Beer', N'15D', N'Roggenbier (German Rye Beer)', N'Light to moderate spicy rye aroma intermingled with light to moderate weizen yeast aromatics (spicy clove and fruity esters, either banana or citrus).  Light noble hops are acceptable.  Can have a somewhat acidic aroma from rye and yeast.  No diacetyl.', N'Light coppery-orange to very dark reddish or coppery-brown color.  Large creamy off-white to tan head, quite dense and persistent (often thick and rocky).  Cloudy, hazy appearance.', N'Grainy, moderately-low to moderately-strong spicy rye flavor, often having a hearty flavor reminiscent of rye or pumpernickel bread.  Medium to medium-low bitterness allows an initial malt sweetness (sometimes with a bit of caramel) to be tasted before yeast and rye character takes over.  Low to moderate weizen yeast character (banana, clove, and sometimes citrus), although the balance can vary.  Medium-dry, grainy finish with a tangy, lightly bitter (from rye) aftertaste.  Low to moderate noble hop flavor acceptable, and can persist into aftertaste.  No diacetyl.', N'Medium to medium-full body.  High carbonation.  Light tartness optional.', N'A dunkelweizen made with rye rather than wheat, but with a greater body and light finishing hops.', N'American-style rye beers should be entered in the American Rye category (6D).  Other traditional beer styles with enough rye added to give a noticeable rye character should be entered in the Specialty Beer category (23).  Rye is a huskless grain and is difficult to mash, often resulting in a gummy mash texture that is prone to sticking.  Rye has been characterized as having the most assertive flavor of all cereal grains.  It is inappropriate to add caraway seeds to a roggenbier (as some American brewers do); the rye character is traditionally from the rye grain only.', N'Malted rye typically constitutes 50% or greater of the grist (some versions have 60-65% rye).  Remainder of grist can include pale malt, Munich malt, wheat malt, crystal malt and/or small amounts of debittered dark malts for color adjustment.  Weizen yeast provides distinctive banana esters and clove phenols.  Light usage of noble hops in bitterness, flavor and aroma.  Lower fermentation temperatures accentuate the clove character by suppressing ester formation.  Decoction mash commonly used (as with weizenbiers).', 1.046, 1.056, 1.01, 1.014, 10, 20, 14, 19, 4.5, 6, N'Paulaner Roggen (formerly Thurn und Taxis, no longer imported into the US), Bürgerbräu Wolznacher Roggenbier')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 16, N'Belgian and French Ale', N'16A', N'Witbier', N'Moderate sweetness (often with light notes of honey and/or vanilla) with light, grainy, spicy wheat aromatics, often with a bit of tartness.  Moderate perfumy coriander, often with a complex herbal, spicy, or peppery note in the background.  Moderate zesty, citrusy orangey fruitiness.   A low spicy-herbal hop aroma is optional, but should never overpower the other characteristics.  No diacetyl.  Vegetal, celery-like, or ham-like aromas are inappropriate.  Spices should blend in with fruity, floral and sweet aromas and should not be overly strong.', N'Very pale straw to very light gold in color.  The beer will be very cloudy from starch haze and/or yeast, which gives it a milky, whitish-yellow appearance.  Dense, white, moussy head.  Head retention should be quite good.', N'Pleasant sweetness (often with a honey and/or vanilla character) and a zesty, orange-citrusy fruitiness.  Refreshingly crisp with a dry, often tart, finish.  Can have a low wheat flavor.  Optionally has a very light lactic-tasting sourness.  Herbal-spicy flavors, which may include coriander and other spices, are common should be subtle and balanced, not overpowering.  A spicy-earthy hop flavor is low to none, and if noticeable, never gets in the way of the spices.  Hop bitterness is low to medium-low (as with a Hefeweizen), and doesn''t interfere with refreshing flavors of fruit and spice, nor does it persist into the finish.  Bitterness from orange pith should not be present.  Vegetal, celery-like, ham-like, or soapy flavors are inappropriate.  No diacetyl.  ', N'Medium-light to medium body, often having a smoothness and light creaminess from unmalted wheat and the occasional oats.  Despite body and creaminess, finishes dry and often a bit tart.  Effervescent character from high carbonation.  Refreshing, from carbonation, light acidity, and lack of bitterness in finish.  No harshness or astringency from orange pith.  Should not be overly dry and thin, nor should it be thick and heavy.', N'A refreshing, elegant, tasty, moderate-strength wheat-based ale.', N'The presence, character and degree of spicing and lactic sourness varies.  Overly spiced and/or sour beers are not good examples of the style.  Coriander of certain origins might give an inappropriate ham or celery character. The beer tends to be fragile and does not age well, so younger, fresher, properly handled examples are most desirable.  Most examples seem to be approximately 5% ABV.', N'About 50% unmalted wheat (traditionally soft white winter wheat) and 50% pale barley malt (usually Pils malt) constitute the grist.  In some versions, up to 5-10% raw oats may be used.  Spices of freshly-ground coriander and Curaçao or sometimes sweet orange peel complement the sweet aroma and are quite characteristic.  Other spices (e.g., chamomile, cumin, cinnamon, Grains of Paradise) may be used for complexity but are much less prominent.  Ale yeast prone to the production of mild, spicy flavors is very characteristic.  In some instances a very limited lactic fermentation, or the actual addition of lactic acid, is done.', 1.044, 1.052, 1.008, 1.012, 10, 20, 2, 4, 4.5, 5.5, N'Hoegaarden Wit, St. Bernardus Blanche, Celis White, Vuuve 5, Brugs Tarwebier (Blanche de Bruges), Wittekerke, Allagash White, Blanche de Bruxelles, Ommegang Witte, Avery White Rascal, Unibroue Blanche de Chambly, Sterkens White Ale, Bells Winter White Ale, Victory Whirlwind Witbier, Hitachino Nest White Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 16, N'Belgian and French Ale', N'16B', N'Belgian Pale Ale', N'Prominent aroma of malt with moderate fruity character and low hop aroma.  Toasty, biscuity malt aroma.  May have an orange- or pear-like fruitiness though not as fruity/citrusy as many other Belgian ales.  Distinctive floral or spicy, low to moderate strength hop character optionally blended with background level peppery, spicy phenols.  No diacetyl.', N'Amber to copper in color.  Clarity is very good.  Creamy, rocky, white head often fades more quickly than other Belgian beers.', N'Fruity and lightly to moderately spicy with a soft, smooth malt and relatively light hop character and low to very low phenols.  May have an orange- or pear-like fruitiness, though not as fruity/citrusy as many other Belgian ales.  Has an initial soft, malty sweetness with a toasty, biscuity, nutty malt flavor.  The hop flavor is low to none.  The hop bitterness is medium to low, and is optionally complemented by low amounts of peppery phenols.  There is a moderately dry to moderately sweet finish, with hops becoming more pronounced in those with a drier finish.', N'Medium to medium-light body.  Alcohol level is restrained, and any warming character should be low if present.  No hot alcohol or solventy character.  Medium carbonation.', N'A fruity, moderately malty, somewhat spicy, easy-drinking, copper-colored ale.', N'Most commonly found in the Flemish provinces of Antwerp and Brabant.  Considered "everyday" beers (Category I).  Compared to their higher alcohol Category S cousins, they are Belgian "session beers" for ease of drinking.  Nothing should be too pronounced or dominant; balance is the key.', N'Pilsner or pale ale malt contributes the bulk of the grist with (cara) Vienna and Munich malts adding color, body and complexity.  Sugar is not commonly used as high gravity is not desired.  Noble hops, Styrian Goldings, East Kent Goldings or Fuggles are commonly used.  Yeasts prone to moderate production of phenols are often used but fermentation temperatures should be kept moderate to limit this character.', 1.048, 1.054, 1.01, 1.014, 20, 30, 8, 14, 4.8, 5.5, N'De Koninck, Speciale Palm, Dobble Palm, Russian River Perdition, Ginder Ale, Op-Ale, St. Pieters Zinnebir, Brewer''s Art House Pale Ale, Avery Karma, Eisenbahn Pale Ale, Ommegang Rare Vos (unusual in its 6.5% ABV strength)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 16, N'Belgian and French Ale', N'16C', N'Saison', N'High fruitiness with low to moderate hop aroma and moderate to no herb, spice and alcohol aroma.  Fruity esters dominate the aroma and are often reminiscent of citrus fruits such as oranges or lemons.  A low to medium-high spicy or floral hop aroma is usually present.  A moderate spice aroma (from actual spice additions and/or yeast-derived phenols) complements the other aromatics.  When phenolics are present they tend to be peppery rather than clove-like.  A low to moderate sourness or acidity may be present, but should not overwhelm other characteristics.  Spice, hop and sour aromatics typically increase with the strength of the beer.  Alcohols are soft, spicy and low in intensity, and should not be hot or solventy.  The malt character is light.  No diacetyl.', N'Often a distinctive pale orange but may be golden or amber in color.  There is no correlation between strength and color.  Long-lasting, dense, rocky white to ivory head resulting in characteristic "Belgian lace" on the glass as it fades.  Clarity is poor to good though haze is not unexpected in this type of unfiltered farmhouse beer.  Effervescent.', N'Combination of fruity and spicy flavors supported by a soft malt character, a low to moderate alcohol presence and tart sourness.  Extremely high attenuation gives a characteristic dry finish.  The fruitiness is frequently citrusy (orange- or lemon-like).  The addition of one of more spices serve to add complexity, but shouldn''t dominate in the balance.  Low peppery yeast-derived phenols may be present instead of or in addition to spice additions; phenols tend to be lower than in many other Belgian beers, and complement the bitterness.  Hop flavor is low to moderate, and is generally spicy or earthy in character.  Hop bitterness may be moderate to high, but should not overwhelm fruity esters, spices, and malt.  Malt character is light but provides a sufficient background for the other flavors.  A low to moderate tart sourness may be present, but should not overwhelm other flavors.  Spices, hop bitterness and flavor, and sourness commonly increase with the strength of the beer while sweetness decreases.  No hot alcohol or solventy character.  High carbonation, moderately sulfate water, and high attenuation give a very dry finish with a long, bitter, sometimes spicy aftertaste.  The perceived bitterness is often higher than the IBU level would suggest.  No diacetyl.', N'Light to medium body.  Alcohol level can be medium to medium-high, though the warming character is low to medium.  No hot alcohol or solventy character.  Very high carbonation with an effervescent quality.  There is enough prickly acidity on the tongue to balance the very dry finish.  A low to moderate tart character may be present but should be refreshing and not to the point of puckering.', N'A refreshing, medium to strong fruity/spicy ale with a distinctive yellow-orange color, highly carbonated, well hopped, and dry with a quenching acidity.', N'Varying strength examples exist (table beers of about 5% strength, typical export beers of about 6.5%, and stronger versions of 8%+).  Strong versions (6.5%-9.5%) and darker versions (copper to dark brown/black) should be entered as Belgian Specialty Ales (16E).  Sweetness decreases and spice, hop and sour character increases with strength.  Herb and spice additions often reflect the indigenous varieties available at the brewery.  High carbonation and extreme attenuation (85-95%) helps bring out the many flavors and to increase the perception of a dry finish.  All of these beers share somewhat higher levels of acidity than other Belgian styles while the optional sour flavor is often a variable house character of a particular brewery.', N'Pilsner malt dominates the grist though a portion of Vienna and/or Munich malt contributes color and complexity.  Sometimes contains other grains such as wheat and spelt.  Adjuncts such as sugar and honey can also serve to add complexity and thin the body.  Hop bitterness and flavor may be more noticeable than in many other Belgian styles.  A saison is sometimes dry-hopped.  Noble hops, Styrian or East Kent Goldings are commonly used.  A wide variety of herbs and spices are often used to add complexity and uniqueness in the stronger versions, but should always meld well with the yeast and hop character.  Varying degrees of acidity and/or sourness can be created by the use of gypsum, acidulated malt, a sour mash or Lactobacillus.  Hard water, common to most of Wallonia, can accentuate the bitterness and dry finish.', 1.048, 1.065, 1.002, 1.012, 20, 35, 5, 14, 5, 7, N'Saison Dupont Vieille Provision; Fantôme Saison D''Erezée - Printemps; Saison de Pipaix; Saison Regal; Saison Voisin; Lefebvre Saison 1900; Ellezelloise Saison 2000; Saison Silly; Southampton Saison; New Belgium Saison; Pizza Port SPF 45; Lost Abbey Red Barn Ale; Ommegang Hennepin')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 16, N'Belgian and French Ale', N'16D', N'Bi�re de Garde', N'Prominent malty sweetness, often with a complex, light to moderate toasty character.  Some caramelization is acceptable.  Low to moderate esters.  Little to no hop aroma (may be a bit spicy or herbal).  Commercial versions will often have a musty, woodsy, cellar-like character that is difficult to achieve in homebrew.   Paler versions will still be malty but will lack richer, deeper aromatics and may have a bit more hops.  No diacetyl.', N'Three main variations exist (blond, amber and brown), so color can range from golden blonde to reddish-bronze to chestnut brown.  Clarity is good to poor, although haze is not unexpected in this type of often unfiltered beer.  Well-formed head, generally white to off-white (varies by beer color), supported by high carbonation.', N'Medium to high malt flavor often with a toasty, toffee-like or caramel sweetness.  Malt flavors and complexity tend to increase as beer color darkens.  Low to moderate esters and alcohol flavors.  Medium-low hop bitterness provides some support, but the balance is always tilted toward the malt.  The malt flavor lasts into the finish but the finish is medium-dry to dry, never cloying.  Alcohol can provide some additional dryness in the finish.  Low to no hop flavor, although paler versions can have slightly higher levels of herbal or spicy hop flavor (which can also come from the yeast).  Smooth, well-lagered character.  No diacetyl.', N'Medium to medium-light (lean) body, often with a smooth, silky character.  Moderate to high carbonation.  Moderate alcohol, but should be very smooth and never hot.', N'A fairly strong, malt-accentuated, lagered artisanal farmhouse beer.', N'Three main variations are included in the style: the brown (brune), the blond (blonde), and the amber (ambrée).  The darker versions will have more malt character, while the paler versions can have more hops (but still are malt-focused beers).  A related style is Bière de Mars, which is brewed in March (Mars) for present use and will not age as well.  Attenuation rates are in the 80-85% range.  Some fuller-bodied examples exist, but these are somewhat rare.', N'The "cellar" character in commercial examples is unlikely to be duplicated in homebrews as it comes from indigenous yeasts and molds.  Commercial versions often have a "corked", dry, astringent character that is often incorrectly identified as "cellar-like."  Homebrews therefore are usually cleaner.  Base malts vary by beer color, but usually include pale, Vienna and Munich types.  Kettle caramelization tends to be used more than crystal malts, when present.  Darker versions will have richer malt complexity and sweetness from crystal-type malts.  Sugar may be used to add flavor and aid in the dry finish.  Lager or ale yeast fermented at cool ale temperatures, followed by long cold conditioning (4-6 weeks for commercial operations).  Soft water.  Floral, herbal or spicy continental hops.', 1.06, 1.08, 1.008, 1.016, 18, 28, 6, 19, 6, 8.5, N'Jenlain (amber), Jenlain Bière de Printemps (blond), St. Amand (brown), Ch''Ti Brun (brown), Ch''Ti Blond (blond), La Choulette (all 3 versions), La Choulette Bière des Sans Culottes (blond), Saint Sylvestre 3 Monts (blond), Biere Nouvelle (brown), Castelain (blond), Jade (amber), Brasseurs Bière de Garde (amber), Southampton Bière de Garde (amber), Lost Abbey Avante Garde (blond)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17A', N'Berliner Weisse', N'A sharply sour, somewhat acidic character is dominant.  Can have up to a moderately fruity character.  The fruitiness may increase with age and a flowery character may develop.  A mild Brettanomyces aroma may be present.  No hop aroma, diacetyl, or DMS.', N'Very pale straw in color.  Clarity ranges from clear to somewhat hazy.  Large, dense, white head with poor retention due to high acidity and low protein and hop content.  Always effervescent.', N'Clean lactic sourness dominates and can be quite strong, although not so acidic as a lambic.  Some complementary bready or grainy wheat flavor is generally noticeable. Hop bitterness is very low.  A mild Brettanomyces character may be detected, as may a restrained fruitiness (both are optional).  No hop flavor.  No diacetyl or DMS.', N'Light body.  Very dry finish.  Very high carbonation.  No sensation of alcohol.', N'A very pale, sour, refreshing, low-alcohol wheat ale.', N'In Germany, it is classified as a Schankbier denoting a small beer of starting gravity in the range 7-8°P.  Often served with the addition of a shot of sugar syrups (''mit schuss'') flavored with raspberry (''himbeer'') or woodruff (''waldmeister'') or even mixed with Pils to counter the substantial sourness.  Has been described by some as the most purely refreshing beer in the world.', N'Wheat malt content is typically 50% of the grist (as with all German wheat beers) with the remainder being Pilsner malt.  A symbiotic fermentation with top-fermenting yeast and Lactobacillus delbruckii provides the sharp sourness, which may be enhanced by blending of beers of different ages during fermentation and by extended cool aging.  Hop bitterness is extremely low.  A single decoction mash with mash hopping is traditional.', 1.028, 1.032, 1.003, 1.006, 3, 8, 2, 3, 2.8, 3.8, N'Schultheiss Berliner Weisse, Berliner Kindl Weisse, Nodding Head Berliner Weisse, Weihenstephan 1809 (unusual in its 5% ABV), Bahnhof Berliner Style Weisse, Southampton Berliner Weisse, Bethlehem Berliner Weisse, Three Floyds Deesko')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17B', N'Flanders Red Ale', N'Complex fruitiness with complementary malt.  Fruitiness is high, and reminiscent of black cherries, oranges, plums or red currants.  There is often some vanilla and/or chocolate notes.  Spicy phenols can be present in low amounts for complexity.  The sour, acidic aroma ranges from complementary to intense.  No hop aroma.  Diacetyl is perceived only in very minor quantities, if at all, as a complementary aroma.', N'Deep red, burgundy to reddish-brown in color.  Good clarity.  White to very pale tan head.  Average to good head retention.', N'Intense fruitiness commonly includes plum, orange, black cherry or red currant flavors.  A mild vanilla and/or chocolate character is often present.  Spicy phenols can be present in low amounts for complexity.  Sour, acidic character ranges from complementary to intense.  Malty flavors range from complementary to prominent.  Generally as the sour character increases, the sweet character blends to more of a background flavor (and vice versa).  No hop flavor.  Restrained hop bitterness.  An acidic, tannic bitterness is often present in low to moderate amounts, and adds an aged red wine-like character with a long, dry finish.  Diacetyl is perceived only in very minor quantities, if at all, as a complementary flavor.', N'Medium bodied.  Low to medium carbonation.  Low to medium astringency, like a well-aged red wine, often with a prickly acidity.  Deceivingly light and crisp on the palate although a somewhat sweet finish is not uncommon.', N'A complex, sour, red wine-like Belgian-style ale.', N'Long aging and blending of young and well-aged beer often occurs, adding to the smoothness and complexity, though the aged product is sometimes released as a connoisseur''s beer.  Known as the Burgundy of Belgium, it is more wine-like than any other beer style.  The reddish color is a product of the malt although an extended, less-than-rolling portion of the boil may help add an attractive Burgundy hue.  Aging will also darken the beer.  The Flanders red is more acetic and the fruity flavors more reminiscent of a red wine than an Oud Bruin.  Can have an apparent attenuation of up to 98%.', N'A base of Vienna and/or Munich malts, light to medium cara-malts, and a small amount of Special B are used with up to 20% maize.  Low alpha acid continental hops are commonly used (avoid high alpha or distinctive American hops).  Saccharomyces, Lactobacillus and Brettanomyces (and acetobacter) contribute to the fermentation and eventual flavor.', 1.048, 1.057, 1.002, 1.012, 10, 25, 10, 16, 4.6, 6.5, N'Rodenbach Klassiek, Rodenbach Grand Cru, Bellegems Bruin, Duchesse de Bourgogne, New Belgium La Folie, Petrus Oud Bruin, Southampton Flanders Red Ale, Verhaege Vichtenaar, Monk''s Cafe Flanders Red Ale, New Glarus Enigma, Panil Barriquée, Mestreechs Aajt')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17C', N'Flanders Brown Ale/Oud Bruin', N'Complex combination of fruity esters and rich malt character.  Esters commonly reminiscent of raisins, plums, figs, dates, black cherries or prunes.  A malt character of caramel, toffee, orange, treacle or chocolate is also common.  Spicy phenols can be present in low amounts for complexity.  A sherry-like character may be present and generally denotes an aged example.  A low sour aroma may be present, and can modestly increase with age but should not grow to a noticeable acetic/vinegary character.  Hop aroma absent.  Diacetyl is perceived only in very minor quantities, if at all, as a complementary aroma.', N'Dark reddish-brown to brown in color.  Good clarity.  Average to good head retention.  Ivory to light tan head color.', N'Malty with fruity complexity and some caramelization character.  Fruitiness commonly includes dark fruits such as raisins, plums, figs, dates, black cherries or prunes.  A malt character of caramel, toffee, orange, treacle or chocolate is also common.  Spicy phenols can be present in low amounts for complexity.  A slight sourness often becomes more pronounced in well-aged examples, along with some sherry-like character, producing a "sweet-and-sour" profile.  The sourness should not grow to a notable acetic/vinegary character.  Hop flavor absent.  Restrained hop bitterness.  Low oxidation is appropriate as a point of complexity.  Diacetyl is perceived only in very minor quantities, if at all, as a complementary flavor.', N'Medium to medium-full body.  Low to moderate carbonation.  No astringency with a sweet and tart finish.', N'A malty, fruity, aged, somewhat sour Belgian-style brown ale.', N'Long aging and blending of young and aged beer may occur, adding smoothness and complexity and balancing any harsh, sour character.  A deeper malt character distinguishes these beers from Flanders red ales.  This style was designed to lay down so examples with a moderate aged character are considered superior to younger examples.  As in fruit lambics, Oud Bruin can be used as a base for fruit-flavored beers such as kriek (cherries) or frambozen (raspberries), though these should be entered in the classic-style fruit beer category.  The Oud Bruin is less acetic and maltier than a Flanders Red, and the fruity flavors are more malt-oriented.', N'A base of Pils malt with judicious amounts of dark cara malts and a tiny bit of black or roast malt.  Often includes maize.  Low alpha acid continental hops are typical (avoid high alpha or distinctive American hops).  Saccharomyces and Lactobacillus (and acetobacter) contribute to the fermentation and eventual flavor.  Lactobacillus reacts poorly to elevated levels of alcohol.  A sour mash or acidulated malt may also be used to develop the sour character without introducing Lactobacillus.  Water high in carbonates is typical of its home region and will buffer the acidity of darker malts and the lactic sourness.  Magnesium in the water accentuates the sourness.', 1.04, 1.074, 1.008, 1.012, 20, 25, 15, 22, 4, 8, N'Liefman''s Goudenband, Liefman''s Odnar, Liefman''s Oud Bruin, Ichtegem Old Brown, Riva Vondel')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17D', N'Straight (Unblended) Lambic', N'A decidedly sour/acidic aroma is often dominant in young examples, but may be more subdued with age as it blends with aromas described as barnyard, earthy, goaty, hay, horsey, and horse blanket.  A mild oak and/or citrus aroma is considered favorable.  An enteric, smoky, cigar-like, or cheesy aroma is unfavorable.  Older versions are commonly fruity with aromas of apples or even honey.  No hop aroma.  No diacetyl.', N'Pale yellow to deep golden in color.  Age tends to darken the beer.  Clarity is hazy to good.  Younger versions are often cloudy, while older ones are generally clear.  Head retention is generally poor.  Head color is white.', N'Young examples are often noticeably sour and/or lactic, but aging can bring this character more in balance with the malt, wheat and barnyard characteristics.  Fruity flavors are simpler in young lambics and more complex in the older examples, where they are reminiscent of apples or other light fruits, rhubarb, or honey.  Some oak or citrus flavor (often grapefruit) is occasionally noticeable.  An enteric, smoky or cigar-like character is undesirable.  Hop bitterness is low to none.  No hop flavor.  No diacetyl.', N'Light to medium-light body.  In spite of the low finishing gravity, the many mouth-filling flavors prevent the beer from tasting like water.  As a rule of thumb lambic dries with age, which makes dryness a reasonable indicator of age.  Has a medium to high tart, puckering quality without being sharply astringent.  Virtually to completely uncarbonated.', N'Complex, sour/acidic, pale, wheat-based ale fermented by a variety of Belgian microbiota.', N'Straight lambics are single-batch, unblended beers.  Since they are unblended, the straight lambic is often a true product of the "house character" of a brewery and will be more variable than a gueuze.  They are generally served young (6 months) and on tap as cheap, easy-drinking beers without any filling carbonation.  Younger versions tend to be one-dimensionally sour since a complex Brett character often takes upwards of a year to develop.  An enteric character is often indicative of a lambic that is too young.  A noticeable vinegary or cidery character is considered a fault by Belgian brewers.  Since the wild yeast and bacteria will ferment ALL sugars, they are bottled only when they have completely fermented.  Lambic is served uncarbonated, while gueuze is served effervescent.  IBUs are approximate since aged hops are used; Belgians use hops for anti-bacterial properties more than bittering in lambics.', N'Unmalted wheat (30-40%), Pilsner malt and aged (surannes) hops (3 years) are used.  The aged hops are used more for preservative effects than bitterness, and makes actual bitterness levels difficult to estimate.  Traditionally these beers are spontaneously fermented with naturally-occurring yeast and bacteria in predominately oaken barrels.  Home-brewed and craft-brewed versions are more typically made with pure cultures of yeast commonly including Saccharomyces, Brettanomyces, Pediococcus and Lactobacillus in an attempt to recreate the effects of the dominant microbiota of Brussels and the surrounding countryside of the Senne River valley.  Cultures taken from bottles are sometimes used but there is no simple way of knowing what organisms are still viable.', 1.04, 1.054, 1.001, 1.01, NULL, NULL, 3, 7, 5, 6.5, N'The only bottled version readily available is Cantillon Grand Cru Bruocsella of whatever single batch vintage the brewer deems worthy to bottle.  De Cam sometimes bottles their very old (5 years) lambic.  In and around Brussels there are specialty cafes that often have draught lambics from traditional brewers or blenders such as Boon, De Cam, Cantillon, Drie Fonteinen, Lindemans, Timmermans and Girardin.')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17E', N'Gueuze', N'A moderately sour/acidic aroma blends with aromas described as barnyard, earthy, goaty, hay, horsey, and horse blanket.  While some may be more dominantly sour/acidic, balance is the key and denotes a better gueuze.  Commonly fruity with aromas of citrus fruits (often grapefruit), apples or other light fruits, rhubarb, or honey.  A very mild oak aroma is considered favorable.  An enteric, smoky, cigar-like, or cheesy aroma is unfavorable.  No hop aroma.  No diacetyl.', N'Golden in color.  Clarity is excellent (unless the bottle was shaken).  A thick rocky, mousse-like, white head seems to last forever.  Always effervescent.', N'A moderately sour/acidic character is classically in balance with the malt, wheat and barnyard characteristics.  A low, complementary sweetness may be present but higher levels are uncharacteristic.  While some may be more dominantly sour, balance is the key and denotes a better gueuze.  A varied fruit flavor is common, and can have a honey-like character.  A mild vanilla and/or oak flavor is occasionally noticeable.  An enteric, smoky or cigar-like character is undesirable.  Hop bitterness is generally absent but a very low hop bitterness may occasionally be perceived.  No hop flavor.  No diacetyl.', N'Light to medium-light body.  In spite of the low finishing gravity, the many mouth-filling flavors prevent the beer from tasting like water.  Has a low to high tart, puckering quality without being sharply astringent.  Some versions have a low warming character.  Highly carbonated.', N'Complex, pleasantly sour/acidic, balanced, pale, wheat-based ale fermented by a variety of Belgian microbiota.', N'Gueuze is traditionally produced by mixing one, two, and three-year old lambic.  "Young" lambic contains fermentable sugars while old lambic has the characteristic "wild" taste of the Senne River valley.  A good gueuze is not the most pungent, but possesses a full and tantalizing bouquet, a sharp aroma, and a soft, velvety flavor.  Lambic is served uncarbonated, while gueuze is served effervescent.  IBUs are approximate since aged hops are used; Belgians use hops for anti-bacterial properties more than bittering in lambics.  Products marked "oude" or "ville" are considered most traditional.', N'Unmalted wheat (30-40%), Pilsner malt and aged (surannes) hops (3 years) are used.  The aged hops are used more for preservative effects than bitterness, and makes actual bitterness levels difficult to estimate.  Traditionally these beers are spontaneously fermented with naturally-occurring yeast and bacteria in predominately oaken barrels.  Home-brewed and craft-brewed versions are more typically made with pure cultures of yeast commonly including Saccharomyces, Brettanomyces, Pediococcus and Lactobacillus in an attempt to recreate the effects of the dominant microbiota of Brussels and the surrounding countryside of the Senne River valley.  Cultures taken from bottles are sometimes used but there is no simple way of knowing what organisms are still viable.', 1.04, 1.06, 1, 1.006, NULL, NULL, 3, 7, 5, 8, N'Boon Oude Gueuze, Boon Oude Gueuze Mariage Parfait, De Cam Gueuze, De Cam/Drei Fonteinen Millennium Gueuze, Drie Fonteinen Oud Gueuze, Cantillon Gueuze, Hanssens Oude Gueuze, Lindemans Gueuze Cuvée René, Girardin Gueuze (Black Label), Mort Subite (Unfiltered) Gueuze, Oud Beersel Oude Gueuze')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 17, N'Sour Ale', N'17F', N'Fruit Lambic', N'The fruit which has been added to the beer should be the dominant aroma.  A low to moderately sour/acidic character blends with aromas described as barnyard, earthy, goaty, hay, horsey, and horse blanket (and thus should be recognizable as a lambic).  The fruit aroma commonly blends with the other aromas.  An enteric, smoky, cigar-like, or cheesy aroma is unfavorable.  No hop aroma.  No diacetyl.', N'The variety of fruit generally determines the color though lighter-colored fruit may have little effect on the color.  The color intensity may fade with age.  Clarity is often good, although some fruit will not drop bright.  A thick rocky, mousse-like head, sometimes a shade of fruit, is generally long-lasting.  Always effervescent.', N'The fruit added to the beer should be evident.  A low to moderate sour and more commonly (sometimes high) acidic character is present.  The classic barnyard characteristics may be low to high.  When young, the beer will present its full fruity taste.  As it ages, the lambic taste will become dominant at the expense of the fruit character–thus fruit lambics are not intended for long aging.  A low, complementary sweetness may be present, but higher levels are uncharacteristic.  A mild vanilla and/or oak flavor is occasionally noticeable.  An enteric, smoky or cigar-like character is undesirable.  Hop bitterness is generally absent.  No hop flavor.  No diacetyl.', N'Light to medium-light body.  In spite of the low finishing gravity, the many mouth-filling flavors prevent the beer from tasting like water.  Has a low to high tart, puckering quality without being sharply astringent.  Some versions have a low warming character.  Highly carbonated.', N'Complex, fruity, pleasantly sour/acidic, balanced, pale, wheat-based ale fermented by a variety of Belgian microbiota.  A lambic with fruit, not just a fruit beer.', N'Fruit-based lambics are often produced like gueuze by mixing one, two, and three-year old lambic.  "Young" lambic contains fermentable sugars while old lambic has the characteristic "wild" taste of the Senne River valley.  Fruit is commonly added halfway through aging and the yeast and bacteria will ferment all sugars from the fruit.  Fruit may also be added to unblended lambic.  The most traditional styles of fruit lambics include kriek (cherries), framboise (raspberries) and druivenlambik (muscat grapes). ENTRANT MUST SPECIFY THE TYPE OF FRUIT(S) USED IN MAKING THE LAMBIC.  Any overly sweet lambics (e.g., Lindemans or Belle Vue clones) would do better entered in the 16E Belgian Specialty category since this category does not describe beers with that character.  IBUs are approximate since aged hops are used; Belgians use hops for anti-bacterial properties more than bittering in lambics.', N'Unmalted wheat (30-40%), Pilsner malt and aged (surannes) hops (3 years) are used.  The aged hops are used more for preservative effects than bitterness, and makes actual bitterness levels difficult to estimate.  Traditional products use 10-30% fruit (25%, if cherry).  Fruits traditionally used include tart cherries (with pits), raspberries or Muscat grapes.  More recent examples include peaches, apricots or merlot grapes.  Tart or acidic fruit is traditionally used as its purpose is not to sweeten the beer but to add a new dimension.  Traditionally these beers are spontaneously fermented with naturally-occurring yeast and bacteria in predominately oaken barrels.  Home-brewed and craft-brewed versions are more typically made with pure cultures of yeast commonly including Saccharomyces, Brettanomyces, Pediococcus and Lactobacillus in an attempt to recreate the effects of the dominant microbiota of Brussels and the surrounding countryside of the Senne River valley.  Cultures taken from bottles are sometimes used but there is no simple way of knowing what organisms are still viable.', 1.04, 1.06, 1, 1.01, NULL, NULL, 3, 7, 5, 7, N'Boon Framboise Marriage Parfait, Boon Kriek Mariage Parfait, Boon Oude Kriek, Cantillon Fou'' Foune (apricot), Cantillon Kriek, Cantillon Lou Pepe Kriek, Cantillon Lou Pepe Framboise, Cantillon Rose de Gambrinus, Cantillon St. Lamvinus (merlot grape), Cantillon Vigneronne (Muscat grape), De Cam Oude Kriek, Drie Fonteinen Kriek, Girardin Kriek, Hanssens Oude Kriek, Oud Beersel Kriek, Mort Subite Kriek')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 18, N'Belgian Strong Ale', N'18A', N'Belgian Blond Ale', N'Light earthy or spicy hop nose, along with a lightly sweet Pils malt character.  Shows a subtle yeast character that may include spicy phenolics, perfumy or honey-like alcohol, or yeasty, fruity esters (commonly orange-like or lemony).  Light sweetness that may have a slightly sugar-like character.  Subtle yet complex.', N'Light to deep gold color.  Generally very clear.  Large, dense, and creamy white to off-white head.  Good head retention with Belgian lace.', N'Smooth, light to moderate Pils malt sweetness initially, but finishes medium-dry to dry with some smooth alcohol becoming evident in the aftertaste.  Medium hop and alcohol bitterness to balance.  Light hop flavor, can be spicy or earthy.  Very soft yeast character (esters and alcohols, which are sometimes perfumy or orange/lemon-like).  Light spicy phenolics optional.  Some lightly caramelized sugar or honey-like sweetness on palate.', N'Medium-high to high carbonation, can give mouth-filling bubbly sensation.  Medium body.  Light to moderate alcohol warmth, but smooth.  Can be somewhat creamy.', N'A moderate-strength golden ale that has a subtle Belgian complexity, slightly sweet flavor, and dry finish.', N'Similar strength as a dubbel, similar character as a Belgian Strong Golden Ale or Tripel, although a bit sweeter and not as bitter.  Often has an almost lager-like character, which gives it a cleaner profile in comparison to the other styles. Belgians use the term "Blond," while the French spell it "Blonde."  Most commercial examples are in the 6.5 - 7% ABV range.  Many Trappist table beers (singles or Enkels) are called "Blond" but these are not representative of this style.', N'Belgian Pils malt, aromatic malts, sugar, Belgian yeast strains that produce complex alcohol, phenolics and perfumy esters, noble, Styrian Goldings or East Kent Goldings hops.  No spices are traditionally used, although the ingredients and fermentation by-products may give an impression of spicing (often reminiscent of oranges or lemons).', 1.062, 1.075, 1.008, 1.018, 15, 30, 4, 7, 6, 7.5, N'Leffe Blond, Affligem Blond, La Trappe (Koningshoeven) Blond, Grimbergen Blond, Val-Dieu Blond, Straffe Hendrik Blonde, Brugse Zot, Pater Lieven Blond Abbey Ale, Troubadour Blond Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 18, N'Belgian Strong Ale', N'18B', N'Belgian Dubbel', N'Complex, rich malty sweetness; malt may have hints of chocolate, caramel and/or toast (but never roasted or burnt aromas).  Moderate fruity esters (usually including raisins and plums, sometimes also dried cherries).  Esters sometimes include banana or apple.  Spicy phenols and higher alcohols are common (may include light clove and spice, peppery, rose-like and/or perfumy notes).  Spicy qualities can be moderate to very low.  Alcohol, if present, is soft and never hot or solventy.  A small number of examples may include a low noble hop aroma, but hops are usually absent.  No diacetyl.', N'Dark amber to copper in color, with an attractive reddish depth of color.  Generally clear.  Large, dense, and long-lasting creamy off-white head.', N'Similar qualities as aroma.  Rich, complex medium to medium-full malty sweetness on the palate yet finishes moderately dry.  Complex malt, ester, alcohol and phenol interplay (raisiny flavors are common; dried fruit flavors are welcome; clove-like spiciness is optional).  Balance is always toward the malt.  Medium-low bitterness that doesn''t persist into the finish.  Low noble hop flavor is optional and not usually present.  No diacetyl.  Should not be as malty as a bock and should not have crystal malt-type sweetness.  No spices.', N'Medium-full body.  Medium-high carbonation, which can influence the perception of body.  Low alcohol warmth.  Smooth, never hot or solventy.', N': A deep reddish, moderately strong, malty, complex Belgian ale.', N'Most commercial examples are in the 6.5 - 7% ABV range. Traditionally bottle-conditioned ("refermented in the bottle").', N'Belgian yeast strains prone to production of higher alcohols, esters, and phenolics are commonly used.  Water can be soft to hard.  Impression of complex grain bill, although traditional versions are typically Belgian Pils malt with caramelized sugar syrup or other unrefined sugars providing much of the character.  Homebrewers may use Belgian Pils or pale base malt, Munich-type malts for maltiness, Special B for raisin flavors, CaraVienne or CaraMunich for dried fruit flavors, other specialty grains for character.  Dark caramelized sugar syrup or sugars for color and rum-raisin flavors.  Noble-type, English-type or Styrian Goldings hops commonly used.  No spices are traditionally used, although restrained use is allowable.', 1.062, 1.075, 1.008, 1.018, 15, 25, 10, 17, 6.3, 7.6, N'Westmalle Dubbel, St. Bernardus Pater 6, La Trappe Dubbel, Corsendonk Abbey Brown Ale, Grimbergen Double, Affligem Dubbel, Chimay Premiere (Red), Pater Lieven Bruin, Duinen Dubbel, St. Feuillien Brune, New Belgium Abbey Belgian Style Ale, Stoudts Abbey Double Ale, Russian River Benediction, Flying Fish Dubbel, Lost Abbey Lost and Found Abbey Ale, Allagash Double')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 18, N'Belgian Strong Ale', N'18C', N'Belgian Tripel', N'Complex with moderate to significant spiciness, moderate fruity esters and low alcohol and hop aromas.  Generous spicy, peppery, sometimes clove-like phenols.  Esters are often reminiscent of citrus fruits such as oranges, but may sometimes have a slight banana character.  A low yet distinctive spicy, floral, sometimes perfumy hop character is usually found.  Alcohols are soft, spicy and low in intensity.  No hot alcohol or solventy aromas.  The malt character is light.  No diacetyl.', N'Deep yellow to deep gold in color.  Good clarity.  Effervescent.  Long-lasting, creamy, rocky, white head resulting in characteristic "Belgian lace" on the glass as it fades.', N'Marriage of spicy, fruity and alcohol flavors supported by a soft malt character.  Low to moderate phenols are peppery in character.  Esters are reminiscent of citrus fruit such as orange or sometimes lemon.  A low to moderate spicy hop character is usually found.  Alcohols are soft, spicy, often a bit sweet and low in intensity.  Bitterness is typically medium to high from a combination of hop bitterness and yeast-produced phenolics.  Substantial carbonation and bitterness lends a dry finish with a moderately bitter aftertaste.  No diacetyl.', N'Medium-light to medium body, although lighter than the substantial gravity would suggest (thanks to sugar and high carbonation).  High alcohol content adds a pleasant creaminess but little to no obvious warming sensation.  No hot alcohol or solventy character.  Always effervescent.  Never astringent.', N'Strongly resembles a Strong Golden Ale but slightly darker and somewhat fuller-bodied.  Usually has a more rounded malt flavor but should not be sweet.', N'High in alcohol but does not taste strongly of alcohol.  The best examples are sneaky, not obvious.  High carbonation and attenuation helps to bring out the many flavors and to increase the perception of a dry finish.  Most Trappist versions have at least 30 IBUs and are very dry. Traditionally bottle-conditioned ("refermented in the bottle").', N'The light color and relatively light body for a beer of this strength are the result of using Pilsner malt and up to 20% white sugar.  Noble hops or Styrian Goldings are commonly used.  Belgian yeast strains are used – those that produce fruity esters, spicy phenolics and higher alcohols  often aided by slightly warmer fermentation temperatures.  Spice additions are generally not traditional, and if used, should not be recognizable as such.  Fairly soft water.', 1.075, 1.085, 1.008, 1.014, 20, 40, 4.5, 7, 7.5, 9.5, N'Westmalle Tripel, La Rulles Tripel, St. Bernardus Tripel, Chimay Cinq Cents (White), Watou Tripel, Val-Dieu Triple, Affligem Tripel, Grimbergen Tripel, La Trappe Tripel, Witkap Pater Tripel, Corsendonk Abbey Pale Ale, St. Feuillien Tripel, Bink Tripel, Tripel Karmeliet, New Belgium Trippel, Unibroue La Fin du Monde, Dragonmead Final Absolution, Allagash Tripel Reserve, Victory Golden Monkey')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 18, N'Belgian Strong Ale', N'18D', N'Belgian Golden Strong Ale', N'Complex with significant fruity esters, moderate spiciness and low to moderate alcohol and hop aromas.  Esters are reminiscent of lighter fruits such as pears, oranges or apples.  Moderate spicy, peppery phenols.  A low to moderate yet distinctive perfumy, floral hop character is often present.  Alcohols are soft, spicy, perfumy and low-to-moderate in intensity.  No hot alcohol or solventy aromas.  The malt character is light.  No diacetyl.', N'Yellow to medium gold in color.  Good clarity.  Effervescent.  Massive, long-lasting, rocky, often beady, white head resulting in characteristic "Belgian lace" on the glass as it fades.', N'Marriage of fruity, spicy and alcohol flavors supported by a soft malt character.  Esters are reminiscent of pears, oranges or apples.  Low to moderate phenols are peppery in character.  A low to moderate spicy hop character is often present.  Alcohols are soft, spicy, often a bit sweet and are low-to-moderate in intensity.  Bitterness is typically medium to high from a combination of hop bitterness and yeast-produced phenolics.  Substantial carbonation and bitterness leads to a dry finish with a low to moderately bitter aftertaste.  No diacetyl.', N'Very highly carbonated. Light to medium body, although lighter than the substantial gravity would suggest (thanks to sugar and high carbonation).  Smooth but noticeable alcohol warmth.  No hot alcohol or solventy character.  Always effervescent.  Never astringent.', N'A golden, complex, effervescent, strong Belgian-style ale.', N'Strongly resembles a Tripel, but may be even paler, lighter-bodied and even crisper and drier.  The drier finish and lighter body also serves to make the assertive hopping and spiciness more prominent.  References to the devil are included in the names of many commercial examples of this style, referring to their potent alcoholic strength and as a tribute to the original example (Duvel).  The best examples are complex and delicate.  High carbonation helps to bring out the many flavors and to increase the perception of a dry finish. Traditionally bottle-conditioned ("refermented in the bottle").', N'The light color and relatively light body for a beer of this strength are the result of using Pilsner malt and up to 20% white sugar.  Noble hops or Styrian Goldings are commonly used.  Belgian yeast strains are used – those that produce fruity esters, spicy phenolics and higher alcohols – often aided by slightly warmer fermentation temperatures.  Fairly soft water.', 1.07, 1.095, 1.005, 1.016, 22, 35, 3, 6, 7.5, 10.5, N'Duvel, Russian River Damnation, Hapkin, Lucifer, Brigand, Judas, Delirium Tremens, Dulle Teve, Piraat, Great Divide Hades, Avery Salvation, North Coast Pranqster, Unibroue Eau Benite, AleSmith Horny Devil')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 18, N'Belgian Strong Ale', N'18E', N'Belgian Dark Strong Ale', N'Complex, with a rich malty sweetness, significant esters and alcohol, and an optional light to moderate spiciness.  The malt is rich and strong, and can have a Munich-type quality often with a caramel, toast and/or bready aroma.  The fruity esters are strong to moderately low, and can contain raisin, plum, dried cherry, fig or prune notes.  Spicy phenols may be present, but usually have a peppery quality not clove-like.  Alcohols are soft, spicy, perfumy and/or rose-like, and are low to moderate in intensity.  Hops are not usually present (but a very low noble hop aroma is acceptable).  No diacetyl.  No dark/roast malt aroma.  No hot alcohols or solventy aromas.  No recognizable spice additions.', N'Deep amber to deep coppery-brown in color ("dark" in this context implies "more deeply colored than golden").  Huge, dense, moussy, persistent cream- to light tan-colored head.  Can be clear to somewhat hazy.', N'Similar to aroma (same malt, ester, phenol, alcohol, hop and spice comments apply to flavor as well).  Moderately malty or sweet on palate.  Finish is variable depending on interpretation (authentic Trappist versions are moderately dry to dry, Abbey versions can be medium-dry to sweet).  Low bitterness for a beer of this strength; alcohol provides some of the balance to the malt.  Sweeter and more full-bodied beers will have a higher bitterness level to balance.  Almost all versions are malty in the balance, although a few are lightly bitter.  The complex and varied flavors should blend smoothly and harmoniously.', N'High carbonation but no carbonic acid "bite."  Smooth but noticeable alcohol warmth.  Body can be variable depending on interpretation (authentic Trappist versions tend to be medium-light to medium, while Abbey-style beers can be quite full and creamy).', N'A dark, very rich, complex, very strong Belgian ale.  Complex, rich, smooth and dangerous.', N'Authentic Trappist versions tend to be drier (Belgians would say "more digestible") than Abbey versions, which can be rather sweet and full-bodied.  Higher bitterness is allowable in Abbey-style beers with a higher FG.  Barleywine-type beers (e.g., Scaldis/Bush, La Trappe Quadrupel, Weyerbacher QUAD) and Spiced/Christmas-type beers (e.g., N''ice Chouffe, Affligem Nöel) should be entered in the Belgian Specialty Ale category (16E), not this category. Traditionally bottle-conditioned ("refermented in the bottle").', N'Belgian yeast strains prone to production of higher alcohols, esters, and sometimes phenolics are commonly used.  Water can be soft to hard.  Impression of a complex grain bill, although many traditional versions are quite simple, with caramelized sugar syrup or unrefined sugars and yeast providing much of the complexity.  Homebrewers may use Belgian Pils or pale base malt, Munich-type malts for maltiness, other Belgian specialty grains for character.  Caramelized sugar syrup or unrefined sugars lightens body and adds color and flavor (particularly if dark sugars are used).  Noble-type, English-type or Styrian Goldings hops commonly used.  Spices generally not used; if used, keep subtle and in the background.  Avoid US/UK crystal type malts (these provide the wrong type of sweetness).', 1.075, 1.11, 1.01, 1.024, 20, 30, 12, 22, 8, 11, N'Westvleteren 12 (yellow cap), Rochefort 10 (blue cap), St. Bernardus Abt 12, Gouden Carolus Grand Cru of the Emperor, Achel Extra Brune, Rochefort 8 (green cap), Southampton Abbot 12, Chimay Grande Reserve (Blue), Brasserie des Rocs Grand Cru, Gulden Draak, Kasteelbier Bière du Chateau Donker, Lost Abbey Judgment Day, Russian River Salvation')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 19, N'Strong Ale', N'19A', N'Old Ale', N'Malty-sweet with fruity esters, often with a complex blend of dried-fruit, vinous, caramelly, molasses, nutty, toffee, treacle, and/or other specialty malt aromas.  Some alcohol and oxidative notes are acceptable, akin to those found in Sherry or Port. Hop aromas not usually present due to extended aging.', N'Light amber to very dark reddish-brown color (most are fairly dark).  Age and oxidation may darken the beer further.  May be almost opaque (if not, should be clear).  Moderate to low cream- to light tan-colored head; may be adversely affected by alcohol and age.', N'Medium to high malt character with a luscious malt complexity, often with nutty, caramelly and/or molasses-like flavors.  Light chocolate or roasted malt flavors are optional, but should never be prominent.  Balance is often malty-sweet, but may be well hopped (the impression of bitterness often depends on amount of aging).  Moderate to high fruity esters are common, and may take on a dried-fruit or vinous character.  The finish may vary from dry to somewhat sweet.  Extended aging may contribute oxidative flavors similar to a fine old Sherry, Port or Madeira. Alcoholic strength should be evident, though not overwhelming.  Diacetyl low to none.  Some wood-aged or blended versions may have a lactic or Brettanomyces character; but this is optional and should not be too strong (enter as a specialty beer if it is).', N'Medium to full, chewy body, although older examples may be lower in body due to continued attenuation during conditioning.  Alcohol warmth is often evident and always welcome.  Low to moderate carbonation, depending on age and conditioning.', N'An ale of significant alcoholic strength, bigger than strong bitters and brown porters, though usually not as strong or rich as barleywine. Usually tilted toward a sweeter, maltier balance. "It should be a warming beer of the type that is best drunk in half pints by a warm fire on a cold winter''s night"  Michael Jackson.', N'Strength and character varies widely.  Fits in the style space between normal gravity beers (strong bitters, brown porters) and barleywines.  Can include winter warmers, strong dark milds, strong (and perhaps darker) bitters, blended strong beers (stock ale blended with a mild or bitter), and lower gravity versions of English barleywines.  Many English examples, particularly winter warmers, are lower than 6% ABV.', N'Generous quantities of well-modified pale malt (generally English in origin, though not necessarily so), along with judicious quantities of caramel malts and other specialty character malts. Some darker examples suggest that dark malts (e.g., chocolate, black malt) may be appropriate, though sparingly so as to avoid an overly roasted character. Adjuncts (such as molasses, treacle, invert sugar or dark sugar) are often used, as are starchy adjuncts (maize, flaked barley, wheat) and malt extracts. Hop variety is not as important, as the relative balance and aging process negate much of the varietal character.  British ale yeast that has low attenuation, but can handle higher alcohol levels, is traditional.', 1.06, 1.09, 1.015, 1.022, 30, 60, 10, 22, 6, 9, N'Gale''s Prize Old Ale, Burton Bridge Olde Expensive, Marston Owd Roger, Greene King Olde Suffolk Ale , J.W. Lees Moonraker, Harviestoun Old Engine Oil, Fuller''s Vintage Ale, Harvey''s Elizabethan Ale, Theakston Old Peculier (peculiar at OG 1.057), Young''s Winter Warmer, Sarah Hughes Dark Ruby Mild, Samuel Smith''s Winter Welcome, Fuller''s 1845, Fuller''s Old Winter Ale, Great Divide Hibernation Ale, Founders Curmudgeon, Cooperstown Pride of Milford Special Ale, Coniston Old Man Ale, Avery Old Jubilation')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 19, N'Strong Ale', N'19B', N'English Barleywine', N'Very rich and strongly malty, often with a caramel-like aroma.  May have moderate to strong fruitiness, often with a dried-fruit character.  English hop aroma may range from mild to assertive.  Alcohol aromatics may be low to moderate, but never harsh, hot or solventy.  The intensity of these aromatics often subsides with age.  The aroma may have a rich character including bready, toasty, toffee, molasses, and/or treacle notes.  Aged versions may have a sherry-like quality, possibly vinous or port-like aromatics, and generally more muted malt aromas.  Low to no diacetyl.', N'Color may range from rich gold to very dark amber or even dark brown. Often has ruby highlights, but should not be opaque. Low to moderate off-white head; may have low head retention.  May be cloudy with chill haze at cooler temperatures, but generally clears to good to brilliant clarity as it warms.  The color may appear to have great depth, as if viewed through a thick glass lens.  High alcohol and viscosity may be visible in "legs" when beer is swirled in a glass.', N'Strong, intense, complex, multi-layered malt flavors ranging from bready and biscuity through nutty, deep toast, dark caramel, toffee, and/or molasses.  Moderate to high malty sweetness on the palate, although the finish may be moderately sweet to moderately dry (depending on aging). Some oxidative or vinous flavors may be present, and often complex alcohol flavors should be evident.  Alcohol flavors shouldn''t be harsh, hot or solventy.  Moderate to fairly high fruitiness, often with a dried-fruit character.  Hop bitterness may range from just enough for balance to a firm presence; balance therefore ranges from malty to somewhat bitter.  Low to moderately high hop flavor (usually UK varieties).  Low to no diacetyl.', N'Full-bodied and chewy, with a velvety, luscious texture (although the body may decline with long conditioning).  A smooth warmth from aged alcohol should be present, and should not be hot or harsh.  Carbonation may be low to moderate, depending on age and conditioning.', N'The richest and strongest of the English Ales.  A showcase of malty richness and complex, intense flavors.  The character of these ales can change significantly over time; both young and old versions should be appreciated for what they are.  The malt profile can vary widely; not all examples will have all possible flavors or aromas.', N'Although often a hoppy beer, the English Barleywine places less emphasis on hop character than the American Barleywine and features English hops.  English versions can be darker, maltier, fruitier, and feature richer specialty malt flavors than American Barleywines.', N'Well-modified pale malt should form the backbone of the grist, with judicious amounts of caramel malts. Dark malts should be used with great restraint, if at all, as most of the color arises from a lengthy boil.  English hops such as Northdown, Target, East Kent Goldings and Fuggles.  Characterful English yeast.', 1.08, 1.12, 1.018, 1.03, 35, 70, 8, 22, 8, 12, N'Thomas Hardy''s Ale, Burton Bridge Thomas Sykes Old Ale, J.W. Lee''s Vintage Harvest Ale, Robinson''s Old Tom, Fuller''s Golden Pride, AleSmith Old Numbskull, Young''s Old Nick (unusual in its 7.2% ABV), Whitbread Gold Label, Old Dominion Millenium, North Coast Old Stock Ale (when aged), Weyerbacher Blithering Idiot')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 19, N'Strong Ale', N'19C', N'American Barleywine', N'Very rich and intense maltiness.  Hop character moderate to assertive and often showcases citrusy or resiny American varieties (although other varieties, such as floral, earthy or spicy English varieties or a blend of varieties, may be used).  Low to moderately strong fruity esters and alcohol aromatics.  Malt character may be sweet, caramelly, bready, or fairly neutral.  However, the intensity of aromatics often subsides with age.  No diacetyl.', N'Color may range from light amber to medium copper; may rarely be as dark as light brown. Often has ruby highlights. Moderately-low to large off-white to light tan head; may have low head retention.  May be cloudy with chill haze at cooler temperatures, but generally clears to good to brilliant clarity as it warms.  The color may appear to have great depth, as if viewed through a thick glass lens.  High alcohol and viscosity may be visible in "legs" when beer is swirled in a glass.', N'Strong, intense malt flavor with noticeable bitterness.  Moderately low to moderately high malty sweetness on the palate, although the finish may be somewhat sweet to quite dry (depending on aging). Hop bitterness may range from moderately strong to aggressive.  While strongly malty, the balance should always seem bitter.  Moderate to high hop flavor (any variety).  Low to moderate fruity esters.  Noticeable alcohol presence, but sharp or solventy alcohol flavors are undesirable.  Flavors will smooth out and decline over time, but any oxidized character should be muted (and generally be masked by the hop character).  May have some bready or caramelly malt flavors, but these should not be high.  Roasted or burnt malt flavors are inappropriate.  No diacetyl.', N'Full-bodied and chewy, with a velvety, luscious texture (although the body may decline with long conditioning).  Alcohol warmth should be present, but not be excessively hot.  Should not be syrupy and under-attenuated.  Carbonation may be low to moderate, depending on age and conditioning.', N'A well-hopped American interpretation of the richest and strongest of the English ales.  The hop character should be evident throughout, but does not have to be unbalanced.  The alcohol strength and hop bitterness often combine to leave a very long finish.', N'The American version of the Barleywine tends to have a greater emphasis on hop bitterness, flavor and aroma than the English Barleywine, and often features American hop varieties.  Differs from an Imperial IPA in that the hops are not extreme, the malt is more forward, and the body is richer and more characterful.', N'Well-modified pale malt should form the backbone of the grist.  Some specialty or character malts may be used.  Dark malts should be used with great restraint, if at all, as most of the color arises from a lengthy boil.   Citrusy American hops are common, although any varieties can be used in quantity.  Generally uses an attenuative American yeast.', 1.08, 1.12, 1.016, 1.03, 50, 120, 10, 19, 8, 12, N'Sierra Nevada Bigfoot, Great Divide Old Ruffian, Victory Old Horizontal, Rogue Old Crustacean, Avery Hog Heaven Barleywine, Bell''s Third Coast Old Ale, Anchor Old Foghorn, Three Floyds Behemoth, Stone Old Guardian, Bridgeport Old Knucklehead, Hair of the Dog Doggie Claws, Lagunitas Olde GnarleyWine, Smuttynose Barleywine, Flying Dog Horn Dog')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 1, N'Light Lager', N'1A', N'Lite American Lager', N'Little to no malt aroma, although it can be grainy, sweet or corn-like if present.  Hop aroma may range from none to a light, spicy or floral hop presence.  Low levels of yeast character (green apples, DMS, or fruitiness) are optional but acceptable.  No diacetyl.', N'Very pale straw to pale yellow color.  White, frothy head seldom persists.  Very clear.', N'Crisp and dry flavor with some low levels of grainy or corn-like sweetness.  Hop flavor ranges from none to low levels.  Hop bitterness at low level.  Balance may vary from slightly malty to slightly bitter, but is relatively close to even.  High levels of carbonation may provide a slight acidity or dry "sting."  No diacetyl.  No fruitiness.', N'Very light body from use of a high percentage of adjuncts such as rice or corn.  Very highly carbonated with slight carbonic bite on the tongue.  May seem watery.', N'Very refreshing and thirst quenching.', N'A lower gravity and lower calorie beer than standard international lagers.  Strong flavors are a fault. Designed to appeal to the broadest range of the general public as possible.', N'Two- or six-row barley with high percentage (up to 40%) of rice or corn as adjuncts.', 1.028, 1.04, 0.998, 1.008, 8, 12, 2, 3, 2.8, 4.2, N'Bitburger Light, Sam Adams Light, Heineken Premium Light, Miller Lite, Bud Light, Coors Light, Baltika #1 Light, Old Milwaukee Light, Amstel Light')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 1, N'Light Lager', N'1B', N'Standard American Lager', N'Little to no malt aroma, although it can be grainy, sweet or corn-like if present.  Hop aroma may range from none to a light, spicy or floral hop presence.  Low levels of yeast character (green apples, DMS, or fruitiness) are optional but acceptable.  No diacetyl.', N'Very pale straw to medium yellow color.  White, frothy head seldom persists.  Very clear.', N'Crisp and dry flavor with some low levels of grainy or corn-like sweetness.  Hop flavor ranges from none to low levels.  Hop bitterness at low to medium-low level.  Balance may vary from slightly malty to slightly bitter, but is relatively close to even.  High levels of carbonation may provide a slight acidity or dry "sting."  No diacetyl.  No fruitiness.', N'Light body from use of a high percentage of adjuncts such as rice or corn.  Very highly carbonated with slight carbonic bite on the tongue.', N'Very refreshing and thirst quenching.', N'Strong flavors are a fault.  An international style including the standard mass-market lager from most countries.', N'Two- or six-row barley with high percentage (up to 40%) of rice or corn as adjuncts.', 1.04, 1.05, 1.004, 1.01, 8, 15, 2, 4, 4.2, 5.3, N'Pabst Blue Ribbon, Miller High Life, Budweiser, Baltika #3 Classic, Kirin Lager, Grain Belt Premium Lager, Molson Golden, Labatt Blue, Coors Original, Foster''s Lager')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 1, N'Light Lager', N'1C', N'Premium American Lager', N'Low to medium-low malt aroma, which can be grainy, sweet or corn-like.  Hop aroma may range from very low to a medium-low, spicy or floral hop presence.  Low levels of yeast character (green apples, DMS, or fruitiness) are optional but acceptable.  No diacetyl.', N'Pale straw to gold color.  White, frothy head may not be long lasting.  Very clear.', N'Crisp and dry flavor with some low levels of grainy or malty sweetness.  Hop flavor ranges from none to low levels.  Hop bitterness at low to medium level.  Balance may vary from slightly malty to slightly bitter, but is relatively close to even.  High levels of carbonation may provide a slight acidity or dry "sting."  No diacetyl.  No fruitiness.', N'Medium-light body from use of adjuncts such as rice or corn.  Highly carbonated with slight carbonic bite on the tongue.', N'Refreshing and thirst quenching, although generally more filling than standard/lite versions.', N'Premium beers tend to have fewer adjuncts than standard/lite lagers, and can be all-malt. Strong flavors are a fault, but premium lagers have more flavor than standard/lite lagers.  A broad category of international mass-market lagers ranging from up-scale American lagers to the typical "import" or "green bottle" international beers found in America.', N'Two- or six-row barley with up to 25% rice or corn as adjuncts.', 1.046, 1.056, 1.008, 1.012, 15, 25, 2, 6, 4.6, 6, N'Full Sail Session Premium Lager, Miller Genuine Draft, Corona Extra, Michelob, Coors Extra Gold, Birra Moretti, Heineken, Beck''s, Stella Artois, Red Stripe, Singha')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 1, N'Light Lager', N'1D', N'Munich Helles', N'Pleasantly grainy-sweet, clean Pils malt aroma dominates. Low to moderately-low spicy noble hop aroma, and a low background note of DMS (from Pils malt).  No esters or diacetyl.', N'Medium yellow to pale gold, clear, with a creamy white head.', N'Slightly sweet, malty profile. Grain and Pils malt flavors dominate, with a low to medium-low hop bitterness that supports the malty palate. Low to moderately-low spicy noble hop flavor.  Finish and aftertaste remain malty.  Clean, no fruity esters, no diacetyl.', N'Medium body, medium carbonation, smooth maltiness with no trace of astringency.', N'Malty but fully attenuated Pils malt showcase.', N'Unlike Pilsner but like its cousin, Munich Dunkel, Helles is a malt-accentuated beer that is not overly sweet, but rather focuses on malt flavor with underlying hop bitterness in a supporting role.', N'Moderate carbonate water, Pilsner malt, German noble hop varieties.', 1.045, 1.051, 1.008, 1.012, 16, 22, 3, 5, 4.7, 5.4, N'Weihenstephaner Original, Hacker-Pschorr Münchner Gold, Bürgerbräu Wolznacher Hell Naturtrüb, Mahr''s Hell, Paulaner Premium Lager, Spaten Premium Lager, Stoudt''s Gold Lager')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 1, N'Light Lager', N'1E', N'Dortmunder Export', N'Low to medium noble (German or Czech) hop aroma.  Moderate Pils malt aroma; can be grainy to somewhat sweet. May have an initial sulfury aroma (from water and/or yeast) and a low background note of DMS (from Pils malt).  No diacetyl.', N'Light gold to deep gold, clear with a persistent white head.', N'Neither Pils malt nor noble hops dominate, but both are in good balance with a touch of malty sweetness, providing a smooth yet crisply refreshing beer. Balance continues through the finish and the hop bitterness lingers in aftertaste (although some examples may finish slightly sweet).  Clean, no fruity esters, no diacetyl.  Some mineral character might be noted from the water, although it usually does not come across as an overt minerally flavor.', N'Medium body, medium carbonation.', N'Balance and smoothness are the hallmarks of this style.  It has the malt profile of a Helles, the hop character of a Pils, and is slightly stronger than both.', N'Brewed to a slightly higher starting gravity than other light lagers, providing a firm malty body and underlying maltiness to complement the sulfate-accentuated hop bitterness.  The term "Export" is a beer strength category under German beer tax law, and is not strictly synonymous with the "Dortmunder" style.  Beer from other cities or regions can be brewed to Export strength, and labeled as such.', N'Minerally water with high levels of sulfates, carbonates and chlorides, German or Czech noble hops, Pilsner malt, German lager yeast.', 1.048, 1.056, 1.01, 1.015, 23, 30, 4, 6, 4.8, 6, N'DAB Export, Dortmunder Union Export, Dortmunder Kronen, Ayinger Jahrhundert, Great Lakes Dortmunder Gold, Barrel House Duveneck''s Dortmunder, Bell''s Lager, Dominion Lager, Gordon Biersch Golden Export, Flensburger Gold')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 22, N'Smoke-Flavored/Wood-Aged Beer', N'22A', N'Classic Rauchbier', N'Blend of smoke and malt, with a varying balance and intensity.  The beechwood smoke character can range from subtle to fairly strong, and can seem smoky, bacon-like, woody, or rarely almost greasy.  The malt character can be low to moderate, and be somewhat sweet, toasty, or malty.  The malt and smoke components are often inversely proportional (i.e., when smoke increases, malt decreases, and vice versa).  Hop aroma may be very low to none.  Clean, lager character with no fruity esters, diacetyl or DMS.', N'This should be a very clear beer, with a large, creamy, rich, tan- to cream-colored head.  Medium amber/light copper to dark brown color.', N'Generally follows the aroma profile, with a blend of smoke and malt in varying balance and intensity, yet always complementary.  Märzen-like qualities should be noticeable, particularly a malty, toasty richness, but the beechwood smoke flavor can be low to high.  The palate can be somewhat malty and sweet, yet the finish can reflect both malt and smoke.  Moderate, balanced, hop bitterness, with a medium-dry to dry finish (the smoke character enhances the dryness of the finish).  Noble hop flavor moderate to none.  Clean lager character with no fruity esters, diacetyl or DMS.  Harsh, bitter, burnt, charred, rubbery, sulfury or phenolic smoky characteristics are inappropriate.', N'Medium body.  Medium to medium-high carbonation.  Smooth lager character.  Significant astringent, phenolic harshness is inappropriate.', N'Märzen/Oktoberfest-style (see 3B) beer with a sweet, smoky aroma and flavor and a somewhat darker color.', N'The intensity of smoke character can vary widely; not all examples are highly smoked.  Allow for variation in the style when judging.  Other examples of smoked beers are available in Germany, such as the Bocks, Hefe-Weizen, Dunkel, Schwarz, and Helles-like beers, including examples such as Spezial Lager. Brewers entering these styles should use Other Smoked Beer (22B) as the entry category.', N'German Rauchmalz (beechwood-smoked Vienna-type malt) typically makes up 20-100% of the grain bill, with the remainder being German malts typically used in a Märzen.  Some breweries adjust the color slightly with a bit of roasted malt.  German lager yeast.  German or Czech hops.', 1.05, 1.057, 1.012, 1.016, 20, 30, 12, 22, 4.8, 6, N'Schlenkerla Rauchbier Märzen, Kaiserdom Rauchbier, Eisenbahn Rauchbier, Victory Scarlet Fire Rauchbier, Spezial Rauchbier Märzen, Saranac Rauchbier')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 27, N'Standard Cider and Perry', N'27A', N'Common Cider ', N'Sweet or low-alcohol ciders may have apple aroma and flavor. Dry ciders will be more wine-like with some esters. Sugar and acidity should combine to give a refreshing character, neither cloying nor too austere. Medium to high acidity. ', N'Clear to brilliant, medium to deep gold color.', N'Sweet or low-alcohol ciders may have apple aroma and flavor. Dry ciders will be more wine-like with some esters. Sugar and acidity should combine to give a refreshing character, neither cloying nor too austere. Medium to high acidity. ', N'Medium body. Some tannin should be present for slight to moderate astringency, but little bitterness.', N'Variable, but should be a medium, refreshing drink. Sweet ciders must not be cloying. Dry ciders must not be too austere. An ideal cider serves well as a "session" drink, and suitably accompanies a wide variety of food.', N'Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (dry, medium, sweet).', N'', 1.045, 1.065, 1, 1.02, NULL, NULL, NULL, NULL, 5, 8, N'[US] Red Barn Cider Jonagold Semi-Dry and Sweetie Pie (WA), AEppelTreow Barn Swallow Draft Cider (WI), Wandering Aengus Heirloom Blend Cider (OR), Uncle John''s Fruit House Winery Apple Hard Cider (MI), Bellwether Spyglass (NY), West County Pippin (MA), White Winter Hard Apple Cider (WI), Harpoon Cider (MA)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 27, N'Standard Cider and Perry', N'27B', N'English Cider ', N'No overt apple character, but various flavors and esters that suggest apples. May have "smoky (bacon)" character from a combination of apple varieties and MLF. Some "Farmyard nose" may be present but must not dominate; mousiness is a serious fault. The common slight farmyard nose of an English West Country cider is the result of lactic acid bacteria, not a Brettanomyces contamination.', N'Slightly cloudy to brilliant. Medium to deep gold color.', N'No overt apple character, but various flavors and esters that suggest apples. May have "smoky (bacon)" character from a combination of apple varieties and MLF. Some "Farmyard nose" may be present but must not dominate; mousiness is a serious fault. The common slight farmyard nose of an English West Country cider is the result of lactic acid bacteria, not a Brettanomyces contamination.', N'Full. Moderate to high tannin apparent as astringency and some bitterness.  Carbonation still to moderate, never high or gushing.', N'Generally dry, full-bodied, austere.', N'Entrants MUST specify carbonation level (still or petillant). Entrants MUST specify sweetness (dry to medium). Entrants MAY specify variety of apple for a single varietal cider; if specified, varietal character will be expected.', N'', 1.05, 1.075, 0.995, 1.01, NULL, NULL, NULL, NULL, 6, 9, N'[US] Westcott Bay Traditional Very Dry, Traditional Dry and Traditional Medium Sweet (WA), Farnum Hill Extra-Dry, Dry, and Farmhouse (NH), Wandering Aengus Dry Cider (OR), Red Barn Cider Burro Loco (WA), Bellwether Heritage (NY); [UK] Oliver''s Herefordshire Dry Cider, various from Hecks, Dunkerton, Burrow Hill, Gwatkin Yarlington Mill, Aspall Dry Cider')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 27, N'Standard Cider and Perry', N'27C', N'French Cider', N'Fruity character/aroma. This may come from slow or arrested fermentation (in the French technique of défécation) or approximated by back sweetening with juice. Tends to a rich fullness.', N'Clear to brilliant, medium to deep gold color.', N'Fruity character/aroma. This may come from slow or arrested fermentation (in the French technique of défécation) or approximated by back sweetening with juice. Tends to a rich fullness.', N'Medium to full, mouth filling.  Moderate tannin apparent mainly as astringency. Carbonation moderate to champagne-like, but at higher levels it must not gush or foam.', N'Medium to sweet, full-bodied, rich.', N'Entrants MUST specify carbonation level (petillant or full). Entrants MUST specify sweetness (medium, sweet). Entrants MAY specify variety of apple for a single varietal cider; if specified, varietal character will be expected.', N'', 1.05, 1.065, 1.01, 1.02, NULL, NULL, NULL, NULL, 3, 6, N'[US] West County Reine de Pomme (MA), Rhyne Cider (CA); [France] Eric Bordelet (various), Etienne Dupont, Etienne Dupont Organic, Bellot')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 27, N'Standard Cider and Perry', N'27D', N'Common Perry', N'There is a pear character, but not obviously fruity. It tends toward that of a young white wine. No bitterness.', N'Slightly cloudy to clear. Generally quite pale.', N'There is a pear character, but not obviously fruity. It tends toward that of a young white wine. No bitterness.', N':  Relatively full, low to moderate tannin apparent as astringency.', N'Mild. Medium to medium-sweet. Still to lightly sparkling. Only very slight acetification is acceptable. Mousiness, ropy/oily characters are serious faults.', N'Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (medium or sweet).', N'', 1.05, 1.06, 1, 1.02, NULL, NULL, NULL, NULL, 5, 7.2, N'[US] White Winter Hard Pear Cider (WI), AEppelTreow Perry (WI), Blossomwood Laughing Pig Perry (CO), Uncle John''s Fruit House Winery Perry (MI)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 27, N'Standard Cider and Perry', N'27E', N'Traditional Perry ', N'There is a pear character, but not obviously fruity. It tends toward that of a young white wine. Some slight bitterness.', N'Slightly cloudy to clear. Generally quite pale.', N'There is a pear character, but not obviously fruity. It tends toward that of a young white wine. Some slight bitterness.', N'Relatively full, moderate to high tannin apparent as astringency.', N'Tannic. Medium to medium-sweet. Still to lightly sparkling. Only very slight acetification is acceptable. Mousiness, ropy/oily characters are serious faults.', N'Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (medium or sweet). Variety of pear(s) used must be stated.', N'', 1.05, 1.07, 1, 1.02, NULL, NULL, NULL, NULL, 5, 9, N'[France] Bordelet Poire Authentique and Poire Granit, Christian Drouin Poire, [UK] Gwatkin Blakeney Red Perry, Oliver''s Blakeney Red Perry and Herefordshire Dry Perry')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 28, N'Specialty Cider and Perry', N'28A', N'New England Cider', N'A dry flavorful cider with robust apple character, strong alcohol, and derivative flavors from sugar adjuncts.', N'to brilliant, pale to medium yellow. ', N'A dry flavorful cider with robust apple character, strong alcohol, and derivative flavors from sugar adjuncts', N'Substantial, alcoholic. Moderate tannin.', N'Substantial body and character .', N'Adjuncts may include white and brown sugars, molasses, small amounts of honey, and raisins. Adjuncts are intended to raise OG well above that which would be achieved by apples alone. This style is sometimes barrel-aged, in which case there will be oak character as with a barrel-aged wine. If the barrel was formerly used to age spirits, some flavor notes from the spirit (e.g., whisky or rum) may also be present, but must be subtle. Entrants MUST specify if the cider was barrel-fermented or aged. Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (dry, medium, or sweet).', N'', 1.06, 1.1, 0.995, 1.01, NULL, NULL, NULL, NULL, 7, 13, N'There are no known commercial examples of New England Cider.')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 28, N'Specialty Cider and Perry', N'28B', N'Fruit Cider', N'The cider character must be present and must fit with the other fruits. It is a fault if the adjuncts completely dominate; a judge might ask, "Would this be different if neutral spirits replaced the cider?" A fruit cider should not be like an alco-pop. Oxidation is a fault.', N'Clear to brilliant. Color appropriate to added fruit, but should not show oxidation characteristics. (For example, berries should give red-to-purple color, not orange.)', N'The cider character must be present and must fit with the other fruits. It is a fault if the adjuncts completely dominate; a judge might ask, "Would this be different if neutral spirits replaced the cider?" A fruit cider should not be like an alco-pop. Oxidation is a fault.', N'Substantial. May be significantly tannic depending on fruit added.', N'Like a dry wine with complex flavors. The apple character must marry with the added fruit so that neither dominates the other. ', N'Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (dry or medium). Entrants MUST specify what fruit(s) and/or fruit juice(s) were added.', N'', 1.045, 1.07, 0.995, 1.01, NULL, NULL, NULL, NULL, 5, 9, N'[US] West County Blueberry-Apple Wine (MA), AEppelTreow Red Poll Cran-Apple Draft Cider (WI), Bellwether Cherry Street (NY), Uncle John''s Fruit Farm Winery Apple Cherry Hard Cider (MI)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 28, N'Specialty Cider and Perry', N'28C', N'Applewine', N'Comparable to a Common Cider. Cider character must be distinctive. Very dry to slightly medium.', N'Clear to brilliant, pale to medium-gold. Cloudiness or hazes are inappropriate. Dark colors are not expected unless strongly tannic varieties of fruit were used.', N'Comparable to a Common Cider. Cider character must be distinctive. Very dry to slightly medium.', N'Lighter than other ciders, because higher alcohol is derived from addition of sugar rather than juice. Carbonation may range from still to champagne-like.', N'Like a dry white wine, balanced, and with low astringency and bitterness.', N'Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (dry or medium).', N'', 1.07, 1.1, 0.995, 1.01, NULL, NULL, NULL, NULL, 9, 12, N'[US] AEppelTreow Summer''s End (WI), Wandering Aengus Pommeau (OR), Uncle John''s Fruit House Winery Fruit House Apple (MI), Irvine''s Vintage Ciders (WA)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'cider', 28, N'Specialty Cider and Perry', N'28D', N'Other Specialty Cider/Perry', N'The cider character must always be present, and must fit with adjuncts.', N'Clear to brilliant. Color should be that of a common cider unless adjuncts are expected to contribute color.', N'The cider character must always be present, and must fit with adjuncts.', N'Average body, may show tannic (astringent) or heavy body as determined by adjuncts.', N'', N'Entrants MUST specify all major ingredients and adjuncts. Entrants MUST specify carbonation level (still, petillant, or sparkling). Entrants MUST specify sweetness (dry or medium).', N'', 1.045, 1.1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 12, N'[US] Red Barn Cider Fire Barrel (WA), AEppelTreow Pear Wine and Sparrow Spiced Cider (WI)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 2, N'Pilsner', N'2A', N'German Pilsner (Pils)', N'Typically features a light grainy Pils malt character (sometimes Graham cracker-like) and distinctive flowery or spicy noble hops.  Clean, no fruity esters, no diacetyl.  May have an initial sulfury aroma (from water and/or yeast) and a low background note of DMS (from Pils malt).', N'Straw to light gold, brilliant to very clear, with a creamy, long-lasting white head.', N'Crisp and bitter, with a dry to medium-dry finish.  Moderate to moderately-low yet well attenuated maltiness, although some grainy flavors and slight Pils malt sweetness are acceptable.  Hop bitterness dominates taste and continues through the finish and lingers into the aftertaste. Hop flavor can range from low to high but should only be derived from German noble hops.  Clean, no fruity esters, no diacetyl.', N'Medium-light body, medium to high carbonation.', N'Crisp, clean, refreshing beer that prominently features noble German hop bitterness accentuated by sulfates in the water.', N'Drier and crisper than a Bohemian Pilsener with a bitterness that tends to linger more in the aftertaste due to higher attenuation and higher-sulfate water.  Lighter in body and color, and with higher carbonation than a Bohemian Pilsener.  Modern examples of German Pilsners tend to become paler in color, drier in finish, and more bitter as you move from South to North in Germany.', N'Pilsner malt, German hop varieties (especially noble varieties such as Hallertauer, Tettnanger and Spalt for taste and aroma), medium sulfate water, German lager yeast.', 1.044, 1.05, 1.008, 1.013, 25, 45, 2, 5, 4.4, 5.2, N'Victory Prima Pils, Bitburger, Warsteiner, Trumer Pils, Old Dominion Tupper''s Hop Pocket Pils, König Pilsener, Jever Pils, Left Hand Polestar Pilsner, Holsten Pils, Spaten Pils, Brooklyn Pilsner')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 2, N'Pilsner', N'2B', N'Bohemian Pilsener', N'Rich with complex malt and a spicy, floral Saaz hop bouquet. Some pleasant, restrained diacetyl is acceptable, but need not be present. Otherwise clean, with no fruity esters.', N'Very pale gold to deep burnished gold, brilliant to very clear, with a dense, long-lasting, creamy white head.', N'Rich, complex maltiness combined with a pronounced yet soft and rounded bitterness and spicy flavor from Saaz hops.  Some diacetyl is acceptable, but need not be present. Bitterness is prominent but never harsh, and does not linger. The aftertaste is balanced between malt and hops. Clean, no fruity esters.', N'Medium-bodied (although diacetyl, if present, may make it seem medium-full), medium carbonation.', N'Crisp, complex and well-rounded yet refreshing.', N'Uses Moravian malted barley and a decoction mash for rich, malt character.  Saaz hops and low sulfate, low carbonate water provide a distinctively soft, rounded hop profile.  Traditional yeast sometimes can provide a background diacetyl note.  Dextrins provide additional body, and diacetyl enhances the perception of a fuller palate.', N'Soft water with low mineral content, Saaz hops, Moravian malted barley, Czech lager yeast.', 1.044, 1.056, 1.013, 1.017, 35, 45, 3.5, 6, 4.2, 5.4, N'Pilsner Urquell, Krušovice Imperial 12°, Budweiser Budvar (Czechvar in the US), Czech Rebel, Staropramen, Gambrinus Pilsner, Zlaty Bazant Golden Pheasant, Dock Street Bohemian Pilsner')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 2, N'Pilsner', N'2C', N'Classic American Pilsner', N'Low to medium grainy, corn-like or sweet maltiness may be evident (although rice-based beers are more neutral).  Medium to moderately high hop aroma, often classic noble hops.  Clean lager character, with no fruitiness or diacetyl.  Some DMS is acceptable.', N'Yellow to deep gold color.  Substantial, long lasting white head.  Bright clarity.', N'Moderate to moderately high maltiness similar in character to the Continental Pilsners but somewhat lighter in intensity due to the use of up to 30% flaked maize (corn) or rice used as an adjunct.  Slight grainy, corn-like sweetness from the use of maize with substantial offsetting hop bitterness.  Rice-based versions are crisper, drier, and often lack corn-like flavors.  Medium to high hop flavor from noble hops (either late addition or first-wort hopped).  Medium to high hop bitterness, which should not be coarse nor have a harsh aftertaste. No fruitiness or diacetyl.  Should be smooth and well-lagered.', N'Medium body and rich, creamy mouthfeel.  Medium to high carbonation levels.', N'A substantial Pilsner that can stand up to the classic European Pilsners, but exhibiting the native American grains and hops available to German brewers who initially brewed it in the USA.   Refreshing, but with the underlying malt and hops that stand out when compared to other modern American light lagers. Maize lends a distinctive grainy sweetness.  Rice contributes a crisper, more neutral character.', N'The classic American Pilsner was brewed both pre-Prohibition and post-Prohibition with some differences.  OGs of 1.050-1.060 would have been appropriate for pre-Prohibition beers while gravities dropped to 1.044-1.048 after Prohibition.  Corresponding IBUs dropped from a pre-Prohibition level of 30-40 to 25-30 after Prohibition.', N'Six-row barley with 20% to 30% flaked maize to dilute the excessive protein levels.  Native American hops such as Clusters, traditional continental noble hops, or modern noble crosses (Ultra, Liberty, Crystal) are also appropriate.  Modern American hops such as Cascade are inappropriate.  Water with a high mineral content can lead to an inappropriate coarseness in flavor and harshness in aftertaste.', 1.044, 1.06, 1.01, 1.015, 25, 40, 3, 6, 4.5, 6, N'Occasional brewpub and microbrewery specials')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 3, N'European Amber Lager', N'3A', N'Vienna Lager', N'Moderately rich German malt aroma (of Vienna and/or Munich malt).  A light toasted malt aroma may be present.  Similar, though less intense than Oktoberfest.  Clean lager character, with no fruity esters or diacetyl.  Noble hop aroma may be low to none.  Caramel aroma is inappropriate.', N': Light reddish amber to copper color. Bright clarity.  Large, off-white, persistent head.', N'Soft, elegant malt complexity is in the forefront, with a firm enough hop bitterness to provide a balanced finish. Some toasted character from the use of Vienna malt.  No roasted or caramel flavor.  Fairly dry finish, with both malt and hop bitterness present in the aftertaste.  Noble hop flavor may be low to none.', N'Medium-light to medium body, with a gentle creaminess.  Moderate carbonation.  Smooth.  Moderately crisp finish.  May have a bit of alcohol warming.', N'Characterized by soft, elegant maltiness that dries out in the finish to avoid becoming sweet.', N'American versions can be a bit stronger, drier and more bitter, while European versions tend to be sweeter.  Many Mexican amber and dark lagers used to be more authentic, but unfortunately are now more like sweet, adjunct-laden American Dark Lagers.  ', N'Vienna malt provides a lightly toasty and complex, melanoidin-rich malt profile.  As with Oktoberfests, only the finest quality malt should be used, along with Continental hops (preferably noble varieties).  Moderately hard, carbonate-rich water.  Can use some caramel malts and/or darker malts to add color and sweetness, but caramel malts shouldn''t add significant aroma and flavor and dark malts shouldn''t provide any roasted character.', 1.046, 1.052, 1.01, 1.014, 18, 30, 10, 16, 4.5, 5.5, N'Great Lakes Eliot Ness (unusual in its 6.2% strength and 35 IBUs), Boulevard Bobs 47 Munich-Style Lager, Negra Modelo, Old Dominion Aviator Amber Lager, Gordon Biersch Vienna Lager, Capital Wisconsin Amber, Olde Saratoga Lager, Penn Pilsner')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 3, N'European Amber Lager', N'3B', N'Oktoberfest/Marzen', N'Rich German malt aroma (of Vienna and/or Munich malt).  A light to moderate toasted malt aroma is often present.  Clean lager aroma with no fruity esters or diacetyl.  No hop aroma.  Caramel aroma is inappropriate.', N'Dark gold to deep orange-red color. Bright clarity, with solid, off-white, foam stand.', N'Initial malty sweetness, but finish is moderately dry.  Distinctive and complex maltiness often includes a toasted aspect.  Hop bitterness is moderate, and noble hop flavor is low to none. Balance is toward malt, though the finish is not sweet.  Noticeable caramel or roasted flavors are inappropriate.  Clean lager character with no diacetyl or fruity esters.', N'Medium body, with a creamy texture and medium carbonation.  Smooth.  Fully fermented, without a cloying finish.', N'Smooth, clean, and rather rich, with a depth of malt character.  This is one of the classic malty styles, with a maltiness that is often described as soft, complex, and elegant but never cloying.', N'Domestic German versions tend to be golden, like a strong Pils-dominated Helles.  Export German versions are typically orange-amber in color, and have a distinctive toasty malt character.  German beer tax law limits the OG of the style at 14°P since it is a vollbier, although American versions can be stronger.  "Fest" type beers are special occasion beers that are usually stronger than their everyday counterparts.', N'Grist varies, although German Vienna malt is often the backbone of the grain bill, with some Munich malt, Pils malt, and possibly some crystal malt. All malt should derive from the finest quality two-row barley. Continental hops, especially noble varieties, are most authentic.  Somewhat alkaline water (up to 300 PPM), with significant carbonate content is welcome.  A decoction mash can help develop the rich malt profile.', 1.05, 1.057, 1.012, 1.016, 20, 28, 7, 14, 4.8, 5.7, N'Paulaner Oktoberfest, Ayinger Oktoberfest-Märzen, Hacker-Pschorr Original Oktoberfest, Hofbräu Oktoberfest, Victory Festbier, Great Lakes Oktoberfest, Spaten Oktoberfest, Capital Oktoberfest, Gordon Biersch Märzen, Goose Island Oktoberfest, Samuel Adams Oktoberfest (a bit unusual in its late hopping)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 4, N'Dark Lager', N'4A', N'Dark American Lager', N'Little to no malt aroma.  Medium-low to no roast and caramel malt aroma.  Hop aroma may range from none to light spicy or floral hop presence.  Can have low levels of yeast character (green apples, DMS, or fruitiness).  No diacetyl.', N'Deep amber to dark brown with bright clarity and ruby highlights.  Foam stand may not be long lasting, and is usually light tan in color.', N'Moderately crisp with some low to moderate levels of sweetness.  Medium-low to no caramel and/or roasted malt flavors (and may include hints of coffee, molasses or cocoa).  Hop flavor ranges from none to low levels.  Hop bitterness at low to medium levels.  No diacetyl.  May have a very light fruitiness.  Burnt or moderately strong roasted malt flavors are a defect.', N'Light to somewhat medium body.  Smooth, although a highly-carbonated beer.', N'A somewhat sweeter version of standard/premium lager with a little more body and flavor.', N'A broad range of international lagers that are darker than pale, and not assertively bitter and/or roasted.', N'Two- or six-row barley, corn or rice as adjuncts.  Light use of caramel and darker malts.  Commercial versions may use coloring agents.', 1.044, 1.056, 1.008, 1.012, 8, 20, 14, 22, 4.2, 6, N'Dixie Blackened Voodoo, Shiner Bock, San Miguel Dark, Baltika #4, Beck''s Dark, Saint Pauli Girl Dark, Warsteiner Dunkel, Heineken Dark Lager, Crystal Diplomat Dark Beer')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 4, N'Dark Lager', N'4B', N'Munich Dunkel', N'Rich, Munich malt sweetness, like bread crusts (and sometimes toast.)  Hints of chocolate, nuts, caramel, and/or toffee are also acceptable.  No fruity esters or diacetyl should be detected, but a slight noble hop aroma is acceptable.', N'Deep copper to dark brown, often with a red or garnet tint.  Creamy, light to medium tan head.  Usually clear, although murky unfiltered versions exist.', N'Dominated by the rich and complex flavor of Munich malt, usually with melanoidins reminiscent of bread crusts.  The taste can be moderately sweet, although it should not be overwhelming or cloying.  Mild caramel, chocolate, toast or nuttiness may be present.  Burnt or bitter flavors from roasted malts are inappropriate, as are pronounced caramel flavors from crystal malt. Hop bitterness is moderately low but perceptible, with the balance tipped firmly towards maltiness.  Noble hop flavor is low to none. Aftertaste remains malty, although the hop bitterness may become more apparent in the medium-dry finish.  Clean lager character with no fruity esters or diacetyl.', N'Medium to medium-full body, providing a firm and dextrinous mouthfeel without being heavy or cloying.  Moderate carbonation.  May have a light astringency and a slight alcohol warming.', N'Characterized by depth and complexity of Munich malt and the accompanying melanoidins.  Rich Munich flavors, but not as intense as a bock or as roasted as a schwarzbier.', N'Unfiltered versions from Germany can taste like liquid bread, with a yeasty, earthy richness not found in exported filtered dunkels.', N'Grist is traditionally made up of German Munich malt (up to 100% in some cases) with the remainder German Pilsner malt.  Small amounts of crystal malt can add dextrins and color but should not introduce excessive residual sweetness. Slight additions of roasted malts (such as Carafa or chocolate) may be used to improve color but should not add strong flavors.  Noble German hop varieties and German lager yeast strains should be used.  Moderately carbonate water.  Often decoction mashed (up to a triple decoction) to enhance the malt flavors and create the depth of color.', 1.048, 1.056, 1.01, 1.016, 18, 28, 14, 28, 4.5, 5.6, N'Ayinger Altbairisch Dunkel, Hacker-Pschorr Alt Munich Dark, Paulaner Alt Münchner Dunkel, Weltenburger Kloster Barock-Dunkel, Ettaler Kloster Dunkel, Hofbräu Dunkel, Penn Dark Lager, König Ludwig Dunkel, Capital Munich Dark, Harpoon Munich-type Dark Beer, Gordon Biersch Dunkels, Dinkel Acker Dark.  In Bavaria, Ettaler Dunkel, Löwenbräu Dunkel, Hartmann Dunkel, Kneitinger Dunkel, Augustiner Dunkel.')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 4, N'Dark Lager', N'4C', N'Schwarzbier (Black Beer)', N'Low to moderate malt, with low aromatic sweetness and/or hints of roast malt often apparent.  The malt can be clean and neutral or rich and Munich-like, and may have a hint of caramel.  The roast can be coffee-like but should never be burnt.  A low noble hop aroma is optional. Clean lager yeast character (light sulfur possible) with no fruity esters or diacetyl.', N'Medium to very dark brown in color, often with deep ruby to garnet highlights, yet almost never truly black.  Very clear.  Large, persistent, tan-colored head.', N'Light to moderate malt flavor, which can have a clean, neutral character to a rich, sweet, Munich-like intensity.  Light to moderate roasted malt flavors can give a bitter-chocolate palate that lasts into the finish, but which are never burnt.  Medium-low to medium bitterness, which can last into the finish.  Light to moderate noble hop flavor.  Clean lager character with no fruity esters or diacetyl.  Aftertaste tends to dry out slowly and linger, featuring hop bitterness with a complementary but subtle roastiness in the background.  Some residual sweetness is acceptable but not required.', N'Medium-light to medium body.  Moderate to moderately high carbonation.  Smooth.  No harshness or astringency, despite the use of dark, roasted malts.', N'A dark German lager that balances roasted yet smooth malt flavors with moderate hop bitterness.', N'In comparison with a Munich Dunkel, usually darker in color, drier on the palate and with a noticeable (but not high) roasted malt edge to balance the malt base.  While sometimes called a "black Pils," the beer is rarely that dark; don''t expect strongly roasted, porter-like flavors.', N'German Munich malt and Pilsner malts for the base, supplemented by a small amount of roasted malts (such as Carafa) for the dark color and subtle roast flavors.  Noble-type German hop varieties and clean German lager yeasts are preferred.', 1.046, 1.052, 1.01, 1.016, 22, 32, 17, 30, 4.4, 5.4, N'Köstritzer Schwarzbier, Kulmbacher Mönchshof Premium Schwarzbier, Samuel Adams Black Lager, Krušovice Cerne, Original Badebier, Einbecker Schwarzbier, Gordon Biersch Schwarzbier, Weeping Radish Black Radish Dark Lager, Sprecher Black Bavarian')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 5, N'Bock', N'5A', N'Maibock/Helles Bock', N'Moderate to strong malt aroma, often with a lightly toasted quality and low melanoidins.  Moderately low to no noble hop aroma, often with a spicy quality.  Clean.  No diacetyl.  Fruity esters should be low to none. Some alcohol may be noticeable.  May have a light DMS aroma from Pils malt.', N'Deep gold to light amber in color.  Lagering should provide good clarity.  Large, creamy, persistent, white head.', N'The rich flavor of continental European pale malts dominates (Pils malt flavor with some toasty notes and/or melanoidins). Little to no caramelization.  May have a light DMS flavor from Pils malt.  Moderate to no noble hop flavor.  May have a low spicy or peppery quality from hops and/or alcohol.  Moderate hop bitterness (more so in the balance than in other bocks).  Clean, with no fruity esters or diacetyl.  Well-attenuated, not cloying, with a moderately dry finish that may taste of both malt and hops.', N'Medium-bodied.  Moderate to moderately high carbonation.  Smooth and clean with no harshness or astringency, despite the increased hop bitterness.  Some alcohol warming may be present.', N'A relatively pale, strong, malty lager beer.  Designed to walk a fine line between blandness and too much color.  Hop character is generally more apparent than in other bocks.', N'Can be thought of as either a pale version of a traditional bock, or a Munich helles brewed to bock strength.  While quite malty, this beer typically has less dark and rich malt flavors than a traditional bock.  May also be drier, hoppier, and more bitter than a traditional bock.  The hops compensate for the lower level of melanoidins.  There is some dispute whether Helles ("pale") Bock and Mai ("May") Bock are synonymous.  Most agree that they are identical (as is the consensus for Märzen and Oktoberfest), but some believe that Maibock is a "fest" type beer hitting the upper limits of hopping and color for the range. Any fruitiness is due to Munich and other specialty malts, not yeast-derived esters developed during fermentation.', N'Base of Pils and/or Vienna malt with some Munich malt to add character (although much less than in a traditional bock).  No non-malt adjuncts.  Noble hops.  Soft water preferred so as to avoid harshness.  Clean lager yeast.  Decoction mash is typical, but boiling is less than in traditional bocks to restrain color development.', 1.064, 1.072, 1.011, 1.018, 23, 35, 6, 11, 6.3, 7.4, N'Ayinger Maibock, Mahr''s Bock, Hacker-Pschorr Hubertus Bock, Capital Maibock, Einbecker Mai-Urbock, Hofbräu Maibock, Victory St. Boisterous, Gordon Biersch Blonde Bock, Smuttynose Maibock')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 5, N'Bock', N'5B', N'Traditional Bock', N'Strong malt aroma, often with moderate amounts of rich melanoidins and/or toasty overtones.  Virtually no hop aroma.  Some alcohol may be noticeable.  Clean.  No diacetyl.  Low to no fruity esters. ', N'Light copper to brown color, often with attractive garnet highlights.  Lagering should provide good clarity despite the dark color.  Large, creamy, persistent, off-white head.', N'Complex maltiness is dominated by the rich flavors of Munich and Vienna malts, which contribute melanoidins and toasty flavors.  Some caramel notes may be present from decoction mashing and a long boil.  Hop bitterness is generally only high enough to support the malt flavors, allowing a bit of sweetness to linger into the finish.  Well-attenuated, not cloying.  Clean, with no esters or diacetyl. No hop flavor.  No roasted or burnt character.', N'Medium to medium-full bodied.  Moderate to moderately low carbonation.  Some alcohol warmth may be found, but should never be hot.  Smooth, without harshness or astringency.', N'A dark, strong, malty lager beer.', N'Decoction mashing and long boiling plays an important part of flavor development, as it enhances the caramel and melanoidin flavor aspects of the malt.  Any fruitiness is due to Munich and other specialty malts, not yeast-derived esters developed during fermentation.', N'Munich and Vienna malts, rarely a tiny bit of dark roasted malts for color adjustment, never any non-malt adjuncts.  Continental European hop varieties are used.  Clean lager yeast.  Water hardness can vary, although moderately carbonate water is typical of Munich.  ', 1.064, 1.072, 1.013, 1.019, 20, 27, 14, 22, 6.3, 7.2, N'Einbecker Ur-Bock Dunkel, Pennsylvania Brewing St. Nick Bock, Aass Bock, Great Lakes Rockefeller Bock, Stegmaier Brewhouse Bock')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 5, N'Bock', N'5C', N'Doppelbock', N'Very strong maltiness.  Darker versions will have significant melanoidins and often some toasty aromas.  A light caramel flavor from a long boil is acceptable.  Lighter versions will have a strong malt presence with some melanoidins and toasty notes.  Virtually no hop aroma, although a light noble hop aroma is acceptable in pale versions.  No diacetyl.  A moderately low fruity aspect to the aroma often described as prune, plum or grape may be present (but is optional) in dark versions due to reactions between malt, the boil, and aging.  A very slight chocolate-like aroma may be present in darker versions, but no roasted or burned aromatics should ever be present.  Moderate alcohol aroma may be present.', N'Deep gold to dark brown in color.  Darker versions often have ruby highlights.  Lagering should provide good clarity.  Large, creamy, persistent head (color varies with base style: white for pale versions, off-white for dark varieties).  Stronger versions might have impaired head retention, and can display noticeable legs.', N'Very rich and malty.  Darker versions will have significant melanoidins and often some toasty flavors.  Lighter versions will a strong malt flavor with some melanoidins and toasty notes.  A very slight chocolate flavor is optional in darker versions, but should never be perceived as roasty or burnt.  Clean lager flavor with no diacetyl.  Some fruitiness (prune, plum or grape) is optional in darker versions.   Invariably there will be an impression of alcoholic strength, but this should be smooth and warming rather than harsh or burning.  Presence of higher alcohols (fusels) should be very low to none.  Little to no hop flavor (more is acceptable in pale versions).  Hop bitterness varies from moderate to moderately low but always allows malt to dominate the flavor.  Most versions are fairly sweet, but should have an impression of attenuation.  The sweetness comes from low hopping, not from incomplete fermentation.  Paler versions generally have a drier finish.', N'Medium-full to full body.  Moderate to moderately-low carbonation.  Very smooth without harshness or astringency.', N'A very strong and rich lager.  A bigger version of either a traditional bock or a helles bock.', N'Most versions are dark colored and may display the caramelizing and melanoidin effect of decoction mashing, but excellent pale versions also exist.  The pale versions will not have the same richness and darker malt flavors of the dark versions, and may be a bit drier, hoppier and more bitter.  While most traditional examples are in the ranges cited, the style can be considered to have no upper limit for gravity, alcohol and bitterness (thus providing a home for very strong lagers). Any fruitiness is due to Munich and other specialty malts, not yeast-derived esters developed during fermentation.', N'Pils and/or Vienna malt for pale versions (with some Munich), Munich and Vienna malts for darker ones and occasionally a tiny bit of darker color malts (such as Carafa).  Noble hops.  Water hardness varies from soft to moderately carbonate.  Clean lager yeast.  Decoction mashing is traditional.', 1.072, 1.112, 1.016, 1.024, 16, 26, 6, 25, 7, 10, N'Paulaner Salvator, Ayinger Celebrator, Weihenstephaner Korbinian, Andechser Doppelbock Dunkel, Spaten Optimator, Tucher Bajuvator, Weltenburger Kloster Asam-Bock, Capital Autumnal Fire, EKU 28, Eggenberg Urbock 23°, Bell''s Consecrator, Moretti La Rossa, Samuel Adams Double Bock')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 5, N'Bock', N'5D', N'Eisbock', N'Dominated by a balance of rich, intense malt and a definite alcohol presence.  No hop aroma.  No diacetyl.  May have significant fruity esters, particularly those reminiscent of plum, prune or grape.  Alcohol aromas should not be harsh or solventy.', N'Deep copper to dark brown in color, often with attractive ruby highlights.  Lagering should provide good clarity.  Head retention may be impaired by higher-than-average alcohol content and low carbonation.  Off-white to deep ivory colored head. Pronounced legs are often evident.', N'Rich, sweet malt balanced by a significant alcohol presence.  The malt can have melanoidins, toasty qualities, some caramel, and occasionally a slight chocolate flavor.  No hop flavor.  Hop bitterness just offsets the malt sweetness enough to avoid a cloying character. No diacetyl.  May have significant fruity esters, particularly those reminiscent of plum, prune or grape.  The alcohol should be smooth, not harsh or hot, and should help the hop bitterness balance the strong malt presence.  The finish should be of malt and alcohol, and can have a certain dryness from the alcohol.  It should not by sticky, syrupy or cloyingly sweet.  Clean, lager character.', N'Full to very full bodied.  Low carbonation.  Significant alcohol warmth without sharp hotness.  Very smooth without harsh edges from alcohol, bitterness, fusels, or other concentrated flavors.', N'An extremely strong, full and malty dark lager.', N'Eisbocks are not simply stronger doppelbocks; the name refers to the process of freezing and concentrating the beer.  Some doppelbocks are stronger than Eisbocks.  Extended lagering is often needed post-freezing to smooth the alcohol and enhance the malt and alcohol balance.  Any fruitiness is due to Munich and other specialty malts, not yeast-derived esters developed during fermentation.', N'Same as doppelbock.  Commercial eisbocks are generally concentrated anywhere from 7% to 33% (by volume).', 1.078, 1.12, 1.02, 1.035, 25, 35, 18, 30, 9, 14, N'Kulmbacher Reichelbräu Eisbock, Eggenberg Urbock Dunkel Eisbock, Niagara Eisbock, Capital Eisphyre, Southampton Eisbock')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 6, N'Light Hybrid Beer', N'6A', N'Cream Ale', N'Faint malt notes.  A sweet, corn-like aroma and low levels of DMS are commonly found.  Hop aroma low to none.  Any variety of hops may be used, but neither hops nor malt dominate.  Faint esters may be present in some examples, but are not required.  No diacetyl.', N'Pale straw to moderate gold color, although usually on the pale side.  Low to medium head with medium to high carbonation.  Head retention may be no better than fair due to adjunct use.  Brilliant, sparkling clarity.', N'Low to medium-low hop bitterness. Low to moderate maltiness and sweetness, varying with gravity and attenuation.  Usually well attenuated.  Neither malt nor hops prevail in the taste.  A low to moderate corny flavor from corn adjuncts is commonly found, as is some DMS.  Finish can vary from somewhat dry to faintly sweet from the corn, malt, and sugar.  Faint fruity esters are optional.  No diacetyl.', N'Generally light and crisp, although body can reach medium.  Smooth mouthfeel with medium to high attenuation; higher attenuation levels can lend a "thirst quenching" finish.  High carbonation.  Higher gravity examples may exhibit a slight alcohol warmth.', N'A clean, well-attenuated, flavorful American lawnmower beer.', N'Classic American (i.e., pre-prohibition) Cream Ales were slightly stronger, hoppier (including some dry hopping) and more bitter (25-30+ IBUs).  These versions should be entered in the specialty/experimental category.  Most commercial examples are in the 1.050-1.053 OG range, and bitterness rarely rises above 20 IBUs.', N'American ingredients most commonly used.  A grain bill of six-row malt, or a combination of six-row and North American two-row, is common.  Adjuncts can include up to 20% flaked maize in the mash, and up to 20% glucose or other sugars in the boil.  Soft water preferred.  Any variety of hops can be used for bittering and finishing.', 1.042, 1.055, 1.006, 1.012, 15, 20, 3, 5, 4.2, 5.6, N'Genesee Cream Ale, Little Kings Cream Ale (Hudepohl), Anderson Valley Summer Solstice Cerveza Crema, Sleeman Cream Ale, New Glarus Spotted Cow, Wisconsin Brewing Whitetail Cream Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 6, N'Light Hybrid Beer', N'6B', N'Blonde Ale', N'Light to moderate sweet malty aroma.  Low to moderate fruitiness is optional, but acceptable.  May have a low to medium hop aroma, and can reflect almost any hop variety.  No diacetyl.', N'Light yellow to deep gold in color.  Clear to brilliant.  Low to medium white head with fair to good retention.', N'Initial soft malty sweetness, but optionally some light character malt flavor (e.g., bread, toast, biscuit, wheat) can also be present.  Caramel flavors typically absent.  Low to medium esters optional, but are commonly found in many examples.  Light to moderate hop flavor (any variety), but shouldn''t be overly aggressive.  Low to medium bitterness, but the balance is normally towards the malt.  Finishes medium-dry to somewhat sweet.  No diacetyl.', N'Medium-light to medium body.  Medium to high carbonation.  Smooth without harsh bitterness or astringency.', N'Easy-drinking, approachable, malt-oriented American craft beer.', N'In addition to the more common American Blonde Ale, this category can also include modern English Summer Ales, American Kölsch-style beers, and less assertive American and English pale ales.', N'Generally all malt, but can include up to 25% wheat malt and some sugar adjuncts.  Any hop variety can be used.  Clean American, lightly fruity English, or Kölsch yeast.  May also be made with lager yeast, or cold-conditioned.  Some versions may have honey, spices and/or fruit added, although if any of these ingredients are stronger than a background flavor they should be entered in specialty, spiced or fruit beer categories instead.  Extract versions should only use the lightest malt extracts and avoid kettle caramelization.', 1.038, 1.054, 1.008, 1.013, 15, 28, 3, 6, 3.8, 5.5, N'Pelican Kiwanda Cream Ale, Russian River Aud Blonde, Rogue Oregon Golden Ale, Widmer Blonde Ale, Fuller''s Summer Ale, Hollywood Blonde, Redhook Blonde')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 6, N'Light Hybrid Beer', N'6C', N'K�lsch', N'Very low to no Pils malt aroma.  A pleasant, subtle fruit aroma from fermentation (apple, cherry or pear) is acceptable, but not always present.  A low noble hop aroma is optional but not out of place (it is present only in a small minority of authentic versions).  Some yeasts may give a slight winy or sulfury character (this characteristic is also optional, but not a fault).', N'Very pale gold to light gold.  Authentic versions are filtered to a brilliant clarity.  Has a delicate white head that may not persist.', N'Soft, rounded palate comprising of a delicate flavor balance between soft yet attenuated malt, an almost imperceptible fruity sweetness from fermentation, and a medium-low to medium bitterness with a delicate dryness and slight pucker in the finish (but no harsh aftertaste).  The noble hop flavor is variable, and can range from low to moderately high; most are medium-low to medium.  One or two examples (Dom being the most prominent) are noticeably malty-sweet up front.  Some versions can have a slightly minerally or sulfury water or yeast character that accentuates the dryness and flavor balance. Some versions may have a slight wheat taste, although this is quite rare.  Otherwise very clean with no diacetyl or fusels.', N'Smooth and crisp.  Medium-light body, although a few versions may be medium.  Medium to medium-high carbonation.  Generally well-attenuated.', N'A clean, crisp, delicately balanced beer usually with very subtle fruit flavors and aromas.  Subdued maltiness throughout leads to a pleasantly refreshing tang in the finish.  To the untrained taster easily mistaken for a light lager, a somewhat subtle Pilsner, or perhaps a blonde ale.', N'Served in a tall, narrow 200ml glass called a "Stange."  Each Köln brewery produces a beer of different character, and each interprets the Konvention slightly differently.  Allow for a range of variation within the style when judging.  Note that drier versions may seem hoppier or more bitter than the IBU specifications might suggest.  Due to its delicate flavor profile, Kölsch tends to have a relatively short shelf-life; older examples can show some oxidation defects.  Some Köln breweries (e.g., Dom, Hellers) are now producing young, unfiltered versions known as Wiess (which should not be entered in this category).', N'German noble hops (Hallertau, Tettnang, Spalt or Hersbrucker).  German Pils or pale malt.  Attenuative, clean ale yeast.  Up to 20% wheat may be used, but this is quite rare in authentic versions.  Water can vary from extremely soft to moderately hard.  Traditionally uses a step mash program, although good results can be obtained using a single rest at 149°F.  Fermented at cool ale temperatures (59-65°F) and lagered for at least a month, although many Cologne brewers ferment at 70°F and lager for no more than two weeks.', 1.044, 1.05, 1.007, 1.011, 20, 30, 4, 5, 4.4, 5.2, N'Available in Cologne only: PJ Früh, Hellers, Malzmühle, Paeffgen, Sion, Peters, Dom; import versions available in parts of North America: Reissdorf, Gaffel; Non-German versions: Eisenbahn Dourada, Goose Island Summertime, Alaska Summer Ale, Harpoon Summer Beer, New Holland Lucid, Saint Arnold Fancy Lawnmower, Capitol City Capitol Kölsch, Shiner Kölsch')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 6, N'Light Hybrid Beer', N'6D', N'American Wheat or Rye Beer', N'Low to moderate grainy wheat or rye character.  Some malty sweetness is acceptable.  Esters can be moderate to none, although should reflect American yeast strains.  The clove and banana aromas common to German hefeweizens are inappropriate.  Hop aroma may be low to moderate, and can have either a citrusy American or a spicy or floral noble hop character.  Slight crisp sharpness is optional.  No diacetyl.', N'Usually pale yellow to gold.  Clarity may range from brilliant to hazy with yeast approximating the German hefeweizen style of beer.  Big, long-lasting white head.', N'Light to moderately strong grainy wheat or rye flavor, which can linger into the finish.  Rye versions are richer and spicier than wheat.  May have a moderate malty sweetness or finish quite dry.  Low to moderate hop bitterness, which sometimes lasts into the finish.  Low to moderate hop flavor (citrusy American or spicy/floral noble).  Esters can be moderate to none, but should not take on a German Weizen character (banana).  No clove phenols, although a light spiciness from wheat or rye is acceptable.  May have a slightly crisp or sharp finish.  No diacetyl.', N'Medium-light to medium body.  Medium-high to high carbonation.  May have a light alcohol warmth in stronger examples.', N'Refreshing wheat or rye beers that can display more hop character and less yeast character than their German cousins.', N'Different variations exist, from an easy-drinking fairly sweet beer to a dry, aggressively hopped beer with a strong wheat or rye flavor.  Dark versions approximating dunkelweizens (with darker, richer malt flavors in addition to the color) should be entered in the Specialty Beer category. THE BREWER SHOULD SPECIFY IF RYE IS USED; IF NO DOMINANT GRAIN IS SPECIFIED, WHEAT WILL BE ASSUMED.', N'Clean American ale yeast, but also can be made as a lager. Large proportion of wheat malt (often 50% or more, but this isn''t a legal requirement as in Germany).  American or noble hops.  American Rye Beers can follow the same general guidelines, substituting rye for some or all of the wheat.  Other base styles (e.g., IPA, stout) with a noticeable rye character should be entered in the Specialty Beer category (23).', 1.04, 1.055, 1.008, 1.013, 15, 30, 3, 6, 4, 5.5, N'Bell''s Oberon, Harpoon UFO Hefeweizen, Three Floyds Gumballhead, Pyramid Hefe-Weizen, Widmer Hefeweizen, Sierra Nevada Unfiltered Wheat Beer, Anchor Summer Beer, Redhook Sunrye, Real Ale Full Moon Pale Rye')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 7, N'Amber Hybrid Beer', N'7A', N'Northern German Altbier', N'Subtle malty, sometimes grainy aroma.  Low to no noble hop aroma.  Clean, lager character with very restrained ester profile.  No diacetyl.', N'Light copper to light brown color; very clear from extended cold conditioning. Low to moderate off-white to white head with good retention.', N'Fairly bitter yet balanced by a smooth and sometimes sweet malt character that may have a rich, biscuity and/or lightly caramelly flavor.  Dry finish often with lingering bitterness.  Clean, lager character sometimes with slight sulfury notes and very low to no esters.  Very low to medium noble hop flavor.  No diacetyl.', N'Medium-light to medium body.  Moderate to moderately high carbonation.  Smooth mouthfeel.', N'A very clean and relatively bitter beer, balanced by some malt character.  Generally darker, sometimes more caramelly, and usually sweeter and less bitter than Düsseldorf Altbier.', N'Most Altbiers produced outside of Düsseldorf are of the Northern German style.   Most are simply moderately bitter brown lagers.  Ironically "alt" refers to the old style of brewing (i.e., making ales), which makes the term "Altbier" somewhat inaccurate and inappropriate.  Those that are made as ales are fermented at cool ale temperatures and lagered at cold temperatures (as with Düsseldorf Alt).', N'Typically made with a Pils base and colored with roasted malt or dark crystal.  May include small amounts of Munich or Vienna malt.  Noble hops.  Usually made with an attenuative lager yeast.', 1.046, 1.054, 1.01, 1.015, 25, 40, 13, 19, 4.5, 5.2, N'DAB Traditional, Hannen Alt, Schwelmer Alt, Grolsch Amber, Alaskan Amber, Long Trail Ale, Otter Creek Copper Ale, Schmaltz'' Alt')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 7, N'Amber Hybrid Beer', N'7B', N'California Common Beer', N'Typically showcases the signature Northern Brewer hops (with woody, rustic or minty qualities) in moderate to high strength.  Light fruitiness acceptable.  Low to moderate caramel and/or toasty malt aromatics support the hops.  No diacetyl.', N'Medium amber to light copper color.  Generally clear.  Moderate off-white head with good retention.', N'Moderately malty with a pronounced hop bitterness.  The malt character is usually toasty (not roasted) and caramelly.  Low to moderately high hop flavor, usually showing Northern Brewer qualities (woody, rustic, minty).  Finish fairly dry and crisp, with a lingering hop bitterness and a firm, grainy malt flavor.  Light fruity esters are acceptable, but otherwise clean.  No diacetyl.', N'Medium-bodied.  Medium to medium-high carbonation.', N'A lightly fruity beer with firm, grainy maltiness, interesting toasty and caramel flavors, and showcasing the signature Northern Brewer varietal hop character.', N'This style is narrowly defined around the prototypical Anchor Steam example.  Superficially similar to an American pale or amber ale, yet differs in that the hop flavor/aroma is woody/minty rather than citrusy, malt flavors are toasty and caramelly, the hopping is always assertive, and a warm-fermented lager yeast is used.', N'Pale ale malt, American hops (usually Northern Brewer, rather than citrusy varieties), small amounts of toasted malt and/or crystal malts.  Lager yeast, however some strains (often with the mention of "California" in the name) work better than others at the warmer fermentation temperatures (55 to 60°F) used.  Note that some German yeast strains produce inappropriate sulfury character.  Water should have relatively low sulfate and low to moderate carbonate levels.', 1.048, 1.054, 1.011, 1.014, 30, 45, 10, 14, 4.5, 5.5, N'Anchor Steam, Southampton Steem Beer, Flying Dog Old Scratch Amber Lager')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 7, N'Amber Hybrid Beer', N'7C', N'D�sseldorf Altbier', N'Clean yet robust and complex aroma of rich malt, noble hops and restrained fruity esters.  The malt character reflects German base malt varieties.  The hop aroma may vary from moderate to very low, and can have a peppery, floral or perfumy character associated with noble hops.  No diacetyl.', N'Light amber to orange-bronze to deep copper color, yet stopping short of brown.  Brilliant clarity (may be filtered). Thick, creamy, long-lasting off-white head.', N'Assertive hop bitterness well balanced by a sturdy yet clean and crisp malt character.  The malt presence is moderated by moderately-high to high attenuation, but considerable rich and complex malt flavors remain.  Some fruity esters may survive the lagering period.  A long-lasting, medium-dry to dry, bittersweet or nutty finish reflects both the hop bitterness and malt complexity.  Noble hop flavor can be moderate to low.  No roasted malt flavors or harshness.  No diacetyl.  Some yeast strains may impart a slight sulfury character.  A light minerally character is also sometimes present in the finish, but is not required.  The apparent bitterness level is sometimes masked by the high malt character; the bitterness can seem as low as moderate if the finish is not very dry.', N'Medium-bodied.  Smooth.  Medium to medium-high carbonation.  Astringency low to none.  Despite being very full of flavor, is light bodied enough to be consumed as a session beer in its home brewpubs in Düsseldorf.', N'A well balanced, bitter yet malty, clean, smooth, well-attenuated amber-colored German ale.', N'A bitter beer balanced by a pronounced malt richness.  Fermented at cool ale temperature (60-65°F), and lagered at cold temperatures to produce a cleaner, smoother palate than is typical for most ales.   Common variants include Sticke ("secret") alt, which is slightly stronger, darker, richer and more complex than typical alts.  Bitterness rises up to 60 IBUs and is usually dry hopped and lagered for a longer time.  Münster alt is typically lower in gravity and alcohol, sour, lighter in color (golden), and can contain a significant portion of wheat.  Both Sticke alt and Münster alt should be entered in the specialty category.', N'Grists vary, but usually consist of German base malts (usually Pils, sometimes Munich) with small amounts of crystal, chocolate, and/or black malts used to adjust color.  Occasionally will include some wheat.  Spalt hops are traditional, but other noble hops can also be used.  Moderately carbonate water.  Clean, highly attenuative ale yeast.  A step mash or decoction mash program is traditional.', 1.046, 1.054, 1.01, 1.015, 35, 50, 11, 17, 4.5, 5.2, N'Altstadt brewpubs: Zum Uerige, Im Füchschen, Schumacher, Zum Schlüssel; other examples: Diebels Alt, Schlösser Alt, Frankenheim Alt')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 8, N'English Pale Ale', N'8A', N'Standard/Ordinary Bitter', N'The best examples have some malt aroma, often (but not always) with a caramel quality.  Mild to moderate fruitiness is common. Hop aroma can range from moderate to none (UK varieties typically, although US varieties may be used).  Generally no diacetyl, although very low levels are allowed.', N'Light yellow to light copper.  Good to brilliant clarity.  Low to moderate white to off-white head.  May have very little head due to low carbonation.', N'Medium to high bitterness.  Most have moderately low to moderately high fruity esters.  Moderate to low hop flavor (earthy, resiny, and/or floral UK varieties typically, although US varieties may be used).  Low to medium maltiness with a dry finish.  Caramel flavors are common but not required.  Balance is often decidedly bitter, although the bitterness should not completely overpower the malt flavor, esters and hop flavor.  Generally no diacetyl, although very low levels are allowed.', N'Light to medium-light body.  Carbonation low, although bottled and canned examples can have moderate carbonation.', N'Low gravity, low alcohol levels and low carbonation make this an easy-drinking beer.  Some examples can be more malt balanced, but this should not override the overall bitter impression.  Drinkability is a critical component of the style; emphasis is still on the bittering hop addition as opposed to the aggressive middle and late hopping seen in American ales.', N'The lightest of the bitters.  Also known as just "bitter."  Some modern variants are brewed exclusively with pale malt and are known as golden or summer bitters.  Most bottled or kegged versions of UK-produced bitters are higher-alcohol versions of their cask (draught) products produced specifically for export.  The IBU levels are often not adjusted, so the versions available in the US often do not directly correspond to their style subcategories in Britain.  This style guideline reflects the "real ale" version of the style, not the export formulations of commercial products.', N'Pale ale, amber, and/or crystal malts, may use a touch of black malt for color adjustment.  May use sugar adjuncts, corn or wheat.  English hops most typical, although American and European varieties are becoming more common (particularly in the paler examples).  Characterful English yeast.  Often medium sulfate water is used.', 1.032, 1.04, 1.007, 1.011, 25, 35, 4, 14, 3.2, 3.8, N'Fuller''s Chiswick Bitter, Adnams Bitter, Young''s Bitter, Greene King IPA, Oakham Jeffrey Hudson Bitter (JHB), Brains Bitter, Tetley�s Original Bitter, Brakspear Bitter, Boddington''s Pub Draught ')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 8, N'English Pale Ale', N'8B', N'Special/Best/Premium Bitter', N'The best examples have some malt aroma, often (but not always) with a caramel quality.  Mild to moderate fruitiness.  Hop aroma can range from moderate to none (UK varieties typically, although US varieties may be used).  Generally no diacetyl, although very low levels are allowed.', N'Medium gold to medium copper.  Good to brilliant clarity.  Low to moderate white to off-white head.  May have very little head due to low carbonation.', N'Medium to high bitterness.  Most have moderately low to moderately high fruity esters.  Moderate to low hop flavor (earthy, resiny, and/or floral UK varieties typically, although US varieties may be used).  Low to medium maltiness with a dry finish.  Caramel flavors are common but not required.  Balance is often decidedly bitter, although the bitterness should not completely overpower the malt flavor, esters and hop flavor.  Generally no diacetyl, although very low levels are allowed.', N'Medium-light to medium body. Carbonation low, although bottled and canned commercial examples can have moderate carbonation.', N'A flavorful, yet refreshing, session beer.  Some examples can be more malt balanced, but this should not override the overall bitter impression.  Drinkability is a critical component of the style; emphasis is still on the bittering hop addition as opposed to the aggressive middle and late hopping seen in American ales.', N'More evident malt flavor than in an ordinary bitter, this is a stronger, session-strength ale. Some modern variants are brewed exclusively with pale malt and are known as golden or summer bitters.  Most bottled or kegged versions of UK-produced bitters are higher-alcohol versions of their cask (draught) products produced specifically for export.  The IBU levels are often not adjusted, so the versions available in the US often do not directly correspond to their style subcategories in Britain.  This style guideline reflects the "real ale" version of the style, not the export formulations of commercial products.', N'Pale ale, amber, and/or crystal malts, may use a touch of black malt for color adjustment.  May use sugar adjuncts, corn or wheat.  English hops most typical, although American and European varieties are becoming more common (particularly in the paler examples).  Characterful English yeast.  Often medium sulfate water is used.', 1.04, 1.048, 1.008, 1.012, 25, 40, 5, 16, 3.8, 4.6, N'Fuller''s London Pride, Coniston Bluebird Bitter, Timothy Taylor Landlord, Adnams SSB, Young''s Special, Shepherd Neame Masterbrew Bitter, Greene King Ruddles County Bitter, RCH Pitchfork Rebellious Bitter, Brains SA, Black Sheep Best Bitter, Goose Island Honkers Ale, Rogue Younger''s Special Bitter')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 8, N'English Pale Ale', N'8C', N'Extra Special/Strong Bitter (English Pale Ale)', N'Hop aroma moderately-high to moderately-low, and can use any variety of hops although UK hops are most traditional.  Medium to medium-high malt aroma, often with a low to moderately strong caramel component (although this character will be more subtle in paler versions). Medium-low to medium-high fruity esters.  Generally no diacetyl, although very low levels are allowed.   May have light, secondary notes of sulfur and/or alcohol in some examples (optional).', N'Golden to deep copper.  Good to brilliant clarity.  Low to moderate white to off-white head.  A low head is acceptable when carbonation is also low.', N'Medium-high to medium bitterness with supporting malt flavors evident.  Normally has a moderately low to somewhat strong caramelly malt sweetness.  Hop flavor moderate to moderately high (any variety, although earthy, resiny, and/or floral UK hops are most traditional).  Hop bitterness and flavor should be noticeable, but should not totally dominate malt flavors.  May have low levels of secondary malt flavors (e.g., nutty, biscuity) adding complexity.  Moderately-low to high fruity esters.  Optionally may have low amounts of alcohol, and up to a moderate minerally/sulfury flavor.  Medium-dry to dry finish (particularly if sulfate water is used).  Generally no diacetyl, although very low levels are allowed.', N'Medium-light to medium-full body.  Low to moderate carbonation, although bottled commercial versions will be higher.  Stronger versions may have a slight alcohol warmth but this character should not be too high.', N'An average-strength to moderately-strong English ale. The balance may be fairly even between malt and hops to somewhat bitter.  Drinkability is a critical component of the style; emphasis is still on the bittering hop addition as opposed to the aggressive middle and late hopping seen in American ales.  A rather broad style that allows for considerable interpretation by the brewer.', N'More evident malt and hop flavors than in a special or best bitter.  Stronger versions may overlap somewhat with old ales, although strong bitters will tend to be paler and more bitter.  Fuller''s ESB is a unique beer with a very large, complex malt profile not found in other examples; most strong bitters are fruitier and hoppier. Judges should not judge all beers in this style as if they were Fuller''s ESB clones.  Some modern English variants are brewed exclusively with pale malt and are known as golden or summer bitters. Most bottled or kegged versions of UK-produced bitters are higher-alcohol versions of their cask (draught) products produced specifically for export.  The IBU levels are often not adjusted, so the versions available in the US often do not directly correspond to their style subcategories in Britain.  English pale ales are generally considered a premium, export-strength pale, bitter beer that roughly approximates a strong bitter, although reformulated for bottling (including containing higher carbonation).', N'Pale ale, amber, and/or crystal malts, may use a touch of black malt for color adjustment.  May use sugar adjuncts, corn or wheat.  English hops most typical, although American and European varieties are becoming more common (particularly in the paler examples).  Characterful English yeast.  "Burton" versions use medium to high sulfate water.', 1.048, 1.06, 1.01, 1.016, 30, 50, 6, 18, 4.6, 6.2, N'Examples: Fullers ESB, Adnams Broadside, Shepherd Neame Bishop''s Finger, Young''s Ram Rod, Samuel Smith''s Old Brewery Pale Ale, Bass Ale, Whitbread Pale Ale, Shepherd Neame Spitfire, Marston''s Pedigree, Black Sheep Ale, Vintage Henley, Mordue Workie Ticket, Morland Old Speckled Hen, Greene King Abbot Ale, Bateman''s  XXXB, Gale''s Hordean Special Bitter (HSB), Ushers 1824 Particular Ale, Hopback Summer Lightning, Great Lakes Moondog Ale, Shipyard Old Thumper, Alaskan ESB, Geary''s Pale Ale, Cooperstown Old Slugger, Anderson Valley Boont ESB, Avery 14''er ESB, Redhook ESB')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 9, N'Scottish and Irish Ale', N'9A', N'Scottish Light 60/-', N'Low to medium malty sweetness, sometimes accentuated by low to moderate kettle caramelization.  Some examples have a low hop aroma, light fruitiness, low diacetyl, and/or a low to moderate peaty aroma (all are optional).  The peaty aroma is sometimes perceived as earthy, smoky or very lightly roasted.', N'Deep amber to dark copper. Usually very clear due to long, cool fermentations.  Low to moderate, creamy off-white to light tan-colored head.', N'Malt is the primary flavor, but isn''t overly strong.  The initial malty sweetness is usually accentuated by a low to moderate kettle caramelization, and is sometimes accompanied by a low diacetyl component.  Fruity esters may be moderate to none.  Hop bitterness is low to moderate, but the balance will always be towards the malt (although not always by much).  Hop flavor is low to none.  A low to moderate peaty character is optional, and may be perceived as earthy or smoky. Generally has a grainy, dry finish due to small amounts of unmalted roasted barley.', N'Medium-low to medium body. Low to moderate carbonation.  Sometimes a bit creamy, but often quite dry due to use of roasted barley.', N'Cleanly malty with a drying finish, perhaps a few esters, and on occasion a faint bit of peaty earthiness (smoke).  Most beers finish fairly dry considering their relatively sweet palate, and as such have a different balance than strong Scotch ales.', N'The malt-hop balance is slightly to moderately tilted towards the malt side. Any caramelization comes from kettle caramelization and not caramel malt (and is sometimes confused with diacetyl).  Although unusual, any smoked character is yeast- or water-derived and not from the use of peat-smoked malts.  Use of peat-smoked malt to replicate the peaty character should be restrained; overly smoky beers should be entered in the Other Smoked Beer category (22B) rather than here.', N'Scottish or English pale base malt. Small amounts of roasted barley add color and flavor, and lend a dry, slightly roasty finish. English hops. Clean, relatively un-attenuative ale yeast. Some commercial brewers add small amounts of crystal, amber, or wheat malts, and adjuncts such as sugar.  The optional peaty, earthy and/or smoky character comes from the traditional yeast and from the local malt and water rather than using smoked malts.', 1.03, 1.035, 1.01, 1.013, 10, 20, 9, 17, 2.5, 3.2, N'Belhaven 60/-, McEwan''s 60/-, Maclay 60/- Light (all are cask-only products not exported to the US)')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 9, N'Scottish and Irish Ale', N'9B', N'Scottish Heavy 70/-', N'Low to medium malty sweetness, sometimes accentuated by low to moderate kettle caramelization.  Some examples have a low hop aroma, light fruitiness, low diacetyl, and/or a low to moderate peaty aroma (all are optional).  The peaty aroma is sometimes perceived as earthy, smoky or very lightly roasted.', N'Deep amber to dark copper. Usually very clear due to long, cool fermentations.  Low to moderate, creamy off-white to light tan-colored head.', N'Malt is the primary flavor, but isn''t overly strong.  The initial malty sweetness is usually accentuated by a low to moderate kettle caramelization, and is sometimes accompanied by a low diacetyl component.  Fruity esters may be moderate to none.  Hop bitterness is low to moderate, but the balance will always be towards the malt (although not always by much).  Hop flavor is low to none.  A low to moderate peaty character is optional, and may be perceived as earthy or smoky. Generally has a grainy, dry finish due to small amounts of unmalted roasted barley.', N'Medium-low to medium body. Low to moderate carbonation.  Sometimes a bit creamy, but often quite dry due to use of roasted barley.', N'Cleanly malty with a drying finish, perhaps a few esters, and on occasion a faint bit of peaty earthiness (smoke).  Most beers finish fairly dry considering their relatively sweet palate, and as such have a different balance than strong Scotch ales.', N'The malt-hop balance is slightly to moderately tilted towards the malt side. Any caramelization comes from kettle caramelization and not caramel malt (and is sometimes confused with diacetyl).  Although unusual, any smoked character is yeast- or water-derived and not from the use of peat-smoked malts.  Use of peat-smoked malt to replicate the peaty character should be restrained; overly smoky beers should be entered in the Other Smoked Beer category (22B) rather than here.', N'Scottish or English pale base malt. Small amounts of roasted barley add color and flavor, and lend a dry, slightly roasty finish. English hops. Clean, relatively un-attenuative ale yeast. Some commercial brewers add small amounts of crystal, amber, or wheat malts, and adjuncts such as sugar.  The optional peaty, earthy and/or smoky character comes from the traditional yeast and from the local malt and water rather than using smoked malts.', 1.035, 1.04, 1.01, 1.015, 10, 25, 9, 17, 3.2, 3.9, N'Caledonian 70/- (Caledonian Amber Ale in the US), Belhaven 70/-, Orkney Raven Ale, Maclay 70/-, Tennents Special, Broughton Greenmantle Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 9, N'Scottish and Irish Ale', N'9C', N'Scottish Export 80/-', N'Low to medium malty sweetness, sometimes accentuated by low to moderate kettle caramelization.  Some examples have a low hop aroma, light fruitiness, low diacetyl, and/or a low to moderate peaty aroma (all are optional).  The peaty aroma is sometimes perceived as earthy, smoky or very lightly roasted.', N'Deep amber to dark copper. Usually very clear due to long, cool fermentations.  Low to moderate, creamy off-white to light tan-colored head.', N'Malt is the primary flavor, but isn''t overly strong.  The initial malty sweetness is usually accentuated by a low to moderate kettle caramelization, and is sometimes accompanied by a low diacetyl component.  Fruity esters may be moderate to none.  Hop bitterness is low to moderate, but the balance will always be towards the malt (although not always by much).  Hop flavor is low to none.  A low to moderate peaty character is optional, and may be perceived as earthy or smoky. Generally has a grainy, dry finish due to small amounts of unmalted roasted barley.  ', N'Medium-low to medium body. Low to moderate carbonation.  Sometimes a bit creamy, but often quite dry due to use of roasted barley.', N'Cleanly malty with a drying finish, perhaps a few esters, and on occasion a faint bit of peaty earthiness (smoke).  Most beers finish fairly dry considering their relatively sweet palate, and as such have a different balance than strong Scotch ales.', N'The malt-hop balance is slightly to moderately tilted towards the malt side. Any caramelization comes from kettle caramelization and not caramel malt (and is sometimes confused with diacetyl).  Although unusual, any smoked character is yeast- or water-derived and not from the use of peat-smoked malts.  Use of peat-smoked malt to replicate the peaty character should be restrained; overly smoky beers should be entered in the Other Smoked Beer category (22B) rather than here.  ', N'Scottish or English pale base malt. Small amounts of roasted barley add color and flavor, and lend a dry, slightly roasty finish. English hops. Clean, relatively un-attenuative ale yeast. Some commercial brewers add small amounts of crystal, amber, or wheat malts, and adjuncts such as sugar.  The optional peaty, earthy and/or smoky character comes from the traditional yeast and from the local malt and water rather than using smoked malts.', 1.04, 1.054, 1.01, 1.016, 15, 30, 9, 17, 3.9, 5, N'Orkney Dark Island, Caledonian 80/- Export Ale, Belhaven 80/- (Belhaven Scottish Ale in the US), Southampton 80 Shilling, Broughton Exciseman''s 80/-, Belhaven St. Andrews Ale, McEwan''s Export (IPA), Inveralmond Lia Fail, Broughton Merlin''s Ale, Arran Dark')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 9, N'Scottish and Irish Ale', N'9D', N'Irish Red Ale', N'Low to moderate malt aroma, generally caramel-like but occasionally toasty or toffee-like in nature.  May have a light buttery character (although this is not required).  Hop aroma is low to none (usually not present).  Quite clean.', N'Amber to deep reddish copper color (most examples have a deep reddish hue).  Clear.  Low off-white to tan colored head.', N'Moderate caramel malt flavor and sweetness, occasionally with a buttered toast or toffee-like quality.  Finishes with a light taste of roasted grain, which lends a characteristic dryness to the finish.  Generally no flavor hops, although some examples may have a light English hop flavor.  Medium-low hop bitterness, although light use of roasted grains may increase the perception of bitterness to the medium range.  Medium-dry to dry finish.  Clean and smooth (lager versions can be very smooth).  No esters.', N'Medium-light to medium body, although examples containing low levels of diacetyl may have a slightly slick mouthfeel.  Moderate carbonation.  Smooth.  Moderately attenuated (more so than Scottish ales).  May have a slight alcohol warmth in stronger versions.', N'An easy-drinking pint.  Malt-focused with an initial sweetness and a roasted dryness in the finish.', N'Sometimes brewed as a lager (if so, generally will not exhibit a diacetyl character).  When served too cold, the roasted character and bitterness may seem more elevated.', N'May contain some adjuncts (corn, rice, or sugar), although excessive adjunct use will harm the character of the beer.  Generally has a bit of roasted barley to provide reddish color and dry roasted finish.  UK/Irish malts, hops, yeast.', 1.044, 1.06, 1.01, 1.014, 17, 28, 9, 18, 4, 6, N'Three Floyds Brian Boru Old Irish Ale, Great Lakes Conway''s Irish Ale (a bit strong at 6.5%), Kilkenny Irish Beer, O''Hara''s Irish Red Ale, Smithwick''s Irish Ale, Beamish Red Ale, Caffrey''s Irish Ale, Goose Island Kilgubbin Red Ale, Murphy''s Irish Red (lager), Boulevard Irish Ale, Harpoon Hibernian Ale')
GO
INSERT [dbo].[BjcpStyle] ([Class], [CategoryID], [CategoryName], [SubCategoryID], [SubCategoryName], [aroma], [appearance], [flavor], [mouthfeel], [impression], [comments], [ingredients], [og_low], [og_high], [fg_low], [fg_high], [ibu_low], [ibu_high], [srm_low], [srm_high], [abv_low], [abv_high], [examples]) VALUES (N'beer', 9, N'Scottish and Irish Ale', N'9E', N'Strong Scotch Ale', N'Deeply malty, with caramel often apparent. Peaty, earthy and/or smoky secondary aromas may also be present, adding complexity.  Caramelization often is mistaken for diacetyl, which should be low to none.  Low to moderate esters and alcohol are often present in stronger versions.  Hops are very low to none.', N'Light copper to dark brown color, often with deep ruby highlights.  Clear.  Usually has a large tan head, which may not persist in stronger versions.  Legs may be evident in stronger versions.', N'Richly malty with kettle caramelization often apparent (particularly in stronger versions).  Hints of roasted malt or smoky flavor may be present, as may some nutty character, all of which may last into the finish.  Hop flavors and bitterness are low to medium-low, so malt impression should dominate.  Diacetyl is low to none, although caramelization may sometimes be mistaken for it.  Low to moderate esters and alcohol are usually present.  Esters may suggest plums, raisins or dried fruit.  The palate is usually full and sweet, but the finish may be sweet to medium-dry (from light use of roasted barley).', N'Medium-full to full-bodied, with some versions (but not all) having a thick, chewy viscosity. A smooth, alcoholic warmth is usually present and is quite welcome since it balances the malty sweetness.  Moderate carbonation.', N'Rich, malty and usually sweet, which can be suggestive of a dessert. Complex secondary malt flavors prevent a one-dimensional impression.  Strength and maltiness can vary.', N'Also known as a "wee heavy."  Fermented at cooler temperatures than most ales, and with lower hopping rates, resulting in clean, intense malt flavors.  Well suited to the region of origin, with abundant malt and cool fermentation and aging temperature.  Hops, which are not native to Scotland and formerly expensive to import, were kept to a minimum.', N'Well-modified pale malt, with up to 3% roasted barley.  May use some crystal malt for color adjustment; sweetness usually comes not from crystal malts rather from low hopping, high mash temperatures, and kettle caramelization. A small proportion of smoked malt may add depth, though a peaty character (sometimes perceived as earthy or smoky) may also originate from the yeast and native water. Hop presence is minimal, although English varieties are most authentic. Fairly soft water is typical.', 1.07, 1.13, 1.018, 1.056, 17, 35, 14, 25, 6.5, 10, N'Traquair House Ale, Belhaven Wee Heavy, McEwan''s Scotch Ale, Founders Dirty Bastard, MacAndrew''s Scotch Ale, AleSmith Wee Heavy, Orkney Skull Splitter, Inveralmond Black Friar, Broughton Old Jock, Gordon Highland Scotch Ale, Dragonmead Under the Kilt ')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'10A', N'american-pale-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'10B', N'american-amber-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'10C', N'american-brown-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'11A', N'mild')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'11B', N'southern-english-brown')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'11C', N'northern-english-brown-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'12A', N'brown-porter')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'12B', N'robust-porter')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'12C', N'baltic-porter')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13A', N'dry-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13B', N'sweet-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13C', N'oatmeal-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13D', N'foreign-extra-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13E', N'american-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'13F', N'russian-imperial-stout')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'14A', N'english-ipa')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'14B', N'american-ipa')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'14C', N'imperial-ipa')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'15A', N'weizen-weissbier')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'15B', N'dunkelweizen')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'15C', N'weizenbock')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'15D', N'roggenbier-german-rye-beer')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'16A', N'witbier')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'16B', N'belgian-pale-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'16C', N'saison')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'16D', N'bi�re-de-garde')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17A', N'berliner-weisse')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17B', N'flanders-red-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17C', N'flanders-brown-ale-oud-bruin')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17D', N'straight-unblended-lambic')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17E', N'gueuze')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'17F', N'fruit-lambic')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'18A', N'belgian-blond-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'18B', N'belgian-dubbel')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'18C', N'belgian-tripel')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'18D', N'belgian-golden-strong-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'18E', N'belgian-dark-strong-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'19A', N'old-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'19B', N'english-barleywine')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'19C', N'american-barleywine')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'1A', N'lite-american-lager')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'1B', N'standard-american-lager')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'1C', N'premium-american-lager')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'1D', N'munich-helles')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'1E', N'dortmunder-export')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'22A', N'classic-rauchbier')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'27A', N'common-cider')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'27B', N'english-cider')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'27C', N'french-cider')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'27D', N'common-perry')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'27E', N'traditional-perry')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'28A', N'new-england-cider')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'28B', N'fruit-cider')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'28C', N'applewine')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'28D', N'other-specialty-cider-perry')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'2A', N'german-pilsner-pils')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'2B', N'bohemian-pilsener')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'2C', N'classic-american-pilsner')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'3A', N'vienna-lager')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'3B', N'oktoberfest-m�rzen')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'4A', N'dark-american-lager')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'4B', N'munich-dunkel')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'4C', N'schwarzbier-black-beer')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'5A', N'maibock-helles-bock')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'5B', N'traditional-bock')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'5C', N'doppelbock')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'5D', N'eisbock')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'6A', N'cream-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'6B', N'blonde-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'6C', N'k�lsch')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'6D', N'american-wheat-or-rye-beer')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'7A', N'northern-german-altbier')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'7B', N'california-common-beer')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'7C', N'd�sseldorf-altbier')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'8A', N'standard-ordinary-bitter')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'8B', N'special-best-premium-bitter')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'8C', N'extra-special-strong-bitter-english-pale-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'9A', N'scottish-light-60')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'9B', N'scottish-heavy-70')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'9C', N'scottish-export-80')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'9D', N'irish-red-ale')
GO
INSERT [dbo].[BjcpStyleUrlFriendlyName] ([SubCategoryId], [UrlFriendlyName]) VALUES (N'9E', N'strong-scotch-ale')
GO
INSERT [dbo].[FermentableUsageType] ([FermentableUsageTypeId], [FermentableUsageTypeName]) VALUES (10, N'Mash')
GO
INSERT [dbo].[FermentableUsageType] ([FermentableUsageTypeId], [FermentableUsageTypeName]) VALUES (20, N'Extract')
GO
INSERT [dbo].[FermentableUsageType] ([FermentableUsageTypeId], [FermentableUsageTypeName]) VALUES (30, N'Steep')
GO
INSERT [dbo].[FermentableUsageType] ([FermentableUsageTypeId], [FermentableUsageTypeName]) VALUES (40, N'Late Addition')
GO
INSERT [dbo].[HopType] ([HopTypeId], [HopTypeName]) VALUES (10, N'Leaf')
GO
INSERT [dbo].[HopType] ([HopTypeId], [HopTypeName]) VALUES (20, N'Pellet')
GO
INSERT [dbo].[HopType] ([HopTypeId], [HopTypeName]) VALUES (30, N'Plug')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (5, N'FirstWort')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (10, N'Mash')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (20, N'Boil')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (30, N'Primary')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (40, N'Secondary')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (50, N'FlameOut')
GO
INSERT [dbo].[HopUsageType] ([HopUsageTypeId], [HopUsageTypeName]) VALUES (60, N'DryHop')
GO
INSERT [dbo].[IbuFormula] ([IbuFormulaId], [IbuFormulaName]) VALUES (10, N'Tinseth')
GO
INSERT [dbo].[IbuFormula] ([IbuFormulaId], [IbuFormulaName]) VALUES (20, N'Rager')
GO
INSERT [dbo].[IbuFormula] ([IbuFormulaId], [IbuFormulaName]) VALUES (30, N'Brewgr')
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Adjuncts', 60)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Base Malts', 30)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Caramel Malts', 40)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Dry Malt Extracts', 20)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Liquid Malt Extracts', 10)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Other', 1000)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Roasted Malts', 50)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (10, N'Sugars', 70)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (20, N'German Hops', 30)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (20, N'New Zealand Hops', 40)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (20, N'Other', 1000)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (20, N'UK Hops', 20)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (20, N'US Hops', 10)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (30, N'Other', 1000)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (30, N'White Labs', 10)
GO
INSERT [dbo].[IngredientCategory] ([IngredientTypeId], [Category], [Rank]) VALUES (30, N'Wyeast', 20)
GO
INSERT [dbo].[IngredientType] ([IngredientTypeId], [IngredientTypeName]) VALUES (10, N'Fermentable')
GO
INSERT [dbo].[IngredientType] ([IngredientTypeId], [IngredientTypeName]) VALUES (20, N'Hop')
GO
INSERT [dbo].[IngredientType] ([IngredientTypeId], [IngredientTypeName]) VALUES (30, N'Yeast')
GO
INSERT [dbo].[IngredientType] ([IngredientTypeId], [IngredientTypeName]) VALUES (40, N'Adjunct')
GO
SET IDENTITY_INSERT [dbo].[MashStep] ON 

GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (2, NULL, N'Acid Rest', NULL, 1, 1, CAST(N'2014-02-04 14:57:46.980' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (4, NULL, N'Beta-Glucan Rest', NULL, 1, 1, CAST(N'2014-02-04 14:58:21.153' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (5, NULL, N'Dextrinization Rest', NULL, 1, 1, CAST(N'2014-02-04 14:58:36.970' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (6, NULL, N'Maltose Rest', NULL, 1, 1, CAST(N'2014-02-04 14:58:54.070' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (7, NULL, N'Mash-Out', NULL, 1, 1, CAST(N'2014-02-04 14:59:28.620' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (8, NULL, N'Protein Rest', NULL, 1, 1, CAST(N'2014-02-04 14:59:40.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[MashStep] ([MashStepId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (9, NULL, N'Saccharification Rest', NULL, 1, 1, CAST(N'2014-02-04 14:59:52.410' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MashStep] OFF

GO
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationTypeName]) VALUES (10, N'Recipe Comment')
GO
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationTypeName]) VALUES (20, N'Site Features')
GO
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationTypeName]) VALUES (30, N'Site Outages')
GO
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationTypeName]) VALUES (40, N'Brewer Follow')
GO
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationTypeName]) VALUES (50, N'RecipeBrewComment')
GO
INSERT [dbo].[OAuthProvider] ([OAuthProviderId], [OAuthProviderName], [IsActive]) VALUES (10, N'Facebook', 1)
GO
INSERT [dbo].[PartnerServiceType] ([PartnerServiceTypeId], [PartnerServiceTypeName]) VALUES (10, N'SendToShop')
GO
INSERT [dbo].[RecipeType] ([RecipeTypeId], [RecipeTypeName]) VALUES (10, N'All Grain')
GO
INSERT [dbo].[RecipeType] ([RecipeTypeId], [RecipeTypeName]) VALUES (20, N'Extract')
GO
INSERT [dbo].[RecipeType] ([RecipeTypeId], [RecipeTypeName]) VALUES (30, N'Partial Mash')
GO
INSERT [dbo].[SendToShopFormat] ([SendToShopFormatTypeId], [SendToShopFormatName]) VALUES (10, N'Email')
GO
INSERT [dbo].[SendToShopMethod] ([SendToShopMethodTypeId], [SendToShopMethodName]) VALUES (10, N'Email')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (-100, N'Cancelled')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (0, N'Created')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (10, N'Sent To Shop')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (20, N'In Progress')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (30, N'On Hold')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (90, N'Ready For Pickup')
GO
INSERT [dbo].[SendToShopOrderStatus] ([SendToShopOrderStatusId], [SendToShopOrderStatusName]) VALUES (100, N'Picked Up')
GO
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (10, N'US Standard')
GO
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (20, N'Metric')
GO

/* ===================================================== */
/* BASE INGREDIENT DATA  */
/* ===================================================== */
SET IDENTITY_INSERT [dbo].[Adjunct] ON 
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (1, NULL, N'Allspice', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (2, NULL, N'Amylase Enzyme', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (3, NULL, N'Anise', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (4, NULL, N'Antifoam', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (5, NULL, N'Calcium Carbonate', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (6, NULL, N'Cinnamon', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (7, NULL, N'Clove', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (8, NULL, N'Coriander', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (9, NULL, N'Fermax Yeast Nutrient', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (10, NULL, N'Gelatin', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (11, NULL, N'Ginger', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (12, NULL, N'Gypsum', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (13, NULL, N'Hot pepper', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (14, NULL, N'Irish Moss', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (15, NULL, N'Juniper berries or boughs', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (16, NULL, N'Lactic Acid', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (17, NULL, N'Licorice', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (18, NULL, N'Liquid Isinglass', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (19, NULL, N'Nutmeg', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (20, NULL, N'Orange or Lemon peel', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (21, NULL, N'Polyclar', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (22, NULL, N'Potassium Metabisulfite', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (23, NULL, N'Sodium Metabisulfite', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (24, NULL, N'Sparkolloid', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (25, NULL, N'Spruce needles or twigs', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (26, NULL, N'Wormwood', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Adjunct] ([AdjunctId], [CreatedByUserId], [Name], [Description], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (27, NULL, N'Yarrow', NULL, 1, 1, CAST(N'2012-05-01 21:31:22.633' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Adjunct] OFF
GO

SET IDENTITY_INSERT [dbo].[Fermentable] ON 
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (1, NULL, N'UK Pilsner 2-Row', NULL, 36, 1, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (2, NULL, N'Malted Oats - US', N'x', 37, 1, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (3, NULL, N'2-Row - US', N'x', 37, 1, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (4, NULL, N'6-Row - US', N'x', 35, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (5, NULL, N'Pilsner - BE', N'x', 36, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (6, NULL, N'German Pilsner 2-Row', NULL, 37, 2, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (7, NULL, N'Lager Malt - UK', N'x', 38, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (8, NULL, N'Wheat - BE', N'x', 37, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (9, NULL, N'German Wheat', NULL, 39, 2, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (10, NULL, N'White Wheat - US', N'x', 40, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (11, NULL, N'Carapils - DE', N'x', 33, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (12, NULL, N'Dextrine Malt - UK', N'x', 33, 2, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (13, NULL, N'Acid Malt', NULL, 27, 3, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (14, NULL, N'Peated Malt - UK', N'x', 34, 3, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (15, NULL, N'Maris Otter Pale - UK', N'x', 38, 3, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (16, NULL, N'English Mild', NULL, 37, 4, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (17, NULL, N'Vienna - US', N'x', 36, 4, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (18, NULL, N'Toasted Malt', NULL, 29, 5, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (19, NULL, N'Dark Wheat - DE', N'x', 39, 9, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (20, NULL, N'Munich - UK', N'x', 37, 9, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (21, NULL, N'Smoked Malt - US', N'x', 37, 9, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (22, NULL, N'Caramel/Crystal 10 - US', N'x', 35, 10, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (23, NULL, N'Carastan 15 - UK', N'x', 35, 15, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (24, NULL, N'Munich - Light 10L - US', N'x', 35, 10, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (25, NULL, N'Caramel/Crystal 20 - US', N'x', 35, 20, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (26, NULL, N'Munich - Dark 20L - US', N'x', 35, 20, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (27, NULL, N'CaraRed - DE', N'x', 35, 20, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (28, NULL, N'Melanoidin Malt - US', N'x', 37, 20, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (29, NULL, N'Amber - UK', N'x', 32, 27, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (30, NULL, N'CaraVienna - BE', N'x', 34, 22, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (31, NULL, N'Biscuit Malt - BE', N'x', 36, 23, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (32, NULL, N'Brumalt - BE', N'x', 33, 23, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (33, NULL, N'Gambrinus Honey Malt', NULL, 37, 25, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (34, NULL, N'Belgian Aromatic - BE', N'x', 37, 32, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (35, NULL, N'Victory Malt - US', N'x', 34, 28, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (36, NULL, N'Caramel/Crystal 30 - US', N'x', 35, 30, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (37, NULL, N'Carastan 35 - UK', N'x', 35, 35, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (38, NULL, N'Caramel/Crystal 40 - US', N'x', 35, 40, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (39, NULL, N'Caramel Wheat Malt - DE', N'x', 35, 46, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (40, NULL, N'Special Roast - US', N'x', 33, 50, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (41, NULL, N'CaraMunich - BE', N'x', 34, 56, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (42, NULL, N'Caramel/Crystal 60 - US', N'x', 36, 60, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (43, NULL, N'Brown Malt - UK', N'x', 33, 65, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (44, NULL, N'Caramel/Crystal 80 - US', N'x', 35, 80, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (45, NULL, N'Caramel/Crystal 90 - US', N'x', 35, 90, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (46, NULL, N'Caramel/Crystal 120 - US', N'x', 35, 120, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (47, NULL, N'CaraAroma - DE', N'x', 35, 130, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (48, NULL, N'Caramel/Crystal 150 - US', N'x', 35, 150, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (49, NULL, N'Special B', NULL, 30, 180, 10, 1, 0, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (50, NULL, N'Chocolate Rye Malt - DE', N'x', 34, 250, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (51, NULL, N'Roasted Barley - US', N'x', 25, 300, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (52, NULL, N'Carafa I - DE', N'x', 32, 337, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (53, NULL, N'Chocolate Malt - US', N'x', 34, 350, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (54, NULL, N'Chocolate Wheat Malt - DE', N'x', 33, 400, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (55, NULL, N'Carafa II - DE', N'x', 32, 412, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (56, NULL, N'Black Patent Malt - UK', N'x', 25, 500, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (57, NULL, N'Black Barley - US', N'x', 25, 500, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (58, NULL, N'Carafa III - DE', N'x', 32, 525, 10, 1, 1, CAST(N'2012-04-26 17:24:08.910' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (69, NULL, N'Dry Malt Extract - Extra Light - US', N'x', 44, 3, 20, 1, 1, CAST(N'2012-07-18 22:31:23.283' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (71, NULL, N'Dry Malt Extract - Light - US', N'x', 44, 8, 20, 1, 1, CAST(N'2012-07-18 22:34:43.790' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (72, NULL, N'Dry Malt Extract - Amber - US', N'x', 44, 13, 20, 1, 0, CAST(N'2012-07-18 22:35:10.040' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (73, NULL, N'Dry Malt Extract - Dark - US', N'x', 44, 18, 20, 1, 1, CAST(N'2012-07-18 22:35:53.140' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (74, NULL, N'Pale Liquid Malt Extract', NULL, 36, 8, 20, 1, 0, CAST(N'2012-07-18 22:36:44.397' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (76, NULL, N'Amber Liquid Malt Extract', NULL, 36, 13, 20, 1, 0, CAST(N'2012-07-18 22:37:10.200' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (77, NULL, N'Liquid Malt Extract - Dark - US', N'x', 36, 18, 20, 1, 1, CAST(N'2012-07-18 22:37:54.643' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (78, NULL, N'Flaked Barley - US', N'x', 32, 2, 10, 1, 1, CAST(N'2012-07-18 22:40:42.703' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (79, NULL, N'Raw Barley', NULL, 28, 2, 10, 1, 0, CAST(N'2012-07-18 22:41:03.110' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (80, NULL, N'Torrefied Barley - US', N'x', 36, 2, 10, 1, 1, CAST(N'2012-07-18 22:41:43.853' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (82, NULL, N'Dark Brown Sugar - US', N'x', 46, 50, 40, 1, 1, CAST(N'2012-07-18 22:48:10.110' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (84, NULL, N'Belgian Amber Candi Sugar - BE', N'x', 36, 75, 40, 1, 1, CAST(N'2012-07-18 22:49:30.910' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (85, NULL, N'Belgian Clear Candi Sugar - BE', N'x', 36, 1, 40, 1, 1, CAST(N'2012-07-18 22:49:53.143' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (86, NULL, N'Belgian Dark Candi Sugar - BE', N'x', 36, 275, 40, 1, 1, CAST(N'2012-07-18 22:50:22.707' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (87, NULL, N'Corn Sugar (Dextrose) - US', N'x', 46, 0, 40, 1, 1, CAST(N'2012-07-18 22:51:26.460' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (88, NULL, N'Corn Syrup - US', N'x', 36, 1, 40, 1, 1, CAST(N'2012-07-18 22:51:45.113' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (89, NULL, N'Flaked Corn - US', N'x', 37, 1, 10, 1, 1, CAST(N'2012-07-18 22:52:18.800' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (90, NULL, N'Honey - US', N'x', 35, 1, 40, 1, 1, CAST(N'2012-07-18 22:52:50.210' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (91, NULL, N'Maple Syrup - US', N'x', 30, 35, 40, 1, 1, CAST(N'2012-07-18 22:53:09.410' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (92, NULL, N'Molasses - US', N'x', 36, 80, 40, 1, 1, CAST(N'2012-07-18 22:53:38.143' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (93, NULL, N'Rice Liquid Extract', NULL, 32, 7, 20, 1, 0, CAST(N'2012-07-18 22:54:43.503' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (94, NULL, N'Flaked Rice - US', N'x', 32, 1, 10, 1, 1, CAST(N'2012-07-18 22:55:05.500' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (95, NULL, N'Flaked Rye - US', N'x', 36, 2, 10, 1, 1, CAST(N'2012-07-18 22:55:24.227' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (96, NULL, N'Flaked Wheat - US', N'x', 35, 2, 10, 1, 1, CAST(N'2012-07-18 22:56:00.013' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (147, NULL, N'Extra Pale Liquid Malt Extract', NULL, 37, 2, 20, 1, 0, CAST(N'2013-02-01 22:23:50.797' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (148, NULL, N'Wheat Liquid Extract', NULL, 35, 3, 20, 1, 0, CAST(N'2013-02-01 22:29:15.167' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (149, NULL, N'Pilsner - US', N'x', 34, 1, 20, 1, 1, CAST(N'2013-02-01 22:39:09.973' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (150, NULL, N'Wheat - US', N'x', 39, 1, 10, 1, 1, CAST(N'2013-02-01 22:42:24.897' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (151, NULL, N'Rye - US', N'x', 37, 3, 10, 1, 1, CAST(N'2013-02-01 22:44:58.410' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (152, NULL, N'Flaked Oats - US', N'x', 37, 1, 10, 1, 1, CAST(N'2013-02-01 23:09:30.360' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (153, NULL, N'Table Sugar - Sucrose - US', N'x', 46, 0, 40, 1, 1, CAST(N'2013-02-01 23:14:50.640' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (473, NULL, N'Abbey Malt - DE', N'x', 33, 17, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (474, NULL, N'Acidulated Malt - DE
', N'x', 27, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (475, NULL, N'Aromatic Malt - UK
', N'x', 35, 20, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (476, NULL, N'Aromatic Malt - US', N'x', 35, 20, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (477, NULL, N'Ashbourne Mild - US', N'x', 30, 5, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (478, NULL, N'Belgian Amber Candi Syrup - BE
', N'x', 32, 40, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (479, NULL, N'Belgian Clear Candi Syrup - BE
', N'x', 32, 1, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (480, NULL, N'Belgian D2 Candi Syrup - BE
', N'x', 32, 160, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (481, NULL, N'Belgian Dark Candi Syrup - BE
', N'x', 32, 80, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (482, NULL, N'Black Malt - UK', N'x', 28, 500, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (483, NULL, N'Black Malt - US', N'x', 28, 500, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (484, NULL, N'Blackprinz - US', N'x', 36, 500, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (485, NULL, N'Bohemian Pilsner - DE', N'x', 38, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (486, NULL, N'Bonlander Munich - US', N'x', 36, 10, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (487, NULL, N'Brown Rice Syrup
 - US', N'x', 44, 2, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (488, NULL, N'Cane Sugar
 - US', N'x', 46, 1, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (489, NULL, N'Cara 20L - BE', N'x', 34, 20, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (490, NULL, N'Cara 45L - BE', N'x', 34, 45, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (491, NULL, N'CaraAmber - DE', N'x', 34, 27, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (492, NULL, N'CaraBelge - DE', N'x', 33, 13, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (493, NULL, N'CaraBohemian - DE', N'x', 33, 75, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (494, NULL, N'CaraBrown - US', N'x', 34, 55, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (495, NULL, N'CaraCrystal Wheat Malt - US', N'x', 34, 55, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (496, NULL, N'Caramel Pils - DE', N'x', 34, 8, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (497, NULL, N'Caramel/Crystal 15 - US', N'x', 35, 15, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (498, NULL, N'Caramel/Crystal 75 - US', N'x', 35, 75, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (499, NULL, N'Dry Malt Extract - Amber
', N'x', 42, 10, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (500, NULL, N'Cara Malt - UK', N'x', 35, 17, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (501, NULL, N'CaraMunich I - DE', N'x', 34, 39, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (502, NULL, N'CaraMunich II - DE', N'x', 34, 46, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (503, NULL, N'CaraMunich III - DE', N'x', 34, 57, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (504, NULL, N'Caramel Pils - BE', N'x', 35, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (505, NULL, N'Carapils - Dextrine Malt - US', N'x', 33, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (506, NULL, N'Chocolate - BE', N'x', 30, 340, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (507, NULL, N'Chocolate - UK', N'x', 34, 425, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (508, NULL, N'Coffee Malt - UK', N'x', 36, 150, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (509, NULL, N'Crystal 120L - CA', N'x', 33, 120, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (510, NULL, N'Crystal 140L - UK', N'x', 33, 140, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (511, NULL, N'Crystal 15L - CA', N'x', 34, 15, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (512, NULL, N'Crystal 15L - UK', N'x', 34, 15, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (513, NULL, N'Crystal 30L - UK', N'x', 34, 30, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (514, NULL, N'Crystal 40L - CA', N'x', 34, 40, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (515, NULL, N'Crystal 45L - UK', N'x', 34, 45, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (516, NULL, N'Crystal 50L - UK', N'x', 34, 50, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (517, NULL, N'Crystal 60L - CA', N'x', 34, 60, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (518, NULL, N'Crystal 60L - UK', N'x', 34, 60, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (519, NULL, N'Crystal 70L - UK', N'x', 34, 70, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (520, NULL, N'Crystal 90L - UK', N'x', 33, 90, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (521, NULL, N'Crystal Rye - UK', N'x', 33, 90, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (522, NULL, N'Dark Chocolate - US', N'x', 29, 420, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (523, NULL, N'Dark Crystal 80L - UK', N'x', 33, 80, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (524, NULL, N'Dark Munich - DE', N'x', 36, 10, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (525, NULL, N'De-Husked Caraf I - DE', N'x', 32, 340, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (526, NULL, N'De-Husked Caraf II - DE', N'x', 32, 418, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (527, NULL, N'De-Husked Caraf III - DE', N'x', 32, 470, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (528, NULL, N'Dry Malt Extract - Munich - US', N'x', 42, 8, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (529, NULL, N'Dry Malt Extract - Pilsen - US', N'x', 42, 2, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (530, NULL, N'Dry Malt Extract - Wheat - US', N'x', 42, 3, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (531, NULL, N'ESB Malt - CA', N'x', 36, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Grains')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (532, NULL, N'Extra Dark Crystal 120L - UK', N'x', 33, 120, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (533, NULL, N'Extra Dark Crystal 160L - UK', N'x', 33, 160, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (534, NULL, N'Floor-Malted Bohemian Dark Pilsner - DE', N'x', 38, 6, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (535, NULL, N'Floor-Malted Bohemian Pilsner - DE', N'x', 38, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (536, NULL, N'Floor-Malted Bohemian Wheat - DE', N'x', 38, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (537, NULL, N'Golden Naked Oats - UK', N'x', 33, 10, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (538, NULL, N'Golden Promise - UK', N'x', 37, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (539, NULL, N'Grits - US', N'x', 37, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (540, NULL, N'Halcyon - UK', N'x', 36, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (541, NULL, N'Honey - Buckwheat - US', N'x', 42, 2, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (542, NULL, N'Honey Malt - CA', N'x', 37, 25, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Caramel Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (543, NULL, N'Invert Sugar - US', N'x', 46, 1, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (544, NULL, N'K�lsch - DE', N'x', 37, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (545, NULL, N'Lactose - Milk Sugar - US', N'x', 41, 1, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (546, NULL, N'Liquid Malt Extract - Amber - US', N'x', 35, 10, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (547, NULL, N'Liquid Malt Extract - Extra Light - US', N'x', 37, 2, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (548, NULL, N'Liquid Malt Extract - Light - US', N'x', 35, 4, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (549, NULL, N'Liquid Malt Extract - Munich - US', N'x', 35, 8, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (550, NULL, N'Liquid Malt Extract - Pilsen - US', N'x', 35, 2, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (551, NULL, N'Liquid Malt Extract - Wheat - US', N'x', 35, 3, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Liquid Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (552, NULL, N'Malted Naked Oats - UK', N'x', 33, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (553, NULL, N'Maltodextrin - US', N'x', 39, 0, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (554, NULL, N'Mild - UK', N'x', 37, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (555, NULL, N'Molasses - US', N'x', 36, 80, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (556, NULL, N'Munich - 60L - US', N'x', 33, 60, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (557, NULL, N'Munich Dark - CA', N'x', 34, 32, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (558, NULL, N'Munich Dark - DE', N'x', 37, 15, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (559, NULL, N'Munich Light - CA', N'x', 34, 10, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (560, NULL, N'Munich Light - DE', N'x', 37, 6, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (561, NULL, N'Oat Malt - UK', N'x', 28, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (562, NULL, N'Optic - UK', N'x', 38, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (563, NULL, N'Pale 2-Row - CA', N'x', 36, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (564, NULL, N'Pale 2-Row - Toasted - US', N'x', 33, 30, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (565, NULL, N'Pale 2-Row - US', N'x', 37, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (566, NULL, N'Pale 6-Row - US', N'x', 35, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (567, NULL, N'Pale Ale - BE', N'x', 38, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (568, NULL, N'Pale Ale - CA', N'x', 37, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (569, NULL, N'Pale Ale - DE', N'x', 39, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (570, NULL, N'Pale Ale - US', N'x', 37, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (571, NULL, N'Pale Wheat - CA', N'x', 36, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (572, NULL, N'Pale Wheat - DE', N'x', 36, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (573, NULL, N'Pearl - UK', N'x', 37, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (574, NULL, N'Pilsen - UK', N'x', 36, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (575, NULL, N'Pilsner - DE', N'x', 38, 1, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Base Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (576, NULL, N'Red Wheat - US', N'x', 38, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (577, NULL, N'Rice Syrup Solids', N'x', 37, 1, 20, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Dry Malt Extracts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (578, NULL, N'Roasted Barley - BE', N'x', 30, 575, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (579, NULL, N'Roasted Barley - UK', N'x', 29, 550, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Roasted Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (580, NULL, N'Rolled Oats - US', N'x', 33, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (581, NULL, N'Rye - DE', N'x', 38, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (582, NULL, N'Smoked Malt - DE', N'x', 37, 3, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (583, NULL, N'Soft Candi Sugar - Blond - US', N'x', 38, 5, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (584, NULL, N'Soft Candi Sugar - Brown - US', N'x', 38, 60, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (585, NULL, N'Spelt Malt - DE', N'x', 37, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (586, NULL, N'Torrified Wheat - US', N'x', 36, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (587, NULL, N'Turbinado - US', N'x', 44, 10, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (588, NULL, N'Vienna - DE', N'x', 37, 4, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (589, NULL, N'Vienna - UK', N'x', 35, 4, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Kilned Malts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (590, NULL, N'Wheat Malt - DE', N'x', 37, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (591, NULL, N'Wheat - UK', N'x', 37, 2, 10, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Adjuncts')
GO
INSERT [dbo].[Fermentable] ([FermentableId], [CreatedByUserId], [Name], [Description], [Ppg], [Lovibond], [DefaultUsageTypeId], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (592, NULL, N'White Sorghum Syrup- US', N'x', 44, 1, 40, 1, 1, CAST(N'2014-01-20 21:19:06.690' AS DateTime), NULL, N'Sugars')
GO
SET IDENTITY_INSERT [dbo].[Fermentable] OFF
GO


SET IDENTITY_INSERT [dbo].[Hop] ON 
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (1, NULL, N'Ahtanum ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (2, NULL, N'Amarillo ', NULL, 9, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (3, NULL, N'Cascade ', NULL, 5.8, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (5, NULL, N'Centennial ', NULL, 10.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (6, NULL, N'Chinook ', NULL, 13, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (7, NULL, N'Citra ', NULL, 12, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (8, NULL, N'Cluster ', NULL, 7, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (9, NULL, N'Columbus ', NULL, 15, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (10, NULL, N'Crystal ', NULL, 4.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (11, NULL, N'Fuggles', NULL, 4.8, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (12, NULL, N'Galena ', NULL, 13, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (13, NULL, N'Glacier ', NULL, 5.6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (14, NULL, N'Goldings', NULL, 5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (15, NULL, N'Hallertau ', NULL, 4.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (16, NULL, N'Horizon ', NULL, 12, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (17, NULL, N'Liberty ', NULL, 4, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (18, NULL, N'Magnum ', NULL, 12, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Germany', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (19, NULL, N'Millennium ', NULL, 15.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (20, NULL, N'Mt. Hood ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (21, NULL, N'Mt. Rainier ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (22, NULL, N'Newport ', NULL, 15.3, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (23, NULL, N'Northern Brewer ', NULL, 9, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (24, NULL, N'Nugget ', NULL, 13.3, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (25, NULL, N'Palisade ', NULL, 7.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (26, NULL, N'Perle ', NULL, 8.3, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Germany', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (27, NULL, N'Saaz ', NULL, 3.8, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Czech Republic', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (28, NULL, N'Santiam ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (29, NULL, N'Simcoe ', NULL, 13, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (30, NULL, N'Sorachi Ace ', NULL, 13, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Japan', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (31, NULL, N'Sterling ', NULL, 7.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (32, NULL, N'Styrian Aurora ', NULL, 8.3, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Slovenia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (33, NULL, N'Styrian Bobek ', NULL, 5.3, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Slovenia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (34, NULL, N'Styrian Celeia ', NULL, 4.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Slovenia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (35, NULL, N'Styrian Goldings', NULL, 5.25, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (36, NULL, N'Admiral ', NULL, 14.9, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (37, NULL, N'Bramling Cross ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (38, NULL, N'Challenger ', NULL, 7, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (39, NULL, N'East Kent Goldings', NULL, 5.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (40, NULL, N'First Gold ', NULL, 7.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (42, NULL, N'Northdown ', NULL, 8, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (43, NULL, N'Phoenix ', NULL, 10, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (44, NULL, N'Pilgrim ', NULL, 11, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (45, NULL, N'Pioneer ', NULL, 8.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (46, NULL, N'Progress ', NULL, 5.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (47, NULL, N'Target ', NULL, 11, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (48, NULL, N'Whitbread Golding (Wgv)', NULL, 6.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (60, NULL, N'Summit ', NULL, 17.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (61, NULL, N'Tettnang ', NULL, 4.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Germany', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (62, NULL, N'Vanguard ', NULL, 5.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (63, NULL, N'Warrior ', NULL, 16, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (64, NULL, N'Willamette ', NULL, 5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (65, NULL, N'Galaxy', NULL, 14.2, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (67, NULL, N'Strisselspalt ', NULL, 4, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (68, NULL, N'Brewer''s Gold ', NULL, 7, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, N'Germany', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (70, NULL, N'Herkules ', NULL, 3.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (71, NULL, N'Hersbrucker ', NULL, 14.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (73, NULL, N'Merkur ', NULL, 13.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (75, NULL, N'Opal ', NULL, 6.5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (77, NULL, N'Saphir ', NULL, 3.25, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (78, NULL, N'Spalter Select ', NULL, 4.75, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (79, NULL, N'Smaragd', NULL, 5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (80, NULL, N'Spalt ', NULL, 4, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (81, NULL, N'Taurus ', NULL, 5, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (83, NULL, N'Tradition ', NULL, 6, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (86, NULL, N'Motueka ', NULL, 7, 1, 1, CAST(N'2012-04-28 22:42:46.597' AS DateTime), NULL, NULL, N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (116, NULL, N'HopShot', NULL, 8, 1, 1, CAST(N'2013-01-30 00:00:00.000' AS DateTime), NULL, NULL, N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (117, NULL, N'Apollo', NULL, 20.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (118, NULL, N'Eroica', NULL, 10.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (119, NULL, N'Feux-Coeur Francais', NULL, 4.3, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (123, NULL, N'Green Bullet', NULL, 12.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (124, NULL, N'Greenburg', NULL, 5.2, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (126, NULL, N'Herald', NULL, 12, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (129, NULL, N'Lublin', NULL, 4, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'Poland', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (135, NULL, N'Pacific Gem', NULL, 15, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (136, NULL, N'Pacific Jade', NULL, 13, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (137, NULL, N'Pacifica', NULL, 5.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (138, NULL, N'Pilot', NULL, 10.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'England', N'UK Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (139, NULL, N'Polnischer Lublin', NULL, 3.75, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'Poland', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (140, NULL, N'Pride of Ringwood', NULL, 8.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (141, NULL, N'Riwaka', NULL, 5.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (142, NULL, N'San Juan Ruby Red', NULL, 7.01, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (144, NULL, N'Satus', NULL, 13.25, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (145, NULL, N'Select', NULL, 5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'Germany', N'German Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (147, NULL, N'Southern Cross', NULL, 12.5, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'New Zealand', N'New Zealand Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (151, NULL, N'Tardif de Bourgogne', NULL, 4.3, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'France', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (154, NULL, N'Ultra', NULL, 4.75, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (156, NULL, N'Zeus', NULL, 15, 1, 1, CAST(N'2013-01-30 21:43:54.620' AS DateTime), NULL, N'United States', N'US Hops')
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (275, NULL, N'3-6-9 Experimental', N'x', 10.7, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Slovenia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (276, NULL, N'Bravo', N'x', 13, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (277, NULL, N'Chelan', N'x', 13.25, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (278, NULL, N'Comet', N'x', 9.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (279, NULL, N'El Dorado', N'x', 16, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (280, NULL, N'Ella', N'x', 15, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (281, NULL, N'Endeavour', N'x', 9.25, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'England', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (282, NULL, N'German Spalt Select', N'x', 5.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Germany', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (283, NULL, N'Golding', N'x', 4.75, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'England', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (284, NULL, N'Golding', N'x', 4.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (285, NULL, N'Hallertauer Aroma', N'x', 7.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'New Zealand', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (286, NULL, N'Hallertauer Mittelfr�h', N'x', 4.25, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Germany', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (287, NULL, N'Hallertau Gold', N'x', 6.25, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Germany', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (288, NULL, N'Kohatu', N'x', 6.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (289, NULL, N'Olympic', N'x', 12, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (290, NULL, N'Polaris', N'x', 21.3, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Germany', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (291, NULL, N'Polish Lublin', N'x', 3.75, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Poland', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (292, NULL, N'Rakau', N'x', 12, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (293, NULL, N'Sticklebract', N'x', 13.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (294, NULL, N'Summer', N'x', 5.95, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (295, NULL, N'Super Galena', N'x', 12.9, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (296, NULL, N'Super Pride', N'x', 14, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (297, NULL, N'Tettnang', N'x', 4.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (298, NULL, N'Topaz', N'x', 16.4, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'Australia', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (299, NULL, N'Wai-iti', N'x', 3.5, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'New Zealand', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (300, NULL, N'Waimea', N'x', 14.4, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'New Zealand', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (301, NULL, N'WGV', N'x', 6, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'England', NULL)
GO
INSERT [dbo].[Hop] ([HopId], [CreatedByUserId], [Name], [Description], [AA], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Country], [Category]) VALUES (302, NULL, N'Yakima Cluster', N'x', 7.25, 1, 1, CAST(N'2014-01-20 21:19:14.537' AS DateTime), NULL, N'United States', NULL)
GO
SET IDENTITY_INSERT [dbo].[Hop] OFF
GO

SET IDENTITY_INSERT [dbo].[Yeast] ON 
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (125, NULL, N'Brewferm Brewferm Blanche', N'Ferments clean with little or no sulphur.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (126, NULL, N'Brewferm Brewferm Lager', N'Develops Witbeer aromas like banana and clove.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (127, NULL, N'Coopers Coopers Homebrew Yeast', N'Clean, round flavor profile.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (128, NULL, N'Danstar Nottingham', N'Neutral for an ale yeast; fruity estery aromas.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (129, NULL, N'Danstar Windsor', N'Full-bodied, fruity English ale.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (130, NULL, N'Fermentis Fermentis US 56', N'Clean with mild flavor for a wide range of styles.', 0.77, 0, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (131, NULL, N'Fermentis Safale S-04', N'English ale yeast selected for its fast fermentation character and its ability to form a compact sediment at the end of fermentation, helping to improve
beer clarity. Recommended for the production of a large range of ales and specially adapted to cask-conditioned ones and fermentation in cylindoconical
tanks.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (132, NULL, N'Fermentis Safbrew S-33', N'General purpose ale yeast with neutral flavor profiles. Its low attenuation gives beers with a very good length on the palate. Particularly recommended
for specialty ales and trappist type beers. Yeast with a good sedimentation: forms no clumps but a powdery haze when resuspended in
the beer.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (133, NULL, N'Fermentis Safbrew T-58', N'Specialty yeast selected for its estery somewhat peppery and spicy flavor development. Yeast with a good sedimentation: forms no clumps but a
powdery haze when resuspended in the beer.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (134, NULL, N'Fermentis Saflager S-23', N'Produces a fruit esterness in lagers.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (135, NULL, N'Muntons Muntons Premium Gold', N'Clean balanced ale yeast for 100% malt recipies.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (136, NULL, N'Muntons Muntons Standard Yeast', N'Clean well balanced ale yeast.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (137, NULL, N'Siebel Inst. Alt Ale BRY 144', N'Full-flavoured but clean tasting with estery flavour.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (138, NULL, N'Siebel Inst. American Ale BRY 96', N'Very clean ale flavor.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (139, NULL, N'Siebel Inst. American Lager BRY 118', N'Produces slightly fruity beer; some residual sugar.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (140, NULL, N'Siebel Inst. Bavarian Weizen BRY 235', N'A very estery beer with mild clove-like spiciness.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (141, NULL, N'Siebel Inst. English Ale BRY 264', N'Clean ale with slightly nutty and estery character.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (142, NULL, N'Siebel Inst. North European Lager BRY 203', N'Well balanced beer, fewer sulfur compounds.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (143, NULL, N'Siebel Inst. Trappist Ale BRY 204', N'Dry, estery flavor with a light, clove-like spiciness.', 0.8, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Other')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (144, NULL, N'White Labs 10th Anniversary Blend WLP010', N'Blend of WLP001, WLP002, WLP004 & WLP810.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (145, NULL, N'White Labs Abbey Ale WLP530', N'Produces fruitiness and plum characteristics.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (146, NULL, N'White Labs Amer. Hefeweizen Ale WLP320', N'Produces a slight amount of banana and clove notes.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (147, NULL, N'White Labs Amer. Ale Blend WLP060', N'Blend celebrates the strengths of California ale strains.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (148, NULL, N'White Labs American Lager WLP840', N'Dry and clean with a very slight apple fruitiness.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (149, NULL, N'White Labs Australian Ale WLP009', N'For a clean, malty and bready beer.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (150, NULL, N'White Labs Bastogne Belgian Ale WLP510', N'A high gravity, Trappist style ale yeast.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (151, NULL, N'White Labs Bavarian Weizen Ale WLP351', N'Moderately high, spicy phenolic overtones of cloves.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (152, NULL, N'White Labs Bedford British Ale WLP006', N'Good choice for most English style ales.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (153, NULL, N'White Labs Belgian Ale WLP550', N'Phenolic and spicy flavours dominate the profile.', 0.81, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (154, NULL, N'White Labs Belgian Golden Ale WLP570', N'A combination of fruitiness and phenolic flavors.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (155, NULL, N'White Labs Belgian Saison I WLP565', N'Produces earthy, spicy, and peppery notes.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (156, NULL, N'White Labs Belgian Style Ale Blend WLP575', N'Blend of Trappist yeast and Belgian ale yeast', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (157, NULL, N'White Labs Belgian Wit Ale WLP400', N'Slightly phenolic and tart.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (158, NULL, N'White Labs Belgian Wit II Ale WLP410', N'Spicier, sweeter, and less phenolic than WLP400.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (159, NULL, N'White Labs British Ale WLP005', N'English strain that produces malty beers.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (160, NULL, N'White Labs Burton Ale WLP023', N'Subtle fruity flavors: apple, clover honey and pear.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (161, NULL, N'White Labs California Ale V WLP051', N'Produces a fruity, full-bodied beer.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (162, NULL, N'White Labs California Ale WLP001', N'Clean flavors accentuate hops; very versatile.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (163, NULL, N'White Labs Copenhagen Lager WLP850', N'Clean crisp northern European lager yeast.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (164, NULL, N'White Labs Czech Budejovice Lager WLP802', N'Produces dry and crisp lagers, with low diacetyl.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (165, NULL, N'White Labs Dry English ale WLP007', N'Good for high gravity ales with no residuals.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (166, NULL, N'White Labs Dusseldorf Alt WLP036', N'Produces clean, slightly sweet alt beers.', 0.68, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (167, NULL, N'White Labs East Coast Ale WLP008', N'Very clean and low esters.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (168, NULL, N'White Labs Edinburgh Ale WLP028', N'Malty, strong Scottish ales.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (169, NULL, N'White Labs English Ale WLP002', N'Very clear with some residual sweetness.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (170, NULL, N'White Labs Essex Ale Yeast WLP022', N'Drier finish than many British ale yeasts', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (171, NULL, N'White Labs European Ale WLP011', N'Low ester production, giving a clean profile.', 0.67, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (172, NULL, N'White Labs German Ale II WLP003', N'Clean, sulfur component that reduces with aging.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (173, NULL, N'White Labs German Ale/K�lsch WLP029', N'A super-clean, lager-like ale.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (174, NULL, N'White Labs German Bock Lager WLP833', N'Produces well balanced beers of malt and hop character.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (175, NULL, N'White Labs German Lager WLP830', N'Malty and clean; great for all German lagers.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (176, NULL, N'White Labs Hefeweizen Ale WLP300', N'Produces banana and clove nose.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (177, NULL, N'White Labs Hefeweizen IV Ale WLP380', N'Crisp, large clove and phenolic aroma and flavor.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (178, NULL, N'White Labs Irish Ale WLP004', N'Light fruitiness and slight dry crispness.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (179, NULL, N'White Labs London Ale WLP013', N'Dry malty ale yeast for pales, bitters and stouts.', 0.71, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (180, NULL, N'White Labs Mexican Lager Yeast WLP940', N'Produces clean lager beer, with a crisp finish.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (181, NULL, N'White Labs Oktoberfest/M�rzen WLP820', N'Produces a very malty, bock-like style.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (182, NULL, N'White Labs Old Bavarian Lager WLP920', N'Finishes malty with a slight ester profile. Use in beers such as Octoberfest, Bock, and dark lagers.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (183, NULL, N'White Labs Pacific Ale WLP041', N'A popular ale yeast from the Pacific Northwest.', 0.67, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (184, NULL, N'White Labs Pilsner Lager WLP800', N'Somewhat dry with a malty finish.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (185, NULL, N'White Labs Premium Bitter Ale WLP026', N'Gives a mild but complex estery character.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (186, NULL, N'White Labs San Francisco Lager WLP810', N'For California Common type beer.', 0.67, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (187, NULL, N'White Labs So. German Lager WLP838', N'A malty finish and balanced aroma.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (188, NULL, N'White Labs Southwold Ale WLP025', N'Complex fruits and citrus flavors.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (189, NULL, N'White Labs Super High Gravity WLP099', N'High gravity yeast, ferments up to 25% alcohol.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (190, NULL, N'White Labs Trappist Ale WLP500', N'Distinctive fruitiness and plum characteristics.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (191, NULL, N'White Labs Whitbread Ale WLP017', N'Brittish style, slightly fruity with a hint of sulfur.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (192, NULL, N'White Labs Zurich Lager Yeast WLP885', N'Swiss style lager yeast with minimal sulfer and diacetyl production.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'White Labs')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (193, NULL, N'Wyeast American Ale 1056', N'Well balanced. Ferments dry, finishes soft.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (194, NULL, N'Wyeast American Ale II 1272', N'Slightly nutty, soft, clean and tart finish.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (195, NULL, N'Wyeast American Lager 2035', N'Bold, complex and aromatic; slight diacetyl.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (196, NULL, N'Wyeast American Wheat 1010', N'Produces a dry, slightly tart, crisp beer.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (197, NULL, N'Wyeast Bavarian Lager 2206', N'Produces rich, malty, full-bodied beers.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (198, NULL, N'Wyeast Bavarian Wheat 3056', N'Produces mildly estery and phenolic wheat beers.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (199, NULL, N'Wyeast Bavarian Wheat 3638', N'Balance banana esters w/ apple and plum esters.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (200, NULL, N'Wyeast Belgian Abbey II 1762', N'Slightly fruity with a dry finish.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (201, NULL, N'Wyeast Belgian Ale 1214', N'Abbey-style, top-fermenting yeast for high gravity.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (202, NULL, N'Wyeast Belgian Ardennes 3522', N'Mild fruitiness with complex spicy character.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (203, NULL, N'Wyeast Belgian Lambic Blend 3278', N'Rich, earthy aroma and acidic finish.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (204, NULL, N'Wyeast Belgian Saison 3724', N'Very tart and dry with spicy and bubblegum aromatics', 0.78, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (205, NULL, N'Wyeast Belgian Strong Ale 1388', N'Fruity nose and palate, dry, tart finish.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (206, NULL, N'Wyeast Belgian Wheat 3942', N'Apple and plum like nose with dry finish.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (207, NULL, N'Wyeast Belgian Witbier 3944', N'Alcohol tolerant, with tart, slight phenolic profile.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (208, NULL, N'Wyeast Biere de Garde', N'Low to moderate ester production with mild spicyness', 0.78, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (209, NULL, N'Wyeast Bohemian Lager 2124', N'Ferments clean and malty.', 0.71, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (210, NULL, N'Wyeast Brettan. Bruxellensis 3112', N'Produces classic lambic characteristics.', 0.6, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (211, NULL, N'Wyeast Brettan. Lambicus 5526 ', N'Pie cherry-like flavor and sourness.', 0.6, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (212, NULL, N'Wyeast British Ale 1098', N'Ferments dry and crisp, slightly tart and fruity.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (213, NULL, N'Wyeast British Ale II 1335', N'Malty flavor, crisp finish, clean, fairly dry.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (214, NULL, N'Wyeast British Cask Ale 1026', N'Produces nice malt profile with a hint of fruit.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (215, NULL, N'Wyeast Budvar Lager 2000', N'Malty nose with subtle fruit. Finishes dry and crisp.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (216, NULL, N'Wyeast California Lager 2112', N'Produces malty, brilliantly clear beers.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (217, NULL, N'Wyeast Canadian/Belgian Style 3864', N'Mild phenolics and low ester profile with tart finish.', 0.77, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (218, NULL, N'Wyeast Czech Pils 2278', N'Dry but malty finish.', 0.72, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (219, NULL, N'Wyeast Danish Lager 2042', N'Rich Dortmund style with crisp, dry finish.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (220, NULL, N'Wyeast Dutch Castle Yeast 3822', N'Spicy, phenolic and tart in the nose.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (221, NULL, N'Wyeast English Special Bitter 1768', N'Produces light fruit ethanol aroma with soft finish.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (222, NULL, N'Wyeast European Ale 1338', N'Full-bodied complex strain and dense malty finish.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (223, NULL, N'Wyeast European Lager II 2247', N'Clean, very mild flavor, slight sulfur production.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (224, NULL, N'Wyeast Farmhouse Ale 3726', N'Complex aromas dominated by an earthy/spicy note.', 0.78, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (225, NULL, N'Wyeast Forbidden Fruit Yeast 3463', N'Phenolic profile, subdued fruitiness.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (226, NULL, N'Wyeast Gambrinus Lager 2002', N'Mild floral aroma with lager characteristics in the nose.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (227, NULL, N'Wyeast German Ale 1007', N'Ferments dry and crisp with a mild flavor.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (228, NULL, N'Wyeast German Wheat 3333', N'Sharp, tart crispness, fruity, sherry-like palate.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (229, NULL, N'Wyeast Irish Ale 1084', N'Slight residual diacetyl and fruitiness.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (230, NULL, N'Wyeast K�lsch 2565', N'Malty with a subdued fruitiness and a crisp finish.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (231, NULL, N'Wyeast Leuven Pale Ale 3538', N'Slight phenolics and spicy aromatic characteristics.', 0.76, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (232, NULL, N'Wyeast London Ale 1028', N'Bold and crisp with a rich mineral profile.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (233, NULL, N'Wyeast London Ale III 1318', N'Very light and fruity, with a soft, balanced palate.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (234, NULL, N'Wyeast London ESB Ale 1968', N'Rich, malty character with balanced fruitiness.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (235, NULL, N'Wyeast Munich Lager 2308', N'Very smooth, well-rounded and full-bodied.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (236, NULL, N'Wyeast North American Lager 2272', N'Malty finish, traditional Canadian lagers.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (237, NULL, N'Wyeast Northwest Ale 1332', N'Malty, mildly fruity, good depth and complexity.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (238, NULL, N'Wyeast Octoberfest Lager Blend 2633', N'Plenty of malt character and mouth feel. Low in sulfer.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (239, NULL, N'Wyeast Pilsen Lager 2007', N'Smooth malty palate; ferments dry and crisp.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (240, NULL, N'Wyeast Ringwood Ale 1187', N'A malty, complex profile that clears well.', 0.69, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (241, NULL, N'Wyeast Scottish Ale 1728', N'Suited for Scottish-style ales, high-gravity ales.', 0.71, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (242, NULL, N'Wyeast Thames Valley Ale 1275', N'Clean, light malt character with low esters.', 0.74, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (243, NULL, N'Wyeast Thames Valley Ale II 1882', N'Slightly fruitier and maltier than 1275.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (244, NULL, N'Wyeast Trappist High Gravity 3787', N'Ferments dry, rich ester profile and malty palate.', 0.79, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (245, NULL, N'Wyeast Urquell Lager 2001', N'Mild fruit and floral aroma. Very dry with mouth feel.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (246, NULL, N'Wyeast Weihenstephan Weizen 3068', N'A unique, rich and spicy weizen character.', 0.75, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (247, NULL, N'Wyeast Whitbread Ale 1099', N'Mildly malty and slightly fruity.', 0.7, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (248, NULL, N'Wyeast Wyeast Ale Blend 1087', N'A blend of the best strains to provide quick starts.', 0.73, 1, 1, CAST(N'2012-04-30 21:34:24.453' AS DateTime), NULL, N'Wyeast')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (253, NULL, N'Fermentis Safale US-05', N'American ale yeast producing well balanced beers with low diacetyl and a very clean, crisp end palate. Forms a firm foam head and presents a
very good ability to stay in suspension during fermentation.', 0.81, 1, 1, CAST(N'2012-09-18 00:17:05.213' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (563, NULL, N'Fermentis Safale K-97', N'German ale yeast selected for its ability to form a large firm head when fermenting. Suitable to brew ales with low esters and can be used for
Belgian type wheat beers. Its lower attenuation profile gives beers with a good length on the palate.', 0.81, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (566, NULL, N'Fermentis Safbrew Abbaye', N'Yeast recommended to brew abbey type beers known for their high alcohol content. It ferments very fast and reveals subtle and well-balanced
aromas.', 0.82, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (567, NULL, N'Fermentis Safbrew F-2', N'Safbrew F-2 has been selected specifically for secondary fermentation in bottle and in cask. This yeast assimilates very little maltotriose but assimilates
basic sugars (glucose, fructose, saccharose, maltose) and is caracterized by a neutral aroma profile respecting the base beer character.', 0.8, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (568, NULL, N'Fermentis Safbrew WB-06', N'Specialty yeast selected for wheat beer fermentations. Produces subtle estery and phenol flavor notes typical of wheat beers. Allows to brew beer
with a high drinkability profile and presents a very good ability to suspend during fermentation.', 0.86, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (569, NULL, N'Fermentis Saflager S-23', N'Bottom fermenting yeast originating from the VLB - Berlin in Germany recommended for the production of fruity and estery lagers. Its lower attenuation
profile gives beers with a good length on the palate.', 0.82, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (570, NULL, N'Fermentis Saflager S-189', N'Originating from the H�rlimann brewery in Switzerland. This lager strain�s attenuation profile allows to brew fairly neutral flavor beers with a high
drinkability.', 0.84, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
INSERT [dbo].[Yeast] ([YeastId], [CreatedByUserId], [Name], [Description], [Attenuation], [IsActive], [IsPublic], [DateCreated], [DatePromoted], [Category]) VALUES (571, NULL, N'Fermentis Saflager W-34/70', N'This famous yeast strain from Weihenstephan in Germany is used world-wide within the brewing industry. Saflager W-34/70 allows to brew beers
with a good balance of floral and fruity aromas and gives clean flavors and high drinkable beers.', 0.83, 1, 1, CAST(N'2015-02-11 00:00:00.000' AS DateTime), NULL, N'Fermentis')
GO
SET IDENTITY_INSERT [dbo].[Yeast] OFF
GO
