USE [master]
GO
/****** Object:  Database [techonline]    Script Date: 1/25/2016 3:03:29 AM ******/
CREATE DATABASE [techonline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'techonline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\techonline.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'techonline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\techonline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [techonline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [techonline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [techonline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [techonline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [techonline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [techonline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [techonline] SET ARITHABORT OFF 
GO
ALTER DATABASE [techonline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [techonline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [techonline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [techonline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [techonline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [techonline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [techonline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [techonline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [techonline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [techonline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [techonline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [techonline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [techonline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [techonline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [techonline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [techonline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [techonline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [techonline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [techonline] SET  MULTI_USER 
GO
ALTER DATABASE [techonline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [techonline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [techonline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [techonline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [techonline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [techonline]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 1/25/2016 3:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 1/25/2016 3:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[payment_method] [varchar](50) NOT NULL,
	[shipping_city] [varchar](50) NOT NULL,
	[shipping_address] [varchar](50) NOT NULL,
	[shipping_postal] [varchar](50) NOT NULL,
	[shipping_country] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 1/25/2016 3:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image_path] [varchar](50) NULL,
	[description] [text] NOT NULL,
	[ram_amount] [tinyint] NOT NULL,
	[ram_type] [varchar](50) NOT NULL,
	[cpu_freq] [float] NOT NULL,
	[cpu_brand] [varchar](50) NOT NULL,
	[hdd_amount] [int] NOT NULL,
	[hdd_brand] [varchar](50) NOT NULL,
	[gpu] [varchar](50) NULL,
	[display] [smallint] NOT NULL,
	[category] [tinyint] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_techproducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/25/2016 3:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastname] [varchar](max) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[signup_date] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL CONSTRAINT [DF_users_type]  DEFAULT ('regular'),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [techonline] SET  READ_WRITE 
GO
