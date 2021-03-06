/****** Object:  Schema [Ads]    Script Date: 6/19/2019 12:56:20 AM ******/
CREATE SCHEMA [Ads]
GO
/****** Object:  UserDefinedFunction [dbo].[CheckIfUserFavorite]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CheckIfUserFavorite] (@userId int , @adId int) returns bit as begin 



if((select count(*) from Ads.AdFavorites where FKAd_Id=@adId and FkUser_Id=@userId)>0)
return 1;
return 0;
end 
GO
/****** Object:  Table [Ads].[AdComment]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdDirectFieldDetails]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[AdFavorites]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[AdGroupsDetails]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[AdIndividualFieldsDetails]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[Ads]    Script Date: 6/19/2019 12:56:20 AM ******/
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
	[FkCategory_Id] [int] NOT NULL,
	[FkSubCategory_Id] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdVisitors]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[Categories]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKFile_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[DirectFields]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[Groups]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[GroupsDisplayTypes]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[GroupsDisplayTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKGroup_Id] [int] NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[GroupsItems]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[IndividualFields]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[RentalDirectFields]    Script Date: 6/19/2019 12:56:20 AM ******/
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
 CONSTRAINT [PK_RentalDirectFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalGroupsItems]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalGroupsItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKGroupsItem_Id] [int] NOT NULL,
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalIndividualFields]    Script Date: 6/19/2019 12:56:20 AM ******/
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
	[FKCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_CategoryInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalMarks]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMark_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKCategory_Id] [int] NULL,
 CONSTRAINT [PK_RentalMarks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalMaterials]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMaterial_Id] [int] NOT NULL,
	[FKSubCategory_Id] [int] NULL,
	[FKCategory_Id] [int] NULL,
 CONSTRAINT [PK_RentalMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalTimesTypes]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [Ads].[SubCategories]    Script Date: 6/19/2019 12:56:20 AM ******/
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
	[ImagesCount] [int] NOT NULL,
 CONSTRAINT [PK_RentalCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[AlbumFiles]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Albums]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[AppsInformation]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppsInformation](
	[Id] [int] NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Value] [ntext] NOT NULL,
	[FkFile_Id] [int] NULL,
 CONSTRAINT [PK_AppInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FkChat_Id] [int] NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkUser_Id_Starting] [int] NOT NULL,
	[FkUser_Id_Recived] [int] NOT NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKFile_Id] [int] NOT NULL,
	[CountryKey] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailsSubscriptions ]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailsSubscriptions ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailNewsLetter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileUrl] [nvarchar](150) NOT NULL,
	[FKAppInformation_Id] [int] NULL,
	[FkFileType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[InputsTypes]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[LanguageTypes]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Marks]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Martials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Nationalities]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationalities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Nationalities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TitleAr] [nvarchar](max) NOT NULL,
	[TitleEn] [nvarchar](max) NOT NULL,
	[DataTime] [datetime] NOT NULL,
	[IsAlsoToAdmin] [bit] NOT NULL,
	[BodyAr] [nvarchar](max) NOT NULL,
	[BodyEn] [nvarchar](max) NOT NULL,
	[FkPage_Id] [int] NULL,
	[TargetId] [int] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[PagesManagement]    Script Date: 6/19/2019 12:56:20 AM ******/
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
 CONSTRAINT [PK_PagesManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesRoles]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsCreate] [bit] NOT NULL,
	[IsUpdate] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[FkPage_Id] [int] NOT NULL,
	[IsDisplay] [bit] NOT NULL,
	[FkUser_Id] [int] NOT NULL,
 CONSTRAINT [PK_PagesRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKCountry_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seo]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[SubMenus]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[TechnicalSupport]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalSupport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_TechnicalSupport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [int] NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[FkImage_Id] [int] NOT NULL,
	[FKAddress_Id] [int] NULL,
	[FKGender_Id] [int] NULL,
	[FKLanguage_Id] [int] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/19/2019 12:56:20 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/19/2019 12:56:20 AM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersPrivateNotifies]    Script Date: 6/19/2019 12:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPrivateNotifies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkUser_Id] [int] NOT NULL,
	[FKNotification_Id] [bigint] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_UsersPrivateNotify] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Ads].[AdComment] ON 
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (1, N'cddddddddc', CAST(N'2019-04-19T19:15:16.887' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (2, N'cddddddddc', CAST(N'2019-04-19T19:15:36.027' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (3, N'cddddddddc', CAST(N'2019-04-19T19:16:11.147' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (4, N'cddddddddcfdfdf', CAST(N'2019-04-19T19:16:16.017' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (5, N'جيد', CAST(N'2019-04-19T19:16:21.103' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (6, N'رابع', CAST(N'2019-04-19T19:16:26.860' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (7, N'ممتاز', CAST(N'2019-04-19T19:17:31.487' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (8, N'ممتازبيب', CAST(N'2019-04-19T19:17:53.937' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (9, N'fdf', CAST(N'2019-04-19T19:19:42.773' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (10, N'ee', CAST(N'2019-04-19T19:20:01.060' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (11, N'kk', CAST(N'2019-04-19T19:30:14.613' AS DateTime), 14, 12)
GO
INSERT [Ads].[AdComment] ([Id], [Comment], [DateTime], [FKAd_Id], [FkUser_Id]) VALUES (12, N'eeeeee', CAST(N'2019-04-19T19:31:47.143' AS DateTime), 14, 12)
GO
SET IDENTITY_INSERT [Ads].[AdComment] OFF
GO
INSERT [Ads].[AdDirectFieldDetails] ([AdId], [FKArea_Id], [FKSize_Id], [FKLocation_Id], [FKMatrial_Id], [FKNationality_Id], [FKMark_Id], [FkCountry_Id], [FkProvince_Id]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL)
GO
SET IDENTITY_INSERT [Ads].[AdFavorites] ON 
GO
INSERT [Ads].[AdFavorites] ([Id], [FkUser_Id], [FKAd_Id]) VALUES (23, 12, 14)
GO
SET IDENTITY_INSERT [Ads].[AdFavorites] OFF
GO
SET IDENTITY_INSERT [Ads].[AdIndividualFieldsDetails] ON 
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
INSERT [Ads].[Ads] ([Id], [Title], [Description], [Price], [FkRentalTimesType_Id], [FKAlbum_Id], [FkUser_Id], [FkCategory_Id], [FkSubCategory_Id], [CreateDateTime]) VALUES (14, N'مرسيدس', N'احلى سيارة', CAST(200.00 AS Decimal(18, 2)), 1, 39, 9, 2, 7, CAST(N'2019-01-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [Ads].[Ads] OFF
GO
SET IDENTITY_INSERT [Ads].[Categories] ON 
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id]) VALUES (1, N'عقارات', N'Real estate', 127)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id]) VALUES (2, N'مركبات', N'Vehicles', 128)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id]) VALUES (4, N'لوازم الافراح', N'Wedding Tools', 135)
GO
INSERT [Ads].[Categories] ([Id], [NameAr], [NameEn], [FKFile_Id]) VALUES (7, N'تجربة فئة', N'category test', 142)
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
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (12, 3, 5, NULL, 7)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (13, 9, 5, 7, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (14, 4, 4, 7, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (15, 3, 4, NULL, 1)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (16, 4, 5, NULL, 1)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (17, 9, 5, 12, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (18, 4, 4, 12, 2)
GO
INSERT [Ads].[GroupsDisplayTypes] ([Id], [FKGroup_Id], [FKInputType_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (19, 2, 4, 12, 2)
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
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (17, 1, NULL, 7, 1)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (18, 0, NULL, 7, 3)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (19, 0, NULL, 7, 5)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (20, 1, NULL, 7, 6)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (21, 0, NULL, 7, 7)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (22, 0, NULL, 7, 8)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (23, 0, 7, 2, 3)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (24, 0, 7, 2, 7)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (25, 0, 7, 2, 8)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (26, 0, NULL, 1, 5)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (27, 1, NULL, 1, 7)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (28, 0, NULL, 1, 8)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (29, 0, 11, 1, 3)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (30, 0, 11, 1, 5)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (31, 0, 11, 1, 7)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (32, 1, 12, 2, 3)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (33, 1, 12, 2, 7)
GO
INSERT [Ads].[RentalDirectFields] ([Id], [IsRequired], [FkSubCategory_Id], [FkCategory_Id], [FkDirectField_Id]) VALUES (34, 1, 12, 2, 8)
GO
SET IDENTITY_INSERT [Ads].[RentalDirectFields] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalGroupsItems] ON 
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (57, NULL, 6, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (58, NULL, 7, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (59, NULL, 11, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (60, NULL, 12, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (61, NULL, 13, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (62, NULL, 14, 7)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (63, 7, 51, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (64, 7, 52, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (65, 7, 22, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (66, 7, 23, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (67, NULL, 6, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (68, NULL, 7, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (69, NULL, 8, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (70, NULL, 11, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (71, NULL, 14, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (72, 11, 6, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (73, 11, 8, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (74, NULL, 16, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (75, NULL, 21, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (76, NULL, 27, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (77, NULL, 28, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (78, NULL, 32, 1)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (79, 12, 4, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (80, 12, 5, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (81, 12, 22, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (82, 12, 23, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (83, 12, 51, 2)
GO
INSERT [Ads].[RentalGroupsItems] ([Id], [FKSubCategory_Id], [FKGroupsItem_Id], [FKCategory_Id]) VALUES (84, 12, 52, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalGroupsItems] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalIndividualFields] ON 
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (52, 1, 0, 9, 20, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (54, 0, 0, NULL, 14, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (55, 1, 0, NULL, 17, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (56, 1, 0, NULL, 20, 7)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (57, 0, 0, 7, 2, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (58, 1, 0, 7, 14, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (59, 0, 0, 7, 16, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (60, 0, 0, 7, 19, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (61, 1, 0, 7, 20, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (62, 1, 1, NULL, 1, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (63, 0, 0, NULL, 2, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (64, 0, 0, NULL, 3, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (65, 1, 1, NULL, 5, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (66, 1, 1, NULL, 9, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (67, 1, 1, NULL, 10, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (68, 1, 0, NULL, 11, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (69, 0, 0, NULL, 13, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (70, 0, 0, NULL, 19, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (71, 0, 0, 4, 5, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (72, 1, 0, 4, 14, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (73, 1, 0, 4, 20, 1)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (74, 1, 0, 12, 2, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (75, 1, 0, 12, 14, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (76, 0, 0, 12, 15, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (77, 0, 0, 12, 16, 2)
GO
INSERT [Ads].[RentalIndividualFields] ([Id], [IsRequired], [IsBar], [FKSubCategory_Id], [FkIndividualField_Id], [FKCategory_Id]) VALUES (78, 1, 0, 12, 20, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalIndividualFields] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalMarks] ON 
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (13, 2, 7, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (14, 3, 7, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (15, 4, 7, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (16, 5, 7, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (17, 3, 8, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (18, 10, 8, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (19, 3, NULL, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (20, 5, NULL, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (21, 6, NULL, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (22, 10, NULL, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (23, 4, 10, 7)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (24, 2, 11, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (25, 10, 11, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (26, 2, NULL, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (27, 3, NULL, 1)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (28, 2, 12, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (29, 3, 12, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (30, 4, 12, 2)
GO
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (31, 5, 12, 2)
GO
SET IDENTITY_INSERT [Ads].[RentalMarks] OFF
GO
SET IDENTITY_INSERT [Ads].[RentalMaterials] ON 
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (7, 5, 9, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (8, 7, 9, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (9, 6, NULL, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (10, 5, 10, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (11, 7, 10, 7)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (12, 6, 11, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (13, 7, 11, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (14, 5, NULL, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (15, 7, NULL, 1)
GO
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKSubCategory_Id], [FKCategory_Id]) VALUES (16, 6, 4, 1)
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
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (3, N'فيلا', N'Villa', 1, 132, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (4, N'عمارة', N'ٍٍSpire', 1, 133, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (5, N'ميكب', N'Makeup', 4, 138, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (6, N'تصوير فديو', N'Video', 4, 139, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (7, N'سيارات', N'Cars', 2, 140, 5)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (8, N'موتسيكلات', N'Motorcycle', 2, 141, 3)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (9, N'تجربة فئة فرعية', N'sub category test', 7, 143, 2)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (10, N'تجربة فئة فرعية 2', N'sub category test 2', 7, 144, 3)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (11, N'شقة', N'Apartment', 1, 145, 4)
GO
INSERT [Ads].[SubCategories] ([Id], [NameAr], [NameEn], [FKCategory_Id], [FKImage_Id], [ImagesCount]) VALUES (12, N'اتوبيسات', N'bus', 2, 146, 4)
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
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkProvince_Id], [City]) VALUES (8, N'dsdsd', NULL, 2, NULL, NULL)
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
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (1, N'ControllPanelLink', N'http://localhost:42004/', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (2, N'ApiLink', N'http://localhost:50353/', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (3, N'ApiFiles', N'http://localhost:42003/', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (4, N'AboutUsEn', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (5, N'AboutUsAr', N'هذا النص يمكن تحديثة من لوحة التحكم ', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (6, N'AddressEn', N'28 gada street', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (7, N'AddressAr', N'28 شارع جدة بـ السعودية', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (8, N'Phone', N'01013056689', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (9, N'Email', N'sezer@gmail.com', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (10, N'AboutUsImage', N's', 174)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (11, N'FaceBook', N'http://localhost:42003/', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (12, N'Twitter', N'http://localhost:42003/', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (13, N'FooterDescriptionAr', N'هذا النص يمكن تحديثة من لوحة التحكم ', NULL)
GO
INSERT [dbo].[AppsInformation] ([Id], [ResourceName], [Value], [FkFile_Id]) VALUES (14, N'FooterDescriptionEn', N'fdfdf', NULL)
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 
GO
INSERT [dbo].[Areas] ([Id], [Width], [Length], [Height]) VALUES (1, 2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] ON 
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (1, 9, 1, N'A 1', CAST(N'2019-04-30T00:02:29.070' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (2, 12, 1, N'A 2', CAST(N'2019-04-30T00:02:30.287' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (3, 9, 1, N'A 3', CAST(N'2019-04-30T00:15:04.057' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (4, 12, 1, N'A 4', CAST(N'2019-04-30T00:15:05.747' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (5, 9, 1, N'A 5', CAST(N'2019-04-30T00:33:59.973' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (6, 12, 1, N'A 6', CAST(N'2019-04-30T00:34:05.490' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (7, 9, 1, N'A 7', CAST(N'2019-04-30T00:34:09.527' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (8, 12, 1, N'A 8', CAST(N'2019-04-30T00:34:14.120' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (9, 9, 1, N'A 10', CAST(N'2019-04-30T00:34:18.260' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (10, 12, 1, N'A 11', CAST(N'2019-04-30T00:34:26.420' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (11, 9, 1, N'A 12', CAST(N'2019-04-30T00:34:30.280' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (12, 12, 1, N'A13', CAST(N'2019-05-02T14:22:46.960' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (13, 9, 1, N'A13', CAST(N'2019-05-02T14:22:49.323' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (14, 12, 1, N'A15', CAST(N'2019-05-02T14:36:47.283' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (15, 9, 1, N'A16', CAST(N'2019-05-02T14:38:20.183' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (16, 12, 1, N'A17', CAST(N'2019-05-02T14:41:24.020' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (17, 9, 1, N'A18', CAST(N'2019-05-02T14:43:19.040' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (18, 12, 1, N'A19
', CAST(N'2019-05-02T14:43:51.267' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (19, 9, 1, N'A18', CAST(N'2019-05-02T14:43:58.650' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (20, 12, 1, N'A20', CAST(N'2019-05-02T14:44:08.357' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (21, 9, 1, N'A21', CAST(N'2019-05-02T14:44:29.780' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (22, 12, 1, N'الحمد لله', CAST(N'2019-05-02T14:44:40.983' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (23, 9, 1, N'الله اكبر', CAST(N'2019-05-02T14:46:10.853' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (24, 12, 1, N'لا اله الا الله', CAST(N'2019-05-02T14:46:21.190' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (25, 12, 2, N'a
', CAST(N'2019-05-02T15:01:34.697' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (26, 12, 2, N'a
', CAST(N'2019-05-02T15:01:37.813' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (27, 12, 3, N'0', CAST(N'2019-05-02T15:02:32.200' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (28, 12, 3, N'1', CAST(N'2019-05-02T15:06:52.210' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (29, 12, 3, N'2', CAST(N'2019-05-02T15:06:55.703' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (30, 12, 3, N'8', CAST(N'2019-05-02T15:06:59.593' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (31, 12, 3, N'5', CAST(N'2019-05-02T15:07:03.470' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (32, 12, 4, N'0', CAST(N'2019-05-02T15:09:03.297' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (33, 12, 1, N'0
', CAST(N'2019-05-02T15:19:07.313' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (34, 12, 3, N'1', CAST(N'2019-05-02T17:41:38.260' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (35, 12, 2, N'1', CAST(N'2019-05-02T19:14:59.340' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([Id], [FkUser_Id], [FkChat_Id], [Message], [DateTime]) VALUES (36, 12, 4, N'ببيبيب', CAST(N'2019-05-02T19:15:21.960' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Chats] ON 
GO
INSERT [dbo].[Chats] ([Id], [FkUser_Id_Starting], [FkUser_Id_Recived]) VALUES (1, 12, 9)
GO
INSERT [dbo].[Chats] ([Id], [FkUser_Id_Starting], [FkUser_Id_Recived]) VALUES (2, 12, 1)
GO
INSERT [dbo].[Chats] ([Id], [FkUser_Id_Starting], [FkUser_Id_Recived]) VALUES (3, 12, 2)
GO
INSERT [dbo].[Chats] ([Id], [FkUser_Id_Starting], [FkUser_Id_Recived]) VALUES (4, 12, 3)
GO
SET IDENTITY_INSERT [dbo].[Chats] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FKFile_Id], [CountryKey]) VALUES (1, N'مصر', N'Egypt', 82, N'20')
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FKFile_Id], [CountryKey]) VALUES (2, N'الكويت', N'Kwit', 83, N'12')
GO
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FKFile_Id], [CountryKey]) VALUES (4, N'قطر', N'qutr', 125, N'11')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailsSubscriptions ] ON 
GO
INSERT [dbo].[EmailsSubscriptions ] ([Id], [Email], [CreateDateTime]) VALUES (1, N'sezer.info.0@gmail.com', CAST(N'2019-04-27T01:54:10.177' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EmailsSubscriptions ] OFF
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
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (9, N'/TageerFiles/Files/Images/Users/User1.jpg', 3, 1)
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
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (43, N'/Files/Images/Users/User1.jpg', 3, 1)
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
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (83, N'/Files/images/FlagsMiniSvg/antigua-and-barbuda.svg', 1, 1)
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
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (124, N'/Files/Images/Users/User2.jpg', 3, 1)
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
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (135, N'/Files/Images/Tageer-Photo-e944ac81-7422-473b-b512-968e8eddd8b3..jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (136, N'/Files/Images/Tageer-Photo-f218fe04-5cb1-475d-ba7b-8c88513db34e..jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (137, N'/Files/Images/Tageer-Photo-8445e9c0-353a-409e-978d-bd67e7642d0b..jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (138, N'/Files/Images/Tageer-Photo-3e56a9d7-08be-4b50-ba3a-5579812b0527.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (139, N'/Files/Images/Tageer-Photo-03664d20-c9bc-44c2-a664-8b7085d1490b.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (140, N'/Files/Images/Tageer-Photo-7e62d01d-f9d2-4bce-939f-3914294a08ef.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (141, N'/Files/Images/Tageer-Photo-846be0a0-1341-458d-b67e-3199f8317154.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (142, N'/Files/Images/Tageer-Photo-854a5d2e-0efa-4858-bcd4-56d8e14f98f2.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (143, N'/Files/Images/Tageer-Photo-3b39b56e-d8a3-41ae-a877-cf2209a7e9a4.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (144, N'/Files/Images/Tageer-Photo-13308857-1a1f-460c-b3ce-5c543e4870a0.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (145, N'/Files/Images/Tageer-Photo-c5fc1a1e-b07b-419c-9833-5aae4018a07e.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (146, N'/Files/Images/Tageer-Photo-45a1481d-8746-4cbd-8346-44afd81c87c1.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (147, N'/Files/Images/Tageer-Photo-b17a7391-b55f-419f-9d69-bf81c6f74b9c.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (148, N'/Files/Images/Tageer-Photo-071c3c27-4b67-41a1-856d-041015a08d48.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (149, N'/Files/Images/Tageer-Photo-934785d6-6ace-49c9-9a8b-c0623efc860e.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (150, N'/Files/Images/Tageer-Photo-8bf05792-8e48-4cb1-b89f-c85578a5bdbe.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (151, N'/Files/Images/Tageer-Photo-a3c340c3-c99a-41a0-a1ad-f0e076eabb95.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (152, N'/Files/Images/Tageer-Photo-a35c2234-d3f7-46a3-8ff9-d34ddfd57c28.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (153, N'/Files/Images/Tageer-Photo-a4f0d366-9398-4b80-8c4e-43140a97b3f4.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (154, N'/Files/Images/Tageer-Photo-6ee88844-7a94-44cc-b596-61df6e16df22.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (155, N'/Files/Images/Tageer-Photo-b3f963d8-84d0-42f8-aab3-559feb676b38.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (156, N'/Files/Images/Tageer-Photo-93bd93bd-28d5-4501-9ad5-0af07c36c357.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (157, N'/Files/Images/Tageer-Photo-7a57fb1d-bd1f-4eeb-b543-23487e04644c.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (158, N'/Files/Images/Tageer-Photo-a77b4e9b-f972-4ed7-b85b-8533b5119529.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (159, N'/Files/Images/Tageer-Photo-b1edfe52-9d64-4a1c-a538-af73bd0e2cc8.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (160, N'/Files/Images/Tageer-Photo-690ad32b-816f-481c-9ced-dd92e1a01636.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (161, N'/Files/Images/Tageer-Photo-5cdea4fb-3360-4cd1-b320-c72341e0cb08.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (162, N'/Files/Images/Tageer-Photo-078d0441-92d6-472b-8a9c-358b88558d0f.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (163, N'/Files/Images/Tageer-Photo-1964a537-918f-4aab-8559-ee25ef57a1a9.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (164, N'/Files/Images/Tageer-Photo-d7001d7a-92b6-4281-a517-a2e89343f7ff.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (165, N'/Files/Images/Tageer-Photo-01e22079-e60c-4240-afb2-89dea6e9740c.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (166, N'/Files/Images/Tageer-Photo-3f262758-0117-446e-b2b8-1877f0404968.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (167, N'/Files/Images/Tageer-Photo-c65b47a4-aa9f-46a8-a5c0-7396dfc3fb0c.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (168, N'/Files/Images/Tageer-Photo-79c5d1c4-34fe-4126-8260-0c6b3130ae6d.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (169, N'/Files/Images/Tageer-Photo-f9dace1e-3c4d-4149-b43c-32706ef65d72.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (170, N'/Files/Images/Tageer-Photo-d8c64456-1937-425f-8cf7-d8bba9589940.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (171, N'/Files/Images/Tageer-Photo-2ed83e6a-6e42-4538-8817-40ae0b8af95f.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (172, N'/Files/Images/Tageer-Photo-975e8031-d947-4543-9247-a1ac41814907.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (173, N'/Files/Images/Tageer-Photo-3fb92c74-7c83-4e93-866c-762043c896f2.jpg', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (174, N'd', 3, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (175, N'~/Files/Images/Users/Profile/User2.jpg433997728.jpg', 1, 1)
GO
INSERT [dbo].[Files] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (176, N'http://localhost:42004//Files/images/FlagsMiniSvg/egypt.svg', 1, 1)
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
SET IDENTITY_INSERT [dbo].[LanguageTypes] ON 
GO
INSERT [dbo].[LanguageTypes] ([Id], [ResourceName], [Code]) VALUES (1, N'Arabic', N'ar')
GO
INSERT [dbo].[LanguageTypes] ([Id], [ResourceName], [Code]) VALUES (2, N'English', N'en')
GO
SET IDENTITY_INSERT [dbo].[LanguageTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([Id], [Longitude], [Latitude]) VALUES (1, N'1سي', N'545341ي')
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (2, N'لانسر', N'lancer')
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (3, N'مرسيدس', N'Mercedes')
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (4, N'تويتا', N'toyota')
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (5, N'هوندا', N'honda')
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (6, N'تمبرلي لندن', N'Temperley London')
GO
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn]) VALUES (10, N'فالنتينو', N'Valentino')
GO
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn]) VALUES (5, N'بلستر', N'Polyester')
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn]) VALUES (6, N'حرير', N'Silk')
GO
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn]) VALUES (7, N'ستان', N'Stan')
GO
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (1, 1, N'fa fa-gears', N'Setting')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (2, 3, N'fa fa-users', N'Users')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (7, 4, N'far fa-hand-point-right', N'TechnicalSupport')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (8, 2, N'icon-settings', N'RentalSetting')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (10, 6, N'glyphicon glyphicon-tasks', N'FieldSettings')
GO
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (11, 7, N'glyphicon glyphicon-tasks', N'Ads')
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationalities] ON 
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn]) VALUES (1, N'مصرى', N'Egeiption')
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn]) VALUES (2, N'سعودى', N'Saudi')
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn]) VALUES (3, N'كويتى', N'Kuwaiti')
GO
INSERT [dbo].[Nationalities] ([Id], [NameAr], [NameEn]) VALUES (4, N'جزائرى', N'Algerian')
GO
SET IDENTITY_INSERT [dbo].[Nationalities] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([Id], [TitleAr], [TitleEn], [DataTime], [IsAlsoToAdmin], [BodyAr], [BodyEn], [FkPage_Id], [TargetId]) VALUES (2, N'k', N'kk', CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, N'hb', N'ijiji', NULL, NULL)
GO
INSERT [dbo].[Notifications] ([Id], [TitleAr], [TitleEn], [DataTime], [IsAlsoToAdmin], [BodyAr], [BodyEn], [FkPage_Id], [TargetId]) VALUES (3, N'mm', N'kk', CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, N'hb', N'ijiji', NULL, NULL)
GO
INSERT [dbo].[Notifications] ([Id], [TitleAr], [TitleEn], [DataTime], [IsAlsoToAdmin], [BodyAr], [BodyEn], [FkPage_Id], [TargetId]) VALUES (4, N'kl', N'kk', CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, N'hb', N'ijiji', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (2, N'Users', 1, 0, N'Users')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (4, N'Countries', 1, 0, N'Countries')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (5, N'PagesRoles', 1, 0, N'PagesRoles')
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
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (27, N'DatesTypes', 1, 1, N'DatesTypes')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (28, N'AppInformations', 1, 1, N'AppInformations')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (29, N'Dates', 1, 0, N'Dates')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (30, N'MangeUsers', 1, 1, N'MangeUsers')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (31, N'RentalTypes', 1, 1, N'RentalTypes')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (33, N'Marks', 1, 1, N'Marks')
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
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (43, N'Ads', 1, 0, N'Ads')
GO
INSERT [dbo].[Pages] ([Id], [ResourceName], [IsControlPanel], [IsFronEnd], [Url]) VALUES (44, N'EmailsSubscriptions', 1, 0, N'EmailsSubscriptions ')
GO
SET IDENTITY_INSERT [dbo].[PagesRoles] ON 
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (8, 0, 0, 1, 17, 0, 1)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (9, 1, 0, 0, 18, 0, 1)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (10, 0, 1, 0, 5, 0, 1)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (11, 0, 0, 1, 17, 0, 1)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (12, 1, 0, 0, 18, 0, 1)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [IsDisplay], [FkUser_Id]) VALUES (13, 0, 1, 0, 33, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[PagesRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id]) VALUES (1, N'القاهرة', N'Cairo', 1)
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id]) VALUES (18, N'المنصورة', N'Mansoura -', 1)
GO
INSERT [dbo].[Provinces] ([Id], [NameAr], [NameEn], [FKCountry_Id]) VALUES (19, N'الاسكندرية', N'Alx', 1)
GO
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (1, N'Manager', NULL)
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (2, N'Supervisor', NULL)
GO
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (3, N'Client', NULL)
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
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (8, 4, N'icon-pointer', 1, 4)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (9, 5, N'icon-direction', 1, 5)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (11, 7, N'icon-grid', 1, 7)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (16, 2, N'icon-user-following', 2, 8)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (23, 1, N'fas fa-not-equal', 7, 16)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (24, 8, N'icon-list', 1, 17)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (25, 9, N'icon-list', 1, 18)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (26, 1, N'fa fa-ellipsis-v', 8, 19)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (27, 2, N'fa fa-ellipsis-h', 8, 20)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (30, 10, N'icon-map', 1, 23)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (33, 3, N'icon-speedometer', 1, 28)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1033, 2, N'icon-bar-chart', 10, 35)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1034, 3, N'icon-layers', 10, 40)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1035, 4, N'icon-mouse', 10, 38)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1036, 12, N'icon-badge', 1, 33)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1037, 5, N'icon-directions', 10, 41)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1038, 12, N'glyphicon glyphicon-fire', 1, 36)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1039, 6, N'icon-vector', 10, 37)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1040, 1, N'icon-loop', 10, 42)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1041, 1, N'fa fa-users', 2, 2)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (2043, 1, N'icon-loop', 11, 43)
GO
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (2044, 3, N'glyphicon glyphicon-envelope
', 2, 44)
GO
SET IDENTITY_INSERT [dbo].[SubMenus] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupport] ON 
GO
INSERT [dbo].[TechnicalSupport] ([Id], [UserName], [Email], [Subject], [Message], [CreateDateTime], [IsRead]) VALUES (1, N'Mazad', N'a0hmed@gmail.com', N'maximum number of stream targets', N'kmmkm', CAST(N'2019-04-26T23:21:27.103' AS DateTime), 0)
GO
INSERT [dbo].[TechnicalSupport] ([Id], [UserName], [Email], [Subject], [Message], [CreateDateTime], [IsRead]) VALUES (2, N'sdsd', N'a0hmed@gmail.com', N'kdsd', N'ddf', CAST(N'2019-04-26T23:24:17.973' AS DateTime), 0)
GO
INSERT [dbo].[TechnicalSupport] ([Id], [UserName], [Email], [Subject], [Message], [CreateDateTime], [IsRead]) VALUES (3, N'Mazad', N'a0hmed@gmail.com', N'maximum number of stream', N'ddfd', CAST(N'2019-04-26T23:24:56.993' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[TechnicalSupport] OFF
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (1, N'Ahmed', 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (2, N'Aya', 2, 2, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (3, N'xxqq1', 27, 3, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (5, N'ghjklkn8888', 29, 5, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (9, N'', 43, 6, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (10, N'', 104, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (11, N'', 105, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (12, N'', 124, 7, NULL, 1, N'01025249400')
GO
INSERT [dbo].[UserInformation] ([Id], [FullName], [FkImage_Id], [FKAddress_Id], [FKGender_Id], [FKLanguage_Id], [PhoneNumber]) VALUES (13, N'ahmed', 175, 8, NULL, 1, N'01025249400')
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
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2244, CAST(N'2019-04-19T18:18:12.383' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2245, CAST(N'2019-04-19T22:19:51.513' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2246, CAST(N'2019-04-19T22:20:09.553' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2247, CAST(N'2019-04-19T22:22:41.643' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2248, CAST(N'2019-04-19T22:23:50.937' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2249, CAST(N'2019-04-27T01:54:48.203' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2250, CAST(N'2019-04-29T18:34:08.090' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2251, CAST(N'2019-04-29T18:37:19.787' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2252, CAST(N'2019-04-29T19:16:59.007' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2253, CAST(N'2019-04-29T23:00:33.867' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2254, CAST(N'2019-04-29T23:04:02.750' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2255, CAST(N'2019-04-29T23:04:42.930' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2256, CAST(N'2019-05-02T14:22:11.403' AS DateTime), 1, 12)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2257, CAST(N'2019-05-11T00:21:35.710' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2258, CAST(N'2019-05-11T00:21:39.923' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2259, CAST(N'2019-05-11T00:52:45.863' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2260, CAST(N'2019-05-11T02:20:16.343' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2261, CAST(N'2019-05-11T04:02:34.793' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2262, CAST(N'2019-05-11T04:02:38.780' AS DateTime), 1, 1)
GO
INSERT [dbo].[UserLogins] ([Id], [LoginDate], [IsSuccess], [FkUser_Id]) VALUES (2263, CAST(N'2019-05-14T23:08:36.910' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (12, 2, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (13, 3, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (16, 5, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (20, 9, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (21, 10, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (22, 11, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (23, 12, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [FkUser_Id], [FkRole_Id]) VALUES (24, 13, 3)
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (1, N'ahmed', N'ahmed@gmail.com', N'123456', 0, CAST(N'2012-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (2, N'AYa', N'sezer.info.0@gmail.com', N'123456', 0, CAST(N'2018-08-26T23:41:08.133' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (3, N'ahmedw', N'ahmednageeb@gmail.com', N'123456', 0, CAST(N'2018-08-30T16:57:19.937' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (5, N'sasasa', N'dowqnlaodvid1eoyou@gmail.com', N'123456', 0, CAST(N'2018-08-30T17:19:26.103' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (9, N'ahmeddd@gmail_com', N'ahmeddd@gmail.com', N'123456', 0, CAST(N'2018-08-30T21:09:50.823' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (10, N'ahmed0', N'ahmsed@gmail.com', N'123456', 0, CAST(N'2018-10-13T06:16:34.190' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (11, N'ahmedv0', N'avhmsed@gmail.com', N'123456', 1, CAST(N'2018-10-13T06:17:07.607' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (12, N'ahme0dna', N'a0hmed@gmail.com', N'123456', 0, CAST(N'2018-10-15T19:59:59.547' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [IsBlocked], [CreateDate]) VALUES (13, N'ahmed044', N'a@a.com', N'123456', 0, CAST(N'2019-05-11T01:09:58.490' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersPrivateNotifies] ON 
GO
INSERT [dbo].[UsersPrivateNotifies] ([Id], [FkUser_Id], [FKNotification_Id], [IsRead]) VALUES (1, 1, 4, 1)
GO
INSERT [dbo].[UsersPrivateNotifies] ([Id], [FkUser_Id], [FKNotification_Id], [IsRead]) VALUES (2, 1, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[UsersPrivateNotifies] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email]    Script Date: 6/19/2019 12:56:21 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserName]    Script Date: 6/19/2019 12:56:21 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Ads].[RentalIndividualFields] ADD  CONSTRAINT [DF_RentalCategoryInputs_FKRentalCategory_Id]  DEFAULT ((0)) FOR [FKSubCategory_Id]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_IsAlsoToAdmin]  DEFAULT ((0)) FOR [IsAlsoToAdmin]
GO
ALTER TABLE [dbo].[TechnicalSupport] ADD  CONSTRAINT [DF_TechnicalSupport_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[UsersPrivateNotifies] ADD  CONSTRAINT [DF_UsersPrivateNotify_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_Ads]
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
ON DELETE CASCADE
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
ALTER TABLE [dbo].[AppsInformation]  WITH CHECK ADD  CONSTRAINT [FK_AppsInformation_Files] FOREIGN KEY([FkFile_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[AppsInformation] CHECK CONSTRAINT [FK_AppsInformation_Files]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessages_Chats] FOREIGN KEY([FkChat_Id])
REFERENCES [dbo].[Chats] ([Id])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_ChatMessages_Chats]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessages_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_ChatMessages_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users] FOREIGN KEY([FkUser_Id_Starting])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users1] FOREIGN KEY([FkUser_Id_Recived])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users1]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Files] FOREIGN KEY([FKFile_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Files]
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
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Pages] FOREIGN KEY([FkPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Pages]
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
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_Pages] FOREIGN KEY([FkPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_Pages]
GO
ALTER TABLE [dbo].[PagesRoles]  WITH CHECK ADD  CONSTRAINT [FK_PagesRoles_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[PagesRoles] CHECK CONSTRAINT [FK_PagesRoles_Users]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Cities_Countries]
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
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Languages] FOREIGN KEY([FKLanguage_Id])
REFERENCES [dbo].[LanguageTypes] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Languages]
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
ALTER TABLE [dbo].[UsersPrivateNotifies]  WITH CHECK ADD  CONSTRAINT [FK_UsersPrivateNotifies_Notifications] FOREIGN KEY([FKNotification_Id])
REFERENCES [dbo].[Notifications] ([Id])
GO
ALTER TABLE [dbo].[UsersPrivateNotifies] CHECK CONSTRAINT [FK_UsersPrivateNotifies_Notifications]
GO
ALTER TABLE [dbo].[UsersPrivateNotifies]  WITH CHECK ADD  CONSTRAINT [FK_UsersPrivateNotifies_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersPrivateNotifies] CHECK CONSTRAINT [FK_UsersPrivateNotifies_Users]
GO
/****** Object:  StoredProcedure [dbo].[GetAdIndividualFieldsDetails]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[GetAdIndividualFieldsDetails]
@adId int
as begin 
select 
AdIndividualFieldsDetails. FkIndividualField_Id,
AdIndividualFieldsDetails.Value,
IndividualFields.ResourcesName as IndividualFieldsResourcesName
 from Ads.AdIndividualFieldsDetails
	
	join ads.IndividualFields on IndividualFields.Id=AdIndividualFieldsDetails.FkIndividualField_Id
	where AdIndividualFieldsDetails.Id=@adId
end
GO
/****** Object:  StoredProcedure [dbo].[GetNotificationsByFilter]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetNotificationsByFilter]
@skip int , @take int , @userId int , @isRead bit , @isAlsoToAdmin bit
as begin
select 
Notifications.Id, Notifications.TitleAr,
Notifications.TitleEn, Notifications.BodyAr,
Notifications.BodyEn, Notifications.DataTime, UsersPrivateNotifies.IsRead
,(
select count(*) from Notifications left join UsersPrivateNotifies on UsersPrivateNotifies.FkNotification_Id=Notifications.Id 
 and UsersPrivateNotifies.FkUser_Id=@userId where  (UsersPrivateNotifies.IsRead is null or UsersPrivateNotifies.IsRead=@isRead )
)as 'NotificationCount' 

from Notifications
left join UsersPrivateNotifies
 on UsersPrivateNotifies.FkNotification_Id=Notifications.Id  and UsersPrivateNotifies.FkUser_Id=@userId
 where 
 (
	(@isRead =0 and UsersPrivateNotifies.IsRead is null or UsersPrivateNotifies.IsRead=0) 
 or (@isRead is null ) 
 or ( UsersPrivateNotifies.IsRead =@isRead) )

 and
  IsAlsoToAdmin=@isAlsoToAdmin

 order by Notifications.Id desc 
 offset @skip rows 
 Fetch next @take rows only 
 end


 
GO
/****** Object:  StoredProcedure [dbo].[GetTechnicalSupports]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[GetTechnicalSupports]
 @skip int,
 @take int,
 @isRead bit
 as begin
select * from TechnicalSupport 
where 
 (@isRead is null or TechnicalSupport.IsRead=@isRead)
 
 order by Id desc 
 offset @skip rows
 fetch next @take rows only

 end

 
GO
/****** Object:  StoredProcedure [dbo].[GetUserNotifications]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetUserNotifications]
	@userId int ,
	@lastNotifiId bigint,
	@takeCount int 

	as begin
select 
		Notifications.Id, 
		Notifications.TitleAr, 
		Notifications.TitleEn, 
		Notifications.DataTime
		from UsersPrivateNotifies 

join Notifications on Notifications.Id=UsersPrivateNotifies.FkNotification_Id

where UsersPrivateNotifies.FkUser_Id=@userId 
and (@lastNotifiId =0 or Notifications.Id<@lastNotifiId)

order by Notifications.Id desc
offset 0 rows
fetch next @takeCount rows only
end 
GO
/****** Object:  StoredProcedure [dbo].[SeelctChatByUserRecivedName]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SeelctChatByUserRecivedName] 
@UserName nvarchar(50),
@UserLoggedId int 

as begin

select 
	Chats.Id,
	UserRecived.Id as UserId ,
	 UserRecived.UserName,
	 UserInformation.FullName as UserFullName,
	(AppsInformation.Value+Files.FileUrl) as UserImage 


 from Users as UserRecived
 
 join UserInformation on UserInformation.Id=UserRecived.Id 
 join Files on Files.Id=UserInformation.FkImage_Id
 join AppsInformation on AppsInformation.Id=Files.FKAppInformation_Id

 left join Chats 
 on Chats.FkUser_Id_Recived=UserRecived.Id or Chats.FkUser_Id_Starting=UserRecived.Id
where 
UserRecived.UserName=@UserName and 
UserRecived.Id!=@UserLoggedId

end
GO
/****** Object:  StoredProcedure [dbo].[SelectAdBottomBar]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectAdBottomBar]
	@adId int , 
	@categoryId int ,
	@subCategoryId int
as begin

if((select count(Id)  from  ads.RentalIndividualFields  where	IsBar=1 and IsRequired =1 and FKSubCategory_Id=@subCategoryId)>0)
select 
	RentalIndividualFields.FkIndividualField_Id,
	AdIndividualFieldsDetails.Value as AdIndividualFieldValue,
	IndividualFields.ResourcesName as IndividualField_ResourcesName

		 from ads.RentalIndividualFields 
		left join ads.AdIndividualFieldsDetails on AdIndividualFieldsDetails.FKAd_Id=@adId
		  join ads.IndividualFields on IndividualFields.Id=AdIndividualFieldsDetails.FkIndividualField_Id

where  IsBar=1 and IsRequired =1 and FKSubCategory_Id=@subCategoryId

else 
select 
	RentalIndividualFields.FkIndividualField_Id,
	AdIndividualFieldsDetails.Value as AdIndividualFieldValue,
	IndividualFields.ResourcesName as IndividualField_ResourcesName

	 from ads.RentalIndividualFields 
	left join ads.AdIndividualFieldsDetails on AdIndividualFieldsDetails.FKAd_Id=@adId
	join ads.IndividualFields on IndividualFields.Id=AdIndividualFieldsDetails.FkIndividualField_Id

 where  IsBar=1 and IsRequired =1 and FKCategory_Id=@categoryId and FKSubCategory_Id is null





end 
 
GO
/****** Object:  StoredProcedure [dbo].[SelectAdComments]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAdComments]
--Paging
@lastCommentId int , 
@take int ,
--Filter
@adId int 
as begin
select 
	AdComment.Id , 
	AdComment.Comment,
	AdComment.FKAd_Id,
	Users.UserName,
	(AppsInformation.Value+Files.FileUrl) as UserImage


from 
	ads.AdComment 

join Users on Users.Id = AdComment.FkUser_Id
join UserInformation on UserInformation.Id=Users.Id
join Files on Files.Id=UserInformation.FkImage_Id
join AppsInformation on AppsInformation.Id =Files.FKAppInformation_Id

 where FKAd_Id=@adId
	 and (@lastCommentId is null or  AdComment.Id < @lastCommentId)
 
 order by AdComment.Id desc
 Offset 0 row
 Fetch next @take rows only
 end
GO
/****** Object:  StoredProcedure [dbo].[SelectAdDetails]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAdDetails] 
@adId int as begin 
select 
	ad.Id,
	ad.Title,
	ad.Description,
	ad.CreateDateTime,
	ad.Price,
	ad.FkCategory_Id,
	ad.FkSubCategory_Id,
	ad.FKAlbum_Id,

	UserCreated.Id as UserCreated_Id,
	UserCreated.Email as UserCreated_Email, 
	UserCreated.UserName as UserCreated_UserName,
	UserCreatedInformation.PhoneNumber as UserCreated_PhoneNumber,
	
	Category.NameAr as Category_NameAr ,
	Category.NameEn as Category_NameEn ,
	SubCategory.NameAr as SubCategory_NameAr ,
	SubCategory.NameEn as SubCategory_NameEn ,
	RentalTimesType.ResourceName  as RentalTimesType_ResourceName,

	Location.Latitude  as Location_Latitude , 
	Location.Longitude as Location_Longitude ,
	Country.NameAr as Country_NameAr,
	Country.NameEn as Country_NameEn ,
	Province.NameAr as Province_NameAr,
	Province.NameEn as Province_NameEn ,
	Mark.NameAr as Mark_NameAr ,
	Mark.NameEn as Mark_NameEn ,
	Material.NameAr as Material_NameAr ,
	Material.NameEn as Material_NameEn ,
	Nationality.NameAr as Nationality_NameAr ,
	Nationality.NameEn as Nationality_NameEn ,
	Size.Name as Size ,
	Area.Width	as Area_Width ,
	Area.Length	as Area_Length ,
	Area.Height	as Area_Height 


from ads.ads as ad

	join ads.Categories as Category  on  Category.Id=ad.FkCategory_Id
	join ads.SubCategories as SubCategory  on  SubCategory.Id=ad.FkSubCategory_Id
	join Users as UserCreated on  UserCreated.Id=ad.FkUser_Id
	join UserInformation as UserCreatedInformation on UserCreatedInformation.Id=ad.FkUser_Id

	
	join ads.RentalTimesTypes as RentalTimesType  on  RentalTimesType.Id=ad.FkRentalTimesType_Id

    left join ads.AdDirectFieldDetails as AdDirectField  on  AdDirectField.AdId=ad.Id
    left join Locations as Location  on  Location.Id=AdDirectField.FKLocation_Id
    left join Materials as Material  on  Material.Id=AdDirectField.FKMatrial_Id
    left join Countries as Country  on  Country.Id=AdDirectField.FkCountry_Id
    left join Provinces as Province on  Province.Id=AdDirectField.FkProvince_Id
    left join Marks as Mark on  Mark.Id=AdDirectField.FKMark_Id
    left join Nationalities as Nationality on  Nationality.Id=AdDirectField.FKNationality_Id
    left join Sizes as Size on  Size.Id=AdDirectField.FKSize_Id
    left join Areas as Area on  Area.Id=AdDirectField.FKArea_Id


where Ad.Id=@adId

end
GO
/****** Object:  StoredProcedure [dbo].[SelectAdGroupsDetails]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAdGroupsDetails] 
@adId int 
as begin

select 
	AdGroupsDetails.Id,
	AdGroupsDetails.FKAd_Id,
	AdGroupsDetails.FKGroup_Id,
	AdGroupsDetails.FKGroupItem_Id,
	AdGroupsDetails.CustomValue,
	AdGroupsDetails.IsCustomValue,
	Groups.ResourceName as GroupResourceName,
	GroupsItems.ResourceName as GroupsItemName
 from ads.AdGroupsDetails

join ads.Groups on Groups.Id=AdGroupsDetails.FKGroup_Id
join ads.GroupsItems on GroupsItems.Id=AdGroupsDetails.FKGroupItem_Id

where FkAd_Id=@adId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAdsByFilter]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAdsByFilter]
--Paging
	@lastAdId int , 
	@take int ,
--FIlter
	@UserLoggadId int ,
	@title_Search nvarchar(50),
	@userCreateId_Search int ,
	@categoryId_Search int ,
	@subCategoryId_Search int ,
	@countryId_Search int ,
	@ProvinceId_Search int ,
	@CurrentUserIsFavorite bit,
-- Order By
	@orderBy_AmountDesc bit ,
	@orderBy_AmountAsc bit
	 

 as begin 
 declare 
 @lastAdPrice decimal = (select top 1 Price from Ads.Ads where Id=@lastAdId)
 if(@orderBy_AmountDesc=1)
select 
	ad.Id,
	ad.Title,
	ad.Description,
	ad.CreateDateTime,
	ad.Price,
	ad.FkCategory_Id,
	ad.FkSubCategory_Id,
	ad.FKAlbum_Id,

	UserCreated.Id as UserCreated_Id,
	UserCreated.Email as UserCreated_Email, 
	UserCreated.UserName UserCreated_UserName,
	
	Category.NameAr as Category_NameAr ,
	Category.NameEn as Category_NameEn ,
	SubCategory.NameAr as SubCategory_NameAr ,
	SubCategory.NameEn as SubCategory_NameEn ,
	Country.NameAr as Country_NameAr,
	Country.NameEn as Country_NameEn ,
	Province.NameAr as Province_NameAr,
	Province.NameEn as Province_NameEn ,	
	RentalTimesType.ResourceName  as RentalTimesType_ResourceName,


	(select Count(Id) from Ads.AdComment where AdComment.FKAd_Id=ad.Id) as CommentsCount,
	(select Count(Id) from Ads.AdVisitors where AdVisitors.FKAd_Id=ad.Id) as VisitorsCount,
	(select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id) as FavoritesCount,
	dbo.CheckIfUserFavorite(@UserLoggadId , ad.Id) as IsFavorite

from ads.ads as ad

	join ads.Categories as Category  on  Category.Id=ad.FkCategory_Id
	join ads.SubCategories as SubCategory  on  SubCategory.Id=ad.FkSubCategory_Id
	join dbo.Users as UserCreated on  UserCreated.Id=ad.FkUser_Id
	join ads.RentalTimesTypes as RentalTimesType  on  RentalTimesType.Id=ad.FkRentalTimesType_Id

	left join ads.AdDirectFieldDetails as AdDirectField  on  AdDirectField.AdId=ad.Id
    left join Countries as Country  on  Country.Id=AdDirectField.FkCountry_Id
    left join Provinces as Province on  Province.Id=AdDirectField.FkProvince_Id
where

 ((@lastAdId is null or @lastAdId=0) or ad.Price<@lastAdPrice)and
 (@CurrentUserIsFavorite is null or @CurrentUserIsFavorite=1 and (select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id and AdFavorites.FkUser_Id=@UserLoggadId)>0 ) and
 (@title_Search is null or ad.Title like '%'+@title_Search+'%') and
 (@userCreateId_Search is null or ad.FkUser_Id=@userCreateId_Search) and
 (@categoryId_Search is null or ad.FkCategory_Id=@userCreateId_Search) and
 (@subCategoryId_Search is null or ad.FkSubCategory_Id=@userCreateId_Search) and
 (@countryId_Search is null or Country.Id=@userCreateId_Search) and
 (@ProvinceId_Search is null or SubCategory.Id=@userCreateId_Search)   
 


 order by Price desc
 Offset 0 rows 
 fetch next @take rows only

 else if (@orderBy_AmountAsc=1)
 select 
	ad.Id,
	ad.Title,
	ad.Description,
	ad.CreateDateTime,
	ad.Price,
	ad.FkCategory_Id,
	ad.FkSubCategory_Id,
	ad.FKAlbum_Id,

	UserCreated.Id as UserCreated_Id,
	UserCreated.Email as UserCreated_Email, 
	UserCreated.UserName UserCreated_UserName,
	
	Category.NameAr as Category_NameAr ,
	Category.NameEn as Category_NameEn ,
	SubCategory.NameAr as SubCategory_NameAr ,
	SubCategory.NameEn as SubCategory_NameEn ,
	Country.NameAr as Country_NameAr,
	Country.NameEn as Country_NameEn ,
	Province.NameAr as Province_NameAr,
	Province.NameEn as Province_NameEn ,
	RentalTimesType.ResourceName  as RentalTimesType_ResourceName,


	(select Count(Id) from Ads.AdComment where AdComment.FKAd_Id=ad.Id) as CommentsCount,
	(select Count(Id) from Ads.AdVisitors where AdVisitors.FKAd_Id=ad.Id) as VisitorsCount,
	(select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id) as FavoritesCount,
	dbo.CheckIfUserFavorite(@UserLoggadId , ad.Id) as IsFavorite

from ads.ads as ad

	join ads.Categories as Category  on  Category.Id=ad.FkCategory_Id
	join ads.SubCategories as SubCategory  on  SubCategory.Id=ad.FkSubCategory_Id
	join dbo.Users as UserCreated on  UserCreated.Id=ad.FkUser_Id
	join ads.RentalTimesTypes as RentalTimesType  on  RentalTimesType.Id=ad.FkRentalTimesType_Id

	left join ads.AdDirectFieldDetails as AdDirectField  on  AdDirectField.AdId=ad.Id
    left join Countries as Country  on  Country.Id=AdDirectField.FkCountry_Id
    left join Provinces as Province on  Province.Id=AdDirectField.FkProvince_Id
where
 ((@lastAdId is null or @lastAdId=0) or ad.Price>@lastAdPrice) and
 (@CurrentUserIsFavorite is null or @CurrentUserIsFavorite=1 and (select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id and AdFavorites.FkUser_Id=@UserLoggadId)>0 ) and

 (@title_Search is null or ad.Title like '%'+@title_Search+'%') and
 (@userCreateId_Search is null or ad.FkUser_Id=@userCreateId_Search) and
 (@categoryId_Search is null or ad.FkCategory_Id=@userCreateId_Search) and
 (@subCategoryId_Search is null or ad.FkSubCategory_Id=@userCreateId_Search) and
 (@countryId_Search is null or Country.Id=@userCreateId_Search) and
 (@ProvinceId_Search is null or SubCategory.Id=@userCreateId_Search)  

 order by Price 
 Offset 0 rows 
 fetch next @take rows only

 else 
  select 
	ad.Id,
	ad.Title,
	ad.Description,
	ad.CreateDateTime,
	ad.Price,
	ad.FkCategory_Id,
	ad.FkSubCategory_Id,
	ad.FKAlbum_Id,

	UserCreated.Id as UserCreated_Id,
	UserCreated.Email as UserCreated_Email, 
	UserCreated.UserName UserCreated_UserName,
	
	Category.NameAr as Category_NameAr ,
	Category.NameEn as Category_NameEn ,
	SubCategory.NameAr as SubCategory_NameAr ,
	SubCategory.NameEn as SubCategory_NameEn ,
	Country.NameAr as Country_NameAr,
	Country.NameEn as Country_NameEn ,
	Province.NameAr as Province_NameAr,
	Province.NameEn as Province_NameEn ,
	RentalTimesType.ResourceName  as RentalTimesType_ResourceName,


	(select Count(Id) from Ads.AdComment where AdComment.FKAd_Id=ad.Id) as CommentsCount,
	(select Count(Id) from Ads.AdVisitors where AdVisitors.FKAd_Id=ad.Id) as VisitorsCount,
	(select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id) as FavoritesCount,
	dbo.CheckIfUserFavorite(@UserLoggadId , ad.Id) as IsFavorite

from ads.ads as ad

	join ads.Categories as Category  on  Category.Id=ad.FkCategory_Id
	join ads.SubCategories as SubCategory  on  SubCategory.Id=ad.FkSubCategory_Id
	join dbo.Users as UserCreated on  UserCreated.Id=ad.FkUser_Id
	join ads.RentalTimesTypes as RentalTimesType  on  RentalTimesType.Id=ad.FkRentalTimesType_Id

	left join ads.AdDirectFieldDetails as AdDirectField  on  AdDirectField.AdId=ad.Id
    left join Countries as Country  on  Country.Id=AdDirectField.FkCountry_Id
    left join Provinces as Province on  Province.Id=AdDirectField.FkProvince_Id
where

 ((@lastAdId is null or @lastAdId=0) or ad.Id < @lastAdId) and
 (@CurrentUserIsFavorite is null or @CurrentUserIsFavorite=1 and (select Count(Id) from Ads.AdFavorites where AdFavorites.FKAd_Id=ad.Id and AdFavorites.FkUser_Id=@UserLoggadId)>0 ) and

 (@title_Search is null or ad.Title like '%'+@title_Search+'%') and
 (@userCreateId_Search is null or ad.FkUser_Id=@userCreateId_Search) and
 (@categoryId_Search is null or ad.FkCategory_Id=@userCreateId_Search) and
 (@subCategoryId_Search is null or ad.FkSubCategory_Id=@userCreateId_Search) and
 (@countryId_Search is null or Country.Id=@userCreateId_Search) and
 (@ProvinceId_Search is null or SubCategory.Id=@userCreateId_Search)  

 order by Id desc 
 Offset 0 rows 
 fetch next @take rows only


end
GO
/****** Object:  StoredProcedure [dbo].[SelectAlbumImages]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAlbumImages] 
@albumId int
as begin

select (cast(AppsInformation.Value as nvarchar(50))+Files.FileUrl)as AdImage from  AlbumFiles
join Files on Files.Id=AlbumFiles.FkFile_Id
join AppsInformation on AppsInformation.Id=Files.FKAppInformation_Id
   where AlbumFiles.FkAlbum_Id=@albumId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectEmailsSubscriptionsByFilter]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc	[dbo].[SelectEmailsSubscriptionsByFilter]
--Paging
@skip int , 
@take int ,  
--Filter
@DateTime_From datetime,
@DateTime_To datetime,
@email_search nvarchar(50)
as begin

select * from EmailsSubscriptions 

where
(@email_search is null or Email like '%'+@email_search+'%') 
and 
(@DateTime_From is null or CreateDateTime >= @DateTime_From)
and
(@DateTime_To is null or CreateDateTime <= @DateTime_To)


end 
GO
/****** Object:  StoredProcedure [dbo].[SelectLastMessage]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectLastMessage]

@UserLoggedId int ,  
@UserRecivedId int 
as begin
select
 top 1 
		ChatMessages.Id,
		ChatMessages.DateTime,
		ChatMessages.FkChat_Id,
		ChatMessages.Message,
		ChatMessages.FkUser_Id,
		Users.Id as UserId ,
		 Users.UserName,
		 UserInformation.FullName as UserFullName,
		(AppsInformation.Value+Files.FileUrl) as UserImage 

 from ChatMessages 

join Chats on Chats.Id=ChatMessages.FkChat_Id
join Users on Users.Id=ChatMessages.FkUser_Id
join UserInformation on UserInformation.Id=Users.Id 
join Files on Files.Id=UserInformation.FkImage_Id
join AppsInformation on AppsInformation.Id=Files.FKAppInformation_Id


where 
(Chats.FkUser_Id_Recived=@UserLoggedId and Chats.FkUser_Id_Starting=@UserRecivedId) 
or
(Chats.FkUser_Id_Starting=@UserLoggedId and Chats.FkUser_Id_Recived=@UserRecivedId) 

 

order by Id desc 

end
GO
/****** Object:  StoredProcedure [dbo].[SelectMessages]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectMessages] 

--Pageing
@LastMessageId int , -- as skip
@Take int,

--Filter
@ChatId int  
as begin 

select
		ChatMessages.Id,
		ChatMessages.DateTime,
		ChatMessages.FkChat_Id,
		ChatMessages.Message,
		ChatMessages.FkUser_Id,
			Users.Id as UserId ,
	 Users.UserName,
	 UserInformation.FullName as UserFullName,
	(AppsInformation.Value+Files.FileUrl) as UserImage 

 from ChatMessages 

join Chats on Chats.Id=ChatMessages.FkChat_Id
join Users on Users.Id=ChatMessages.FkUser_Id
join UserInformation on UserInformation.Id=Users.Id 
join Files on Files.Id=UserInformation.FkImage_Id
join AppsInformation on AppsInformation.Id=Files.FKAppInformation_Id


where 

Chats.Id=@ChatId and
(@LastMessageId =0 or ChatMessages.Id<@LastMessageId)

order by Id desc 

Offset 0 rows 
Fetch Next @Take Rows Only

end
GO
/****** Object:  StoredProcedure [dbo].[SelectUserChats]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectUserChats]

--Paging
@Skip int , 
@Take int ,
--Filter
@UserLoggedId int ,
@UserName nvarchar(50)

as begin

select 
	Chats.Id,
	 Users.Id as UserId ,
	 Users.UserName,
	 UserInformation.FullName as UserFullName,
	(AppsInformation.Value+Files.FileUrl) as UserImage 
from Chats 

join Users on Users.Id!=@UserLoggedId 
and (Users.Id=Chats.FkUser_Id_Recived or Users.Id=Chats.FkUser_Id_Starting)

join UserInformation on UserInformation.Id=Users.Id 
join Files on Files.Id=UserInformation.FkImage_Id
join AppsInformation on AppsInformation.Id=Files.FKAppInformation_Id

where 
 (  Chats.FkUser_Id_Starting=@UserLoggedId 
or 
    Chats.FkUser_Id_Starting=@UserLoggedId )
and 
   (@UserName is null or Users.UserName!=@UserName)

order by (select top 1 Id from ChatMessages 
			where FkChat_Id=Chats.Id order by Id desc)  desc 
 
Offset @Skip rows
Fetch Next @Take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[SelectUsersByFilter]    Script Date: 6/19/2019 12:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectUsersByFilter] 
--paging
@skip int , 
@take int , 
--filter
@accountTypeId int,
@isBlocked bit ,
@countryId int , 
@createDateFrom date,
@createDateTo date 

as begin
select 
			users.Id,
			users.Email,
			users.CreateDate,
			users.IsBlocked,
			users.UserName,
			userinformation.FullName,
			userinformation.PhoneNumber,
			Countries.NameAr,
			Countries.NameEn,
			(Cast(AppsInformation.Value as nvarchar(50)) +Files.FileUrl) as  'Image'

 from users 

join userinformation on userinformation.Id=users.Id
left join [Addresses] as  UserAddress on UserAddress.Id=userinformation.FKAddress_Id
left join Countries  on Countries.Id=UserAddress.FKCountry_Id
 
  join UserRoles on UserRoles.FkUser_Id=users.Id
  join  Files on Files.Id=userinformation.FkImage_Id
  join AppsInformation on AppsInformation.Id=Files.FkAppInformation_Id

where 
	Users.Id!=1 and
	UserRoles.FkRole_Id=@accountTypeId 
	and  
	 	(@isBlocked is  null or users.IsBlocked=@isBlocked)   
	and  
		(@countryId is   null or UserAddress.FkCountry_Id=@countryId)
	and  
		(@createDateFrom is   null or users.CreateDate>=@createDateFrom)   
    and  
		(@createDateTo is   null or users.CreateDate<=@createDateTo)   
	
	order by Id desc 
	OFFSET  @skip  rows
	FETCH NEXT @take rows ONLY
end
GO
USE [master]
GO
ALTER DATABASE [Tageer] SET  READ_WRITE 
GO
