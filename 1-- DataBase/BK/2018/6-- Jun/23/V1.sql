USE [master]
GO
/****** Object:  Database [Rental]    Script Date: 6/23/2018 12:24:08 AM ******/
CREATE DATABASE [Rental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AHMED\MSSQL\DATA\Rental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AHMED\MSSQL\DATA\Rental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Rental] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rental] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rental] SET  MULTI_USER 
GO
ALTER DATABASE [Rental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rental] SET QUERY_STORE = OFF
GO
USE [Rental]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Rental]
GO
/****** Object:  Schema [Ads]    Script Date: 6/23/2018 12:24:09 AM ******/
CREATE SCHEMA [Ads]
GO
/****** Object:  Table [Ads].[AdAlbums]    Script Date: 6/23/2018 12:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdAlbums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKImageAlbum_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdAlbums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdComment]    Script Date: 6/23/2018 12:24:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdDetails]    Script Date: 6/23/2018 12:24:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKFreeSize_Id] [int] NULL,
	[FKSize_Id] [int] NULL,
	[FKLocation_Id] [int] NULL,
	[FKMatrial_Id] [int] NULL,
	[FKNationality_Id] [int] NULL,
	[FKMark_Id] [int] NULL,
 CONSTRAINT [PK_AdDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdFavorites]    Script Date: 6/23/2018 12:24:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdFavorites](
	[Id] [nchar](10) NOT NULL,
	[DateTime] [nchar](10) NOT NULL,
	[FKLogHistory_Id] [int] IDENTITY(1,1) NOT NULL,
	[FKAd_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdInputs]    Script Date: 6/23/2018 12:24:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdInputs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKInput_Id] [int] NOT NULL,
	[StringValue] [nvarchar](100) NULL,
	[NumberValue] [int] NULL,
	[BoolValue] [bit] NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[Ads]    Script Date: 6/23/2018 12:24:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Ads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKLeaseTermType_Id] [int] NULL,
	[FKAdDetails_Id] [int] NOT NULL,
	[FKAdAlbum_Id] [int] NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdSection]    Script Date: 6/23/2018 12:24:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[AdSection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSectionType_Id] [int] NOT NULL,
	[FKSctionItem_Id] [int] NOT NULL,
	[FKAd_Id] [int] NOT NULL,
 CONSTRAINT [PK_AdSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[AdVisitors]    Script Date: 6/23/2018 12:24:11 AM ******/
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
/****** Object:  Table [Ads].[Inputs]    Script Date: 6/23/2018 12:24:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[Inputs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourcesName] [nvarchar](50) NOT NULL,
	[FKInputsType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Inputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[InputsType]    Script Date: 6/23/2018 12:24:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[InputsType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourcesName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InputsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[LeaseTermTypes]    Script Date: 6/23/2018 12:24:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[LeaseTermTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LeaseTermTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategories]    Script Date: 6/23/2018 12:24:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
	[FKImage_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[ImagesCount] [int] NOT NULL,
 CONSTRAINT [PK_RentalCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategoryInputs]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategoryInputs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKInput_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NULL,
 CONSTRAINT [PK_CategoryInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategoryItems]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategoryItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKSectionItem_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NULL,
 CONSTRAINT [PK_RentalItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategoryMarks]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategoryMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMark_Id] [int] NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NULL,
 CONSTRAINT [PK_RentalMarks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategoryMaterials]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategoryMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKMaterial_Id] [int] NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NULL,
 CONSTRAINT [PK_RentalMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalCategorySections]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalCategorySections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSectionType_Id] [int] NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NULL,
 CONSTRAINT [PK_RentalSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalTypes]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKImage_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[SectionItems]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[SectionItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FKSectionType_Id] [int] NOT NULL,
 CONSTRAINT [PK_SectionItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[SectionTypes]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[SectionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SectionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](500) NOT NULL,
	[PostlCode] [int] NULL,
	[FKCountryId] [int] NOT NULL,
	[FKCityId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumImages]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKImageAlbum_Id] [int] NOT NULL,
	[FKImage_Id] [int] NOT NULL,
 CONSTRAINT [PK_AlbumImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkCountryId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[Date] [date] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[FKUser_Id] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 6/23/2018 12:24:13 AM ******/
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
	[FKLogHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateTypes]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DateTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreeSizes]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreeSizes](
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
/****** Object:  Table [dbo].[Genders]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](15) NOT NULL,
	[NameEn] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageAlbum]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageAlbum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ImageAlbum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 6/23/2018 12:24:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 6/23/2018 12:24:13 AM ******/
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
/****** Object:  Table [dbo].[LogHistories]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FKUserId] [int] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsBackEnd] [bit] NOT NULL,
	[FKLastUserIdUpdate] [int] NULL,
 CONSTRAINT [PK_LogHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 6/23/2018 12:24:14 AM ******/
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
/****** Object:  Table [dbo].[Materials]    Script Date: 6/23/2018 12:24:14 AM ******/
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
/****** Object:  Table [dbo].[Months]    Script Date: 6/23/2018 12:24:14 AM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationReads]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationReads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKNotification_Id] [int] NOT NULL,
	[FKUserId] [int] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationReads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationRoles]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKNotificationsTypeId] [int] NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[Addition] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TargetNameEn] [nvarchar](50) NULL,
	[TargetNameAr] [nvarchar](50) NULL,
	[TargetName] [nvarchar](50) NULL,
	[FKTarget_Id] [int] NOT NULL,
	[TableNameResources] [nvarchar](50) NULL,
	[Url] [nvarchar](max) NULL,
	[DateTime] [datetime] NOT NULL,
	[FKNotificationPagesId] [int] NOT NULL,
	[FKNotificationTypeActionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsBackend] [bit] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsDescriptionDatas]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsDescriptionDatas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKNotification_Id] [int] NOT NULL,
	[ColumnResourseName] [nvarchar](50) NULL,
	[ColumnOldData] [nvarchar](max) NULL,
	[ColumnNewDate] [nvarchar](max) NULL,
	[IsNameEn] [bit] NULL,
 CONSTRAINT [PK_NotificationsDescriptionDatas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsPages]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsPages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsAllow] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationsPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationTypeActions]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTypeActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[ClassIcon] [nvarchar](50) NOT NULL,
	[BackgroundClass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationTypeActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesManagement]    Script Date: 6/23/2018 12:24:14 AM ******/
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
/****** Object:  Table [dbo].[PrivilegeRoles]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegeRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[FKPrivilegeId] [int] NOT NULL,
	[Display] [bit] NOT NULL,
	[Addition] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
 CONSTRAINT [PK_PrivilegeRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FKParentId] [int] NULL,
	[Url] [nvarchar](50) NULL,
	[IsLink] [bit] NULL,
	[PriveOrder] [int] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[IsBackEnd] [bit] NOT NULL,
	[IsParent] [bit] NOT NULL,
 CONSTRAINT [PK_Privileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seo]    Script Date: 6/23/2018 12:24:14 AM ******/
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
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](15) NOT NULL,
	[NameEn] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_SocialStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDatas]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDatas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [nvarchar](20) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[NationalId] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Phone2] [nvarchar](15) NULL,
	[BirthDate] [datetime] NOT NULL,
	[FKImageId] [int] NOT NULL,
	[FkAddressId] [int] NULL,
	[FkGenderId] [int] NOT NULL,
	[FkSocialStatusId] [int] NOT NULL,
	[FKJobId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LanguageCode] [varchar](10) NULL,
 CONSTRAINT [PK_UserDatas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[IsBlock] [bit] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[FKLogHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/23/2018 12:24:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FkUserDataId__Id_] [int] NOT NULL,
	[SerialNumber] [nvarchar](300) NULL,
	[IsBlock] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [Ads].[Inputs] ON 

INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (1, N'RoomsCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (2, N'SeatsCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (3, N'ToiletsCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (4, N'Size', 8)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (5, N'FloorNumber', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (6, N'Price', 1)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (7, N'BuildingYear', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (8, N'StreetWidth', 9)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (9, N'PricePerMeter', 9)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (10, N'ApartmentCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (11, N'ElevatorCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (12, N'Location', 8)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (13, N'ParkingCount', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (14, N'Model', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (15, N'BagsCountSmall', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (16, N'BagsCountBig', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (17, N'Age', 2)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (18, N'Materials', 5)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (19, N'Color', 8)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (20, N'AmountOfInsurance', 7)
INSERT [Ads].[Inputs] ([Id], [ResourcesName], [FKInputsType_Id]) VALUES (21, N'Nationality', 8)
SET IDENTITY_INSERT [Ads].[Inputs] OFF
SET IDENTITY_INSERT [Ads].[InputsType] ON 

INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (1, N'Text')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (2, N'Number')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (3, N'Select')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (4, N'Checkbox')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (5, N'Radio')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (6, N'Date')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (7, N'Time')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (8, N'LinkWithTable')
INSERT [Ads].[InputsType] ([Id], [ResourcesName]) VALUES (9, N'Decimal ')
SET IDENTITY_INSERT [Ads].[InputsType] OFF
SET IDENTITY_INSERT [Ads].[RentalCategories] ON 

INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (7, N'دفع رباعى', N'4×4', 5, 13, 13, 60)
INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (8, N'لموزين', N'limozin', 5, 14, 14, 1)
INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (9, N'زفاف', N'Wedding', 8, 16, 71, 4)
SET IDENTITY_INSERT [Ads].[RentalCategories] OFF
SET IDENTITY_INSERT [Ads].[RentalCategoryInputs] ON 

INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (32, 0, NULL, 4, 108, 8)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (33, 1, NULL, 6, 109, 8)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (34, 1, NULL, 14, 110, 8)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (35, 1, NULL, 19, 111, 8)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (36, 1, 7, 6, 112, NULL)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (37, 1, 7, 14, 113, NULL)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (38, 0, 7, 15, 114, NULL)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (39, 0, 7, 16, 115, NULL)
INSERT [Ads].[RentalCategoryInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (40, 1, 7, 19, 116, NULL)
SET IDENTITY_INSERT [Ads].[RentalCategoryInputs] OFF
SET IDENTITY_INSERT [Ads].[RentalCategoryMarks] ON 

INSERT [Ads].[RentalCategoryMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (40, 3, 7, 117, NULL)
INSERT [Ads].[RentalCategoryMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (41, 5, 7, 118, NULL)
INSERT [Ads].[RentalCategoryMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (42, 6, NULL, 119, 8)
INSERT [Ads].[RentalCategoryMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (43, 8, NULL, 120, 8)
INSERT [Ads].[RentalCategoryMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (44, 10, NULL, 121, 8)
SET IDENTITY_INSERT [Ads].[RentalCategoryMarks] OFF
SET IDENTITY_INSERT [Ads].[RentalCategoryMaterials] ON 

INSERT [Ads].[RentalCategoryMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1, 5, 9, 122, NULL)
INSERT [Ads].[RentalCategoryMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (2, 6, NULL, 123, 8)
INSERT [Ads].[RentalCategoryMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (3, 7, NULL, 124, 8)
SET IDENTITY_INSERT [Ads].[RentalCategoryMaterials] OFF
SET IDENTITY_INSERT [Ads].[RentalTypes] ON 

INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (5, N'سيارات', N'Cars', 2, 2)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (6, N'عقارات', N'Build', 3, 3)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (7, N'قاعات', N'Laps', 4, 4)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (8, N'فساتين', N'Dresses', 15, 70)
SET IDENTITY_INSERT [Ads].[RentalTypes] OFF
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (1, N'22 street', 55, 1, 2)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (2, N'القاهرة', N'cairo', 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn]) VALUES (1, N'مصر', N'egypt')
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn]) VALUES (2, N'dfd', N'dff')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Dates] ON 

INSERT [dbo].[Dates] ([Id], [BeforeCurrentYear], [AfterCurrentYear], [FKDateTypeId], [IsDefult], [FKLogHistoryId]) VALUES (4, 20, 20, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Dates] OFF
SET IDENTITY_INSERT [dbo].[DateTypes] ON 

INSERT [dbo].[DateTypes] ([Id], [NameAr], [NameEn]) VALUES (1, N'ميلادى', N'Miladey')
INSERT [dbo].[DateTypes] ([Id], [NameAr], [NameEn]) VALUES (2, N'هجرى', N'Hegrey')
SET IDENTITY_INSERT [dbo].[DateTypes] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [NameAr], [NameEn]) VALUES (1, N'ذكر', N'male')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (1, N'/Files/Images/Users/Profile/team16.jpg6b2912b5-8675-41ca-aa5b-d4537c00cd8a.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (2, N'/Files/Images/Rental/RentalType1.jpgd6fce7f8-0db9-4a11-93ce-b74523b0e8b2.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (3, N'/Files/Images/Rental/RentalType3.jpg2b02ea5b-579c-4da6-bd9f-01f85079de7e.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (4, N'/Files/Images/Rental/RentalType31.jpg577d9461-acd6-4c5a-838e-d5ef8c4fb934.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (12, N'/Files/Images/Rental/RentalCategory9.jpga0a4e8d9-c0ef-4b6b-bc36-0d84d367336e.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (13, N'/Files/Images/Rental/RentalCategoryMR-2016-Ford-Ranger-OFFROAD.jpgdfda14bc-6552-45e1-88cc-248abe6b4799.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (14, N'/Files/Images/Rental/RentalCategorycamaro-bumblebee-limo-32.jpg3f6fb87d-3572-4ef1-becc-a435016475a5.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (15, N'/Files/Images/Rental/RentalType1517363033711812015.jpg98b537f2-be12-46f9-905a-883dad1aa0eb.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (16, N'/Files/Images/Rental/RentalCategory1.jpg24f58468-c2ee-4d83-a909-1c92e899c109.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (1, N'مطور', N'developer')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[LogHistories] ON 

INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (2, CAST(N'2018-06-20T05:10:51.030' AS DateTime), 1, CAST(N'2018-06-20T07:19:51.040' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (3, CAST(N'2018-06-20T05:10:59.457' AS DateTime), 1, CAST(N'2018-06-20T07:19:51.057' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (4, CAST(N'2018-06-20T20:46:42.583' AS DateTime), 1, CAST(N'2018-06-20T20:49:21.040' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (12, CAST(N'2018-06-21T00:39:41.070' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (13, CAST(N'2018-06-21T00:40:06.753' AS DateTime), 1, CAST(N'2018-06-21T00:52:47.497' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (14, CAST(N'2018-06-21T00:42:04.297' AS DateTime), 1, CAST(N'2018-06-21T00:52:47.573' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (21, CAST(N'2018-06-21T17:34:42.823' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (22, CAST(N'2018-06-21T17:37:46.603' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (23, CAST(N'2018-06-21T17:37:46.607' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (24, CAST(N'2018-06-21T18:35:45.937' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (25, CAST(N'2018-06-21T18:37:05.877' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (26, CAST(N'2018-06-21T18:37:13.103' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (27, CAST(N'2018-06-21T18:37:13.113' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (28, CAST(N'2018-06-21T18:37:15.373' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (29, CAST(N'2018-06-21T18:37:20.627' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (30, CAST(N'2018-06-21T18:37:20.627' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (31, CAST(N'2018-06-21T18:37:20.627' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (32, CAST(N'2018-06-21T18:37:20.627' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (33, CAST(N'2018-06-21T18:37:26.650' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (34, CAST(N'2018-06-21T18:37:26.650' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (35, CAST(N'2018-06-21T18:37:26.650' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (36, CAST(N'2018-06-21T18:40:21.040' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (37, CAST(N'2018-06-21T18:40:33.363' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (38, CAST(N'2018-06-21T18:40:33.363' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (39, CAST(N'2018-06-21T18:40:33.363' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (40, CAST(N'2018-06-21T18:40:36.913' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (41, CAST(N'2018-06-22T00:58:06.877' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (42, CAST(N'2018-06-22T01:58:45.297' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (43, CAST(N'2018-06-22T02:01:24.030' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (44, CAST(N'2018-06-22T02:01:24.030' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (45, CAST(N'2018-06-22T05:33:59.097' AS DateTime), 1, CAST(N'2018-06-22T15:09:25.140' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (46, CAST(N'2018-06-22T05:33:59.130' AS DateTime), 1, CAST(N'2018-06-22T05:47:31.263' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (47, CAST(N'2018-06-22T05:33:59.130' AS DateTime), 1, CAST(N'2018-06-22T05:49:25.540' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (48, CAST(N'2018-06-22T05:46:26.930' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (49, CAST(N'2018-06-22T05:46:33.007' AS DateTime), 1, CAST(N'2018-06-22T05:47:35.413' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (50, CAST(N'2018-06-22T05:46:33.007' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (51, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:49:31.593' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (52, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:47:46.377' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (53, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:49:31.597' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (54, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:47:46.383' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (55, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:49:48.423' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (56, CAST(N'2018-06-22T05:47:43.010' AS DateTime), 1, CAST(N'2018-06-22T05:47:46.387' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (57, CAST(N'2018-06-22T05:49:48.420' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (58, CAST(N'2018-06-22T05:49:48.420' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (59, CAST(N'2018-06-22T05:49:48.420' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (60, CAST(N'2018-06-22T05:49:48.420' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (61, CAST(N'2018-06-22T05:49:48.423' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (62, CAST(N'2018-06-22T15:09:28.163' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (63, CAST(N'2018-06-22T15:09:28.167' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (64, CAST(N'2018-06-22T15:09:28.167' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (65, CAST(N'2018-06-22T15:09:28.167' AS DateTime), 1, CAST(N'2018-06-22T15:09:58.430' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (66, CAST(N'2018-06-22T15:09:33.690' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (67, CAST(N'2018-06-22T16:00:59.957' AS DateTime), 1, CAST(N'2018-06-22T16:11:22.310' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (68, CAST(N'2018-06-22T16:01:05.550' AS DateTime), 1, CAST(N'2018-06-22T16:11:22.317' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (69, CAST(N'2018-06-22T16:01:10.397' AS DateTime), 1, CAST(N'2018-06-22T16:11:22.320' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (70, CAST(N'2018-06-22T16:14:52.530' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (71, CAST(N'2018-06-22T16:19:06.813' AS DateTime), 1, CAST(N'2018-06-22T16:21:49.890' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (72, CAST(N'2018-06-22T16:22:59.807' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (73, CAST(N'2018-06-22T16:22:59.807' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (74, CAST(N'2018-06-22T16:22:59.810' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (75, CAST(N'2018-06-22T16:22:59.810' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (76, CAST(N'2018-06-22T16:40:19.750' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (77, CAST(N'2018-06-22T16:40:19.750' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (78, CAST(N'2018-06-22T16:40:19.750' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (79, CAST(N'2018-06-22T16:40:19.750' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (80, CAST(N'2018-06-22T16:40:19.750' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (81, CAST(N'2018-06-22T16:40:19.753' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (82, CAST(N'2018-06-22T16:43:01.860' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (83, CAST(N'2018-06-22T16:46:44.630' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (84, CAST(N'2018-06-22T16:46:44.660' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (85, CAST(N'2018-06-22T16:46:44.663' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (92, CAST(N'2018-06-22T21:23:19.357' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (93, CAST(N'2018-06-22T21:23:19.390' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (94, CAST(N'2018-06-22T21:23:30.640' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (95, CAST(N'2018-06-22T21:23:30.640' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (96, CAST(N'2018-06-22T21:29:42.837' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (97, CAST(N'2018-06-22T21:31:53.960' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (98, CAST(N'2018-06-22T21:31:53.960' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (99, CAST(N'2018-06-22T21:32:00.727' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (100, CAST(N'2018-06-22T21:32:25.083' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (101, CAST(N'2018-06-22T21:50:39.530' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (102, CAST(N'2018-06-22T21:50:41.390' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (103, CAST(N'2018-06-22T22:19:49.633' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (104, CAST(N'2018-06-22T22:19:49.667' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (105, CAST(N'2018-06-22T22:20:04.637' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (106, CAST(N'2018-06-22T22:20:04.637' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (107, CAST(N'2018-06-22T22:21:43.307' AS DateTime), 1, CAST(N'2018-06-22T22:21:49.123' AS DateTime), 1, 1)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (108, CAST(N'2018-06-22T22:22:52.817' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (109, CAST(N'2018-06-22T22:22:52.817' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (110, CAST(N'2018-06-22T22:22:52.817' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (111, CAST(N'2018-06-22T22:22:52.817' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (112, CAST(N'2018-06-22T22:27:33.703' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (113, CAST(N'2018-06-22T22:27:33.703' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (114, CAST(N'2018-06-22T22:27:33.703' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (115, CAST(N'2018-06-22T22:27:33.707' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (116, CAST(N'2018-06-22T22:27:33.707' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (117, CAST(N'2018-06-22T22:28:44.817' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (118, CAST(N'2018-06-22T22:28:44.820' AS DateTime), 1, NULL, 1, NULL)
GO
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (119, CAST(N'2018-06-22T22:28:58.563' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (120, CAST(N'2018-06-22T22:28:58.563' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (121, CAST(N'2018-06-22T22:28:58.563' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (122, CAST(N'2018-06-23T00:03:28.540' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (123, CAST(N'2018-06-23T00:03:35.917' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (124, CAST(N'2018-06-23T00:03:35.917' AS DateTime), 1, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[LogHistories] OFF
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (2, N'لانسر', N'lancer', 1)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (3, N'مرسيدس', N'Mercedes', 1)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (4, N'تويتا', N'toyota', 1)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (5, N'هوندا', N'honda', 1)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (6, N'تمبرلي لندن', N'Temperley London', 76)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (8, N'فندي', N'Fendi', 78)
INSERT [dbo].[Marks] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (10, N'فالنتينو', N'Valentino', 80)
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (5, N'بلستر', N'Polyester', 67)
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (6, N'حرير', N'Silk', 68)
INSERT [dbo].[Materials] ([Id], [NameAr], [NameEn], [FKLogHistory_Id]) VALUES (7, N'ستان', N'Stan', 69)
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[NotificationRoles] ON 

INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (1, 2, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (2, 3, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (3, 4, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (4, 5, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (5, 6, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (6, 7, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (7, 8, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (8, 9, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (9, 10, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (10, 11, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (11, 12, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (12, 13, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (13, 14, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (14, 15, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (15, 16, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (16, 17, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (18, 18, 1, 1, 1, 1)
INSERT [dbo].[NotificationRoles] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (19, 19, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[NotificationRoles] OFF
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (3, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T05:57:39.847' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (4, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T06:02:59.050' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (5, N'dff', N'dfd', NULL, 2, N'Country', NULL, CAST(N'2018-06-20T06:17:42.340' AS DateTime), 7, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (6, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:11:58.833' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (7, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:12:40.310' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (8, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:13:37.600' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (9, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:14:05.210' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (10, N'saas', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:15:17.450' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (11, N'saas1111', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:15:57.297' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (12, N'saas1111', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:18:20.723' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (13, N'saas1111', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:18:37.107' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (14, N'dsd', N'fdf', NULL, 6, N'RentalType', NULL, CAST(N'2018-06-20T07:18:37.120' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (15, N'saas1111', N'ahmedeeb', NULL, 5, N'RentalType', NULL, CAST(N'2018-06-20T07:19:51.040' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (16, N'dsd', N'fdf', NULL, 6, N'RentalType', NULL, CAST(N'2018-06-20T07:19:51.057' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (17, N's', N's', NULL, 7, N'RentalType', NULL, CAST(N'2018-06-20T20:46:43.887' AS DateTime), 14, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (18, N's', N's', NULL, 7, N'RentalType', NULL, CAST(N'2018-06-20T20:49:02.627' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (19, N'قاعات', N'قاعات', NULL, 7, N'RentalType', NULL, CAST(N'2018-06-20T20:49:21.040' AS DateTime), 14, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (20, N'CXC', N'scdvfvbn', NULL, 1, N'Mark', NULL, CAST(N'2018-06-21T01:22:59.670' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (21, N'CXC', N'scdvfvbn', NULL, 1, N'Mark', NULL, CAST(N'2018-06-21T01:23:08.567' AS DateTime), 13, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (22, N'F', N'F', NULL, 2, N'Mark', NULL, CAST(N'2018-06-21T01:23:08.603' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (23, N'F', N'F', NULL, 2, N'Mark', NULL, CAST(N'2018-06-21T01:23:15.123' AS DateTime), 13, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (24, N'CXC', N'scdvfvbn', NULL, 1, N'Mark', NULL, CAST(N'2018-06-21T01:23:19.477' AS DateTime), 13, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (25, N'FB', N'F', NULL, 2, N'Mark', NULL, CAST(N'2018-06-21T11:04:46.343' AS DateTime), 13, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (26, N'Mercedes', N'مرسيدس', NULL, 3, N'Mark', NULL, CAST(N'2018-06-21T11:04:46.477' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (27, N'toyota', N'تويتا', NULL, 4, N'Mark', NULL, CAST(N'2018-06-21T11:04:46.477' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (28, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 2, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T17:34:43.130' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (29, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 3, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T17:37:46.677' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (30, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 4, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T17:37:46.683' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (31, N'honda', N'هوندا', NULL, 5, N'Mark', NULL, CAST(N'2018-06-21T17:39:42.963' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (32, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 5, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:35:46.000' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (33, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:02.500' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (34, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:02.550' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (35, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 6, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:05.933' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (36, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:07.620' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (37, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:13.107' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (38, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:13.110' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (39, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 7, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:13.147' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (40, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 8, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:13.150' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (41, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 9, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:15.390' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (42, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:17.903' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (43, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:17.907' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (44, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:17.910' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (45, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 10, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:20.657' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (46, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 11, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:20.660' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (47, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 12, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:20.663' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (48, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 13, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:20.667' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (49, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:23.610' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (50, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:23.617' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (51, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:23.620' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (52, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:23.623' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (53, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 14, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:26.680' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (54, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 15, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:26.683' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (55, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 16, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:37:26.687' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (56, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:18.570' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (57, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 17, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:21.060' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (58, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:30.623' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (59, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:30.627' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (60, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:30.630' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (61, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 18, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:33.373' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (62, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 19, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:33.377' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (63, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 20, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:33.380' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (64, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 21, N'RentalCategoryMark', NULL, CAST(N'2018-06-21T18:40:36.920' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (65, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T00:57:53.270' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (66, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T00:57:53.320' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (67, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T00:57:53.337' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (68, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 22, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T00:58:07.023' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (69, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T01:58:45.283' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (70, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 23, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T01:58:45.477' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (71, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 24, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T02:01:24.043' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (72, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 25, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T02:01:24.047' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (73, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 1, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:33:59.517' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (74, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 2, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:33:59.527' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (75, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 3, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:33:59.530' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (76, N'Amount Of Insurance', N'مبلغ التامين', NULL, 3, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:46:06.830' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (77, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 4, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:46:26.957' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (78, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 5, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:46:33.037' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (79, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 6, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:46:33.040' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (80, N'Bags Count Big', N'عدد الحقائب الكبيرة', NULL, 2, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:31.263' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (81, N'Floor Number', N'رقم الطابق', NULL, 5, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:35.413' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (82, N'Apartment Count', N'عدد الطوابق', NULL, 1, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:35.420' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (83, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 7, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.023' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (84, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 8, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.027' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (85, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 9, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.027' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (86, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 10, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.030' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (87, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 11, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.030' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (88, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 12, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:43.033' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (89, N'Apartment Count', N'عدد الطوابق', NULL, 8, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:46.377' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (90, N'Bags Count Big', N'عدد الحقائب الكبيرة', NULL, 10, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:46.383' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (91, N'Amount Of Insurance', N'مبلغ التامين', NULL, 12, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:47:46.387' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (92, N'Apartment Count', N'عدد الطوابق', NULL, 1, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:25.490' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (93, N'Amount Of Insurance', N'مبلغ التامين', NULL, 3, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:25.540' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (94, N'Building Year', N'عمر البناء', NULL, 7, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:31.593' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (95, N'Bags Count Small', N'عدد الحقائب الصغيرة', NULL, 9, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:31.597' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (96, N'Color', N'اللون', NULL, 11, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.423' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (97, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 13, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.473' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (98, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 14, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.477' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (99, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 15, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.477' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (100, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 16, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.480' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (101, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 17, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T05:49:48.480' AS DateTime), 17, 1, 1, 0)
GO
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (102, N'Apartment Count', N'عدد الطوابق', NULL, 1, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:25.140' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (103, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 18, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:28.190' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (104, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 19, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:28.190' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (105, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 20, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:28.193' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (106, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 21, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:28.193' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (107, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 22, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:33.723' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (108, N'Color', N'اللون', NULL, 21, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T15:09:58.430' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (109, N'd', N'd', NULL, 5, N'Material', NULL, CAST(N'2018-06-22T16:01:00.210' AS DateTime), 18, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (110, N'f', N'f', NULL, 6, N'Material', NULL, CAST(N'2018-06-22T16:01:05.553' AS DateTime), 18, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (111, N'g', N'g', NULL, 7, N'Material', NULL, CAST(N'2018-06-22T16:01:10.420' AS DateTime), 18, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (112, N'd', N'd', NULL, 5, N'Material', NULL, CAST(N'2018-06-22T16:06:51.253' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (113, N'f', N'f', NULL, 6, N'Material', NULL, CAST(N'2018-06-22T16:06:51.260' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (114, N'g', N'g', NULL, 7, N'Material', NULL, CAST(N'2018-06-22T16:06:51.263' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (115, N'Brick', N'طوب', NULL, 5, N'Material', NULL, CAST(N'2018-06-22T16:11:22.310' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (116, N'Sandbox', N'رمل', NULL, 6, N'Material', NULL, CAST(N'2018-06-22T16:11:22.317' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (117, N'steel', N'حديد', NULL, 7, N'Material', NULL, CAST(N'2018-06-22T16:11:22.320' AS DateTime), 18, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (118, N'Dresses', N'فساتين', NULL, 8, N'RentalType', NULL, CAST(N'2018-06-22T16:14:52.547' AS DateTime), 14, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (119, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 23, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T16:22:59.893' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (120, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 24, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T16:22:59.893' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (121, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 25, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T16:22:59.897' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (122, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 26, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T16:22:59.897' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (123, N'Temperley London', N'تمبرلي لندن', NULL, 6, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.790' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (124, N'Temperley London', N'تمبرلي لندن', NULL, 7, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.790' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (125, N'Fendi', N'فندي', NULL, 8, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.790' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (126, N'Fendi', N'فندي', NULL, 9, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.793' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (127, N'Valentino', N'فالنتينو', NULL, 10, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.793' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (128, N'Valentino', N'فالنتينو', NULL, 11, N'Mark', NULL, CAST(N'2018-06-22T16:40:19.797' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (129, N's', N's', NULL, 12, N'Mark', NULL, CAST(N'2018-06-22T16:43:02.120' AS DateTime), 13, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (130, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 26, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T16:46:44.883' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (131, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 27, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T16:46:44.887' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (132, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 28, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T16:46:44.890' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (133, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 29, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:19.657' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (134, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 30, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:19.670' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (135, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:27.630' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (136, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:27.630' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (137, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 0, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:27.633' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (138, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 31, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:30.663' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (139, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 32, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:23:30.667' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (140, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 30, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:29:13.903' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (141, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 29, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:29:23.317' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (142, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 33, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:29:42.917' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (143, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 31, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:31:32.983' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (144, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 32, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:31:33.007' AS DateTime), 16, 3, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (145, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 34, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:31:54.020' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (146, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 35, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:31:54.037' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (147, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 36, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:32:00.790' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (148, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 37, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:32:25.103' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (149, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 38, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:50:42.583' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (150, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 39, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T21:50:42.610' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (151, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 27, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:19:49.867' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (152, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 28, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:19:49.873' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (153, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 29, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:20:04.650' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (154, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 30, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:20:04.650' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (155, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 31, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:21:43.333' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (156, N'Color', N'اللون', NULL, 31, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:21:49.127' AS DateTime), 17, 2, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (157, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 32, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:22:52.833' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (158, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 33, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:22:52.833' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (159, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 34, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:22:52.837' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (160, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 35, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:22:52.837' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (161, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 36, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:27:33.737' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (162, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 37, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:27:33.740' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (163, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 38, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:27:33.743' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (164, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 39, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:27:33.747' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (165, N'حقل فئة التاجير', N'حقل فئة التاجير', NULL, 40, N'RentalCategoryInput', NULL, CAST(N'2018-06-22T22:27:33.753' AS DateTime), 17, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (166, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 40, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T22:28:44.833' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (167, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 41, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T22:28:44.833' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (168, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 42, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T22:28:58.577' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (169, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 43, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T22:28:58.577' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (170, N'ماركة فئة التاجير', N'ماركة فئة التاجير', NULL, 44, N'RentalCategoryMark', NULL, CAST(N'2018-06-22T22:28:58.580' AS DateTime), 16, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (171, N'خامة فئة التاجير', N'خامة فئة التاجير', NULL, 1, N'RentalCategoryMaterial', NULL, CAST(N'2018-06-23T00:03:29.303' AS DateTime), 19, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (172, N'خامة فئة التاجير', N'خامة فئة التاجير', NULL, 2, N'RentalCategoryMaterial', NULL, CAST(N'2018-06-23T00:03:35.953' AS DateTime), 19, 1, 1, 0)
INSERT [dbo].[Notifications] ([Id], [TargetNameEn], [TargetNameAr], [TargetName], [FKTarget_Id], [TableNameResources], [Url], [DateTime], [FKNotificationPagesId], [FKNotificationTypeActionId], [UserId], [IsBackend]) VALUES (173, N'خامة فئة التاجير', N'خامة فئة التاجير', NULL, 3, N'RentalCategoryMaterial', NULL, CAST(N'2018-06-23T00:03:35.957' AS DateTime), 19, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
SET IDENTITY_INSERT [dbo].[NotificationsDescriptionDatas] ON 

INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (1, 10, N'NameEn', N'saas', N'saas1111', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (2, 15, N'NameAr', N'ahmedeeb', N'سيارات', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (3, 15, N'NameEn', N'saas1111', N'Cars', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (4, 16, N'NameAr', N'fdf', N'عقارات', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (5, 16, N'NameEn', N'dsd', N'Build', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (6, 18, N'NameAr', N's', N'قاعات', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (7, 18, N'NameEn', N's', N'قاعات', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (8, 19, N'NameEn', N'قاعات', N'Laps', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (9, 23, N'NameEn', N'F', N'FB', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (10, 25, N'NameAr', N'F', N'لانسر', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (11, 25, N'NameEn', N'FB', N'lancer', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (12, 76, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (13, 80, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (14, 81, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (15, 82, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (16, 89, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (17, 90, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (18, 91, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (19, 92, N'IsRequired', N'True', N'False', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (20, 93, N'IsRequired', N'True', N'False', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (21, 94, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (22, 95, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (23, 96, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (24, 102, N'IsRequired', N'False', N'True', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (25, 112, N'NameAr', N'd', N'طوب', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (26, 112, N'NameEn', N'd', N'Brick', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (27, 113, N'NameAr', N'f', N'رمل', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (28, 113, N'NameEn', N'f', N'Sandbox', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (29, 114, N'NameAr', N'g', N'حديد', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (30, 114, N'NameEn', N'g', N'steel', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (31, 115, N'NameAr', N'طوب', N'بلستر', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (32, 115, N'NameEn', N'Brick', N'Polyester', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (33, 116, N'NameAr', N'رمل', N'حرير', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (34, 116, N'NameEn', N'Sandbox', N'Silk', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (35, 117, N'NameAr', N'حديد', N'ستان', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (36, 117, N'NameEn', N'steel', N'Stan', NULL)
INSERT [dbo].[NotificationsDescriptionDatas] ([Id], [FKNotification_Id], [ColumnResourseName], [ColumnOldData], [ColumnNewDate], [IsNameEn]) VALUES (37, 156, N'IsRequired', N'False', N'True', NULL)
SET IDENTITY_INSERT [dbo].[NotificationsDescriptionDatas] OFF
SET IDENTITY_INSERT [dbo].[NotificationsPages] ON 

INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (2, N'Users', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (3, N'Month', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (4, N'Jobs', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (5, N'Gender', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (6, N'Date', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (7, N'Countries', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (8, N'Cities', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (9, N'Privileges', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (10, N'PrivilegeRoles', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (11, N'UserLogins', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (12, N'UserRoles', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (13, N'Marks ', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (14, N'RentalTypes', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (15, N'RentalCategories', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (16, N'RentalCategoryMarks', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (17, N'RentalCategoryInputs', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (18, N'Materials', 1)
INSERT [dbo].[NotificationsPages] ([Id], [Name], [IsAllow]) VALUES (19, N'RentalCategoryMaterials', 1)
SET IDENTITY_INSERT [dbo].[NotificationsPages] OFF
SET IDENTITY_INSERT [dbo].[NotificationTypeActions] ON 

INSERT [dbo].[NotificationTypeActions] ([Id], [NameAr], [NameEn], [ClassIcon], [BackgroundClass]) VALUES (1, N'اضافة', N'Add', N'Add', N'Add')
INSERT [dbo].[NotificationTypeActions] ([Id], [NameAr], [NameEn], [ClassIcon], [BackgroundClass]) VALUES (2, N'تعديد', N'Edit', N'Add', N'Add')
INSERT [dbo].[NotificationTypeActions] ([Id], [NameAr], [NameEn], [ClassIcon], [BackgroundClass]) VALUES (3, N'حذف', N'Delete', N'Add', N'Add')
SET IDENTITY_INSERT [dbo].[NotificationTypeActions] OFF
SET IDENTITY_INSERT [dbo].[PrivilegeRoles] ON 

INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (2, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (4, 1, 3, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (5, 1, 4, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (6, 1, 5, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (7, 1, 6, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (9, 1, 8, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (10, 1, 9, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (11, 1, 10, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (13, 1, 12, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (14, 1, 13, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (15, 1, 14, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (16, 1, 15, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (17, 1, 16, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (18, 1, 17, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (19, 1, 26, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (20, 1, 29, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (21, 1, 30, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (22, 1, 31, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (24, 1, 32, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (25, 1, 33, 1, 1, 1, 1)
INSERT [dbo].[PrivilegeRoles] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (26, 1, 34, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PrivilegeRoles] OFF
SET IDENTITY_INSERT [dbo].[Privileges] ON 

INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (2, N'Setting', NULL, NULL, NULL, 1, N'fas fa-cogs', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (3, N'Cities', 2, N'/Cities', 1, 1, N'fas fa-map-marker', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (4, N'Countries', 2, N'/Countries', 1, 2, N'fas fa-map', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (5, N'Jobs', 2, N'/Jobs', 1, 3, N'fas fa-briefcase', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (6, N'Gender', 2, N'/Genders', 1, 4, N'fas fa-transgender', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (8, N'Date', 2, N'/Date', 1, 6, N'far fa-calendar-alt', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (9, N'DateType', 2, N'/DateTypes', 1, 7, N'fas fa-calendar', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (10, N'Months', 2, N'/Month', 1, 8, N'far fa-calendar', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (12, N'NotificationTypeAction', 2, N'/NotificationTypeAction', 1, 10, N'fas fa-flag', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (13, N'NotificationsPages', 2, N'/NotificationsPages', 1, 11, N'far fa-flag', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (14, N'NotificationsRoles', 2, N'/NotificationsRoles', 1, 12, N'fas fa-bell', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (15, N'PrivilegeRoles', 2, N'/PrivilegeRoles', 1, 13, N'fas fa-bars', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (16, N'Privileges', 2, N'/Privileges', 1, 14, N'fas fa-ellipsis-v', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (17, N'ManageUsers', NULL, NULL, NULL, 2, N'fas fa-user-cog', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (22, N'Users', 17, N'/Users', 1, 1, N'fas fa-users', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (23, N'UserLogin', 17, N'/UserLogin', 1, 2, N'fas fa-user-clock', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (24, N'MangeUsers', 17, N'/MangeUsers', 1, 3, N'fas fa-users-cog', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (25, N'Rental', 3, NULL, NULL, 3, N'fas fa-box', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (26, N'RentalTypes', 25, N'/RentalTypes', 1, 1, N'fas fa-boxes', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (29, N'RentalCategories', 25, N'/RentalCategories', 1, 2, N'fas fa-boxes', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (30, N'Marks', 2, N'/Marks', 1, 15, N'fas fa-thumbtack', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (31, N'RentalCategoryMarks', 25, N'/RentalCategoryMarks', 1, 3, N'fas fa-thumbtack', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (32, N'RentalCategoryInputs', 25, N'/RentalCategoryInputs', 1, 4, N'fas fa-align-center', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (33, N'Materials', 2, N'/Materials', 1, 16, N'fas fa-adjust', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (34, N'RentalCategoryMaterials', 25, N'/RentalCategoryMaterials', 1, 5, N'fas fa-adjust', 1, 0)
SET IDENTITY_INSERT [dbo].[Privileges] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Notes]) VALUES (1, N'Manager', N'المدير')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SocialStatus] ON 

INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (1, N'اعزب', N'Single')
SET IDENTITY_INSERT [dbo].[SocialStatus] OFF
SET IDENTITY_INSERT [dbo].[UserDatas] ON 

INSERT [dbo].[UserDatas] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (4, N'Ahmed', N'Nageeb', N'Mahmoud', N'1236', N'01013056689', N'01025249400', CAST(N'1994-01-05T00:00:00.000' AS DateTime), 1, 1, 1, 1, 1, CAST(N'2018-06-19T00:00:00.000' AS DateTime), N'en')
SET IDENTITY_INSERT [dbo].[UserDatas] OFF
SET IDENTITY_INSERT [dbo].[UserLogins] ON 

INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (1, 1, 0, 0, CAST(N'2018-06-19T13:59:06.837' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (2, 1, 1, 0, CAST(N'2018-06-19T13:59:40.033' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (3, 1, 1, 0, CAST(N'2018-06-19T14:26:46.120' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (4, 1, 1, 0, CAST(N'2018-06-19T15:10:10.923' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (5, 1, 1, 0, CAST(N'2018-06-20T02:43:14.087' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (6, 1, 1, 0, CAST(N'2018-06-21T00:57:03.273' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (7, 1, 1, 0, CAST(N'2018-06-22T04:08:49.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (1, 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FkUserDataId__Id_], [SerialNumber], [IsBlock]) VALUES (1, N'Ahmed', N'Ahmed@gmail.com', N'01013056689', 4, N'1245', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_FK_Address_Cities]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Cities] ON [dbo].[Addresses]
(
	[FKCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Address_Countries]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Countries] ON [dbo].[Addresses]
(
	[FKCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Cities_Countries]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Cities_Countries] ON [dbo].[Cities]
(
	[FkCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Date_DateType]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Date_DateType] ON [dbo].[Dates]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Date_LogHistory]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Date_LogHistory] ON [dbo].[Dates]
(
	[FKLogHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LogHistory_Users]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LogHistory_Users] ON [dbo].[LogHistories]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Month_DateType]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Month_DateType] ON [dbo].[Months]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationRead_Notifications]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationRead_Notifications] ON [dbo].[NotificationReads]
(
	[FKNotification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationReadBackEnd_Users]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationReadBackEnd_Users] ON [dbo].[NotificationReads]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesNotifications_NotificationTypeBackEnd]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesNotifications_NotificationTypeBackEnd] ON [dbo].[NotificationRoles]
(
	[FKNotificationsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesNotificationsBackEnd_Role]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesNotificationsBackEnd_Role] ON [dbo].[NotificationRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Notifications_NotificationsPages]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Notifications_NotificationsPages] ON [dbo].[Notifications]
(
	[FKNotificationPagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Notifications_NotificationTypeAction]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Notifications_NotificationTypeAction] ON [dbo].[Notifications]
(
	[FKNotificationTypeActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationsDescriptionData_Notifications]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationsDescriptionData_Notifications] ON [dbo].[NotificationsDescriptionDatas]
(
	[FKNotification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolePrivileges_Privileges]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolePrivileges_Privileges] ON [dbo].[PrivilegeRoles]
(
	[FKPrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolePrivileges_Role]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolePrivileges_Role] ON [dbo].[PrivilegeRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Privileges_Privileges1]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Privileges_Privileges1] ON [dbo].[Privileges]
(
	[FKParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Address]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Address] ON [dbo].[UserDatas]
(
	[FkAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Gender]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Gender] ON [dbo].[UserDatas]
(
	[FkGenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Images]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Images] ON [dbo].[UserDatas]
(
	[FKImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Jops]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Jops] ON [dbo].[UserDatas]
(
	[FKJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_UaserData]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_UaserData] ON [dbo].[UserDatas]
(
	[FkSocialStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserLogin_Users]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserLogin_Users] ON [dbo].[UserLogins]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_LogHistory]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_LogHistory] ON [dbo].[UserRoles]
(
	[FKLogHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Role]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Role] ON [dbo].[UserRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Users1]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Users1] ON [dbo].[UserRoles]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UaserData]    Script Date: 6/23/2018 12:24:15 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_UaserData] ON [dbo].[Users]
(
	[FkUserDataId__Id_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Ads].[RentalCategoryInputs] ADD  CONSTRAINT [DF_RentalCategoryInputs_FKRentalCategory_Id]  DEFAULT ((0)) FOR [FKRentalCategory_Id]
GO
ALTER TABLE [Ads].[AdAlbums]  WITH CHECK ADD  CONSTRAINT [FK_AdAlbums_ImageAlbum] FOREIGN KEY([FKImageAlbum_Id])
REFERENCES [dbo].[ImageAlbum] ([Id])
GO
ALTER TABLE [Ads].[AdAlbums] CHECK CONSTRAINT [FK_AdAlbums_ImageAlbum]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_Ads]
GO
ALTER TABLE [Ads].[AdComment]  WITH CHECK ADD  CONSTRAINT [FK_AdComment_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[AdComment] CHECK CONSTRAINT [FK_AdComment_LogHistories]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_FreeSizes] FOREIGN KEY([FKFreeSize_Id])
REFERENCES [dbo].[FreeSizes] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_FreeSizes]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Locations] FOREIGN KEY([FKLocation_Id])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_Locations]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Marks] FOREIGN KEY([FKMark_Id])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_Marks]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Martials] FOREIGN KEY([FKMatrial_Id])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_Martials]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Months] FOREIGN KEY([Id])
REFERENCES [dbo].[Months] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_Months]
GO
ALTER TABLE [Ads].[AdDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdDetails_Sizes] FOREIGN KEY([FKSize_Id])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [Ads].[AdDetails] CHECK CONSTRAINT [FK_AdDetails_Sizes]
GO
ALTER TABLE [Ads].[AdFavorites]  WITH CHECK ADD  CONSTRAINT [FK_AdFavorites_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdFavorites] CHECK CONSTRAINT [FK_AdFavorites_Ads]
GO
ALTER TABLE [Ads].[AdInputs]  WITH CHECK ADD  CONSTRAINT [FK_AdInputs_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdInputs] CHECK CONSTRAINT [FK_AdInputs_Ads]
GO
ALTER TABLE [Ads].[AdInputs]  WITH CHECK ADD  CONSTRAINT [FK_AdInputs_Inputs] FOREIGN KEY([FKInput_Id])
REFERENCES [Ads].[Inputs] ([Id])
GO
ALTER TABLE [Ads].[AdInputs] CHECK CONSTRAINT [FK_AdInputs_Inputs]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_AdAlbums] FOREIGN KEY([FKAdAlbum_Id])
REFERENCES [Ads].[AdAlbums] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_AdAlbums]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_AdDetails] FOREIGN KEY([FKAdDetails_Id])
REFERENCES [Ads].[AdDetails] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_AdDetails]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Ads] FOREIGN KEY([Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_Ads]
GO
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_LeaseTermTypes] FOREIGN KEY([FKLeaseTermType_Id])
REFERENCES [Ads].[LeaseTermTypes] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_LeaseTermTypes]
GO
ALTER TABLE [Ads].[AdSection]  WITH CHECK ADD  CONSTRAINT [FK_AdSection_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdSection] CHECK CONSTRAINT [FK_AdSection_Ads]
GO
ALTER TABLE [Ads].[AdSection]  WITH CHECK ADD  CONSTRAINT [FK_AdSection_SectionItems1] FOREIGN KEY([FKSctionItem_Id])
REFERENCES [Ads].[SectionItems] ([Id])
GO
ALTER TABLE [Ads].[AdSection] CHECK CONSTRAINT [FK_AdSection_SectionItems1]
GO
ALTER TABLE [Ads].[AdSection]  WITH CHECK ADD  CONSTRAINT [FK_AdSection_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[AdSection] CHECK CONSTRAINT [FK_AdSection_SectionTypes]
GO
ALTER TABLE [Ads].[AdVisitors]  WITH CHECK ADD  CONSTRAINT [FK_AdVisitors_Ads] FOREIGN KEY([FKAd_Id])
REFERENCES [Ads].[Ads] ([Id])
GO
ALTER TABLE [Ads].[AdVisitors] CHECK CONSTRAINT [FK_AdVisitors_Ads]
GO
ALTER TABLE [Ads].[Inputs]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_InputsType] FOREIGN KEY([FKInputsType_Id])
REFERENCES [Ads].[InputsType] ([Id])
GO
ALTER TABLE [Ads].[Inputs] CHECK CONSTRAINT [FK_Inputs_InputsType]
GO
ALTER TABLE [Ads].[RentalCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_Images]
GO
ALTER TABLE [Ads].[RentalCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_RentalType]
GO
ALTER TABLE [Ads].[RentalCategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_Inputs] FOREIGN KEY([FKInput_Id])
REFERENCES [Ads].[Inputs] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_Inputs]
GO
ALTER TABLE [Ads].[RentalCategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_RentalCategories]
GO
ALTER TABLE [Ads].[RentalCategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryInputs] CHECK CONSTRAINT [FK_RentalCategoryInputs_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryInputs] CHECK CONSTRAINT [FK_RentalCategoryInputs_RentalTypes]
GO
ALTER TABLE [Ads].[RentalCategoryItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryItems_Locations] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Locations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalCategoryItems] CHECK CONSTRAINT [FK_RentalCategoryItems_Locations]
GO
ALTER TABLE [Ads].[RentalCategoryItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryItems_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryItems] CHECK CONSTRAINT [FK_RentalCategoryItems_RentalTypes]
GO
ALTER TABLE [Ads].[RentalCategoryItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryItems] CHECK CONSTRAINT [FK_RentalItems_RentalCategories]
GO
ALTER TABLE [Ads].[RentalCategoryItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_SectionItems] FOREIGN KEY([FKSectionItem_Id])
REFERENCES [Ads].[SectionItems] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryItems] CHECK CONSTRAINT [FK_RentalItems_SectionItems]
GO
ALTER TABLE [Ads].[RentalCategoryMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalCategoryMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategoryMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_RentalTypes]
GO
ALTER TABLE [Ads].[RentalCategoryMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_Marks] FOREIGN KEY([FKMark_Id])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryMarks] CHECK CONSTRAINT [FK_RentalMarks_Marks]
GO
ALTER TABLE [Ads].[RentalCategoryMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryMarks] CHECK CONSTRAINT [FK_RentalMarks_RentalCategories]
GO
ALTER TABLE [Ads].[RentalCategoryMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalCategoryMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategoryMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalCategoryMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes]
GO
ALTER TABLE [Ads].[RentalCategoryMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterial_Material] FOREIGN KEY([FKMaterial_Id])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryMaterials] CHECK CONSTRAINT [FK_RentalMaterial_Material]
GO
ALTER TABLE [Ads].[RentalCategoryMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterial_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategoryMaterials] CHECK CONSTRAINT [FK_RentalMaterial_RentalCategories]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategorySections_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalCategorySections_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategorySections_RentalTypes] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalCategorySections_RentalTypes]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_InputsType] FOREIGN KEY([FKInputType_Id])
REFERENCES [Ads].[InputsType] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalSections_InputsType]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalSections_RentalCategories]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalSections] FOREIGN KEY([Id])
REFERENCES [Ads].[RentalCategorySections] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalSections_RentalSections]
GO
ALTER TABLE [Ads].[RentalCategorySections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategorySections] CHECK CONSTRAINT [FK_RentalSections_SectionTypes]
GO
ALTER TABLE [Ads].[RentalTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalType_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [Ads].[RentalTypes] CHECK CONSTRAINT [FK_RentalType_Images]
GO
ALTER TABLE [Ads].[RentalTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalTypes_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalTypes] CHECK CONSTRAINT [FK_RentalTypes_LogHistories]
GO
ALTER TABLE [Ads].[SectionItems]  WITH CHECK ADD  CONSTRAINT [FK_SectionItems_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[SectionItems] CHECK CONSTRAINT [FK_SectionItems_SectionTypes]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([FKCityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Address_Countries] FOREIGN KEY([FKCountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Address_Countries]
GO
ALTER TABLE [dbo].[AlbumImages]  WITH CHECK ADD  CONSTRAINT [FK_AlbumImages_ImageAlbum] FOREIGN KEY([FKImageAlbum_Id])
REFERENCES [dbo].[ImageAlbum] ([Id])
GO
ALTER TABLE [dbo].[AlbumImages] CHECK CONSTRAINT [FK_AlbumImages_ImageAlbum]
GO
ALTER TABLE [dbo].[AlbumImages]  WITH CHECK ADD  CONSTRAINT [FK_AlbumImages_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[AlbumImages] CHECK CONSTRAINT [FK_AlbumImages_Images]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FkCountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_ContactUs_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ContactUs] CHECK CONSTRAINT [FK_ContactUs_Users]
GO
ALTER TABLE [dbo].[Dates]  WITH CHECK ADD  CONSTRAINT [FK_Date_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateTypes] ([Id])
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Date_DateType]
GO
ALTER TABLE [dbo].[Dates]  WITH CHECK ADD  CONSTRAINT [FK_Date_LogHistory] FOREIGN KEY([FKLogHistoryId])
REFERENCES [dbo].[LogHistories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Date_LogHistory]
GO
ALTER TABLE [dbo].[LogHistories]  WITH CHECK ADD  CONSTRAINT [FK_LogHistory_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LogHistories] CHECK CONSTRAINT [FK_LogHistory_Users]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_LogHistories]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Material _LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Material _LogHistories]
GO
ALTER TABLE [dbo].[Months]  WITH CHECK ADD  CONSTRAINT [FK_Month_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateTypes] ([Id])
GO
ALTER TABLE [dbo].[Months] CHECK CONSTRAINT [FK_Month_DateType]
GO
ALTER TABLE [dbo].[NotificationReads]  WITH CHECK ADD  CONSTRAINT [FK_NotificationRead_Notifications] FOREIGN KEY([FKNotification_Id])
REFERENCES [dbo].[Notifications] ([Id])
GO
ALTER TABLE [dbo].[NotificationReads] CHECK CONSTRAINT [FK_NotificationRead_Notifications]
GO
ALTER TABLE [dbo].[NotificationReads]  WITH CHECK ADD  CONSTRAINT [FK_NotificationReadBackEnd_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NotificationReads] CHECK CONSTRAINT [FK_NotificationReadBackEnd_Users]
GO
ALTER TABLE [dbo].[NotificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_RolesNotifications_NotificationTypeBackEnd] FOREIGN KEY([FKNotificationsTypeId])
REFERENCES [dbo].[NotificationsPages] ([Id])
GO
ALTER TABLE [dbo].[NotificationRoles] CHECK CONSTRAINT [FK_RolesNotifications_NotificationTypeBackEnd]
GO
ALTER TABLE [dbo].[NotificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_RolesNotificationsBackEnd_Role] FOREIGN KEY([FKRoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[NotificationRoles] CHECK CONSTRAINT [FK_RolesNotificationsBackEnd_Role]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_NotificationsPages] FOREIGN KEY([FKNotificationPagesId])
REFERENCES [dbo].[NotificationsPages] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_NotificationsPages]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_NotificationTypeAction] FOREIGN KEY([FKNotificationTypeActionId])
REFERENCES [dbo].[NotificationTypeActions] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_NotificationTypeAction]
GO
ALTER TABLE [dbo].[NotificationsDescriptionDatas]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsDescriptionData_Notifications] FOREIGN KEY([FKNotification_Id])
REFERENCES [dbo].[Notifications] ([Id])
GO
ALTER TABLE [dbo].[NotificationsDescriptionDatas] CHECK CONSTRAINT [FK_NotificationsDescriptionData_Notifications]
GO
ALTER TABLE [dbo].[PagesManagement]  WITH CHECK ADD  CONSTRAINT [FK_PagesManagement_PagesManagement] FOREIGN KEY([FKPrivilege_Id])
REFERENCES [dbo].[Privileges] ([Id])
GO
ALTER TABLE [dbo].[PagesManagement] CHECK CONSTRAINT [FK_PagesManagement_PagesManagement]
GO
ALTER TABLE [dbo].[PagesManagement]  WITH CHECK ADD  CONSTRAINT [FK_PagesManagement_Seo] FOREIGN KEY([FKSeo_Id])
REFERENCES [dbo].[Seo] ([Id])
GO
ALTER TABLE [dbo].[PagesManagement] CHECK CONSTRAINT [FK_PagesManagement_Seo]
GO
ALTER TABLE [dbo].[PrivilegeRoles]  WITH CHECK ADD  CONSTRAINT [FK_RolePrivileges_Privileges] FOREIGN KEY([FKPrivilegeId])
REFERENCES [dbo].[Privileges] ([Id])
GO
ALTER TABLE [dbo].[PrivilegeRoles] CHECK CONSTRAINT [FK_RolePrivileges_Privileges]
GO
ALTER TABLE [dbo].[PrivilegeRoles]  WITH CHECK ADD  CONSTRAINT [FK_RolePrivileges_Role] FOREIGN KEY([FKRoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[PrivilegeRoles] CHECK CONSTRAINT [FK_RolePrivileges_Role]
GO
ALTER TABLE [dbo].[PrivilegeRoles]  WITH CHECK ADD  CONSTRAINT [FK_RolePrivileges_RolePrivileges] FOREIGN KEY([Id])
REFERENCES [dbo].[PrivilegeRoles] ([Id])
GO
ALTER TABLE [dbo].[PrivilegeRoles] CHECK CONSTRAINT [FK_RolePrivileges_RolePrivileges]
GO
ALTER TABLE [dbo].[Privileges]  WITH CHECK ADD  CONSTRAINT [FK_Privileges_Privileges1] FOREIGN KEY([FKParentId])
REFERENCES [dbo].[Privileges] ([Id])
GO
ALTER TABLE [dbo].[Privileges] CHECK CONSTRAINT [FK_Privileges_Privileges1]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Address] FOREIGN KEY([FkAddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Address]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Gender] FOREIGN KEY([FkGenderId])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Gender]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Images] FOREIGN KEY([FKImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Images]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Jops] FOREIGN KEY([FKJobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Jops]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_UaserData] FOREIGN KEY([FkSocialStatusId])
REFERENCES [dbo].[SocialStatus] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_UaserData]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogin_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_LogHistory] FOREIGN KEY([FKLogHistoryId])
REFERENCES [dbo].[LogHistories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_LogHistory]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([FKRoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users1] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UaserData] FOREIGN KEY([FkUserDataId__Id_])
REFERENCES [dbo].[UserDatas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UaserData]
GO
USE [master]
GO
ALTER DATABASE [Rental] SET  READ_WRITE 
GO
