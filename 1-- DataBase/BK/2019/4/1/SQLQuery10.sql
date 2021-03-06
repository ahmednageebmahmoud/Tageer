USE [Tageer]
GO
/****** Object:  Schema [Ads]    Script Date: 4/1/2019 12:28:46 AM ******/
CREATE SCHEMA [Ads]
GO
/****** Object:  Table [Ads].[AdComment]    Script Date: 4/1/2019 12:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKLog_Id] [int] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdDirectFieldDetails]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdDirectFieldDetails](
	[AdId] [int] NOT NULL,
	[FKArea_Id] [int] NULL,
	[FKSize_Id] [int] NULL,
	[FKLocation_Id] [int] NULL,
	[FKMatrial_Id] [int] NULL,
	[FKNationality_Id] [int] NULL,
	[FKMark_Id] [int] NULL,
	[FkCountry_Id] [int] NULL,
	[FkProvince_Id] [int] NULL,
 CONSTRAINT [PK_AdDetails] PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdFavorites]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdFavorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdFavorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdGroupsDetails]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdGroupsDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKGroup_Id] [int] NOT NULL,
	[IsCustomValue] [bit] NOT NULL,
	[CustomValue] [nvarchar](50) NULL,
	[FKGroupItem_Id] [int] NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdIndividualFieldsDetails]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdIndividualFieldsDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
	[FkIndividualField_Id] [int] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[Ads]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Ads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[FkRentalTimesType_Id] [int] NOT NULL,
	[FKAlbum_Id] [int] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FKLog_Id] [int] NOT NULL,
	[FkCategory_Id] [int] NOT NULL,
	[FkSubCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdVisitors]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdVisitors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Counter] [bigint] NOT NULL,
	[FKAd_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[Categories]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKFile_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[DirectFields]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[DirectFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DirectFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[Groups]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SectionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[GroupsDisplayTypes]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[GroupsDisplayTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKGroup_Id] [int] NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FkLog_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[GroupsItems]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[GroupsItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[FKGroup_Id] [int] NOT NULL,
 CONSTRAINT [PK_SectionItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[IndividualFields]    Script Date: 4/1/2019 12:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[IndividualFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourcesName] [nvarchar](50) NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Inputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalDirectFields]    Script Date: 4/1/2019 12:28:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalDirectFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[FkSubCategory_Id] [int] NULL,
	[FkCategory_Id] [int] NOT NULL,
	[FkDirectField_Id] [int] NOT NULL,
	[Fklog_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalDirectFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalGroupsItems]    Script Date: 4/1/2019 12:28:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalGroupsItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKGroupsItem_Id] [int] NOT NULL,
	[FkLog_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalIndividualFields]    Script Date: 4/1/2019 12:28:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalIndividualFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsBar] [bit] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FkIndividualField_Id] [int] NOT NULL,
	[FKLog_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_CategoryInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalMarks]    Script Date: 4/1/2019 12:28:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMark_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NULL,
 CONSTRAINT [PK_RentalMarks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalMaterials]    Script Date: 4/1/2019 12:28:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMaterial_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NULL,
 CONSTRAINT [PK_RentalMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalTimesTypes]    Script Date: 4/1/2019 12:28:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalTimesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LeaseTermTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[SubCategories]    Script Date: 4/1/2019 12:28:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[SubCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKCategory_Id] [int] NOT NULL,
	[FKImage_Id] [int] NULL,
	[FKLog_Id] [int] NOT NULL,
	[ImagesCount] [int] NOT NULL,
 CONSTRAINT [PK_RentalCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 4/1/2019 12:28:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](500) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[FKCountry_Id] [int] NULL,
	[FkProvince_Id] [int] NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumFiles]    Script Date: 4/1/2019 12:28:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkAlbum_Id] [int] NOT NULL,
	[FkFile_Id] [int] NOT NULL,
 CONSTRAINT [PK_AlbumFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 4/1/2019 12:28:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppsInformation]    Script Date: 4/1/2019 12:28:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppsInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_AppInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 4/1/2019 12:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Width] [int] NULL,
	[Length] [int] NULL,
	[Height] [int] NULL,
 CONSTRAINT [PK_FreeSizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 4/1/2019 12:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkLog_Id] [int] NOT NULL,
	[FKFile_Id] [int] NOT NULL,
	[CountryKey] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 4/1/2019 12:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeforeCurrentYear] [int] NOT NULL,
	[AfterCurrentYear] [int] NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[IsDefult] [bit] NOT NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatesTypes]    Script Date: 4/1/2019 12:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DateTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 4/1/2019 12:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileUrl] [nvarchar](150) NOT NULL,
	[FKAppInformation_Id] [int] NOT NULL,
	[FkFileType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FileTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Histories]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Histories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[RedirectUrl] [nvarchar](500) NULL,
	[FkState_Id] [int] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FKPage_Id] [int] NOT NULL,
	[FkLog_Id] [int] NULL,
	[TitleEn] [nvarchar](50) NOT NULL,
	[TitleAr] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Histories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryDetails]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColumResourceName] [nvarchar](50) NOT NULL,
	[ColumOldContent] [nvarchar](4000) NULL,
	[ColumNewContent] [nvarchar](4000) NULL,
	[FkHistory_Id] [int] NOT NULL,
	[CoulmIsSingl] [bit] NOT NULL,
	[CoulmIsEn] [bit] NOT NULL,
 CONSTRAINT [PK_HistoryDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputsTypes]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputsTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourcesName] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_InputsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 4/1/2019 12:28:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageTypes]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LanguageTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageUsing]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageUsing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[FKLanguageType_Id] [int] NOT NULL,
	[FKLanguage_Id] [int] NOT NULL,
 CONSTRAINT [PK_LanguageUsing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Longitude] [nvarchar](500) NOT NULL,
	[Latitude] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Martials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ClassIcon] [nvarchar](50) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[MonthIndex] [int] NOT NULL,
 CONSTRAINT [PK_Months] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationalities]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationalities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Nationalities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsIsRead]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsIsRead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkHistory_Id] [int] NOT NULL,
	[FKUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_NotificationsIsRead] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[IsControlPanel] [bit] NOT NULL,
	[IsFronEnd] [bit] NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesAllow]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesAllow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsAllowNotify] [bit] NOT NULL,
	[IsAllowLog] [bit] NOT NULL,
	[FkLog_Id] [int] NOT NULL,
	[FkPage_Id] [int] NOT NULL,
 CONSTRAINT [PK_PagesAllow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesManagement]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesManagement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContnetAr] [nvarchar](max) NOT NULL,
	[ContentEn] [nvarchar](max) NOT NULL,
	[FKSeo_Id] [int] NULL,
	[FKPrivilege_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_PagesManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesRoles]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDisplay] [bit] NOT NULL,
	[IsCreate] [bit] NOT NULL,
	[IsUpdate] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[FkPage_Id] [int] NOT NULL,
	[FkRole_Id] [int] NOT NULL,
	[FkPageRoleTypes_Id] [int] NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_PagesRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesRoleTypes]    Script Date: 4/1/2019 12:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesRoleTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PagesRoleTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[FKPhone_Id] [int] NOT NULL,
	[FkPhoneType_Id] [int] NOT NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKCountry_Id] [int] NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[IsControlPanel] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seo]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitelAr] [nvarchar](200) NOT NULL,
	[TitelEn] [nvarchar](200) NOT NULL,
	[KeywordAr] [nvarchar](500) NOT NULL,
	[KeywordEn] [nvarchar](500) NOT NULL,
	[DescriptionAr] [nvarchar](500) NOT NULL,
	[DescriptionEn] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Seo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SocialStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[CssClassStyle] [nvarchar](50) NOT NULL,
	[CssClassIcon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenus]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ClassIcon] [nvarchar](50) NOT NULL,
	[FkMenu_Id] [int] NOT NULL,
	[FKPage_Id] [int] NOT NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalSupport]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalSupport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TechnicalSupport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalSupportRead]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalSupportRead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkTechnicalSupport_Id] [int] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_TechnicalSupportRead] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MediumName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[NationalId] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[FkImage_Id] [int] NOT NULL,
	[FKAddress_Id] [int] NULL,
	[FkNationality_Id] [int] NULL,
	[FKGender_Id] [int] NULL,
	[FKSocialStatus_Id] [int] NULL,
	[FKJob_Id] [int] NULL,
	[FKLanguage_Id] [int] NULL,
	[IsAllowSMS] [bit] NULL,
	[IsAllowEmail] [bit] NULL,
	[IsOfferSummary] [bit] NULL,
	[PhoneNumbre] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FkRole_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/1/2019 12:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Serial] [nvarchar](300) NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, 1, 18)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (10, NULL, 3, NULL, NULL, 1, NULL, 1, NULL)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (11, NULL, 3, NULL, NULL, 1, NULL, 1, NULL)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (12, NULL, 3, NULL, NULL, 1, NULL, 1, 1)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (13, 1, 1, 1, 5, 1, 2, 1, 1)
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL)
GO
SET IDENTITY_INSERT [Ads].[AdFavorites] ON 
GO
INSERT [Ads].[AdFavorites] ([Id], [FkUser_Id], [FKAd_Id]) VALUES (23, 12, 14)
GO
INSERT [Ads].[AdFavorites] ([Id], [FkUser_Id], [FKAd_Id]) VALUES (26, 12, 13)
GO
INSERT [Ads].[AdFavorites] ([Id], [FkUser_Id], [FKAd_Id]) VALUES (27, 12, 10)
GO
INSERT [Ads].[AdFavorites] ([Id], [FkUser_Id], [FKAd_Id]) VALUES (34, 12, 8)
GO
SET IDENTITY_INSERT [Ads].[AdFavorites] OFF
GO
SET IDENTITY_INSERT [Ads].[AdGroupsDetails] ON 
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (13, 1, 0, N'1', 1, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (14, 2, 0, N'2', 2, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (15, 3, 0, N'4', 3, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (16, 1, 0, N'3', 4, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (17, 2, 0, N'5', 5, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (18, 3, 0, N'6', 6, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (19, 1, 1, N'd1', NULL, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (20, 2, 1, N'd2', NULL, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (21, 3, 1, N'd3', NULL, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (22, 1, 1, N'f1', NULL, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (23, 2, 1, N'f2', NULL, 13)
GO
INSERT [Ads].[AdGroupsDetails] ([Id], [FKGroup_Id], [IsCustomValue], [CustomValue], [FKGroupItem_Id], [FKAd_Id]) VALUES (24, 3, 1, N'f3', NULL, 13)
GO
SET IDENTITY_INSERT [Ads].[AdGroupsDetails] OFF
GO
SET IDENTITY_INSERT [Ads].[AdIndividualFieldsDetails] ON 
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (36, N'33', 10, 8)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (37, N'55', 5, 8)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (38, N'22', 9, 8)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (39, N'33', 10, 9)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (40, N'55', 5, 9)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (41, N'22', 9, 9)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (42, N'555', 17, 10)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (43, N'666', 20, 10)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (44, N'33', 10, 10)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (45, N'55', 5, 10)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (46, N'22', 9, 10)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (47, N'555', 17, 11)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (48, N'666', 20, 11)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (49, N'33', 10, 11)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (50, N'55', 5, 11)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (51, N'22', 9, 11)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (52, N'555', 17, 12)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (53, N'666', 20, 12)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (54, N'33', 10, 12)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (55, N'55', 5, 12)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (56, N'22', 9, 12)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (57, N'20', 19, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (58, N'222', 10, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (59, N'3', 11, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (60, N'11', 5, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (61, N'22', 13, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (62, N'200', 9, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (63, N'20', 1, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (64, N'15', 2, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (65, N'22', 3, 13)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (66, N'احمر', 20, 14)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (67, N'5', 16, 14)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (68, N'2019', 14, 14)
GO
INSERT [Ads].[AdIndividualFieldsDetails] ([Id], [Value], [FkIndividualField_Id], [FKAd_Id]) VALUES (69, N'5', 2, 14)
GO
SET IDENTITY_INSERT [Ads].[AdIndividualFieldsDetails] OFF
GO
SET IDENTITY_INSERT [Ads].[Ads] ON 
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (8, N'ثلاجة جديدة', N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', CAST(20.00 AS Decimal(18, 2)), 1, 33, 12, 678, 1, 3)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (9, N'ثلاجة', N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', CAST(60.00 AS Decimal(18, 2)), 2, 34, 12, 679, 1, 3)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (10, N'غسالة ', N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', CAST(40.00 AS Decimal(18, 2)), 2, 35, 12, 680, 7, 10)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (11, N'غسالة جديدة', N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ', CAST(100.00 AS Decimal(18, 2)), 2, 36, 12, 681, 7, 10)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (12, N'سيارة ', N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ', CAST(120.00 AS Decimal(18, 2)), 2, 37, 12, 682, 7, 10)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (13, N'سخان', N'تجربة اضافة وصف', CAST(80.00 AS Decimal(18, 2)), 1, 38, 12, 683, 1, 3)
GO
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FKLog_Id], [FkCategory_Id], [FkSubCategory_Id]) VALUES (14, N'مرسيدس', N'احلى سيارة', CAST(200.00 AS Decimal(18, 2)), 1, 39, 12, 684, 2, 7)
GO
SET IDENTITY_INSERT [Ads].[Ads] OFF
GO
SET IDENTITY_INSERT [Ads].[Categories] ON 
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id], [FKLogHistory_Id]) VALUES (1, N'عقارات', N'Real estate', 127, 329)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id], [FKLogHistory_Id]) VALUES (2, N'مركبات', N'Vehicles', 128, 330)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id], [FKLogHistory_Id]) VALUES (4, N'لوازم الافراح', N'Wedding Tools', 135, 341)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id], [FKLogHistory_Id]) VALUES (7, N'تجربة فئة', N'category test', 142, 553)
GO
SET IDENTITY_INSERT [Ads].[Categories] OFF
GO
SET IDENTITY_INSERT [Ads].[DirectFields] ON 
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (1, N'Nationality')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (2, N'Area')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (3, N'Mark')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (4, N'Location')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (5, N'Material')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (6, N'Size')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (7, N'Country')
GO
INSERT [Ads].[DirectFields] ([Id], [ResourceName]) VALUES (8, N'Province')
GO
SET IDENTITY_INSERT [Ads].[DirectFields] OFF
GO
SET IDENTITY_INSERT [Ads].[Groups] ON 
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (1, N'Location')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (2, N'UserCategory')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (3, N'BasicLuxuries')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (4, N'SubLuxuries')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (5, N'FinishingType')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (6, N'InterfaceType')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (7, N'PlaceCategory')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (8, N'Purpose')
GO
INSERT [Ads].[Groups] ([Id], [ResourceName]) VALUES (9, N'ControlSystem')
GO
SET IDENTITY_INSERT [Ads].[Groups] OFF
GO
SET IDENTITY_INSERT [Ads].[GroupsDisplayTypes] ON 
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (12, 3, 5, NULL, 590, 7)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (13, 9, 5, 7, 603, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (14, 4, 4, 7, 604, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (15, 3, 4, NULL, 634, 1)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (16, 4, 5, NULL, 635, 1)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (17, 9, 5, 12, 667, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (18, 4, 4, 12, 668, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FkLog_Id], [FKCategory_Id]) VALUES (19, 2, 4, 12, 669, 2)
GO
SET IDENTITY_INSERT [Ads].[GroupsDisplayTypes] OFF
GO
SET IDENTITY_INSERT [Ads].[GroupsItems] ON 
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (1, N'InVilla', 1)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (2, N'InTower', 1)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (3, N'InHouse', 1)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (4, N'Families', 2)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (5, N'Singles', 2)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (6, N'Roof', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (7, N'Guarantee', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (8, N'Chairs', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (9, N'lighting', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (10, N'CoffeeServers', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (11, N'Tables', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (12, N'Hospitality', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (13, N'Swetts', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (14, N'SecurityOfficial', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (15, N'KoucheSettings', 3)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (16, N'Mosque', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (17, N'Club', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (18, N'SwimmingPool', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (19, N'MaidRoom', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (20, N'Parking', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (21, N'Elevator', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (22, N'AirConditioning', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (23, N'Headsets', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (24, N'Photographer', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (25, N'Tent', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (26, N'Cups', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (27, N'Dishes', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (28, N'Mugs', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (29, N'Spoons', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (30, N'Fans', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (31, N'Burner', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (32, N'Carpets', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (33, N'WaterCarrier', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (34, N'Projector', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (35, N'GuardTours', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (36, N'DJ', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (37, N'Koshah', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (38, N'InternalLaser', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (39, N'ExternalLaser', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (40, N'IlluminatedLEDTents', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (41, N'IlluminatedTables', 4)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (42, N'Normal', 5)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (43, N'Lux', 5)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (44, N'SuperLux', 5)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (45, N'Front', 6)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (46, N'Rear', 6)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (47, N'Agricultural', 7)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (48, N'Dirt', 7)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (49, N'Commercial', 8)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (50, N'Residential', 8)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (51, N'Manual', 9)
GO
INSERT [Ads].[GroupsItems] ([Id], [ResourceName], [FKGroup_Id]) VALUES (52, N'Automatic', 9)
GO
SET IDENTITY_INSERT [Ads].[GroupsItems] OFF
GO
SET IDENTITY_INSERT [Ads].[IndividualFields] ON 
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (1, N'RoomsCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (2, N'SeatsCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (3, N'ToiletsCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (5, N'FloorNumber', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (7, N'BuildingYear', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (8, N'StreetWidth', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (9, N'PricePerMeter', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (10, N'ApartmentCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (11, N'ElevatorCounta', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (13, N'ParkingCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (14, N'Model', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (15, N'BagsSmallCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (16, N'BagsBigCount', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (17, N'Age', 2)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (19, N'AmountOfInsurance', 9)
GO
INSERT [Ads].[IndividualFields] ([Id], [ResourcesName], [FKInputType_Id]) VALUES (20, N'Color', 1)
GO
SET IDENTITY_INSERT [Ads].[IndividualFields] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalDirectFields] ON 
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (17, 1, NULL, 7, 1, 573)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (18, 0, NULL, 7, 3, 574)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (19, 0, NULL, 7, 5, 575)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (20, 1, NULL, 7, 6, 576)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (21, 0, NULL, 7, 7, 577)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (22, 0, NULL, 7, 8, 578)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (23, 0, 7, 2, 3, 591)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (24, 0, 7, 2, 7, 592)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (25, 0, 7, 2, 8, 593)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (26, 0, NULL, 1, 5, 607)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (27, 1, NULL, 1, 7, 608)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (28, 0, NULL, 1, 8, 609)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (29, 0, 11, 1, 3, 610)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (30, 0, 11, 1, 5, 611)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (31, 0, 11, 1, 7, 612)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (32, 1, 12, 2, 3, 649)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (33, 1, 12, 2, 7, 650)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id], [Fklog_Id]) VALUES (34, 1, 12, 2, 8, 651)
GO
SET IDENTITY_INSERT [Ads].[RentalDirectFields] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalGroupsItems] ON 
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (57, NULL, 6, 584, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (58, NULL, 7, 585, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (59, NULL, 11, 586, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (60, NULL, 12, 587, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (61, NULL, 13, 588, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (62, NULL, 14, 589, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (63, 7, 51, 599, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (64, 7, 52, 600, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (65, 7, 22, 601, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (66, 7, 23, 602, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (67, NULL, 6, 636, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (68, NULL, 7, 637, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (69, NULL, 8, 638, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (70, NULL, 11, 639, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (71, NULL, 14, 640, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (72, 11, 6, 641, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (73, 11, 8, 642, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (74, NULL, 16, 643, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (75, NULL, 21, 644, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (76, NULL, 27, 645, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (77, NULL, 28, 646, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (78, NULL, 32, 647, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (79, 12, 4, 661, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (80, 12, 5, 662, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (81, 12, 22, 663, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (82, 12, 23, 664, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (83, 12, 51, 665, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FkLog_Id], [FKCategory_Id]) VALUES (84, 12, 52, 666, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalGroupsItems] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalIndividualFields] ON 
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (52, 1, 0, 9, 20, 566, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (54, 0, 0, NULL, 14, 570, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (55, 1, 0, NULL, 17, 571, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (56, 1, 0, NULL, 20, 572, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (57, 0, 0, 7, 2, 594, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (58, 1, 0, 7, 14, 595, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (59, 0, 0, 7, 16, 596, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (60, 0, 0, 7, 19, 597, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (61, 1, 0, 7, 20, 598, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (62, 1, 1, NULL, 1, 622, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (63, 0, 0, NULL, 2, 623, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (64, 0, 0, NULL, 3, 624, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (65, 1, 1, NULL, 5, 625, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (66, 1, 1, NULL, 9, 626, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (67, 1, 1, NULL, 10, 627, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (68, 1, 0, NULL, 11, 628, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (69, 0, 0, NULL, 13, 629, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (70, 0, 0, NULL, 19, 630, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (71, 0, 0, 4, 5, 631, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (72, 1, 0, 4, 14, 632, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (73, 1, 0, 4, 20, 633, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (74, 1, 0, 12, 2, 656, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (75, 1, 0, 12, 14, 657, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (76, 0, 0, 12, 15, 658, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (77, 0, 0, 12, 16, 659, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKLog_Id], [FKCategory_Id]) VALUES (78, 1, 0, 12, 20, 660, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalIndividualFields] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalMarks] ON 
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (13, 2, 7, 558, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (14, 3, 7, 559, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (15, 4, 7, 560, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (16, 5, 7, 561, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (17, 3, 8, 562, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (18, 10, 8, 563, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (19, 3, NULL, 564, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (20, 5, NULL, 565, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (21, 6, NULL, 581, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (22, 10, NULL, 582, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (23, 4, 10, 583, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (24, 2, 11, 615, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (25, 10, 11, 616, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (26, 2, NULL, 617, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (27, 3, NULL, 618, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (28, 2, 12, 652, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (29, 3, 12, 653, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (30, 4, 12, 654, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (31, 5, 12, 655, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalMarks] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalMaterials] ON 
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (7, 5, 9, 555, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (8, 7, 9, 556, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (9, 6, NULL, 557, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (10, 5, 10, 579, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (11, 7, 10, 580, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (12, 6, 11, 613, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (13, 7, 11, 614, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (14, 5, NULL, 619, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (15, 7, NULL, 620, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKLogHistory_Id], [FKCategory_Id]) VALUES (16, 6, 4, 621, 1)
GO
SET IDENTITY_INSERT [Ads].[RentalMaterials] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalTimesTypes] ON 
GO
INSERT [Ads].[RentalTimesTypes] ([Id], [ResourceName]) VALUES (1, N'Day')
GO
INSERT [Ads].[RentalTimesTypes] ([Id], [ResourceName]) VALUES (2, N'Hour')
GO
INSERT [Ads].[RentalTimesTypes] ([Id], [ResourceName]) VALUES (3, N'Month')
GO
INSERT [Ads].[RentalTimesTypes] ([Id], [ResourceName]) VALUES (4, N'Week')
GO
SET IDENTITY_INSERT [Ads].[RentalTimesTypes] OFF
GO
SET IDENTITY_INSERT [Ads].[SubCategories] ON 
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (3, N'فيلا', N'Villa', 1, 132, 334, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (4, N'عمارة', N'ٍٍSpire', 1, 133, 335, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (5, N'ميكب', N'Makeup', 4, 138, 344, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (6, N'تصوير فديو', N'Video', 4, 139, 345, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (7, N'سيارات', N'Cars', 2, 140, 346, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (8, N'موتسيكلات', N'Motorcycle', 2, 141, 347, 3)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (9, N'تجربة فئة فرعية', N'sub category test', 7, 143, 554, 2)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (10, N'تجربة فئة فرعية 2', N'sub category test 2', 7, 144, 568, 3)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (11, N'شقة', N'Apartment', 1, 145, 606, 4)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [FKLog_Id], [ImagesCount]) VALUES (12, N'اتوبيسات', N'bus', 2, 146, 648, 4)
GO
SET IDENTITY_INSERT [Ads].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (1, N'28 Street Hmadey new test 00', N'12', 1, 1, N'nm')
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (2, N's', N'645', 1, 1, N'سيسي')
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (6, NULL, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (7, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[AlbumFiles] ON 
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (11, 4, 12)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (12, 4, 13)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (13, 4, 14)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (14, 4, 15)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (15, 4, 16)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (17, 5, 18)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (20, 5, 21)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (21, 5, 22)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (22, 5, 23)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (23, 5, 24)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (24, 5, 25)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (25, 7, 26)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (27, 9, 31)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (28, 9, 32)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (29, 9, 33)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (30, 9, 34)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (31, 8, 35)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (32, 8, 36)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (33, 8, 37)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (34, 8, 38)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (35, 8, 39)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (36, 10, 44)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (37, 10, 45)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (38, 10, 46)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (39, 11, 47)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (40, 11, 48)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (41, 11, 49)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (42, 11, 50)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (43, 12, 51)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (44, 12, 52)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (45, 12, 53)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (46, 12, 54)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (47, 12, 55)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (48, 13, 56)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (51, 16, 59)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (52, 16, 60)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (55, 17, 63)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (56, 17, 64)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (57, 17, 65)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (58, 17, 66)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (62, 18, 70)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (63, 18, 71)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (64, 18, 72)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (65, 18, 73)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (66, 18, 74)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (67, 18, 75)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (68, 18, 76)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (69, 18, 77)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (70, 18, 78)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (71, 17, 79)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (72, 17, 80)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (73, 17, 81)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (77, 22, 88)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (78, 23, 89)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (79, 24, 90)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (82, 21, 93)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (83, 21, 94)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (85, 21, 96)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (87, 21, 98)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (88, 21, 99)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (91, 21, 102)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (95, 28, 109)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (96, 28, 110)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (97, 28, 111)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (98, 28, 112)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (99, 28, 113)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (102, 29, 116)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (103, 29, 117)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (104, 29, 118)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (105, 29, 119)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (106, 29, 120)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (107, 30, 121)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (108, 31, 122)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (109, 32, 123)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (110, 33, 147)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (111, 33, 148)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (112, 33, 149)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (113, 33, 150)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (114, 34, 151)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (115, 34, 152)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (116, 34, 153)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (117, 34, 154)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (118, 35, 155)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (119, 35, 156)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (120, 35, 157)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (121, 35, 158)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (122, 36, 159)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (123, 36, 160)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (124, 36, 161)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (125, 36, 162)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (126, 37, 163)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (127, 37, 164)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (128, 37, 165)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (129, 37, 166)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (130, 38, 167)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (131, 38, 168)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (132, 38, 169)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (133, 38, 170)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (134, 39, 171)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (135, 39, 172)
GO
INSERT [dbo].[AlbumFiles] ([Id], [FkAlbum_Id], [FkFile_Id]) VALUES (136, 39, 173)
GO
SET IDENTITY_INSERT [dbo].[AlbumFiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (1, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (4, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (5, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (6, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (7, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (8, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (9, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (10, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (11, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (12, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (13, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (16, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (17, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (18, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (21, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (22, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (23, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (24, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (28, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (29, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (30, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (31, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (32, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (33, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (34, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (35, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (36, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (37, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (38, NULL)
GO
INSERT [dbo].[Albums] ([Id], [Notes]) VALUES (39, NULL)
GO
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[AppsInformation] ON 
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (1, N'ControllPanelLink', N'http://localhost:42004', 301)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (2, N'ApiLink', N'http://localhost:50353', 302)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (3, N'AboutUsAr', N'خلافاَ للإعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد، مما يجعله أكثر من 2000 عام في القدم. قام البروفيسور "ريتشارد ماك لينتوك" (Richard McClintock) وهو بروفيسور اللغة اللاتينية في جامعة هامبدن-سيدني في فيرجينيا بالبحث عن أصول كلمة لاتينية غامضة في نص لوريم إيبسوم وهي "consectetur"، وخلال تتبعه لهذه الكلمة في الأدب اللاتيني اكتشف المصدر الغير قابل للشك. فلقد اتضح أن كلمات نص لوريم إيبسوم تأتي من الأقسام 1.10.32 و 1.10.33 من كتاب "حول أقاصي الخير والشر" (de Finibus Bonorum et Malorum) للمفكر شيشيرون (Cicero) والذي كتبه في عام 45 قبل الميلاد. هذا الكتاب هو بمثابة مقالة علمية مطولة في نظرية الأخلاق، وكان له شعبية كبيرة في عصر النهضة. السطر الأول من لوريم إيبسوم "Lorem ipsum dolor sit amet.." يأتي من سطر في القسم 1.20.32 من هذا الكتاب.

', 303)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (4, N'AboutUsEn', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

', 304)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (5, N'TermsAr', N'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق "ليتراسيت" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل "ألدوس بايج مايكر" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.

', 305)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (6, N'TermsEn', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

', 339)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (7, N'PrivecyAr', N'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال "lorem ipsum" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.

', 338)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (8, N'PrivecyEn', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', 337)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkLog_Id]) VALUES (9, N'ApiFiles', N'http://localhost:42003/', 336)
GO
SET IDENTITY_INSERT [dbo].[AppsInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 
GO
INSERT [dbo].[Areas] ([Id], [Width], [Length], [Height]) VALUES (1, 2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FkLog_Id], [FKFile_Id], [CountryKey]) VALUES (1, N'مصر', N'Egypt', 1, 82, N'20')
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FkLog_Id], [FKFile_Id], [CountryKey]) VALUES (2, N'الكويت', N'Kwit', 31, 83, N'30')
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FkLog_Id], [FKFile_Id], [CountryKey]) VALUES (4, N'قطر', N'qutr', 327, 125, N'11')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Dates] ON 
GO
INSERT [dbo].[Dates] ([Id], [BeforeCurrentYear], [AfterCurrentYear], [FKDateTypeId], [IsDefult]) VALUES (4, 20, 21, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Dates] OFF
GO
SET IDENTITY_INSERT [dbo].[DatesTypes] ON 
GO
INSERT [dbo].[DatesTypes] ([Id], [NameAr], [NameEn]) VALUES (1, N'ميلادى', N'Miladey')
GO
INSERT [dbo].[DatesTypes] ([Id], [NameAr], [NameEn]) VALUES (2, N'هجرى', N'Hegrey')
GO
SET IDENTITY_INSERT [dbo].[DatesTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (1, N'/Files/Images/Users/Profile/003.jpg377876313.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (2, N'/Files/Images/Users/Profile/2013-04-20-056.jpg1710883803.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (3, N'/Files/Images/Products12.jpg133553739.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (4, N'/Files/Images/Products2013-04-18-005.jpg1620502976.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (5, N'/Files/Images/Products2013-04-18-008.jpg676717047.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (6, N'/Files/Images/Products2013-04-18-031.jpg257561010.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (7, N'/Files/Images/Products2013-04-18-018.jpg1821788483.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (8, N'/Files/Images/Products2013-04-18-031.jpg1719321017.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (9, N'/Files/Images/Products309533_175924209157228_1171723283_n.jpg1719321017.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (10, N'/Files/Images/Products2013-04-19-049.jpg110481015.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (11, N'/Files/Images/Products574671_423296531086660_623817755_n.jpg461852906.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (12, N'/Files/Images/Products2013-04-18-038.jpg2131060694.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (13, N'/Files/Images/Products2013-04-20-057.jpg334948938.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (14, N'/Files/Images/Products2013-04-18-031.jpg334948938.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (15, N'/Files/Images/Products2013-04-18-037.jpg1711904657.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (16, N'/Files/Images/Products2013-04-18-032.jpg103064655.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (18, N'/Files/Images/Products531038_384620164954297_319905800_n.jpg39438179.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (21, N'/Files/Images/Products2013-04-19-045.jpg1861438131.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (22, N'/Files/Images/Products2013-04-18-038.jpg338174276.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (23, N'/Files/Images/Products2013-04-18-031.jpg338174276.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (24, N'/Files/Images/Products2013-04-18-037.jpg1715129995.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (25, N'/Files/Images/Products2013-04-18-032.jpg944602067.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (26, N'/Files/Images/Products2013-04-18-008.jpg1859443628.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (27, N'~/Files/Images/Users/Profile/userDefult.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (28, N'~/Files/Images/Users/Profile/userDefult.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (29, N'~/Files/Images/Users/Profile/userDefult.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (31, N'/Files/Images/Products2013-04-18-005.jpg123537471.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (32, N'/Files/Images/Products2013-04-18-008.jpg123537471.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (33, N'/Files/Images/Products2013-04-18-031.jpg310809225.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (34, N'/Files/Images/Products2013-04-18-032.jpg310809225.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (35, N'/Files/Images/Products5.jpg1182994235.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (36, N'/Files/Images/Products3.jpg1182994235.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (37, N'/Files/Images/Products4.jpg1534366126.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (38, N'/Files/Images/Products6.jpg1534366126.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (39, N'/Files/Images/Products7.jpg1534366126.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (43, N'~/Files/Images/Users/Profile/userDefult.jpg', 2, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (44, N'/Files/Images/Products1.jpg478824495.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (45, N'/Files/Images/Products2.jpg523437024.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (46, N'/Files/Images/Products3.jpg523437024.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (47, N'/Files/Images/Products1.jpg1109421782.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (48, N'/Files/Images/Products2.jpg1879949710.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (49, N'/Files/Images/Products4.jpg1879949710.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (50, N'/Files/Images/Products3.jpg1528577819.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (51, N'/Files/Images/Products9_1.jpg1242339042.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (52, N'/Files/Images/Products11_2.jpg1242339042.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (53, N'/Files/Images/Products12_1.jpg1242339042.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (54, N'/Files/Images/Products8-1.jpg2012866970.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (55, N'/Files/Images/Products10_2.jpg284539360.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (56, N'/Files/Images/Products3-المجاملات.jpg1134500806.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (59, N'/Files/Images/Products1_2.jpg1174746056.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (60, N'/Files/Images/Offers9.jpg88721010.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (63, N'/Files/Images/Offers05_5.jpg1520483526.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (64, N'/Files/Images/Offers01_8.jpg1649465224.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (65, N'/Files/Images/Offers7.jpg1298093333.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (66, N'/Files/Images/Offers5.jpg340293651.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (70, N'/Files/Images/Offers5.jpg2136419628.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (71, N'/Files/Images/Offers05_5.jpg408092018.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (72, N'/Files/Images/Offers07_5.jpg1949147874.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (73, N'/Files/Images/Offers13.jpg1949147874.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (74, N'/Files/Images/Offers23.jpg1597775983.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (75, N'/Files/Images/Offers12.jpg220820264.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (76, N'/Files/Images/Offers21.jpg639976301.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (77, N'/Files/Images/Offers22.jpg639976301.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (78, N'/Files/Images/Offers11_1.jpg1410504229.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (79, N'/Files/Images/Offers8.jpg819622345.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (80, N'/Files/Images/Offers11_1.jpg489809904.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (81, N'/Files/Images/Offers23.jpg1679493869.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (82, N'Files/images/FlagsMiniSvg/egypt.svg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (83, N'Files/images/FlagsMiniSvg/kuwait.svg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (84, N'/Files/Images/FlagsMini/ae.png', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (87, N'/Files/Images/Ads05_5.jpg705231343.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (88, N'/Files/Images/Adslogo.jpg2360385.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (89, N'/Files/Images/AdsAaYNgYmrwYc.mp42046757864.mp4', 1, 4)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (90, N'/Files/Images/AdsAaYNgYmrwYc.mp42000234665.mp4', 1, 4)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (91, N'/Files/Images/Ads05_5.jpg1805464377.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (92, N'/Files/Images/Ads05_5.jpg162128813.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (93, N'/Files/Images/Ads1.JPG1529616209.JPG', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (94, N'/Files/Images/Ads13.jpg1529616209.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (95, N'/Files/Images/Ads22.jpg2119211102.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (96, N'/Files/Images/Ads16.jpg922643093.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (97, N'/Files/Images/Ads21.jpg789984256.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (98, N'/Files/Images/Ads02_7.jpg1800228815.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (99, N'/Files/Images/Ads16.jpg319703183.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (100, N'/Files/Images/Ads05_5.jpg1657811790.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (101, N'/Files/Images/Ads22.jpg221813801.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (102, N'/Files/Images/Ads07_5.jpg1674370795.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (104, N'~/Files/Images/Users/Profile/userDefult.jpg', 2, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (105, N'~/Files/Images/Users/Profile/userDefult.jpg', 2, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (109, N'/Files/Images/Offers23.jpg2129697883.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (110, N'/Files/Images/Offers12.jpg2129697883.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (111, N'/Files/Images/Offers13.jpg752742164.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (112, N'/Files/Images/Offers22.jpg752742164.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (113, N'/Files/Images/Offers21.jpg1523270092.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (114, N'/Files/Images/Offers11_1.jpg1171898201.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (116, N'/Files/Images/Offers32.jpg412551872.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (117, N'/Files/Images/Offers40.jpg1183079800.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (118, N'/Files/Images/Offers33.jpg1183079800.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (119, N'/Files/Images/Offers42.jpg1183079800.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (120, N'/Files/Images/Offers41.jpg831707909.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (121, N'~/Files/Images/Users/Profile/userDefult.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (122, N'/Files/Videos/Ads36759182_1478666728904419_3319110486800203776_n.mp4229300315.mp4', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (123, N'/Files/Videos/Ads37327646_198193614182966_9178070182105448448_n.mp41438192107.mp4', 1, 4)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (124, N'~/Files/Images/Users/Profile/userDefult.jpg', 2, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (125, N'Files/images/FlagsMiniSvg/qatar.svg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (127, N'/Files/Images/Rental/RentalCategory/Gulf-Photo654584827.jpeg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (128, N'/Files/Images/Rental/RentalCategory/Gulf-Photo1933131857.jpeg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (130, N'/Files/Images/Tageer-Photo-5c86bbf0-fe2b-4f3d-95da-30a91c17b4f1.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (131, N'/Files/Images/Rental/RentalSubCategory/Gulf-Photo1393508466.jpeg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (132, N'/Files/Images/Rental/RentalSubCategory/Gulf-Photo110493558.jpeg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (133, N'/Files/Images/Rental/RentalSubCategory/Gulf-Photo1300177523.jpeg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (134, N'"/Files/Images/Tageer-Photo-6e4aa88d-b4c8-4a0b-833c-62c967cb7b37..jpg"', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (135, N'/Files/Images/Tageer-Photo-e944ac81-7422-473b-b512-968e8eddd8b3..jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (136, N'/Files/Images/Tageer-Photo-f218fe04-5cb1-475d-ba7b-8c88513db34e..jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (137, N'/Files/Images/Tageer-Photo-8445e9c0-353a-409e-978d-bd67e7642d0b..jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (138, N'/Files/Images/Tageer-Photo-3e56a9d7-08be-4b50-ba3a-5579812b0527.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (139, N'/Files/Images/Tageer-Photo-03664d20-c9bc-44c2-a664-8b7085d1490b.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (140, N'/Files/Images/Tageer-Photo-7e62d01d-f9d2-4bce-939f-3914294a08ef.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (141, N'/Files/Images/Tageer-Photo-846be0a0-1341-458d-b67e-3199f8317154.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (142, N'/Files/Images/Tageer-Photo-854a5d2e-0efa-4858-bcd4-56d8e14f98f2.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (143, N'/Files/Images/Tageer-Photo-3b39b56e-d8a3-41ae-a877-cf2209a7e9a4.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (144, N'/Files/Images/Tageer-Photo-13308857-1a1f-460c-b3ce-5c543e4870a0.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (145, N'/Files/Images/Tageer-Photo-c5fc1a1e-b07b-419c-9833-5aae4018a07e.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (146, N'/Files/Images/Tageer-Photo-45a1481d-8746-4cbd-8346-44afd81c87c1.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (147, N'/Files/Images/Tageer-Photo-b17a7391-b55f-419f-9d69-bf81c6f74b9c.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (148, N'/Files/Images/Tageer-Photo-071c3c27-4b67-41a1-856d-041015a08d48.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (149, N'/Files/Images/Tageer-Photo-934785d6-6ace-49c9-9a8b-c0623efc860e.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (150, N'/Files/Images/Tageer-Photo-8bf05792-8e48-4cb1-b89f-c85578a5bdbe.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (151, N'/Files/Images/Tageer-Photo-a3c340c3-c99a-41a0-a1ad-f0e076eabb95.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (152, N'/Files/Images/Tageer-Photo-a35c2234-d3f7-46a3-8ff9-d34ddfd57c28.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (153, N'/Files/Images/Tageer-Photo-a4f0d366-9398-4b80-8c4e-43140a97b3f4.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (154, N'/Files/Images/Tageer-Photo-6ee88844-7a94-44cc-b596-61df6e16df22.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (155, N'/Files/Images/Tageer-Photo-b3f963d8-84d0-42f8-aab3-559feb676b38.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (156, N'/Files/Images/Tageer-Photo-93bd93bd-28d5-4501-9ad5-0af07c36c357.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (157, N'/Files/Images/Tageer-Photo-7a57fb1d-bd1f-4eeb-b543-23487e04644c.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (158, N'/Files/Images/Tageer-Photo-a77b4e9b-f972-4ed7-b85b-8533b5119529.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (159, N'/Files/Images/Tageer-Photo-b1edfe52-9d64-4a1c-a538-af73bd0e2cc8.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (160, N'/Files/Images/Tageer-Photo-690ad32b-816f-481c-9ced-dd92e1a01636.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (161, N'/Files/Images/Tageer-Photo-5cdea4fb-3360-4cd1-b320-c72341e0cb08.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (162, N'/Files/Images/Tageer-Photo-078d0441-92d6-472b-8a9c-358b88558d0f.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (163, N'/Files/Images/Tageer-Photo-1964a537-918f-4aab-8559-ee25ef57a1a9.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (164, N'/Files/Images/Tageer-Photo-d7001d7a-92b6-4281-a517-a2e89343f7ff.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (165, N'/Files/Images/Tageer-Photo-01e22079-e60c-4240-afb2-89dea6e9740c.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (166, N'/Files/Images/Tageer-Photo-3f262758-0117-446e-b2b8-1877f0404968.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (167, N'/Files/Images/Tageer-Photo-c65b47a4-aa9f-46a8-a5c0-7396dfc3fb0c.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (168, N'/Files/Images/Tageer-Photo-79c5d1c4-34fe-4126-8260-0c6b3130ae6d.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (169, N'/Files/Images/Tageer-Photo-f9dace1e-3c4d-4149-b43c-32706ef65d72.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (170, N'/Files/Images/Tageer-Photo-d8c64456-1937-425f-8cf7-d8bba9589940.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (171, N'/Files/Images/Tageer-Photo-2ed83e6a-6e42-4538-8817-40ae0b8af95f.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (172, N'/Files/Images/Tageer-Photo-975e8031-d947-4543-9247-a1ac41814907.jpg', 9, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (173, N'/Files/Images/Tageer-Photo-3fb92c74-7c83-4e93-866c-762043c896f2.jpg', 9, 1)
GO
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[FileTypes] ON 
GO
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (1, N'Image')
GO
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (2, N'Text')
GO
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (3, N'Audio')
GO
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (4, N'Video')
GO
SET IDENTITY_INSERT [dbo].[FileTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 
GO
INSERT [dbo].[Genders] ([Id], [ResourceName]) VALUES (1, N'Male')
GO
INSERT [dbo].[Genders] ([Id], [ResourceName]) VALUES (2, N'Female')
GO
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Histories] ON 
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (111, CAST(N'2018-09-16T00:16:26.573' AS DateTime), NULL, 1, 1, 19, 203, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (112, CAST(N'2018-09-16T00:16:42.780' AS DateTime), NULL, 2, 1, 19, 1, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (114, CAST(N'2018-09-16T00:16:53.407' AS DateTime), NULL, 3, 1, 19, NULL, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (115, CAST(N'2018-09-16T00:16:53.483' AS DateTime), NULL, 1, 1, 19, 205, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (116, CAST(N'2018-09-16T00:46:34.340' AS DateTime), NULL, 1, 1, 19, 218, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (117, CAST(N'2018-09-16T00:50:53.443' AS DateTime), NULL, 2, 1, 19, 203, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (118, CAST(N'2018-09-16T00:50:57.000' AS DateTime), NULL, 2, 1, 19, 205, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (119, CAST(N'2018-09-16T00:50:57.927' AS DateTime), NULL, 2, 1, 19, 218, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (120, CAST(N'2018-09-16T01:23:18.157' AS DateTime), NULL, 1, 1, 20, 219, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (122, CAST(N'2018-09-16T01:23:25.543' AS DateTime), NULL, 3, 1, 20, NULL, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (123, CAST(N'2018-09-16T01:23:36.353' AS DateTime), NULL, 2, 1, 20, 219, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (124, CAST(N'2018-09-16T01:26:27.213' AS DateTime), NULL, 2, 1, 20, 219, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (125, CAST(N'2018-09-16T01:26:27.233' AS DateTime), NULL, 1, 1, 20, 221, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (126, CAST(N'2018-09-16T01:26:27.240' AS DateTime), NULL, 1, 1, 20, 222, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (127, CAST(N'2018-09-16T01:33:26.127' AS DateTime), NULL, 1, 1, 20, 223, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (128, CAST(N'2018-09-16T01:33:26.137' AS DateTime), NULL, 1, 1, 20, 224, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (129, CAST(N'2018-09-16T01:33:26.137' AS DateTime), NULL, 1, 1, 20, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (130, CAST(N'2018-09-16T05:02:10.993' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (131, CAST(N'2018-09-16T05:02:35.440' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (132, CAST(N'2018-09-16T05:02:40.167' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (133, CAST(N'2018-09-16T22:10:51.830' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (134, CAST(N'2018-09-16T22:12:47.620' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (135, CAST(N'2018-09-16T22:14:51.200' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (136, CAST(N'2018-09-19T15:41:23.690' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (137, CAST(N'2018-09-19T15:41:23.707' AS DateTime), NULL, 4, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (138, CAST(N'2018-09-19T15:42:21.690' AS DateTime), NULL, 2, 1, 21, 236, N'Test', N'تجربة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (139, CAST(N'2018-09-19T17:26:50.067' AS DateTime), NULL, 2, 1, 21, 236, N'اعلان الدياسطى', N'اعلان الدياسطى')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (140, CAST(N'2018-09-19T17:26:50.073' AS DateTime), NULL, 5, 1, 21, 236, N'اعلان الدياسطى', N'اعلان الدياسطى')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (145, CAST(N'2018-09-24T01:50:13.147' AS DateTime), NULL, 1, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (146, CAST(N'2018-09-24T01:50:39.803' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (147, CAST(N'2018-09-24T01:54:41.060' AS DateTime), NULL, 3, 1, 20, NULL, N'dsdDSDS', N'dsdDSDS')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (148, CAST(N'2018-09-24T14:40:36.360' AS DateTime), NULL, 1, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (149, CAST(N'2018-09-24T14:40:51.060' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (150, CAST(N'2018-09-24T14:41:02.017' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (151, CAST(N'2018-09-24T14:41:11.827' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (152, CAST(N'2018-09-24T14:42:59.667' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (153, CAST(N'2018-09-24T14:43:36.190' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (154, CAST(N'2018-09-24T14:44:07.013' AS DateTime), NULL, 2, 1, 21, 251, N'new test offer', N'new test offer')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (155, CAST(N'2018-09-24T14:51:57.103' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (156, CAST(N'2018-09-24T14:52:09.807' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (157, CAST(N'2018-09-24T14:52:28.717' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (158, CAST(N'2018-09-24T14:54:51.677' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (159, CAST(N'2018-09-24T14:57:22.493' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (160, CAST(N'2018-09-24T14:57:40.790' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (161, CAST(N'2018-09-24T14:57:53.320' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (162, CAST(N'2018-09-24T14:58:14.127' AS DateTime), NULL, 2, 1, 21, 250, N'sdsdsd', N'sdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (163, CAST(N'2018-09-29T23:34:54.310' AS DateTime), NULL, 2, 1, 4, 1, N'sd5', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (164, CAST(N'2018-09-29T23:34:54.370' AS DateTime), NULL, 2, 1, 4, 31, N'Kwit', N'الكوست')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (165, CAST(N'2018-09-29T23:35:12.933' AS DateTime), NULL, 2, 1, 4, 1, N'sd5', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (166, CAST(N'2018-09-30T14:31:12.293' AS DateTime), NULL, 2, 1, 4, 1, N'sd5', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (167, CAST(N'2018-09-30T14:31:23.710' AS DateTime), NULL, 2, 1, 4, 31, N'Kwit', N'الكوست')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (168, CAST(N'2018-09-30T14:33:38.893' AS DateTime), NULL, 2, 1, 4, 1, N'sd5', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (170, CAST(N'2018-09-30T14:34:58.563' AS DateTime), NULL, 3, 1, 4, NULL, N'w', N'e')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (171, CAST(N'2018-09-30T16:43:40.210' AS DateTime), NULL, 2, 1, 21, 236, N'اعلان الدياسطى', N'اعلان الدياسطى')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (172, CAST(N'2018-09-30T16:54:49.300' AS DateTime), NULL, 2, 1, 21, 236, N'Live', N'مباشر')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (173, CAST(N'2018-09-30T19:03:39.027' AS DateTime), NULL, 1, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (174, CAST(N'2018-09-30T21:27:07.820' AS DateTime), NULL, 1, 1, 21, 257, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (175, CAST(N'2018-09-30T21:52:27.757' AS DateTime), NULL, 1, 1, 21, 258, N'323`', N'323`')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (176, CAST(N'2018-09-30T22:04:19.163' AS DateTime), NULL, 1, 1, 21, 259, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (177, CAST(N'2018-09-30T23:20:09.000' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (178, CAST(N'2018-09-30T23:20:19.313' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (179, CAST(N'2018-09-30T23:26:35.293' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (180, CAST(N'2018-09-30T23:26:50.280' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (181, CAST(N'2018-09-30T23:27:33.217' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (182, CAST(N'2018-09-30T23:42:13.483' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (183, CAST(N'2018-09-30T23:42:44.237' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (184, CAST(N'2018-09-30T23:43:01.207' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (185, CAST(N'2018-10-01T01:11:23.900' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (186, CAST(N'2018-10-01T01:11:54.117' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (187, CAST(N'2018-10-01T01:12:59.637' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (188, CAST(N'2018-10-01T01:22:05.123' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (189, CAST(N'2018-10-01T01:22:32.363' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (190, CAST(N'2018-10-01T01:23:04.010' AS DateTime), NULL, 2, 1, 21, 255, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (191, CAST(N'2018-10-01T01:26:09.630' AS DateTime), NULL, 2, 1, 21, 259, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (194, CAST(N'2018-10-13T10:11:56.267' AS DateTime), NULL, 2, 1, 23, 29, N'Mansoura -', N'المنصورة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (195, CAST(N'2018-10-13T10:23:00.500' AS DateTime), NULL, 2, 1, 26, 278, N'', N'')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (196, CAST(N'2018-10-13T10:23:15.243' AS DateTime), NULL, 2, 1, 26, 278, N'', N'')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (197, CAST(N'2018-10-13T10:24:05.613' AS DateTime), NULL, 2, 1, 26, 278, N'', N'')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (198, CAST(N'2018-10-14T04:08:49.777' AS DateTime), NULL, 6, 10, 21, NULL, N'New Test App', N'New Test App')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (199, CAST(N'2018-10-14T18:04:24.127' AS DateTime), NULL, 2, 1, 21, 259, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (200, CAST(N'2018-10-14T18:04:37.490' AS DateTime), NULL, 2, 1, 21, 259, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (201, CAST(N'2018-10-14T18:04:49.367' AS DateTime), NULL, 2, 1, 21, 259, N'Preview Tajmeel Api', N'Preview Tajmeel Api')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (202, CAST(N'2018-10-14T19:41:38.590' AS DateTime), NULL, 2, 1, 21, 259, N'x', N'x')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (203, CAST(N'2018-10-14T19:41:45.387' AS DateTime), NULL, 2, 1, 21, 259, N'x0', N'x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (204, CAST(N'2018-10-14T19:41:49.863' AS DateTime), NULL, 2, 1, 21, 259, N'x0', N'x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (205, CAST(N'2018-10-14T19:41:54.230' AS DateTime), NULL, 2, 1, 21, 259, N'x0', N'x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (206, CAST(N'2018-10-14T19:45:14.257' AS DateTime), NULL, 1, 1, 21, 288, N'newImage', N'newImage')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (207, CAST(N'2018-10-14T19:51:15.413' AS DateTime), NULL, 1, 1, 21, 289, N'x2', N'x2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (208, CAST(N'2018-10-14T19:51:19.973' AS DateTime), NULL, 2, 1, 21, 289, N'x2', N'x2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (209, CAST(N'2018-10-14T19:52:42.510' AS DateTime), NULL, 2, 1, 21, 259, N'x0', N'x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (210, CAST(N'2018-10-14T19:53:17.617' AS DateTime), NULL, 2, 1, 21, 259, N'x0', N'x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (211, CAST(N'2018-10-14T19:53:20.567' AS DateTime), NULL, 2, 1, 21, 259, N'0x0', N'0x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (212, CAST(N'2018-10-14T19:53:54.943' AS DateTime), NULL, 2, 1, 21, 259, N'0x0', N'0x0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (213, CAST(N'2018-10-14T19:55:10.940' AS DateTime), NULL, 1, 1, 21, 290, N'ad video', N'ad video')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (214, CAST(N'2018-10-14T20:03:00.767' AS DateTime), NULL, 2, 1, 21, 258, N'323`', N'323`')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (215, CAST(N'2018-10-14T20:24:13.330' AS DateTime), NULL, 2, 1, 21, 258, N'323`', N'323`')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (216, CAST(N'2018-10-14T21:30:27.297' AS DateTime), NULL, 1, 1, 21, 291, N'sd', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (217, CAST(N'2018-10-14T21:36:24.897' AS DateTime), NULL, 2, 1, 21, 291, N'sd', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (218, CAST(N'2018-10-14T21:49:11.100' AS DateTime), NULL, 1, 1, 21, 292, N'lastVoder', N'lastVoder')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (219, CAST(N'2018-10-14T21:49:18.323' AS DateTime), NULL, 2, 1, 21, 292, N'lastVoder', N'lastVoder')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (220, CAST(N'2018-10-14T21:49:25.420' AS DateTime), NULL, 2, 1, 21, 292, N'lastVoder', N'lastVoder')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (221, CAST(N'2018-10-17T00:43:12.587' AS DateTime), NULL, 2, 1, 28, 303, N'dsdsdsd', N'dsdsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (222, CAST(N'2018-10-17T00:43:12.500' AS DateTime), NULL, 2, 1, 28, 301, N'http://localhost:43913', N'http://localhost:43913')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (223, CAST(N'2018-10-17T00:43:12.583' AS DateTime), NULL, 2, 1, 28, 302, N'http://localhost:50353', N'http://localhost:50353')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (224, CAST(N'2018-10-17T00:43:12.600' AS DateTime), NULL, 2, 1, 28, 304, N'dsd', N'dsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (225, CAST(N'2018-10-17T00:43:17.960' AS DateTime), NULL, 2, 1, 28, 303, N'dsdsdsddsdsd', N'dsdsdsddsdsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (226, CAST(N'2018-10-17T00:43:17.947' AS DateTime), NULL, 2, 1, 28, 301, N'http://localhost:43913', N'http://localhost:43913')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (227, CAST(N'2018-10-17T00:43:17.953' AS DateTime), NULL, 2, 1, 28, 302, N'http://localhost:50353', N'http://localhost:50353')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (228, CAST(N'2018-10-17T00:43:17.967' AS DateTime), NULL, 2, 1, 28, 304, N'dsd', N'dsd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (229, CAST(N'2018-10-17T20:04:46.777' AS DateTime), NULL, 2, 1, 28, 301, N'http://dsds', N'http://dsds')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (230, CAST(N'2018-10-17T20:04:56.267' AS DateTime), NULL, 2, 1, 28, 301, N'http://dsds0', N'http://dsds0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (231, CAST(N'2018-10-19T01:25:53.423' AS DateTime), NULL, 2, 1, 28, 301, N'http://localhost:43913', N'http://localhost:43913')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1199, CAST(N'2018-10-23T04:35:34.873' AS DateTime), NULL, 7, 12, 21, 307, N'Public Live Stream', N'بث مباشر عام')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1200, CAST(N'2018-11-06T02:29:56.147' AS DateTime), NULL, 2, 1, 4, 1, N'sd5', N'sd')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1201, CAST(N'2018-11-06T02:29:56.310' AS DateTime), NULL, 2, 1, 4, 31, N'Kwit', N'الكوست')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1202, CAST(N'2018-11-17T01:47:34.483' AS DateTime), NULL, 1, 1, 4, 327, N'qutr', N'قطر')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1203, CAST(N'2018-11-17T03:39:01.063' AS DateTime), NULL, 1, 1, 20, 332, N'n', N'j')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1204, CAST(N'2018-11-17T03:54:56.590' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1205, CAST(N'2018-11-17T03:54:56.650' AS DateTime), NULL, 1, 1, 20, 333, N'Cars', N'سيارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1206, CAST(N'2018-11-17T03:57:38.483' AS DateTime), NULL, 1, 1, 20, 334, N'Villa', N'فيلا')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1207, CAST(N'2018-11-17T03:57:38.523' AS DateTime), NULL, 1, 1, 20, 335, N'ٍٍSpire', N'عمارة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1208, CAST(N'2018-11-24T00:04:13.203' AS DateTime), NULL, 1, 1, 19, 340, N'Wedding Supplies', N'لوازم افراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1209, CAST(N'2018-11-24T00:04:41.207' AS DateTime), NULL, 3, 1, 19, NULL, N'لوازم افراح', N'لوازم افراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1210, CAST(N'2018-11-24T00:09:19.780' AS DateTime), NULL, 1, 1, 19, 341, N'Wedding Supplies', N'لوازم الافراحح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1211, CAST(N'2018-11-24T00:18:30.263' AS DateTime), NULL, 1, 1, 19, 342, N'يسي', N'سي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1212, CAST(N'2018-11-24T02:49:41.020' AS DateTime), NULL, 2, 1, 19, 342, N'يسي', N'سي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1213, CAST(N'2018-11-24T02:52:12.147' AS DateTime), NULL, 2, 1, 19, 342, N'يسي', N'سي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1214, CAST(N'2018-11-24T02:54:13.690' AS DateTime), NULL, 2, 1, 19, 342, N'يسي', N'سي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1215, CAST(N'2018-11-24T02:57:25.480' AS DateTime), NULL, 3, 1, 19, NULL, N'سي', N'سي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1216, CAST(N'2018-11-24T03:00:49.073' AS DateTime), NULL, 1, 1, 19, 343, N'we', N'fdfdf')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1217, CAST(N'2018-11-24T03:01:30.950' AS DateTime), NULL, 2, 1, 19, 343, N'we', N'fdfdf')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1218, CAST(N'2018-11-24T03:02:08.673' AS DateTime), NULL, 3, 1, 19, NULL, N'fdfdf', N'fdfdf')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1219, CAST(N'2018-11-24T03:03:40.927' AS DateTime), NULL, 2, 1, 19, 341, N'Wedding Supplies', N'لوازم الافراحح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1220, CAST(N'2018-11-24T03:04:18.607' AS DateTime), NULL, 2, 1, 19, 341, N'Wedding Supplies', N'لوازم الافراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1221, CAST(N'2018-11-24T03:05:03.677' AS DateTime), NULL, 1, 1, 20, 344, N'سشسيبب', N'شسيب')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1222, CAST(N'2018-11-24T03:13:21.127' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1223, CAST(N'2018-11-24T03:15:13.550' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1224, CAST(N'2018-11-24T03:15:42.367' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1225, CAST(N'2018-11-24T03:18:32.657' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1226, CAST(N'2018-11-24T03:21:55.720' AS DateTime), NULL, 2, 1, 19, 332, N'Motorcycle', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1227, CAST(N'2018-11-24T03:28:26.927' AS DateTime), NULL, 3, 1, 19, NULL, N'درجات بخارية', N'درجات بخارية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1228, CAST(N'2018-11-24T03:28:27.143' AS DateTime), NULL, 3, 1, 19, NULL, N'سيارات', N'سيارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1229, CAST(N'2018-11-25T11:29:54.763' AS DateTime), NULL, 2, 1, 19, 341, N'Wedding Tools', N'لوازم الافراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1230, CAST(N'2018-11-25T11:31:15.737' AS DateTime), NULL, 2, 1, 19, 344, N'Makeup', N'ميكب')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1231, CAST(N'2018-11-25T11:33:29.083' AS DateTime), NULL, 2, 1, 19, 344, N'Makeup', N'ميكب')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1232, CAST(N'2018-11-25T11:34:44.307' AS DateTime), NULL, 1, 1, 20, 345, N'Video', N'تصوير فديو')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1233, CAST(N'2018-11-25T11:36:04.783' AS DateTime), NULL, 1, 1, 20, 346, N'Cars', N'سيارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1234, CAST(N'2018-11-25T11:36:39.173' AS DateTime), NULL, 1, 1, 20, 347, N'Motorcycle', N'موتسيكلات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1235, CAST(N'2018-11-26T01:19:27.193' AS DateTime), NULL, 1, 1, 35, 352, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1236, CAST(N'2018-11-26T01:19:27.273' AS DateTime), NULL, 1, 1, 35, 353, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1237, CAST(N'2018-11-26T01:19:27.283' AS DateTime), NULL, 1, 1, 35, 354, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1238, CAST(N'2018-11-26T01:19:27.293' AS DateTime), NULL, 1, 1, 35, 355, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1239, CAST(N'2018-11-26T01:19:27.307' AS DateTime), NULL, 1, 1, 35, 356, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1240, CAST(N'2018-11-26T01:19:27.320' AS DateTime), NULL, 1, 1, 35, 357, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1241, CAST(N'2018-11-26T01:31:01.023' AS DateTime), NULL, 2, 1, 35, 352, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1242, CAST(N'2018-11-26T01:31:02.220' AS DateTime), NULL, 2, 1, 35, 353, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1243, CAST(N'2018-11-26T01:31:03.337' AS DateTime), NULL, 2, 1, 35, 354, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1244, CAST(N'2018-11-26T01:31:05.200' AS DateTime), NULL, 2, 1, 35, 355, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1245, CAST(N'2018-11-26T01:31:05.290' AS DateTime), NULL, 2, 1, 35, 356, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1246, CAST(N'2018-11-26T01:31:05.443' AS DateTime), NULL, 2, 1, 35, 357, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1247, CAST(N'2018-11-26T01:31:13.013' AS DateTime), NULL, 2, 1, 35, 357, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1248, CAST(N'2018-11-26T01:31:12.613' AS DateTime), NULL, 2, 1, 35, 352, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1249, CAST(N'2018-11-26T01:31:12.693' AS DateTime), NULL, 2, 1, 35, 353, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1250, CAST(N'2018-11-26T01:31:12.770' AS DateTime), NULL, 2, 1, 35, 354, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1251, CAST(N'2018-11-26T01:31:12.853' AS DateTime), NULL, 2, 1, 35, 355, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1252, CAST(N'2018-11-26T01:31:12.930' AS DateTime), NULL, 2, 1, 35, 356, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1253, CAST(N'2018-11-26T01:35:12.303' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1254, CAST(N'2018-11-26T01:35:12.350' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1255, CAST(N'2018-11-26T01:35:12.400' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1256, CAST(N'2018-11-26T01:35:12.433' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1257, CAST(N'2018-11-26T01:35:12.510' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1258, CAST(N'2018-11-26T01:35:12.543' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1259, CAST(N'2018-11-26T01:35:24.877' AS DateTime), NULL, 1, 1, 35, 358, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1260, CAST(N'2018-11-26T01:35:24.930' AS DateTime), NULL, 1, 1, 35, 359, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1261, CAST(N'2018-11-26T01:36:02.560' AS DateTime), NULL, 2, 1, 35, 358, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1262, CAST(N'2018-11-26T01:36:02.670' AS DateTime), NULL, 2, 1, 35, 359, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1263, CAST(N'2018-11-26T01:41:47.487' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1264, CAST(N'2018-11-26T01:41:47.547' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1265, CAST(N'2018-11-26T01:47:44.707' AS DateTime), NULL, 1, 1, 35, 360, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1266, CAST(N'2018-11-26T01:51:17.843' AS DateTime), NULL, 1, 1, 35, 361, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1267, CAST(N'2018-11-26T01:51:47.900' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1268, CAST(N'2018-11-26T01:56:58.193' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1269, CAST(N'2018-11-26T01:56:58.153' AS DateTime), NULL, 1, 1, 35, 362, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1270, CAST(N'2018-11-26T01:56:58.160' AS DateTime), NULL, 1, 1, 35, 363, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1271, CAST(N'2018-11-26T01:56:58.163' AS DateTime), NULL, 1, 1, 35, 364, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1272, CAST(N'2018-11-26T01:56:58.170' AS DateTime), NULL, 1, 1, 35, 365, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1273, CAST(N'2018-11-26T01:56:58.173' AS DateTime), NULL, 1, 1, 35, 366, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1274, CAST(N'2018-11-26T01:56:58.180' AS DateTime), NULL, 1, 1, 35, 367, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1275, CAST(N'2018-11-26T01:56:58.190' AS DateTime), NULL, 1, 1, 35, 368, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1276, CAST(N'2018-11-26T01:58:25.580' AS DateTime), NULL, 1, 1, 35, 369, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1277, CAST(N'2018-11-26T01:58:25.637' AS DateTime), NULL, 1, 1, 35, 370, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1278, CAST(N'2018-11-26T01:58:25.643' AS DateTime), NULL, 1, 1, 35, 371, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1279, CAST(N'2018-11-26T12:37:22.343' AS DateTime), NULL, 2, 1, 35, 362, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1280, CAST(N'2018-11-26T12:37:22.350' AS DateTime), NULL, 2, 1, 35, 363, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1281, CAST(N'2018-11-26T12:37:22.360' AS DateTime), NULL, 2, 1, 35, 364, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1282, CAST(N'2018-11-26T12:37:22.363' AS DateTime), NULL, 2, 1, 35, 365, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1283, CAST(N'2018-11-26T12:37:22.367' AS DateTime), NULL, 2, 1, 35, 366, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1284, CAST(N'2018-11-26T12:37:22.373' AS DateTime), NULL, 2, 1, 35, 367, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1285, CAST(N'2018-11-26T12:37:22.383' AS DateTime), NULL, 2, 1, 35, 368, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1286, CAST(N'2018-11-30T23:01:46.763' AS DateTime), NULL, 1, 1, 35, 372, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1287, CAST(N'2018-11-30T23:01:47.100' AS DateTime), NULL, 1, 1, 35, 373, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1288, CAST(N'2018-11-30T23:01:47.110' AS DateTime), NULL, 1, 1, 35, 374, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1289, CAST(N'2018-11-30T23:01:47.120' AS DateTime), NULL, 1, 1, 35, 375, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1290, CAST(N'2018-11-30T23:01:47.130' AS DateTime), NULL, 1, 1, 35, 376, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1291, CAST(N'2018-12-03T11:09:41.873' AS DateTime), NULL, 2, 1, 35, 372, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1292, CAST(N'2018-12-03T11:09:41.930' AS DateTime), NULL, 2, 1, 35, 373, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1293, CAST(N'2018-12-03T11:09:41.940' AS DateTime), NULL, 2, 1, 35, 374, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1294, CAST(N'2018-12-03T11:09:42.010' AS DateTime), NULL, 2, 1, 35, 375, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1295, CAST(N'2018-12-03T11:09:42.020' AS DateTime), NULL, 2, 1, 35, 376, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1296, CAST(N'2018-12-03T11:09:41.690' AS DateTime), NULL, 1, 1, 35, 377, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1297, CAST(N'2018-12-03T11:09:41.713' AS DateTime), NULL, 1, 1, 35, 378, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1298, CAST(N'2018-12-03T11:09:41.717' AS DateTime), NULL, 1, 1, 35, 379, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1299, CAST(N'2018-12-03T11:09:41.720' AS DateTime), NULL, 1, 1, 35, 380, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1300, CAST(N'2018-12-03T11:09:41.727' AS DateTime), NULL, 1, 1, 35, 381, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1301, CAST(N'2018-12-03T11:09:41.890' AS DateTime), NULL, 1, 1, 35, 382, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1302, CAST(N'2018-12-03T11:09:41.910' AS DateTime), NULL, 1, 1, 35, 383, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1303, CAST(N'2018-12-03T11:09:41.950' AS DateTime), NULL, 1, 1, 35, 384, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1304, CAST(N'2018-12-03T11:09:41.967' AS DateTime), NULL, 1, 1, 35, 385, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1305, CAST(N'2018-12-03T11:09:41.990' AS DateTime), NULL, 1, 1, 35, 386, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1306, CAST(N'2018-12-03T11:09:42.037' AS DateTime), NULL, 1, 1, 35, 387, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1307, CAST(N'2018-12-03T11:09:42.067' AS DateTime), NULL, 1, 1, 35, 388, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1308, CAST(N'2018-12-03T12:40:28.973' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1309, CAST(N'2018-12-03T12:40:29.573' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1310, CAST(N'2018-12-03T12:40:29.583' AS DateTime), NULL, 2, 1, 35, 381, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1311, CAST(N'2018-12-03T12:40:29.600' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1312, CAST(N'2018-12-03T12:40:29.617' AS DateTime), NULL, 2, 1, 35, 383, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1313, CAST(N'2018-12-03T12:40:29.617' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1314, CAST(N'2018-12-03T12:40:29.637' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1315, CAST(N'2018-12-03T12:40:29.647' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1316, CAST(N'2018-12-03T12:40:29.653' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1317, CAST(N'2018-12-03T12:40:29.660' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1318, CAST(N'2018-12-03T12:40:29.667' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1319, CAST(N'2018-12-03T12:40:28.950' AS DateTime), NULL, 2, 1, 35, 377, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1320, CAST(N'2018-12-03T12:40:29.567' AS DateTime), NULL, 2, 1, 35, 379, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1321, CAST(N'2018-12-03T12:40:29.610' AS DateTime), NULL, 2, 1, 35, 382, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1322, CAST(N'2018-12-03T12:40:29.627' AS DateTime), NULL, 2, 1, 35, 374, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1323, CAST(N'2018-12-03T12:40:29.633' AS DateTime), NULL, 2, 1, 35, 384, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1324, CAST(N'2018-12-03T12:40:29.677' AS DateTime), NULL, 2, 1, 35, 388, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1325, CAST(N'2018-12-03T12:41:57.967' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1326, CAST(N'2018-12-03T12:41:57.877' AS DateTime), NULL, 2, 1, 35, 377, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1327, CAST(N'2018-12-03T12:41:57.937' AS DateTime), NULL, 2, 1, 35, 379, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1328, CAST(N'2018-12-03T12:41:57.937' AS DateTime), NULL, 2, 1, 35, 381, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1329, CAST(N'2018-12-03T12:41:57.940' AS DateTime), NULL, 2, 1, 35, 382, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1330, CAST(N'2018-12-03T12:41:57.943' AS DateTime), NULL, 2, 1, 35, 383, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1331, CAST(N'2018-12-03T12:41:57.947' AS DateTime), NULL, 2, 1, 35, 374, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1332, CAST(N'2018-12-03T12:41:57.950' AS DateTime), NULL, 2, 1, 35, 384, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1333, CAST(N'2018-12-05T15:25:49.120' AS DateTime), NULL, 1, 1, 38, 398, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1334, CAST(N'2018-12-05T15:28:04.877' AS DateTime), NULL, 3, 1, 38, NULL, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1335, CAST(N'2018-12-05T15:31:12.300' AS DateTime), NULL, 1, 1, 38, 399, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1336, CAST(N'2018-12-05T15:31:12.340' AS DateTime), NULL, 1, 1, 38, 400, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1337, CAST(N'2018-12-05T15:31:12.343' AS DateTime), NULL, 1, 1, 38, 401, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1338, CAST(N'2018-12-05T15:31:12.347' AS DateTime), NULL, 1, 1, 38, 402, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1339, CAST(N'2018-12-05T15:31:12.353' AS DateTime), NULL, 1, 1, 38, 403, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1340, CAST(N'2018-12-05T15:31:12.357' AS DateTime), NULL, 1, 1, 38, 404, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1341, CAST(N'2018-12-05T15:31:12.363' AS DateTime), NULL, 1, 1, 38, 405, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1342, CAST(N'2018-12-05T15:31:12.370' AS DateTime), NULL, 1, 1, 38, 406, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1343, CAST(N'2018-12-05T17:18:27.613' AS DateTime), NULL, 1, 1, 40, 407, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1344, CAST(N'2018-12-05T17:18:27.650' AS DateTime), NULL, 1, 1, 40, 408, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1345, CAST(N'2018-12-05T17:18:27.650' AS DateTime), NULL, 1, 1, 40, 409, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1346, CAST(N'2018-12-05T17:18:27.657' AS DateTime), NULL, 1, 1, 40, 410, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1347, CAST(N'2018-12-05T17:18:27.663' AS DateTime), NULL, 1, 1, 40, 411, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1348, CAST(N'2018-12-05T17:18:27.667' AS DateTime), NULL, 1, 1, 40, 412, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1349, CAST(N'2018-12-05T17:18:27.670' AS DateTime), NULL, 1, 1, 40, 413, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1350, CAST(N'2018-12-05T17:18:27.677' AS DateTime), NULL, 1, 1, 40, 414, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1351, CAST(N'2018-12-05T17:18:27.680' AS DateTime), NULL, 1, 1, 40, 415, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1352, CAST(N'2018-12-05T17:18:27.690' AS DateTime), NULL, 1, 1, 40, 416, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1353, CAST(N'2018-12-05T17:18:27.703' AS DateTime), NULL, 1, 1, 40, 417, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1354, CAST(N'2018-12-05T17:18:27.717' AS DateTime), NULL, 1, 1, 40, 418, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1355, CAST(N'2018-12-05T17:18:27.730' AS DateTime), NULL, 1, 1, 40, 419, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1356, CAST(N'2018-12-05T17:18:27.740' AS DateTime), NULL, 1, 1, 40, 420, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1357, CAST(N'2018-12-05T17:18:27.757' AS DateTime), NULL, 1, 1, 40, 421, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1358, CAST(N'2018-12-05T17:18:27.770' AS DateTime), NULL, 1, 1, 40, 422, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1359, CAST(N'2018-12-05T17:18:27.787' AS DateTime), NULL, 1, 1, 40, 423, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1360, CAST(N'2018-12-05T17:18:27.807' AS DateTime), NULL, 1, 1, 40, 424, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1361, CAST(N'2018-12-05T17:18:27.823' AS DateTime), NULL, 1, 1, 40, 425, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1362, CAST(N'2018-12-05T17:18:27.840' AS DateTime), NULL, 1, 1, 40, 426, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1363, CAST(N'2018-12-05T17:18:27.853' AS DateTime), NULL, 1, 1, 40, 427, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1364, CAST(N'2018-12-05T17:18:27.863' AS DateTime), NULL, 1, 1, 40, 428, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1365, CAST(N'2018-12-05T17:18:27.870' AS DateTime), NULL, 1, 1, 40, 429, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1366, CAST(N'2018-12-05T17:18:27.877' AS DateTime), NULL, 1, 1, 40, 430, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1367, CAST(N'2018-12-05T17:18:27.887' AS DateTime), NULL, 1, 1, 40, 431, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1368, CAST(N'2018-12-05T17:18:27.897' AS DateTime), NULL, 1, 1, 40, 432, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1369, CAST(N'2018-12-05T17:18:27.907' AS DateTime), NULL, 1, 1, 40, 433, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1370, CAST(N'2018-12-05T17:18:27.917' AS DateTime), NULL, 1, 1, 40, 434, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1371, CAST(N'2018-12-05T17:18:27.923' AS DateTime), NULL, 1, 1, 40, 435, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1372, CAST(N'2018-12-05T17:18:27.940' AS DateTime), NULL, 1, 1, 40, 436, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1373, CAST(N'2018-12-05T17:18:27.960' AS DateTime), NULL, 1, 1, 40, 437, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1374, CAST(N'2018-12-05T17:18:27.987' AS DateTime), NULL, 1, 1, 40, 438, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1375, CAST(N'2018-12-05T17:18:28.010' AS DateTime), NULL, 1, 1, 40, 439, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1376, CAST(N'2018-12-05T17:18:28.030' AS DateTime), NULL, 1, 1, 40, 440, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1377, CAST(N'2018-12-05T17:18:28.050' AS DateTime), NULL, 1, 1, 40, 441, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1378, CAST(N'2018-12-05T17:18:28.073' AS DateTime), NULL, 1, 1, 40, 442, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1379, CAST(N'2018-12-05T17:18:28.100' AS DateTime), NULL, 1, 1, 40, 443, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1380, CAST(N'2018-12-05T17:18:28.147' AS DateTime), NULL, 1, 1, 40, 444, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1381, CAST(N'2018-12-05T17:18:28.173' AS DateTime), NULL, 1, 1, 40, 445, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1382, CAST(N'2018-12-05T17:18:28.203' AS DateTime), NULL, 1, 1, 40, 446, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1383, CAST(N'2018-12-05T17:18:28.237' AS DateTime), NULL, 1, 1, 40, 447, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1384, CAST(N'2018-12-05T17:18:28.277' AS DateTime), NULL, 1, 1, 40, 448, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1385, CAST(N'2018-12-05T17:18:28.313' AS DateTime), NULL, 1, 1, 40, 449, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1386, CAST(N'2018-12-05T17:18:28.343' AS DateTime), NULL, 1, 1, 40, 450, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1387, CAST(N'2018-12-05T17:18:28.380' AS DateTime), NULL, 1, 1, 40, 451, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1388, CAST(N'2018-12-05T17:18:28.410' AS DateTime), NULL, 1, 1, 40, 452, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1389, CAST(N'2018-12-05T17:18:28.447' AS DateTime), NULL, 1, 1, 40, 453, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1390, CAST(N'2018-12-05T17:18:28.477' AS DateTime), NULL, 1, 1, 40, 454, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1391, CAST(N'2018-12-05T17:18:28.507' AS DateTime), NULL, 1, 1, 40, 455, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1392, CAST(N'2018-12-05T17:18:28.537' AS DateTime), NULL, 1, 1, 40, 456, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1393, CAST(N'2018-12-05T17:18:28.567' AS DateTime), NULL, 1, 1, 40, 457, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1394, CAST(N'2018-12-05T17:18:28.600' AS DateTime), NULL, 1, 1, 40, 458, N'Ads Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1395, CAST(N'2018-12-06T13:59:54.843' AS DateTime), NULL, 1, 1, 35, 459, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1396, CAST(N'2018-12-06T14:00:12.573' AS DateTime), NULL, 3, 1, 35, NULL, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1397, CAST(N'2018-12-06T14:00:28.573' AS DateTime), NULL, 1, 1, 35, 460, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1398, CAST(N'2018-12-06T14:00:28.580' AS DateTime), NULL, 1, 1, 35, 461, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1399, CAST(N'2018-12-06T14:00:28.583' AS DateTime), NULL, 1, 1, 35, 462, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1400, CAST(N'2018-12-06T18:41:50.027' AS DateTime), NULL, 1, 1, 40, 463, N'Rental Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1401, CAST(N'2018-12-06T18:41:57.810' AS DateTime), NULL, 1, 1, 40, 464, N'Rental Groups Fields Item', N'عنصر حقول الاعلانات ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1402, CAST(N'2018-12-07T20:27:38.347' AS DateTime), NULL, 2, 1, 35, 377, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1403, CAST(N'2018-12-07T20:27:38.350' AS DateTime), NULL, 2, 1, 35, 379, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1404, CAST(N'2018-12-07T20:27:38.357' AS DateTime), NULL, 2, 1, 35, 381, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1405, CAST(N'2018-12-07T20:27:38.360' AS DateTime), NULL, 2, 1, 35, 382, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1406, CAST(N'2018-12-07T20:27:38.367' AS DateTime), NULL, 2, 1, 35, 383, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1407, CAST(N'2018-12-07T20:27:38.370' AS DateTime), NULL, 2, 1, 35, 374, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1408, CAST(N'2018-12-07T20:27:38.373' AS DateTime), NULL, 2, 1, 35, 384, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1409, CAST(N'2018-12-07T20:27:38.490' AS DateTime), NULL, 1, 1, 35, 465, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1410, CAST(N'2018-12-08T01:48:27.287' AS DateTime), NULL, 3, 1, 38, NULL, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1411, CAST(N'2018-12-08T01:48:39.357' AS DateTime), NULL, 1, 1, 38, 466, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1412, CAST(N'2018-12-11T13:49:36.317' AS DateTime), NULL, 1, 1, 7, 467, N'ي', N'جزائرى')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1413, CAST(N'2018-12-11T13:50:05.593' AS DateTime), NULL, 2, 1, 7, 467, N'ي', N'جزائرى')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1415, CAST(N'2018-12-11T13:57:24.303' AS DateTime), NULL, 3, 1, 7, NULL, N'0', N'0')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1416, CAST(N'2018-12-11T14:51:51.813' AS DateTime), NULL, 1, 1, 33, 469, N'xx', N'x')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1417, CAST(N'2018-12-11T14:58:48.633' AS DateTime), NULL, 2, 1, 33, 469, N'xx', N'x')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1418, CAST(N'2018-12-11T14:58:54.737' AS DateTime), NULL, 3, 1, 33, NULL, N'xx0', N'x')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1419, CAST(N'2018-12-11T16:52:44.630' AS DateTime), NULL, 1, 1, 35, 479, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1420, CAST(N'2018-12-11T16:52:44.703' AS DateTime), NULL, 1, 1, 35, 480, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1421, CAST(N'2018-12-11T17:04:25.310' AS DateTime), NULL, 1, 1, 35, 481, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1422, CAST(N'2018-12-11T18:31:54.550' AS DateTime), NULL, 2, 1, 35, 480, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1423, CAST(N'2018-12-11T18:32:00.170' AS DateTime), NULL, 1, 1, 35, 482, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1424, CAST(N'2018-12-11T18:32:07.463' AS DateTime), NULL, 1, 1, 35, 483, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1425, CAST(N'2018-12-11T18:51:18.043' AS DateTime), NULL, 1, 1, 36, 488, N'X', N'xX')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1426, CAST(N'2018-12-11T18:51:27.390' AS DateTime), NULL, 2, 1, 36, 78, N'Fendi', N'فندي')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1427, CAST(N'2018-12-11T18:51:39.743' AS DateTime), NULL, 2, 1, 36, 78, N'X0', N'xX1')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1428, CAST(N'2018-12-11T18:54:15.560' AS DateTime), NULL, 2, 1, 36, 488, N'X', N'xX')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1429, CAST(N'2018-12-11T18:54:25.290' AS DateTime), NULL, 3, 1, 36, NULL, N'X554', N'xX100')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1430, CAST(N'2018-12-11T19:08:18.440' AS DateTime), NULL, 1, 1, 37, 493, N'Wedding Tools', N'لوازم الافراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1431, CAST(N'2018-12-11T19:08:29.700' AS DateTime), NULL, 1, 1, 37, 494, N'Wedding Tools', N'لوازم الافراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1432, CAST(N'2018-12-11T19:08:37.887' AS DateTime), NULL, 1, 1, 37, 495, N'Wedding Tools', N'لوازم الافراح')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1451, CAST(N'2018-12-14T17:40:48.717' AS DateTime), NULL, 1, 1, 42, 518, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1452, CAST(N'2018-12-14T17:40:48.800' AS DateTime), NULL, 1, 1, 42, 519, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1453, CAST(N'2018-12-14T17:40:48.853' AS DateTime), NULL, 1, 1, 42, 520, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1454, CAST(N'2018-12-14T17:40:48.897' AS DateTime), NULL, 1, 1, 42, 521, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1455, CAST(N'2018-12-14T17:40:48.947' AS DateTime), NULL, 1, 1, 42, 522, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1456, CAST(N'2018-12-14T17:40:48.997' AS DateTime), NULL, 1, 1, 42, 523, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1457, CAST(N'2018-12-14T17:41:06.980' AS DateTime), NULL, 1, 1, 42, 524, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1458, CAST(N'2018-12-14T17:41:07.023' AS DateTime), NULL, 1, 1, 42, 525, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1459, CAST(N'2018-12-14T17:41:15.513' AS DateTime), NULL, 1, 1, 42, 526, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1460, CAST(N'2018-12-14T17:41:19.480' AS DateTime), NULL, 1, 1, 42, 527, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1461, CAST(N'2018-12-14T17:41:19.533' AS DateTime), NULL, 1, 1, 42, 528, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1462, CAST(N'2018-12-17T14:16:26.567' AS DateTime), NULL, 2, 1, 42, 518, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1463, CAST(N'2018-12-17T14:16:26.570' AS DateTime), NULL, 2, 1, 42, 519, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1464, CAST(N'2018-12-17T14:16:26.573' AS DateTime), NULL, 2, 1, 42, 520, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1465, CAST(N'2018-12-17T14:16:26.577' AS DateTime), NULL, 2, 1, 42, 521, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1466, CAST(N'2018-12-17T14:16:26.580' AS DateTime), NULL, 2, 1, 42, 522, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1467, CAST(N'2018-12-17T14:16:26.583' AS DateTime), NULL, 2, 1, 42, 523, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1468, CAST(N'2018-12-17T14:16:26.657' AS DateTime), NULL, 1, 1, 42, 529, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1469, CAST(N'2018-12-17T14:16:26.663' AS DateTime), NULL, 1, 1, 42, 530, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1470, CAST(N'2018-12-17T16:19:02.593' AS DateTime), NULL, 1, 1, 34, 531, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1471, CAST(N'2018-12-17T16:19:02.660' AS DateTime), NULL, 1, 1, 34, 532, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1472, CAST(N'2018-12-17T16:19:02.707' AS DateTime), NULL, 1, 1, 34, 533, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1473, CAST(N'2018-12-17T16:19:02.773' AS DateTime), NULL, 1, 1, 34, 534, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1474, CAST(N'2018-12-17T16:19:02.823' AS DateTime), NULL, 1, 1, 34, 535, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1475, CAST(N'2018-12-17T16:19:02.880' AS DateTime), NULL, 1, 1, 34, 536, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1476, CAST(N'2018-12-17T16:19:02.920' AS DateTime), NULL, 1, 1, 34, 537, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1477, CAST(N'2018-12-17T16:19:25.477' AS DateTime), NULL, 1, 1, 37, 538, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1478, CAST(N'2018-12-17T16:19:25.553' AS DateTime), NULL, 1, 1, 37, 539, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1479, CAST(N'2018-12-17T16:19:25.623' AS DateTime), NULL, 1, 1, 37, 540, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1480, CAST(N'2018-12-19T05:04:54.283' AS DateTime), NULL, 1, 1, 35, 541, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1481, CAST(N'2018-12-19T05:04:54.337' AS DateTime), NULL, 1, 1, 35, 542, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1482, CAST(N'2018-12-19T05:04:54.343' AS DateTime), NULL, 1, 1, 35, 543, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1483, CAST(N'2018-12-19T05:04:54.350' AS DateTime), NULL, 1, 1, 35, 544, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1484, CAST(N'2018-12-19T05:04:54.357' AS DateTime), NULL, 1, 1, 35, 545, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1485, CAST(N'2018-12-19T05:04:54.370' AS DateTime), NULL, 1, 1, 35, 546, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1486, CAST(N'2018-12-19T05:04:54.383' AS DateTime), NULL, 1, 1, 35, 547, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1487, CAST(N'2018-12-19T05:04:54.390' AS DateTime), NULL, 1, 1, 35, 548, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1488, CAST(N'2018-12-19T05:04:54.403' AS DateTime), NULL, 1, 1, 35, 549, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1489, CAST(N'2019-01-04T23:04:23.620' AS DateTime), NULL, 2, 1, 35, 377, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1490, CAST(N'2019-01-04T23:04:23.633' AS DateTime), NULL, 2, 1, 35, 541, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1491, CAST(N'2019-01-04T23:04:23.637' AS DateTime), NULL, 2, 1, 35, 379, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1492, CAST(N'2019-01-04T23:04:23.643' AS DateTime), NULL, 2, 1, 35, 542, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1493, CAST(N'2019-01-04T23:04:23.643' AS DateTime), NULL, 2, 1, 35, 543, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1494, CAST(N'2019-01-04T23:04:23.650' AS DateTime), NULL, 2, 1, 35, 382, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1495, CAST(N'2019-01-04T23:04:23.653' AS DateTime), NULL, 2, 1, 35, 544, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1496, CAST(N'2019-01-04T23:04:23.657' AS DateTime), NULL, 2, 1, 35, 384, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1497, CAST(N'2019-01-04T23:04:23.660' AS DateTime), NULL, 2, 1, 35, 545, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1498, CAST(N'2019-01-04T23:04:23.663' AS DateTime), NULL, 2, 1, 35, 546, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1499, CAST(N'2019-01-04T23:04:23.670' AS DateTime), NULL, 2, 1, 35, 547, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1500, CAST(N'2019-01-04T23:04:23.673' AS DateTime), NULL, 2, 1, 35, 465, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1501, CAST(N'2019-01-04T23:04:23.677' AS DateTime), NULL, 2, 1, 35, 548, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1502, CAST(N'2019-01-04T23:04:23.680' AS DateTime), NULL, 2, 1, 35, 549, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1503, CAST(N'2019-01-08T21:49:24.820' AS DateTime), NULL, 1, 12, 21, 550, N'cC25', N'cC25')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1504, CAST(N'2019-01-09T01:27:41.460' AS DateTime), NULL, 1, 1, 40, 551, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1505, CAST(N'2019-01-09T01:27:41.527' AS DateTime), NULL, 1, 1, 40, 552, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1506, CAST(N'2019-01-09T01:27:48.607' AS DateTime), NULL, 3, 1, 40, NULL, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1507, CAST(N'2019-01-09T01:27:48.710' AS DateTime), NULL, 3, 1, 40, NULL, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1508, CAST(N'2019-01-09T22:16:56.933' AS DateTime), NULL, 1, 1, 19, 553, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1509, CAST(N'2019-01-09T22:54:39.287' AS DateTime), NULL, 1, 1, 20, 554, N'sub category test', N'تجربة فئة فرعية')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1510, CAST(N'2019-01-09T23:02:51.830' AS DateTime), NULL, 1, 1, 37, 555, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1511, CAST(N'2019-01-09T23:02:51.843' AS DateTime), NULL, 1, 1, 37, 556, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1512, CAST(N'2019-01-09T23:03:42.760' AS DateTime), NULL, 1, 1, 37, 557, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1513, CAST(N'2019-01-09T23:06:35.487' AS DateTime), NULL, 1, 1, 34, 558, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1514, CAST(N'2019-01-09T23:06:35.497' AS DateTime), NULL, 1, 1, 34, 559, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1515, CAST(N'2019-01-09T23:06:35.507' AS DateTime), NULL, 1, 1, 34, 560, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1516, CAST(N'2019-01-09T23:06:35.520' AS DateTime), NULL, 1, 1, 34, 561, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1517, CAST(N'2019-01-09T23:07:06.493' AS DateTime), NULL, 1, 1, 34, 562, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1518, CAST(N'2019-01-09T23:07:06.507' AS DateTime), NULL, 1, 1, 34, 563, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1519, CAST(N'2019-01-09T23:07:24.373' AS DateTime), NULL, 1, 1, 34, 564, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1520, CAST(N'2019-01-09T23:07:24.380' AS DateTime), NULL, 1, 1, 34, 565, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1521, CAST(N'2019-01-09T23:24:51.060' AS DateTime), NULL, 1, 1, 35, 566, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1522, CAST(N'2019-01-09T23:25:10.003' AS DateTime), NULL, 1, 1, 35, 567, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1523, CAST(N'2019-01-09T23:25:53.700' AS DateTime), NULL, 2, 1, 35, 566, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1524, CAST(N'2019-01-09T23:27:37.097' AS DateTime), NULL, 1, 1, 20, 568, N'sub category test 2', N'تجربة فئة فرعية 2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1525, CAST(N'2019-01-09T23:29:35.020' AS DateTime), NULL, 3, 1, 35, NULL, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1526, CAST(N'2019-01-09T23:32:53.890' AS DateTime), NULL, 1, 1, 38, 569, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1527, CAST(N'2019-01-09T23:33:42.367' AS DateTime), NULL, 1, 1, 35, 570, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1528, CAST(N'2019-01-09T23:33:42.380' AS DateTime), NULL, 1, 1, 35, 571, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1529, CAST(N'2019-01-09T23:33:42.387' AS DateTime), NULL, 1, 1, 35, 572, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1530, CAST(N'2019-01-09T23:33:46.913' AS DateTime), NULL, 2, 1, 35, 571, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1531, CAST(N'2019-01-09T23:33:46.933' AS DateTime), NULL, 2, 1, 35, 572, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1532, CAST(N'2019-01-09T23:34:43.317' AS DateTime), NULL, 1, 1, 42, 573, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1533, CAST(N'2019-01-09T23:34:43.343' AS DateTime), NULL, 1, 1, 42, 574, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1534, CAST(N'2019-01-09T23:34:43.360' AS DateTime), NULL, 1, 1, 42, 575, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1535, CAST(N'2019-01-09T23:34:43.367' AS DateTime), NULL, 1, 1, 42, 576, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1536, CAST(N'2019-01-09T23:34:43.377' AS DateTime), NULL, 1, 1, 42, 577, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1537, CAST(N'2019-01-09T23:34:43.383' AS DateTime), NULL, 1, 1, 42, 578, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1538, CAST(N'2019-01-09T23:59:30.897' AS DateTime), NULL, 1, 1, 37, 579, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1539, CAST(N'2019-01-09T23:59:30.953' AS DateTime), NULL, 1, 1, 37, 580, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1540, CAST(N'2019-01-10T00:36:21.117' AS DateTime), NULL, 1, 1, 34, 581, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1541, CAST(N'2019-01-10T00:36:21.163' AS DateTime), NULL, 1, 1, 34, 582, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1542, CAST(N'2019-01-10T00:39:25.043' AS DateTime), NULL, 1, 1, 34, 583, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1543, CAST(N'2019-01-10T00:40:24.833' AS DateTime), NULL, 2, 1, 42, 573, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1544, CAST(N'2019-01-10T00:40:24.840' AS DateTime), NULL, 2, 1, 42, 576, N'category test', N'تجربة فئة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1545, CAST(N'2019-01-10T00:47:31.280' AS DateTime), NULL, 1, 1, 40, 584, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1546, CAST(N'2019-01-10T00:47:31.307' AS DateTime), NULL, 1, 1, 40, 585, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1547, CAST(N'2019-01-10T00:47:31.310' AS DateTime), NULL, 1, 1, 40, 586, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1548, CAST(N'2019-01-10T00:47:31.317' AS DateTime), NULL, 1, 1, 40, 587, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1549, CAST(N'2019-01-10T00:47:31.320' AS DateTime), NULL, 1, 1, 40, 588, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1550, CAST(N'2019-01-10T00:47:31.333' AS DateTime), NULL, 1, 1, 40, 589, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1551, CAST(N'2019-01-10T01:15:42.013' AS DateTime), NULL, 3, 1, 38, NULL, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1552, CAST(N'2019-01-10T01:15:56.080' AS DateTime), NULL, 1, 1, 38, 590, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1553, CAST(N'2019-01-10T01:22:13.260' AS DateTime), NULL, 1, 1, 42, 591, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1554, CAST(N'2019-01-10T01:22:13.300' AS DateTime), NULL, 1, 1, 42, 592, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1555, CAST(N'2019-01-10T01:22:13.307' AS DateTime), NULL, 1, 1, 42, 593, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1556, CAST(N'2019-01-10T01:23:04.653' AS DateTime), NULL, 1, 1, 35, 594, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1557, CAST(N'2019-01-10T01:23:04.677' AS DateTime), NULL, 1, 1, 35, 595, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1558, CAST(N'2019-01-10T01:23:04.710' AS DateTime), NULL, 1, 1, 35, 596, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1559, CAST(N'2019-01-10T01:23:04.760' AS DateTime), NULL, 1, 1, 35, 597, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1560, CAST(N'2019-01-10T01:23:04.787' AS DateTime), NULL, 1, 1, 35, 598, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1561, CAST(N'2019-01-10T01:23:56.877' AS DateTime), NULL, 1, 1, 40, 599, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1562, CAST(N'2019-01-10T01:23:56.880' AS DateTime), NULL, 1, 1, 40, 600, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1563, CAST(N'2019-01-10T01:25:21.640' AS DateTime), NULL, 1, 1, 40, 601, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1564, CAST(N'2019-01-10T01:25:21.647' AS DateTime), NULL, 1, 1, 40, 602, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1565, CAST(N'2019-01-10T01:25:38.773' AS DateTime), NULL, 1, 1, 38, 603, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1566, CAST(N'2019-01-10T01:25:38.783' AS DateTime), NULL, 1, 1, 38, 604, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1567, CAST(N'2019-01-10T01:34:35.490' AS DateTime), NULL, 1, 12, 21, 605, N'تجربة سيارة 2', N'تجربة سيارة 2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1568, CAST(N'2019-01-10T17:21:23.313' AS DateTime), NULL, 1, 1, 20, 606, N'Apartment', N'شقة')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1569, CAST(N'2019-01-10T17:24:12.540' AS DateTime), NULL, 2, 1, 4, 1, N'Egypt', N'مصر')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1570, CAST(N'2019-01-10T17:24:12.577' AS DateTime), NULL, 2, 1, 4, 31, N'Kwit', N'الكويت')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1571, CAST(N'2019-01-10T17:24:12.590' AS DateTime), NULL, 2, 1, 4, 327, N'qutr', N'قطر')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1572, CAST(N'2019-01-10T17:26:23.173' AS DateTime), NULL, 1, 1, 42, 607, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1573, CAST(N'2019-01-10T17:26:23.187' AS DateTime), NULL, 1, 1, 42, 608, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1574, CAST(N'2019-01-10T17:26:23.200' AS DateTime), NULL, 1, 1, 42, 609, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1575, CAST(N'2019-01-10T17:29:19.573' AS DateTime), NULL, 1, 1, 42, 610, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1576, CAST(N'2019-01-10T17:29:19.580' AS DateTime), NULL, 1, 1, 42, 611, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1577, CAST(N'2019-01-10T17:29:19.590' AS DateTime), NULL, 1, 1, 42, 612, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1578, CAST(N'2019-01-10T17:30:53.580' AS DateTime), NULL, 1, 1, 37, 613, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1579, CAST(N'2019-01-10T17:30:53.590' AS DateTime), NULL, 1, 1, 37, 614, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1580, CAST(N'2019-01-10T17:31:07.693' AS DateTime), NULL, 1, 1, 34, 615, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1581, CAST(N'2019-01-10T17:31:07.700' AS DateTime), NULL, 1, 1, 34, 616, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1582, CAST(N'2019-01-10T17:31:42.313' AS DateTime), NULL, 1, 1, 34, 617, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1583, CAST(N'2019-01-10T17:31:42.330' AS DateTime), NULL, 1, 1, 34, 618, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1584, CAST(N'2019-01-10T17:32:36.953' AS DateTime), NULL, 1, 1, 37, 619, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1585, CAST(N'2019-01-10T17:32:36.970' AS DateTime), NULL, 1, 1, 37, 620, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1586, CAST(N'2019-01-10T17:33:07.147' AS DateTime), NULL, 1, 1, 37, 621, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1587, CAST(N'2019-01-10T17:34:17.453' AS DateTime), NULL, 1, 1, 35, 622, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1588, CAST(N'2019-01-10T17:34:17.463' AS DateTime), NULL, 1, 1, 35, 623, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1589, CAST(N'2019-01-10T17:34:17.473' AS DateTime), NULL, 1, 1, 35, 624, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1590, CAST(N'2019-01-10T17:34:17.490' AS DateTime), NULL, 1, 1, 35, 625, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1591, CAST(N'2019-01-10T17:34:17.500' AS DateTime), NULL, 1, 1, 35, 626, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1592, CAST(N'2019-01-10T17:34:17.510' AS DateTime), NULL, 1, 1, 35, 627, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1593, CAST(N'2019-01-10T17:34:17.517' AS DateTime), NULL, 1, 1, 35, 628, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1594, CAST(N'2019-01-10T17:34:17.523' AS DateTime), NULL, 1, 1, 35, 629, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1595, CAST(N'2019-01-10T17:34:17.533' AS DateTime), NULL, 1, 1, 35, 630, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1596, CAST(N'2019-01-10T17:35:40.623' AS DateTime), NULL, 1, 1, 35, 631, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1597, CAST(N'2019-01-10T17:35:40.633' AS DateTime), NULL, 1, 1, 35, 632, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1598, CAST(N'2019-01-10T17:35:40.673' AS DateTime), NULL, 1, 1, 35, 633, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1599, CAST(N'2019-01-10T17:38:32.397' AS DateTime), NULL, 1, 1, 38, 634, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1600, CAST(N'2019-01-10T17:38:32.443' AS DateTime), NULL, 1, 1, 38, 635, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1601, CAST(N'2019-01-10T17:40:26.440' AS DateTime), NULL, 1, 1, 40, 636, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1602, CAST(N'2019-01-10T17:40:26.447' AS DateTime), NULL, 1, 1, 40, 637, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1603, CAST(N'2019-01-10T17:40:26.457' AS DateTime), NULL, 1, 1, 40, 638, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1604, CAST(N'2019-01-10T17:40:26.460' AS DateTime), NULL, 1, 1, 40, 639, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1605, CAST(N'2019-01-10T17:40:26.470' AS DateTime), NULL, 1, 1, 40, 640, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1606, CAST(N'2019-01-10T17:41:01.233' AS DateTime), NULL, 1, 1, 40, 641, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1607, CAST(N'2019-01-10T17:41:01.243' AS DateTime), NULL, 1, 1, 40, 642, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1608, CAST(N'2019-01-10T18:03:33.530' AS DateTime), NULL, 1, 1, 40, 643, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1609, CAST(N'2019-01-10T18:03:33.540' AS DateTime), NULL, 1, 1, 40, 644, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1610, CAST(N'2019-01-10T18:03:33.550' AS DateTime), NULL, 1, 1, 40, 645, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1611, CAST(N'2019-01-10T18:03:33.563' AS DateTime), NULL, 1, 1, 40, 646, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1612, CAST(N'2019-01-10T18:03:33.583' AS DateTime), NULL, 1, 1, 40, 647, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1613, CAST(N'2019-01-10T18:28:37.823' AS DateTime), NULL, 1, 1, 20, 648, N'bus', N'اتوبيسات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1614, CAST(N'2019-01-10T18:30:26.040' AS DateTime), NULL, 1, 1, 42, 649, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1615, CAST(N'2019-01-10T18:30:26.083' AS DateTime), NULL, 1, 1, 42, 650, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1616, CAST(N'2019-01-10T18:30:26.093' AS DateTime), NULL, 1, 1, 42, 651, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1617, CAST(N'2019-01-10T18:30:37.370' AS DateTime), NULL, 2, 1, 42, 649, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1618, CAST(N'2019-01-10T18:30:37.380' AS DateTime), NULL, 2, 1, 42, 650, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1619, CAST(N'2019-01-10T18:30:37.420' AS DateTime), NULL, 2, 1, 42, 651, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1620, CAST(N'2019-01-10T18:31:23.430' AS DateTime), NULL, 1, 1, 34, 652, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1621, CAST(N'2019-01-10T18:31:23.547' AS DateTime), NULL, 1, 1, 34, 653, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1622, CAST(N'2019-01-10T18:31:23.630' AS DateTime), NULL, 1, 1, 34, 654, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1623, CAST(N'2019-01-10T18:31:23.683' AS DateTime), NULL, 1, 1, 34, 655, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1624, CAST(N'2019-01-10T18:32:57.473' AS DateTime), NULL, 1, 1, 35, 656, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1625, CAST(N'2019-01-10T18:32:57.500' AS DateTime), NULL, 1, 1, 35, 657, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1626, CAST(N'2019-01-10T18:32:57.540' AS DateTime), NULL, 1, 1, 35, 658, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1627, CAST(N'2019-01-10T18:32:57.563' AS DateTime), NULL, 1, 1, 35, 659, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1628, CAST(N'2019-01-10T18:32:57.600' AS DateTime), NULL, 1, 1, 35, 660, N'Vehicles', N'مركبات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1629, CAST(N'2019-01-10T18:35:13.147' AS DateTime), NULL, 1, 1, 40, 661, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1630, CAST(N'2019-01-10T18:35:13.163' AS DateTime), NULL, 1, 1, 40, 662, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1631, CAST(N'2019-01-10T18:35:13.173' AS DateTime), NULL, 1, 1, 40, 663, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1632, CAST(N'2019-01-10T18:35:13.207' AS DateTime), NULL, 1, 1, 40, 664, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1633, CAST(N'2019-01-10T18:35:13.213' AS DateTime), NULL, 1, 1, 40, 665, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1634, CAST(N'2019-01-10T18:35:13.223' AS DateTime), NULL, 1, 1, 40, 666, N'Rental Groups Fields Item', N'عناصر مجموعات الاعلان')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1635, CAST(N'2019-01-10T18:36:24.147' AS DateTime), NULL, 1, 1, 38, 667, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1636, CAST(N'2019-01-10T18:36:24.153' AS DateTime), NULL, 1, 1, 38, 668, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1637, CAST(N'2019-01-10T18:36:24.180' AS DateTime), NULL, 1, 1, 38, 669, N'Groups Fields Display Type', N'نوع بند التاجير')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1638, CAST(N'2019-01-10T18:40:13.837' AS DateTime), NULL, 1, 12, 21, 670, N'اتوبيس لنقل الركاب', N'اتوبيس لنقل الركاب')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1639, CAST(N'2019-01-29T12:50:38.287' AS DateTime), NULL, 1, 12, 21, 671, N'تجربة 1', N'تجربة 1')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1640, CAST(N'2019-01-29T12:58:43.503' AS DateTime), NULL, 1, 12, 21, 672, N'تجربة 2', N'تجربة 2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1641, CAST(N'2019-01-29T12:58:48.133' AS DateTime), NULL, 1, 12, 21, 673, N'تجربة 2', N'تجربة 2')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1642, CAST(N'2019-01-30T14:48:20.950' AS DateTime), NULL, 1, 12, 21, 678, N'dfdfdf', N'dfdfdf')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1643, CAST(N'2019-01-30T14:51:34.710' AS DateTime), NULL, 1, 12, 21, 679, N'تجربة 1 ', N'تجربة 1 ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1644, CAST(N'2019-01-30T14:52:39.823' AS DateTime), NULL, 1, 12, 21, 680, N'تجربة 1 ', N'تجربة 1 ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1645, CAST(N'2019-01-30T14:53:15.030' AS DateTime), NULL, 1, 12, 21, 681, N'تجربة 1 ', N'تجربة 1 ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1646, CAST(N'2019-01-30T14:53:21.297' AS DateTime), NULL, 1, 12, 21, 682, N'تجربة 1 ', N'تجربة 1 ')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1647, CAST(N'2019-02-23T02:50:06.450' AS DateTime), NULL, 2, 1, 35, 622, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1648, CAST(N'2019-02-23T02:50:06.467' AS DateTime), NULL, 2, 1, 35, 628, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1649, CAST(N'2019-02-23T02:50:06.453' AS DateTime), NULL, 2, 1, 35, 623, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1650, CAST(N'2019-02-23T02:50:06.457' AS DateTime), NULL, 2, 1, 35, 625, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1651, CAST(N'2019-02-23T02:50:06.460' AS DateTime), NULL, 2, 1, 35, 626, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1652, CAST(N'2019-02-23T02:50:06.463' AS DateTime), NULL, 2, 1, 35, 627, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1653, CAST(N'2019-02-23T03:24:55.983' AS DateTime), NULL, 1, 12, 21, 683, N'تجربة اضافة اضافة اعلان جديد', N'تجربة اضافة اضافة اعلان جديد')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1654, CAST(N'2019-02-23T08:33:07.707' AS DateTime), NULL, 2, 1, 35, 628, N'Real estate', N'عقارات')
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id], [TitleEn], [TitleAr]) VALUES (1655, CAST(N'2019-03-01T20:56:43.347' AS DateTime), NULL, 1, 12, 21, 684, N'مرسيدس', N'مرسيدس')
GO
SET IDENTITY_INSERT [dbo].[Histories] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryDetails] ON 
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (219, N'NameAr', NULL, N'sd', 111, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (220, N'NameEn', NULL, N'sd', 111, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (221, N'NameAr', N'sd', N'مصر', 112, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (222, N'NameEn', N'sd5', N'Egypt', 112, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (225, N'NameAr', NULL, N'sd0', 114, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (226, N'NameEn', NULL, N'sddsd', 114, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (227, N'NameAr', NULL, N'dsd', 115, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (228, N'NameEn', NULL, N'ss', 115, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (229, N'NameAr', NULL, N'x', 116, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (230, N'NameEn', NULL, N's', 116, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (231, N'NameAr', N'ملابس', N'sd', 117, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (232, N'NameEn', N'Clothes', N'sd', 117, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (233, N'NameAr', N'عقارات', N'dsd', 118, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (234, N'NameEn', N'Real estate', N'ss', 118, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (235, N'NameAr', N'مركبات', N'x', 119, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (236, N'NameEn', N'Vehicles', N's', 119, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (237, N'NameAr', NULL, N'sd', 120, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (238, N'NameEn', NULL, N'dsds', 120, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (241, N'NameAr', NULL, N'sa', 122, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (242, N'NameEn', NULL, N'ds', 122, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (243, N'NameAr', N'sd2', N'sd', 123, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (244, N'NameEn', N'dsdsw', N'dsds', 123, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (245, N'NameAr', N'دفع رباعى', N'sd2', 124, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (246, N'NameEn', N'4wd', N'dsdsw', 124, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (247, N'NameAr', NULL, N'دراجة نارية', 125, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (248, N'NameEn', NULL, N'Motorcycle', 125, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (249, N'NameAr', NULL, N'دراجة هوائية', 126, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (250, N'NameEn', NULL, N'Bicycles', 126, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (251, N'NameAr', NULL, N'منازل', 127, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (252, N'NameEn', NULL, N'Houses', 127, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (253, N'NameAr', NULL, N'شقق سكنية', 128, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (254, N'NameEn', NULL, N'Apartment', 128, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (255, N'StartDateTime', N'01/01/2010 12:00:00 AM', N'01/02/2020 12:00:00 AM', 130, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (256, N'EndDateTime', N'01/01/2010 12:00:00 AM', N'02/02/2020 12:00:00 AM', 130, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (257, N'IsApprove', N'True', N'False', 130, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (258, N'Title', N'ahmed', N'ads', 131, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (259, N'Description', N'ahmed description', N'ads ads', 131, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (260, N'IsApprove', N'False', N'True', 132, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (261, N'Title', NULL, N'ads00', 133, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (262, N'Title', N'ads', N'ads00', 133, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (263, N'Title', NULL, N'اعلان تجربة', 134, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (264, N'Title', N'ads00', N'اعلان تجربة', 134, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (265, N'Title', N'اعلان تجربة', N'اعلان الدياسطى', 135, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (266, N'IsApprove', N'True', N'False', 136, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (267, N'IsApprove', N'True', N'False', 137, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (268, N'Id', NULL, NULL, 139, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (269, N'Id', NULL, N'1', 139, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (270, N'IsApprove', N'False', N'True', 139, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (271, N'Id', NULL, NULL, 140, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (272, N'Id', NULL, N'1', 140, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (273, N'IsApprove', N'False', N'True', 140, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (286, N'Title', NULL, N'sdsdsd', 145, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (287, N'Description', NULL, N'ssdsd', 145, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (288, N'IsTop', NULL, N'False', 145, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (289, N'Price', NULL, N'20', 145, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (290, N'Id', NULL, NULL, 146, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (291, N'Id', NULL, N'4', 146, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (292, N'Description', N'ssdsd', N'000ssdsd', 146, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (293, N'Id', NULL, N'3', 147, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (294, N'NameAr', NULL, N'dsdDSDS', 147, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (295, N'NameEn', NULL, N'DSD', 147, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (296, N'Title', NULL, N'new test offer', 148, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (297, N'Description', NULL, N'fdfncvmvmkjjfkgj', 148, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (298, N'IsTop', NULL, N'False', 148, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (299, N'Price', NULL, N'500', 148, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (300, N'Id', NULL, NULL, 149, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (301, N'Id', NULL, N'5', 149, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (302, N'Description', N'fdfncvmvmkjjfkgj', N'test update', 149, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (305, N'Id', NULL, N'3', 170, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (306, N'NameAr', NULL, N'e', 170, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (307, N'NameEn', NULL, N'w', 170, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (308, N'Id', NULL, NULL, 171, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (309, N'Id', NULL, N'1', 171, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (310, N'Title', N'اعلان الدياسطى', N'New Test App', 171, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (311, N'Title', NULL, N'Preview Tajmeel Api', 173, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (312, N'Description', NULL, N'dfdf', 173, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (313, N'IsApprove', NULL, N'False', 173, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (314, N'IsTop', NULL, N'False', 173, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (315, N'Price', NULL, N'10', 173, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (316, N'Title', NULL, N'Preview Tajmeel Api', 174, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (317, N'Description', NULL, N'sdsdsd', 174, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (318, N'IsApprove', NULL, N'False', 174, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (319, N'IsTop', NULL, N'False', 174, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (320, N'Price', NULL, N'2', 174, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (321, N'Title', NULL, N'323`', 175, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (322, N'Description', NULL, N'233232', 175, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (323, N'IsApprove', NULL, N'False', 175, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (324, N'IsTop', NULL, N'False', 175, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (325, N'Price', NULL, N'5', 175, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (326, N'Title', NULL, N'Preview Tajmeel Api', 176, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (327, N'Description', NULL, N'سشس', 176, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (328, N'IsApprove', NULL, N'True', 176, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (329, N'IsTop', NULL, N'False', 176, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (330, N'Price', NULL, N'1', 176, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (336, N'NameEn', N'Mansoura', N'Mansoura -', 194, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (337, N'AgeAdMonthly', N'1', N'2', 195, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (338, N'Email', N'sdsd', N'aa', 196, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (339, N'Title', NULL, N'New Test App', 198, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (340, N'Description', NULL, N'ads ads', 198, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (341, N'Price', NULL, N'500.00', 198, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (342, N'Id', NULL, NULL, 200, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (343, N'Id', NULL, N'7', 200, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (344, N'Description', N'سشس', N'test update description', 200, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (345, N'Id', NULL, NULL, 201, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (346, N'Id', NULL, N'7', 201, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (347, N'Title', N'Preview Tajmeel Api', N'x', 201, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (348, N'Description', N'test update description', N'xx', 201, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (349, N'Id', NULL, NULL, 202, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (350, N'Id', NULL, N'7', 202, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (351, N'Title', N'x', N'x0', 202, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (352, N'Id', NULL, NULL, 205, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (353, N'Id', NULL, N'7', 205, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (354, N'IsTop', N'False', N'True', 205, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (355, N'Title', NULL, N'newImage', 206, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (356, N'Description', NULL, N'dsds', 206, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (357, N'IsApprove', NULL, N'False', 206, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (358, N'IsTop', NULL, N'False', 206, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (359, N'Price', NULL, N'20', 206, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (360, N'Title', NULL, N'x2', 207, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (361, N'Description', NULL, N'x2', 207, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (362, N'IsApprove', NULL, N'True', 207, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (363, N'IsTop', NULL, N'True', 207, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (364, N'Price', NULL, N'2', 207, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (365, N'Id', NULL, NULL, 210, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (366, N'Id', NULL, N'7', 210, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (367, N'Title', N'x0', N'0x0', 210, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (368, N'Id', NULL, NULL, 212, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (369, N'Id', NULL, N'7', 212, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (370, N'Title', N'0x0', N'0x00', 212, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (371, N'Title', NULL, N'ad video', 213, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (372, N'Description', NULL, N'ad video', 213, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (373, N'IsApprove', NULL, N'True', 213, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (374, N'IsTop', NULL, N'False', 213, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (375, N'Price', NULL, N'7000', 213, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (376, N'Title', NULL, N'sd', 216, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (377, N'Description', NULL, N'sdsd', 216, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (378, N'IsApprove', NULL, N'True', 216, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (379, N'IsTop', NULL, N'False', 216, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (380, N'Price', NULL, N'2', 216, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (381, N'Title', NULL, N'lastVoder', 218, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (382, N'Description', NULL, N'sds', 218, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (383, N'IsApprove', NULL, N'True', 218, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (384, N'IsTop', NULL, N'True', 218, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (385, N'Price', NULL, N'2', 218, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (386, N'AboutUsAr', N'dsd', N'dsdsdsd', 221, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (387, N'AboutUsAr', N'dsdsdsd', N'dsdsdsddsdsd', 225, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (388, N'ControllPanelLink', N'http://localhost:43913', N'http://dsds', 229, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (389, N'ControllPanelLink', N'http://dsds', N'http://dsds0', 230, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (390, N'ControllPanelLink', N'http://dsds0', N'http://localhost:43913', 231, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1339, N'UserName', NULL, N'ahme0dna', 1199, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1340, N'UserSerial', NULL, N'b5704b3b-c0d1-4d49-a128-b412943b736d', 1199, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1341, N'CategoryNameEn', NULL, N'ملابس', 1199, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1342, N'CategoryNameAr', NULL, N'Clothes', 1199, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1343, N'NameAr', NULL, N'قطر', 1202, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1344, N'NameEn', NULL, N'qutr', 1202, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1345, N'NameAr', NULL, N'j', 1203, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1346, N'NameEn', NULL, N'n', 1203, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1347, N'NameAr', N'درجات بخارية', N'j', 1204, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1348, N'NameEn', N'درجات بخارية', N'j', 1204, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1349, N'NameAr', NULL, N'سيارات', 1205, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1350, N'NameEn', NULL, N'Cars', 1205, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1351, N'NameAr', NULL, N'فيلا', 1206, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1352, N'NameEn', NULL, N'Villa', 1206, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1353, N'NameAr', NULL, N'فيلا', 1207, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1354, N'NameEn', NULL, N'Villa', 1207, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1355, N'NameAr', NULL, N'عمارة', 1207, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1356, N'NameEn', NULL, N'ٍٍSpire', 1207, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1357, N'NameAr', NULL, N'لوازم افراح', 1208, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1358, N'NameEn', NULL, N'Wedding Supplies', 1208, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1359, N'NameAr', NULL, N'لوازم افراح', 1209, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1360, N'NameEn', NULL, N'Wedding Supplies', 1209, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1361, N'NameAr', NULL, N'لوازم الافراحح', 1210, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1362, N'NameEn', NULL, N'Wedding Supplies', 1210, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1363, N'NameAr', NULL, N'سي', 1211, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1364, N'NameEn', NULL, N'يسي', 1211, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1365, N'NameAr', NULL, N'سي', 1215, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1366, N'NameEn', NULL, N'يسي', 1215, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1367, N'NameAr', NULL, N'fdfdf', 1216, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1368, N'NameEn', NULL, N'we', 1216, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1369, N'NameAr', NULL, N'fdfdf', 1218, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1370, N'NameEn', NULL, N'we', 1218, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1371, N'NameAr', N'لوازم الافراح', N'لوازم الافراحح', 1220, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1372, N'NameEn', N'لوازم الافراح', N'لوازم الافراحح', 1220, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1373, N'NameAr', NULL, N'شسيب', 1221, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1374, N'NameEn', NULL, N'سشسيبب', 1221, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1375, N'NameAr', NULL, N'درجات بخارية', 1227, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1376, N'NameEn', NULL, N'Motorcycle', 1227, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1377, N'NameAr', NULL, N'سيارات', 1228, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1378, N'NameEn', NULL, N'Cars', 1228, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1379, N'NameAr', N'ميكب', N'شسيب', 1230, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1380, N'NameEn', N'ميكب', N'شسيب', 1230, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1381, N'NameAr', NULL, N'تصوير فديو', 1232, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1382, N'NameEn', NULL, N'Video', 1232, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1383, N'NameAr', NULL, N'سيارات', 1233, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1384, N'NameEn', NULL, N'Cars', 1233, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1385, N'NameAr', NULL, N'موتسيكلات', 1234, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1386, N'NameEn', NULL, N'Motorcycle', 1234, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1387, N'CategoryNameAr', NULL, N'عقارات', 1235, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1388, N'CategoryNameEn', NULL, N'Real estate', 1235, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1389, N'InputNameAr', NULL, N'عدد الغرف', 1235, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1390, N'InputNameEn', NULL, N'Rooms Count', 1235, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1391, N'CategoryNameAr', NULL, N'عقارات', 1236, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1392, N'CategoryNameEn', NULL, N'Real estate', 1236, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1393, N'InputNameAr', NULL, N'عدد الغرف', 1236, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1394, N'InputNameEn', NULL, N'Rooms Count', 1236, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1395, N'CategoryNameAr', NULL, N'عقارات', 1236, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1396, N'CategoryNameEn', NULL, N'Real estate', 1236, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1397, N'InputNameAr', NULL, N'السعر', 1236, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1398, N'InputNameEn', NULL, N'Price', 1236, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1399, N'CategoryNameAr', NULL, N'عقارات', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1400, N'CategoryNameEn', NULL, N'Real estate', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1401, N'InputNameAr', NULL, N'عدد الغرف', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1402, N'InputNameEn', NULL, N'Rooms Count', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1403, N'CategoryNameAr', NULL, N'عقارات', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1404, N'CategoryNameEn', NULL, N'Real estate', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1405, N'InputNameAr', NULL, N'السعر', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1406, N'InputNameEn', NULL, N'Price', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1407, N'CategoryNameAr', NULL, N'عقارات', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1408, N'CategoryNameEn', NULL, N'Real estate', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1409, N'InputNameAr', NULL, N'عمر البناء', 1237, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1410, N'InputNameEn', NULL, N'Building Year', 1237, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1411, N'CategoryNameAr', NULL, N'عقارات', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1412, N'CategoryNameEn', NULL, N'Real estate', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1413, N'InputNameAr', NULL, N'عدد الغرف', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1414, N'InputNameEn', NULL, N'Rooms Count', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1415, N'CategoryNameAr', NULL, N'عقارات', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1416, N'CategoryNameEn', NULL, N'Real estate', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1417, N'InputNameAr', NULL, N'السعر', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1418, N'InputNameEn', NULL, N'Price', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1419, N'CategoryNameAr', NULL, N'عقارات', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1420, N'CategoryNameEn', NULL, N'Real estate', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1421, N'InputNameAr', NULL, N'عمر البناء', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1422, N'InputNameEn', NULL, N'Building Year', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1423, N'CategoryNameAr', NULL, N'عقارات', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1424, N'CategoryNameEn', NULL, N'Real estate', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1425, N'InputNameAr', NULL, N'سعر المتر', 1238, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1426, N'InputNameEn', NULL, N'Price PerMeter', 1238, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1427, N'CategoryNameAr', NULL, N'عقارات', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1428, N'CategoryNameEn', NULL, N'Real estate', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1429, N'InputNameAr', NULL, N'عدد الغرف', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1430, N'InputNameEn', NULL, N'Rooms Count', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1431, N'CategoryNameAr', NULL, N'عقارات', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1432, N'CategoryNameEn', NULL, N'Real estate', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1433, N'InputNameAr', NULL, N'السعر', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1434, N'InputNameEn', NULL, N'Price', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1435, N'CategoryNameAr', NULL, N'عقارات', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1436, N'CategoryNameEn', NULL, N'Real estate', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1437, N'InputNameAr', NULL, N'عمر البناء', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1438, N'InputNameEn', NULL, N'Building Year', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1439, N'CategoryNameAr', NULL, N'عقارات', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1440, N'CategoryNameEn', NULL, N'Real estate', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1441, N'InputNameAr', NULL, N'سعر المتر', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1442, N'InputNameEn', NULL, N'Price PerMeter', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1443, N'CategoryNameAr', NULL, N'عقارات', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1444, N'CategoryNameEn', NULL, N'Real estate', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1445, N'InputNameAr', NULL, N'الموقع', 1239, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1446, N'InputNameEn', NULL, N'Location', 1239, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1447, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1448, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1449, N'InputNameAr', NULL, N'عدد الغرف', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1450, N'InputNameEn', NULL, N'Rooms Count', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1451, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1452, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1453, N'InputNameAr', NULL, N'السعر', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1454, N'InputNameEn', NULL, N'Price', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1455, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1456, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1457, N'InputNameAr', NULL, N'عمر البناء', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1458, N'InputNameEn', NULL, N'Building Year', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1459, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1460, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1461, N'InputNameAr', NULL, N'سعر المتر', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1462, N'InputNameEn', NULL, N'Price PerMeter', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1463, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1464, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1465, N'InputNameAr', NULL, N'الموقع', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1466, N'InputNameEn', NULL, N'Location', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1467, N'CategoryNameAr', NULL, N'عقارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1468, N'CategoryNameEn', NULL, N'Real estate', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1469, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1240, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1470, N'InputNameEn', NULL, N'Parking Count', 1240, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1471, N'IsRequired', N'False', N'True', 1241, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1472, N'IsRequired', N'False', N'True', 1242, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1473, N'IsRequired', N'False', N'True', 1243, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1474, N'IsRequired', N'False', N'True', 1244, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1475, N'IsRequired', N'False', N'True', 1245, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1476, N'IsRequired', N'False', N'True', 1246, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1477, N'IsRequired', N'True', N'False', 1247, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1478, N'CategoryNameAr', NULL, N'عقارات', 1253, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1479, N'CategoryNameEn', NULL, N'Real estate', 1253, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1480, N'CategoryNameAr', NULL, N'عقارات', 1254, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1481, N'CategoryNameEn', NULL, N'Real estate', 1254, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1482, N'CategoryNameAr', NULL, N'عقارات', 1255, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1483, N'CategoryNameEn', NULL, N'Real estate', 1255, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1484, N'CategoryNameAr', NULL, N'عقارات', 1256, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1485, N'CategoryNameEn', NULL, N'Real estate', 1256, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1486, N'CategoryNameAr', NULL, N'عقارات', 1257, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1487, N'CategoryNameEn', NULL, N'Real estate', 1257, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1488, N'CategoryNameAr', NULL, N'عقارات', 1258, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1489, N'CategoryNameEn', NULL, N'Real estate', 1258, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1490, N'CategoryNameAr', NULL, N'عقارات', 1259, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1491, N'CategoryNameEn', NULL, N'Real estate', 1259, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1492, N'InputNameAr', NULL, N'عدد الطوابق', 1259, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1493, N'InputNameEn', NULL, N'Apartment Count', 1259, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1494, N'CategoryNameAr', NULL, N'عقارات', 1260, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1495, N'CategoryNameEn', NULL, N'Real estate', 1260, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1496, N'InputNameAr', NULL, N'عدد الطوابق', 1260, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1497, N'InputNameEn', NULL, N'Apartment Count', 1260, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1498, N'CategoryNameAr', NULL, N'عقارات', 1260, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1499, N'CategoryNameEn', NULL, N'Real estate', 1260, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1500, N'InputNameAr', NULL, N'مبلغ التامين', 1260, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1501, N'InputNameEn', NULL, N'Amount Of Insurance', 1260, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1502, N'CategoryNameAr', NULL, N'عقارات', 1263, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1503, N'CategoryNameEn', NULL, N'Real estate', 1263, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1504, N'CategoryNameAr', NULL, N'عقارات', 1264, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1505, N'CategoryNameEn', NULL, N'Real estate', 1264, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1506, N'CategoryNameAr', NULL, N'عقارات', 1265, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1507, N'CategoryNameEn', NULL, N'Real estate', 1265, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1508, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1265, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1509, N'InputNameEn', NULL, N'Bags Big Count', 1265, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1510, N'CategoryNameAr', NULL, N'عقارات', 1266, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1511, N'CategoryNameEn', NULL, N'Real estate', 1266, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1512, N'InputNameAr', NULL, N'السن او العمر', 1266, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1513, N'InputNameEn', NULL, N'Age', 1266, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1514, N'CategoryNameAr', NULL, N'عقارات', 1267, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1515, N'CategoryNameEn', NULL, N'Real estate', 1267, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1516, N'CategoryNameAr', NULL, N'عقارات', 1268, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1517, N'CategoryNameEn', NULL, N'Real estate', 1268, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1518, N'CategoryNameAr', NULL, N'عقارات', 1269, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1519, N'CategoryNameEn', NULL, N'Real estate', 1269, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1520, N'InputNameAr', NULL, N'عدد الغرف', 1269, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1521, N'InputNameEn', NULL, N'Rooms Count', 1269, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1522, N'CategoryNameAr', NULL, N'عقارات', 1270, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1523, N'CategoryNameEn', NULL, N'Real estate', 1270, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1524, N'InputNameAr', NULL, N'عدد الغرف', 1270, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1525, N'InputNameEn', NULL, N'Rooms Count', 1270, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1526, N'CategoryNameAr', NULL, N'عقارات', 1270, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1527, N'CategoryNameEn', NULL, N'Real estate', 1270, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1528, N'InputNameAr', NULL, N'السعر', 1270, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1529, N'InputNameEn', NULL, N'Price', 1270, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1530, N'CategoryNameAr', NULL, N'عقارات', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1531, N'CategoryNameEn', NULL, N'Real estate', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1532, N'InputNameAr', NULL, N'عدد الغرف', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1533, N'InputNameEn', NULL, N'Rooms Count', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1534, N'CategoryNameAr', NULL, N'عقارات', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1535, N'CategoryNameEn', NULL, N'Real estate', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1536, N'InputNameAr', NULL, N'السعر', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1537, N'InputNameEn', NULL, N'Price', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1538, N'CategoryNameAr', NULL, N'عقارات', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1539, N'CategoryNameEn', NULL, N'Real estate', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1540, N'InputNameAr', NULL, N'عمر البناء', 1271, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1541, N'InputNameEn', NULL, N'Building Year', 1271, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1542, N'CategoryNameAr', NULL, N'عقارات', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1543, N'CategoryNameEn', NULL, N'Real estate', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1544, N'InputNameAr', NULL, N'عدد الغرف', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1545, N'InputNameEn', NULL, N'Rooms Count', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1546, N'CategoryNameAr', NULL, N'عقارات', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1547, N'CategoryNameEn', NULL, N'Real estate', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1548, N'InputNameAr', NULL, N'السعر', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1549, N'InputNameEn', NULL, N'Price', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1550, N'CategoryNameAr', NULL, N'عقارات', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1551, N'CategoryNameEn', NULL, N'Real estate', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1552, N'InputNameAr', NULL, N'عمر البناء', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1553, N'InputNameEn', NULL, N'Building Year', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1554, N'CategoryNameAr', NULL, N'عقارات', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1555, N'CategoryNameEn', NULL, N'Real estate', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1556, N'InputNameAr', NULL, N'سعر المتر', 1272, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1557, N'InputNameEn', NULL, N'Price PerMeter', 1272, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1558, N'CategoryNameAr', NULL, N'عقارات', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1559, N'CategoryNameEn', NULL, N'Real estate', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1560, N'InputNameAr', NULL, N'عدد الغرف', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1561, N'InputNameEn', NULL, N'Rooms Count', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1562, N'CategoryNameAr', NULL, N'عقارات', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1563, N'CategoryNameEn', NULL, N'Real estate', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1564, N'InputNameAr', NULL, N'السعر', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1565, N'InputNameEn', NULL, N'Price', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1566, N'CategoryNameAr', NULL, N'عقارات', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1567, N'CategoryNameEn', NULL, N'Real estate', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1568, N'InputNameAr', NULL, N'عمر البناء', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1569, N'InputNameEn', NULL, N'Building Year', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1570, N'CategoryNameAr', NULL, N'عقارات', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1571, N'CategoryNameEn', NULL, N'Real estate', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1572, N'InputNameAr', NULL, N'سعر المتر', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1573, N'InputNameEn', NULL, N'Price PerMeter', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1574, N'CategoryNameAr', NULL, N'عقارات', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1575, N'CategoryNameEn', NULL, N'Real estate', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1576, N'InputNameAr', NULL, N'عدد الطوابق', 1273, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1577, N'InputNameEn', NULL, N'Apartment Count', 1273, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1578, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1579, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1580, N'InputNameAr', NULL, N'عدد الغرف', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1581, N'InputNameEn', NULL, N'Rooms Count', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1582, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1583, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1584, N'InputNameAr', NULL, N'السعر', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1585, N'InputNameEn', NULL, N'Price', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1586, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1587, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1588, N'InputNameAr', NULL, N'عمر البناء', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1589, N'InputNameEn', NULL, N'Building Year', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1590, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1591, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1592, N'InputNameAr', NULL, N'سعر المتر', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1593, N'InputNameEn', NULL, N'Price PerMeter', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1594, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1595, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1596, N'InputNameAr', NULL, N'عدد الطوابق', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1597, N'InputNameEn', NULL, N'Apartment Count', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1598, N'CategoryNameAr', NULL, N'عقارات', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1599, N'CategoryNameEn', NULL, N'Real estate', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1600, N'InputNameAr', NULL, N'الموقع', 1274, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1601, N'InputNameEn', NULL, N'Location', 1274, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1602, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1603, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1604, N'InputNameAr', NULL, N'عدد الغرف', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1605, N'InputNameEn', NULL, N'Rooms Count', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1606, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1607, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1608, N'InputNameAr', NULL, N'السعر', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1609, N'InputNameEn', NULL, N'Price', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1610, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1611, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1612, N'InputNameAr', NULL, N'عمر البناء', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1613, N'InputNameEn', NULL, N'Building Year', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1614, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1615, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1616, N'InputNameAr', NULL, N'سعر المتر', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1617, N'InputNameEn', NULL, N'Price PerMeter', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1618, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1619, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1620, N'InputNameAr', NULL, N'عدد الطوابق', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1621, N'InputNameEn', NULL, N'Apartment Count', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1622, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1623, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1624, N'InputNameAr', NULL, N'الموقع', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1625, N'InputNameEn', NULL, N'Location', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1626, N'CategoryNameAr', NULL, N'عقارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1627, N'CategoryNameEn', NULL, N'Real estate', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1628, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1275, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1629, N'InputNameEn', NULL, N'Parking Count', 1275, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1630, N'CategoryNameAr', NULL, N'عقارات', 1276, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1631, N'CategoryNameEn', NULL, N'Real estate', 1276, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1632, N'InputNameAr', NULL, N'الموقع', 1276, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1633, N'InputNameEn', NULL, N'Location', 1276, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1634, N'CategoryNameAr', NULL, N'عقارات', 1277, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1635, N'CategoryNameEn', NULL, N'Real estate', 1277, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1636, N'InputNameAr', NULL, N'الموقع', 1277, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1637, N'InputNameEn', NULL, N'Location', 1277, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1638, N'CategoryNameAr', NULL, N'عقارات', 1277, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1639, N'CategoryNameEn', NULL, N'Real estate', 1277, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1640, N'InputNameAr', NULL, N'الخامات', 1277, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1641, N'InputNameEn', NULL, N'Materials', 1277, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1642, N'CategoryNameAr', NULL, N'عقارات', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1643, N'CategoryNameEn', NULL, N'Real estate', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1644, N'InputNameAr', NULL, N'الموقع', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1645, N'InputNameEn', NULL, N'Location', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1646, N'CategoryNameAr', NULL, N'عقارات', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1647, N'CategoryNameEn', NULL, N'Real estate', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1648, N'InputNameAr', NULL, N'الخامات', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1649, N'InputNameEn', NULL, N'Materials', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1650, N'CategoryNameAr', NULL, N'عقارات', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1651, N'CategoryNameEn', NULL, N'Real estate', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1652, N'InputNameAr', NULL, N'المساحة الحرة', 1278, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1653, N'InputNameEn', NULL, N'Free Size', 1278, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1654, N'IsRequired', N'False', N'True', 1279, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1655, N'CategoryNameAr', NULL, N'عقارات', 1286, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1656, N'CategoryNameEn', NULL, N'Real estate', 1286, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1657, N'InputNameAr', NULL, N'عمر البناء', 1286, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1658, N'InputNameEn', NULL, N'Building Year', 1286, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1659, N'CategoryNameAr', NULL, N'عقارات', 1287, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1660, N'CategoryNameEn', NULL, N'Real estate', 1287, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1661, N'InputNameAr', NULL, N'عمر البناء', 1287, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1662, N'InputNameEn', NULL, N'Building Year', 1287, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1663, N'CategoryNameAr', NULL, N'عقارات', 1287, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1664, N'CategoryNameEn', NULL, N'Real estate', 1287, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1665, N'InputNameAr', NULL, N'عدد الطوابق', 1287, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1666, N'InputNameEn', NULL, N'Apartment Count', 1287, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1667, N'CategoryNameAr', NULL, N'عقارات', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1668, N'CategoryNameEn', NULL, N'Real estate', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1669, N'InputNameAr', NULL, N'عمر البناء', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1670, N'InputNameEn', NULL, N'Building Year', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1671, N'CategoryNameAr', NULL, N'عقارات', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1672, N'CategoryNameEn', NULL, N'Real estate', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1673, N'InputNameAr', NULL, N'عدد الطوابق', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1674, N'InputNameEn', NULL, N'Apartment Count', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1675, N'CategoryNameAr', NULL, N'عقارات', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1676, N'CategoryNameEn', NULL, N'Real estate', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1677, N'InputNameAr', NULL, N'عدد المصاعد', 1288, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1678, N'InputNameEn', NULL, N'Elevator Counta', 1288, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1679, N'CategoryNameAr', NULL, N'عقارات', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1680, N'CategoryNameEn', NULL, N'Real estate', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1681, N'InputNameAr', NULL, N'عمر البناء', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1682, N'InputNameEn', NULL, N'Building Year', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1683, N'CategoryNameAr', NULL, N'عقارات', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1684, N'CategoryNameEn', NULL, N'Real estate', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1685, N'InputNameAr', NULL, N'عدد الطوابق', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1686, N'InputNameEn', NULL, N'Apartment Count', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1687, N'CategoryNameAr', NULL, N'عقارات', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1688, N'CategoryNameEn', NULL, N'Real estate', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1689, N'InputNameAr', NULL, N'عدد المصاعد', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1690, N'InputNameEn', NULL, N'Elevator Counta', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1691, N'CategoryNameAr', NULL, N'عقارات', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1692, N'CategoryNameEn', NULL, N'Real estate', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1693, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1289, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1694, N'InputNameEn', NULL, N'Bags Big Count', 1289, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1695, N'CategoryNameAr', NULL, N'عقارات', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1696, N'CategoryNameEn', NULL, N'Real estate', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1697, N'InputNameAr', NULL, N'عمر البناء', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1698, N'InputNameEn', NULL, N'Building Year', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1699, N'CategoryNameAr', NULL, N'عقارات', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1700, N'CategoryNameEn', NULL, N'Real estate', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1701, N'InputNameAr', NULL, N'عدد الطوابق', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1702, N'InputNameEn', NULL, N'Apartment Count', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1703, N'CategoryNameAr', NULL, N'عقارات', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1704, N'CategoryNameEn', NULL, N'Real estate', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1705, N'InputNameAr', NULL, N'عدد المصاعد', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1706, N'InputNameEn', NULL, N'Elevator Counta', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1707, N'CategoryNameAr', NULL, N'عقارات', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1708, N'CategoryNameEn', NULL, N'Real estate', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1709, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1710, N'InputNameEn', NULL, N'Bags Big Count', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1711, N'CategoryNameAr', NULL, N'عقارات', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1712, N'CategoryNameEn', NULL, N'Real estate', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1713, N'InputNameAr', NULL, N'السن او العمر', 1290, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1714, N'InputNameEn', NULL, N'Age', 1290, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1715, N'CategoryNameAr', NULL, N'عقارات', 1296, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1716, N'CategoryNameEn', NULL, N'Real estate', 1296, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1717, N'InputNameAr', NULL, N'عدد الغرف', 1296, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1718, N'InputNameEn', NULL, N'Rooms Count', 1296, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1719, N'CategoryNameAr', NULL, N'عقارات', 1297, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1720, N'CategoryNameEn', NULL, N'Real estate', 1297, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1721, N'InputNameAr', NULL, N'عدد الغرف', 1297, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1722, N'InputNameEn', NULL, N'Rooms Count', 1297, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1723, N'CategoryNameAr', NULL, N'عقارات', 1297, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1724, N'CategoryNameEn', NULL, N'Real estate', 1297, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1725, N'InputNameAr', NULL, N'عدد المقاعد', 1297, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1726, N'InputNameEn', NULL, N'Seats Count', 1297, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1727, N'CategoryNameAr', NULL, N'عقارات', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1728, N'CategoryNameEn', NULL, N'Real estate', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1729, N'InputNameAr', NULL, N'عدد الغرف', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1730, N'InputNameEn', NULL, N'Rooms Count', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1731, N'CategoryNameAr', NULL, N'عقارات', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1732, N'CategoryNameEn', NULL, N'Real estate', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1733, N'InputNameAr', NULL, N'عدد المقاعد', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1734, N'InputNameEn', NULL, N'Seats Count', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1735, N'CategoryNameAr', NULL, N'عقارات', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1736, N'CategoryNameEn', NULL, N'Real estate', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1737, N'InputNameAr', NULL, N'عدد دورات المياة', 1298, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1738, N'InputNameEn', NULL, N'Toilets Count', 1298, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1739, N'CategoryNameAr', NULL, N'عقارات', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1740, N'CategoryNameEn', NULL, N'Real estate', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1741, N'InputNameAr', NULL, N'عدد الغرف', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1742, N'InputNameEn', NULL, N'Rooms Count', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1743, N'CategoryNameAr', NULL, N'عقارات', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1744, N'CategoryNameEn', NULL, N'Real estate', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1745, N'InputNameAr', NULL, N'عدد المقاعد', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1746, N'InputNameEn', NULL, N'Seats Count', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1747, N'CategoryNameAr', NULL, N'عقارات', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1748, N'CategoryNameEn', NULL, N'Real estate', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1749, N'InputNameAr', NULL, N'عدد دورات المياة', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1750, N'InputNameEn', NULL, N'Toilets Count', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1751, N'CategoryNameAr', NULL, N'عقارات', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1752, N'CategoryNameEn', NULL, N'Real estate', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1753, N'InputNameAr', NULL, N'رقم الطابق', 1299, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1754, N'InputNameEn', NULL, N'Floor Number', 1299, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1755, N'CategoryNameAr', NULL, N'عقارات', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1756, N'CategoryNameEn', NULL, N'Real estate', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1757, N'InputNameAr', NULL, N'عدد الغرف', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1758, N'InputNameEn', NULL, N'Rooms Count', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1759, N'CategoryNameAr', NULL, N'عقارات', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1760, N'CategoryNameEn', NULL, N'Real estate', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1761, N'InputNameAr', NULL, N'عدد المقاعد', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1762, N'InputNameEn', NULL, N'Seats Count', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1763, N'CategoryNameAr', NULL, N'عقارات', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1764, N'CategoryNameEn', NULL, N'Real estate', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1765, N'InputNameAr', NULL, N'عدد دورات المياة', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1766, N'InputNameEn', NULL, N'Toilets Count', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1767, N'CategoryNameAr', NULL, N'عقارات', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1768, N'CategoryNameEn', NULL, N'Real estate', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1769, N'InputNameAr', NULL, N'رقم الطابق', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1770, N'InputNameEn', NULL, N'Floor Number', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1771, N'CategoryNameAr', NULL, N'عقارات', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1772, N'CategoryNameEn', NULL, N'Real estate', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1773, N'InputNameAr', NULL, N'السعر', 1300, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1774, N'InputNameEn', NULL, N'Price', 1300, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1775, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1776, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1777, N'InputNameAr', NULL, N'عدد الغرف', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1778, N'InputNameEn', NULL, N'Rooms Count', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1779, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1780, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1781, N'InputNameAr', NULL, N'عدد المقاعد', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1782, N'InputNameEn', NULL, N'Seats Count', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1783, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1784, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1785, N'InputNameAr', NULL, N'عدد دورات المياة', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1786, N'InputNameEn', NULL, N'Toilets Count', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1787, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1788, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1789, N'InputNameAr', NULL, N'رقم الطابق', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1790, N'InputNameEn', NULL, N'Floor Number', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1791, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1792, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1793, N'InputNameAr', NULL, N'السعر', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1794, N'InputNameEn', NULL, N'Price', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1795, N'CategoryNameAr', NULL, N'عقارات', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1796, N'CategoryNameEn', NULL, N'Real estate', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1797, N'InputNameAr', NULL, N'عرض الشارع', 1301, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1798, N'InputNameEn', NULL, N'Street Width', 1301, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1799, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1800, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1801, N'InputNameAr', NULL, N'عدد الغرف', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1802, N'InputNameEn', NULL, N'Rooms Count', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1803, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1804, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1805, N'InputNameAr', NULL, N'عدد المقاعد', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1806, N'InputNameEn', NULL, N'Seats Count', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1807, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1808, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1809, N'InputNameAr', NULL, N'عدد دورات المياة', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1810, N'InputNameEn', NULL, N'Toilets Count', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1811, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1812, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1813, N'InputNameAr', NULL, N'رقم الطابق', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1814, N'InputNameEn', NULL, N'Floor Number', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1815, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1816, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1817, N'InputNameAr', NULL, N'السعر', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1818, N'InputNameEn', NULL, N'Price', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1819, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1820, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1821, N'InputNameAr', NULL, N'عرض الشارع', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1822, N'InputNameEn', NULL, N'Street Width', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1823, N'CategoryNameAr', NULL, N'عقارات', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1824, N'CategoryNameEn', NULL, N'Real estate', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1825, N'InputNameAr', NULL, N'سعر المتر', 1302, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1826, N'InputNameEn', NULL, N'Price PerMeter', 1302, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1827, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1828, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1829, N'InputNameAr', NULL, N'عدد الغرف', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1830, N'InputNameEn', NULL, N'Rooms Count', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1831, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1832, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1833, N'InputNameAr', NULL, N'عدد المقاعد', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1834, N'InputNameEn', NULL, N'Seats Count', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1835, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1836, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1837, N'InputNameAr', NULL, N'عدد دورات المياة', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1838, N'InputNameEn', NULL, N'Toilets Count', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1839, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1840, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1841, N'InputNameAr', NULL, N'رقم الطابق', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1842, N'InputNameEn', NULL, N'Floor Number', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1843, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1844, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1845, N'InputNameAr', NULL, N'السعر', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1846, N'InputNameEn', NULL, N'Price', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1847, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1848, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1849, N'InputNameAr', NULL, N'عرض الشارع', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1850, N'InputNameEn', NULL, N'Street Width', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1851, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1852, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1853, N'InputNameAr', NULL, N'سعر المتر', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1854, N'InputNameEn', NULL, N'Price PerMeter', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1855, N'CategoryNameAr', NULL, N'عقارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1856, N'CategoryNameEn', NULL, N'Real estate', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1857, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1303, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1858, N'InputNameEn', NULL, N'Parking Count', 1303, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1859, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1860, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1861, N'InputNameAr', NULL, N'عدد الغرف', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1862, N'InputNameEn', NULL, N'Rooms Count', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1863, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1864, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1865, N'InputNameAr', NULL, N'عدد المقاعد', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1866, N'InputNameEn', NULL, N'Seats Count', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1867, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1868, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1869, N'InputNameAr', NULL, N'عدد دورات المياة', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1870, N'InputNameEn', NULL, N'Toilets Count', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1871, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1872, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1873, N'InputNameAr', NULL, N'رقم الطابق', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1874, N'InputNameEn', NULL, N'Floor Number', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1875, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1876, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1877, N'InputNameAr', NULL, N'السعر', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1878, N'InputNameEn', NULL, N'Price', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1879, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1880, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1881, N'InputNameAr', NULL, N'عرض الشارع', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1882, N'InputNameEn', NULL, N'Street Width', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1883, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1884, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1885, N'InputNameAr', NULL, N'سعر المتر', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1886, N'InputNameEn', NULL, N'Price PerMeter', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1887, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1888, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1889, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1890, N'InputNameEn', NULL, N'Parking Count', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1891, N'CategoryNameAr', NULL, N'عقارات', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1892, N'CategoryNameEn', NULL, N'Real estate', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1893, N'InputNameAr', NULL, N'الموديل', 1304, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1894, N'InputNameEn', NULL, N'Model', 1304, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1895, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1896, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1897, N'InputNameAr', NULL, N'عدد الغرف', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1898, N'InputNameEn', NULL, N'Rooms Count', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1899, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1900, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1901, N'InputNameAr', NULL, N'عدد المقاعد', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1902, N'InputNameEn', NULL, N'Seats Count', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1903, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1904, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1905, N'InputNameAr', NULL, N'عدد دورات المياة', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1906, N'InputNameEn', NULL, N'Toilets Count', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1907, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1908, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1909, N'InputNameAr', NULL, N'رقم الطابق', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1910, N'InputNameEn', NULL, N'Floor Number', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1911, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1912, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1913, N'InputNameAr', NULL, N'السعر', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1914, N'InputNameEn', NULL, N'Price', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1915, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1916, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1917, N'InputNameAr', NULL, N'عرض الشارع', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1918, N'InputNameEn', NULL, N'Street Width', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1919, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1920, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1921, N'InputNameAr', NULL, N'سعر المتر', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1922, N'InputNameEn', NULL, N'Price PerMeter', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1923, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1924, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1925, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1926, N'InputNameEn', NULL, N'Parking Count', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1927, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1928, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1929, N'InputNameAr', NULL, N'الموديل', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1930, N'InputNameEn', NULL, N'Model', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1931, N'CategoryNameAr', NULL, N'عقارات', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1932, N'CategoryNameEn', NULL, N'Real estate', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1933, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1305, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1934, N'InputNameEn', NULL, N'Bags Small Count', 1305, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1935, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1936, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1937, N'InputNameAr', NULL, N'عدد الغرف', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1938, N'InputNameEn', NULL, N'Rooms Count', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1939, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1940, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1941, N'InputNameAr', NULL, N'عدد المقاعد', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1942, N'InputNameEn', NULL, N'Seats Count', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1943, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1944, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1945, N'InputNameAr', NULL, N'عدد دورات المياة', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1946, N'InputNameEn', NULL, N'Toilets Count', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1947, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1948, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1949, N'InputNameAr', NULL, N'رقم الطابق', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1950, N'InputNameEn', NULL, N'Floor Number', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1951, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1952, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1953, N'InputNameAr', NULL, N'السعر', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1954, N'InputNameEn', NULL, N'Price', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1955, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1956, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1957, N'InputNameAr', NULL, N'عرض الشارع', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1958, N'InputNameEn', NULL, N'Street Width', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1959, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1960, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1961, N'InputNameAr', NULL, N'سعر المتر', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1962, N'InputNameEn', NULL, N'Price PerMeter', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1963, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1964, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1965, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1966, N'InputNameEn', NULL, N'Parking Count', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1967, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1968, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1969, N'InputNameAr', NULL, N'الموديل', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1970, N'InputNameEn', NULL, N'Model', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1971, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1972, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1973, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1974, N'InputNameEn', NULL, N'Bags Small Count', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1975, N'CategoryNameAr', NULL, N'عقارات', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1976, N'CategoryNameEn', NULL, N'Real estate', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1977, N'InputNameAr', NULL, N'مبلغ التامين', 1306, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1978, N'InputNameEn', NULL, N'Amount Of Insurance', 1306, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1979, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1980, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1981, N'InputNameAr', NULL, N'عدد الغرف', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1982, N'InputNameEn', NULL, N'Rooms Count', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1983, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1984, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1985, N'InputNameAr', NULL, N'عدد المقاعد', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1986, N'InputNameEn', NULL, N'Seats Count', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1987, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1988, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1989, N'InputNameAr', NULL, N'عدد دورات المياة', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1990, N'InputNameEn', NULL, N'Toilets Count', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1991, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1992, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1993, N'InputNameAr', NULL, N'رقم الطابق', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1994, N'InputNameEn', NULL, N'Floor Number', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1995, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1996, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1997, N'InputNameAr', NULL, N'السعر', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1998, N'InputNameEn', NULL, N'Price', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (1999, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2000, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2001, N'InputNameAr', NULL, N'عرض الشارع', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2002, N'InputNameEn', NULL, N'Street Width', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2003, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2004, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2005, N'InputNameAr', NULL, N'سعر المتر', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2006, N'InputNameEn', NULL, N'Price PerMeter', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2007, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2008, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2009, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2010, N'InputNameEn', NULL, N'Parking Count', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2011, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2012, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2013, N'InputNameAr', NULL, N'الموديل', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2014, N'InputNameEn', NULL, N'Model', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2015, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2016, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2017, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2018, N'InputNameEn', NULL, N'Bags Small Count', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2019, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2020, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2021, N'InputNameAr', NULL, N'مبلغ التامين', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2022, N'InputNameEn', NULL, N'Amount Of Insurance', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2023, N'CategoryNameAr', NULL, N'عقارات', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2024, N'CategoryNameEn', NULL, N'Real estate', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2025, N'InputNameAr', NULL, N'اللون', 1307, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2026, N'InputNameEn', NULL, N'Color', 1307, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2027, N'CategoryNameAr', NULL, N'عقارات', 1308, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2028, N'CategoryNameEn', NULL, N'Real estate', 1308, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2029, N'CategoryNameAr', NULL, N'عقارات', 1309, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2030, N'CategoryNameEn', NULL, N'Real estate', 1309, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2031, N'IsRequired', N'False', N'True', 1310, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2032, N'CategoryNameAr', NULL, N'عقارات', 1311, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2033, N'CategoryNameEn', NULL, N'Real estate', 1311, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2034, N'IsRequired', N'False', N'True', 1312, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2035, N'CategoryNameAr', NULL, N'عقارات', 1313, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2036, N'CategoryNameEn', NULL, N'Real estate', 1313, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2037, N'CategoryNameAr', NULL, N'عقارات', 1314, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2038, N'CategoryNameEn', NULL, N'Real estate', 1314, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2039, N'CategoryNameAr', NULL, N'عقارات', 1315, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2040, N'CategoryNameEn', NULL, N'Real estate', 1315, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2041, N'CategoryNameAr', NULL, N'عقارات', 1316, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2042, N'CategoryNameEn', NULL, N'Real estate', 1316, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2043, N'CategoryNameAr', NULL, N'عقارات', 1317, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2044, N'CategoryNameEn', NULL, N'Real estate', 1317, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2045, N'CategoryNameAr', NULL, N'عقارات', 1318, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2046, N'CategoryNameEn', NULL, N'Real estate', 1318, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2047, N'CategoryNameAr', NULL, N'عقارات', 1325, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2048, N'CategoryNameEn', NULL, N'Real estate', 1325, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2049, N'CategoryNameAr', NULL, N'عقارات', 1333, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2050, N'CategoryNameEn', NULL, N'Real estate', 1333, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2051, N'GroupsField', NULL, N'Basic Luxuries', 1333, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2052, N'CategoryNameAr', NULL, N'عقارات', 1334, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2053, N'CategoryNameEn', NULL, N'Real estate', 1334, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2054, N'CategoryNameAr', NULL, N'عقارات', 1335, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2055, N'CategoryNameEn', NULL, N'Real estate', 1335, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2056, N'GroupsField', NULL, N'Basic Luxuries', 1335, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2057, N'CategoryNameAr', NULL, N'عقارات', 1336, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2058, N'CategoryNameEn', NULL, N'Real estate', 1336, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2059, N'GroupsField', NULL, N'Basic Luxuries', 1336, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2060, N'CategoryNameAr', NULL, N'عقارات', 1336, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2061, N'CategoryNameEn', NULL, N'Real estate', 1336, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2062, N'GroupsField', NULL, N'Control System', 1336, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2063, N'CategoryNameAr', NULL, N'عقارات', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2064, N'CategoryNameEn', NULL, N'Real estate', 1337, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2065, N'GroupsField', NULL, N'Basic Luxuries', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2066, N'CategoryNameAr', NULL, N'عقارات', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2067, N'CategoryNameEn', NULL, N'Real estate', 1337, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2068, N'GroupsField', NULL, N'Control System', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2069, N'CategoryNameAr', NULL, N'عقارات', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2070, N'CategoryNameEn', NULL, N'Real estate', 1337, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2071, N'GroupsField', NULL, N'Finishing Type', 1337, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2072, N'CategoryNameAr', NULL, N'عقارات', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2073, N'CategoryNameEn', NULL, N'Real estate', 1338, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2074, N'GroupsField', NULL, N'Basic Luxuries', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2075, N'CategoryNameAr', NULL, N'عقارات', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2076, N'CategoryNameEn', NULL, N'Real estate', 1338, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2077, N'GroupsField', NULL, N'Control System', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2078, N'CategoryNameAr', NULL, N'عقارات', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2079, N'CategoryNameEn', NULL, N'Real estate', 1338, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2080, N'GroupsField', NULL, N'Finishing Type', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2081, N'CategoryNameAr', NULL, N'عقارات', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2082, N'CategoryNameEn', NULL, N'Real estate', 1338, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2083, N'GroupsField', NULL, N'Interface Type', 1338, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2084, N'CategoryNameAr', NULL, N'عقارات', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2085, N'CategoryNameEn', NULL, N'Real estate', 1339, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2086, N'GroupsField', NULL, N'Basic Luxuries', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2087, N'CategoryNameAr', NULL, N'عقارات', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2088, N'CategoryNameEn', NULL, N'Real estate', 1339, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2089, N'GroupsField', NULL, N'Control System', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2090, N'CategoryNameAr', NULL, N'عقارات', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2091, N'CategoryNameEn', NULL, N'Real estate', 1339, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2092, N'GroupsField', NULL, N'Finishing Type', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2093, N'CategoryNameAr', NULL, N'عقارات', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2094, N'CategoryNameEn', NULL, N'Real estate', 1339, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2095, N'GroupsField', NULL, N'Interface Type', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2096, N'CategoryNameAr', NULL, N'عقارات', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2097, N'CategoryNameEn', NULL, N'Real estate', 1339, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2098, N'GroupsField', NULL, N'Location', 1339, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2099, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2100, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2101, N'GroupsField', NULL, N'Basic Luxuries', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2102, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2103, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2104, N'GroupsField', NULL, N'Control System', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2105, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2106, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2107, N'GroupsField', NULL, N'Finishing Type', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2108, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2109, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2110, N'GroupsField', NULL, N'Interface Type', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2111, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2112, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2113, N'GroupsField', NULL, N'Location', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2114, N'CategoryNameAr', NULL, N'عقارات', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2115, N'CategoryNameEn', NULL, N'Real estate', 1340, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2116, N'GroupsField', NULL, N'Purpose', 1340, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2117, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2118, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2119, N'GroupsField', NULL, N'Basic Luxuries', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2120, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2121, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2122, N'GroupsField', NULL, N'Control System', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2123, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2124, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2125, N'GroupsField', NULL, N'Finishing Type', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2126, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2127, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2128, N'GroupsField', NULL, N'Interface Type', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2129, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2130, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2131, N'GroupsField', NULL, N'Location', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2132, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2133, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2134, N'GroupsField', NULL, N'Purpose', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2135, N'CategoryNameAr', NULL, N'عقارات', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2136, N'CategoryNameEn', NULL, N'Real estate', 1341, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2137, N'GroupsField', NULL, N'Sub Luxuries', 1341, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2138, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2139, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2140, N'GroupsField', NULL, N'Basic Luxuries', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2141, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2142, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2143, N'GroupsField', NULL, N'Control System', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2144, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2145, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2146, N'GroupsField', NULL, N'Finishing Type', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2147, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2148, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2149, N'GroupsField', NULL, N'Interface Type', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2150, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2151, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2152, N'GroupsField', NULL, N'Location', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2153, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2154, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2155, N'GroupsField', NULL, N'Purpose', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2156, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2157, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2158, N'GroupsField', NULL, N'Sub Luxuries', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2159, N'CategoryNameAr', NULL, N'عقارات', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2160, N'CategoryNameEn', NULL, N'Real estate', 1342, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2161, N'GroupsField', NULL, N'User Category', 1342, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2162, N'SubCategoryNameAr', NULL, N'عقارات', 1343, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2163, N'SubCategoryNameEn', NULL, N'Real estate', 1343, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2164, N'GroupsFieldsItem', NULL, N'In Villa', 1343, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2165, N'SubCategoryNameAr', NULL, N'عقارات', 1344, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2166, N'SubCategoryNameEn', NULL, N'Real estate', 1344, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2167, N'GroupsFieldsItem', NULL, N'In Tower', 1344, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2168, N'SubCategoryNameAr', NULL, N'عقارات', 1345, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2169, N'SubCategoryNameEn', NULL, N'Real estate', 1345, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2170, N'GroupsFieldsItem', NULL, N'In House', 1345, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2171, N'SubCategoryNameAr', NULL, N'عقارات', 1346, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2172, N'SubCategoryNameEn', NULL, N'Real estate', 1346, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2173, N'GroupsFieldsItem', NULL, N'Families', 1346, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2174, N'SubCategoryNameAr', NULL, N'عقارات', 1347, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2175, N'SubCategoryNameEn', NULL, N'Real estate', 1347, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2176, N'GroupsFieldsItem', NULL, N'Singles', 1347, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2177, N'SubCategoryNameAr', NULL, N'عقارات', 1348, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2178, N'SubCategoryNameEn', NULL, N'Real estate', 1348, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2179, N'GroupsFieldsItem', NULL, N'Roof', 1348, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2180, N'SubCategoryNameAr', NULL, N'عقارات', 1349, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2181, N'SubCategoryNameEn', NULL, N'Real estate', 1349, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2182, N'GroupsFieldsItem', NULL, N'Guarantee', 1349, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2183, N'SubCategoryNameAr', NULL, N'عقارات', 1350, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2184, N'SubCategoryNameEn', NULL, N'Real estate', 1350, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2185, N'GroupsFieldsItem', NULL, N'Chairs', 1350, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2186, N'SubCategoryNameAr', NULL, N'عقارات', 1351, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2187, N'SubCategoryNameEn', NULL, N'Real estate', 1351, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2188, N'GroupsFieldsItem', NULL, N'lighting', 1351, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2189, N'SubCategoryNameAr', NULL, N'عقارات', 1352, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2190, N'SubCategoryNameEn', NULL, N'Real estate', 1352, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2191, N'GroupsFieldsItem', NULL, N'Coffee Servers', 1352, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2192, N'SubCategoryNameAr', NULL, N'عقارات', 1353, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2193, N'SubCategoryNameEn', NULL, N'Real estate', 1353, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2194, N'GroupsFieldsItem', NULL, N'Tables', 1353, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2195, N'SubCategoryNameAr', NULL, N'عقارات', 1354, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2196, N'SubCategoryNameEn', NULL, N'Real estate', 1354, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2197, N'GroupsFieldsItem', NULL, N'Hospitality', 1354, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2198, N'SubCategoryNameAr', NULL, N'عقارات', 1355, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2199, N'SubCategoryNameEn', NULL, N'Real estate', 1355, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2200, N'GroupsFieldsItem', NULL, N'Swetts', 1355, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2201, N'SubCategoryNameAr', NULL, N'عقارات', 1356, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2202, N'SubCategoryNameEn', NULL, N'Real estate', 1356, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2203, N'GroupsFieldsItem', NULL, N'Security Official', 1356, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2204, N'SubCategoryNameAr', NULL, N'عقارات', 1357, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2205, N'SubCategoryNameEn', NULL, N'Real estate', 1357, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2206, N'GroupsFieldsItem', NULL, N'Kouche Settings', 1357, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2207, N'SubCategoryNameAr', NULL, N'عقارات', 1358, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2208, N'SubCategoryNameEn', NULL, N'Real estate', 1358, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2209, N'GroupsFieldsItem', NULL, N'Mosque', 1358, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2210, N'SubCategoryNameAr', NULL, N'عقارات', 1359, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2211, N'SubCategoryNameEn', NULL, N'Real estate', 1359, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2212, N'GroupsFieldsItem', NULL, N'Club', 1359, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2213, N'SubCategoryNameAr', NULL, N'عقارات', 1360, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2214, N'SubCategoryNameEn', NULL, N'Real estate', 1360, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2215, N'GroupsFieldsItem', NULL, N'Swimming Pool', 1360, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2216, N'SubCategoryNameAr', NULL, N'عقارات', 1361, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2217, N'SubCategoryNameEn', NULL, N'Real estate', 1361, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2218, N'GroupsFieldsItem', NULL, N'Maid Room', 1361, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2219, N'SubCategoryNameAr', NULL, N'عقارات', 1362, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2220, N'SubCategoryNameEn', NULL, N'Real estate', 1362, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2221, N'GroupsFieldsItem', NULL, N'Parking', 1362, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2222, N'SubCategoryNameAr', NULL, N'عقارات', 1363, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2223, N'SubCategoryNameEn', NULL, N'Real estate', 1363, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2224, N'GroupsFieldsItem', NULL, N'Elevator', 1363, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2225, N'SubCategoryNameAr', NULL, N'عقارات', 1364, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2226, N'SubCategoryNameEn', NULL, N'Real estate', 1364, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2227, N'GroupsFieldsItem', NULL, N'Air Conditioning', 1364, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2228, N'SubCategoryNameAr', NULL, N'عقارات', 1365, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2229, N'SubCategoryNameEn', NULL, N'Real estate', 1365, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2230, N'GroupsFieldsItem', NULL, N'Headsets', 1365, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2231, N'SubCategoryNameAr', NULL, N'عقارات', 1366, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2232, N'SubCategoryNameEn', NULL, N'Real estate', 1366, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2233, N'GroupsFieldsItem', NULL, N'Photographer', 1366, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2234, N'SubCategoryNameAr', NULL, N'عقارات', 1367, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2235, N'SubCategoryNameEn', NULL, N'Real estate', 1367, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2236, N'GroupsFieldsItem', NULL, N'Tent', 1367, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2237, N'SubCategoryNameAr', NULL, N'عقارات', 1368, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2238, N'SubCategoryNameEn', NULL, N'Real estate', 1368, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2239, N'GroupsFieldsItem', NULL, N'Cups', 1368, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2240, N'SubCategoryNameAr', NULL, N'عقارات', 1369, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2241, N'SubCategoryNameEn', NULL, N'Real estate', 1369, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2242, N'GroupsFieldsItem', NULL, N'Dishes', 1369, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2243, N'SubCategoryNameAr', NULL, N'عقارات', 1370, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2244, N'SubCategoryNameEn', NULL, N'Real estate', 1370, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2245, N'GroupsFieldsItem', NULL, N'Mugs', 1370, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2246, N'SubCategoryNameAr', NULL, N'عقارات', 1371, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2247, N'SubCategoryNameEn', NULL, N'Real estate', 1371, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2248, N'GroupsFieldsItem', NULL, N'Spoons', 1371, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2249, N'SubCategoryNameAr', NULL, N'عقارات', 1372, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2250, N'SubCategoryNameEn', NULL, N'Real estate', 1372, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2251, N'GroupsFieldsItem', NULL, N'Fans', 1372, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2252, N'SubCategoryNameAr', NULL, N'عقارات', 1373, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2253, N'SubCategoryNameEn', NULL, N'Real estate', 1373, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2254, N'GroupsFieldsItem', NULL, N'Burner', 1373, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2255, N'SubCategoryNameAr', NULL, N'عقارات', 1374, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2256, N'SubCategoryNameEn', NULL, N'Real estate', 1374, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2257, N'GroupsFieldsItem', NULL, N'Carpets', 1374, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2258, N'SubCategoryNameAr', NULL, N'عقارات', 1375, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2259, N'SubCategoryNameEn', NULL, N'Real estate', 1375, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2260, N'GroupsFieldsItem', NULL, N'Water Carrier', 1375, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2261, N'SubCategoryNameAr', NULL, N'عقارات', 1376, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2262, N'SubCategoryNameEn', NULL, N'Real estate', 1376, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2263, N'GroupsFieldsItem', NULL, N'Projector', 1376, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2264, N'SubCategoryNameAr', NULL, N'عقارات', 1377, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2265, N'SubCategoryNameEn', NULL, N'Real estate', 1377, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2266, N'GroupsFieldsItem', NULL, N'Guard Tours', 1377, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2267, N'SubCategoryNameAr', NULL, N'عقارات', 1378, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2268, N'SubCategoryNameEn', NULL, N'Real estate', 1378, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2269, N'GroupsFieldsItem', NULL, N'DJ', 1378, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2270, N'SubCategoryNameAr', NULL, N'عقارات', 1379, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2271, N'SubCategoryNameEn', NULL, N'Real estate', 1379, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2272, N'GroupsFieldsItem', NULL, N'Koshah', 1379, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2273, N'SubCategoryNameAr', NULL, N'عقارات', 1380, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2274, N'SubCategoryNameEn', NULL, N'Real estate', 1380, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2275, N'GroupsFieldsItem', NULL, N'Internal Laser', 1380, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2276, N'SubCategoryNameAr', NULL, N'عقارات', 1381, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2277, N'SubCategoryNameEn', NULL, N'Real estate', 1381, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2278, N'GroupsFieldsItem', NULL, N'External Laser', 1381, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2279, N'SubCategoryNameAr', NULL, N'عقارات', 1382, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2280, N'SubCategoryNameEn', NULL, N'Real estate', 1382, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2281, N'GroupsFieldsItem', NULL, N'Illuminated LED Tents', 1382, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2282, N'SubCategoryNameAr', NULL, N'عقارات', 1383, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2283, N'SubCategoryNameEn', NULL, N'Real estate', 1383, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2284, N'GroupsFieldsItem', NULL, N'Illuminated Tables', 1383, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2285, N'SubCategoryNameAr', NULL, N'عقارات', 1384, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2286, N'SubCategoryNameEn', NULL, N'Real estate', 1384, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2287, N'GroupsFieldsItem', NULL, N'Normal', 1384, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2288, N'SubCategoryNameAr', NULL, N'عقارات', 1385, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2289, N'SubCategoryNameEn', NULL, N'Real estate', 1385, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2290, N'GroupsFieldsItem', NULL, N'Lux', 1385, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2291, N'SubCategoryNameAr', NULL, N'عقارات', 1386, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2292, N'SubCategoryNameEn', NULL, N'Real estate', 1386, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2293, N'GroupsFieldsItem', NULL, N'Super Lux', 1386, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2294, N'SubCategoryNameAr', NULL, N'عقارات', 1387, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2295, N'SubCategoryNameEn', NULL, N'Real estate', 1387, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2296, N'GroupsFieldsItem', NULL, N'Front', 1387, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2297, N'SubCategoryNameAr', NULL, N'عقارات', 1388, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2298, N'SubCategoryNameEn', NULL, N'Real estate', 1388, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2299, N'GroupsFieldsItem', NULL, N'Rear', 1388, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2300, N'SubCategoryNameAr', NULL, N'عقارات', 1389, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2301, N'SubCategoryNameEn', NULL, N'Real estate', 1389, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2302, N'GroupsFieldsItem', NULL, N'Agricultural', 1389, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2303, N'SubCategoryNameAr', NULL, N'عقارات', 1390, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2304, N'SubCategoryNameEn', NULL, N'Real estate', 1390, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2305, N'GroupsFieldsItem', NULL, N'Dirt', 1390, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2306, N'SubCategoryNameAr', NULL, N'عقارات', 1391, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2307, N'SubCategoryNameEn', NULL, N'Real estate', 1391, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2308, N'GroupsFieldsItem', NULL, N'Commercial', 1391, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2309, N'SubCategoryNameAr', NULL, N'عقارات', 1392, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2310, N'SubCategoryNameEn', NULL, N'Real estate', 1392, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2311, N'GroupsFieldsItem', NULL, N'Residential', 1392, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2312, N'SubCategoryNameAr', NULL, N'عقارات', 1393, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2313, N'SubCategoryNameEn', NULL, N'Real estate', 1393, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2314, N'GroupsFieldsItem', NULL, N'Manual', 1393, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2315, N'SubCategoryNameAr', NULL, N'عقارات', 1394, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2316, N'SubCategoryNameEn', NULL, N'Real estate', 1394, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2317, N'GroupsFieldsItem', NULL, N'Automatic', 1394, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2318, N'CategoryNameAr', NULL, N'عقارات', 1395, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2319, N'CategoryNameEn', NULL, N'Real estate', 1395, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2320, N'InputNameAr', NULL, N'عدد الطوابق', 1395, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2321, N'InputNameEn', NULL, N'Apartment Count', 1395, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2322, N'CategoryNameAr', NULL, N'عقارات', 1396, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2323, N'CategoryNameEn', NULL, N'Real estate', 1396, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2324, N'CategoryNameAr', NULL, N'عقارات', 1397, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2325, N'CategoryNameEn', NULL, N'Real estate', 1397, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2326, N'InputNameAr', NULL, N'عدد الطوابق', 1397, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2327, N'InputNameEn', NULL, N'Apartment Count', 1397, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2328, N'CategoryNameAr', NULL, N'عقارات', 1398, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2329, N'CategoryNameEn', NULL, N'Real estate', 1398, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2330, N'InputNameAr', NULL, N'عدد الطوابق', 1398, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2331, N'InputNameEn', NULL, N'Apartment Count', 1398, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2332, N'CategoryNameAr', NULL, N'عقارات', 1398, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2333, N'CategoryNameEn', NULL, N'Real estate', 1398, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2334, N'InputNameAr', NULL, N'السن او العمر', 1398, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2335, N'InputNameEn', NULL, N'Age', 1398, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2336, N'CategoryNameAr', NULL, N'عقارات', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2337, N'CategoryNameEn', NULL, N'Real estate', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2338, N'InputNameAr', NULL, N'عدد الطوابق', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2339, N'InputNameEn', NULL, N'Apartment Count', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2340, N'CategoryNameAr', NULL, N'عقارات', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2341, N'CategoryNameEn', NULL, N'Real estate', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2342, N'InputNameAr', NULL, N'السن او العمر', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2343, N'InputNameEn', NULL, N'Age', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2344, N'CategoryNameAr', NULL, N'عقارات', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2345, N'CategoryNameEn', NULL, N'Real estate', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2346, N'InputNameAr', NULL, N'مبلغ التامين', 1399, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2347, N'InputNameEn', NULL, N'Amount Of Insurance', 1399, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2348, N'CategoryNameAr', NULL, N'عقارات', 1400, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2349, N'CategoryNameEn', NULL, N'Real estate', 1400, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2350, N'GroupsField', NULL, N'Burner', 1400, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2351, N'CategoryNameAr', NULL, N'عقارات', 1401, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2352, N'CategoryNameEn', NULL, N'Real estate', 1401, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2353, N'GroupsField', NULL, N'Automatic', 1401, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2354, N'CategoryNameAr', NULL, N'عقارات', 1409, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2355, N'CategoryNameEn', NULL, N'Real estate', 1409, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2356, N'InputNameAr', NULL, N'السن او العمر', 1409, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2357, N'InputNameEn', NULL, N'Age', 1409, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2358, N'CategoryNameAr', NULL, N'عقارات', 1410, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2359, N'CategoryNameEn', NULL, N'Real estate', 1410, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2360, N'CategoryNameAr', NULL, N'عقارات', 1411, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2361, N'CategoryNameEn', NULL, N'Real estate', 1411, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2362, N'GroupsField', NULL, N'lighting', 1411, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2363, N'NameAr', NULL, N'جزائرى', 1412, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2364, N'NameEn', NULL, N'ي', 1412, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2365, N'NameEn', N'ي', N'Algerian', 1413, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2368, N'NameAr', NULL, N'0', 1415, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2369, N'NameEn', NULL, N'0', 1415, 1, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2370, N'NameAr', NULL, N'x', 1416, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2371, N'NameEn', NULL, N'xx', 1416, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2372, N'NameAr', NULL, N'x', 1418, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2373, N'NameEn', NULL, N'xx0', 1418, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2374, N'CategoryNameAr', NULL, N'مركبات', 1419, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2375, N'CategoryNameEn', NULL, N'Vehicles', 1419, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2376, N'InputNameAr', NULL, N'عدد المقاعد', 1419, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2377, N'InputNameEn', NULL, N'Seats Count', 1419, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2378, N'CategoryNameAr', NULL, N'مركبات', 1420, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2379, N'CategoryNameEn', NULL, N'Vehicles', 1420, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2380, N'InputNameAr', NULL, N'عدد المقاعد', 1420, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2381, N'InputNameEn', NULL, N'Seats Count', 1420, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2382, N'CategoryNameAr', NULL, N'مركبات', 1420, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2383, N'CategoryNameEn', NULL, N'Vehicles', 1420, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2384, N'InputNameAr', NULL, N'رقم الطابق', 1420, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2385, N'InputNameEn', NULL, N'Floor Number', 1420, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2386, N'CategoryNameAr', NULL, N'مركبات', 1421, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2387, N'CategoryNameEn', NULL, N'Vehicles', 1421, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2388, N'Mark', NULL, N'تويتا', 1421, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2389, N'Mark', NULL, N'toyota', 1421, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2390, N'CategoryNameAr', NULL, N'مركبات', 1423, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2391, N'CategoryNameEn', NULL, N'Vehicles', 1423, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2392, N'Mark', NULL, N'مرسيدس', 1423, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2393, N'Mark', NULL, N'Mercedes', 1423, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2394, N'CategoryNameAr', NULL, N'مركبات', 1424, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2395, N'CategoryNameEn', NULL, N'Vehicles', 1424, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2396, N'Mark', NULL, N'لانسر', 1424, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2397, N'Mark', NULL, N'lancer', 1424, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2398, N'NameAr', NULL, N'xX', 1425, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2399, N'NameEn', NULL, N'X', 1425, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2400, N'NameAr', N'xX1', N'فندي', 1426, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2401, N'NameEn', N'xX1', N'فندي', 1426, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2402, N'NameAr', N'xX', N'xX1', 1427, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2403, N'NameEn', N'xX', N'xX1', 1427, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2404, N'NameAr', N'xX100', N'xX', 1428, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2405, N'NameEn', N'xX100', N'xX', 1428, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2406, N'NameAr', NULL, N'xX100', 1429, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2407, N'NameEn', NULL, N'X554', 1429, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2408, N'CategoryNameAr', NULL, N'لوازم الافراح', 1430, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2409, N'CategoryNameEn', NULL, N'Wedding Tools', 1430, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2410, N'Material', NULL, N'بلستر', 1430, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2411, N'Material', NULL, N'Polyester', 1430, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2412, N'CategoryNameAr', NULL, N'لوازم الافراح', 1431, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2413, N'CategoryNameEn', NULL, N'Wedding Tools', 1431, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2414, N'Material', NULL, N'ستان', 1431, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2415, N'Material', NULL, N'Stan', 1431, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2416, N'CategoryNameAr', NULL, N'لوازم الافراح', 1432, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2417, N'CategoryNameEn', NULL, N'Wedding Tools', 1432, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2418, N'Material', NULL, N'حرير', 1432, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2419, N'Material', NULL, N'Silk', 1432, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2546, N'CategoryNameAr', NULL, N'عقارات', 1451, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2547, N'CategoryNameEn', NULL, N'Real estate', 1451, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2548, N'CategoryNameAr', NULL, N'عقارات', 1452, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2549, N'CategoryNameEn', NULL, N'Real estate', 1452, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2550, N'CategoryNameAr', NULL, N'عقارات', 1452, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2551, N'CategoryNameEn', NULL, N'Real estate', 1452, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2552, N'CategoryNameAr', NULL, N'عقارات', 1453, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2553, N'CategoryNameEn', NULL, N'Real estate', 1453, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2554, N'CategoryNameAr', NULL, N'عقارات', 1453, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2555, N'CategoryNameEn', NULL, N'Real estate', 1453, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2556, N'CategoryNameAr', NULL, N'عقارات', 1453, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2557, N'CategoryNameEn', NULL, N'Real estate', 1453, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2558, N'CategoryNameAr', NULL, N'عقارات', 1454, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2559, N'CategoryNameEn', NULL, N'Real estate', 1454, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2560, N'CategoryNameAr', NULL, N'عقارات', 1454, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2561, N'CategoryNameEn', NULL, N'Real estate', 1454, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2562, N'CategoryNameAr', NULL, N'عقارات', 1454, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2563, N'CategoryNameEn', NULL, N'Real estate', 1454, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2564, N'CategoryNameAr', NULL, N'عقارات', 1454, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2565, N'CategoryNameEn', NULL, N'Real estate', 1454, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2566, N'CategoryNameAr', NULL, N'عقارات', 1455, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2567, N'CategoryNameEn', NULL, N'Real estate', 1455, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2568, N'CategoryNameAr', NULL, N'عقارات', 1455, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2569, N'CategoryNameEn', NULL, N'Real estate', 1455, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2570, N'CategoryNameAr', NULL, N'عقارات', 1455, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2571, N'CategoryNameEn', NULL, N'Real estate', 1455, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2572, N'CategoryNameAr', NULL, N'عقارات', 1455, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2573, N'CategoryNameEn', NULL, N'Real estate', 1455, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2574, N'CategoryNameAr', NULL, N'عقارات', 1455, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2575, N'CategoryNameEn', NULL, N'Real estate', 1455, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2576, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2577, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2578, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2579, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2580, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2581, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2582, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2583, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2584, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2585, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2586, N'CategoryNameAr', NULL, N'عقارات', 1456, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2587, N'CategoryNameEn', NULL, N'Real estate', 1456, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2588, N'CategoryNameAr', NULL, N'عقارات', 1457, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2589, N'CategoryNameEn', NULL, N'Real estate', 1457, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2590, N'CategoryNameAr', NULL, N'عقارات', 1458, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2591, N'CategoryNameEn', NULL, N'Real estate', 1458, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2592, N'CategoryNameAr', NULL, N'عقارات', 1458, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2593, N'CategoryNameEn', NULL, N'Real estate', 1458, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2594, N'CategoryNameAr', NULL, N'عقارات', 1459, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2595, N'CategoryNameEn', NULL, N'Real estate', 1459, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2596, N'CategoryNameAr', NULL, N'عقارات', 1460, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2597, N'CategoryNameEn', NULL, N'Real estate', 1460, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2598, N'CategoryNameAr', NULL, N'عقارات', 1461, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2599, N'CategoryNameEn', NULL, N'Real estate', 1461, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2600, N'CategoryNameAr', NULL, N'عقارات', 1461, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2601, N'CategoryNameEn', NULL, N'Real estate', 1461, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2602, N'IsRequired', N'False', N'True', 1462, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2603, N'IsRequired', N'False', N'True', 1463, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2604, N'IsRequired', N'False', N'True', 1464, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2605, N'IsRequired', N'False', N'True', 1465, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2606, N'IsRequired', N'False', N'True', 1466, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2607, N'IsRequired', N'False', N'True', 1467, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2608, N'CategoryNameAr', NULL, N'عقارات', 1468, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2609, N'CategoryNameEn', NULL, N'Real estate', 1468, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2610, N'CategoryNameAr', NULL, N'عقارات', 1469, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2611, N'CategoryNameEn', NULL, N'Real estate', 1469, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2612, N'CategoryNameAr', NULL, N'عقارات', 1469, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2613, N'CategoryNameEn', NULL, N'Real estate', 1469, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2614, N'CategoryNameAr', NULL, N'عقارات', 1470, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2615, N'CategoryNameEn', NULL, N'Real estate', 1470, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2616, N'Mark', NULL, N'لانسر', 1470, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2617, N'Mark', NULL, N'lancer', 1470, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2618, N'CategoryNameAr', NULL, N'عقارات', 1471, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2619, N'CategoryNameEn', NULL, N'Real estate', 1471, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2620, N'Mark', NULL, N'لانسر', 1471, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2621, N'Mark', NULL, N'lancer', 1471, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2622, N'CategoryNameAr', NULL, N'عقارات', 1471, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2623, N'CategoryNameEn', NULL, N'Real estate', 1471, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2624, N'Mark', NULL, N'مرسيدس', 1471, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2625, N'Mark', NULL, N'Mercedes', 1471, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2626, N'CategoryNameAr', NULL, N'عقارات', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2627, N'CategoryNameEn', NULL, N'Real estate', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2628, N'Mark', NULL, N'لانسر', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2629, N'Mark', NULL, N'lancer', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2630, N'CategoryNameAr', NULL, N'عقارات', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2631, N'CategoryNameEn', NULL, N'Real estate', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2632, N'Mark', NULL, N'مرسيدس', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2633, N'Mark', NULL, N'Mercedes', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2634, N'CategoryNameAr', NULL, N'عقارات', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2635, N'CategoryNameEn', NULL, N'Real estate', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2636, N'Mark', NULL, N'تويتا', 1472, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2637, N'Mark', NULL, N'toyota', 1472, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2638, N'CategoryNameAr', NULL, N'عقارات', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2639, N'CategoryNameEn', NULL, N'Real estate', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2640, N'Mark', NULL, N'لانسر', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2641, N'Mark', NULL, N'lancer', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2642, N'CategoryNameAr', NULL, N'عقارات', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2643, N'CategoryNameEn', NULL, N'Real estate', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2644, N'Mark', NULL, N'مرسيدس', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2645, N'Mark', NULL, N'Mercedes', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2646, N'CategoryNameAr', NULL, N'عقارات', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2647, N'CategoryNameEn', NULL, N'Real estate', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2648, N'Mark', NULL, N'تويتا', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2649, N'Mark', NULL, N'toyota', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2650, N'CategoryNameAr', NULL, N'عقارات', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2651, N'CategoryNameEn', NULL, N'Real estate', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2652, N'Mark', NULL, N'هوندا', 1473, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2653, N'Mark', NULL, N'honda', 1473, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2654, N'CategoryNameAr', NULL, N'عقارات', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2655, N'CategoryNameEn', NULL, N'Real estate', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2656, N'Mark', NULL, N'لانسر', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2657, N'Mark', NULL, N'lancer', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2658, N'CategoryNameAr', NULL, N'عقارات', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2659, N'CategoryNameEn', NULL, N'Real estate', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2660, N'Mark', NULL, N'مرسيدس', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2661, N'Mark', NULL, N'Mercedes', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2662, N'CategoryNameAr', NULL, N'عقارات', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2663, N'CategoryNameEn', NULL, N'Real estate', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2664, N'Mark', NULL, N'تويتا', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2665, N'Mark', NULL, N'toyota', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2666, N'CategoryNameAr', NULL, N'عقارات', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2667, N'CategoryNameEn', NULL, N'Real estate', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2668, N'Mark', NULL, N'هوندا', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2669, N'Mark', NULL, N'honda', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2670, N'CategoryNameAr', NULL, N'عقارات', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2671, N'CategoryNameEn', NULL, N'Real estate', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2672, N'Mark', NULL, N'تمبرلي لندن', 1474, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2673, N'Mark', NULL, N'Temperley London', 1474, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2674, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2675, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2676, N'Mark', NULL, N'لانسر', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2677, N'Mark', NULL, N'lancer', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2678, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2679, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2680, N'Mark', NULL, N'مرسيدس', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2681, N'Mark', NULL, N'Mercedes', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2682, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2683, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2684, N'Mark', NULL, N'تويتا', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2685, N'Mark', NULL, N'toyota', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2686, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2687, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2688, N'Mark', NULL, N'هوندا', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2689, N'Mark', NULL, N'honda', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2690, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2691, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2692, N'Mark', NULL, N'تمبرلي لندن', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2693, N'Mark', NULL, N'Temperley London', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2694, N'CategoryNameAr', NULL, N'عقارات', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2695, N'CategoryNameEn', NULL, N'Real estate', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2696, N'Mark', NULL, N'xX', 1475, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2697, N'Mark', NULL, N'X00', 1475, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2698, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2699, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2700, N'Mark', NULL, N'لانسر', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2701, N'Mark', NULL, N'lancer', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2702, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2703, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2704, N'Mark', NULL, N'مرسيدس', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2705, N'Mark', NULL, N'Mercedes', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2706, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2707, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2708, N'Mark', NULL, N'تويتا', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2709, N'Mark', NULL, N'toyota', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2710, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2711, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2712, N'Mark', NULL, N'هوندا', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2713, N'Mark', NULL, N'honda', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2714, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2715, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2716, N'Mark', NULL, N'تمبرلي لندن', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2717, N'Mark', NULL, N'Temperley London', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2718, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2719, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2720, N'Mark', NULL, N'xX', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2721, N'Mark', NULL, N'X00', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2722, N'CategoryNameAr', NULL, N'عقارات', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2723, N'CategoryNameEn', NULL, N'Real estate', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2724, N'Mark', NULL, N'فالنتينو', 1476, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2725, N'Mark', NULL, N'Valentino', 1476, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2726, N'CategoryNameAr', NULL, N'عقارات', 1477, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2727, N'CategoryNameEn', NULL, N'Real estate', 1477, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2728, N'Material', NULL, N'بلستر', 1477, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2729, N'Material', NULL, N'Polyester', 1477, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2730, N'CategoryNameAr', NULL, N'عقارات', 1478, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2731, N'CategoryNameEn', NULL, N'Real estate', 1478, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2732, N'Material', NULL, N'بلستر', 1478, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2733, N'Material', NULL, N'Polyester', 1478, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2734, N'CategoryNameAr', NULL, N'عقارات', 1478, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2735, N'CategoryNameEn', NULL, N'Real estate', 1478, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2736, N'Material', NULL, N'حرير', 1478, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2737, N'Material', NULL, N'Silk', 1478, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2738, N'CategoryNameAr', NULL, N'عقارات', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2739, N'CategoryNameEn', NULL, N'Real estate', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2740, N'Material', NULL, N'بلستر', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2741, N'Material', NULL, N'Polyester', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2742, N'CategoryNameAr', NULL, N'عقارات', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2743, N'CategoryNameEn', NULL, N'Real estate', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2744, N'Material', NULL, N'حرير', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2745, N'Material', NULL, N'Silk', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2746, N'CategoryNameAr', NULL, N'عقارات', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2747, N'CategoryNameEn', NULL, N'Real estate', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2748, N'Material', NULL, N'ستان', 1479, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2749, N'Material', NULL, N'Stan', 1479, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2750, N'CategoryNameAr', NULL, N'عقارات', 1480, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2751, N'CategoryNameEn', NULL, N'Real estate', 1480, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2752, N'InputNameAr', NULL, N'عدد المقاعد', 1480, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2753, N'InputNameEn', NULL, N'Seats Count', 1480, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2754, N'CategoryNameAr', NULL, N'عقارات', 1481, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2755, N'CategoryNameEn', NULL, N'Real estate', 1481, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2756, N'InputNameAr', NULL, N'عدد المقاعد', 1481, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2757, N'InputNameEn', NULL, N'Seats Count', 1481, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2758, N'CategoryNameAr', NULL, N'عقارات', 1481, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2759, N'CategoryNameEn', NULL, N'Real estate', 1481, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2760, N'InputNameAr', NULL, N'رقم الطابق', 1481, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2761, N'InputNameEn', NULL, N'Floor Number', 1481, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2762, N'CategoryNameAr', NULL, N'عقارات', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2763, N'CategoryNameEn', NULL, N'Real estate', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2764, N'InputNameAr', NULL, N'عدد المقاعد', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2765, N'InputNameEn', NULL, N'Seats Count', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2766, N'CategoryNameAr', NULL, N'عقارات', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2767, N'CategoryNameEn', NULL, N'Real estate', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2768, N'InputNameAr', NULL, N'رقم الطابق', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2769, N'InputNameEn', NULL, N'Floor Number', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2770, N'CategoryNameAr', NULL, N'عقارات', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2771, N'CategoryNameEn', NULL, N'Real estate', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2772, N'InputNameAr', NULL, N'عمر البناء', 1482, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2773, N'InputNameEn', NULL, N'Building Year', 1482, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2774, N'CategoryNameAr', NULL, N'عقارات', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2775, N'CategoryNameEn', NULL, N'Real estate', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2776, N'InputNameAr', NULL, N'عدد المقاعد', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2777, N'InputNameEn', NULL, N'Seats Count', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2778, N'CategoryNameAr', NULL, N'عقارات', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2779, N'CategoryNameEn', NULL, N'Real estate', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2780, N'InputNameAr', NULL, N'رقم الطابق', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2781, N'InputNameEn', NULL, N'Floor Number', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2782, N'CategoryNameAr', NULL, N'عقارات', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2783, N'CategoryNameEn', NULL, N'Real estate', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2784, N'InputNameAr', NULL, N'عمر البناء', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2785, N'InputNameEn', NULL, N'Building Year', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2786, N'CategoryNameAr', NULL, N'عقارات', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2787, N'CategoryNameEn', NULL, N'Real estate', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2788, N'InputNameAr', NULL, N'عدد الطوابق', 1483, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2789, N'InputNameEn', NULL, N'Apartment Count', 1483, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2790, N'CategoryNameAr', NULL, N'عقارات', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2791, N'CategoryNameEn', NULL, N'Real estate', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2792, N'InputNameAr', NULL, N'عدد المقاعد', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2793, N'InputNameEn', NULL, N'Seats Count', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2794, N'CategoryNameAr', NULL, N'عقارات', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2795, N'CategoryNameEn', NULL, N'Real estate', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2796, N'InputNameAr', NULL, N'رقم الطابق', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2797, N'InputNameEn', NULL, N'Floor Number', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2798, N'CategoryNameAr', NULL, N'عقارات', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2799, N'CategoryNameEn', NULL, N'Real estate', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2800, N'InputNameAr', NULL, N'عمر البناء', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2801, N'InputNameEn', NULL, N'Building Year', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2802, N'CategoryNameAr', NULL, N'عقارات', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2803, N'CategoryNameEn', NULL, N'Real estate', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2804, N'InputNameAr', NULL, N'عدد الطوابق', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2805, N'InputNameEn', NULL, N'Apartment Count', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2806, N'CategoryNameAr', NULL, N'عقارات', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2807, N'CategoryNameEn', NULL, N'Real estate', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2808, N'InputNameAr', NULL, N'الموديل', 1484, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2809, N'InputNameEn', NULL, N'Model', 1484, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2810, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2811, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2812, N'InputNameAr', NULL, N'عدد المقاعد', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2813, N'InputNameEn', NULL, N'Seats Count', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2814, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2815, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2816, N'InputNameAr', NULL, N'رقم الطابق', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2817, N'InputNameEn', NULL, N'Floor Number', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2818, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2819, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2820, N'InputNameAr', NULL, N'عمر البناء', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2821, N'InputNameEn', NULL, N'Building Year', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2822, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2823, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2824, N'InputNameAr', NULL, N'عدد الطوابق', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2825, N'InputNameEn', NULL, N'Apartment Count', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2826, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2827, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2828, N'InputNameAr', NULL, N'الموديل', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2829, N'InputNameEn', NULL, N'Model', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2830, N'CategoryNameAr', NULL, N'عقارات', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2831, N'CategoryNameEn', NULL, N'Real estate', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2832, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1485, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2833, N'InputNameEn', NULL, N'Bags Small Count', 1485, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2834, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2835, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2836, N'InputNameAr', NULL, N'عدد المقاعد', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2837, N'InputNameEn', NULL, N'Seats Count', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2838, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2839, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2840, N'InputNameAr', NULL, N'رقم الطابق', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2841, N'InputNameEn', NULL, N'Floor Number', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2842, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2843, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2844, N'InputNameAr', NULL, N'عمر البناء', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2845, N'InputNameEn', NULL, N'Building Year', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2846, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2847, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2848, N'InputNameAr', NULL, N'عدد الطوابق', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2849, N'InputNameEn', NULL, N'Apartment Count', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2850, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2851, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2852, N'InputNameAr', NULL, N'الموديل', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2853, N'InputNameEn', NULL, N'Model', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2854, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2855, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2856, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2857, N'InputNameEn', NULL, N'Bags Small Count', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2858, N'CategoryNameAr', NULL, N'عقارات', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2859, N'CategoryNameEn', NULL, N'Real estate', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2860, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1486, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2861, N'InputNameEn', NULL, N'Bags Big Count', 1486, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2862, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2863, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2864, N'InputNameAr', NULL, N'عدد المقاعد', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2865, N'InputNameEn', NULL, N'Seats Count', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2866, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2867, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2868, N'InputNameAr', NULL, N'رقم الطابق', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2869, N'InputNameEn', NULL, N'Floor Number', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2870, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2871, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2872, N'InputNameAr', NULL, N'عمر البناء', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2873, N'InputNameEn', NULL, N'Building Year', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2874, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2875, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2876, N'InputNameAr', NULL, N'عدد الطوابق', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2877, N'InputNameEn', NULL, N'Apartment Count', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2878, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2879, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2880, N'InputNameAr', NULL, N'الموديل', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2881, N'InputNameEn', NULL, N'Model', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2882, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2883, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2884, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2885, N'InputNameEn', NULL, N'Bags Small Count', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2886, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2887, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2888, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2889, N'InputNameEn', NULL, N'Bags Big Count', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2890, N'CategoryNameAr', NULL, N'عقارات', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2891, N'CategoryNameEn', NULL, N'Real estate', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2892, N'InputNameAr', NULL, N'مبلغ التامين', 1487, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2893, N'InputNameEn', NULL, N'Amount Of Insurance', 1487, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2894, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2895, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2896, N'InputNameAr', NULL, N'عدد المقاعد', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2897, N'InputNameEn', NULL, N'Seats Count', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2898, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2899, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2900, N'InputNameAr', NULL, N'رقم الطابق', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2901, N'InputNameEn', NULL, N'Floor Number', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2902, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2903, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2904, N'InputNameAr', NULL, N'عمر البناء', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2905, N'InputNameEn', NULL, N'Building Year', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2906, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2907, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2908, N'InputNameAr', NULL, N'عدد الطوابق', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2909, N'InputNameEn', NULL, N'Apartment Count', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2910, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2911, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2912, N'InputNameAr', NULL, N'الموديل', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2913, N'InputNameEn', NULL, N'Model', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2914, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2915, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2916, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2917, N'InputNameEn', NULL, N'Bags Small Count', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2918, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2919, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2920, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2921, N'InputNameEn', NULL, N'Bags Big Count', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2922, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2923, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2924, N'InputNameAr', NULL, N'مبلغ التامين', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2925, N'InputNameEn', NULL, N'Amount Of Insurance', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2926, N'CategoryNameAr', NULL, N'عقارات', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2927, N'CategoryNameEn', NULL, N'Real estate', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2928, N'InputNameAr', NULL, N'اللون', 1488, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2929, N'InputNameEn', NULL, N'Color', 1488, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2930, N'IsRequired', N'False', N'True', 1489, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2931, N'IsRequired', N'False', N'True', 1490, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2932, N'IsRequired', N'False', N'True', 1491, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2933, N'IsRequired', N'False', N'True', 1492, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2934, N'IsRequired', N'False', N'True', 1493, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2935, N'IsRequired', N'False', N'True', 1494, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2936, N'IsRequired', N'False', N'True', 1495, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2937, N'IsRequired', N'False', N'True', 1496, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2938, N'IsRequired', N'False', N'True', 1497, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2939, N'IsRequired', N'False', N'True', 1498, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2940, N'IsRequired', N'False', N'True', 1499, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2941, N'IsRequired', N'False', N'True', 1500, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2942, N'IsRequired', N'False', N'True', 1501, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2943, N'IsRequired', N'False', N'True', 1502, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2944, N'Title', NULL, N'cC25', 1503, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2945, N'Description', NULL, N'sdfg', 1503, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2946, N'Price', NULL, N'44', 1503, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2947, N'SubCategoryNameAr', NULL, N'عقارات', 1504, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2948, N'SubCategoryNameEn', NULL, N'Real estate', 1504, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2949, N'GroupsField', NULL, N'تجارى', 1504, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2950, N'SubCategoryNameAr', NULL, N'عقارات', 1505, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2951, N'SubCategoryNameEn', NULL, N'Real estate', 1505, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2952, N'GroupsField', NULL, N'سكنى', 1505, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2953, N'CategoryNameAr', NULL, N'عقارات', 1506, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2954, N'CategoryNameEn', NULL, N'Real estate', 1506, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2955, N'CategoryNameAr', NULL, N'عقارات', 1507, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2956, N'CategoryNameEn', NULL, N'Real estate', 1507, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2957, N'NameAr', NULL, N'تجربة فئة', 1508, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2958, N'NameEn', NULL, N'category test', 1508, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2959, N'NameAr', NULL, N'تجربة فئة فرعية', 1509, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2960, N'NameEn', NULL, N'sub category test', 1509, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2961, N'CategoryNameAr', NULL, N'تجربة فئة', 1510, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2962, N'CategoryNameEn', NULL, N'category test', 1510, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2963, N'Material', NULL, N'بلستر', 1510, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2964, N'Material', NULL, N'Polyester', 1510, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2965, N'CategoryNameAr', NULL, N'تجربة فئة', 1511, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2966, N'CategoryNameEn', NULL, N'category test', 1511, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2967, N'Material', NULL, N'بلستر', 1511, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2968, N'Material', NULL, N'Polyester', 1511, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2969, N'CategoryNameAr', NULL, N'تجربة فئة', 1511, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2970, N'CategoryNameEn', NULL, N'category test', 1511, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2971, N'Material', NULL, N'ستان', 1511, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2972, N'Material', NULL, N'Stan', 1511, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2973, N'CategoryNameAr', NULL, N'تجربة فئة', 1512, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2974, N'CategoryNameEn', NULL, N'category test', 1512, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2975, N'Material', NULL, N'حرير', 1512, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2976, N'Material', NULL, N'Silk', 1512, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2977, N'CategoryNameAr', NULL, N'مركبات', 1513, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2978, N'CategoryNameEn', NULL, N'Vehicles', 1513, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2979, N'Mark', NULL, N'لانسر', 1513, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2980, N'Mark', NULL, N'lancer', 1513, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2981, N'CategoryNameAr', NULL, N'مركبات', 1514, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2982, N'CategoryNameEn', NULL, N'Vehicles', 1514, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2983, N'Mark', NULL, N'لانسر', 1514, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2984, N'Mark', NULL, N'lancer', 1514, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2985, N'CategoryNameAr', NULL, N'مركبات', 1514, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2986, N'CategoryNameEn', NULL, N'Vehicles', 1514, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2987, N'Mark', NULL, N'مرسيدس', 1514, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2988, N'Mark', NULL, N'Mercedes', 1514, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2989, N'CategoryNameAr', NULL, N'مركبات', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2990, N'CategoryNameEn', NULL, N'Vehicles', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2991, N'Mark', NULL, N'لانسر', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2992, N'Mark', NULL, N'lancer', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2993, N'CategoryNameAr', NULL, N'مركبات', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2994, N'CategoryNameEn', NULL, N'Vehicles', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2995, N'Mark', NULL, N'مرسيدس', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2996, N'Mark', NULL, N'Mercedes', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2997, N'CategoryNameAr', NULL, N'مركبات', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2998, N'CategoryNameEn', NULL, N'Vehicles', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (2999, N'Mark', NULL, N'تويتا', 1515, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3000, N'Mark', NULL, N'toyota', 1515, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3001, N'CategoryNameAr', NULL, N'مركبات', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3002, N'CategoryNameEn', NULL, N'Vehicles', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3003, N'Mark', NULL, N'لانسر', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3004, N'Mark', NULL, N'lancer', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3005, N'CategoryNameAr', NULL, N'مركبات', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3006, N'CategoryNameEn', NULL, N'Vehicles', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3007, N'Mark', NULL, N'مرسيدس', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3008, N'Mark', NULL, N'Mercedes', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3009, N'CategoryNameAr', NULL, N'مركبات', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3010, N'CategoryNameEn', NULL, N'Vehicles', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3011, N'Mark', NULL, N'تويتا', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3012, N'Mark', NULL, N'toyota', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3013, N'CategoryNameAr', NULL, N'مركبات', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3014, N'CategoryNameEn', NULL, N'Vehicles', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3015, N'Mark', NULL, N'هوندا', 1516, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3016, N'Mark', NULL, N'honda', 1516, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3017, N'CategoryNameAr', NULL, N'مركبات', 1517, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3018, N'CategoryNameEn', NULL, N'Vehicles', 1517, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3019, N'Mark', NULL, N'مرسيدس', 1517, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3020, N'Mark', NULL, N'Mercedes', 1517, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3021, N'CategoryNameAr', NULL, N'مركبات', 1518, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3022, N'CategoryNameEn', NULL, N'Vehicles', 1518, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3023, N'Mark', NULL, N'مرسيدس', 1518, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3024, N'Mark', NULL, N'Mercedes', 1518, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3025, N'CategoryNameAr', NULL, N'مركبات', 1518, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3026, N'CategoryNameEn', NULL, N'Vehicles', 1518, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3027, N'Mark', NULL, N'فالنتينو', 1518, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3028, N'Mark', NULL, N'Valentino', 1518, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3029, N'CategoryNameAr', NULL, N'مركبات', 1519, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3030, N'CategoryNameEn', NULL, N'Vehicles', 1519, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3031, N'Mark', NULL, N'مرسيدس', 1519, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3032, N'Mark', NULL, N'Mercedes', 1519, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3033, N'CategoryNameAr', NULL, N'مركبات', 1520, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3034, N'CategoryNameEn', NULL, N'Vehicles', 1520, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3035, N'Mark', NULL, N'مرسيدس', 1520, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3036, N'Mark', NULL, N'Mercedes', 1520, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3037, N'CategoryNameAr', NULL, N'مركبات', 1520, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3038, N'CategoryNameEn', NULL, N'Vehicles', 1520, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3039, N'Mark', NULL, N'هوندا', 1520, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3040, N'Mark', NULL, N'honda', 1520, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3041, N'CategoryNameAr', NULL, N'تجربة فئة', 1521, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3042, N'CategoryNameEn', NULL, N'category test', 1521, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3043, N'InputNameAr', NULL, N'اللون', 1521, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3044, N'InputNameEn', NULL, N'Color', 1521, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3045, N'CategoryNameAr', NULL, N'تجربة فئة', 1522, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3046, N'CategoryNameEn', NULL, N'category test', 1522, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3047, N'InputNameAr', NULL, N'السن او العمر', 1522, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3048, N'InputNameEn', NULL, N'Age', 1522, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3049, N'IsRequired', N'False', N'True', 1523, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3050, N'NameAr', NULL, N'تجربة فئة فرعية 2', 1524, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3051, N'NameEn', NULL, N'sub category test 2', 1524, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3052, N'CategoryNameAr', NULL, N'تجربة فئة', 1525, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3053, N'CategoryNameEn', NULL, N'category test', 1525, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3054, N'CategoryNameAr', NULL, N'تجربة فئة', 1526, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3055, N'CategoryNameEn', NULL, N'category test', 1526, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3056, N'GroupsField', NULL, N'فى منزل', 1526, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3057, N'CategoryNameAr', NULL, N'تجربة فئة', 1527, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3058, N'CategoryNameEn', NULL, N'category test', 1527, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3059, N'InputNameAr', NULL, N'الموديل', 1527, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3060, N'InputNameEn', NULL, N'Model', 1527, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3061, N'CategoryNameAr', NULL, N'تجربة فئة', 1528, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3062, N'CategoryNameEn', NULL, N'category test', 1528, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3063, N'InputNameAr', NULL, N'الموديل', 1528, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3064, N'InputNameEn', NULL, N'Model', 1528, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3065, N'CategoryNameAr', NULL, N'تجربة فئة', 1528, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3066, N'CategoryNameEn', NULL, N'category test', 1528, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3067, N'InputNameAr', NULL, N'السن او العمر', 1528, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3068, N'InputNameEn', NULL, N'Age', 1528, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3069, N'CategoryNameAr', NULL, N'تجربة فئة', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3070, N'CategoryNameEn', NULL, N'category test', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3071, N'InputNameAr', NULL, N'الموديل', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3072, N'InputNameEn', NULL, N'Model', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3073, N'CategoryNameAr', NULL, N'تجربة فئة', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3074, N'CategoryNameEn', NULL, N'category test', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3075, N'InputNameAr', NULL, N'السن او العمر', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3076, N'InputNameEn', NULL, N'Age', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3077, N'CategoryNameAr', NULL, N'تجربة فئة', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3078, N'CategoryNameEn', NULL, N'category test', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3079, N'InputNameAr', NULL, N'اللون', 1529, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3080, N'InputNameEn', NULL, N'Color', 1529, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3081, N'IsRequired', N'False', N'True', 1530, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3082, N'IsRequired', N'False', N'True', 1531, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3083, N'CategoryNameAr', NULL, N'تجربة فئة', 1532, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3084, N'CategoryNameEn', NULL, N'category test', 1532, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3085, N'CategoryNameAr', NULL, N'تجربة فئة', 1533, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3086, N'CategoryNameEn', NULL, N'category test', 1533, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3087, N'CategoryNameAr', NULL, N'تجربة فئة', 1533, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3088, N'CategoryNameEn', NULL, N'category test', 1533, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3089, N'CategoryNameAr', NULL, N'تجربة فئة', 1534, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3090, N'CategoryNameEn', NULL, N'category test', 1534, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3091, N'CategoryNameAr', NULL, N'تجربة فئة', 1534, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3092, N'CategoryNameEn', NULL, N'category test', 1534, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3093, N'CategoryNameAr', NULL, N'تجربة فئة', 1534, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3094, N'CategoryNameEn', NULL, N'category test', 1534, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3095, N'CategoryNameAr', NULL, N'تجربة فئة', 1535, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3096, N'CategoryNameEn', NULL, N'category test', 1535, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3097, N'CategoryNameAr', NULL, N'تجربة فئة', 1535, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3098, N'CategoryNameEn', NULL, N'category test', 1535, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3099, N'CategoryNameAr', NULL, N'تجربة فئة', 1535, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3100, N'CategoryNameEn', NULL, N'category test', 1535, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3101, N'CategoryNameAr', NULL, N'تجربة فئة', 1535, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3102, N'CategoryNameEn', NULL, N'category test', 1535, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3103, N'CategoryNameAr', NULL, N'تجربة فئة', 1536, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3104, N'CategoryNameEn', NULL, N'category test', 1536, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3105, N'CategoryNameAr', NULL, N'تجربة فئة', 1536, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3106, N'CategoryNameEn', NULL, N'category test', 1536, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3107, N'CategoryNameAr', NULL, N'تجربة فئة', 1536, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3108, N'CategoryNameEn', NULL, N'category test', 1536, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3109, N'CategoryNameAr', NULL, N'تجربة فئة', 1536, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3110, N'CategoryNameEn', NULL, N'category test', 1536, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3111, N'CategoryNameAr', NULL, N'تجربة فئة', 1536, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3112, N'CategoryNameEn', NULL, N'category test', 1536, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3113, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3114, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3115, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3116, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3117, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3118, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3119, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3120, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3121, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3122, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3123, N'CategoryNameAr', NULL, N'تجربة فئة', 1537, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3124, N'CategoryNameEn', NULL, N'category test', 1537, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3125, N'CategoryNameAr', NULL, N'تجربة فئة', 1538, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3126, N'CategoryNameEn', NULL, N'category test', 1538, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3127, N'Material', NULL, N'بلستر', 1538, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3128, N'Material', NULL, N'Polyester', 1538, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3129, N'CategoryNameAr', NULL, N'تجربة فئة', 1539, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3130, N'CategoryNameEn', NULL, N'category test', 1539, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3131, N'Material', NULL, N'بلستر', 1539, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3132, N'Material', NULL, N'Polyester', 1539, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3133, N'CategoryNameAr', NULL, N'تجربة فئة', 1539, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3134, N'CategoryNameEn', NULL, N'category test', 1539, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3135, N'Material', NULL, N'ستان', 1539, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3136, N'Material', NULL, N'Stan', 1539, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3137, N'CategoryNameAr', NULL, N'تجربة فئة', 1540, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3138, N'CategoryNameEn', NULL, N'category test', 1540, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3139, N'Mark', NULL, N'تمبرلي لندن', 1540, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3140, N'Mark', NULL, N'Temperley London', 1540, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3141, N'CategoryNameAr', NULL, N'تجربة فئة', 1541, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3142, N'CategoryNameEn', NULL, N'category test', 1541, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3143, N'Mark', NULL, N'تمبرلي لندن', 1541, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3144, N'Mark', NULL, N'Temperley London', 1541, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3145, N'CategoryNameAr', NULL, N'تجربة فئة', 1541, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3146, N'CategoryNameEn', NULL, N'category test', 1541, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3147, N'Mark', NULL, N'فالنتينو', 1541, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3148, N'Mark', NULL, N'Valentino', 1541, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3149, N'CategoryNameAr', NULL, N'تجربة فئة', 1542, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3150, N'CategoryNameEn', NULL, N'category test', 1542, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3151, N'Mark', NULL, N'تويتا', 1542, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3152, N'Mark', NULL, N'toyota', 1542, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3153, N'IsRequired', N'False', N'True', 1543, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3154, N'IsRequired', N'False', N'True', 1544, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3155, N'CategoryNameAr', NULL, N'تجربة فئة', 1545, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3156, N'CategoryNameEn', NULL, N'category test', 1545, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3157, N'GroupsField', NULL, N'سطح', 1545, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3158, N'CategoryNameAr', NULL, N'تجربة فئة', 1546, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3159, N'CategoryNameEn', NULL, N'category test', 1546, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3160, N'GroupsField', NULL, N'ضمان', 1546, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3161, N'CategoryNameAr', NULL, N'تجربة فئة', 1547, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3162, N'CategoryNameEn', NULL, N'category test', 1547, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3163, N'GroupsField', NULL, N'طاولات', 1547, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3164, N'CategoryNameAr', NULL, N'تجربة فئة', 1548, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3165, N'CategoryNameEn', NULL, N'category test', 1548, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3166, N'GroupsField', NULL, N'ضيافة', 1548, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3167, N'CategoryNameAr', NULL, N'تجربة فئة', 1549, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3168, N'CategoryNameEn', NULL, N'category test', 1549, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3169, N'GroupsField', NULL, N'حلويات', 1549, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3170, N'CategoryNameAr', NULL, N'تجربة فئة', 1550, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3171, N'CategoryNameEn', NULL, N'category test', 1550, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3172, N'GroupsField', NULL, N'مسؤؤال آمن', 1550, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3173, N'CategoryNameAr', NULL, N'تجربة فئة', 1551, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3174, N'CategoryNameEn', NULL, N'category test', 1551, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3175, N'CategoryNameAr', NULL, N'تجربة فئة', 1552, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3176, N'CategoryNameEn', NULL, N'category test', 1552, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3177, N'GroupsField', NULL, N'فى منزل', 1552, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3178, N'CategoryNameAr', NULL, N'مركبات', 1553, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3179, N'CategoryNameEn', NULL, N'Vehicles', 1553, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3180, N'CategoryNameAr', NULL, N'مركبات', 1554, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3181, N'CategoryNameEn', NULL, N'Vehicles', 1554, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3182, N'CategoryNameAr', NULL, N'مركبات', 1554, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3183, N'CategoryNameEn', NULL, N'Vehicles', 1554, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3184, N'CategoryNameAr', NULL, N'مركبات', 1555, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3185, N'CategoryNameEn', NULL, N'Vehicles', 1555, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3186, N'CategoryNameAr', NULL, N'مركبات', 1555, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3187, N'CategoryNameEn', NULL, N'Vehicles', 1555, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3188, N'CategoryNameAr', NULL, N'مركبات', 1555, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3189, N'CategoryNameEn', NULL, N'Vehicles', 1555, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3190, N'CategoryNameAr', NULL, N'مركبات', 1556, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3191, N'CategoryNameEn', NULL, N'Vehicles', 1556, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3192, N'InputNameAr', NULL, N'عدد المقاعد', 1556, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3193, N'InputNameEn', NULL, N'Seats Count', 1556, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3194, N'CategoryNameAr', NULL, N'مركبات', 1557, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3195, N'CategoryNameEn', NULL, N'Vehicles', 1557, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3196, N'InputNameAr', NULL, N'عدد المقاعد', 1557, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3197, N'InputNameEn', NULL, N'Seats Count', 1557, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3198, N'CategoryNameAr', NULL, N'مركبات', 1557, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3199, N'CategoryNameEn', NULL, N'Vehicles', 1557, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3200, N'InputNameAr', NULL, N'الموديل', 1557, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3201, N'InputNameEn', NULL, N'Model', 1557, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3202, N'CategoryNameAr', NULL, N'مركبات', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3203, N'CategoryNameEn', NULL, N'Vehicles', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3204, N'InputNameAr', NULL, N'عدد المقاعد', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3205, N'InputNameEn', NULL, N'Seats Count', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3206, N'CategoryNameAr', NULL, N'مركبات', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3207, N'CategoryNameEn', NULL, N'Vehicles', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3208, N'InputNameAr', NULL, N'الموديل', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3209, N'InputNameEn', NULL, N'Model', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3210, N'CategoryNameAr', NULL, N'مركبات', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3211, N'CategoryNameEn', NULL, N'Vehicles', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3212, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1558, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3213, N'InputNameEn', NULL, N'Bags Big Count', 1558, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3214, N'CategoryNameAr', NULL, N'مركبات', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3215, N'CategoryNameEn', NULL, N'Vehicles', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3216, N'InputNameAr', NULL, N'عدد المقاعد', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3217, N'InputNameEn', NULL, N'Seats Count', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3218, N'CategoryNameAr', NULL, N'مركبات', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3219, N'CategoryNameEn', NULL, N'Vehicles', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3220, N'InputNameAr', NULL, N'الموديل', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3221, N'InputNameEn', NULL, N'Model', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3222, N'CategoryNameAr', NULL, N'مركبات', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3223, N'CategoryNameEn', NULL, N'Vehicles', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3224, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3225, N'InputNameEn', NULL, N'Bags Big Count', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3226, N'CategoryNameAr', NULL, N'مركبات', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3227, N'CategoryNameEn', NULL, N'Vehicles', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3228, N'InputNameAr', NULL, N'مبلغ التامين', 1559, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3229, N'InputNameEn', NULL, N'Amount Of Insurance', 1559, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3230, N'CategoryNameAr', NULL, N'مركبات', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3231, N'CategoryNameEn', NULL, N'Vehicles', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3232, N'InputNameAr', NULL, N'عدد المقاعد', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3233, N'InputNameEn', NULL, N'Seats Count', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3234, N'CategoryNameAr', NULL, N'مركبات', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3235, N'CategoryNameEn', NULL, N'Vehicles', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3236, N'InputNameAr', NULL, N'الموديل', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3237, N'InputNameEn', NULL, N'Model', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3238, N'CategoryNameAr', NULL, N'مركبات', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3239, N'CategoryNameEn', NULL, N'Vehicles', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3240, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3241, N'InputNameEn', NULL, N'Bags Big Count', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3242, N'CategoryNameAr', NULL, N'مركبات', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3243, N'CategoryNameEn', NULL, N'Vehicles', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3244, N'InputNameAr', NULL, N'مبلغ التامين', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3245, N'InputNameEn', NULL, N'Amount Of Insurance', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3246, N'CategoryNameAr', NULL, N'مركبات', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3247, N'CategoryNameEn', NULL, N'Vehicles', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3248, N'InputNameAr', NULL, N'اللون', 1560, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3249, N'InputNameEn', NULL, N'Color', 1560, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3250, N'SubCategoryNameAr', NULL, N'مركبات', 1561, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3251, N'SubCategoryNameEn', NULL, N'Vehicles', 1561, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3252, N'GroupsField', NULL, N'يدوى', 1561, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3253, N'SubCategoryNameAr', NULL, N'مركبات', 1562, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3254, N'SubCategoryNameEn', NULL, N'Vehicles', 1562, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3255, N'GroupsField', NULL, N'اوتو ماتيك', 1562, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3256, N'SubCategoryNameAr', NULL, N'مركبات', 1563, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3257, N'SubCategoryNameEn', NULL, N'Vehicles', 1563, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3258, N'GroupsField', NULL, N'مكيف', 1563, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3259, N'SubCategoryNameAr', NULL, N'مركبات', 1564, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3260, N'SubCategoryNameEn', NULL, N'Vehicles', 1564, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3261, N'GroupsField', NULL, N'سماعات', 1564, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3262, N'CategoryNameAr', NULL, N'مركبات', 1565, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3263, N'CategoryNameEn', NULL, N'Vehicles', 1565, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3264, N'GroupsField', NULL, N'آنارة', 1565, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3265, N'CategoryNameAr', NULL, N'مركبات', 1566, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3266, N'CategoryNameEn', NULL, N'Vehicles', 1566, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3267, N'GroupsField', NULL, N'آنارة', 1566, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3268, N'CategoryNameAr', NULL, N'مركبات', 1566, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3269, N'CategoryNameEn', NULL, N'Vehicles', 1566, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3270, N'GroupsField', NULL, N'عوائل', 1566, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3271, N'Title', NULL, N'تجربة سيارة 2', 1567, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3272, N'Description', NULL, N'وصف ', 1567, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3273, N'Price', NULL, N'550', 1567, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3274, N'NameAr', NULL, N'شقة', 1568, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3275, N'NameEn', NULL, N'Apartment', 1568, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3276, N'CategoryNameAr', NULL, N'عقارات', 1572, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3277, N'CategoryNameEn', NULL, N'Real estate', 1572, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3278, N'CategoryNameAr', NULL, N'عقارات', 1573, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3279, N'CategoryNameEn', NULL, N'Real estate', 1573, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3280, N'CategoryNameAr', NULL, N'عقارات', 1573, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3281, N'CategoryNameEn', NULL, N'Real estate', 1573, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3282, N'CategoryNameAr', NULL, N'عقارات', 1574, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3283, N'CategoryNameEn', NULL, N'Real estate', 1574, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3284, N'CategoryNameAr', NULL, N'عقارات', 1574, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3285, N'CategoryNameEn', NULL, N'Real estate', 1574, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3286, N'CategoryNameAr', NULL, N'عقارات', 1574, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3287, N'CategoryNameEn', NULL, N'Real estate', 1574, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3288, N'CategoryNameAr', NULL, N'عقارات', 1575, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3289, N'CategoryNameEn', NULL, N'Real estate', 1575, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3290, N'CategoryNameAr', NULL, N'عقارات', 1576, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3291, N'CategoryNameEn', NULL, N'Real estate', 1576, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3292, N'CategoryNameAr', NULL, N'عقارات', 1576, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3293, N'CategoryNameEn', NULL, N'Real estate', 1576, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3294, N'CategoryNameAr', NULL, N'عقارات', 1577, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3295, N'CategoryNameEn', NULL, N'Real estate', 1577, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3296, N'CategoryNameAr', NULL, N'عقارات', 1577, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3297, N'CategoryNameEn', NULL, N'Real estate', 1577, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3298, N'CategoryNameAr', NULL, N'عقارات', 1577, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3299, N'CategoryNameEn', NULL, N'Real estate', 1577, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3300, N'CategoryNameAr', NULL, N'عقارات', 1578, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3301, N'CategoryNameEn', NULL, N'Real estate', 1578, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3302, N'Material', NULL, N'حرير', 1578, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3303, N'Material', NULL, N'Silk', 1578, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3304, N'CategoryNameAr', NULL, N'عقارات', 1579, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3305, N'CategoryNameEn', NULL, N'Real estate', 1579, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3306, N'Material', NULL, N'حرير', 1579, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3307, N'Material', NULL, N'Silk', 1579, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3308, N'CategoryNameAr', NULL, N'عقارات', 1579, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3309, N'CategoryNameEn', NULL, N'Real estate', 1579, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3310, N'Material', NULL, N'ستان', 1579, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3311, N'Material', NULL, N'Stan', 1579, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3312, N'CategoryNameAr', NULL, N'عقارات', 1580, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3313, N'CategoryNameEn', NULL, N'Real estate', 1580, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3314, N'Mark', NULL, N'لانسر', 1580, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3315, N'Mark', NULL, N'lancer', 1580, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3316, N'CategoryNameAr', NULL, N'عقارات', 1581, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3317, N'CategoryNameEn', NULL, N'Real estate', 1581, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3318, N'Mark', NULL, N'لانسر', 1581, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3319, N'Mark', NULL, N'lancer', 1581, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3320, N'CategoryNameAr', NULL, N'عقارات', 1581, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3321, N'CategoryNameEn', NULL, N'Real estate', 1581, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3322, N'Mark', NULL, N'فالنتينو', 1581, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3323, N'Mark', NULL, N'Valentino', 1581, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3324, N'CategoryNameAr', NULL, N'عقارات', 1582, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3325, N'CategoryNameEn', NULL, N'Real estate', 1582, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3326, N'Mark', NULL, N'لانسر', 1582, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3327, N'Mark', NULL, N'lancer', 1582, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3328, N'CategoryNameAr', NULL, N'عقارات', 1583, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3329, N'CategoryNameEn', NULL, N'Real estate', 1583, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3330, N'Mark', NULL, N'لانسر', 1583, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3331, N'Mark', NULL, N'lancer', 1583, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3332, N'CategoryNameAr', NULL, N'عقارات', 1583, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3333, N'CategoryNameEn', NULL, N'Real estate', 1583, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3334, N'Mark', NULL, N'مرسيدس', 1583, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3335, N'Mark', NULL, N'Mercedes', 1583, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3336, N'CategoryNameAr', NULL, N'عقارات', 1584, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3337, N'CategoryNameEn', NULL, N'Real estate', 1584, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3338, N'Material', NULL, N'بلستر', 1584, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3339, N'Material', NULL, N'Polyester', 1584, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3340, N'CategoryNameAr', NULL, N'عقارات', 1585, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3341, N'CategoryNameEn', NULL, N'Real estate', 1585, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3342, N'Material', NULL, N'بلستر', 1585, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3343, N'Material', NULL, N'Polyester', 1585, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3344, N'CategoryNameAr', NULL, N'عقارات', 1585, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3345, N'CategoryNameEn', NULL, N'Real estate', 1585, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3346, N'Material', NULL, N'ستان', 1585, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3347, N'Material', NULL, N'Stan', 1585, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3348, N'CategoryNameAr', NULL, N'عقارات', 1586, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3349, N'CategoryNameEn', NULL, N'Real estate', 1586, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3350, N'Material', NULL, N'حرير', 1586, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3351, N'Material', NULL, N'Silk', 1586, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3352, N'CategoryNameAr', NULL, N'عقارات', 1587, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3353, N'CategoryNameEn', NULL, N'Real estate', 1587, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3354, N'InputNameAr', NULL, N'عدد الغرف', 1587, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3355, N'InputNameEn', NULL, N'Rooms Count', 1587, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3356, N'CategoryNameAr', NULL, N'عقارات', 1588, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3357, N'CategoryNameEn', NULL, N'Real estate', 1588, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3358, N'InputNameAr', NULL, N'عدد الغرف', 1588, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3359, N'InputNameEn', NULL, N'Rooms Count', 1588, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3360, N'CategoryNameAr', NULL, N'عقارات', 1588, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3361, N'CategoryNameEn', NULL, N'Real estate', 1588, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3362, N'InputNameAr', NULL, N'عدد المقاعد', 1588, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3363, N'InputNameEn', NULL, N'Seats Count', 1588, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3364, N'CategoryNameAr', NULL, N'عقارات', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3365, N'CategoryNameEn', NULL, N'Real estate', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3366, N'InputNameAr', NULL, N'عدد الغرف', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3367, N'InputNameEn', NULL, N'Rooms Count', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3368, N'CategoryNameAr', NULL, N'عقارات', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3369, N'CategoryNameEn', NULL, N'Real estate', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3370, N'InputNameAr', NULL, N'عدد المقاعد', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3371, N'InputNameEn', NULL, N'Seats Count', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3372, N'CategoryNameAr', NULL, N'عقارات', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3373, N'CategoryNameEn', NULL, N'Real estate', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3374, N'InputNameAr', NULL, N'عدد دورات المياة', 1589, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3375, N'InputNameEn', NULL, N'Toilets Count', 1589, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3376, N'CategoryNameAr', NULL, N'عقارات', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3377, N'CategoryNameEn', NULL, N'Real estate', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3378, N'InputNameAr', NULL, N'عدد الغرف', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3379, N'InputNameEn', NULL, N'Rooms Count', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3380, N'CategoryNameAr', NULL, N'عقارات', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3381, N'CategoryNameEn', NULL, N'Real estate', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3382, N'InputNameAr', NULL, N'عدد المقاعد', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3383, N'InputNameEn', NULL, N'Seats Count', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3384, N'CategoryNameAr', NULL, N'عقارات', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3385, N'CategoryNameEn', NULL, N'Real estate', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3386, N'InputNameAr', NULL, N'عدد دورات المياة', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3387, N'InputNameEn', NULL, N'Toilets Count', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3388, N'CategoryNameAr', NULL, N'عقارات', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3389, N'CategoryNameEn', NULL, N'Real estate', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3390, N'InputNameAr', NULL, N'رقم الطابق', 1590, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3391, N'InputNameEn', NULL, N'Floor Number', 1590, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3392, N'CategoryNameAr', NULL, N'عقارات', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3393, N'CategoryNameEn', NULL, N'Real estate', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3394, N'InputNameAr', NULL, N'عدد الغرف', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3395, N'InputNameEn', NULL, N'Rooms Count', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3396, N'CategoryNameAr', NULL, N'عقارات', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3397, N'CategoryNameEn', NULL, N'Real estate', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3398, N'InputNameAr', NULL, N'عدد المقاعد', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3399, N'InputNameEn', NULL, N'Seats Count', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3400, N'CategoryNameAr', NULL, N'عقارات', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3401, N'CategoryNameEn', NULL, N'Real estate', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3402, N'InputNameAr', NULL, N'عدد دورات المياة', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3403, N'InputNameEn', NULL, N'Toilets Count', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3404, N'CategoryNameAr', NULL, N'عقارات', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3405, N'CategoryNameEn', NULL, N'Real estate', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3406, N'InputNameAr', NULL, N'رقم الطابق', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3407, N'InputNameEn', NULL, N'Floor Number', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3408, N'CategoryNameAr', NULL, N'عقارات', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3409, N'CategoryNameEn', NULL, N'Real estate', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3410, N'InputNameAr', NULL, N'سعر المتر', 1591, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3411, N'InputNameEn', NULL, N'Price PerMeter', 1591, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3412, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3413, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3414, N'InputNameAr', NULL, N'عدد الغرف', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3415, N'InputNameEn', NULL, N'Rooms Count', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3416, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3417, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3418, N'InputNameAr', NULL, N'عدد المقاعد', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3419, N'InputNameEn', NULL, N'Seats Count', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3420, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3421, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3422, N'InputNameAr', NULL, N'عدد دورات المياة', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3423, N'InputNameEn', NULL, N'Toilets Count', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3424, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3425, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3426, N'InputNameAr', NULL, N'رقم الطابق', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3427, N'InputNameEn', NULL, N'Floor Number', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3428, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3429, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3430, N'InputNameAr', NULL, N'سعر المتر', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3431, N'InputNameEn', NULL, N'Price PerMeter', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3432, N'CategoryNameAr', NULL, N'عقارات', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3433, N'CategoryNameEn', NULL, N'Real estate', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3434, N'InputNameAr', NULL, N'عدد الطوابق', 1592, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3435, N'InputNameEn', NULL, N'Apartment Count', 1592, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3436, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3437, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3438, N'InputNameAr', NULL, N'عدد الغرف', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3439, N'InputNameEn', NULL, N'Rooms Count', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3440, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3441, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3442, N'InputNameAr', NULL, N'عدد المقاعد', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3443, N'InputNameEn', NULL, N'Seats Count', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3444, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3445, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3446, N'InputNameAr', NULL, N'عدد دورات المياة', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3447, N'InputNameEn', NULL, N'Toilets Count', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3448, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3449, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3450, N'InputNameAr', NULL, N'رقم الطابق', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3451, N'InputNameEn', NULL, N'Floor Number', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3452, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3453, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3454, N'InputNameAr', NULL, N'سعر المتر', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3455, N'InputNameEn', NULL, N'Price PerMeter', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3456, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3457, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3458, N'InputNameAr', NULL, N'عدد الطوابق', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3459, N'InputNameEn', NULL, N'Apartment Count', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3460, N'CategoryNameAr', NULL, N'عقارات', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3461, N'CategoryNameEn', NULL, N'Real estate', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3462, N'InputNameAr', NULL, N'عدد المصاعد', 1593, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3463, N'InputNameEn', NULL, N'Elevator Counta', 1593, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3464, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3465, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3466, N'InputNameAr', NULL, N'عدد الغرف', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3467, N'InputNameEn', NULL, N'Rooms Count', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3468, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3469, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3470, N'InputNameAr', NULL, N'عدد المقاعد', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3471, N'InputNameEn', NULL, N'Seats Count', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3472, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3473, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3474, N'InputNameAr', NULL, N'عدد دورات المياة', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3475, N'InputNameEn', NULL, N'Toilets Count', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3476, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3477, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3478, N'InputNameAr', NULL, N'رقم الطابق', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3479, N'InputNameEn', NULL, N'Floor Number', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3480, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3481, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3482, N'InputNameAr', NULL, N'سعر المتر', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3483, N'InputNameEn', NULL, N'Price PerMeter', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3484, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3485, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3486, N'InputNameAr', NULL, N'عدد الطوابق', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3487, N'InputNameEn', NULL, N'Apartment Count', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3488, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3489, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3490, N'InputNameAr', NULL, N'عدد المصاعد', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3491, N'InputNameEn', NULL, N'Elevator Counta', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3492, N'CategoryNameAr', NULL, N'عقارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3493, N'CategoryNameEn', NULL, N'Real estate', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3494, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1594, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3495, N'InputNameEn', NULL, N'Parking Count', 1594, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3496, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3497, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3498, N'InputNameAr', NULL, N'عدد الغرف', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3499, N'InputNameEn', NULL, N'Rooms Count', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3500, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3501, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3502, N'InputNameAr', NULL, N'عدد المقاعد', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3503, N'InputNameEn', NULL, N'Seats Count', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3504, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3505, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3506, N'InputNameAr', NULL, N'عدد دورات المياة', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3507, N'InputNameEn', NULL, N'Toilets Count', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3508, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3509, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3510, N'InputNameAr', NULL, N'رقم الطابق', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3511, N'InputNameEn', NULL, N'Floor Number', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3512, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3513, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3514, N'InputNameAr', NULL, N'سعر المتر', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3515, N'InputNameEn', NULL, N'Price PerMeter', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3516, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3517, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3518, N'InputNameAr', NULL, N'عدد الطوابق', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3519, N'InputNameEn', NULL, N'Apartment Count', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3520, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3521, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3522, N'InputNameAr', NULL, N'عدد المصاعد', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3523, N'InputNameEn', NULL, N'Elevator Counta', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3524, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3525, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3526, N'InputNameAr', NULL, N'عدد مواقف السيارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3527, N'InputNameEn', NULL, N'Parking Count', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3528, N'CategoryNameAr', NULL, N'عقارات', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3529, N'CategoryNameEn', NULL, N'Real estate', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3530, N'InputNameAr', NULL, N'مبلغ التامين', 1595, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3531, N'InputNameEn', NULL, N'Amount Of Insurance', 1595, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3532, N'CategoryNameAr', NULL, N'عقارات', 1596, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3533, N'CategoryNameEn', NULL, N'Real estate', 1596, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3534, N'InputNameAr', NULL, N'رقم الطابق', 1596, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3535, N'InputNameEn', NULL, N'Floor Number', 1596, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3536, N'CategoryNameAr', NULL, N'عقارات', 1597, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3537, N'CategoryNameEn', NULL, N'Real estate', 1597, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3538, N'InputNameAr', NULL, N'رقم الطابق', 1597, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3539, N'InputNameEn', NULL, N'Floor Number', 1597, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3540, N'CategoryNameAr', NULL, N'عقارات', 1597, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3541, N'CategoryNameEn', NULL, N'Real estate', 1597, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3542, N'InputNameAr', NULL, N'الموديل', 1597, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3543, N'InputNameEn', NULL, N'Model', 1597, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3544, N'CategoryNameAr', NULL, N'عقارات', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3545, N'CategoryNameEn', NULL, N'Real estate', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3546, N'InputNameAr', NULL, N'رقم الطابق', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3547, N'InputNameEn', NULL, N'Floor Number', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3548, N'CategoryNameAr', NULL, N'عقارات', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3549, N'CategoryNameEn', NULL, N'Real estate', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3550, N'InputNameAr', NULL, N'الموديل', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3551, N'InputNameEn', NULL, N'Model', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3552, N'CategoryNameAr', NULL, N'عقارات', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3553, N'CategoryNameEn', NULL, N'Real estate', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3554, N'InputNameAr', NULL, N'اللون', 1598, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3555, N'InputNameEn', NULL, N'Color', 1598, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3556, N'CategoryNameAr', NULL, N'عقارات', 1599, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3557, N'CategoryNameEn', NULL, N'Real estate', 1599, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3558, N'GroupsField', NULL, N'فى منزل', 1599, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3559, N'CategoryNameAr', NULL, N'عقارات', 1600, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3560, N'CategoryNameEn', NULL, N'Real estate', 1600, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3561, N'GroupsField', NULL, N'فى منزل', 1600, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3562, N'CategoryNameAr', NULL, N'عقارات', 1600, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3563, N'CategoryNameEn', NULL, N'Real estate', 1600, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3564, N'GroupsField', NULL, N'عوائل', 1600, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3565, N'CategoryNameAr', NULL, N'عقارات', 1601, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3566, N'CategoryNameEn', NULL, N'Real estate', 1601, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3567, N'GroupsField', NULL, N'سطح', 1601, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3568, N'CategoryNameAr', NULL, N'عقارات', 1602, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3569, N'CategoryNameEn', NULL, N'Real estate', 1602, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3570, N'GroupsField', NULL, N'ضمان', 1602, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3571, N'CategoryNameAr', NULL, N'عقارات', 1603, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3572, N'CategoryNameEn', NULL, N'Real estate', 1603, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3573, N'GroupsField', NULL, N'كراسى', 1603, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3574, N'CategoryNameAr', NULL, N'عقارات', 1604, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3575, N'CategoryNameEn', NULL, N'Real estate', 1604, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3576, N'GroupsField', NULL, N'طاولات', 1604, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3577, N'CategoryNameAr', NULL, N'عقارات', 1605, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3578, N'CategoryNameEn', NULL, N'Real estate', 1605, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3579, N'GroupsField', NULL, N'مسؤؤال آمن', 1605, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3580, N'SubCategoryNameAr', NULL, N'عقارات', 1606, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3581, N'SubCategoryNameEn', NULL, N'Real estate', 1606, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3582, N'GroupsField', NULL, N'سطح', 1606, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3583, N'SubCategoryNameAr', NULL, N'عقارات', 1607, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3584, N'SubCategoryNameEn', NULL, N'Real estate', 1607, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3585, N'GroupsField', NULL, N'كراسى', 1607, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3586, N'CategoryNameAr', NULL, N'عقارات', 1608, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3587, N'CategoryNameEn', NULL, N'Real estate', 1608, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3588, N'GroupsField', NULL, N'مسجد', 1608, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3589, N'CategoryNameAr', NULL, N'عقارات', 1609, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3590, N'CategoryNameEn', NULL, N'Real estate', 1609, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3591, N'GroupsField', NULL, N'مصعد', 1609, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3592, N'CategoryNameAr', NULL, N'عقارات', 1610, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3593, N'CategoryNameEn', NULL, N'Real estate', 1610, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3594, N'GroupsField', NULL, N'صحون', 1610, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3595, N'CategoryNameAr', NULL, N'عقارات', 1611, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3596, N'CategoryNameEn', NULL, N'Real estate', 1611, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3597, N'GroupsField', NULL, N'فناجين', 1611, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3598, N'CategoryNameAr', NULL, N'عقارات', 1612, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3599, N'CategoryNameEn', NULL, N'Real estate', 1612, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3600, N'GroupsField', NULL, N'سجاد', 1612, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3601, N'NameAr', NULL, N'اتوبيسات', 1613, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3602, N'NameEn', NULL, N'bus', 1613, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3603, N'CategoryNameAr', NULL, N'مركبات', 1614, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3604, N'CategoryNameEn', NULL, N'Vehicles', 1614, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3605, N'CategoryNameAr', NULL, N'مركبات', 1615, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3606, N'CategoryNameEn', NULL, N'Vehicles', 1615, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3607, N'CategoryNameAr', NULL, N'مركبات', 1615, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3608, N'CategoryNameEn', NULL, N'Vehicles', 1615, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3609, N'CategoryNameAr', NULL, N'مركبات', 1616, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3610, N'CategoryNameEn', NULL, N'Vehicles', 1616, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3611, N'CategoryNameAr', NULL, N'مركبات', 1616, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3612, N'CategoryNameEn', NULL, N'Vehicles', 1616, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3613, N'CategoryNameAr', NULL, N'مركبات', 1616, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3614, N'CategoryNameEn', NULL, N'Vehicles', 1616, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3615, N'IsRequired', N'False', N'True', 1617, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3616, N'IsRequired', N'False', N'True', 1618, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3617, N'IsRequired', N'False', N'True', 1619, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3618, N'CategoryNameAr', NULL, N'مركبات', 1620, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3619, N'CategoryNameEn', NULL, N'Vehicles', 1620, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3620, N'Mark', NULL, N'لانسر', 1620, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3621, N'Mark', NULL, N'lancer', 1620, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3622, N'CategoryNameAr', NULL, N'مركبات', 1621, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3623, N'CategoryNameEn', NULL, N'Vehicles', 1621, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3624, N'Mark', NULL, N'لانسر', 1621, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3625, N'Mark', NULL, N'lancer', 1621, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3626, N'CategoryNameAr', NULL, N'مركبات', 1621, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3627, N'CategoryNameEn', NULL, N'Vehicles', 1621, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3628, N'Mark', NULL, N'مرسيدس', 1621, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3629, N'Mark', NULL, N'Mercedes', 1621, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3630, N'CategoryNameAr', NULL, N'مركبات', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3631, N'CategoryNameEn', NULL, N'Vehicles', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3632, N'Mark', NULL, N'لانسر', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3633, N'Mark', NULL, N'lancer', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3634, N'CategoryNameAr', NULL, N'مركبات', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3635, N'CategoryNameEn', NULL, N'Vehicles', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3636, N'Mark', NULL, N'مرسيدس', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3637, N'Mark', NULL, N'Mercedes', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3638, N'CategoryNameAr', NULL, N'مركبات', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3639, N'CategoryNameEn', NULL, N'Vehicles', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3640, N'Mark', NULL, N'تويتا', 1622, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3641, N'Mark', NULL, N'toyota', 1622, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3642, N'CategoryNameAr', NULL, N'مركبات', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3643, N'CategoryNameEn', NULL, N'Vehicles', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3644, N'Mark', NULL, N'لانسر', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3645, N'Mark', NULL, N'lancer', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3646, N'CategoryNameAr', NULL, N'مركبات', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3647, N'CategoryNameEn', NULL, N'Vehicles', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3648, N'Mark', NULL, N'مرسيدس', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3649, N'Mark', NULL, N'Mercedes', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3650, N'CategoryNameAr', NULL, N'مركبات', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3651, N'CategoryNameEn', NULL, N'Vehicles', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3652, N'Mark', NULL, N'تويتا', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3653, N'Mark', NULL, N'toyota', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3654, N'CategoryNameAr', NULL, N'مركبات', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3655, N'CategoryNameEn', NULL, N'Vehicles', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3656, N'Mark', NULL, N'هوندا', 1623, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3657, N'Mark', NULL, N'honda', 1623, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3658, N'CategoryNameAr', NULL, N'مركبات', 1624, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3659, N'CategoryNameEn', NULL, N'Vehicles', 1624, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3660, N'InputNameAr', NULL, N'عدد المقاعد', 1624, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3661, N'InputNameEn', NULL, N'Seats Count', 1624, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3662, N'CategoryNameAr', NULL, N'مركبات', 1625, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3663, N'CategoryNameEn', NULL, N'Vehicles', 1625, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3664, N'InputNameAr', NULL, N'عدد المقاعد', 1625, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3665, N'InputNameEn', NULL, N'Seats Count', 1625, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3666, N'CategoryNameAr', NULL, N'مركبات', 1625, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3667, N'CategoryNameEn', NULL, N'Vehicles', 1625, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3668, N'InputNameAr', NULL, N'الموديل', 1625, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3669, N'InputNameEn', NULL, N'Model', 1625, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3670, N'CategoryNameAr', NULL, N'مركبات', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3671, N'CategoryNameEn', NULL, N'Vehicles', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3672, N'InputNameAr', NULL, N'عدد المقاعد', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3673, N'InputNameEn', NULL, N'Seats Count', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3674, N'CategoryNameAr', NULL, N'مركبات', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3675, N'CategoryNameEn', NULL, N'Vehicles', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3676, N'InputNameAr', NULL, N'الموديل', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3677, N'InputNameEn', NULL, N'Model', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3678, N'CategoryNameAr', NULL, N'مركبات', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3679, N'CategoryNameEn', NULL, N'Vehicles', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3680, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1626, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3681, N'InputNameEn', NULL, N'Bags Small Count', 1626, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3682, N'CategoryNameAr', NULL, N'مركبات', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3683, N'CategoryNameEn', NULL, N'Vehicles', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3684, N'InputNameAr', NULL, N'عدد المقاعد', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3685, N'InputNameEn', NULL, N'Seats Count', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3686, N'CategoryNameAr', NULL, N'مركبات', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3687, N'CategoryNameEn', NULL, N'Vehicles', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3688, N'InputNameAr', NULL, N'الموديل', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3689, N'InputNameEn', NULL, N'Model', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3690, N'CategoryNameAr', NULL, N'مركبات', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3691, N'CategoryNameEn', NULL, N'Vehicles', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3692, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3693, N'InputNameEn', NULL, N'Bags Small Count', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3694, N'CategoryNameAr', NULL, N'مركبات', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3695, N'CategoryNameEn', NULL, N'Vehicles', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3696, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1627, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3697, N'InputNameEn', NULL, N'Bags Big Count', 1627, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3698, N'CategoryNameAr', NULL, N'مركبات', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3699, N'CategoryNameEn', NULL, N'Vehicles', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3700, N'InputNameAr', NULL, N'عدد المقاعد', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3701, N'InputNameEn', NULL, N'Seats Count', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3702, N'CategoryNameAr', NULL, N'مركبات', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3703, N'CategoryNameEn', NULL, N'Vehicles', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3704, N'InputNameAr', NULL, N'الموديل', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3705, N'InputNameEn', NULL, N'Model', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3706, N'CategoryNameAr', NULL, N'مركبات', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3707, N'CategoryNameEn', NULL, N'Vehicles', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3708, N'InputNameAr', NULL, N'عدد الحقائب الصغيرة', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3709, N'InputNameEn', NULL, N'Bags Small Count', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3710, N'CategoryNameAr', NULL, N'مركبات', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3711, N'CategoryNameEn', NULL, N'Vehicles', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3712, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3713, N'InputNameEn', NULL, N'Bags Big Count', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3714, N'CategoryNameAr', NULL, N'مركبات', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3715, N'CategoryNameEn', NULL, N'Vehicles', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3716, N'InputNameAr', NULL, N'اللون', 1628, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3717, N'InputNameEn', NULL, N'Color', 1628, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3718, N'SubCategoryNameAr', NULL, N'مركبات', 1629, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3719, N'SubCategoryNameEn', NULL, N'Vehicles', 1629, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3720, N'GroupsField', NULL, N'عوائل', 1629, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3721, N'SubCategoryNameAr', NULL, N'مركبات', 1630, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3722, N'SubCategoryNameEn', NULL, N'Vehicles', 1630, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3723, N'GroupsField', NULL, N'عزاب', 1630, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3724, N'SubCategoryNameAr', NULL, N'مركبات', 1631, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3725, N'SubCategoryNameEn', NULL, N'Vehicles', 1631, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3726, N'GroupsField', NULL, N'مكيف', 1631, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3727, N'SubCategoryNameAr', NULL, N'مركبات', 1632, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3728, N'SubCategoryNameEn', NULL, N'Vehicles', 1632, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3729, N'GroupsField', NULL, N'سماعات', 1632, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3730, N'SubCategoryNameAr', NULL, N'مركبات', 1633, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3731, N'SubCategoryNameEn', NULL, N'Vehicles', 1633, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3732, N'GroupsField', NULL, N'يدوى', 1633, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3733, N'SubCategoryNameAr', NULL, N'مركبات', 1634, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3734, N'SubCategoryNameEn', NULL, N'Vehicles', 1634, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3735, N'GroupsField', NULL, N'اوتو ماتيك', 1634, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3736, N'CategoryNameAr', NULL, N'مركبات', 1635, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3737, N'CategoryNameEn', NULL, N'Vehicles', 1635, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3738, N'GroupsField', NULL, N'آنارة', 1635, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3739, N'CategoryNameAr', NULL, N'مركبات', 1636, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3740, N'CategoryNameEn', NULL, N'Vehicles', 1636, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3741, N'GroupsField', NULL, N'آنارة', 1636, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3742, N'CategoryNameAr', NULL, N'مركبات', 1636, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3743, N'CategoryNameEn', NULL, N'Vehicles', 1636, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3744, N'GroupsField', NULL, N'عوائل', 1636, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3745, N'CategoryNameAr', NULL, N'مركبات', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3746, N'CategoryNameEn', NULL, N'Vehicles', 1637, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3747, N'GroupsField', NULL, N'آنارة', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3748, N'CategoryNameAr', NULL, N'مركبات', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3749, N'CategoryNameEn', NULL, N'Vehicles', 1637, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3750, N'GroupsField', NULL, N'عوائل', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3751, N'CategoryNameAr', NULL, N'مركبات', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3752, N'CategoryNameEn', NULL, N'Vehicles', 1637, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3753, N'GroupsField', NULL, N'فى برج', 1637, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3754, N'Title', NULL, N'اتوبيس لنقل الركاب', 1638, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3755, N'Description', NULL, N'اتوبيس لنقل الركاب .. اتوبيس لنقل الركاب .. اتوبيس لنقل الركاب ... اتوبيس لنقل الركاب ... اتوبيس لنقل الركاب', 1638, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3756, N'Price', NULL, N'500', 1638, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3757, N'Title', NULL, N'تجربة 1', 1639, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3758, N'Description', NULL, N'تجربة اضافة اعلان جديد من اجل عرضة', 1639, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3759, N'Price', NULL, N'500', 1639, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3760, N'Title', NULL, N'تجربة 2', 1640, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3761, N'Description', NULL, N'تجربة اضافة اعلان سيارة ', 1640, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3762, N'Price', NULL, N'8000', 1640, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3763, N'Title', NULL, N'تجربة 2', 1641, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3764, N'Description', NULL, N'تجربة اضافة اعلان سيارة ', 1641, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3765, N'Price', NULL, N'8000', 1641, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3766, N'Title', NULL, N'dfdfdf', 1642, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3767, N'Description', NULL, N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', 1642, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3768, N'Price', NULL, N'66', 1642, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3769, N'Title', NULL, N'تجربة 1 ', 1643, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3770, N'Description', NULL, N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', 1643, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3771, N'Price', NULL, N'1000', 1643, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3772, N'Title', NULL, N'تجربة 1 ', 1644, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3773, N'Description', NULL, N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1', 1644, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3774, N'Price', NULL, N'1000', 1644, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3775, N'Title', NULL, N'تجربة 1 ', 1645, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3776, N'Description', NULL, N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ', 1645, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3777, N'Price', NULL, N'2000', 1645, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3778, N'Title', NULL, N'تجربة 1 ', 1646, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3779, N'Description', NULL, N' تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ..  تجربة 1 ', 1646, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3780, N'Price', NULL, N'2000', 1646, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3781, N'IsRequired', N'False', N'True', 1647, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3782, N'IsRequired', N'False', N'True', 1648, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3783, N'Title', NULL, N'تجربة اضافة اضافة اعلان جديد', 1653, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3784, N'Description', NULL, N'تجربة اضافة وصف', 1653, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3785, N'Price', NULL, N'2200', 1653, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3786, N'Title', NULL, N'مرسيدس', 1655, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3787, N'Description', NULL, N'احلى سيارة', 1655, 1, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (3788, N'Price', NULL, N'200', 1655, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[HistoryDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[InputsTypes] ON 
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (1, N'Text', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (2, N'Number', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (3, N'Select', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (4, N'Checkbox', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (5, N'Radio', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (6, N'Date', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (7, N'Time', NULL)
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (8, N'LinkWithTable', N'اى هذا الحقل سوف يربط مع جدول ')
GO
INSERT [dbo].[InputsTypes] ([Id], [ResourcesName], [Notes]) VALUES (9, N'Decimal ', NULL)
GO
SET IDENTITY_INSERT [dbo].[InputsTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 
GO
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (1, N'مطور', N'Developer', 4)
GO
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (4, N'محاسب', N'Account', 35)
GO
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Notes]) VALUES (1, N'')
GO
INSERT [dbo].[Languages] ([Id], [Notes]) VALUES (2, NULL)
GO
INSERT [dbo].[Languages] ([Id], [Notes]) VALUES (3, NULL)
GO
INSERT [dbo].[Languages] ([Id], [Notes]) VALUES (4, NULL)
GO
INSERT [dbo].[Languages] ([Id], [Notes]) VALUES (5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageTypes] ON 
GO
INSERT [dbo].[LanguageTypes] ([Id], [ResourceName], [Code]) VALUES (1, N'Arabic', N'ar')
GO
INSERT [dbo].[LanguageTypes] ([Id], [ResourceName], [Code]) VALUES (2, N'English', N'en')
GO
SET IDENTITY_INSERT [dbo].[LanguageTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageUsing] ON 
GO
INSERT [dbo].[LanguageUsing] ([Id], [IsDefault], [FKLanguageType_Id], [FKLanguage_Id]) VALUES (1, 0, 2, 1)
GO
INSERT [dbo].[LanguageUsing] ([Id], [IsDefault], [FKLanguageType_Id], [FKLanguage_Id]) VALUES (3, 1, 1, 1)
GO
INSERT [dbo].[LanguageUsing] ([Id], [IsDefault], [FKLanguageType_Id], [FKLanguage_Id]) VALUES (4, 1, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[LanguageUsing] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([Id], [Longitude], [Latitude]) VALUES (1, N'1سي', N'545341ي')
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (1, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (2, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (4, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (5, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (6, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (7, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (8, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (9, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (10, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (29, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (30, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (31, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (35, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (36, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (37, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (38, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (39, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (40, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (41, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (42, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (43, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (44, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (45, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (46, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (47, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (48, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (49, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (50, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (60, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (61, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (62, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (63, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (64, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (65, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (66, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (67, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (68, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (69, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (70, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (71, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (72, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (73, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (74, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (75, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (76, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (77, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (78, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (79, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (80, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (81, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (82, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (83, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (84, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (85, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (86, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (87, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (88, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (96, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (97, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (98, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (100, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (101, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (102, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (103, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (105, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (106, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (107, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (124, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (126, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (128, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (177, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (178, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (179, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (180, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (181, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (182, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (183, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (186, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (187, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (193, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (194, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (195, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (196, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (197, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (198, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (199, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (200, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (201, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (202, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (203, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (205, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (208, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (209, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (210, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (211, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (212, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (213, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (214, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (215, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (216, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (217, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (218, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (219, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (221, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (222, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (223, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (224, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (225, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (226, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (227, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (228, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (229, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (230, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (231, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (232, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (233, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (234, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (236, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (237, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (238, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (239, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (240, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (241, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (242, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (243, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (244, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (245, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (246, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (250, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (251, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (255, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (256, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (257, CAST(N'2018-09-30T21:27:07.817' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (258, CAST(N'2018-09-30T21:52:26.060' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (259, CAST(N'2018-09-30T22:04:19.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (261, CAST(N'2018-10-13T06:16:34.190' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (262, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (263, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (264, CAST(N'2018-09-30T21:27:07.817' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (265, CAST(N'2018-09-30T21:52:26.060' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (266, CAST(N'2018-09-30T22:04:19.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (267, CAST(N'2018-10-13T06:16:34.190' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (268, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (269, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (270, CAST(N'2018-09-30T21:27:07.817' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (271, CAST(N'2018-09-30T21:52:26.060' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (272, CAST(N'2018-09-30T22:04:19.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (273, CAST(N'2018-10-13T06:16:34.190' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (274, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (275, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (276, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (278, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (279, CAST(N'2018-10-14T17:38:04.923' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (280, CAST(N'2018-10-14T17:39:11.800' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (281, CAST(N'2018-10-14T17:39:21.760' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (282, CAST(N'2018-10-14T17:39:29.993' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (283, CAST(N'2018-10-14T17:39:37.010' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (284, CAST(N'2018-10-14T17:39:45.203' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (288, CAST(N'2018-10-14T19:45:14.257' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (289, CAST(N'2018-10-14T19:51:15.413' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (290, CAST(N'2018-10-14T19:55:10.940' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (291, CAST(N'2018-10-14T21:30:27.297' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (292, CAST(N'2018-10-14T21:49:11.097' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (293, CAST(N'2018-10-15T19:59:59.550' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (294, CAST(N'2018-10-17T00:17:52.623' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (295, CAST(N'2018-10-17T00:20:14.013' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (296, CAST(N'2018-10-17T00:20:14.050' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (297, CAST(N'2018-10-17T00:20:14.050' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (298, CAST(N'2018-10-17T00:20:28.560' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (299, CAST(N'2018-10-17T00:20:28.613' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (300, CAST(N'2018-10-17T00:20:28.710' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (301, CAST(N'2018-10-17T00:24:03.713' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (302, CAST(N'2018-10-17T00:24:20.263' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (303, CAST(N'2018-10-17T00:24:29.467' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (304, CAST(N'2018-10-17T00:24:38.110' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (305, CAST(N'2018-10-17T18:23:29.313' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (307, CAST(N'2018-10-23T04:35:34.843' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (308, CAST(N'2018-10-25T19:14:22.373' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (309, CAST(N'2018-10-25T19:15:34.490' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (310, CAST(N'2018-10-25T19:15:41.220' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (311, CAST(N'2018-10-25T19:15:46.943' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (312, CAST(N'2018-10-25T19:15:53.407' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (313, CAST(N'2018-10-25T19:15:57.983' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (314, CAST(N'2018-10-25T19:16:04.890' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (315, CAST(N'2018-10-25T21:37:08.870' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (316, CAST(N'2018-10-25T21:37:20.880' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (317, CAST(N'2018-10-25T21:37:21.460' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (318, CAST(N'2018-10-25T21:37:22.253' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (319, CAST(N'2018-10-25T21:37:42.443' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (320, CAST(N'2018-10-25T21:37:43.167' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (321, CAST(N'2018-10-25T21:37:43.820' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (322, CAST(N'2018-10-25T21:37:44.383' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (323, CAST(N'2018-10-25T21:37:45.793' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (324, CAST(N'2018-10-25T21:37:46.720' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (325, CAST(N'2018-10-25T21:38:10.303' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (327, CAST(N'2018-11-17T01:47:34.483' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (329, CAST(N'2018-11-17T02:32:11.180' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (330, CAST(N'2018-11-17T02:32:52.833' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (332, CAST(N'2018-11-17T03:39:01.063' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (333, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (334, CAST(N'2018-11-17T03:57:38.483' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (335, CAST(N'2018-11-17T03:57:38.523' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (336, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (337, CAST(N'2011-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (338, CAST(N'2011-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (339, CAST(N'2011-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (340, CAST(N'2018-11-24T00:04:13.203' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (341, CAST(N'2018-11-24T00:09:17.257' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (342, CAST(N'2018-11-24T00:18:30.263' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (343, CAST(N'2018-11-24T03:00:49.073' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (344, CAST(N'2018-11-24T03:05:03.677' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (345, CAST(N'2018-11-25T11:34:44.307' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (346, CAST(N'2018-11-25T11:36:04.783' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (347, CAST(N'2018-11-25T11:36:39.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (348, CAST(N'2018-11-25T13:37:17.360' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (349, CAST(N'2018-11-25T13:38:18.440' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (350, CAST(N'2018-11-25T13:38:19.293' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (351, CAST(N'2018-11-25T13:38:20.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (352, CAST(N'2018-11-26T01:19:27.130' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (353, CAST(N'2018-11-26T01:19:27.273' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (354, CAST(N'2018-11-26T01:19:27.280' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (355, CAST(N'2018-11-26T01:19:27.293' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (356, CAST(N'2018-11-26T01:19:27.307' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (357, CAST(N'2018-11-26T01:19:27.317' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (358, CAST(N'2018-11-26T01:35:24.830' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (359, CAST(N'2018-11-26T01:35:24.930' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (360, CAST(N'2018-11-26T01:47:44.700' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (361, CAST(N'2018-11-26T01:51:17.810' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (362, CAST(N'2018-11-26T01:56:58.153' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (363, CAST(N'2018-11-26T01:56:58.160' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (364, CAST(N'2018-11-26T01:56:58.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (365, CAST(N'2018-11-26T01:56:58.170' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (366, CAST(N'2018-11-26T01:56:58.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (367, CAST(N'2018-11-26T01:56:58.180' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (368, CAST(N'2018-11-26T01:56:58.190' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (369, CAST(N'2018-11-26T01:58:25.510' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (370, CAST(N'2018-11-26T01:58:25.637' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (371, CAST(N'2018-11-26T01:58:25.643' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (372, CAST(N'2018-11-30T23:01:46.640' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (373, CAST(N'2018-11-30T23:01:47.100' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (374, CAST(N'2018-11-30T23:01:47.110' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (375, CAST(N'2018-11-30T23:01:47.120' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (376, CAST(N'2018-11-30T23:01:47.130' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (377, CAST(N'2018-12-03T11:09:41.690' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (378, CAST(N'2018-12-03T11:09:41.713' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (379, CAST(N'2018-12-03T11:09:41.717' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (380, CAST(N'2018-12-03T11:09:41.720' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (381, CAST(N'2018-12-03T11:09:41.727' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (382, CAST(N'2018-12-03T11:09:41.890' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (383, CAST(N'2018-12-03T11:09:41.910' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (384, CAST(N'2018-12-03T11:09:41.950' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (385, CAST(N'2018-12-03T11:09:41.967' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (386, CAST(N'2018-12-03T11:09:41.990' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (387, CAST(N'2018-12-03T11:09:42.037' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (388, CAST(N'2018-12-03T11:09:42.067' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (389, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (390, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (391, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (392, CAST(N'2018-11-17T03:54:56.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (393, CAST(N'2018-12-05T01:43:55.940' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (394, CAST(N'2018-12-05T01:45:23.850' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (395, CAST(N'2018-12-05T01:45:23.903' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (396, CAST(N'2018-12-05T01:45:23.903' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (397, CAST(N'2018-12-05T01:45:55.130' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (398, CAST(N'2018-12-05T15:25:49.020' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (399, CAST(N'2018-12-05T15:31:12.250' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (400, CAST(N'2018-12-05T15:31:12.340' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (401, CAST(N'2018-12-05T15:31:12.343' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (402, CAST(N'2018-12-05T15:31:12.347' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (403, CAST(N'2018-12-05T15:31:12.353' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (404, CAST(N'2018-12-05T15:31:12.357' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (405, CAST(N'2018-12-05T15:31:12.363' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (406, CAST(N'2018-12-05T15:31:12.370' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (407, CAST(N'2018-12-05T17:18:27.580' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (408, CAST(N'2018-12-05T17:18:27.647' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (409, CAST(N'2018-12-05T17:18:27.650' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (410, CAST(N'2018-12-05T17:18:27.657' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (411, CAST(N'2018-12-05T17:18:27.660' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (412, CAST(N'2018-12-05T17:18:27.667' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (413, CAST(N'2018-12-05T17:18:27.670' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (414, CAST(N'2018-12-05T17:18:27.677' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (415, CAST(N'2018-12-05T17:18:27.680' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (416, CAST(N'2018-12-05T17:18:27.690' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (417, CAST(N'2018-12-05T17:18:27.703' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (418, CAST(N'2018-12-05T17:18:27.717' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (419, CAST(N'2018-12-05T17:18:27.730' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (420, CAST(N'2018-12-05T17:18:27.740' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (421, CAST(N'2018-12-05T17:18:27.757' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (422, CAST(N'2018-12-05T17:18:27.770' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (423, CAST(N'2018-12-05T17:18:27.787' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (424, CAST(N'2018-12-05T17:18:27.803' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (425, CAST(N'2018-12-05T17:18:27.823' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (426, CAST(N'2018-12-05T17:18:27.840' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (427, CAST(N'2018-12-05T17:18:27.853' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (428, CAST(N'2018-12-05T17:18:27.863' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (429, CAST(N'2018-12-05T17:18:27.870' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (430, CAST(N'2018-12-05T17:18:27.877' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (431, CAST(N'2018-12-05T17:18:27.887' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (432, CAST(N'2018-12-05T17:18:27.897' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (433, CAST(N'2018-12-05T17:18:27.907' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (434, CAST(N'2018-12-05T17:18:27.917' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (435, CAST(N'2018-12-05T17:18:27.923' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (436, CAST(N'2018-12-05T17:18:27.940' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (437, CAST(N'2018-12-05T17:18:27.960' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (438, CAST(N'2018-12-05T17:18:27.987' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (439, CAST(N'2018-12-05T17:18:28.010' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (440, CAST(N'2018-12-05T17:18:28.030' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (441, CAST(N'2018-12-05T17:18:28.050' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (442, CAST(N'2018-12-05T17:18:28.073' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (443, CAST(N'2018-12-05T17:18:28.100' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (444, CAST(N'2018-12-05T17:18:28.143' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (445, CAST(N'2018-12-05T17:18:28.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (446, CAST(N'2018-12-05T17:18:28.203' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (447, CAST(N'2018-12-05T17:18:28.237' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (448, CAST(N'2018-12-05T17:18:28.273' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (449, CAST(N'2018-12-05T17:18:28.313' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (450, CAST(N'2018-12-05T17:18:28.343' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (451, CAST(N'2018-12-05T17:18:28.380' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (452, CAST(N'2018-12-05T17:18:28.410' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (453, CAST(N'2018-12-05T17:18:28.447' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (454, CAST(N'2018-12-05T17:18:28.477' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (455, CAST(N'2018-12-05T17:18:28.503' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (456, CAST(N'2018-12-05T17:18:28.537' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (457, CAST(N'2018-12-05T17:18:28.563' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (458, CAST(N'2018-12-05T17:18:28.597' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (459, CAST(N'2018-12-06T13:59:54.467' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (460, CAST(N'2018-12-06T14:00:28.573' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (461, CAST(N'2018-12-06T14:00:28.580' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (462, CAST(N'2018-12-06T14:00:28.583' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (463, CAST(N'2018-12-06T18:41:46.120' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (464, CAST(N'2018-12-06T18:41:57.807' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (465, CAST(N'2018-12-07T20:27:38.487' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (466, CAST(N'2018-12-08T01:48:39.357' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (467, CAST(N'2018-12-11T13:49:36.317' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (469, CAST(N'2018-12-11T14:51:51.813' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (470, CAST(N'2018-12-11T15:05:24.997' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (471, CAST(N'2018-12-11T15:05:25.027' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (472, CAST(N'2018-12-11T15:05:25.040' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (473, CAST(N'2018-12-11T15:05:25.040' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (474, CAST(N'2018-12-11T15:18:11.740' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (475, CAST(N'2018-12-11T15:18:11.770' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (476, CAST(N'2018-12-11T15:18:11.807' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (477, CAST(N'2018-12-11T15:18:11.807' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (479, CAST(N'2018-12-11T16:52:44.563' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (480, CAST(N'2018-12-11T16:52:44.703' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (481, CAST(N'2018-12-11T17:04:19.887' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (482, CAST(N'2018-12-11T18:32:00.170' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (483, CAST(N'2018-12-11T18:32:07.463' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (484, CAST(N'2018-12-11T18:50:43.997' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (485, CAST(N'2018-12-11T18:50:43.997' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (486, CAST(N'2018-12-11T18:50:44.047' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (487, CAST(N'2018-12-11T18:50:44.050' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (488, CAST(N'2018-12-11T18:51:18.043' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (489, CAST(N'2018-12-11T18:58:27.357' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (490, CAST(N'2018-12-11T18:58:27.377' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (491, CAST(N'2018-12-11T18:58:27.380' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (492, CAST(N'2018-12-11T18:58:27.380' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (493, CAST(N'2018-12-11T19:08:18.440' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (494, CAST(N'2018-12-11T19:08:29.700' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (495, CAST(N'2018-12-11T19:08:37.887' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (496, CAST(N'2018-12-14T15:45:51.033' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (497, CAST(N'2018-12-14T15:45:51.113' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (498, CAST(N'2018-12-14T15:45:51.140' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (499, CAST(N'2018-12-14T15:45:51.143' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (518, CAST(N'2018-12-14T17:40:48.717' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (519, CAST(N'2018-12-14T17:40:48.800' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (520, CAST(N'2018-12-14T17:40:48.853' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (521, CAST(N'2018-12-14T17:40:48.897' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (522, CAST(N'2018-12-14T17:40:48.947' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (523, CAST(N'2018-12-14T17:40:48.997' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (524, CAST(N'2018-12-14T17:41:06.980' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (525, CAST(N'2018-12-14T17:41:07.023' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (526, CAST(N'2018-12-14T17:41:15.513' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (527, CAST(N'2018-12-14T17:41:19.480' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (528, CAST(N'2018-12-14T17:41:19.533' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (529, CAST(N'2018-12-17T14:16:26.657' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (530, CAST(N'2018-12-17T14:16:26.663' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (531, CAST(N'2018-12-17T16:19:02.593' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (532, CAST(N'2018-12-17T16:19:02.660' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (533, CAST(N'2018-12-17T16:19:02.707' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (534, CAST(N'2018-12-17T16:19:02.773' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (535, CAST(N'2018-12-17T16:19:02.823' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (536, CAST(N'2018-12-17T16:19:02.880' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (537, CAST(N'2018-12-17T16:19:02.920' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (538, CAST(N'2018-12-17T16:19:25.477' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (539, CAST(N'2018-12-17T16:19:25.553' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (540, CAST(N'2018-12-17T16:19:25.623' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (541, CAST(N'2018-12-19T05:04:54.243' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (542, CAST(N'2018-12-19T05:04:54.337' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (543, CAST(N'2018-12-19T05:04:54.343' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (544, CAST(N'2018-12-19T05:04:54.350' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (545, CAST(N'2018-12-19T05:04:54.357' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (546, CAST(N'2018-12-19T05:04:54.370' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (547, CAST(N'2018-12-19T05:04:54.383' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (548, CAST(N'2018-12-19T05:04:54.390' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (549, CAST(N'2018-12-19T05:04:54.403' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (550, CAST(N'2019-01-08T21:49:24.820' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (551, CAST(N'2019-01-09T01:27:41.457' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (552, CAST(N'2019-01-09T01:27:41.527' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (553, CAST(N'2019-01-09T22:16:56.933' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (554, CAST(N'2019-01-09T22:54:39.287' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (555, CAST(N'2019-01-09T23:02:51.830' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (556, CAST(N'2019-01-09T23:02:51.843' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (557, CAST(N'2019-01-09T23:03:42.760' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (558, CAST(N'2019-01-09T23:06:35.487' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (559, CAST(N'2019-01-09T23:06:35.497' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (560, CAST(N'2019-01-09T23:06:35.507' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (561, CAST(N'2019-01-09T23:06:35.520' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (562, CAST(N'2019-01-09T23:07:06.493' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (563, CAST(N'2019-01-09T23:07:06.507' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (564, CAST(N'2019-01-09T23:07:24.373' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (565, CAST(N'2019-01-09T23:07:24.380' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (566, CAST(N'2019-01-09T23:24:51.060' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (567, CAST(N'2019-01-09T23:25:10.000' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (568, CAST(N'2019-01-09T23:27:37.097' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (569, CAST(N'2019-01-09T23:32:53.890' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (570, CAST(N'2019-01-09T23:33:42.363' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (571, CAST(N'2019-01-09T23:33:42.377' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (572, CAST(N'2019-01-09T23:33:42.387' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (573, CAST(N'2019-01-09T23:34:43.317' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (574, CAST(N'2019-01-09T23:34:43.343' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (575, CAST(N'2019-01-09T23:34:43.360' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (576, CAST(N'2019-01-09T23:34:43.367' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (577, CAST(N'2019-01-09T23:34:43.377' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (578, CAST(N'2019-01-09T23:34:43.383' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (579, CAST(N'2019-01-09T23:59:30.897' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (580, CAST(N'2019-01-09T23:59:30.953' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (581, CAST(N'2019-01-10T00:36:21.117' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (582, CAST(N'2019-01-10T00:36:21.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (583, CAST(N'2019-01-10T00:39:25.043' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (584, CAST(N'2019-01-10T00:47:31.280' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (585, CAST(N'2019-01-10T00:47:31.307' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (586, CAST(N'2019-01-10T00:47:31.310' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (587, CAST(N'2019-01-10T00:47:31.317' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (588, CAST(N'2019-01-10T00:47:31.320' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (589, CAST(N'2019-01-10T00:47:31.330' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (590, CAST(N'2019-01-10T01:15:56.080' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (591, CAST(N'2019-01-10T01:22:13.260' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (592, CAST(N'2019-01-10T01:22:13.300' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (593, CAST(N'2019-01-10T01:22:13.307' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (594, CAST(N'2019-01-10T01:23:04.653' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (595, CAST(N'2019-01-10T01:23:04.677' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (596, CAST(N'2019-01-10T01:23:04.710' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (597, CAST(N'2019-01-10T01:23:04.760' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (598, CAST(N'2019-01-10T01:23:04.783' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (599, CAST(N'2019-01-10T01:23:56.877' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (600, CAST(N'2019-01-10T01:23:56.880' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (601, CAST(N'2019-01-10T01:25:21.637' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (602, CAST(N'2019-01-10T01:25:21.647' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (603, CAST(N'2019-01-10T01:25:38.773' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (604, CAST(N'2019-01-10T01:25:38.783' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (605, CAST(N'2019-01-10T01:34:35.490' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (606, CAST(N'2019-01-10T17:21:23.310' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (607, CAST(N'2019-01-10T17:26:23.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (608, CAST(N'2019-01-10T17:26:23.187' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (609, CAST(N'2019-01-10T17:26:23.200' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (610, CAST(N'2019-01-10T17:29:19.573' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (611, CAST(N'2019-01-10T17:29:19.580' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (612, CAST(N'2019-01-10T17:29:19.590' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (613, CAST(N'2019-01-10T17:30:53.580' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (614, CAST(N'2019-01-10T17:30:53.590' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (615, CAST(N'2019-01-10T17:31:07.693' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (616, CAST(N'2019-01-10T17:31:07.700' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (617, CAST(N'2019-01-10T17:31:42.313' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (618, CAST(N'2019-01-10T17:31:42.330' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (619, CAST(N'2019-01-10T17:32:36.953' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (620, CAST(N'2019-01-10T17:32:36.970' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (621, CAST(N'2019-01-10T17:33:07.147' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (622, CAST(N'2019-01-10T17:34:17.453' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (623, CAST(N'2019-01-10T17:34:17.463' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (624, CAST(N'2019-01-10T17:34:17.473' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (625, CAST(N'2019-01-10T17:34:17.487' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (626, CAST(N'2019-01-10T17:34:17.500' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (627, CAST(N'2019-01-10T17:34:17.507' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (628, CAST(N'2019-01-10T17:34:17.517' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (629, CAST(N'2019-01-10T17:34:17.523' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (630, CAST(N'2019-01-10T17:34:17.533' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (631, CAST(N'2019-01-10T17:35:40.623' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (632, CAST(N'2019-01-10T17:35:40.633' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (633, CAST(N'2019-01-10T17:35:40.673' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (634, CAST(N'2019-01-10T17:38:32.393' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (635, CAST(N'2019-01-10T17:38:32.443' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (636, CAST(N'2019-01-10T17:40:26.440' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (637, CAST(N'2019-01-10T17:40:26.447' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (638, CAST(N'2019-01-10T17:40:26.453' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (639, CAST(N'2019-01-10T17:40:26.460' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (640, CAST(N'2019-01-10T17:40:26.470' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (641, CAST(N'2019-01-10T17:41:01.233' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (642, CAST(N'2019-01-10T17:41:01.243' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (643, CAST(N'2019-01-10T18:03:33.530' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (644, CAST(N'2019-01-10T18:03:33.540' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (645, CAST(N'2019-01-10T18:03:33.550' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (646, CAST(N'2019-01-10T18:03:33.563' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (647, CAST(N'2019-01-10T18:03:33.583' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (648, CAST(N'2019-01-10T18:28:37.823' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (649, CAST(N'2019-01-10T18:30:26.040' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (650, CAST(N'2019-01-10T18:30:26.083' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (651, CAST(N'2019-01-10T18:30:26.093' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (652, CAST(N'2019-01-10T18:31:23.430' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (653, CAST(N'2019-01-10T18:31:23.547' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (654, CAST(N'2019-01-10T18:31:23.630' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (655, CAST(N'2019-01-10T18:31:23.683' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (656, CAST(N'2019-01-10T18:32:57.473' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (657, CAST(N'2019-01-10T18:32:57.500' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (658, CAST(N'2019-01-10T18:32:57.540' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (659, CAST(N'2019-01-10T18:32:57.563' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (660, CAST(N'2019-01-10T18:32:57.600' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (661, CAST(N'2019-01-10T18:35:13.147' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (662, CAST(N'2019-01-10T18:35:13.163' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (663, CAST(N'2019-01-10T18:35:13.173' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (664, CAST(N'2019-01-10T18:35:13.207' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (665, CAST(N'2019-01-10T18:35:13.213' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (666, CAST(N'2019-01-10T18:35:13.223' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (667, CAST(N'2019-01-10T18:36:24.147' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (668, CAST(N'2019-01-10T18:36:24.150' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (669, CAST(N'2019-01-10T18:36:24.180' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (670, CAST(N'2019-01-10T18:40:13.837' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (671, CAST(N'2019-01-29T12:50:38.283' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (672, CAST(N'2019-01-29T12:58:43.503' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (673, CAST(N'2019-01-29T12:58:48.133' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (678, CAST(N'2019-01-30T14:48:20.950' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (679, CAST(N'2019-01-30T14:51:34.710' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (680, CAST(N'2019-01-30T14:52:39.823' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (681, CAST(N'2019-01-30T14:53:15.030' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (682, CAST(N'2019-01-30T14:53:21.297' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (683, CAST(N'2019-02-23T03:24:55.980' AS DateTime))
GO
INSERT [dbo].[Logs] ([Id], [CreateDateTime]) VALUES (684, CAST(N'2019-03-01T20:56:43.347' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (2, N'لانسر', N'lancer', 1)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (3, N'مرسيدس', N'Mercedes', 1)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (4, N'تويتا', N'toyota', 1)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (5, N'هوندا', N'honda', 1)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (6, N'تمبرلي لندن', N'Temperley London', 76)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (8, N'xX', N'X00', 78)
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (10, N'فالنتينو', N'Valentino', 80)
GO
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (5, N'بلستر', N'Polyester', 67)
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (6, N'حرير', N'Silk', 68)
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (7, N'ستان', N'Stan', 69)
GO
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (1, 1, N'far fa-hand-point-right', N'Setting')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (2, 3, N'far fa-hand-point-right', N'Users')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (7, 4, N'far fa-hand-point-right', N'TechnicalSupport')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (8, 2, N'far fa-hand-point-right', N'RentalSetting')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (9, 5, N'far fa-hand-point-right', N'Ads')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (10, 6, N'far fa-hand-point-right', N'FieldSettings')
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Months] ON 
GO
INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (2, N'w', N'w', N'w', 1, 1)
GO
INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (3, N'y', N'u', N'u', 1, 2)
GO
INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (4, N'ew', N'ew', N'we', 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Months] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationalities] ON 
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (1, N'مصرى', N'Egeiption', 5)
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (2, N'سعودى', N'Saudi', 96)
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (3, N'كويتى', N'Kuwaiti', 97)
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (4, N'جزائرى', N'Algerian', 467)
GO
SET IDENTITY_INSERT [dbo].[Nationalities] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationsIsRead] ON 
GO
INSERT [dbo].[NotificationsIsRead] ([Id], [FkHistory_Id], [FKUser_Id]) VALUES (18, 135, 1)
GO
INSERT [dbo].[NotificationsIsRead] ([Id], [FkHistory_Id], [FKUser_Id]) VALUES (19, 140, 1)
GO
INSERT [dbo].[NotificationsIsRead] ([Id], [FkHistory_Id], [FKUser_Id]) VALUES (20, 139, 1)
GO
SET IDENTITY_INSERT [dbo].[NotificationsIsRead] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (2, N'Users', 1, 0, N'Users')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (3, N'Jobs', 1, 0, N'Jobs')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (4, N'Countries', 1, 0, N'Countries')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (5, N'PagesAllow', 1, 0, N'PagesAllow')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (6, N'PagesRoles', 1, 0, N'PagesRoles')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (7, N'Nationalities', 1, 0, N'Nationalities')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (8, N'UserLogins', 1, 0, N'UserLogins')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (9, N'Notifications', 1, 0, N'Notifications')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (16, N'TechnicalSupport', 1, 0, N'TechnicalSupport')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (17, N'Menus', 1, 0, N'Menus')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (18, N'SubMenus', 1, 0, N'SubMenus')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (19, N'Categories', 1, 0, N'Categories')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (20, N'SubCategories', 1, 0, N'SubCategories')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (21, N'Months', 1, 1, N'Months')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (23, N'Provinces', 1, 1, N'Provinces')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (26, N'AppConfigurations', 1, 1, N'AppConfigurations')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (27, N'DatesTypes', 1, 1, N'DatesTypes')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (28, N'AppsInformations', 1, 1, N'AppsInformations')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (29, N'Dates', 1, 0, N'Dates')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (30, N'MangeUsers', 1, 1, N'MangeUsers')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (31, N'RentalTypes', 1, 1, N'RentalTypes')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (33, N'Marks', 1, 1, N'Marks')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (34, N'RentalMarks', 1, 1, N'RentalMarks')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (35, N'RentalIndividualFields', 1, 1, N'RentalIndividualFields')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (36, N'Materials', 1, 1, N'Materials')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (37, N'RentalMaterials', 1, 1, N'RentalMaterials')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (38, N'GroupsDisplayTypes', 1, 1, N'GroupsDisplayTypes')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (40, N'RentalGroupsItems', 1, 1, N'RentalGroupsItems')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (41, N'RentalMarks', 1, 0, N'RentalMarks')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (42, N'RentalDirectFields', 1, 0, N'RentalDirectFields')
GO
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[PagesAllow] ON 
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (2, 1, 1, 7, 2)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (3, 1, 1, 8, 3)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (4, 1, 1, 9, 4)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (5, 1, 1, 10, 5)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (6, 1, 1, 36, 6)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (7, 1, 1, 88, 7)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (9, 1, 1, 107, 9)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (16, 1, 1, 177, 16)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (17, 1, 1, 202, 19)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (18, 1, 1, 208, 20)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (19, 1, 1, 234, 21)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (21, 1, 1, 263, 23)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (22, 1, 1, 276, 26)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (23, 1, 1, 279, 27)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (24, 1, 1, 294, 28)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1023, 1, 1, 308, 29)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1024, 1, 1, 348, 35)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1025, 1, 1, 392, 40)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1026, 1, 1, 397, 38)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1027, 1, 1, 470, 33)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1028, 1, 1, 474, 41)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1029, 1, 1, 484, 36)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1030, 1, 1, 489, 37)
GO
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1031, 1, 1, 496, 42)
GO
SET IDENTITY_INSERT [dbo].[PagesAllow] OFF
GO
SET IDENTITY_INSERT [dbo].[PagesRoles] ON 
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (24, 1, 1, 1, 1, 2, 1, 1, 43)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (25, 1, 1, 1, 1, 2, 1, 2, 44)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (26, 1, 1, 1, 1, 2, 1, 3, 45)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (27, 1, 1, 1, 1, 2, 2, 1, 46)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (28, 1, 1, 1, 1, 2, 2, 2, 47)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (29, 1, 1, 1, 1, 2, 2, 3, 48)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (30, 1, 1, 1, 1, 3, 1, 1, 49)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (31, 1, 1, 1, 1, 3, 1, 2, 50)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (32, 1, 1, 1, 1, 3, 1, 3, 60)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (33, 1, 1, 1, 1, 3, 2, 1, 61)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (34, 1, 1, 1, 1, 3, 2, 2, 62)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (35, 1, 1, 1, 1, 3, 2, 3, 63)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (36, 1, 1, 1, 1, 4, 1, 1, 64)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (37, 1, 1, 1, 1, 4, 1, 2, 65)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (38, 1, 1, 1, 1, 4, 1, 3, 66)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (39, 1, 1, 1, 1, 4, 2, 1, 67)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (40, 1, 1, 1, 1, 4, 2, 2, 68)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (41, 1, 1, 1, 1, 4, 2, 3, 69)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (42, 1, 1, 1, 1, 5, 1, 1, 70)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (43, 1, 1, 1, 1, 5, 1, 2, 71)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (44, 1, 1, 1, 1, 5, 1, 3, 72)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (45, 1, 1, 1, 1, 5, 2, 1, 73)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (46, 1, 1, 1, 1, 5, 2, 2, 74)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (47, 1, 1, 1, 1, 5, 2, 3, 75)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (48, 1, 1, 1, 1, 6, 1, 1, 76)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (49, 1, 1, 1, 1, 6, 1, 2, 77)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (50, 1, 1, 1, 1, 6, 1, 3, 78)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (51, 1, 1, 1, 1, 6, 2, 1, 79)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (52, 1, 1, 1, 1, 6, 2, 2, 80)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (53, 1, 1, 1, 1, 6, 2, 3, 81)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (54, 1, 1, 1, 1, 7, 1, 1, 82)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (55, 1, 1, 1, 1, 7, 1, 2, 83)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (56, 1, 1, 1, 1, 7, 1, 3, 84)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (57, 1, 1, 1, 1, 7, 2, 1, 85)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (58, 1, 1, 1, 1, 7, 2, 2, 86)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (59, 1, 1, 1, 1, 7, 2, 3, 87)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (66, 1, 1, 1, 1, 8, 1, 1, 98)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (67, 1, 1, 1, 1, 8, 1, 2, 100)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (68, 1, 1, 1, 1, 8, 1, 3, 101)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (69, 1, 1, 1, 1, 8, 2, 1, 102)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (70, 1, 1, 1, 1, 8, 2, 2, 103)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (108, 1, 1, 1, 1, 16, 1, 1, 178)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (109, 1, 1, 1, 1, 16, 1, 2, 179)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (110, 1, 1, 1, 1, 16, 1, 3, 180)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (111, 1, 1, 1, 1, 16, 2, 1, 181)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (112, 1, 1, 1, 1, 16, 2, 2, 182)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (113, 1, 1, 1, 1, 16, 2, 3, 183)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (119, 1, 1, 1, 1, 17, 1, 1, 186)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (120, 1, 1, 1, 1, 18, 1, 1, 187)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (122, 1, 1, 1, 1, 19, 1, 1, 193)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (123, 1, 1, 1, 1, 19, 2, 1, 194)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (124, 1, 1, 1, 1, 19, 3, 1, 195)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (125, 1, 1, 1, 1, 19, 1, 2, 196)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (126, 1, 1, 1, 1, 19, 2, 2, 197)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (127, 1, 1, 1, 1, 19, 3, 2, 198)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (128, 1, 1, 1, 1, 19, 1, 3, 199)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (129, 1, 1, 1, 1, 19, 2, 3, 200)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (130, 1, 1, 1, 1, 19, 3, 3, 201)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (131, 1, 1, 1, 1, 20, 1, 1, 209)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (132, 1, 1, 1, 1, 20, 2, 1, 210)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (133, 1, 1, 1, 1, 20, 3, 1, 211)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (134, 1, 1, 1, 1, 20, 1, 2, 212)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (135, 1, 1, 1, 1, 20, 2, 2, 213)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (136, 1, 1, 1, 1, 20, 3, 2, 214)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (137, 1, 1, 1, 1, 20, 1, 3, 215)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (138, 1, 1, 1, 1, 20, 2, 3, 216)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (139, 1, 1, 1, 1, 20, 3, 3, 217)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (140, 1, 1, 1, 1, 21, 1, 1, 225)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (141, 1, 1, 1, 1, 21, 2, 1, 226)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (142, 1, 1, 1, 1, 21, 3, 1, 227)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (143, 1, 1, 1, 1, 21, 1, 2, 228)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (144, 1, 1, 1, 1, 21, 2, 2, 229)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (145, 1, 1, 1, 1, 21, 3, 2, 230)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (146, 1, 1, 1, 1, 21, 1, 3, 231)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (147, 1, 1, 1, 1, 21, 2, 3, 232)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (148, 1, 1, 1, 1, 21, 3, 3, 233)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (158, 1, 1, 1, 1, 23, 1, 1, 264)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (159, 1, 1, 1, 1, 23, 2, 1, 265)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (160, 1, 1, 1, 1, 23, 3, 1, 266)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (161, 1, 1, 1, 1, 23, 1, 2, 267)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (162, 1, 1, 1, 1, 23, 2, 2, 268)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (163, 1, 1, 1, 1, 23, 3, 2, 269)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (164, 1, 1, 1, 1, 26, 1, 1, 270)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (165, 1, 1, 1, 1, 26, 2, 1, 271)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (166, 1, 1, 1, 1, 26, 3, 1, 272)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (167, 1, 1, 1, 1, 26, 1, 2, 273)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (168, 1, 1, 1, 1, 26, 2, 2, 274)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (169, 1, 1, 1, 1, 26, 3, 2, 275)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (170, 1, 1, 1, 1, 27, 1, 1, 280)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (171, 1, 1, 1, 1, 27, 2, 1, 271)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (172, 1, 1, 1, 1, 27, 3, 1, 281)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (173, 1, 1, 1, 1, 27, 1, 2, 282)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (174, 1, 1, 1, 1, 27, 2, 2, 283)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (175, 1, 1, 1, 1, 27, 3, 2, 284)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (176, 1, 1, 1, 1, 28, 1, 1, 295)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (177, 1, 1, 1, 1, 28, 1, 2, 296)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (178, 1, 1, 1, 1, 28, 1, 3, 297)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (179, 1, 1, 1, 1, 28, 2, 1, 298)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (180, 1, 1, 1, 1, 28, 2, 2, 299)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (181, 1, 1, 1, 1, 28, 2, 3, 300)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1170, 1, 1, 1, 1, 29, 1, 1, 309)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1171, 1, 1, 1, 1, 29, 1, 2, 310)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1172, 1, 1, 1, 1, 29, 1, 3, 311)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1173, 1, 1, 1, 1, 29, 2, 1, 312)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1174, 1, 1, 1, 1, 29, 2, 2, 313)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1175, 1, 1, 1, 1, 29, 2, 3, 314)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1176, 1, 1, 1, 1, 35, 2, 1, 349)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1177, 1, 1, 1, 1, 35, 2, 2, 350)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1178, 1, 1, 1, 1, 35, 2, 3, 351)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1179, 1, 1, 1, 1, 40, 2, 1, 389)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1180, 1, 1, 1, 1, 40, 2, 2, 390)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1181, 1, 1, 1, 1, 40, 2, 3, 391)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1182, 1, 1, 1, 1, 38, 2, 1, 394)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1183, 1, 1, 1, 1, 38, 2, 2, 395)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1184, 1, 1, 1, 1, 38, 2, 3, 396)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1185, 1, 1, 1, 1, 33, 2, 1, 471)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1186, 1, 1, 1, 1, 33, 2, 2, 472)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1187, 1, 1, 1, 1, 33, 2, 3, 473)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1188, 1, 1, 1, 1, 41, 2, 1, 475)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1189, 1, 1, 1, 1, 41, 2, 2, 476)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1190, 1, 1, 1, 1, 41, 2, 3, 477)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1191, 1, 1, 1, 1, 36, 2, 1, 485)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1192, 1, 1, 1, 1, 36, 2, 2, 486)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1193, 1, 1, 1, 1, 36, 2, 3, 487)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1194, 1, 1, 1, 1, 37, 2, 1, 490)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1195, 1, 1, 1, 1, 37, 2, 2, 491)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1196, 1, 1, 1, 1, 37, 2, 3, 492)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1197, 1, 1, 1, 1, 42, 2, 1, 497)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1198, 1, 1, 1, 1, 42, 2, 2, 498)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (1199, 1, 1, 1, 1, 42, 2, 3, 499)
GO
SET IDENTITY_INSERT [dbo].[PagesRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[PagesRoleTypes] ON 
GO
INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (1, N'Management')
GO
INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (2, N'Notifications')
GO
INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (3, N'Logs')
GO
SET IDENTITY_INSERT [dbo].[PagesRoleTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[PhoneNumbers] ON 
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Number], [FKPhone_Id], [FkPhoneType_Id]) VALUES (9, N'01025249400', 1, 1)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Number], [FKPhone_Id], [FkPhoneType_Id]) VALUES (12, N'01025249401', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[PhoneNumbers] OFF
GO
SET IDENTITY_INSERT [dbo].[Phones] ON 
GO
INSERT [dbo].[Phones] ([Id], [Notes]) VALUES (1, NULL)
GO
INSERT [dbo].[Phones] ([Id], [Notes]) VALUES (2, NULL)
GO
INSERT [dbo].[Phones] ([Id], [Notes]) VALUES (3, NULL)
GO
INSERT [dbo].[Phones] ([Id], [Notes]) VALUES (4, NULL)
GO
INSERT [dbo].[Phones] ([Id], [Notes]) VALUES (5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Phones] OFF
GO
SET IDENTITY_INSERT [dbo].[PhoneTypes] ON 
GO
INSERT [dbo].[PhoneTypes] ([Id], [ResourceName]) VALUES (1, N'Mobile')
GO
INSERT [dbo].[PhoneTypes] ([Id], [ResourceName]) VALUES (2, N'Fax')
GO
INSERT [dbo].[PhoneTypes] ([Id], [ResourceName]) VALUES (3, N'Home')
GO
SET IDENTITY_INSERT [dbo].[PhoneTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (1, N'القاهرة', N'Cairo', 1, 2)
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (18, N'المنصورة', N'Mansoura -', 1, 29)
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (19, N'الاسكندرية', N'Alx', 1, 30)
GO
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes], [IsControlPanel]) VALUES (1, N'Manager', NULL, 1)
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes], [IsControlPanel]) VALUES (2, N'Supervisor', NULL, 1)
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes], [IsControlPanel]) VALUES (3, N'Client', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (1, N'S')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (2, N'M')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (3, N'L')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (4, N'XL')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (5, N'XXL')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (6, N'XXXL')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (7, N'1W')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (8, N'2W')
GO
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[SocialStatus] ON 
GO
INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (1, N'Single')
GO
INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (2, N'Married')
GO
INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (3, N'Widower')
GO
SET IDENTITY_INSERT [dbo].[SocialStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (1, N'Create', N'label-success', N'fa fa-plus')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (2, N'Update', N'label-warning', N'fas fa-edit')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (3, N'Delete', N'label-danger', N'fas fa-trash-alt')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (4, N'Reject', N'label-danger', N'fas fa-times')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (5, N'Approve', N'label-success', N'fas fa-check-double')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (6, N'Buy', N'label-success', N'fas fa-check-double')
GO
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (7, N'CreateLiveStreamAd', N'label-success', N'fas fa-video')
GO
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[SubMenus] ON 
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (6, 1, N'fas fa-not-equal', 2, 2)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (7, 3, N'fas fa-not-equal', 1, 3)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (8, 4, N'fas fa-not-equal', 1, 4)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (9, 5, N'fas fa-not-equal', 1, 5)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (10, 6, N'fas fa-not-equal', 1, 6)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (11, 7, N'fas fa-not-equal', 1, 7)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (16, 2, N'fas fa-not-equal', 2, 8)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (23, 1, N'fas fa-not-equal', 7, 16)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (24, 8, N'fas fa-not-equal', 1, 17)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (25, 9, N'fas fa-not-equal', 1, 18)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (26, 1, N'fas fa-not-equal', 8, 19)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (27, 2, N'fas fa-not-equal', 8, 20)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (28, 1, N'fas fa-not-equal', 9, 21)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (30, 10, N'fas fa-not-equal', 1, 23)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (31, 11, N'fas fa-not-equal', 1, 26)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (32, 2, N'fas fa-not-equal', 9, 27)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (33, 3, N'fas fa-not-equal', 1, 28)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1032, 3, N'fas fa-not-equal', 9, 29)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1033, 1, N'fas fa-not-equal', 10, 35)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1034, 2, N'fas fa-not-equal', 10, 40)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1035, 3, N'fas fa-not-equal', 10, 38)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1036, 12, N'fas fa-not-equal', 1, 33)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1037, 4, N'fas fa-not-equal', 10, 41)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1038, 12, N'fas fa-not-equal', 1, 36)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1039, 5, N'fas fa-not-equal', 10, 37)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1040, 6, N'fas fa-not-equal', 10, 42)
GO
SET IDENTITY_INSERT [dbo].[SubMenus] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupport] ON 
GO
INSERT [dbo].[TechnicalSupport] ([Id], [UserName], [Email], [Phone], [Message], [CreateDateTime]) VALUES (1, N'ahmed Nageeb', N'Sezer.info@gmail.com', N'01025249400', N'test test ahmed ahmed test test ahmed ahmed aya mohamed ', CAST(N'2018-09-07T22:18:05.423' AS DateTime))
GO
INSERT [dbo].[TechnicalSupport] ([Id], [UserName], [Email], [Phone], [Message], [CreateDateTime]) VALUES (2, N'ahmed Nageeb', N'Sezer.info@gmail.com', N'01025249400', N'test test ahmed ahmed test te


st ahmed ahmed aya mohamed ', CAST(N'2018-09-07T22:51:17.983' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupport] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupportRead] ON 
GO
INSERT [dbo].[TechnicalSupportRead] ([Id], [FkTechnicalSupport_Id], [FkUser_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[TechnicalSupportRead] ([Id], [FkTechnicalSupport_Id], [FkUser_Id]) VALUES (2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupportRead] OFF
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (1, N'Ahmed', N'Nageeb', N'Mahmoud', N'123654879', CAST(N'1997-02-04' AS Date), 1, 1, 1, 1, 1, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (2, N'Aya', NULL, N'Nageeb', N'12121212654', NULL, 2, 2, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (3, N'xxqq1', NULL, N'qq', NULL, NULL, 27, 3, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (5, N'ghjklkn8888', NULL, N'sdsdsd', NULL, NULL, 29, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (9, N'', NULL, N'', NULL, NULL, 43, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (10, N'', NULL, N'', NULL, NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (11, N'', NULL, N'', NULL, NULL, 105, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [BirthDate], [FkImage_Id], [FKAddress_Id], [FkNationality_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [FKLanguage_Id], [IsAllowSMS], [IsAllowEmail], [IsOfferSummary], [PhoneNumbre]) VALUES (12, N'', NULL, N'', NULL, NULL, 124, 7, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserLogins] ON 
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1, CAST(N'2018-08-19T17:54:54.117' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2, CAST(N'2018-08-19T17:55:11.110' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (3, CAST(N'2018-08-19T17:56:18.620' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (4, CAST(N'2018-08-19T17:56:54.307' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (5, CAST(N'2018-08-19T17:58:30.443' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (6, CAST(N'2018-08-19T17:59:33.700' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (7, CAST(N'2018-08-19T18:00:37.667' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (8, CAST(N'2018-08-19T18:01:49.207' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (9, CAST(N'2018-08-19T18:06:22.350' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (10, CAST(N'2018-08-19T18:07:35.967' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (11, CAST(N'2018-08-19T18:07:55.160' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (12, CAST(N'2018-08-19T18:08:57.743' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (13, CAST(N'2018-08-19T18:10:15.493' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (14, CAST(N'2018-08-19T18:10:31.273' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (15, CAST(N'2018-08-19T18:10:56.700' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (16, CAST(N'2018-08-19T18:12:08.717' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (17, CAST(N'2018-08-19T18:13:05.743' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (18, CAST(N'2018-08-19T18:13:05.957' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (19, CAST(N'2018-08-19T18:13:23.530' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (20, CAST(N'2018-08-19T18:15:33.137' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (21, CAST(N'2018-08-19T18:28:31.153' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (22, CAST(N'2018-08-19T18:28:51.610' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (23, CAST(N'2018-08-19T18:31:21.073' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (24, CAST(N'2018-08-19T18:31:24.643' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (25, CAST(N'2018-08-19T18:33:38.513' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (26, CAST(N'2018-08-19T18:34:52.157' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (27, CAST(N'2018-08-19T19:25:40.097' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (28, CAST(N'2018-08-19T19:25:40.843' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (29, CAST(N'2018-08-19T19:31:10.290' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (30, CAST(N'2018-08-19T19:33:21.480' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (31, CAST(N'2018-08-24T16:45:44.917' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (32, CAST(N'2018-08-30T19:33:16.707' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (33, CAST(N'2018-09-09T22:54:25.140' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (34, CAST(N'2018-09-15T19:51:39.437' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (35, CAST(N'2018-09-15T19:51:45.297' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (36, CAST(N'2018-09-15T19:54:14.973' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (37, CAST(N'2018-09-15T19:56:32.130' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (38, CAST(N'2018-09-19T14:13:39.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (39, CAST(N'2018-09-19T17:05:29.640' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (40, CAST(N'2018-09-19T17:19:43.167' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (41, CAST(N'2018-09-19T17:21:28.580' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (42, CAST(N'2018-09-19T17:23:53.580' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (43, CAST(N'2018-09-20T00:15:33.650' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (44, CAST(N'2018-09-20T21:31:49.970' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (45, CAST(N'2018-09-21T13:58:38.190' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (46, CAST(N'2018-09-21T13:58:40.080' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (47, CAST(N'2018-09-21T13:58:40.377' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (48, CAST(N'2018-09-23T05:12:58.793' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (49, CAST(N'2018-09-23T05:12:58.793' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (50, CAST(N'2018-09-23T14:39:04.970' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (51, CAST(N'2018-09-23T15:14:56.997' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (52, CAST(N'2018-09-23T20:53:42.237' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (53, CAST(N'2018-09-24T01:30:13.023' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (54, CAST(N'2018-09-24T14:38:08.053' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (55, CAST(N'2018-09-29T23:15:25.157' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (56, CAST(N'2018-09-30T00:39:40.943' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (57, CAST(N'2018-09-30T14:25:37.123' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (58, CAST(N'2018-10-01T01:10:49.713' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (59, CAST(N'2018-10-13T10:02:53.450' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (60, CAST(N'2018-10-13T10:02:53.450' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (61, CAST(N'2018-10-13T22:26:30.400' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (62, CAST(N'2018-10-14T01:39:47.510' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (63, CAST(N'2018-10-14T17:39:55.697' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (64, CAST(N'2018-10-14T17:39:58.580' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (65, CAST(N'2018-10-14T17:58:53.943' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (66, CAST(N'2018-10-17T00:36:05.707' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (67, CAST(N'2018-10-17T19:17:07.727' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (68, CAST(N'2018-10-19T00:39:53.683' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1062, CAST(N'2018-10-23T20:14:46.677' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1063, CAST(N'2018-10-25T18:16:21.107' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1064, CAST(N'2018-10-25T18:16:21.107' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1065, CAST(N'2018-10-25T19:59:29.913' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1066, CAST(N'2018-10-27T02:21:30.903' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1067, CAST(N'2018-10-27T02:52:45.853' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1068, CAST(N'2018-10-27T02:52:57.617' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1069, CAST(N'2018-10-27T03:30:21.360' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1070, CAST(N'2018-10-27T03:37:31.467' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1071, CAST(N'2018-10-27T04:07:30.850' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1072, CAST(N'2018-10-27T04:09:07.427' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1073, CAST(N'2018-10-27T04:10:43.803' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1074, CAST(N'2018-10-27T04:11:10.720' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1075, CAST(N'2018-10-27T04:16:44.497' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1076, CAST(N'2018-10-27T04:23:13.310' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1077, CAST(N'2018-10-27T04:23:34.663' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1078, CAST(N'2018-10-27T04:43:27.293' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1079, CAST(N'2018-10-27T17:55:39.720' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1080, CAST(N'2018-10-27T17:56:39.693' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1081, CAST(N'2018-10-27T17:56:41.520' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1082, CAST(N'2018-10-27T17:56:46.053' AS DateTime), 0, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1083, CAST(N'2018-10-27T18:41:34.043' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1084, CAST(N'2018-10-27T18:46:48.543' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1085, CAST(N'2018-10-27T18:47:18.333' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1086, CAST(N'2018-10-27T18:49:03.467' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1087, CAST(N'2018-10-27T18:51:04.393' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1088, CAST(N'2018-10-27T18:55:26.447' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1089, CAST(N'2018-10-27T19:10:04.363' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1090, CAST(N'2018-10-27T19:12:04.650' AS DateTime), 1, 3)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1091, CAST(N'2018-10-27T21:54:53.313' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1092, CAST(N'2018-10-27T21:57:59.900' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1093, CAST(N'2018-10-27T21:58:33.023' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1094, CAST(N'2018-10-27T22:01:30.673' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1095, CAST(N'2018-10-27T22:05:00.803' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1096, CAST(N'2018-10-27T22:05:11.333' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1097, CAST(N'2018-10-27T22:09:48.783' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1098, CAST(N'2018-10-28T04:16:11.747' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1099, CAST(N'2018-10-28T04:21:10.420' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1100, CAST(N'2018-10-28T04:30:30.307' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1101, CAST(N'2018-10-28T04:49:57.160' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1102, CAST(N'2018-10-28T04:54:23.233' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1103, CAST(N'2018-10-28T05:31:13.677' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1104, CAST(N'2018-10-28T05:31:31.953' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1105, CAST(N'2018-10-28T15:58:57.877' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1106, CAST(N'2018-10-28T15:58:57.897' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1107, CAST(N'2018-10-28T15:59:28.083' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1108, CAST(N'2018-10-29T20:10:17.603' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1109, CAST(N'2018-10-29T23:34:08.103' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1110, CAST(N'2018-10-29T23:47:53.407' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1111, CAST(N'2018-10-29T23:48:44.533' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1112, CAST(N'2018-10-29T23:50:18.400' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1113, CAST(N'2018-10-31T03:39:15.757' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1114, CAST(N'2018-10-31T03:40:04.793' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1115, CAST(N'2018-10-31T03:41:43.680' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1116, CAST(N'2018-10-31T03:48:06.403' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1117, CAST(N'2018-10-31T03:53:43.167' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1118, CAST(N'2018-10-31T03:54:06.560' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1119, CAST(N'2018-10-31T03:55:38.230' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1120, CAST(N'2018-10-31T03:58:57.333' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1121, CAST(N'2018-10-31T04:10:51.627' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1122, CAST(N'2018-10-31T04:11:03.967' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1123, CAST(N'2018-10-31T04:11:17.900' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1124, CAST(N'2018-10-31T04:13:43.877' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1125, CAST(N'2018-10-31T04:15:50.673' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1126, CAST(N'2018-10-31T04:38:36.293' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1127, CAST(N'2018-10-31T04:42:01.673' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1128, CAST(N'2018-10-31T04:42:12.800' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1129, CAST(N'2018-10-31T04:44:14.960' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1130, CAST(N'2018-10-31T04:51:52.793' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1131, CAST(N'2018-10-31T04:52:34.210' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1132, CAST(N'2018-10-31T04:52:51.747' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1133, CAST(N'2018-10-31T04:56:52.500' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1134, CAST(N'2018-10-31T04:57:09.607' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1135, CAST(N'2018-10-31T04:57:28.903' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1136, CAST(N'2018-10-31T22:41:12.577' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1137, CAST(N'2018-11-01T03:04:34.127' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1138, CAST(N'2018-11-01T03:40:08.770' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1139, CAST(N'2018-11-01T03:56:41.273' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1140, CAST(N'2018-11-01T04:00:46.160' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1141, CAST(N'2018-11-01T04:01:31.583' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1142, CAST(N'2018-11-01T04:02:29.907' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1143, CAST(N'2018-11-01T04:07:46.580' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1144, CAST(N'2018-11-01T04:07:46.580' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1145, CAST(N'2018-11-01T04:15:20.257' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1146, CAST(N'2018-11-01T04:21:20.107' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1147, CAST(N'2018-11-01T04:25:15.057' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1148, CAST(N'2018-11-02T22:45:59.470' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1149, CAST(N'2018-11-02T22:46:30.080' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1150, CAST(N'2018-11-02T22:48:50.923' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1151, CAST(N'2018-11-04T15:25:49.827' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1152, CAST(N'2018-11-06T02:10:19.830' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1153, CAST(N'2018-11-06T02:10:29.983' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1154, CAST(N'2018-11-06T02:10:35.500' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1155, CAST(N'2018-11-06T02:10:35.997' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1156, CAST(N'2018-11-06T02:10:36.480' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (1157, CAST(N'2018-11-07T03:30:33.220' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2157, CAST(N'2018-11-10T02:03:33.490' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2158, CAST(N'2018-11-10T04:13:13.600' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2159, CAST(N'2018-11-10T04:56:48.980' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2160, CAST(N'2018-11-17T01:18:07.413' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2161, CAST(N'2018-11-17T01:22:43.643' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2162, CAST(N'2018-11-17T01:37:08.020' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2163, CAST(N'2018-11-17T02:24:32.243' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2164, CAST(N'2018-11-18T23:16:58.253' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2165, CAST(N'2018-11-23T23:47:05.070' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2166, CAST(N'2018-11-23T23:47:16.637' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2167, CAST(N'2018-11-24T02:35:54.063' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2168, CAST(N'2018-11-24T02:35:58.933' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2169, CAST(N'2018-11-25T11:28:42.593' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2170, CAST(N'2018-11-25T13:19:49.970' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2171, CAST(N'2018-11-25T14:35:52.330' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2172, CAST(N'2018-11-26T00:55:10.447' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2173, CAST(N'2018-11-26T12:29:08.740' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2174, CAST(N'2018-11-30T18:43:36.157' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2175, CAST(N'2018-12-02T12:18:34.240' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2176, CAST(N'2018-12-03T11:08:43.490' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2177, CAST(N'2018-12-03T11:08:45.870' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2178, CAST(N'2018-12-03T12:39:38.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2179, CAST(N'2018-12-04T23:01:44.310' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2180, CAST(N'2018-12-05T11:28:12.973' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2181, CAST(N'2018-12-05T11:28:30.827' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2182, CAST(N'2018-12-05T14:42:34.670' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2183, CAST(N'2018-12-05T14:42:53.357' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2184, CAST(N'2018-12-06T13:49:44.777' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2185, CAST(N'2018-12-06T13:49:47.800' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2186, CAST(N'2018-12-06T14:04:11.073' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2187, CAST(N'2018-12-06T18:23:42.760' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2188, CAST(N'2018-12-07T17:57:59.537' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2189, CAST(N'2018-12-07T20:18:41.227' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2190, CAST(N'2018-12-07T20:23:08.550' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2191, CAST(N'2018-12-07T22:46:02.843' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2192, CAST(N'2018-12-08T01:47:57.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2193, CAST(N'2018-12-08T01:47:57.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2194, CAST(N'2018-12-08T01:47:57.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2195, CAST(N'2018-12-11T13:41:09.830' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2196, CAST(N'2018-12-14T15:49:29.027' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2197, CAST(N'2018-12-14T16:34:02.427' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2198, CAST(N'2018-12-14T17:34:36.360' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2199, CAST(N'2018-12-17T14:13:15.860' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2200, CAST(N'2018-12-17T16:10:09.937' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2201, CAST(N'2018-12-19T05:04:16.170' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2202, CAST(N'2019-01-04T23:03:04.280' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2203, CAST(N'2019-01-05T01:00:11.730' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2204, CAST(N'2019-01-05T13:53:10.830' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2205, CAST(N'2019-01-05T14:08:04.167' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2206, CAST(N'2019-01-05T14:31:12.443' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2207, CAST(N'2019-01-05T14:53:45.860' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2208, CAST(N'2019-01-08T01:13:24.080' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2209, CAST(N'2019-01-08T01:17:04.130' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2210, CAST(N'2019-01-08T14:53:30.100' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2211, CAST(N'2019-01-08T15:22:25.430' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2212, CAST(N'2019-01-08T22:37:14.580' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2213, CAST(N'2019-01-08T23:58:58.783' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2214, CAST(N'2019-01-09T00:08:51.660' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2215, CAST(N'2019-01-09T22:14:38.777' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2216, CAST(N'2019-01-09T22:14:45.697' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2217, CAST(N'2019-01-10T01:29:53.603' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2218, CAST(N'2019-01-10T01:33:19.070' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2219, CAST(N'2019-01-10T01:35:42.340' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2220, CAST(N'2019-01-10T01:35:55.940' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2221, CAST(N'2019-01-10T17:12:51.697' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2222, CAST(N'2019-01-10T18:40:07.890' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2223, CAST(N'2019-01-10T22:39:18.800' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2224, CAST(N'2019-01-10T23:14:39.730' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2225, CAST(N'2019-01-11T02:31:56.267' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2226, CAST(N'2019-01-11T02:35:04.533' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2227, CAST(N'2019-01-11T02:36:27.690' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2228, CAST(N'2019-01-11T02:44:18.267' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2229, CAST(N'2019-01-29T11:48:12.057' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2230, CAST(N'2019-01-30T14:09:15.923' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2231, CAST(N'2019-02-22T21:31:33.953' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2232, CAST(N'2019-02-23T03:24:52.987' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2233, CAST(N'2019-02-23T08:32:54.337' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2234, CAST(N'2019-02-24T16:06:20.393' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2235, CAST(N'2019-02-28T05:33:09.850' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2236, CAST(N'2019-02-28T05:38:29.100' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2237, CAST(N'2019-03-01T17:49:39.713' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2238, CAST(N'2019-03-01T18:33:03.223' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2239, CAST(N'2019-03-01T18:44:50.877' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2240, CAST(N'2019-03-01T18:50:39.437' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2241, CAST(N'2019-03-01T20:34:22.997' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2242, CAST(N'2019-03-02T00:02:14.593' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2243, CAST(N'2019-03-29T12:20:24.667' AS DateTime), 1, 12)
GO
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (3, 2, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (4, 3, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (6, 5, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (7, 9, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (8, 10, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (9, 11, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (10, 12, 3)
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (1, N'ahmed', N'ahmed@gmail.com', N'123456', 0, CAST(N'2012-12-01T00:00:00.000' AS DateTime), N'ahmed1', 105)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (2, N'AYa', N'sezer.info.0@gmail.com', N'123456', 0, CAST(N'2018-08-26T23:41:08.133' AS DateTime), N'69680b54-2c75-4235-a297-5bd326eb2b30', 106)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (3, N'ahmedw', N'ahmednageeb@gmail.com', N'123456', 0, CAST(N'2018-08-30T16:57:19.937' AS DateTime), N'dfc43fcf-a4e8-4a25-b97a-d1bf76d46897', 124)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (5, N'sasasa', N'dowqnlaodvid1eoyou@gmail.com', N'123456', 0, CAST(N'2018-08-30T17:19:26.103' AS DateTime), N'7fbca0dd-3216-4425-b52d-fb8441d48109', 126)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (9, N'ahmeddd@gmail_com', N'ahmeddd@gmail.com', N'123456', 0, CAST(N'2018-08-30T21:09:50.823' AS DateTime), N'504d102d-6141-43c5-8cf4-10ed4623bb91', 128)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (10, N'ahmed0', N'ahmsed@gmail.com', N'123456', 0, CAST(N'2018-10-13T06:16:34.190' AS DateTime), N'e2b89cee-19f6-4042-a088-afbeb7a8e13b', 261)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (11, N'ahmedv0', N'avhmsed@gmail.com', N'123456', 1, CAST(N'2018-10-13T06:17:07.607' AS DateTime), N'3188df68-6492-47a2-9267-3fa8adf9fa90', 262)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate], [Serial], [FkLog_Id]) VALUES (12, N'ahme0dna', N'a0hmed@gmail.com', N'123456', 0, CAST(N'2018-10-15T19:59:59.547' AS DateTime), N'b5704b3b-c0d1-4d49-a128-b412943b736d', 293)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email]    Script Date: 4/1/2019 12:28:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Serial]    Script Date: 4/1/2019 12:28:56 AM ******/
CREATE NONCLUSTERED INDEX [Serial] ON [dbo].[Users]
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserName]    Script Date: 4/1/2019 12:28:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Ads].[RentalIndividualFields] ADD  CONSTRAINT [DF_RentalCategoryInputs_FKRentalCategory_Id]  DEFAULT ((0)) FOR [FKSubCategory_Id]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_Ads]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_LogHistories] FOREIGN KEY([FKLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_LogHistories]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_Users]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdBasicDetails_Materials] FOREIGN KEY([FKMatrial_Id])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdBasicDetails_Materials]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdBasicDetails_Nationalities] FOREIGN KEY([FKNationality_Id])
REFERENCES [dbo].[Nationalities] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdBasicDetails_Nationalities]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdBasicDetails_Sizes] FOREIGN KEY([FKSize_Id])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdBasicDetails_Sizes]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Locations] FOREIGN KEY([FKLocation_Id])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDetails_Locations]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDirectFieldDetails_Ads] FOREIGN KEY([AdId])
REFERENCES [Ads].[Ads] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDirectFieldDetails_Ads]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDirectFieldDetails_Areas] FOREIGN KEY([FKArea_Id])
REFERENCES [dbo].[Areas] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDirectFieldDetails_Areas]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDirectFieldDetails_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDirectFieldDetails_Countries]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDirectFieldDetails_Marks] FOREIGN KEY([FKMark_Id])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDirectFieldDetails_Marks]
GO
ALTER TABLE [Ads].[AdDirectFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDirectFieldDetails_Provinces] FOREIGN KEY([FkProvince_Id])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [Ads].[AdDirectFieldDetails] CHECK CONSTRAINT [FK_AdDirectFieldDetails_Provinces]
GO
ALTER TABLE [Ads].[AdFavorites]  WITH CHECK ADD  CONSTRAINT [FK_AdFavorites_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdFavorites] CHECK CONSTRAINT [FK_AdFavorites_Ads]
GO
ALTER TABLE [Ads].[AdFavorites]  WITH CHECK ADD  CONSTRAINT [FK_AdFavorites_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [Ads].[AdFavorites] CHECK CONSTRAINT [FK_AdFavorites_Users]
GO
ALTER TABLE [Ads].[AdGroupsDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdGroupsDetails_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdGroupsDetails] CHECK CONSTRAINT [FK_AdGroupsDetails_Ads]
GO
ALTER TABLE [Ads].[AdGroupsDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdGroupsDetails_Groups] FOREIGN KEY([FKGroup_Id])
REFERENCES [Ads].[Groups] ([Id])
GO
ALTER TABLE [Ads].[AdGroupsDetails] CHECK CONSTRAINT [FK_AdGroupsDetails_Groups]
GO
ALTER TABLE [Ads].[AdGroupsDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdGroupsDetails_GroupsItems] FOREIGN KEY([FKGroupItem_Id])
REFERENCES [Ads].[GroupsItems] ([Id])
GO
ALTER TABLE [Ads].[AdGroupsDetails] CHECK CONSTRAINT [FK_AdGroupsDetails_GroupsItems]
GO
ALTER TABLE [Ads].[AdIndividualFieldsDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdIndividualFieldsDetails_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdIndividualFieldsDetails] CHECK CONSTRAINT [FK_AdIndividualFieldsDetails_Ads]
GO
ALTER TABLE [Ads].[AdIndividualFieldsDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdIndividualFieldsDetails_IndividualFields] FOREIGN KEY([FkIndividualField_Id])
REFERENCES [Ads].[IndividualFields] ([Id])
GO
ALTER TABLE [Ads].[AdIndividualFieldsDetails] CHECK CONSTRAINT [FK_AdIndividualFieldsDetails_IndividualFields]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Albums] FOREIGN KEY([FKAlbum_Id])
REFERENCES [dbo].[Albums] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_Albums]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Categories] FOREIGN KEY([FkCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_Categories]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Logs] FOREIGN KEY([FKLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_Logs]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_RentalTimesTypes] FOREIGN KEY([FkRentalTimesType_Id])
REFERENCES [Ads].[RentalTimesTypes] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_RentalTimesTypes]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_SubCategories] FOREIGN KEY([FkSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_SubCategories]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_Users]
GO
ALTER TABLE [Ads].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_RentalCategories] FOREIGN KEY([Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[Categories] CHECK CONSTRAINT [FK_RentalCategories_RentalCategories]
GO
ALTER TABLE [Ads].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_RentalTypes_Files] FOREIGN KEY([FKFile_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [Ads].[Categories] CHECK CONSTRAINT [FK_RentalTypes_Files]
GO
ALTER TABLE [Ads].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_RentalTypes_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[Categories] CHECK CONSTRAINT [FK_RentalTypes_LogHistories]
GO
ALTER TABLE [Ads].[GroupsDisplayTypes]  WITH CHECK ADD  CONSTRAINT [FK_GroupFieldsDisplayTypes_Groups] FOREIGN KEY([FKGroup_Id])
REFERENCES [Ads].[Groups] ([Id])
GO
ALTER TABLE [Ads].[GroupsDisplayTypes] CHECK CONSTRAINT [FK_GroupFieldsDisplayTypes_Groups]
GO
ALTER TABLE [Ads].[GroupsDisplayTypes]  WITH CHECK ADD  CONSTRAINT [FK_GroupsFieldsDisplayTypes_Categories] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[GroupsDisplayTypes] CHECK CONSTRAINT [FK_GroupsFieldsDisplayTypes_Categories]
GO
ALTER TABLE [Ads].[GroupsDisplayTypes]  WITH CHECK ADD  CONSTRAINT [FK_GroupsFieldsDisplayTypes_InputsTypes] FOREIGN KEY([FKInputType_Id])
REFERENCES [dbo].[InputsTypes] ([Id])
GO
ALTER TABLE [Ads].[GroupsDisplayTypes] CHECK CONSTRAINT [FK_GroupsFieldsDisplayTypes_InputsTypes]
GO
ALTER TABLE [Ads].[GroupsDisplayTypes]  WITH CHECK ADD  CONSTRAINT [FK_GroupsFieldsDisplayTypes_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[GroupsDisplayTypes] CHECK CONSTRAINT [FK_GroupsFieldsDisplayTypes_Logs]
GO
ALTER TABLE [Ads].[GroupsDisplayTypes]  WITH CHECK ADD  CONSTRAINT [FK_GroupsFieldsDisplayTypes_SubCategories] FOREIGN KEY([FKSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[GroupsDisplayTypes] CHECK CONSTRAINT [FK_GroupsFieldsDisplayTypes_SubCategories]
GO
ALTER TABLE [Ads].[GroupsItems]  WITH CHECK ADD  CONSTRAINT [FK_GroupFields_Groups] FOREIGN KEY([FKGroup_Id])
REFERENCES [Ads].[Groups] ([Id])
GO
ALTER TABLE [Ads].[GroupsItems] CHECK CONSTRAINT [FK_GroupFields_Groups]
GO
ALTER TABLE [Ads].[IndividualFields]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_InputsTypes] FOREIGN KEY([FKInputType_Id])
REFERENCES [dbo].[InputsTypes] ([Id])
GO
ALTER TABLE [Ads].[IndividualFields] CHECK CONSTRAINT [FK_Inputs_InputsTypes]
GO
ALTER TABLE [Ads].[RentalDirectFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalDirectFields_Categories] FOREIGN KEY([FkCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[RentalDirectFields] CHECK CONSTRAINT [FK_RentalDirectFields_Categories]
GO
ALTER TABLE [Ads].[RentalDirectFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalDirectFields_DirectFields] FOREIGN KEY([FkDirectField_Id])
REFERENCES [Ads].[DirectFields] ([Id])
GO
ALTER TABLE [Ads].[RentalDirectFields] CHECK CONSTRAINT [FK_RentalDirectFields_DirectFields]
GO
ALTER TABLE [Ads].[RentalDirectFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalDirectFields_Logs] FOREIGN KEY([Fklog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalDirectFields] CHECK CONSTRAINT [FK_RentalDirectFields_Logs]
GO
ALTER TABLE [Ads].[RentalDirectFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalDirectFields_SubCategories] FOREIGN KEY([FkSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalDirectFields] CHECK CONSTRAINT [FK_RentalDirectFields_SubCategories]
GO
ALTER TABLE [Ads].[RentalGroupsItems]  WITH CHECK ADD  CONSTRAINT [FK_AdsGroupsItems_Categories] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[RentalGroupsItems] CHECK CONSTRAINT [FK_AdsGroupsItems_Categories]
GO
ALTER TABLE [Ads].[RentalGroupsItems]  WITH CHECK ADD  CONSTRAINT [FK_AdsGroupsItems_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalGroupsItems] CHECK CONSTRAINT [FK_AdsGroupsItems_Logs]
GO
ALTER TABLE [Ads].[RentalGroupsItems]  WITH CHECK ADD  CONSTRAINT [FK_AdsGroupsItems_SubCategories] FOREIGN KEY([FKSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalGroupsItems] CHECK CONSTRAINT [FK_AdsGroupsItems_SubCategories]
GO
ALTER TABLE [Ads].[RentalGroupsItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalGroupFields_GroupFields] FOREIGN KEY([FKGroupsItem_Id])
REFERENCES [Ads].[GroupsItems] ([Id])
GO
ALTER TABLE [Ads].[RentalGroupsItems] CHECK CONSTRAINT [FK_RentalGroupFields_GroupFields]
GO
ALTER TABLE [Ads].[RentalIndividualFields]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_RentalCategories] FOREIGN KEY([FKSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalIndividualFields] CHECK CONSTRAINT [FK_CategoryInputs_RentalCategories]
GO
ALTER TABLE [Ads].[RentalIndividualFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_LogHistories] FOREIGN KEY([FKLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalIndividualFields] CHECK CONSTRAINT [FK_RentalCategoryInputs_LogHistories]
GO
ALTER TABLE [Ads].[RentalIndividualFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_RentalTypes] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[RentalIndividualFields] CHECK CONSTRAINT [FK_RentalCategoryInputs_RentalTypes]
GO
ALTER TABLE [Ads].[RentalIndividualFields]  WITH CHECK ADD  CONSTRAINT [FK_RentalInputs_AdsInputs] FOREIGN KEY([FkIndividualField_Id])
REFERENCES [Ads].[IndividualFields] ([Id])
GO
ALTER TABLE [Ads].[RentalIndividualFields] CHECK CONSTRAINT [FK_RentalInputs_AdsInputs]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_LogHistories]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_RentalTypes] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_RentalTypes]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_Marks] FOREIGN KEY([FKMark_Id])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalMarks_Marks]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_RentalCategories] FOREIGN KEY([FKSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalMarks_RentalCategories]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_LogHistories]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterial_RentalCategories] FOREIGN KEY([FKSubCategory_Id])
REFERENCES [Ads].[SubCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalMaterial_RentalCategories]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterials_Materials] FOREIGN KEY([FKMaterial_Id])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalMaterials_Materials]
GO
ALTER TABLE [Ads].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_Files] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [Ads].[SubCategories] CHECK CONSTRAINT [FK_RentalCategories_Files]
GO
ALTER TABLE [Ads].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_LogHistories] FOREIGN KEY([FKLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[SubCategories] CHECK CONSTRAINT [FK_RentalCategories_LogHistories]
GO
ALTER TABLE [Ads].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_RentalType] FOREIGN KEY([FKCategory_Id])
REFERENCES [Ads].[Categories] ([Id])
GO
ALTER TABLE [Ads].[SubCategories] CHECK CONSTRAINT [FK_RentalCategories_RentalType]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Countries]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Provinces] FOREIGN KEY([FkProvince_Id])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Provinces]
GO
ALTER TABLE [dbo].[AlbumFiles]  WITH CHECK ADD  CONSTRAINT [FK_AlbumFiles_Albums] FOREIGN KEY([FkAlbum_Id])
REFERENCES [dbo].[Albums] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumFiles] CHECK CONSTRAINT [FK_AlbumFiles_Albums]
GO
ALTER TABLE [dbo].[AlbumFiles]  WITH CHECK ADD  CONSTRAINT [FK_AlbumFiles_Files] FOREIGN KEY([FkFile_Id])
REFERENCES [dbo].[Files] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumFiles] CHECK CONSTRAINT [FK_AlbumFiles_Files]
GO
ALTER TABLE [dbo].[AppsInformation]  WITH CHECK ADD  CONSTRAINT [FK_AppsInformation_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[AppsInformation] CHECK CONSTRAINT [FK_AppsInformation_Logs]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Files] FOREIGN KEY([FKFile_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Files]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Logs]
GO
ALTER TABLE [dbo].[Dates]  WITH CHECK ADD  CONSTRAINT [FK_Date_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DatesTypes] ([Id])
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Date_DateType]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_FileTypes] FOREIGN KEY([FkFileType_Id])
REFERENCES [dbo].[FileTypes] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_FileTypes]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Images_AppInformation] FOREIGN KEY([FKAppInformation_Id])
REFERENCES [dbo].[AppsInformation] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Images_AppInformation]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Logs]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Pages]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_States] FOREIGN KEY([FkState_Id])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_States]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Users]
GO
ALTER TABLE [dbo].[HistoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetails_Histories] FOREIGN KEY([FkHistory_Id])
REFERENCES [dbo].[Histories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryDetails] CHECK CONSTRAINT [FK_HistoryDetails_Histories]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Logs]
GO
ALTER TABLE [dbo].[LanguageUsing]  WITH CHECK ADD  CONSTRAINT [FK_LanguageUsing_Languages] FOREIGN KEY([FKLanguage_Id])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[LanguageUsing] CHECK CONSTRAINT [FK_LanguageUsing_Languages]
GO
ALTER TABLE [dbo].[LanguageUsing]  WITH CHECK ADD  CONSTRAINT [FK_LanguageUsing_LanguageTypes] FOREIGN KEY([FKLanguageType_Id])
REFERENCES [dbo].[LanguageTypes] ([Id])
GO
ALTER TABLE [dbo].[LanguageUsing] CHECK CONSTRAINT [FK_LanguageUsing_LanguageTypes]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_LogHistories]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Material _LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Material _LogHistories]
GO
ALTER TABLE [dbo].[Months]  WITH CHECK ADD  CONSTRAINT [FK_Month_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DatesTypes] ([Id])
GO
ALTER TABLE [dbo].[Months] CHECK CONSTRAINT [FK_Month_DateType]
GO
ALTER TABLE [dbo].[Nationalities]  WITH CHECK ADD  CONSTRAINT [FK_Nationalities_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nationalities] CHECK CONSTRAINT [FK_Nationalities_Logs]
GO
ALTER TABLE [dbo].[NotificationsIsRead]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsIsRead_Histories] FOREIGN KEY([FkHistory_Id])
REFERENCES [dbo].[Histories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationsIsRead] CHECK CONSTRAINT [FK_NotificationsIsRead_Histories]
GO
ALTER TABLE [dbo].[NotificationsIsRead]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsIsRead_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NotificationsIsRead] CHECK CONSTRAINT [FK_NotificationsIsRead_Users]
GO
ALTER TABLE [dbo].[PagesAllow]  WITH CHECK ADD  CONSTRAINT [FK_PagesAllow_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[PagesAllow] CHECK CONSTRAINT [FK_PagesAllow_Logs]
GO
ALTER TABLE [dbo].[PagesAllow]  WITH CHECK ADD  CONSTRAINT [FK_PagesAllow_Pages] FOREIGN KEY([FkPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesAllow] CHECK CONSTRAINT [FK_PagesAllow_Pages]
GO
ALTER TABLE [dbo].[PagesManagement]  WITH CHECK ADD  CONSTRAINT [FK_PagesManagement_PagesManagement] FOREIGN KEY([FKPrivilege_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesManagement] CHECK CONSTRAINT [FK_PagesManagement_PagesManagement]
GO
ALTER TABLE [dbo].[PagesManagement]  WITH CHECK ADD  CONSTRAINT [FK_PagesManagement_Seo] FOREIGN KEY([FKSeo_Id])
REFERENCES [dbo].[Seo] ([Id])
GO
ALTER TABLE [dbo].[PagesManagement] CHECK CONSTRAINT [FK_PagesManagement_Seo]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_Logs]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_Pages] FOREIGN KEY([FkPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_Pages]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_PagesRoles] FOREIGN KEY([Id])
REFERENCES [dbo].[PagesRoles] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_PagesRoles]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_PagesRoleTypes] FOREIGN KEY([FkPageRoleTypes_Id])
REFERENCES [dbo].[PagesRoleTypes] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_PagesRoleTypes]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_Roles] FOREIGN KEY([FkRole_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_Roles]
GO
ALTER TABLE [dbo].[PhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumbers_Phones] FOREIGN KEY([FKPhone_Id])
REFERENCES [dbo].[Phones] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneNumbers] CHECK CONSTRAINT [FK_PhoneNumbers_Phones]
GO
ALTER TABLE [dbo].[PhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumbers_PhoneTypes] FOREIGN KEY([FkPhoneType_Id])
REFERENCES [dbo].[PhoneTypes] ([Id])
GO
ALTER TABLE [dbo].[PhoneNumbers] CHECK CONSTRAINT [FK_PhoneNumbers_PhoneTypes]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Cities_Logs]
GO
ALTER TABLE [dbo].[SubMenus]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_Menu] FOREIGN KEY([FkMenu_Id])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[SubMenus] CHECK CONSTRAINT [FK_SubMenu_Menu]
GO
ALTER TABLE [dbo].[SubMenus]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[SubMenus] CHECK CONSTRAINT [FK_SubMenu_Pages]
GO
ALTER TABLE [dbo].[TechnicalSupportRead]  WITH CHECK ADD  CONSTRAINT [FK_TechnicalSupportRead_TechnicalSupport] FOREIGN KEY([FkTechnicalSupport_Id])
REFERENCES [dbo].[TechnicalSupport] ([Id])
GO
ALTER TABLE [dbo].[TechnicalSupportRead] CHECK CONSTRAINT [FK_TechnicalSupportRead_TechnicalSupport]
GO
ALTER TABLE [dbo].[TechnicalSupportRead]  WITH CHECK ADD  CONSTRAINT [FK_TechnicalSupportRead_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TechnicalSupportRead] CHECK CONSTRAINT [FK_TechnicalSupportRead_Users]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Addresses] FOREIGN KEY([FKAddress_Id])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Addresses]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Genders] FOREIGN KEY([FKGender_Id])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Genders]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Images] FOREIGN KEY([FkImage_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Images]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Jobs] FOREIGN KEY([FKJob_Id])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Jobs]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Languages] FOREIGN KEY([FKLanguage_Id])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Languages]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Nationalities] FOREIGN KEY([FkNationality_Id])
REFERENCES [dbo].[Nationalities] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Nationalities]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_SocialStatuses] FOREIGN KEY([FKSocialStatus_Id])
REFERENCES [dbo].[SocialStatus] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_SocialStatuses]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Users]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([FkRole_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Logs]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
/****** Object:  StoredProcedure [dbo].[InsertLog]    Script Date: 4/1/2019 12:28:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[InsertLog]
as 
begin 
insert Logs(CreateDateTime)values (GETDATE())
return scope_identity();
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPage]    Script Date: 4/1/2019 12:28:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertPage] 
@ResourceName nvarchar(50),
@IsControlPanel bit ,
@IsFronEnd bit
as 
begin 
insert Pages(ResourceName,Url,IsControlPanel,IsFronEnd)values (@ResourceName,@ResourceName,@IsControlPanel,@IsFronEnd)
return scope_identity();
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPageRles]    Script Date: 4/1/2019 12:28:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[InsertPageRles] 
@FkPage_Id int,
@FkPageRoleTypes_Id int ,
@FkRole_Id int,
@FkLog_Id int
as 
begin 
insert PagesRoles(FkPage_Id,FkPageRoleTypes_Id,FkRole_Id,FkLog_Id,IsCreate,IsDelete,IsDisplay,IsUpdate)values (@FkPage_Id,@FkPageRoleTypes_Id,@FkRole_Id,@FkLog_Id,1,1,1,1)
return scope_identity();
end
GO
USE [master]
GO
ALTER DATABASE [Tageer] SET  READ_WRITE 
GO
