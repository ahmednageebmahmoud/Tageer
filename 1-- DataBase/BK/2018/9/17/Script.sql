USE [master]
GO
/****** Object:  Database [Rental]    Script Date: 9/17/2018 2:55:39 AM ******/
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
/****** Object:  Schema [Ads]    Script Date: 9/17/2018 2:55:40 AM ******/
CREATE SCHEMA [Ads]
GO
/****** Object:  Table [Ads].[AdAlbums]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdComment]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdDetails]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdFavorites]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdInputs]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[Ads]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdSection]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[AdVisitors]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[Inputs]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[InputsType]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[LeaseTermTypes]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[RentalCategories]    Script Date: 9/17/2018 2:55:40 AM ******/
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
/****** Object:  Table [Ads].[RentalInputs]    Script Date: 9/17/2018 2:55:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalInputs](
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
/****** Object:  Table [Ads].[RentalMarks]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMarks](
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
/****** Object:  Table [Ads].[RentalMaterials]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalMaterials](
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
/****** Object:  Table [Ads].[RentalSectionItems]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalSectionItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKSectionItem_Id] [int] NOT NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalSectionTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ads].[RentalSectionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKSectionType_Id] [int] NOT NULL,
	[FKInputType_Id] [int] NOT NULL,
	[FKRentalCategory_Id] [int] NULL,
	[FKLogHistory_Id] [int] NOT NULL,
	[FKRentalType_Id] [int] NOT NULL,
 CONSTRAINT [PK_RentalSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ads].[RentalTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [Ads].[SectionItems]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [Ads].[SectionTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](500) NOT NULL,
	[PostalCode] [nvarchar](10) NULL,
	[FKCountry_Id] [int] NULL,
	[FkCity_Id] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumImages]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[AppsInformation]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppsInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AppInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
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
/****** Object:  Table [dbo].[Countries]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[DateTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[File]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileUrl] [nvarchar](max) NOT NULL,
	[FKAppInformation_Id] [int] NOT NULL,
	[FkFileType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[FreeSizes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Histories]    Script Date: 9/17/2018 2:55:41 AM ******/
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
 CONSTRAINT [PK_Histories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryDetails]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[ImageAlbum]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkLogId] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_LogHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Materials]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Months]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FKLog_Id] [int] NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsIsRead]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Pages]    Script Date: 9/17/2018 2:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[IsControlPanel] [bit] NOT NULL,
	[IsFronEnd] [bit] NOT NULL,
 CONSTRAINT [PK_Privileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesAllow]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[PagesManagement]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[PagesRoles]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[PagesRoleTypes]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Seo]    Script Date: 9/17/2018 2:55:41 AM ******/
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
/****** Object:  Table [dbo].[Sizes]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SocialStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[SubMenus]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[TechnicalSupport]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[TechnicalSupportRead]    Script Date: 9/17/2018 2:55:42 AM ******/
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
/****** Object:  Table [dbo].[UserDatas]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDatas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[MediumName] [nvarchar](50) NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[NationalId] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Phone2] [nvarchar](15) NULL,
	[BirthDate] [datetime] NULL,
	[FKImage_Id] [int] NOT NULL,
	[FkAddress_Id] [int] NULL,
	[FKGender_Id] [int] NULL,
	[FKSocialStatus_Id] [int] NULL,
	[FKJob_Id] [int] NULL,
	[DateCreated] [datetime] NULL,
	[LanguageCode] [varchar](10) NULL,
 CONSTRAINT [PK_UserDatas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUser_Id] [int] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[IsBlock] [bit] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUser_Id] [int] NOT NULL,
	[FkRole_Id] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[FKLogHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/17/2018 2:55:42 AM ******/
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
	[SerialNumber] [nvarchar](300) NOT NULL,
	[IsBlock] [bit] NOT NULL,
	[FkLog_Id] [int] NOT NULL,
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
INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (10, N'w', N'w', 5, 24, 1444, 2)
INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (11, N's', N's', 5, 25, 1445, 2)
INSERT [Ads].[RentalCategories] ([Id], [NameAr], [NameEn], [FKRentalType_Id], [FKImage_Id], [FKLogHistory_Id], [ImagesCount]) VALUES (12, N'we', N'e', 5, 26, 1446, 3)
SET IDENTITY_INSERT [Ads].[RentalCategories] OFF
SET IDENTITY_INSERT [Ads].[RentalInputs] ON 

INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (32, 0, NULL, 4, 108, 8)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (33, 1, NULL, 6, 109, 8)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (34, 1, NULL, 14, 110, 8)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (35, 1, NULL, 19, 111, 8)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (36, 1, 7, 6, 112, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (38, 0, 7, 15, 114, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (39, 0, 7, 16, 115, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (40, 1, 7, 19, 116, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1027, 0, NULL, 5, 1122, 8)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1028, 0, 7, 5, 1124, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1029, 0, 7, 10, 1125, NULL)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1032, 1, NULL, 20, 1128, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1033, 1, NULL, 10, 1460, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1034, 1, NULL, 16, 1461, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1035, 1, NULL, 17, 1462, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1037, 1, NULL, 5, 1464, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1038, 1, NULL, 12, 1465, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1039, 0, NULL, 14, 1466, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1040, 1, NULL, 18, 1467, 5)
INSERT [Ads].[RentalInputs] ([Id], [IsRequired], [FKRentalCategory_Id], [FKInput_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1041, 0, NULL, 21, 1468, 5)
SET IDENTITY_INSERT [Ads].[RentalInputs] OFF
SET IDENTITY_INSERT [Ads].[RentalMarks] ON 

INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1035, 4, 11, 1453, NULL)
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1037, 2, 11, 1455, NULL)
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1039, 6, NULL, 1457, 6)
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1040, 8, NULL, 1458, 6)
INSERT [Ads].[RentalMarks] ([Id], [FKMark_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1041, 10, NULL, 1459, 6)
SET IDENTITY_INSERT [Ads].[RentalMarks] OFF
SET IDENTITY_INSERT [Ads].[RentalMaterials] ON 

INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1, 5, 9, 122, NULL)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (2, 6, NULL, 123, 8)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1002, 5, NULL, 1129, 5)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1003, 6, NULL, 1130, 5)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1004, 6, NULL, 1131, NULL)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1005, 6, NULL, 1476, 6)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1007, 7, 9, 1478, NULL)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1008, 6, 9, 1479, NULL)
INSERT [Ads].[RentalMaterials] ([Id], [FKMaterial_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (1009, 7, NULL, 1480, 8)
SET IDENTITY_INSERT [Ads].[RentalMaterials] OFF
SET IDENTITY_INSERT [Ads].[RentalSectionItems] ON 

INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (2, NULL, 3, 1137, 5)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (3, NULL, 4, 1138, 5)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (5, NULL, 1, 1140, 5)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (7, NULL, 3, 1483, 8)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (8, NULL, 3, 1484, 6)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (9, NULL, 4, 1485, 6)
INSERT [Ads].[RentalSectionItems] ([Id], [FKRentalCategory_Id], [FKSectionItem_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (10, NULL, 5, 1486, 6)
SET IDENTITY_INSERT [Ads].[RentalSectionItems] OFF
SET IDENTITY_INSERT [Ads].[RentalSectionTypes] ON 

INSERT [Ads].[RentalSectionTypes] ([Id], [FKSectionType_Id], [FKInputType_Id], [FKRentalCategory_Id], [FKLogHistory_Id], [FKRentalType_Id]) VALUES (4, 2, 4, 9, 1481, 8)
SET IDENTITY_INSERT [Ads].[RentalSectionTypes] OFF
SET IDENTITY_INSERT [Ads].[RentalTypes] ON 

INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (5, N'سيارات', N'Cars', 2, 2)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (6, N'محمود', N'Build', 3, 3)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (7, N'قاعات', N'Laps', 4, 4)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (8, N'فساتين', N'Dresses', 15, 70)
INSERT [Ads].[RentalTypes] ([Id], [NameAr], [NameEn], [FKImage_Id], [FKLogHistory_Id]) VALUES (9, N'ew', N'ew', 22, 1443)
SET IDENTITY_INSERT [Ads].[RentalTypes] OFF
SET IDENTITY_INSERT [Ads].[SectionItems] ON 

INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (1, N'Jobs', 1)
INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (2, N'x11', 1)
INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (3, N'x2', 2)
INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (4, N'x22', 2)
INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (5, N'x3', 3)
INSERT [Ads].[SectionItems] ([Id], [Name], [FKSectionType_Id]) VALUES (6, N'x33', 3)
SET IDENTITY_INSERT [Ads].[SectionItems] OFF
SET IDENTITY_INSERT [Ads].[SectionTypes] ON 

INSERT [Ads].[SectionTypes] ([Id], [Name]) VALUES (1, N'Location')
INSERT [Ads].[SectionTypes] ([Id], [Name]) VALUES (2, N'Category')
INSERT [Ads].[SectionTypes] ([Id], [Name]) VALUES (3, N'ControleSystem')
SET IDENTITY_INSERT [Ads].[SectionTypes] OFF
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkCity_Id]) VALUES (1, N'22 street', N'55', 1, 2)
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [FKCountry_Id], [FkCity_Id]) VALUES (4, N'd', N'w', 1, 5)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[AppsInformation] ON 

INSERT [dbo].[AppsInformation] ([Id], [Name], [Link]) VALUES (1, N'ControllPanel', N'http://localhost:1138')
INSERT [dbo].[AppsInformation] ([Id], [Name], [Link]) VALUES (2, N'Api', N'http://localhost:50353/')
SET IDENTITY_INSERT [dbo].[AppsInformation] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (2, N'القاهرة', N'cairo', 1, 1428)
INSERT [dbo].[Cities] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (5, N'المنصورة', N'Mansoura', 1, 1434)
INSERT [dbo].[Cities] ([Id], [NameAr], [NameEn], [FKCountry_Id], [FkLog_Id]) VALUES (6, N'الاسكندرية', N'Alx', 1, 1435)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (1, N'مصر', N'egypt', 1426)
INSERT [dbo].[Countries] ([Id], [NameAr], [NameEn], [FkLog_Id]) VALUES (2, N'السعودية', N'Arab s', 1427)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Dates] ON 

INSERT [dbo].[Dates] ([Id], [BeforeCurrentYear], [AfterCurrentYear], [FKDateTypeId], [IsDefult]) VALUES (4, 20, 21, 1, 1)
SET IDENTITY_INSERT [dbo].[Dates] OFF
SET IDENTITY_INSERT [dbo].[DateTypes] ON 

INSERT [dbo].[DateTypes] ([Id], [NameAr], [NameEn]) VALUES (1, N'ميلادى', N'Miladey')
INSERT [dbo].[DateTypes] ([Id], [NameAr], [NameEn]) VALUES (2, N'هجرى', N'Hegrey')
SET IDENTITY_INSERT [dbo].[DateTypes] OFF
SET IDENTITY_INSERT [dbo].[File] ON 

INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (1, N'/Files/Images/Users/Profile/team16.jpg6b2912b5-8675-41ca-aa5b-d4537c00cd8a.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (2, N'/Files/Images/Rental/RentalType1.jpgd6fce7f8-0db9-4a11-93ce-b74523b0e8b2.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (3, N'/Files/Images/Rental/RentalTypeteam9.jpg1219086726.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (4, N'/Files/Images/Rental/RentalType31.jpg577d9461-acd6-4c5a-838e-d5ef8c4fb934.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (12, N'/Files/Images/Rental/RentalCategory9.jpga0a4e8d9-c0ef-4b6b-bc36-0d84d367336e.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (13, N'/Files/Images/Rental/RentalCategoryMR-2016-Ford-Ranger-OFFROAD.jpgdfda14bc-6552-45e1-88cc-248abe6b4799.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (14, N'/Files/Images/Rental/Rentalteam10.jpg569756970.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (15, N'/Files/Images/Rental/RentalType1517363033711812015.jpg98b537f2-be12-46f9-905a-883dad1aa0eb.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (16, N'/Files/Images/Rental/RentalCategory1.jpg24f58468-c2ee-4d83-a909-1c92e899c109.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (19, N'/Files/Images/Users/Profile/1_1.jpg1216608980.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (22, N'/Files/Images/Rental/RentalTypeteam4.jpg887909993.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (24, N'/Files/Images/Rental/Rental7_1.jpg125173176.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (25, N'/Files/Images/Rental/Rentalteam6.jpg1299607931.jpg', 1, 1)
INSERT [dbo].[File] ([Id], [FileUrl], [FKAppInformation_Id], [FkFileType_Id]) VALUES (26, N'/Files/Images/Rental/Rentalteam4.jpg1958284509.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[File] OFF
SET IDENTITY_INSERT [dbo].[FileTypes] ON 

INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (1, N'Image')
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (2, N'Text')
INSERT [dbo].[FileTypes] ([Id], [ResourceName]) VALUES (3, N'Audio')
SET IDENTITY_INSERT [dbo].[FileTypes] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [ResourceName]) VALUES (1, N'Male')
INSERT [dbo].[Genders] ([Id], [ResourceName]) VALUES (2, N'Female')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[Histories] ON 

INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (3, CAST(N'2018-09-15T00:05:25.953' AS DateTime), NULL, 3, 1, 1, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (4, CAST(N'2018-09-15T00:05:41.587' AS DateTime), NULL, 3, 1, 1, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (5, CAST(N'2018-09-15T00:06:16.693' AS DateTime), NULL, 1, 1, 1, 1434)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (6, CAST(N'2018-09-15T00:06:16.700' AS DateTime), NULL, 1, 1, 1, 1435)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (7, CAST(N'2018-09-15T00:08:44.477' AS DateTime), NULL, 2, 1, 2, 1427)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (9, CAST(N'2018-09-15T00:08:57.960' AS DateTime), NULL, 3, 1, 2, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (10, CAST(N'2018-09-15T00:10:38.440' AS DateTime), NULL, 1, 1, 3, 1437)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (13, CAST(N'2018-09-15T00:11:16.580' AS DateTime), NULL, 3, 1, 3, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (15, CAST(N'2018-09-15T01:19:47.440' AS DateTime), NULL, 3, 1, 25, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (16, CAST(N'2018-09-15T01:19:54.677' AS DateTime), NULL, 2, 1, 25, 1431)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (17, CAST(N'2018-09-15T01:20:04.750' AS DateTime), NULL, 2, 1, 25, 1431)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (20, CAST(N'2018-09-15T02:03:17.807' AS DateTime), NULL, 1, 1, 13, 1442)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (21, CAST(N'2018-09-15T02:09:03.783' AS DateTime), NULL, 2, 1, 13, 1442)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (22, CAST(N'2018-09-15T02:25:05.910' AS DateTime), NULL, 2, 1, 13, 1442)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (23, CAST(N'2018-09-15T03:20:11.797' AS DateTime), NULL, 1, 1, 16, 1443)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (24, CAST(N'2018-09-15T03:20:46.113' AS DateTime), NULL, 2, 1, 16, 3)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (25, CAST(N'2018-09-15T03:40:46.407' AS DateTime), NULL, 1, 1, 17, 1444)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (26, CAST(N'2018-09-15T03:45:34.560' AS DateTime), NULL, 1, 1, 17, 1445)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (27, CAST(N'2018-09-15T03:48:42.117' AS DateTime), NULL, 2, 1, 17, 14)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (28, CAST(N'2018-09-15T04:08:32.937' AS DateTime), NULL, 1, 1, 17, 1446)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (29, CAST(N'2018-09-15T04:09:56.283' AS DateTime), NULL, 2, 1, 17, 14)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (30, CAST(N'2018-09-15T04:10:49.813' AS DateTime), NULL, 2, 1, 17, 1445)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (31, CAST(N'2018-09-15T14:52:00.230' AS DateTime), NULL, 1, 1, 18, 1447)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (32, CAST(N'2018-09-15T14:52:11.153' AS DateTime), NULL, 2, 1, 18, 1447)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (33, CAST(N'2018-09-15T14:52:20.033' AS DateTime), NULL, 3, 1, 18, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (34, CAST(N'2018-09-15T15:16:26.450' AS DateTime), NULL, 1, 1, 19, 1448)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (35, CAST(N'2018-09-15T15:17:43.877' AS DateTime), NULL, 1, 1, 19, 1449)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (36, CAST(N'2018-09-15T15:19:46.210' AS DateTime), NULL, 1, 1, 19, 1450)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (37, CAST(N'2018-09-15T15:26:41.657' AS DateTime), NULL, 1, 1, 19, 1451)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (38, CAST(N'2018-09-15T15:26:41.660' AS DateTime), NULL, 1, 1, 19, 1452)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (39, CAST(N'2018-09-15T15:35:23.930' AS DateTime), NULL, 1, 1, 19, 1453)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (40, CAST(N'2018-09-15T15:35:54.313' AS DateTime), NULL, 1, 1, 19, 1454)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (41, CAST(N'2018-09-15T15:36:10.477' AS DateTime), NULL, 1, 1, 19, 1455)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (42, CAST(N'2018-09-15T15:56:50.930' AS DateTime), NULL, 3, 1, 19, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (43, CAST(N'2018-09-15T16:02:51.813' AS DateTime), NULL, 1, 1, 19, 1456)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (44, CAST(N'2018-09-15T16:02:51.823' AS DateTime), NULL, 1, 1, 19, 1457)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (45, CAST(N'2018-09-15T16:02:51.833' AS DateTime), NULL, 1, 1, 19, 1458)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (46, CAST(N'2018-09-17T01:08:04.533' AS DateTime), NULL, 1, 1, 19, 1459)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (47, CAST(N'2018-09-17T01:08:10.597' AS DateTime), NULL, 3, 1, 19, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (48, CAST(N'2018-09-17T01:08:11.263' AS DateTime), NULL, 3, 1, 19, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (49, CAST(N'2018-09-17T01:08:12.833' AS DateTime), NULL, 3, 1, 19, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (50, CAST(N'2018-09-17T01:37:15.333' AS DateTime), NULL, 2, 1, 20, 1126)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (51, CAST(N'2018-09-17T01:37:15.437' AS DateTime), NULL, 2, 1, 20, 1127)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (52, CAST(N'2018-09-17T01:37:15.447' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (53, CAST(N'2018-09-17T01:37:15.433' AS DateTime), NULL, 1, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (54, CAST(N'2018-09-17T01:37:15.440' AS DateTime), NULL, 1, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (55, CAST(N'2018-09-17T01:37:15.443' AS DateTime), NULL, 1, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (56, CAST(N'2018-09-17T01:37:15.447' AS DateTime), NULL, 1, 1, 20, 1463)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (57, CAST(N'2018-09-17T01:37:22.570' AS DateTime), NULL, 2, 1, 20, 1126)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (58, CAST(N'2018-09-17T01:37:22.570' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (59, CAST(N'2018-09-17T01:37:22.573' AS DateTime), NULL, 2, 1, 20, 1127)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (60, CAST(N'2018-09-17T01:37:22.573' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (61, CAST(N'2018-09-17T01:37:22.577' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (62, CAST(N'2018-09-17T01:37:22.580' AS DateTime), NULL, 2, 1, 20, 1463)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (63, CAST(N'2018-09-17T01:37:22.580' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (64, CAST(N'2018-09-17T01:37:26.963' AS DateTime), NULL, 2, 1, 20, 1126)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (65, CAST(N'2018-09-17T01:37:26.967' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (66, CAST(N'2018-09-17T01:37:26.970' AS DateTime), NULL, 2, 1, 20, 1127)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (67, CAST(N'2018-09-17T01:37:26.970' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (68, CAST(N'2018-09-17T01:37:26.973' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (69, CAST(N'2018-09-17T01:37:26.973' AS DateTime), NULL, 2, 1, 20, 1463)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (70, CAST(N'2018-09-17T01:37:26.977' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (71, CAST(N'2018-09-17T01:38:09.843' AS DateTime), NULL, 2, 1, 20, 1126)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (72, CAST(N'2018-09-17T01:38:09.847' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (73, CAST(N'2018-09-17T01:38:09.850' AS DateTime), NULL, 2, 1, 20, 1127)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (74, CAST(N'2018-09-17T01:38:09.850' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (75, CAST(N'2018-09-17T01:38:09.853' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (76, CAST(N'2018-09-17T01:38:09.857' AS DateTime), NULL, 2, 1, 20, 1463)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (77, CAST(N'2018-09-17T01:38:09.857' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (78, CAST(N'2018-09-17T01:38:50.883' AS DateTime), NULL, 3, 1, 20, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (79, CAST(N'2018-09-17T01:38:50.960' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (80, CAST(N'2018-09-17T01:38:50.963' AS DateTime), NULL, 2, 1, 20, 1127)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (81, CAST(N'2018-09-17T01:38:50.963' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (82, CAST(N'2018-09-17T01:38:50.967' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (83, CAST(N'2018-09-17T01:38:50.967' AS DateTime), NULL, 2, 1, 20, 1463)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (84, CAST(N'2018-09-17T01:38:50.967' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (85, CAST(N'2018-09-17T01:38:55.840' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (86, CAST(N'2018-09-17T01:38:55.840' AS DateTime), NULL, 3, 1, 20, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (87, CAST(N'2018-09-17T01:38:55.847' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (88, CAST(N'2018-09-17T01:38:55.847' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (89, CAST(N'2018-09-17T01:38:55.847' AS DateTime), NULL, 3, 1, 20, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (90, CAST(N'2018-09-17T01:38:55.850' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (91, CAST(N'2018-09-17T01:39:01.893' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (92, CAST(N'2018-09-17T01:39:01.897' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (93, CAST(N'2018-09-17T01:39:01.900' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (94, CAST(N'2018-09-17T01:39:01.903' AS DateTime), NULL, 2, 1, 20, 1128)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (95, CAST(N'2018-09-17T01:39:01.890' AS DateTime), NULL, 1, 1, 20, 1464)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (96, CAST(N'2018-09-17T01:39:01.893' AS DateTime), NULL, 1, 1, 20, 1465)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (97, CAST(N'2018-09-17T01:39:01.897' AS DateTime), NULL, 1, 1, 20, 1466)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (98, CAST(N'2018-09-17T01:39:01.903' AS DateTime), NULL, 1, 1, 20, 1467)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (99, CAST(N'2018-09-17T01:39:01.910' AS DateTime), NULL, 1, 1, 20, 1468)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (100, CAST(N'2018-09-17T01:39:11.813' AS DateTime), NULL, 2, 1, 20, 1464)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (101, CAST(N'2018-09-17T01:39:11.813' AS DateTime), NULL, 2, 1, 20, 1460)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (102, CAST(N'2018-09-17T01:39:11.817' AS DateTime), NULL, 2, 1, 20, 1465)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (103, CAST(N'2018-09-17T01:39:11.817' AS DateTime), NULL, 2, 1, 20, 1466)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (104, CAST(N'2018-09-17T01:39:11.817' AS DateTime), NULL, 2, 1, 20, 1461)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (105, CAST(N'2018-09-17T01:39:11.820' AS DateTime), NULL, 2, 1, 20, 1462)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (106, CAST(N'2018-09-17T01:39:11.820' AS DateTime), NULL, 2, 1, 20, 1467)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (107, CAST(N'2018-09-17T01:39:11.820' AS DateTime), NULL, 2, 1, 20, 1128)
GO
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (108, CAST(N'2018-09-17T01:39:11.823' AS DateTime), NULL, 2, 1, 20, 1468)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (109, CAST(N'2018-09-17T01:42:36.747' AS DateTime), NULL, 1, 1, 21, 1469)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (110, CAST(N'2018-09-17T01:42:36.747' AS DateTime), NULL, 1, 1, 21, 1470)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (111, CAST(N'2018-09-17T01:42:47.723' AS DateTime), NULL, 1, 1, 21, 1471)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (112, CAST(N'2018-09-17T01:42:47.723' AS DateTime), NULL, 1, 1, 21, 1472)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (113, CAST(N'2018-09-17T01:45:18.863' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (114, CAST(N'2018-09-17T01:48:30.717' AS DateTime), NULL, 1, 1, 21, 1473)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (115, CAST(N'2018-09-17T01:48:30.720' AS DateTime), NULL, 1, 1, 21, 1474)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (116, CAST(N'2018-09-17T01:48:30.720' AS DateTime), NULL, 1, 1, 21, 1475)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (117, CAST(N'2018-09-17T01:48:56.783' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (118, CAST(N'2018-09-17T01:48:56.787' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (119, CAST(N'2018-09-17T01:48:56.787' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (120, CAST(N'2018-09-17T01:48:56.790' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (121, CAST(N'2018-09-17T01:48:56.790' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (122, CAST(N'2018-09-17T01:48:56.790' AS DateTime), NULL, 3, 1, 21, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (123, CAST(N'2018-09-17T01:56:55.090' AS DateTime), NULL, 1, 1, 22, 1476)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (124, CAST(N'2018-09-17T01:57:20.997' AS DateTime), NULL, 1, 1, 22, 1477)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (125, CAST(N'2018-09-17T01:58:16.710' AS DateTime), NULL, 3, 1, 22, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (126, CAST(N'2018-09-17T01:58:40.667' AS DateTime), NULL, 3, 1, 22, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (127, CAST(N'2018-09-17T02:10:12.193' AS DateTime), NULL, 1, 1, 22, 1478)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (128, CAST(N'2018-09-17T02:11:07.327' AS DateTime), NULL, 1, 1, 22, 1479)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (129, CAST(N'2018-09-17T02:11:18.033' AS DateTime), NULL, 1, 1, 22, 1480)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (130, CAST(N'2018-09-17T02:25:32.687' AS DateTime), NULL, 1, 1, 23, 1481)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (131, CAST(N'2018-09-17T02:25:43.357' AS DateTime), NULL, 3, 1, 23, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (132, CAST(N'2018-09-17T02:29:01.000' AS DateTime), NULL, 2, 1, 23, 1481)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (133, CAST(N'2018-09-17T02:33:28.693' AS DateTime), NULL, 2, 1, 23, 1481)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (134, CAST(N'2018-09-17T02:50:50.240' AS DateTime), NULL, 1, 1, 24, 1482)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (135, CAST(N'2018-09-17T02:50:50.290' AS DateTime), NULL, 1, 1, 24, 1483)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (136, CAST(N'2018-09-17T02:53:35.800' AS DateTime), NULL, 3, 1, 24, NULL)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (137, CAST(N'2018-09-17T02:54:17.160' AS DateTime), NULL, 1, 1, 24, 1484)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (138, CAST(N'2018-09-17T02:54:17.177' AS DateTime), NULL, 1, 1, 24, 1485)
INSERT [dbo].[Histories] ([Id], [DateTime], [RedirectUrl], [FkState_Id], [FkUser_Id], [FKPage_Id], [FkLog_Id]) VALUES (139, CAST(N'2018-09-17T02:54:17.177' AS DateTime), NULL, 1, 1, 24, 1486)
SET IDENTITY_INSERT [dbo].[Histories] OFF
SET IDENTITY_INSERT [dbo].[HistoryDetails] ON 

INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (5, N'NameAr', NULL, N'المنصورة', 3, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (6, N'NameEn', NULL, N'Mansoura', 3, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (7, N'NameAr', NULL, N'dsd', 4, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (8, N'NameEn', NULL, N'sd', 4, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (9, N'NameAr', NULL, N'المنصورة', 5, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (10, N'NameEn', NULL, N'Mansoura', 5, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (11, N'NameAr', NULL, N'الاسكندرية', 6, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (12, N'NameEn', NULL, N'Alx', 6, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (13, N'NameAr', N'السعودية', N'dfd', 7, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (14, N'NameEn', N'Arab s', N'dff', 7, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (17, N'NameAr', NULL, N's', 9, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (18, N'NameEn', NULL, N's', 9, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (19, N'NameAr', NULL, N'طبيب', 10, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (20, N'NameEn', NULL, N'Doctor', 10, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (25, N'NameAr', NULL, N'd', 13, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (26, N'NameEn', NULL, N'dq', 13, 1, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (29, N'NameAr', NULL, N'q', 15, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (30, N'NameEn', NULL, N'w', 15, 1, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (31, N'NameAr', N'سعودى', NULL, 16, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (32, N'NameEn', N'Saudi 0', N'Saudi', 16, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (33, N'NameAr', N'سعودى', NULL, 17, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (34, N'NameEn', N'Saudi', N'Saudi 0', 17, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (41, N'UserName', NULL, N'q', 20, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (42, N'Email', NULL, N'ahmedd@gmail.com', 20, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (43, N'Serial', NULL, N'6e9790b3-b2ec-4617-b5c8-7cc396c34c9d', 20, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (44, N'UserName', NULL, N'q', 21, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (45, N'FirstName', N'z', N'z2', 21, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (46, N'UserName', NULL, N'q', 22, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (47, N'CityAr', N'القاهرة', N'المنصورة', 22, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (48, N'CityEn', N'cairo', N'Mansoura', 22, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (49, N'NameAr', NULL, N'ew', 23, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (50, N'NameEn', NULL, N'ew', 23, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (51, N'NameAr', NULL, N'w', 25, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (52, N'NameEn', NULL, N'w', 25, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (53, N'NameAr', NULL, N's', 26, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (54, N'NameEn', NULL, N's', 26, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (55, N'NameAr', NULL, N'we', 28, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (56, N'NameEn', NULL, N'e', 28, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (57, N'NameAr', NULL, N'w', 31, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (58, N'NameEn', NULL, N'w', 31, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (59, N'NameAr', NULL, N'w', 33, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (60, N'NameEn', NULL, N'w0', 33, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (61, N'RentalTypeNameAr', NULL, N'سيارات', 34, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (62, N'RentalTypeNameEn', NULL, N'Cars', 34, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (63, N'MarkNameAr', NULL, N'فندي', 34, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (64, N'MarkNameEn', NULL, N'Fendi', 34, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (65, N'RentalTypeNameAr', NULL, N'سيارات', 35, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (66, N'RentalTypeNameEn', NULL, N'Cars', 35, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (67, N'MarkNameAr', NULL, N'هوندا', 35, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (68, N'MarkNameEn', NULL, N'honda', 35, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (69, N'RentalTypeNameAr', NULL, N'سيارات', 36, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (70, N'RentalTypeNameEn', NULL, N'Cars', 36, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (71, N'MarkNameAr', NULL, N'هوندا', 36, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (72, N'MarkNameEn', NULL, N'honda', 36, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (73, N'RentalTypeNameAr', NULL, N'محمود', 37, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (74, N'RentalTypeNameEn', NULL, N'Build', 37, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (75, N'MarkNameAr', NULL, N'لانسر', 37, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (76, N'MarkNameEn', NULL, N'lancer', 37, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (77, N'RentalTypeNameAr', NULL, N'محمود', 38, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (78, N'RentalTypeNameEn', NULL, N'Build', 38, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (79, N'MarkNameAr', NULL, N'مرسيدس', 38, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (80, N'MarkNameEn', NULL, N'Mercedes', 38, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (81, N'RentalCategoryNameAr', NULL, N's', 39, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (82, N'RentalCategoryNameEn', NULL, N's', 39, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (83, N'MarkNameAr', NULL, N'تويتا', 39, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (84, N'MarkNameEn', NULL, N'toyota', 39, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (85, N'RentalCategoryNameAr', NULL, N's', 40, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (86, N'RentalCategoryNameEn', NULL, N's', 40, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (87, N'MarkNameAr', NULL, N'فالنتينو', 40, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (88, N'MarkNameEn', NULL, N'Valentino', 40, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (89, N'RentalCategoryNameAr', NULL, N's', 41, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (90, N'RentalCategoryNameEn', NULL, N's', 41, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (91, N'MarkNameAr', NULL, N'لانسر', 41, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (92, N'MarkNameEn', NULL, N'lancer', 41, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (93, N'RentalTypeNameAr', NULL, N's', 42, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (94, N'RentalTypeNameEn', NULL, N's', 42, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (95, N'RentalTypeNameAr', NULL, N'محمود', 43, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (96, N'RentalTypeNameEn', NULL, N'Build', 43, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (97, N'MarkNameAr', NULL, N'هوندا', 43, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (98, N'MarkNameEn', NULL, N'honda', 43, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (99, N'RentalTypeNameAr', NULL, N'محمود', 44, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (100, N'RentalTypeNameEn', NULL, N'Build', 44, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (101, N'MarkNameAr', NULL, N'تمبرلي لندن', 44, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (102, N'MarkNameEn', NULL, N'Temperley London', 44, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (103, N'RentalTypeNameAr', NULL, N'محمود', 45, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (104, N'RentalTypeNameEn', NULL, N'Build', 45, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (105, N'MarkNameAr', NULL, N'فندي', 45, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (106, N'MarkNameEn', NULL, N'Fendi', 45, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (107, N'RentalTypeNameAr', NULL, N'محمود', 46, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (108, N'RentalTypeNameEn', NULL, N'Build', 46, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (109, N'MarkNameAr', NULL, N'فالنتينو', 46, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (110, N'MarkNameEn', NULL, N'Valentino', 46, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (111, N'RentalTypeNameAr', NULL, N'محمود', 47, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (112, N'RentalTypeNameEn', NULL, N'Build', 47, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (113, N'RentalTypeNameAr', NULL, N'محمود', 48, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (114, N'RentalTypeNameEn', NULL, N'Build', 48, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (115, N'RentalTypeNameAr', NULL, N'محمود', 49, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (116, N'RentalTypeNameEn', NULL, N'Build', 49, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (117, N'RentalTypeNameAr', NULL, N'سيارات', 50, 0, 0)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (118, N'RentalTypeNameEn', NULL, N'Cars', 50, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (119, N'RentalTypeNameAr', NULL, N'سيارات', 51, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (120, N'RentalTypeNameEn', NULL, N'Cars', 51, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (121, N'RentalTypeNameAr', NULL, N'سيارات', 52, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (122, N'RentalTypeNameEn', NULL, N'Cars', 52, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (123, N'RentalTypeNameAr', NULL, N'سيارات', 53, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (124, N'RentalTypeNameEn', NULL, N'Cars', 53, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (125, N'InputNameAr', NULL, N'عدد الطوابق', 53, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (126, N'InputNameEn', NULL, N'Apartment Count', 53, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (127, N'RentalTypeNameAr', NULL, N'سيارات', 54, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (128, N'RentalTypeNameEn', NULL, N'Cars', 54, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (129, N'InputNameAr', NULL, N'عدد الحقائب الكبيرة', 54, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (130, N'InputNameEn', NULL, N'Bags Count Big', 54, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (131, N'RentalTypeNameAr', NULL, N'سيارات', 55, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (132, N'RentalTypeNameEn', NULL, N'Cars', 55, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (133, N'InputNameAr', NULL, N'السن او العمر', 55, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (134, N'InputNameEn', NULL, N'Age', 55, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (135, N'RentalTypeNameAr', NULL, N'سيارات', 56, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (136, N'RentalTypeNameEn', NULL, N'Cars', 56, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (137, N'InputNameAr', NULL, N'اللون', 56, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (138, N'InputNameEn', NULL, N'Color', 56, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (139, N'RentalTypeNameAr', NULL, N'سيارات', 57, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (140, N'RentalTypeNameEn', NULL, N'Cars', 57, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (141, N'RentalTypeNameAr', NULL, N'سيارات', 58, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (142, N'RentalTypeNameEn', NULL, N'Cars', 58, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (143, N'RentalTypeNameAr', NULL, N'سيارات', 59, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (144, N'RentalTypeNameEn', NULL, N'Cars', 59, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (145, N'RentalTypeNameAr', NULL, N'سيارات', 60, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (146, N'RentalTypeNameEn', NULL, N'Cars', 60, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (147, N'RentalTypeNameAr', NULL, N'سيارات', 61, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (148, N'RentalTypeNameEn', NULL, N'Cars', 61, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (149, N'IsRequired', N'False', N'True', 61, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (150, N'RentalTypeNameAr', NULL, N'سيارات', 62, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (151, N'RentalTypeNameEn', NULL, N'Cars', 62, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (152, N'RentalTypeNameAr', NULL, N'سيارات', 63, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (153, N'RentalTypeNameEn', NULL, N'Cars', 63, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (154, N'RentalTypeNameAr', NULL, N'سيارات', 64, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (155, N'RentalTypeNameEn', NULL, N'Cars', 64, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (156, N'RentalTypeNameAr', NULL, N'سيارات', 65, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (157, N'RentalTypeNameEn', NULL, N'Cars', 65, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (158, N'IsRequired', N'False', N'True', 65, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (159, N'RentalTypeNameAr', NULL, N'سيارات', 66, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (160, N'RentalTypeNameEn', NULL, N'Cars', 66, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (161, N'RentalTypeNameAr', NULL, N'سيارات', 67, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (162, N'RentalTypeNameEn', NULL, N'Cars', 67, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (163, N'RentalTypeNameAr', NULL, N'سيارات', 68, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (164, N'RentalTypeNameEn', NULL, N'Cars', 68, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (165, N'RentalTypeNameAr', NULL, N'سيارات', 69, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (166, N'RentalTypeNameEn', NULL, N'Cars', 69, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (167, N'RentalTypeNameAr', NULL, N'سيارات', 70, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (168, N'RentalTypeNameEn', NULL, N'Cars', 70, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (169, N'RentalTypeNameAr', NULL, N'سيارات', 71, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (170, N'RentalTypeNameEn', NULL, N'Cars', 71, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (171, N'RentalTypeNameAr', NULL, N'سيارات', 72, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (172, N'RentalTypeNameEn', NULL, N'Cars', 72, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (173, N'RentalTypeNameAr', NULL, N'سيارات', 73, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (174, N'RentalTypeNameEn', NULL, N'Cars', 73, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (175, N'RentalTypeNameAr', NULL, N'سيارات', 74, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (176, N'RentalTypeNameEn', NULL, N'Cars', 74, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (177, N'IsRequired', N'False', N'True', 74, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (178, N'RentalTypeNameAr', NULL, N'سيارات', 75, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (179, N'RentalTypeNameEn', NULL, N'Cars', 75, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (180, N'RentalTypeNameAr', NULL, N'سيارات', 76, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (181, N'RentalTypeNameEn', NULL, N'Cars', 76, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (182, N'RentalTypeNameAr', NULL, N'سيارات', 77, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (183, N'RentalTypeNameEn', NULL, N'Cars', 77, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (184, N'RentalTypeNameAr', NULL, N'سيارات', 78, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (185, N'RentalTypeNameEn', NULL, N'Cars', 78, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (186, N'RentalTypeNameAr', NULL, N'سيارات', 79, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (187, N'RentalTypeNameEn', NULL, N'Cars', 79, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (188, N'RentalTypeNameAr', NULL, N'سيارات', 80, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (189, N'RentalTypeNameEn', NULL, N'Cars', 80, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (190, N'RentalTypeNameAr', NULL, N'سيارات', 81, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (191, N'RentalTypeNameEn', NULL, N'Cars', 81, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (192, N'RentalTypeNameAr', NULL, N'سيارات', 82, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (193, N'RentalTypeNameEn', NULL, N'Cars', 82, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (194, N'RentalTypeNameAr', NULL, N'سيارات', 83, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (195, N'RentalTypeNameEn', NULL, N'Cars', 83, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (196, N'RentalTypeNameAr', NULL, N'سيارات', 84, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (197, N'RentalTypeNameEn', NULL, N'Cars', 84, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (198, N'RentalTypeNameAr', NULL, N'سيارات', 85, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (199, N'RentalTypeNameEn', NULL, N'Cars', 85, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (200, N'RentalTypeNameAr', NULL, N'سيارات', 86, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (201, N'RentalTypeNameEn', NULL, N'Cars', 86, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (202, N'RentalTypeNameAr', NULL, N'سيارات', 87, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (203, N'RentalTypeNameEn', NULL, N'Cars', 87, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (204, N'RentalTypeNameAr', NULL, N'سيارات', 88, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (205, N'RentalTypeNameEn', NULL, N'Cars', 88, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (206, N'RentalTypeNameAr', NULL, N'سيارات', 89, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (207, N'RentalTypeNameEn', NULL, N'Cars', 89, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (208, N'RentalTypeNameAr', NULL, N'سيارات', 90, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (209, N'RentalTypeNameEn', NULL, N'Cars', 90, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (210, N'RentalTypeNameAr', NULL, N'سيارات', 91, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (211, N'RentalTypeNameEn', NULL, N'Cars', 91, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (212, N'RentalTypeNameAr', NULL, N'سيارات', 92, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (213, N'RentalTypeNameEn', NULL, N'Cars', 92, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (214, N'RentalTypeNameAr', NULL, N'سيارات', 93, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (215, N'RentalTypeNameEn', NULL, N'Cars', 93, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (216, N'RentalTypeNameAr', NULL, N'سيارات', 94, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (217, N'RentalTypeNameEn', NULL, N'Cars', 94, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (218, N'RentalTypeNameAr', NULL, N'سيارات', 95, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (219, N'RentalTypeNameEn', NULL, N'Cars', 95, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (220, N'InputNameAr', NULL, N'رقم الطابق', 95, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (221, N'InputNameEn', NULL, N'Floor Number', 95, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (222, N'RentalTypeNameAr', NULL, N'سيارات', 96, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (223, N'RentalTypeNameEn', NULL, N'Cars', 96, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (224, N'InputNameAr', NULL, N'الموقع', 96, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (225, N'InputNameEn', NULL, N'Location', 96, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (226, N'RentalTypeNameAr', NULL, N'سيارات', 97, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (227, N'RentalTypeNameEn', NULL, N'Cars', 97, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (228, N'InputNameAr', NULL, N'الموديل', 97, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (229, N'InputNameEn', NULL, N'Model', 97, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (230, N'RentalTypeNameAr', NULL, N'سيارات', 98, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (231, N'RentalTypeNameEn', NULL, N'Cars', 98, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (232, N'InputNameAr', NULL, N'الخامات', 98, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (233, N'InputNameEn', NULL, N'Materials', 98, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (234, N'RentalTypeNameAr', NULL, N'سيارات', 99, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (235, N'RentalTypeNameEn', NULL, N'Cars', 99, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (236, N'InputNameAr', NULL, N'الجنسية', 99, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (237, N'InputNameEn', NULL, N'Nationality', 99, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (238, N'RentalTypeNameAr', NULL, N'سيارات', 100, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (239, N'RentalTypeNameEn', NULL, N'Cars', 100, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (240, N'IsRequired', N'False', N'True', 100, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (241, N'RentalTypeNameAr', NULL, N'سيارات', 101, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (242, N'RentalTypeNameEn', NULL, N'Cars', 101, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (243, N'RentalTypeNameAr', NULL, N'سيارات', 102, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (244, N'RentalTypeNameEn', NULL, N'Cars', 102, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (245, N'IsRequired', N'False', N'True', 102, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (246, N'RentalTypeNameAr', NULL, N'سيارات', 103, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (247, N'RentalTypeNameEn', NULL, N'Cars', 103, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (248, N'RentalTypeNameAr', NULL, N'سيارات', 104, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (249, N'RentalTypeNameEn', NULL, N'Cars', 104, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (250, N'RentalTypeNameAr', NULL, N'سيارات', 105, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (251, N'RentalTypeNameEn', NULL, N'Cars', 105, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (252, N'RentalTypeNameAr', NULL, N'سيارات', 106, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (253, N'RentalTypeNameEn', NULL, N'Cars', 106, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (254, N'IsRequired', N'False', N'True', 106, 1, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (255, N'RentalTypeNameAr', NULL, N'سيارات', 107, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (256, N'RentalTypeNameEn', NULL, N'Cars', 107, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (257, N'RentalTypeNameAr', NULL, N'سيارات', 108, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (258, N'RentalTypeNameEn', NULL, N'Cars', 108, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (259, N'NameAr', NULL, N'dd', 109, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (260, N'NameEn', NULL, N'www', 109, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (261, N'NameAr', NULL, N'dd', 110, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (262, N'NameEn', NULL, N'www', 110, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (263, N'NameAr', NULL, N'0', 111, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (264, N'NameEn', NULL, N'0', 111, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (265, N'NameAr', NULL, N'0', 112, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (266, N'NameEn', NULL, N'0', 112, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (267, N'NameAr', NULL, N'0', 113, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (268, N'NameEn', NULL, N'0', 113, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (269, N'NameAr', NULL, N'e', 114, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (270, N'NameEn', NULL, N'w', 114, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (271, N'NameAr', NULL, N'ec', 115, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (272, N'NameEn', NULL, N'e', 115, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (273, N'NameAr', NULL, N'01', 116, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (274, N'NameEn', NULL, N'1', 116, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (275, N'NameAr', NULL, N'dd', 117, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (276, N'NameEn', NULL, N'www', 117, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (277, N'NameAr', NULL, N'dd', 118, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (278, N'NameEn', NULL, N'www', 118, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (279, N'NameAr', NULL, N'0', 119, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (280, N'NameEn', NULL, N'0', 119, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (281, N'NameAr', NULL, N'e', 120, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (282, N'NameEn', NULL, N'w', 120, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (283, N'NameAr', NULL, N'ec', 121, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (284, N'NameEn', NULL, N'e', 121, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (285, N'NameAr', NULL, N'01', 122, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (286, N'NameEn', NULL, N'1', 122, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (287, N'RentalTypeNameAr', NULL, N'محمود', 123, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (288, N'RentalTypeNameEn', NULL, N'Build', 123, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (289, N'MaterialNameAr', NULL, N'حرير', 123, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (290, N'MaterialNameEn', NULL, N'Silk', 123, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (291, N'RentalTypeNameAr', NULL, N'فساتين', 124, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (292, N'RentalTypeNameEn', NULL, N'Dresses', 124, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (293, N'MaterialNameAr', NULL, N'بلستر', 124, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (294, N'MaterialNameEn', NULL, N'Polyester', 124, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (295, N'RentalTypeNameAr', NULL, N'فساتين', 125, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (296, N'RentalTypeNameEn', NULL, N'Dresses', 125, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (297, N'RentalTypeNameAr', NULL, N'فساتين', 126, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (298, N'RentalTypeNameEn', NULL, N'Dresses', 126, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (299, N'MaterialNameAr', NULL, N'ستان', 127, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (300, N'MaterialNameEn', NULL, N'Stan', 127, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (301, N'RentalCategoryNameAr', NULL, N'زفاف', 128, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (302, N'RentalCategoryNameEn', NULL, N'Wedding', 128, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (303, N'MaterialNameAr', NULL, N'حرير', 128, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (304, N'MaterialNameEn', NULL, N'Silk', 128, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (305, N'RentalTypeNameAr', NULL, N'فساتين', 129, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (306, N'RentalTypeNameEn', NULL, N'Dresses', 129, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (307, N'MaterialNameAr', NULL, N'ستان', 129, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (308, N'MaterialNameEn', NULL, N'Stan', 129, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (309, N'RentalTypeNameAr', NULL, N'محمود', 130, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (310, N'RentalTypeNameEn', NULL, N'Build', 130, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (311, N'SectionType', NULL, N'Category', 130, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (312, N'RentalTypeNameAr', NULL, N'سيارات', 131, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (313, N'RentalTypeNameEn', NULL, N'Cars', 131, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (314, N'RentalTypeNameAr', N'محمود', N'ew', 132, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (315, N'RentalTypeNameEn', N'Build', N'ew', 132, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (316, N'InputTypeNameAr', N'اتشيك بوكس', NULL, 132, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (317, N'InputTypeNameEn', N'Checkbox', NULL, 132, 0, 1)
GO
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (318, N'SectionTypeNameAr', N'الفئنه', NULL, 132, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (319, N'SectionTypeNameEn', N'Category', NULL, 132, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (320, N'RentalCategoryNameAr', N'', N'زفاف', 133, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (321, N'RentalCategoryNameEn', N'', N'Wedding', 133, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (322, N'RentalTypeNameAr', N'ew', N'فساتين', 133, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (323, N'RentalTypeNameEn', N'ew', N'Dresses', 133, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (324, N'InputTypeNameAr', N'اتشيك بوكس', NULL, 133, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (325, N'InputTypeNameEn', N'Checkbox', NULL, 133, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (326, N'SectionTypeNameAr', N'الفئنه', NULL, 133, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (327, N'SectionTypeNameEn', N'Category', NULL, 133, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (328, N'RentalTypeNameAr', NULL, N'فساتين', 134, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (329, N'RentalTypeNameEn', NULL, N'Dresses', 134, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (330, N'SectionItem', NULL, N'Jobs', 134, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (331, N'RentalTypeNameAr', NULL, N'فساتين', 135, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (332, N'RentalTypeNameEn', NULL, N'Dresses', 135, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (333, N'SectionItem', NULL, N'x2', 135, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (334, N'RentalTypeNameAr', NULL, N'فساتين', 136, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (335, N'RentalTypeNameEn', NULL, N'Dresses', 136, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (336, N'RentalTypeNameAr', NULL, N'محمود', 137, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (337, N'RentalTypeNameEn', NULL, N'Build', 137, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (338, N'SectionItem', NULL, N'x2', 137, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (339, N'RentalTypeNameAr', NULL, N'محمود', 138, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (340, N'RentalTypeNameEn', NULL, N'Build', 138, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (341, N'SectionItem', NULL, N'x22', 138, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (342, N'RentalTypeNameAr', NULL, N'محمود', 139, 0, 0)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (343, N'RentalTypeNameEn', NULL, N'Build', 139, 0, 1)
INSERT [dbo].[HistoryDetails] ([Id], [ColumResourceName], [ColumOldContent], [ColumNewContent], [FkHistory_Id], [CoulmIsSingl], [CoulmIsEn]) VALUES (344, N'SectionItem', NULL, N'x3', 139, 0, 1)
SET IDENTITY_INSERT [dbo].[HistoryDetails] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn], [FkLogId]) VALUES (1, N'مطور', N'developer', 1425)
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn], [FkLogId]) VALUES (2, N'طبيب', N'Doctor', 1437)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (2, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (3, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (4, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (12, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (13, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (14, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (21, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (22, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (23, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (24, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (25, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (26, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (27, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (28, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (29, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (30, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (31, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (32, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (33, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (34, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (35, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (36, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (37, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (38, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (39, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (40, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (41, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (42, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (43, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (44, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (45, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (46, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (47, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (48, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (49, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (50, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (51, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (52, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (53, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (54, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (55, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (56, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (57, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (58, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (59, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (60, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (61, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (62, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (63, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (64, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (65, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (66, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (67, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (68, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (69, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (70, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (71, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (72, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (73, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (74, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (75, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (76, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (77, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (78, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (79, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (80, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (81, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (82, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (83, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (84, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (85, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (92, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (93, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (94, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (95, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (96, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (97, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (98, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (99, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (100, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (101, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (102, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (103, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (104, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (105, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (106, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (107, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (108, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (109, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (110, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (111, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (112, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (113, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (114, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (115, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (116, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (117, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (118, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (119, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (120, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (121, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (122, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (123, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (124, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1122, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1123, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1124, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1125, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1126, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1127, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1128, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1129, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1130, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1131, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1133, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1134, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1135, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1136, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1137, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1138, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1139, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1140, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1141, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1142, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1143, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1144, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1145, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1146, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1147, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1148, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1149, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1150, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1151, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1152, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1153, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1154, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1155, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1156, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1157, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1158, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1159, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1160, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1161, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1162, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1163, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1164, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1165, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1166, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1167, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1168, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1169, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1170, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1171, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1172, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1173, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1174, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1175, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1176, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1177, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1178, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1179, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1180, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1181, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1182, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1183, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1184, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1185, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1186, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1187, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1188, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1189, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1190, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1191, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1192, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1193, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1194, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1195, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1196, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1197, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1198, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1199, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1200, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1201, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1202, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1203, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1204, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1205, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1206, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1207, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1208, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1209, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1210, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1211, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1212, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1213, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1214, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1215, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1216, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1217, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1218, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1219, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1220, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1221, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1222, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1223, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1224, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1225, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1226, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1227, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1228, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1229, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1230, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1231, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1232, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1233, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1234, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1235, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1236, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1237, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1238, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1239, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1240, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1241, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1242, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1243, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1244, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1245, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1246, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1247, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1248, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1249, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1250, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1251, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1252, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1253, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1254, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1255, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1256, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1257, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1258, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1259, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1260, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1261, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1262, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1263, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1264, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1265, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1266, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1267, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1268, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1269, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1270, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1271, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1272, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1273, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1274, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1275, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1276, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1277, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1278, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1279, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1280, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1281, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1282, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1283, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1284, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1285, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1286, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1287, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1288, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1289, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1290, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1291, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1292, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1293, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1294, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1295, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1296, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1297, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1298, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1299, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1300, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1301, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1302, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1303, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1304, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1305, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1306, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1307, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1308, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1309, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1310, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1311, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1312, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1313, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1314, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1315, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1316, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1317, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1318, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1319, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1320, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1321, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1322, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1323, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1324, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1325, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1326, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1327, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1328, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1329, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1330, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1331, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1332, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1333, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1334, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1335, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1336, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1337, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1338, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1339, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1340, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1341, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1342, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1343, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1344, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1345, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1346, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1347, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1348, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1349, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1350, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1351, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1352, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1353, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1354, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1355, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1356, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1357, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1358, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1359, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1360, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1361, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1362, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1363, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1364, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1365, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1366, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1367, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1368, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1369, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1370, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1371, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1372, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1373, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1374, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1375, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1376, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1377, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1378, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1379, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1380, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1381, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1382, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1383, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1384, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1385, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1386, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1387, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1388, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1389, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1390, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1391, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1392, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1393, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1394, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1395, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1396, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1397, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1398, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1399, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1400, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1401, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1402, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1403, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1404, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1405, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1406, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1407, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1408, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1409, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1410, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1411, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1412, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1413, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1414, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1415, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1416, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1417, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1418, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1419, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1420, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1421, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1422, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1423, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1424, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1425, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1426, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1427, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1428, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1429, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1430, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1431, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1434, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1435, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1437, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1442, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1443, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1444, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1445, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1446, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1447, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1448, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1449, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1450, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1451, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1452, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1453, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1454, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1455, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1456, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1457, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1458, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1459, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1460, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1461, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1462, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1463, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1464, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1465, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1466, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1467, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1468, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1469, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1470, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1471, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1472, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1473, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1474, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1475, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1476, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1477, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1478, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1479, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1480, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1481, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1482, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1483, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1484, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1485, NULL)
INSERT [dbo].[Logs] ([Id], [Notes]) VALUES (1486, NULL)
SET IDENTITY_INSERT [dbo].[Logs] OFF
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
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (1, 1, N'far fa-hand-point-right', N'Setting')
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (2, 2, N'far fa-hand-point-right', N'Users')
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (3, 3, N'far fa-hand-point-right', N'RentalTypes')
INSERT [dbo].[Menus] ([Id], [OrderNumber], [ClassIcon], [ResourceName]) VALUES (4, 6, N'far fa-hand-point-right', N'TechnicalSupport')
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Months] ON 

INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (2, N'w', N'w', N'w', 1, 1)
INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (3, N'y', N'u', N'u', 1, 2)
INSERT [dbo].[Months] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (4, N'ew', N'ew', N'we', 1, 3)
SET IDENTITY_INSERT [dbo].[Months] OFF
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([Id], [NameAr], [NameEn], [FKLog_Id]) VALUES (1, N'مصرى', N'Egyptian', 1429)
INSERT [dbo].[Nationality] ([Id], [NameAr], [NameEn], [FKLog_Id]) VALUES (3, N'سعودى', N'Saudi', 1431)
INSERT [dbo].[Nationality] ([Id], [NameAr], [NameEn], [FKLog_Id]) VALUES (4, N'هندى', N'Indian', 1430)
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (1, N'Cities', N'Cities', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (2, N'Countries', N'Countries', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (3, N'Jobs', N'Jobs', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (4, N'Gender', N'Gender', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (5, N'Date', N'Date', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (6, N'DateType', N'DateType', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (7, N'Months', N'Months', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (8, N'PagesAllow', N'PagesAllow', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (9, N'Notifications', N'Notifications', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (11, N'Menus', N'Menus', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (12, N'SubMenus', N'SubMenus', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (13, N'Users', N'Users', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (14, N'UserLogins', N'UserLogins', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (15, N'MangeUsers', N'MangeUsers', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (16, N'RentalTypes', N'RentalTypes', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (17, N'RentalCategories', N'RentalCategories', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (18, N'Marks', N'Marks', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (19, N'RentalMarks', N'RentalMarks', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (20, N'RentalInputs', N'RentalInputs', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (21, N'Materials', N'Materials', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (22, N'RentalMaterials', N'RentalMaterials', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (23, N'RentalSectionTypes', N'RentalSectionTypes', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (24, N'RentalSectionItems', N'RentalSectionItems', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (25, N'Nationalities', N'Nationalities', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (26, N'TechnicalSupport', N'TechnicalSupport', 1, 0)
INSERT [dbo].[Pages] ([Id], [ResourceName], [Url], [IsControlPanel], [IsFronEnd]) VALUES (27, N'PagesRoles', N'PagesRoles', 1, 0)
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[PagesAllow] ON 

INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (1, 1, 1, 124, 1)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (2, 1, 1, 1141, 2)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (3, 1, 1, 1142, 3)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (4, 1, 1, 1143, 4)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (5, 1, 1, 1144, 5)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (6, 1, 1, 1145, 6)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (7, 1, 1, 1146, 7)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (8, 1, 1, 1147, 8)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (9, 1, 1, 1148, 9)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (11, 1, 1, 1150, 11)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (12, 1, 1, 1151, 12)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (13, 1, 1, 1152, 13)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (14, 1, 1, 1153, 14)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (16, 1, 1, 1156, 16)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (17, 1, 1, 1157, 17)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (18, 1, 1, 1158, 18)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (19, 1, 1, 1159, 19)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (20, 1, 1, 1160, 20)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (21, 1, 1, 1161, 21)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (22, 1, 1, 1162, 22)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (23, 1, 1, 1163, 23)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (24, 1, 1, 1164, 24)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (25, 1, 1, 1165, 25)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (26, 1, 1, 1166, 26)
INSERT [dbo].[PagesAllow] ([Id], [IsAllowNotify], [IsAllowLog], [FkLog_Id], [FkPage_Id]) VALUES (27, 1, 1, 1167, 27)
SET IDENTITY_INSERT [dbo].[PagesAllow] OFF
SET IDENTITY_INSERT [dbo].[PagesRoles] ON 

INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (2, 1, 1, 1, 1, 1, 1, 1, 1172)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (3, 1, 1, 1, 1, 1, 1, 2, 1173)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (4, 1, 1, 1, 1, 1, 1, 3, 1174)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (5, 1, 1, 1, 1, 1, 2, 1, 1175)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (6, 1, 1, 1, 1, 1, 2, 2, 1176)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (7, 1, 1, 1, 1, 1, 2, 3, 1177)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (8, 1, 1, 1, 1, 1, 3, 1, 1178)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (9, 1, 1, 1, 1, 1, 3, 2, 1179)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (10, 1, 1, 1, 1, 1, 3, 3, 1180)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (11, 1, 1, 1, 1, 2, 1, 1, 1181)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (12, 1, 1, 1, 1, 2, 1, 2, 1182)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (13, 1, 1, 1, 1, 2, 1, 3, 1183)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (14, 1, 1, 1, 1, 2, 2, 1, 1184)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (15, 1, 1, 1, 1, 2, 2, 2, 1185)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (16, 1, 1, 1, 1, 2, 2, 3, 1186)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (17, 1, 1, 1, 1, 2, 3, 1, 1187)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (18, 1, 1, 1, 1, 2, 3, 2, 1188)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (19, 1, 1, 1, 1, 2, 3, 3, 1189)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (20, 1, 1, 1, 1, 3, 1, 1, 1190)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (21, 1, 1, 1, 1, 3, 1, 2, 1191)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (22, 1, 1, 1, 1, 3, 1, 3, 1192)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (23, 1, 1, 1, 1, 3, 2, 1, 1193)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (24, 1, 1, 1, 1, 3, 2, 2, 1194)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (25, 1, 1, 1, 1, 3, 2, 3, 1195)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (26, 1, 1, 1, 1, 3, 3, 1, 1196)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (27, 1, 1, 1, 1, 3, 3, 2, 1197)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (28, 1, 1, 1, 1, 3, 3, 3, 1198)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (29, 1, 1, 1, 1, 4, 1, 1, 1199)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (30, 1, 1, 1, 1, 4, 1, 2, 1200)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (31, 1, 1, 1, 1, 4, 1, 3, 1201)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (32, 1, 1, 1, 1, 4, 2, 1, 1202)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (33, 1, 1, 1, 1, 4, 2, 2, 1203)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (34, 1, 1, 1, 1, 4, 2, 3, 1204)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (35, 1, 1, 1, 1, 4, 3, 1, 1205)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (36, 1, 1, 1, 1, 4, 3, 2, 1206)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (37, 1, 1, 1, 1, 4, 3, 3, 1207)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (38, 1, 1, 1, 1, 5, 1, 1, 1208)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (39, 1, 1, 1, 1, 5, 1, 2, 1209)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (40, 1, 1, 1, 1, 5, 1, 3, 1210)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (41, 1, 1, 1, 1, 5, 2, 1, 1211)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (42, 1, 1, 1, 1, 5, 2, 2, 1212)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (43, 1, 1, 1, 1, 5, 2, 3, 1213)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (44, 1, 1, 1, 1, 5, 3, 1, 1214)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (45, 1, 1, 1, 1, 5, 3, 2, 1215)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (46, 1, 1, 1, 1, 5, 3, 3, 1216)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (47, 1, 1, 1, 1, 6, 1, 1, 1217)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (48, 1, 1, 1, 1, 6, 1, 2, 1218)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (49, 1, 1, 1, 1, 6, 1, 3, 1219)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (50, 1, 1, 1, 1, 6, 2, 1, 1220)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (51, 1, 1, 1, 1, 6, 2, 2, 1221)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (52, 1, 1, 1, 1, 6, 2, 3, 1222)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (53, 1, 1, 1, 1, 6, 3, 1, 1223)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (54, 1, 1, 1, 1, 6, 3, 2, 1224)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (55, 1, 1, 1, 1, 6, 3, 3, 1225)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (56, 1, 1, 1, 1, 7, 1, 1, 1226)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (57, 1, 1, 1, 1, 7, 1, 2, 1227)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (58, 1, 1, 1, 1, 7, 1, 3, 1228)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (59, 1, 1, 1, 1, 7, 2, 1, 1229)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (60, 1, 1, 1, 1, 7, 2, 2, 1230)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (61, 1, 1, 1, 1, 7, 2, 3, 1231)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (62, 1, 1, 1, 1, 7, 3, 1, 1232)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (63, 1, 1, 1, 1, 7, 3, 2, 1233)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (64, 1, 1, 1, 1, 7, 3, 3, 1234)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (65, 1, 1, 1, 1, 8, 1, 1, 1235)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (66, 1, 1, 1, 1, 8, 1, 2, 1236)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (67, 1, 1, 1, 1, 8, 1, 3, 1237)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (68, 1, 1, 1, 1, 8, 2, 1, 1238)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (69, 1, 1, 1, 1, 8, 2, 2, 1239)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (70, 1, 1, 1, 1, 8, 2, 3, 1240)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (71, 1, 1, 1, 1, 8, 3, 1, 1241)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (72, 1, 1, 1, 1, 8, 3, 2, 1242)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (73, 1, 1, 1, 1, 8, 3, 3, 1243)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (74, 1, 1, 1, 1, 9, 1, 1, 1244)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (75, 1, 1, 1, 1, 9, 1, 2, 1245)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (76, 1, 1, 1, 1, 9, 1, 3, 1246)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (77, 1, 1, 1, 1, 9, 2, 1, 1247)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (78, 1, 1, 1, 1, 9, 2, 2, 1248)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (79, 1, 1, 1, 1, 9, 2, 3, 1249)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (80, 1, 1, 1, 1, 9, 3, 1, 1250)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (81, 1, 1, 1, 1, 9, 3, 2, 1251)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (82, 1, 1, 1, 1, 9, 3, 3, 1252)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (92, 1, 1, 1, 1, 11, 1, 1, 1262)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (93, 1, 1, 1, 1, 11, 1, 2, 1263)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (94, 1, 1, 1, 1, 11, 1, 3, 1264)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (95, 1, 1, 1, 1, 11, 2, 1, 1265)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (96, 1, 1, 1, 1, 11, 2, 2, 1266)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (97, 1, 1, 1, 1, 11, 2, 3, 1267)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (98, 1, 1, 1, 1, 11, 3, 1, 1268)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (99, 1, 1, 1, 1, 11, 3, 2, 1269)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (100, 1, 1, 1, 1, 11, 3, 3, 1270)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (101, 1, 1, 1, 1, 12, 1, 1, 1271)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (102, 1, 1, 1, 1, 12, 1, 2, 1272)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (103, 1, 1, 1, 1, 12, 1, 3, 1273)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (104, 1, 1, 1, 1, 12, 2, 1, 1274)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (105, 1, 1, 1, 1, 12, 2, 2, 1275)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (106, 1, 1, 1, 1, 12, 2, 3, 1276)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (107, 1, 1, 1, 1, 12, 3, 1, 1277)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (108, 1, 1, 1, 1, 12, 3, 2, 1278)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (109, 1, 1, 1, 1, 12, 3, 3, 1279)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (110, 1, 1, 1, 1, 13, 1, 1, 1280)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (111, 1, 1, 1, 1, 13, 1, 2, 1281)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (112, 1, 1, 1, 1, 13, 1, 3, 1282)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (113, 1, 1, 1, 1, 13, 2, 1, 1283)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (114, 1, 1, 1, 1, 13, 2, 2, 1284)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (115, 1, 1, 1, 1, 13, 2, 3, 1285)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (116, 1, 1, 1, 1, 13, 3, 1, 1286)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (117, 1, 1, 1, 1, 13, 3, 2, 1287)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (118, 1, 1, 1, 1, 13, 3, 3, 1288)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (119, 1, 1, 1, 1, 14, 1, 1, 1289)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (120, 1, 1, 1, 1, 14, 1, 2, 1290)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (121, 1, 1, 1, 1, 14, 1, 3, 1291)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (122, 1, 1, 1, 1, 14, 2, 1, 1292)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (123, 1, 1, 1, 1, 14, 2, 2, 1293)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (124, 1, 1, 1, 1, 14, 2, 3, 1294)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (125, 1, 1, 1, 1, 14, 3, 1, 1295)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (126, 1, 1, 1, 1, 14, 3, 2, 1296)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (127, 1, 1, 1, 1, 14, 3, 3, 1297)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (137, 1, 1, 1, 1, 16, 1, 1, 1307)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (138, 1, 1, 1, 1, 16, 1, 2, 1308)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (139, 1, 1, 1, 1, 16, 1, 3, 1309)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (140, 1, 1, 1, 1, 16, 2, 1, 1310)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (141, 1, 1, 1, 1, 16, 2, 2, 1311)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (142, 1, 1, 1, 1, 16, 2, 3, 1312)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (143, 1, 1, 1, 1, 16, 3, 1, 1313)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (144, 1, 1, 1, 1, 16, 3, 2, 1314)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (145, 1, 1, 1, 1, 16, 3, 3, 1315)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (146, 1, 1, 1, 1, 17, 1, 1, 1316)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (147, 1, 1, 1, 1, 17, 1, 2, 1317)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (148, 1, 1, 1, 1, 17, 1, 3, 1318)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (149, 1, 1, 1, 1, 17, 2, 1, 1319)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (150, 1, 1, 1, 1, 17, 2, 2, 1320)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (151, 1, 1, 1, 1, 17, 2, 3, 1321)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (152, 1, 1, 1, 1, 17, 3, 1, 1322)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (153, 1, 1, 1, 1, 17, 3, 2, 1323)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (154, 1, 1, 1, 1, 17, 3, 3, 1324)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (155, 1, 1, 1, 1, 18, 1, 1, 1325)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (156, 1, 1, 1, 1, 18, 1, 2, 1326)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (157, 1, 1, 1, 1, 18, 1, 3, 1327)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (158, 1, 1, 1, 1, 18, 2, 1, 1328)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (159, 1, 1, 1, 1, 18, 2, 2, 1329)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (160, 1, 1, 1, 1, 18, 2, 3, 1330)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (161, 1, 1, 1, 1, 18, 3, 1, 1331)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (162, 1, 1, 1, 1, 18, 3, 2, 1332)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (163, 1, 1, 1, 1, 18, 3, 3, 1333)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (164, 1, 1, 1, 1, 19, 1, 1, 1334)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (165, 1, 1, 1, 1, 19, 1, 2, 1335)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (166, 1, 1, 1, 1, 19, 1, 3, 1336)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (167, 1, 1, 1, 1, 19, 2, 1, 1337)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (168, 1, 1, 1, 1, 19, 2, 2, 1338)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (169, 1, 1, 1, 1, 19, 2, 3, 1339)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (170, 1, 1, 1, 1, 19, 3, 1, 1340)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (171, 1, 1, 1, 1, 19, 3, 2, 1341)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (172, 1, 1, 1, 1, 19, 3, 3, 1342)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (173, 1, 1, 1, 1, 20, 1, 1, 1343)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (174, 1, 1, 1, 1, 20, 1, 2, 1344)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (175, 1, 1, 1, 1, 20, 1, 3, 1345)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (176, 1, 1, 1, 1, 20, 2, 1, 1346)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (177, 1, 1, 1, 1, 20, 2, 2, 1347)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (178, 1, 1, 1, 1, 20, 2, 3, 1348)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (179, 1, 1, 1, 1, 20, 3, 1, 1349)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (180, 1, 1, 1, 1, 20, 3, 2, 1350)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (181, 1, 1, 1, 1, 20, 3, 3, 1351)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (182, 1, 1, 1, 1, 21, 1, 1, 1352)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (183, 1, 1, 1, 1, 21, 1, 2, 1353)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (184, 1, 1, 1, 1, 21, 1, 3, 1354)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (185, 1, 1, 1, 1, 21, 2, 1, 1355)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (186, 1, 1, 1, 1, 21, 2, 2, 1356)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (187, 1, 1, 1, 1, 21, 2, 3, 1357)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (188, 1, 1, 1, 1, 21, 3, 1, 1358)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (189, 1, 1, 1, 1, 21, 3, 2, 1359)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (190, 1, 1, 1, 1, 21, 3, 3, 1360)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (191, 1, 1, 1, 1, 22, 1, 1, 1361)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (192, 1, 1, 1, 1, 22, 1, 2, 1362)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (193, 1, 1, 1, 1, 22, 1, 3, 1363)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (194, 1, 1, 1, 1, 22, 2, 1, 1364)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (195, 1, 1, 1, 1, 22, 2, 2, 1365)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (196, 1, 1, 1, 1, 22, 2, 3, 1366)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (197, 1, 1, 1, 1, 22, 3, 1, 1367)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (198, 1, 1, 1, 1, 22, 3, 2, 1368)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (199, 1, 1, 1, 1, 22, 3, 3, 1369)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (200, 1, 1, 1, 1, 23, 1, 1, 1370)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (201, 1, 1, 1, 1, 23, 1, 2, 1371)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (202, 1, 1, 1, 1, 23, 1, 3, 1372)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (203, 1, 1, 1, 1, 23, 2, 1, 1373)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (204, 1, 1, 1, 1, 23, 2, 2, 1374)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (205, 1, 1, 1, 1, 23, 2, 3, 1375)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (206, 1, 1, 1, 1, 23, 3, 1, 1376)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (207, 1, 1, 1, 1, 23, 3, 2, 1377)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (208, 1, 1, 1, 1, 23, 3, 3, 1378)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (209, 1, 1, 1, 1, 24, 1, 1, 1379)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (210, 1, 1, 1, 1, 24, 1, 2, 1380)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (211, 1, 1, 1, 1, 24, 1, 3, 1381)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (212, 1, 1, 1, 1, 24, 2, 1, 1382)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (213, 1, 1, 1, 1, 24, 2, 2, 1383)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (214, 1, 1, 1, 1, 24, 2, 3, 1384)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (215, 1, 1, 1, 1, 24, 3, 1, 1385)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (216, 1, 1, 1, 1, 24, 3, 2, 1386)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (217, 1, 1, 1, 1, 24, 3, 3, 1387)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (218, 1, 1, 1, 1, 25, 1, 1, 1388)
GO
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (219, 1, 1, 1, 1, 25, 1, 2, 1389)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (220, 1, 1, 1, 1, 25, 1, 3, 1390)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (221, 1, 1, 1, 1, 25, 2, 1, 1391)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (222, 1, 1, 1, 1, 25, 2, 2, 1392)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (223, 1, 1, 1, 1, 25, 2, 3, 1393)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (224, 1, 1, 1, 1, 25, 3, 1, 1394)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (225, 1, 1, 1, 1, 25, 3, 2, 1395)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (226, 1, 1, 1, 1, 25, 3, 3, 1396)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (227, 1, 1, 1, 1, 26, 1, 1, 1397)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (228, 1, 1, 1, 1, 26, 1, 2, 1398)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (229, 1, 1, 1, 1, 26, 1, 3, 1399)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (230, 1, 1, 1, 1, 26, 2, 1, 1400)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (231, 1, 1, 1, 1, 26, 2, 2, 1401)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (232, 1, 1, 1, 1, 26, 2, 3, 1402)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (233, 1, 1, 1, 1, 26, 3, 1, 1403)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (234, 1, 1, 1, 1, 26, 3, 2, 1404)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (235, 1, 1, 1, 1, 26, 3, 3, 1405)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (236, 1, 1, 1, 1, 27, 1, 1, 1406)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (237, 1, 1, 1, 1, 27, 1, 2, 1407)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (238, 1, 1, 1, 1, 27, 1, 3, 1408)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (239, 1, 1, 1, 1, 27, 2, 1, 1409)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (240, 1, 1, 1, 1, 27, 2, 2, 1410)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (241, 1, 1, 1, 1, 27, 2, 3, 1411)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (242, 1, 1, 1, 1, 27, 3, 1, 1412)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (243, 1, 1, 1, 1, 27, 3, 2, 1413)
INSERT [dbo].[PagesRoles] ([Id], [IsDisplay], [IsCreate], [IsUpdate], [IsDelete], [FkPage_Id], [FkRole_Id], [FkPageRoleTypes_Id], [FkLog_Id]) VALUES (244, 1, 1, 1, 1, 27, 3, 3, 1414)
SET IDENTITY_INSERT [dbo].[PagesRoles] OFF
SET IDENTITY_INSERT [dbo].[PagesRoleTypes] ON 

INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (1, N'Management')
INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (2, N'Notifications')
INSERT [dbo].[PagesRoleTypes] ([Id], [ResourceName]) VALUES (3, N'Logs')
SET IDENTITY_INSERT [dbo].[PagesRoleTypes] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (1, N'Manager', N'المدير')
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (2, N'Supervisor', N'مشرف')
INSERT [dbo].[Roles] ([Id], [ResourceName], [Notes]) VALUES (3, N'Clinet', N'مستخدم')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (1, N'S')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (2, N'M')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (3, N'L')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (4, N'XL')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (5, N'XXL')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (6, N'XXXL')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (7, N'1W')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (8, N'2W')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[SocialStatus] ON 

INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (1, N'Single')
INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (2, N'Married')
INSERT [dbo].[SocialStatus] ([Id], [ResourceName]) VALUES (3, N'Widowed')
SET IDENTITY_INSERT [dbo].[SocialStatus] OFF
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (1, N'Create', N'label-success', N'fa fa-plus')
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (2, N'Update', N'label-warning', N'fas fa-edit')
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (3, N'Delete', N'label-danger', N'fas fa-trash-alt')
INSERT [dbo].[States] ([Id], [ResourceName], [CssClassStyle], [CssClassIcon]) VALUES (4, N'Rented', N'label-danger', N'fas fa-trash-alt')
SET IDENTITY_INSERT [dbo].[States] OFF
SET IDENTITY_INSERT [dbo].[SubMenus] ON 

INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (1, 1, N'fas fa-not-equal', 1, 1)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (2, 2, N'fas fa-not-equal', 1, 2)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (3, 3, N'fas fa-not-equal', 1, 3)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (5, 5, N'fas fa-not-equal', 1, 5)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (6, 6, N'fas fa-not-equal', 1, 6)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (7, 7, N'fas fa-not-equal', 1, 7)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (8, 8, N'fas fa-not-equal', 1, 8)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (11, 11, N'fas fa-not-equal', 1, 11)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (12, 12, N'fas fa-not-equal', 1, 12)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (13, 13, N'fas fa-not-equal', 1, 27)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (14, 1, N'fas fa-not-equal', 2, 13)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (16, 3, N'fas fa-not-equal', 2, 14)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (17, 14, N'fas fa-not-equal', 1, 25)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (18, 1, N'fas fa-not-equal', 3, 16)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (19, 2, N'fas fa-not-equal', 3, 17)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (20, 3, N'fas fa-not-equal', 3, 18)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (21, 4, N'fas fa-not-equal', 3, 19)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (22, 5, N'fas fa-not-equal', 3, 20)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (23, 6, N'fas fa-not-equal', 3, 21)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (24, 7, N'fas fa-not-equal', 3, 22)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (25, 8, N'fas fa-not-equal', 3, 23)
INSERT [dbo].[SubMenus] ([Id], [OrderNumber], [ClassIcon], [FkMenu_Id], [FKPage_Id]) VALUES (26, 10, N'fas fa-not-equal', 3, 24)
SET IDENTITY_INSERT [dbo].[SubMenus] OFF
SET IDENTITY_INSERT [dbo].[UserDatas] ON 

INSERT [dbo].[UserDatas] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImage_Id], [FkAddress_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [DateCreated], [LanguageCode]) VALUES (4, N'Ahmed', N'Nageeb', N'Mahmoud', N'1236', N'01013056689', N'01025249400', CAST(N'1994-01-05T00:00:00.000' AS DateTime), 1, 1, 1, 1, 1, CAST(N'2018-06-19T00:00:00.000' AS DateTime), N'ar')
INSERT [dbo].[UserDatas] ([Id], [FirstName], [MediumName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImage_Id], [FkAddress_Id], [FKGender_Id], [FKSocialStatus_Id], [FKJob_Id], [DateCreated], [LanguageCode]) VALUES (7, N'z2', N'q', N'z', N'454654', NULL, NULL, CAST(N'1980-01-01T00:00:00.000' AS DateTime), 19, 4, 2, 1, 1, CAST(N'2018-09-15T02:03:17.803' AS DateTime), N'en')
SET IDENTITY_INSERT [dbo].[UserDatas] OFF
SET IDENTITY_INSERT [dbo].[UserLogins] ON 

INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (1, 1, 0, 0, CAST(N'2018-06-19T13:59:06.837' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (2, 1, 1, 0, CAST(N'2018-06-19T13:59:40.033' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (3, 1, 1, 0, CAST(N'2018-06-19T14:26:46.120' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (4, 1, 1, 0, CAST(N'2018-06-19T15:10:10.923' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (5, 1, 1, 0, CAST(N'2018-06-20T02:43:14.087' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (6, 1, 1, 0, CAST(N'2018-06-21T00:57:03.273' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (7, 1, 1, 0, CAST(N'2018-06-22T04:08:49.717' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (8, 1, 1, 0, CAST(N'2018-06-27T20:51:37.047' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (9, 1, 0, 0, CAST(N'2018-09-14T19:21:46.960' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (10, 1, 1, 0, CAST(N'2018-09-14T19:23:03.270' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (11, 1, 1, 0, CAST(N'2018-09-14T19:24:39.673' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (12, 1, 1, 0, CAST(N'2018-09-14T19:25:35.600' AS DateTime))
INSERT [dbo].[UserLogins] ([Id], [FKUser_Id], [IsSuccess], [IsBlock], [Date]) VALUES (13, 1, 1, 0, CAST(N'2018-09-14T19:26:57.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [FKUser_Id], [FkRole_Id], [Notes], [FKLogHistoryId]) VALUES (1, 1, 1, NULL, 1)
INSERT [dbo].[UserRoles] ([Id], [FKUser_Id], [FkRole_Id], [Notes], [FKLogHistoryId]) VALUES (4, 4, 3, NULL, 1442)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FkUserDataId__Id_], [SerialNumber], [IsBlock], [FkLog_Id]) VALUES (1, N'Ahmed', N'Ahmed@gmail.com', N'01013056689', 4, N'1245', 0, 1424)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FkUserDataId__Id_], [SerialNumber], [IsBlock], [FkLog_Id]) VALUES (4, N'q', N'ahmedd@gmail.com', N'123456', 7, N'6e9790b3-b2ec-4617-b5c8-7cc396c34c9d', 0, 1442)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_FK_Address_Cities]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Cities] ON [dbo].[Addresses]
(
	[FkCity_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Address_Countries]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Address_Countries] ON [dbo].[Addresses]
(
	[FKCountry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Cities_Countries]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Cities_Countries] ON [dbo].[Cities]
(
	[FKCountry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Date_DateType]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Date_DateType] ON [dbo].[Dates]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Month_DateType]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Month_DateType] ON [dbo].[Months]
(
	[FKDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Address]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Address] ON [dbo].[UserDatas]
(
	[FkAddress_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Gender]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Gender] ON [dbo].[UserDatas]
(
	[FKGender_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Images]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Images] ON [dbo].[UserDatas]
(
	[FKImage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_Jops]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_Jops] ON [dbo].[UserDatas]
(
	[FKJob_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UaserData_UaserData]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UaserData_UaserData] ON [dbo].[UserDatas]
(
	[FKSocialStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserLogin_Users]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserLogin_Users] ON [dbo].[UserLogins]
(
	[FKUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_LogHistory]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_LogHistory] ON [dbo].[UserRoles]
(
	[FKLogHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Role]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Role] ON [dbo].[UserRoles]
(
	[FkRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Users1]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Users1] ON [dbo].[UserRoles]
(
	[FKUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UaserData]    Script Date: 9/17/2018 2:55:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_UaserData] ON [dbo].[Users]
(
	[FkUserDataId__Id_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Ads].[RentalInputs] ADD  CONSTRAINT [DF_RentalCategoryInputs_FKRentalCategory_Id]  DEFAULT ((0)) FOR [FKRentalCategory_Id]
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
REFERENCES [dbo].[Logs] ([Id])
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
REFERENCES [dbo].[File] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_Images]
GO
ALTER TABLE [Ads].[RentalCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_LogHistories]
GO
ALTER TABLE [Ads].[RentalCategories]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategories_RentalType] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalCategories] CHECK CONSTRAINT [FK_RentalCategories_RentalType]
GO
ALTER TABLE [Ads].[RentalInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_Inputs] FOREIGN KEY([FKInput_Id])
REFERENCES [Ads].[Inputs] ([Id])
GO
ALTER TABLE [Ads].[RentalInputs] CHECK CONSTRAINT [FK_CategoryInputs_Inputs]
GO
ALTER TABLE [Ads].[RentalInputs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryInputs_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalInputs] CHECK CONSTRAINT [FK_CategoryInputs_RentalCategories]
GO
ALTER TABLE [Ads].[RentalInputs]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalInputs] CHECK CONSTRAINT [FK_RentalCategoryInputs_LogHistories]
GO
ALTER TABLE [Ads].[RentalInputs]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryInputs_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalInputs] CHECK CONSTRAINT [FK_RentalCategoryInputs_RentalTypes]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_LogHistories]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMarks_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalCategoryMarks_RentalTypes]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_Marks] FOREIGN KEY([FKMark_Id])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalMarks_Marks]
GO
ALTER TABLE [Ads].[RentalMarks]  WITH CHECK ADD  CONSTRAINT [FK_RentalMarks_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalMarks] CHECK CONSTRAINT [FK_RentalMarks_RentalCategories]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_LogHistories]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalCategoryMaterial_RentalTypes]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterial_Material] FOREIGN KEY([FKMaterial_Id])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalMaterial_Material]
GO
ALTER TABLE [Ads].[RentalMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RentalMaterial_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalMaterials] CHECK CONSTRAINT [FK_RentalMaterial_RentalCategories]
GO
ALTER TABLE [Ads].[RentalSectionItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryItems_Locations] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Ads].[RentalSectionItems] CHECK CONSTRAINT [FK_RentalCategoryItems_Locations]
GO
ALTER TABLE [Ads].[RentalSectionItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategoryItems_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionItems] CHECK CONSTRAINT [FK_RentalCategoryItems_RentalTypes]
GO
ALTER TABLE [Ads].[RentalSectionItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionItems] CHECK CONSTRAINT [FK_RentalItems_RentalCategories]
GO
ALTER TABLE [Ads].[RentalSectionItems]  WITH CHECK ADD  CONSTRAINT [FK_RentalItems_SectionItems] FOREIGN KEY([FKSectionItem_Id])
REFERENCES [Ads].[SectionItems] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionItems] CHECK CONSTRAINT [FK_RentalItems_SectionItems]
GO
ALTER TABLE [Ads].[RentalSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategorySections_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionTypes] CHECK CONSTRAINT [FK_RentalCategorySections_LogHistories]
GO
ALTER TABLE [Ads].[RentalSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalCategorySections_RentalTypes] FOREIGN KEY([FKRentalType_Id])
REFERENCES [Ads].[RentalTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionTypes] CHECK CONSTRAINT [FK_RentalCategorySections_RentalTypes]
GO
ALTER TABLE [Ads].[RentalSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_InputsType] FOREIGN KEY([FKInputType_Id])
REFERENCES [Ads].[InputsType] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionTypes] CHECK CONSTRAINT [FK_RentalSections_InputsType]
GO
ALTER TABLE [Ads].[RentalSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_RentalCategories] FOREIGN KEY([FKRentalCategory_Id])
REFERENCES [Ads].[RentalCategories] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionTypes] CHECK CONSTRAINT [FK_RentalSections_RentalCategories]
GO
ALTER TABLE [Ads].[RentalSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalSections_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[RentalSectionTypes] CHECK CONSTRAINT [FK_RentalSections_SectionTypes]
GO
ALTER TABLE [Ads].[RentalTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalType_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[File] ([Id])
GO
ALTER TABLE [Ads].[RentalTypes] CHECK CONSTRAINT [FK_RentalType_Images]
GO
ALTER TABLE [Ads].[RentalTypes]  WITH CHECK ADD  CONSTRAINT [FK_RentalTypes_LogHistories] FOREIGN KEY([FKLogHistory_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [Ads].[RentalTypes] CHECK CONSTRAINT [FK_RentalTypes_LogHistories]
GO
ALTER TABLE [Ads].[SectionItems]  WITH CHECK ADD  CONSTRAINT [FK_SectionItems_SectionTypes] FOREIGN KEY([FKSectionType_Id])
REFERENCES [Ads].[SectionTypes] ([Id])
GO
ALTER TABLE [Ads].[SectionItems] CHECK CONSTRAINT [FK_SectionItems_SectionTypes]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([FkCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Address_Countries] FOREIGN KEY([FKCountry_Id])
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
REFERENCES [dbo].[File] ([Id])
GO
ALTER TABLE [dbo].[AlbumImages] CHECK CONSTRAINT [FK_AlbumImages_Images]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Logs]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Logs]
GO
ALTER TABLE [dbo].[Dates]  WITH CHECK ADD  CONSTRAINT [FK_Date_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateTypes] ([Id])
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Date_DateType]
GO
ALTER TABLE [dbo].[File]  WITH CHECK ADD  CONSTRAINT [FK_File_AppsInformation] FOREIGN KEY([FKAppInformation_Id])
REFERENCES [dbo].[AppsInformation] ([Id])
GO
ALTER TABLE [dbo].[File] CHECK CONSTRAINT [FK_File_AppsInformation]
GO
ALTER TABLE [dbo].[File]  WITH CHECK ADD  CONSTRAINT [FK_File_FileTypes] FOREIGN KEY([FkFileType_Id])
REFERENCES [dbo].[FileTypes] ([Id])
GO
ALTER TABLE [dbo].[File] CHECK CONSTRAINT [FK_File_FileTypes]
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
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Logs] FOREIGN KEY([FkLogId])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Logs]
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
REFERENCES [dbo].[DateTypes] ([Id])
GO
ALTER TABLE [dbo].[Months] CHECK CONSTRAINT [FK_Month_DateType]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_Logs] FOREIGN KEY([FKLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_Logs]
GO
ALTER TABLE [dbo].[NotificationsIsRead]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsIsRead_Histories] FOREIGN KEY([FkHistory_Id])
REFERENCES [dbo].[Histories] ([Id])
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
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Address] FOREIGN KEY([FkAddress_Id])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Address]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Gender] FOREIGN KEY([FKGender_Id])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Gender]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Images] FOREIGN KEY([FKImage_Id])
REFERENCES [dbo].[File] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Images]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Jops] FOREIGN KEY([FKJob_Id])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_Jops]
GO
ALTER TABLE [dbo].[UserDatas]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_UaserData] FOREIGN KEY([FKSocialStatus_Id])
REFERENCES [dbo].[SocialStatus] ([Id])
GO
ALTER TABLE [dbo].[UserDatas] CHECK CONSTRAINT [FK_UaserData_UaserData]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogin_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_LogHistory] FOREIGN KEY([FKLogHistoryId])
REFERENCES [dbo].[Logs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_LogHistory]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([FkRole_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users1] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Logs] FOREIGN KEY([FkLog_Id])
REFERENCES [dbo].[Logs] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Logs]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UaserData] FOREIGN KEY([FkUserDataId__Id_])
REFERENCES [dbo].[UserDatas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UaserData]
GO
/****** Object:  StoredProcedure [dbo].[InsertLogAndReturnId]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[InsertLogAndReturnId]
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

   -- Insert statements for procedure here
      INSERT INTO Logs
             (Notes)
      VALUES
             (null)
      return SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[insertPageRole]    Script Date: 9/17/2018 2:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertPageRole]
@FkPage_Id int , 
@FkPageRoleTypes_Id int , 
@FkRole_Id int , 
@FkLog_Id int 
as  
insert PagesRoles(
IsCreate,
IsDelete,
IsDisplay,
IsUpdate,
FkPage_Id,
FkPageRoleTypes_Id,
FkRole_Id,
FkLog_Id)
values (1,1,1,1
,@FkPage_Id,@FkPageRoleTypes_Id,@FkRole_Id,@FkLog_Id)
  
GO
USE [master]
GO
ALTER DATABASE [Rental] SET  READ_WRITE 
GO
