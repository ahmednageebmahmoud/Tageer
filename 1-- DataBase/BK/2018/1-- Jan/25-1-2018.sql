USE [master]
GO
/****** Object:  Database [Rental]    Script Date: 1/26/2018 3:27:37 AM ******/
CREATE DATABASE [Rental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SEZER\MSSQL\DATA\Rental.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Rental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SEZER\MSSQL\DATA\Rental_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Rental] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [Rental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Rental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Rental]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](500) NOT NULL,
	[PostlCode] [int] NULL,
	[FKCountryId] [int] NOT NULL,
	[FKCityId] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
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
/****** Object:  Table [dbo].[Country]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Date]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeforeCurrentYear] [int] NOT NULL,
	[AfterCurrentYear] [int] NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[IsDefult] [bit] NOT NULL,
	[FKLogHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateType]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DateType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](15) NOT NULL,
	[NameEn] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 1/26/2018 3:27:37 AM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogHistory]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FKUserId] [int] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsBackEnd] [bit] NOT NULL,
	[FKLastUserIdUpdate] [int] NULL,
 CONSTRAINT [PK_LogHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Month]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](6) NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[MonthIndex] [int] NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationsBackEnd]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsBackEnd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KeyMassage] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL CONSTRAINT [DF_Notifications_DateTime]  DEFAULT (getdate()),
	[IsRead] [bit] NOT NULL CONSTRAINT [DF_Notifications_IsRead]  DEFAULT ((0)),
	[Url] [nvarchar](max) NULL,
	[FKNotificationTypeActionId] [int] NOT NULL,
	[FKNotificationTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationTypeActionBackEnd]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTypeActionBackEnd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[BackgroundClass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationTypeAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationTypeBackEnd]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTypeBackEnd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationTypeBackEnd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FKParentId] [int] NULL,
	[Url] [nvarchar](50) NULL,
	[IsLink] [bit] NULL CONSTRAINT [DF_Privileges_IsLink]  DEFAULT ((0)),
	[PriveOrder] [int] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[FKPrivilegeTypeId] [int] NOT NULL,
	[FKRoleId] [int] NOT NULL,
 CONSTRAINT [PK_Privileges_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivilegeTypes]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PrivilegeTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePrivileges]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePrivileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[FKPrivilegeId] [int] NOT NULL,
	[Display] [bit] NOT NULL CONSTRAINT [DF_RolePrivileges_Display]  DEFAULT ((0)),
	[Addition] [bit] NOT NULL CONSTRAINT [DF_RolePrivileges_Addition]  DEFAULT ((0)),
	[Edit] [bit] NOT NULL CONSTRAINT [DF_RolePrivileges_Edit]  DEFAULT ((0)),
	[Delete] [bit] NOT NULL CONSTRAINT [DF_RolePrivileges_Delete]  DEFAULT ((0)),
 CONSTRAINT [PK_RolePrivileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesNotifications]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKNotificationsTypeId] [int] NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[Addition] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
 CONSTRAINT [PK_RolesNotificationsBackEnd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 1/26/2018 3:27:37 AM ******/
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
/****** Object:  Table [dbo].[UserData]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [nvarchar](20) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[NationalId] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Phone2] [nvarchar](15) NULL,
	[BirthDate] [date] NOT NULL,
	[FKImageId] [int] NOT NULL,
	[FkAddressId] [int] NULL,
	[FkGenderId] [int] NOT NULL,
	[FkSocialStatusId] [int] NOT NULL,
	[FKJobId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LanguageCode] [varchar](10) NULL CONSTRAINT [DF_UserData_LanguageCode]  DEFAULT ('en'),
 CONSTRAINT [PK_UaserData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[IsBlock] [bit] NOT NULL CONSTRAINT [DF_UserLogin_IsBlock]  DEFAULT ((0)),
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 1/26/2018 3:27:37 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/26/2018 3:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FkUserDataId
Id]]] [int] NOT NULL,
	[SerialNumber] [nvarchar](300) NULL CONSTRAINT [DF_Users_Id1]  DEFAULT (CONVERT([nvarchar](max),newid())),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (1, N'28 street hamdy', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (2, N'28 street hamdy', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (3, N'28 street hamdy', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (4, N'28 street hamdy', NULL, 11, 11)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (5, N'28 street hamdy3', NULL, 10, 2)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (6, N'28 street hamdy3', NULL, 10, 2)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (7, N'28 street hamdy', NULL, 1, 2)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (8, N'28 street hamdy', NULL, 1, 2)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (9, N'28 street hamdy', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (10, N'28 street hamdy', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (12, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (13, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (14, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (15, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (16, N'fdff', 52, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (17, N'fdff', 52, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (20, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (21, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (22, N'fdff', NULL, 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (23, N'fdff', NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (0, N'المنصورة', N'Mansoura', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (2, N'ssss', N'sssssssssssss', 10)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (3, N'dddddqqqqqqqqqqqqqqqqqqqqqqqqq', N'ddddddddddddddddqqqqqqqqqqqqqqqqqqqqq', 12)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (5, N'الجيزة', N'Giza', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (6, N'القاهرة', N'Cairo', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (7, N'dddddv', N'010', 12)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (8, N'المنصورة2', N'Mansoura2', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (9, N'جدة', N'Jeddah', 11)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (11, N'الرياض', N'Riyadh', 11)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (12, N'dddddddddd', N'dddddddddd', 12)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (13, N'جازان', N'Gizan', 11)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (14, N'الدمام', N'Dammam', 11)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (1, N'مصر', N'Egypt')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (9, N'fd', N'fdfdfdf')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (10, N'fd', N'fdfdfdf')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (11, N'السعودية', N'sssssssss')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (12, N'ssss', N'ssssssssssssss')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (14, N'bbbbbbbbbbbbbbbbb', N'bbbbbbbbbbbbbbbbb')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Date] ON 

INSERT [dbo].[Date] ([Id], [BeforeCurrentYear], [AfterCurrentYear], [FKDateTypeId], [IsDefult], [FKLogHistoryId]) VALUES (8, 50, 50, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Date] OFF
SET IDENTITY_INSERT [dbo].[DateType] ON 

INSERT [dbo].[DateType] ([Id], [NameAr], [NameEn]) VALUES (1, N'ميلادى', N'Melady')
INSERT [dbo].[DateType] ([Id], [NameAr], [NameEn]) VALUES (2, N'هجرى', N'Hegrey')
SET IDENTITY_INSERT [dbo].[DateType] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [NameAr], [NameEn]) VALUES (1, N'ذكر', N'Male')
INSERT [dbo].[Gender] ([Id], [NameAr], [NameEn]) VALUES (2, N'انثى', N'Female ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (1, N'/Files/Files/Users/Profile/17425984_1761186594197797_4664916154441164912_n (1).jpgb3a3ae81-ff98-4a05-9110-c525989f8750.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (2, N'/Files/Files/Users/Profile/23476326_538987663127788_821692892_n.jpg5da9ba33-7019-4f13-8875-60330be3ddea.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (3, N'/Files/Files/Users/Profile/23476326_538987663127788_821692892_n.jpg7a985efc-b461-43c9-80a3-f2851d8aa860.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (4, N'/Files/Files/Users/Profile/25395961_1890968634552925_1572444900046962785_n.jpg9038d5db-df99-48d5-9caf-bf88af4618a3.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (5, N'/Files/Files/Users/Profile/25395961_1890968634552925_1572444900046962785_n.jpgd9f6941b-dd3f-4a5a-b0c2-be06f9650d44.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (6, N'/Files/Files/Users/Profile/4441168-images-girls.jpgcf623417-523a-41da-b3ba-72102ee9c895.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (7, N'/Files/Files/Users/Profile/4441168-images-girls.jpg8e4c061c-56e7-4f23-b123-b86186ab4ca9.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (8, N'/Files/Files/Users/Profile/prac-girl-2.jpgc7fd86a7-661f-4b77-97a0-dd478c4ae40e.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (9, N'/Files/Files/Users/Profile/prac-girl-2.jpg78589757-db97-4080-859e-e16d088bef94.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (10, N'/Files/Files/Users/Profile/prac-girl-2.jpgf64df565-29a4-4737-a1b5-880439c5b352.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (12, N'/Files/Files/Users/Profile/prac-girl-2.jpgb337cff4-3433-4d6d-b804-be245c8c982e.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (13, N'/Files/Images/Users/Profile/userDefult.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (14, N'/Files/Files/Users/Profile/4441168-images-girls.jpgff885b1d-aae5-4a4b-817b-053c6f50dbf9.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (15, N'/Files/Images/Users/Profile/userDefult.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (16, N'/Files/Files/Users/Profile/team14.jpgdfa6c320-e35e-4bdc-9763-41b56e8866a9.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (17, N'/Files/Files/Users/Profile/team11.jpg223d5364-f02b-4bd0-9060-c3531aeaf213.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (20, N'/Files/Files/Users/Profile/team13.jpg5e38fc33-dd59-488c-8455-18cb72e197f3.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (21, N'/Files/Files/Users/Profile/team13.jpgd6cc5e95-ac02-4178-b820-6a42f94f6452.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (22, N'/Files/Files/Users/Profile/team8.jpg63c47b2d-cf7e-43e0-b6ca-64ab6d5605c8.jpg')
INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (23, N'/Files/Files/Users/Profile/team1.jpg7d3dad89-3ec2-40f9-a2fb-a2342da2fc0d.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (1, N'مطور', N'DEVELOPER')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (4, N'مراقب', N'moraqp')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (5, N'مسوق', N'markting')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (6, N'مدير', N'manger')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (21, N'المدير الإداري', N'Managing Director')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (22, N'مدير المالية', N'Finance Director')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (23, N'المدير المبدع', N'Creative Director')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (24, N'مدير الموارد البشرية', N'HR Director')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (25, N'المدير التنفيذي', N'Executive Manager')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (26, N'الموارد البشرية', N'Human Resource')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (27, N'مدير المالية  2', N'Finance Manager')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (28, N'المدير الإداري  2', N'MANAGING DIRECTOR')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[LogHistory] ON 

INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (1, CAST(N'2017-12-12 00:00:00.000' AS DateTime), 1, NULL, 1, NULL)
INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (2, CAST(N'2018-01-10 18:58:27.253' AS DateTime), 2, NULL, 1, NULL)
INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (5, CAST(N'2018-01-10 19:53:21.343' AS DateTime), 2, NULL, 1, NULL)
INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (6, CAST(N'2018-01-10 20:05:13.417' AS DateTime), 2, NULL, 1, NULL)
INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (7, CAST(N'2018-01-10 20:07:20.617' AS DateTime), 2, NULL, 1, NULL)
INSERT [dbo].[LogHistory] ([Id], [CreateDate], [FKUserId], [LastUpdateDate], [IsBackEnd], [FKLastUserIdUpdate]) VALUES (8, CAST(N'2018-01-10 20:09:18.107' AS DateTime), 2, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[LogHistory] OFF
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (2, N'يناير', N'January', N'sas', 1, 1)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (3, N'فبراير', N'February', N'2323', 1, 2)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (4, N'مارس', N'March', N'sdd', 1, 3)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (5, N'ابريل', N'April', N'555', 1, 4)
SET IDENTITY_INSERT [dbo].[Month] OFF
SET IDENTITY_INSERT [dbo].[NotificationsBackEnd] ON 

INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (1, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 1, 7)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (2, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 2, 7)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (3, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 3, 6)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (4, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 2, 6)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (5, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 3, 6)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (6, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 2, 7)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (8, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 1, 7)
INSERT [dbo].[NotificationsBackEnd] ([Id], [KeyMassage], [DateTime], [IsRead], [Url], [FKNotificationTypeActionId], [FKNotificationTypeId]) VALUES (9, N'DeleteCountry', CAST(N'2018-01-25 22:01:36.463' AS DateTime), 0, N'www.googel.com', 1, 7)
SET IDENTITY_INSERT [dbo].[NotificationsBackEnd] OFF
SET IDENTITY_INSERT [dbo].[NotificationTypeActionBackEnd] ON 

INSERT [dbo].[NotificationTypeActionBackEnd] ([Id], [NameAr], [NameEn], [ClassName], [BackgroundClass]) VALUES (1, N'اضافة', N'Create', N'fa fa-plus', N'label-success')
INSERT [dbo].[NotificationTypeActionBackEnd] ([Id], [NameAr], [NameEn], [ClassName], [BackgroundClass]) VALUES (2, N'تحديث', N'Update', N'fa fa-pencil-square-o', N'label-danger')
INSERT [dbo].[NotificationTypeActionBackEnd] ([Id], [NameAr], [NameEn], [ClassName], [BackgroundClass]) VALUES (3, N'حذف', N'Delete', N'fa fa-trash', N'label-warning')
SET IDENTITY_INSERT [dbo].[NotificationTypeActionBackEnd] OFF
SET IDENTITY_INSERT [dbo].[NotificationTypeBackEnd] ON 

INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (7, N'City')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (6, N'Country')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (5, N'Date')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (4, N'Gender')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (3, N'Jobs')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (2, N'Month')
INSERT [dbo].[NotificationTypeBackEnd] ([Id], [Name]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[NotificationTypeBackEnd] OFF
SET IDENTITY_INSERT [dbo].[Privileges] ON 

INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (1, N'Setting', NULL, NULL, 0, 1, N' icon-wrench', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (2, N'Country', 1, N'/Country', 1, 1, N'glyphicon glyphicon-map-marker
', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (3, N'City', 1, N'/City', 1, 2, N'glyphicon glyphicon-pushpin
', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (4, N'DateType', 1, N'/DateType', 1, 3, N'fa fa-cubes', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (5, N'Date', 1, N'/Date', 1, 4, N'fa fa-calendar-o', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (6, N'Month', 1, N'/Month', 1, 5, N'glyphicon glyphicon-calendar
', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (7, N'Job', 1, N'/Job', 1, 5, N'glyphicon glyphicon-briefcase
', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (8, N'Gender', 1, N'/Gender', 1, 6, N'glyphicon glyphicon-user
', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (9, N'Users', NULL, NULL, 0, 2, N'fa fa-users', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (10, N'Users', 9, N'/Users', 1, 1, N'fa fa-user-plus', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (11, N'Privileges', 1, N'/Privileges', 1, 7, N'fa fa-bars', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (12, N'PrivilegeTypes', 1, N'/PrivilegeTypes', 1, 8, N'fa fa-cubes', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (13, N'RolePrivileges', 1, N'/RolePrivileges', 1, 9, N'fa fa-key', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (16, N'MangeUsers', 9, N'/MangeUsers', 1, 9, N'fa fa-user-circle', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (17, N'UserLogin', 9, N'/UserLogin', 1, 10, N'fa fa-cog', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (19, N'NotificationTypeActionBackEnd', 1, N'/NotificationTypeActionBackEnd', 1, 10, N'fa fa-cubes', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (20, N'NotificationType', 1, N'/NotificationType', 1, 11, N'fa fa-cubes', 1, 1)
INSERT [dbo].[Privileges] ([Id], [Name], [FKParentId], [Url], [IsLink], [PriveOrder], [ClassName], [FKPrivilegeTypeId], [FKRoleId]) VALUES (21, N'RolesNotifications', 1, N'/RolesNotifications', 1, 12, N'fa fa-key', 1, 1)
SET IDENTITY_INSERT [dbo].[Privileges] OFF
SET IDENTITY_INSERT [dbo].[PrivilegeTypes] ON 

INSERT [dbo].[PrivilegeTypes] ([Id], [Name]) VALUES (1, N'Page')
INSERT [dbo].[PrivilegeTypes] ([Id], [Name]) VALUES (2, N'button')
SET IDENTITY_INSERT [dbo].[PrivilegeTypes] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Notes]) VALUES (1, N'Manager', N'المدير')
INSERT [dbo].[Role] ([Id], [Name], [Notes]) VALUES (2, N'Admin', N'الادمين')
INSERT [dbo].[Role] ([Id], [Name], [Notes]) VALUES (3, N'Supervisor', N'مشرف')
INSERT [dbo].[Role] ([Id], [Name], [Notes]) VALUES (4, N'Client', N'عميل')
INSERT [dbo].[Role] ([Id], [Name], [Notes]) VALUES (5, N'ClientBlocked', N'عميل محظور')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[RolePrivileges] ON 

INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (1, 2, 3, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (2, 2, 2, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (3, 2, 5, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (4, 2, 4, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (5, 2, 8, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (6, 2, 7, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (7, 2, 6, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (8, 2, 11, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (9, 2, 12, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (10, 2, 13, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (11, 2, 10, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (12, 2, 16, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (13, 2, 17, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (14, 2, 19, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (15, 2, 20, 1, 1, 1, 1)
INSERT [dbo].[RolePrivileges] ([Id], [FKRoleId], [FKPrivilegeId], [Display], [Addition], [Edit], [Delete]) VALUES (16, 2, 21, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RolePrivileges] OFF
SET IDENTITY_INSERT [dbo].[RolesNotifications] ON 

INSERT [dbo].[RolesNotifications] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (1, 7, 2, 1, 1, 0)
INSERT [dbo].[RolesNotifications] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (5, 6, 2, 0, 1, 0)
INSERT [dbo].[RolesNotifications] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (6, 6, 2, 0, 1, 0)
INSERT [dbo].[RolesNotifications] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (7, 6, 2, 0, 1, 0)
INSERT [dbo].[RolesNotifications] ([Id], [FKNotificationsTypeId], [FKRoleId], [Addition], [Edit], [Delete]) VALUES (8, 6, 2, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[RolesNotifications] OFF
SET IDENTITY_INSERT [dbo].[SocialStatus] ON 

INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (1, N'متزوج', N'Married ')
INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (2, N'اعزب', N'Single ')
INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (3, N'ارمل', N'Widow ')
SET IDENTITY_INSERT [dbo].[SocialStatus] OFF
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (1, N'ahmed', N'nageeb', N'mahmoud', N'015645548', N'01025249400', NULL, CAST(N'2017-01-12' AS Date), 1, 1, 1, 2, 1, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'ar')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (2, N'ahmed', N'nageeb', N'mahmoud', N'111111', N'010252494500', NULL, CAST(N'2017-12-12' AS Date), 1, 1, 1, 2, 1, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (3, N'ahmed', N'nageeb', N'mahmoud', N'565656565', N'10252494r003', NULL, CAST(N'2017-12-12' AS Date), 2, 2, 1, 1, 4, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (4, N'ahmed', N'nageeb', N'mahmoud', N'5656565659', N'10252494006', NULL, CAST(N'2017-12-12' AS Date), 3, 3, 1, 1, 4, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (5, N'ahmed', N'nageeb', N'mahmoud', N'56565656529', N'102524940206', NULL, CAST(N'2017-12-12' AS Date), 4, 4, 1, 1, 4, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (6, N'sara', N'nageeb', N'mahmoudf', N'565656226529', N'1025e24940206', NULL, CAST(N'2017-12-12' AS Date), 5, 5, 2, 2, 5, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (7, N'sarar', N'nageebr', N'mahmoudf', N'5656562265529', N'1025e249450206', NULL, CAST(N'2017-12-12' AS Date), 6, 6, 2, 2, 5, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (8, N'may', N'ahmed', N'mahmoud', N'43343434', N'00102656', NULL, CAST(N'2017-12-12' AS Date), 7, 7, 2, 2, 5, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (9, N'mayd', N'ahmed', N'mahmoud', N'4334f3434', N'00102656d', NULL, CAST(N'2017-12-12' AS Date), 8, 8, 2, 2, 5, CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (10, N'ahmed', N'nageeb', N'mahmoud', N'02000256120', NULL, NULL, CAST(N'2017-12-12' AS Date), 9, 9, 2, 3, 24, CAST(N'2017-12-31 17:55:28.600' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (11, N'ahmed', N'nageeb', N'mahmoud', N'02000256120d', NULL, NULL, CAST(N'2017-12-12' AS Date), 10, 10, 2, 3, 24, CAST(N'2017-12-31 17:58:22.447' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (13, N'ahmed', N'nageeb', N'mahmoud', N'12121212', NULL, NULL, CAST(N'2017-12-12' AS Date), 12, 12, 1, 2, 1, CAST(N'2017-12-31 18:04:35.310' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (14, N'ahmed', N'nageeb', N'mahmoud', N'6562121212', NULL, NULL, CAST(N'2017-12-12' AS Date), 13, 13, 1, 2, 1, CAST(N'2017-12-31 18:12:37.693' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (15, N'ahmed', N'nageeb', N'mahmoud', N'121212122323', NULL, NULL, CAST(N'2017-12-12' AS Date), 14, 14, 1, 2, 1, CAST(N'2017-12-31 18:17:42.173' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (16, N'ahmed', N'nageeb', N'mahmoud', N'121212129', NULL, NULL, CAST(N'2017-12-12' AS Date), 15, 15, 1, 2, 1, CAST(N'2018-01-01 09:36:55.063' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (17, N'ahmed', N'nageeb', N'mahmoud', N'1212121255', NULL, NULL, CAST(N'2061-01-18' AS Date), 16, 16, 1, 2, 1, CAST(N'2018-01-10 18:45:02.300' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (18, N'my', N'nageeb', N'mahmoud', N'1212121255ww', NULL, NULL, CAST(N'2061-01-18' AS Date), 17, 17, 1, 2, 1, CAST(N'2018-01-10 18:58:27.237' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (21, N'ahmed', N'nageeb', N'mahmoud', N'121212128787', NULL, NULL, CAST(N'1983-01-28' AS Date), 20, 20, 1, 2, 1, CAST(N'2018-01-10 19:53:21.330' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (22, N'ahmed', N'nageeb', N'mahmoud', N'1212121287875', NULL, NULL, CAST(N'1983-01-28' AS Date), 21, 21, 1, 2, 1, CAST(N'2018-01-10 20:05:13.413' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (23, N'ahmed', N'nageeb', N'mahmoud', N'12121212l', NULL, NULL, CAST(N'0001-01-01' AS Date), 22, 22, 1, 2, 1, CAST(N'2018-01-10 20:07:20.610' AS DateTime), N'en')
INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId], [DateCreated], [LanguageCode]) VALUES (24, N'ahmed', N'nageeb', N'mahmoud', N'1212121fdf2', NULL, NULL, CAST(N'1981-01-01' AS Date), 23, 23, 1, 2, 1, CAST(N'2018-01-10 20:09:18.107' AS DateTime), N'en')
SET IDENTITY_INSERT [dbo].[UserData] OFF
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (64, 1, 0, 0, CAST(N'2018-01-06 22:07:18.837' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (65, 1, 0, 0, CAST(N'2018-01-06 22:09:43.377' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (66, 1, 1, 1, CAST(N'2018-01-06 23:38:38.620' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (67, 1, 1, 0, CAST(N'2018-01-06 23:43:35.317' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (68, 1, 0, 0, CAST(N'2018-01-07 08:31:10.000' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (69, 1, 1, 0, CAST(N'2018-01-07 08:31:13.153' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (70, 1, 1, 0, CAST(N'2018-01-07 08:31:18.633' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (71, 1, 1, 0, CAST(N'2018-01-09 19:17:31.147' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (72, 1, 1, 0, CAST(N'2018-01-09 19:45:26.387' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (73, 1, 1, 0, CAST(N'2018-01-10 00:33:00.240' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (77, 1, 1, 0, CAST(N'2018-01-10 00:34:03.783' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (78, 1, 1, 0, CAST(N'2018-01-10 15:29:04.190' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (79, 2, 1, 0, CAST(N'2018-01-10 19:00:14.517' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (80, 11, 1, 0, CAST(N'2018-01-15 08:31:27.917' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (81, 11, 1, 0, CAST(N'2018-01-19 11:15:04.990' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (82, 11, 1, 0, CAST(N'2018-01-24 20:55:31.050' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (83, 11, 1, 0, CAST(N'2018-01-24 22:32:57.427' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (84, 11, 1, 0, CAST(N'2018-01-24 22:39:10.350' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (85, 11, 1, 0, CAST(N'2018-01-25 15:21:02.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (1, 2, 1, NULL, 1)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (2, 1, 1, NULL, 1)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (3, 4, 1, N'add', 2)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (4, 4, 2, N'eeeeeweweeeeeee', 2)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (5, 4, 3, N'22222222ghh', 2)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (6, 8, 1, N'add', 5)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (7, 8, 2, N'eeeeeweweeeeeee', 5)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (8, 8, 3, N'22222222ghh', 5)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (9, 9, 1, N'add', 6)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (10, 9, 2, N'eeeeeweweeeeeee', 6)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (11, 9, 3, N'22222222ghh', 6)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (12, 10, 1, N'add', 7)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (13, 10, 2, N'eeeeeweweeeeeee', 7)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (14, 10, 3, N'22222222ghh', 7)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (15, 11, 1, N'add', 8)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (16, 11, 2, N'eeeeeweweeeeeee', 8)
INSERT [dbo].[UserRoles] ([Id], [FKUserId], [FKRoleId], [Notes], [FKLogHistoryId]) VALUES (17, 11, 3, N'22222222ghh', 8)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
