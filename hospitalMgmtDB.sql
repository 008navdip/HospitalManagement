USE [master]
GO
/****** Object:  Database [hospitalMgmt]    Script Date: 7/09/2020 9:16:47 pm ******/
CREATE DATABASE [hospitalMgmt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospitalMgmt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\hospitalMgmt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hospitalMgmt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\hospitalMgmt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hospitalMgmt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospitalMgmt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospitalMgmt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospitalMgmt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospitalMgmt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospitalMgmt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospitalMgmt] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospitalMgmt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hospitalMgmt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospitalMgmt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospitalMgmt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospitalMgmt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospitalMgmt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospitalMgmt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospitalMgmt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospitalMgmt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospitalMgmt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hospitalMgmt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospitalMgmt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospitalMgmt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospitalMgmt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospitalMgmt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospitalMgmt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospitalMgmt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospitalMgmt] SET RECOVERY FULL 
GO
ALTER DATABASE [hospitalMgmt] SET  MULTI_USER 
GO
ALTER DATABASE [hospitalMgmt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospitalMgmt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospitalMgmt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospitalMgmt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hospitalMgmt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'hospitalMgmt', N'ON'
GO
ALTER DATABASE [hospitalMgmt] SET QUERY_STORE = OFF
GO
USE [hospitalMgmt]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillNo] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnose]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnose](
	[DiagNo] [int] IDENTITY(1,1) NOT NULL,
	[DiagnosisDetails] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[DiagnosisDate] [datetime2](7) NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_Diagnose] PRIMARY KEY CLUSTERED 
(
	[DiagNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DrCode] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Designation] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Surgeon] [bit] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DrCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[DrCode] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/09/2020 9:16:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
	[Dept] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[CellNo] [nvarchar](max) NULL,
	[DrCode] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903120652_startup', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903121142_addedDoctorRef', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([BillNo], [PatientId], [Amount]) VALUES (1, 1, 123)
INSERT [dbo].[Bill] ([BillNo], [PatientId], [Amount]) VALUES (2, 2, 500)
INSERT [dbo].[Bill] ([BillNo], [PatientId], [Amount]) VALUES (3, 3, 200)
INSERT [dbo].[Bill] ([BillNo], [PatientId], [Amount]) VALUES (4, 4, 1000)
INSERT [dbo].[Bill] ([BillNo], [PatientId], [Amount]) VALUES (5, 5, 700)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Diagnose] ON 

INSERT [dbo].[Diagnose] ([DiagNo], [DiagnosisDetails], [Remarks], [DiagnosisDate], [PatientId]) VALUES (1, N'Fever', N'1', CAST(N'2020-09-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Diagnose] ([DiagNo], [DiagnosisDetails], [Remarks], [DiagnosisDate], [PatientId]) VALUES (2, N'Backpain', N'2', CAST(N'2020-09-03T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Diagnose] ([DiagNo], [DiagnosisDetails], [Remarks], [DiagnosisDate], [PatientId]) VALUES (3, N'Heart diseases', N'3', CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Diagnose] ([DiagNo], [DiagnosisDetails], [Remarks], [DiagnosisDate], [PatientId]) VALUES (4, N'Liver Diseases', N'4', CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Diagnose] ([DiagNo], [DiagnosisDetails], [Remarks], [DiagnosisDate], [PatientId]) VALUES (5, N'Legs pain', N'5', CAST(N'2020-09-04T00:00:00.0000000' AS DateTime2), 5)
SET IDENTITY_INSERT [dbo].[Diagnose] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DrCode], [Name], [Gender], [Designation], [Address], [Surgeon]) VALUES (1, N'Preet Gill', N'Female', N'Doctor', N'61 boundary road Claudelands ,hamilton, Nz', 1)
INSERT [dbo].[Doctor] ([DrCode], [Name], [Gender], [Designation], [Address], [Surgeon]) VALUES (2, N'nav', N'male', N'Phisyotherpist', N'Auckland, NZ', 1)
INSERT [dbo].[Doctor] ([DrCode], [Name], [Gender], [Designation], [Address], [Surgeon]) VALUES (3, N'Mr. randhawa', N'male', N'Doctor', N'Frankton, hamilton', 1)
INSERT [dbo].[Doctor] ([DrCode], [Name], [Gender], [Designation], [Address], [Surgeon]) VALUES (4, N'Mrs. Sidhu', N'Female', N'Nurse', N'Hillcrest road,  hamilton', 0)
INSERT [dbo].[Doctor] ([DrCode], [Name], [Gender], [Designation], [Address], [Surgeon]) VALUES (5, N'Rahul', N'male', N'Phisyotherpist', N'hamilton, heaphy terrace', 0)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [Name], [Age], [Gender], [DrCode]) VALUES (1, N'Navdeep Singh', 22, N'Male', 1)
INSERT [dbo].[Patient] ([PatientId], [Name], [Age], [Gender], [DrCode]) VALUES (2, N'Harpreet', 22, N'Female', 2)
INSERT [dbo].[Patient] ([PatientId], [Name], [Age], [Gender], [DrCode]) VALUES (3, N'Neetu', 20, N'Female', 3)
INSERT [dbo].[Patient] ([PatientId], [Name], [Age], [Gender], [DrCode]) VALUES (4, N'Khush', 22, N'Male', 4)
INSERT [dbo].[Patient] ([PatientId], [Name], [Age], [Gender], [DrCode]) VALUES (5, N'Riyan', 25, N'Male', 1)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffId], [Name], [Dept], [Gender], [CellNo], [DrCode]) VALUES (12, 2345, N'CICU', N'Female', N'1245367788', 1)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
/****** Object:  Index [IX_Bill_PatientId]    Script Date: 7/09/2020 9:16:47 pm ******/
CREATE NONCLUSTERED INDEX [IX_Bill_PatientId] ON [dbo].[Bill]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Diagnose_PatientId]    Script Date: 7/09/2020 9:16:47 pm ******/
CREATE NONCLUSTERED INDEX [IX_Diagnose_PatientId] ON [dbo].[Diagnose]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patient_DrCode]    Script Date: 7/09/2020 9:16:47 pm ******/
CREATE NONCLUSTERED INDEX [IX_Patient_DrCode] ON [dbo].[Patient]
(
	[DrCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Patient_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Patient_PatientId]
GO
ALTER TABLE [dbo].[Diagnose]  WITH CHECK ADD  CONSTRAINT [FK_Diagnose_Patient_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diagnose] CHECK CONSTRAINT [FK_Diagnose_Patient_PatientId]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Doctor_DrCode] FOREIGN KEY([DrCode])
REFERENCES [dbo].[Doctor] ([DrCode])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Doctor_DrCode]
GO
USE [master]
GO
ALTER DATABASE [hospitalMgmt] SET  READ_WRITE 
GO
