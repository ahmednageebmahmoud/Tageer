USE [master]
GO
/****** Object:  Database [Rental]    Script Date: 6/19/2018 7:35:26 PM ******/
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
/****** Object:  Schema [Ads]    Script Date: 6/19/2018 7:35:26 PM ******/
CREATE SCHEMA [Ads]
GO
/****** Object:  Table [Ads].[AdAlbums]    Script Date: 6/19/2018 7:35:26 PM ******/
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
/****** Object:  Table [Ads].[AdComment]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[AdDetails]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[AdFavorites]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[AdInputs]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[Ads]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[AdSection]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[AdVisitors]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[CategoryInputs]    Script Date: 6/19/2018 7:35:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[CategoryInputs](
	[Id] [int] NOT NULL,
	[IsRequired] [nchar](10) NOT NULL,
	[FKRentalType_Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRentalCategory _Id] [int] NULL,
	[FKInput_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_CategoryInputs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[Inputs]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[InputsType]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[LeaseTermTypes]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[RentalCategories]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[RentalItems]    Script Date: 6/19/2018 7:35:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
	[FKRentalCategory _Id] [int] NULL,
	[FKSectionItem_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalSections]    Script Date: 6/19/2018 7:35:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalSections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSectionType_Id] [int] NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
	[FKRentalCategory _Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalType]    Script Date: 6/19/2018 7:35:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalType](
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
/****** Object:  Table [Ads].[SectionItems]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [Ads].[SectionTypes]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[AlbumImages]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[Dates]    Script Date: 6/19/2018 7:35:27 PM ******/
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
/****** Object:  Table [dbo].[DateTypes]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[FreeSizes]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[ImageAlbum]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[LogHistories]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Marks]    Script Date: 6/19/2018 7:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKRentalType_Id] [int] NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Martials]    Script Date: 6/19/2018 7:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Martials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
	[FKCategoryRental _Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
 CONSTRAINT [PK_Martials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[NotificationReads]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[NotificationRoles]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[NotificationsDescriptionDatas]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[NotificationsPages]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[NotificationTypeActions]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[PagesManagement]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[PrivilegeRoles]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Privileges]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Seo]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[UserDatas]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/19/2018 7:35:28 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/19/2018 7:35:28 PM ******/
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
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (1, N'22 street', 55, 1, 2)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (2, N'القاهرة', N'cairo', 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn]) VALUES (1, N'مصر', N'egypt')
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

INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (1, N'~/Files/Images/Users/Profile/userDefult.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (1, N'مطور', N'developer')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[LogHistories] ON 

INSERT [dbo].[LogHistories] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[LogHistories] OFF
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
SET IDENTITY_INSERT [dbo].[NotificationRoles] OFF
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
SET IDENTITY_INSERT [dbo].[NotificationsPages] OFF
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
SET IDENTITY_INSERT [dbo].[PrivilegeRoles] OFF
SET IDENTITY_INSERT [dbo].[Privileges] ON 

INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (2, N'Setting', NULL, NULL, NULL, 1, N'fas fa-cogs', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (3, N'Cities', 2, N'/Cities', 1, 1, N'fas fa-map-marker', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (4, N'Countries', 2, N'/Countries', 1, 2, N'fas fa-map', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (5, N'Jobs', 2, N'/Jobs', 1, 3, N'fas fa-briefcase', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (6, N'Gender', 2, N'/Genders', 1, 4, N'fas fa-transgender', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (8, N'Date', 2, N'/Dates', 1, 6, N'far fa-calendar-alt', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (9, N'DateType', 2, N'/DateTypes', 1, 7, N'fas fa-calendar', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (10, N'Months', 2, N'/Month', 1, 8, N'far fa-calendar', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (12, N'NotificationTypeAction', 2, N'/NotificationTypeActions', 1, 10, N'fas fa-flag', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (13, N'NotificationsPages', 2, N'/NotificationsPages', 1, 11, N'far fa-flag', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (14, N'NotificationsRoles', 2, N'/NotificationsRoles', 1, 12, N'fas fa-bell', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (15, N'PrivilegeRoles', 2, N'/PrivilegeRoles', 1, 13, N'fas fa-bars', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (16, N'Privileges', 2, N'/Privileges', 1, 14, N'fas fa-ellipsis-v', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (17, N'ManageUsers', NULL, NULL, NULL, 2, N'fas fa-user-cog', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (22, N'Users', 17, N'/Users', 1, 1, N'fas fa-users', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (23, N'UserLogin', 17, N'/UserLogin', 1, 2, N'fas fa-user-clock', 1, 0)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [IsBackEnd], [IsParent]) VALUES (24, N'MangeUsers', 17, N'/MangeUsers', 1, 3, N'fas fa-users-cog', 1, 0)
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
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (1, 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FkUserDataId__Id_], [SerialNumber], [IsBlock]) VALUES (1, N'Ahmed', N'Ahmed@gmail.com', N'01013056689', 4, N'1245', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_FK_Address_Cities]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Cities] ON [dbo].[Addresses]
(
	[FKCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Address_Countries]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Countries] ON [dbo].[Addresses]
(
	[FKCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Cities_Countries]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Cities_Countries] ON [dbo].[Cities]
(
	[FkCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Date_DateType]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Date_DateType] ON [dbo].[Dates]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Date_LogHistory]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Date_LogHistory] ON [dbo].[Dates]
(
	[FKLogHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LogHistory_Users]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LogHistory_Users] ON [dbo].[LogHistories]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Month_DateType]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Month_DateType] ON [dbo].[Months]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationRead_Notifications]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationRead_Notifications] ON [dbo].[NotificationReads]
(
	[FKNotification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationReadBackEnd_Users]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationReadBackEnd_Users] ON [dbo].[NotificationReads]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesNotifications_NotificationTypeBackEnd]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesNotifications_NotificationTypeBackEnd] ON [dbo].[NotificationRoles]
(
	[FKNotificationsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesNotificationsBackEnd_Role]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesNotificationsBackEnd_Role] ON [dbo].[NotificationRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Notifications_NotificationsPages]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Notifications_NotificationsPages] ON [dbo].[Notifications]
(
	[FKNotificationPagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Notifications_NotificationTypeAction]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Notifications_NotificationTypeAction] ON [dbo].[Notifications]
(
	[FKNotificationTypeActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NotificationsDescriptionData_Notifications]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NotificationsDescriptionData_Notifications] ON [dbo].[NotificationsDescriptionDatas]
(
	[FKNotification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolePrivileges_Privileges]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolePrivileges_Privileges] ON [dbo].[PrivilegeRoles]
(
	[FKPrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolePrivileges_Role]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolePrivileges_Role] ON [dbo].[PrivilegeRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Privileges_Privileges1]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Privileges_Privileges1] ON [dbo].[Privileges]
(
	[FKParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Address]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Address] ON [dbo].[UserDatas]
(
	[FkAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Gender]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Gender] ON [dbo].[UserDatas]
(
	[FkGenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Images]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Images] ON [dbo].[UserDatas]
(
	[FKImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Jops]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Jops] ON [dbo].[UserDatas]
(
	[FKJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_UaserData]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_UaserData] ON [dbo].[UserDatas]
(
	[FkSocialStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserLogin_Users]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserLogin_Users] ON [dbo].[UserLogins]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_LogHistory]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_LogHistory] ON [dbo].[UserRoles]
(
	[FKLogHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Role]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Role] ON [dbo].[UserRoles]
(
	[FKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Users1]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Users1] ON [dbo].[UserRoles]
(
	[FKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UaserData]    Script Date: 6/19/2018 7:35:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_UaserData] ON [dbo].[Users]
(
	[FkUserDataId__Id_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
REFERENCES [dbo].[Martials] ([Id])
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
ALTER TABLE [Ads].[AdFavorites]  WITH CHECK ADD  CONSTRAINT [FK_AdFavorites_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[AdFavorites] CHECK CONSTRAINT [FK_AdFavorites_LogHistories]
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
ALTER TABLE [Ads].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[Ads] CHECK CONSTRAINT [FK_Ads_LogHistories]
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
ALTER TABLE [Ads].[CategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_Inputs] FOREIGN KEY([FKInput_Id])
REFERENCES [Ads].[Inputs] ([Id])
GO
ALTER TABLE [Ads].[CategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_Inputs]
GO
ALTER TABLE [Ads].[CategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[CategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_LogHistories]
GO
ALTER TABLE [Ads].[CategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_RentalCategories] FOREIGN KEY([FKRentalCategory _Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[CategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_RentalCategories]
GO
ALTER TABLE [Ads].[CategoryInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalType] ([Id])
GO
ALTER TABLE [Ads].[CategoryInputs] CHECK CONSTRAINT [FK_CategoryInputs_RentalType]
GO
ALTER TABLE [Ads].[Inputs]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_InputsType] FOREIGN KEY([Id])
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
REFERENCES [Ads].[RentalType] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_RentalType]
GO
ALTER TABLE [Ads].[RentalItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalItems] CHECK CONSTRAINT [FK_RentalItems_LogHistories]
GO
ALTER TABLE [Ads].[RentalItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_RentalCategories] FOREIGN KEY([FKRentalCategory _Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalItems] CHECK CONSTRAINT [FK_RentalItems_RentalCategories]
GO
ALTER TABLE [Ads].[RentalItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalType] ([Id])
GO
ALTER TABLE [Ads].[RentalItems] CHECK CONSTRAINT [FK_RentalItems_RentalType]
GO
ALTER TABLE [Ads].[RentalItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_SectionItems] FOREIGN KEY([FKSectionItem_Id])
REFERENCES [Ads].[SectionItems] ([Id])
GO
ALTER TABLE [Ads].[RentalItems] CHECK CONSTRAINT [FK_RentalItems_SectionItems]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_InputsType] FOREIGN KEY([FKInputType_Id])
REFERENCES [Ads].[InputsType] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_InputsType]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_LogHistories]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalCategories] FOREIGN KEY([FKRentalCategory _Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_RentalCategories]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalSections] FOREIGN KEY([Id])
REFERENCES [Ads].[RentalSections] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_RentalSections]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalType] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_RentalType]
GO
ALTER TABLE [Ads].[RentalSections]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalSections] CHECK CONSTRAINT [FK_RentalSections_SectionTypes]
GO
ALTER TABLE [Ads].[RentalType]  WITH CHECK ADD  CONSTRAINT [FK_RentalType_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [Ads].[RentalType] CHECK CONSTRAINT [FK_RentalType_Images]
GO
ALTER TABLE [Ads].[RentalType]  WITH CHECK ADD  CONSTRAINT [FK_RentalType_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [Ads].[RentalType] CHECK CONSTRAINT [FK_RentalType_LogHistories]
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
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Date_LogHistory]
GO
ALTER TABLE [dbo].[LogHistories]  WITH CHECK ADD  CONSTRAINT [FK_LogHistory_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LogHistories] CHECK CONSTRAINT [FK_LogHistory_Users]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_RentalCategories]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalType] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_RentalType]
GO
ALTER TABLE [dbo].[Months]  WITH CHECK ADD  CONSTRAINT [FK_Month_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateTypes] ([Id])
GO
ALTER TABLE [dbo].[Months] CHECK CONSTRAINT [FK_Month_DateType]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_LogHistories]
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
ALTER TABLE [dbo].[PagesManagement]  WITH CHECK ADD  CONSTRAINT [FK_PagesManagement_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [dbo].[PagesManagement] CHECK CONSTRAINT [FK_PagesManagement_LogHistories]
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
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[LogHistories] ([Id])
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_LogHistories]
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
