/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2008 R2 (10.50.6220)
    Source Database Engine Edition : Microsoft SQL Server Standard Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [CAGPAD]
GO
/****** Object:  Schema [Core]    Script Date: 22/08/2018 14:33:53 ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Schema [PAD]    Script Date: 22/08/2018 14:33:53 ******/
CREATE SCHEMA [PAD]
GO
/****** Object:  Table [Core].[Navigation]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Navigation](
	[NavId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Controller] [varchar](50) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[Icon] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[NavId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[NavigationRoles]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NavigationRoles](
	[NavId] [int] NOT NULL,
	[RoleName] [varchar](8) NOT NULL,
 CONSTRAINT [PK_NavigationRoles] PRIMARY KEY CLUSTERED 
(
	[NavId] ASC,
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Roles]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Roles](
	[RoleName] [varchar](8) NOT NULL,
	[RoleDescription] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[UserRoles]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleName] [varchar](8) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Users]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Telephone] [varchar](50) NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]),
	[Active] [bit] NOT NULL,
	[Salt] [varchar](max) NULL,
	[LastLogon] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Answers]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Answers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[CheckId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answer] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Cabinets]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Cabinets](
	[CabinetId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Supplier] [varchar](50) NULL,
	[HeartSafeNumber] [int] NULL,
	[WarrantyExpiry] [date] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Cabinets] PRIMARY KEY CLUSTERED 
(
	[CabinetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Defibrillators]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Defibrillators](
	[DefibId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Supplier] [varchar](50) NULL,
	[Serial] [nvarchar](50) NULL,
	[WarrantyExpires] [date] NULL,
	[BatteryExpiry] [date] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Defibrillators] PRIMARY KEY CLUSTERED 
(
	[DefibId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PAD].[GuardianChecks]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[GuardianChecks](
	[CheckId] [int] IDENTITY(1,1) NOT NULL,
	[PadId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[UserId] [int] NOT NULL,
	[Completed] [datetime] NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_GuardianChecks_1] PRIMARY KEY CLUSTERED 
(
	[CheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Guardians]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Guardians](
	[UserId] [int] NOT NULL,
	[PadId] [int] NOT NULL,
 CONSTRAINT [PK_Guardians] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PAD].[IssueNotes]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[IssueNotes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[IssueId] [int] NOT NULL,
	[NoteBy] [int] NOT NULL,
	[NoteOn] [datetime] NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_IssueNotes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Issues]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Issues](
	[IssueId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerId] [int] NULL,
	[PadId] [int] NULL,
	[DefibId] [int] NULL,
	[CabinetId] [int] NULL,
	[Severity] [int] NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[ReportedBy] [int] NOT NULL,
	[ReportedOn] [datetime] NOT NULL,
	[Resolved] [bit] NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[IssueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Miscellaneous]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Miscellaneous](
	[MiscId] [int] IDENTITY(1,1) NOT NULL,
	[PadId] [int] NULL,
	[DefibId] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Expiry] [date] NOT NULL,
 CONSTRAINT [PK_Miscellaneous] PRIMARY KEY CLUSTERED 
(
	[MiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PAD].[PADSites]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[PADSites](
	[PadId] [int] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Address] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Cabinet] [int] NOT NULL,
	[Defib] [int] NOT NULL,
	[Owner] [varchar](50) NULL,
	[OwnerTel] [varchar](12) NULL,
	[OwnerEmail] [varchar](50) NULL,
	[InstallDate] [date] NULL,
	[Funding] [varchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Insurance] [varchar](50) NULL,
	[PadsExpiry] [date] NULL,
	[Map] [nvarchar](max) NULL,
 CONSTRAINT [PK_PADSites] PRIMARY KEY CLUSTERED 
(
	[PadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PAD].[Questions]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PAD].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](1000) NOT NULL,
	[Type] [char](1) NOT NULL,
	[Active] [bit] NOT NULL,
	[QuestionOrder] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Core].[Navigation] ON 
GO
INSERT [Core].[Navigation] ([NavId], [Name], [Controller], [Action], [Icon], [Active], [ParentId]) VALUES (1, N'Database', N'PADSites', N'Index', N'database', 1, 0)
GO
INSERT [Core].[Navigation] ([NavId], [Name], [Controller], [Action], [Icon], [Active], [ParentId]) VALUES (3, N'Guardian Checks', N'Guardians', N'Index', N'wpforms', 1, 0)
GO
SET IDENTITY_INSERT [Core].[Navigation] OFF
GO
INSERT [Core].[NavigationRoles] ([NavId], [RoleName]) VALUES (3, N'SYSADMIN')
GO
INSERT [Core].[Roles] ([RoleName], [RoleDescription], [Active]) VALUES (N'GUARDIAN', N'Access to guardian checks only', 1)
GO
INSERT [Core].[Roles] ([RoleName], [RoleDescription], [Active]) VALUES (N'READER', N'Read Only Permissions', 1)
GO
INSERT [Core].[Roles] ([RoleName], [RoleDescription], [Active]) VALUES (N'SYSADMIN', N'System Administrator', 1)
GO
INSERT [Core].[UserRoles] ([UserId], [RoleName]) VALUES (1, N'SYSADMIN')
GO
SET IDENTITY_INSERT [Core].[Users] ON 
GO
INSERT [Core].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [Telephone], [Active], [Salt], [LastLogon]) VALUES (1, N'KWOOD', N'376140675afc0a9b8b6a4804559eae791fcc8f05f9a2d8b214f23457da297259', N'Kyle', N'Wood', N'steel.woodrow@gmail.com', N'07839111653', 1, N'vLEz/ONnc0Su1w==', CAST(N'2018-08-22T14:28:35.223' AS DateTime))
GO
INSERT [Core].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [Telephone], [Active], [Salt], [LastLogon]) VALUES (2, N'mfroome', N'aa4562a812fadb45bd7764776df1e36ea2f7d02a44c7e81a98ada00d90b2f9f5', N'Mike', N'Froome', N'resuscitationgsy@hotmail.com', N'07781406096', 1, N'HQcMc5rua7yLdw==', CAST(N'2018-08-10T12:52:59.013' AS DateTime))
GO
SET IDENTITY_INSERT [Core].[Users] OFF
GO
SET IDENTITY_INSERT [PAD].[Cabinets] ON 
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (1, N'H', N'Heartsafe H', N'Unknown', 1067, CAST(N'2026-03-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (2, N'G3H', N'Heartsafe G3H', N'Unknown', 1151, CAST(N'2026-07-11' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (3, N'G3H', N'Heartsafe G3H', N'Unknown', 989, CAST(N'2025-05-14' AS Date), CAST(N'2018-08-15T10:53:45.987' AS DateTime), 1)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (4, N'G3H', N'Heartsafe G3H', N'Unknown', 1204, CAST(N'2026-09-09' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (5, N'G3H', N'Heartsafe G3H', N'Unknown', 1039, CAST(N'2026-01-06' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (6, N'H', N'Heartsafe H', N'Unknown', 1094, CAST(N'2026-06-06' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (7, N'G3H', N'Heartsafe G3H', N'Unknown', 1090, CAST(N'2026-06-06' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (8, N'G3H', N'Heartsafe G3H', N'Unknown', 1092, CAST(N'2026-06-13' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (9, N'G3H', N'Heartsafe G3H', N'Unknown', 1091, CAST(N'2026-05-11' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (10, N'G3H', N'Heartsafe G3H', N'Unknown', 1093, CAST(N'2026-06-13' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (11, N'G3H', N'Heartsafe G3H', N'Unknown', 1152, CAST(N'2026-05-19' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (12, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2022-01-23' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (13, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2024-03-04' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (14, N'H', N'Heartsafe H', N'Unknown', 1206, CAST(N'2026-10-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (15, N'?', N'Medicare', N'Unknown', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (16, N'?', N'Medicare', N'Unknown', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (17, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2023-08-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (18, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2024-04-02' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (19, N'H', N'Heartsafe H', N'Unknown', 1150, CAST(N'2026-11-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (20, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2024-02-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (21, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2023-09-30' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (22, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2024-02-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (23, N'H', N'Heartsafe H', N'Unknown', 1069, CAST(N'2026-05-18' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (24, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2020-08-29' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (25, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2020-09-30' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (26, N'H', N'Heartsafe H', N'Unknown', 1107, CAST(N'2026-05-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (27, N'Out of order', N'Medicare', N'Unknown', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (28, N'G3H', N'Heartsafe G3H', N'Unknown', 1071, CAST(N'2025-12-16' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (29, N'G3H', N'Heartsafe G3H', N'Unknown', 1149, CAST(N'2026-01-17' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (30, N'G3H', N'Heartsafe G3H', N'Unknown', 1067, CAST(N'2025-12-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (31, N'G3H', N'Heartsafe G3H', N'Unknown', 1205, CAST(N'2015-12-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (32, N'G3H', N'Heartsafe G3H', N'Unknown', 1072, CAST(N'2026-04-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (33, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2020-02-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (34, N'G3H', N'Heartsafe G3H', N'Unknown', 1040, CAST(N'2026-02-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (35, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2019-02-01' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (36, N'G3H', N'Heartsafe G3H', N'Unknown', 1070, CAST(N'2026-01-17' AS Date), NULL, NULL)
GO
INSERT [PAD].[Cabinets] ([CabinetId], [Name], [Description], [Supplier], [HeartSafeNumber], [WarrantyExpiry], [ModifiedOn], [ModifiedBy]) VALUES (37, N'M', N'Medicare', N'Unknown', NULL, CAST(N'2021-01-01' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [PAD].[Cabinets] OFF
GO
SET IDENTITY_INSERT [PAD].[Defibrillators] ON 
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (2, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J789823', CAST(N'2021-03-01' AS Date), NULL, CAST(N'2018-08-15T11:36:27.277' AS DateTime), 1)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (3, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16D826859', CAST(N'2023-08-18' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (4, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X14J715665', CAST(N'2020-05-14' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (5, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16D828149', CAST(N'2023-09-09' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (6, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X159767959', CAST(N'2021-01-06' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (7, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15L804979', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (8, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15L804982', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (9, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16A809920', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (10, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J788802', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (11, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J788839', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (12, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J789853', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (13, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13C595598', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (14, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13C59541', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (15, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16F843298', CAST(N'2023-10-01' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (16, N'Unknown', N'Probably a Zoll AED', N'Someone', N'', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (17, N'Unknown', N'Probably a Zoll AED', N'Someone', N'', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (18, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X14E675326', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (19, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X14E676113', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (20, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16F843205', CAST(N'2021-11-01' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (21, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596252', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (22, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13C595436', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (23, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596271', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (24, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16A809831', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (25, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596285', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (26, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596232', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (27, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J788837', CAST(N'2026-05-01' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (28, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596268', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (29, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15B738315', CAST(N'2020-12-16' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (30, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16D828197', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (31, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15J789845', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (32, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16D826954', CAST(N'2022-12-01' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (33, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596269', CAST(N'2021-04-01' AS Date), NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (34, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13D596269', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (35, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X15G767988', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (36, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13C595467', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (37, N'Unknown', N'Probably a Zoll AED', N'Someone', N'(21) X16D828186', NULL, NULL, NULL, NULL)
GO
INSERT [PAD].[Defibrillators] ([DefibId], [Name], [Description], [Supplier], [Serial], [WarrantyExpires], [BatteryExpiry], [ModifiedOn], [ModifiedBy]) VALUES (38, N'Unknown', N'Probably a Zoll AED', N'Someone', N'X13C59443', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [PAD].[Defibrillators] OFF
GO
SET IDENTITY_INSERT [PAD].[PADSites] ON 
GO
INSERT [PAD].[PADSites] ([PadId], [Location], [Address], [Description], [Cabinet], [Defib], [Owner], [OwnerTel], [OwnerEmail], [InstallDate], [Funding], [Amount], [Insurance], [PadsExpiry], [Map]) VALUES (1, N'Bathing Pools', N'Bathing Pools, La Vallette, St Peter Port, GY1 1AX', N'Next to telephone box', 1, 2, N'Colin Thorburn', N'01481 747200', N'hello', CAST(N'2016-03-01' AS Date), N'Guernsey Swimming Club & Saffrey Champness', CAST(2000.00 AS Decimal(18, 2)), N'None', CAST(N'2018-08-31' AS Date), N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2593.906335984013!2d-2.5332915341121054!3d49.44848726692897!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480d733d10c179cf%3A0x54fccdec0fd10d80!2sLa+Valette+Bathing+Pools!5e0!3m2!1sen!2sgg!4v1526594009684" style="width:100%; height: 450px; border:0" frameborder="0" allowfullscreen></iframe>')
GO
INSERT [PAD].[PADSites] ([PadId], [Location], [Address], [Description], [Cabinet], [Defib], [Owner], [OwnerTel], [OwnerEmail], [InstallDate], [Funding], [Amount], [Insurance], [PadsExpiry], [Map]) VALUES (2, N'C5 Alliance', N'C5 Alliance, Turing House, Gibauderie, St Peter Port, GY1 1XN ', N'Left of main door', 2, 3, N'C5 Alliance', N'01481 722575', N'richardbirch@c5aliance.com', CAST(N'2016-07-11' AS Date), N'C5 Alliance', NULL, NULL, NULL, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2593.316508297549!2d-2.5512566839333224!3d49.459633979350926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480d731fcac376c7%3A0xbc3f3680b5c76192!2sC5+Alliance+Limited!5e0!3m2!1sen!2sgg!4v1533898772207" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>')
GO
INSERT [PAD].[PADSites] ([PadId], [Location], [Address], [Description], [Cabinet], [Defib], [Owner], [OwnerTel], [OwnerEmail], [InstallDate], [Funding], [Amount], [Insurance], [PadsExpiry], [Map]) VALUES (3, N'Town Church Square', N'Church Square, St Peter Port, GY1 2LD', N'Converted phonebox in Church Square', 3, 4, N'SJEAS, Andy Adam', N'01481 725211', N'andy.adam@stjohn.gg', CAST(N'2016-04-01' AS Date), N'Sure', NULL, N'Insurance Corp.', NULL, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1296.7850942342027!2d-2.5375356416545856!3d49.45484009483758!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480d731eceba13f9%3A0x3dd5f85d4ccc0484!2sHigh+St%2C+GY1+2LB!5e0!3m2!1sen!2sgg!4v1533899018161" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>')
GO
SET IDENTITY_INSERT [PAD].[PADSites] OFF
GO
SET IDENTITY_INSERT [PAD].[Questions] ON 
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (1, N'Have you had training in how to perform this check?', N'T', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (2, N'Do you see any signs of damage to the cabinet?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (3, N'Does the sign and cabinet look clean?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (4, N'Have you cleaned the outside of the cabinet and lock?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (5, N'Does the cabinet open and close correctly using the access code?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (6, N'A Red flashing light on the LOCK when entering the 4 digit code means
change lock batteries! Are your lock batteries OK?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (7, N'Do the lights at the top and inside of the cabinet work?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (8, N'Have you ensured that nothing is touching the heater?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (9, N'Is the inside of the cabinet clean?', N'C', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (10, N'Is the AED in operating mode, i.e. Green light ok or Tick in the display?', N'D', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (11, N'Is the AED silent – i.e. Not beeping or making any noise?', N'D', 1, NULL)
GO
INSERT [PAD].[Questions] ([QuestionId], [Question], [Type], [Active], [QuestionOrder]) VALUES (12, N'Have you ensured the cabinet is closed and locked before leaving?', N'C', 1, NULL)
GO
SET IDENTITY_INSERT [PAD].[Questions] OFF
GO
ALTER TABLE [Core].[NavigationRoles]  WITH CHECK ADD  CONSTRAINT [FK_NavigationRoles_Navigation] FOREIGN KEY([NavId])
REFERENCES [Core].[Navigation] ([NavId])
GO
ALTER TABLE [Core].[NavigationRoles] CHECK CONSTRAINT [FK_NavigationRoles_Navigation]
GO
ALTER TABLE [Core].[NavigationRoles]  WITH CHECK ADD  CONSTRAINT [FK_NavigationRoles_Roles] FOREIGN KEY([RoleName])
REFERENCES [Core].[Roles] ([RoleName])
GO
ALTER TABLE [Core].[NavigationRoles] CHECK CONSTRAINT [FK_NavigationRoles_Roles]
GO
ALTER TABLE [Core].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleName])
REFERENCES [Core].[Roles] ([RoleName])
GO
ALTER TABLE [Core].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [Core].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [Core].[Users] ([UserId])
GO
ALTER TABLE [Core].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [PAD].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_GuardianChecks] FOREIGN KEY([CheckId])
REFERENCES [PAD].[GuardianChecks] ([CheckId])
GO
ALTER TABLE [PAD].[Answers] CHECK CONSTRAINT [FK_Answers_GuardianChecks]
GO
ALTER TABLE [PAD].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [PAD].[Questions] ([QuestionId])
GO
ALTER TABLE [PAD].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [PAD].[GuardianChecks]  WITH CHECK ADD  CONSTRAINT [FK_GuardianChecks_PADSites] FOREIGN KEY([PadId])
REFERENCES [PAD].[PADSites] ([PadId])
GO
ALTER TABLE [PAD].[GuardianChecks] CHECK CONSTRAINT [FK_GuardianChecks_PADSites]
GO
ALTER TABLE [PAD].[GuardianChecks]  WITH CHECK ADD  CONSTRAINT [FK_GuardianChecks_Users] FOREIGN KEY([UserId])
REFERENCES [Core].[Users] ([UserId])
GO
ALTER TABLE [PAD].[GuardianChecks] CHECK CONSTRAINT [FK_GuardianChecks_Users]
GO
ALTER TABLE [PAD].[Guardians]  WITH CHECK ADD  CONSTRAINT [FK_Guardians_PADSites] FOREIGN KEY([PadId])
REFERENCES [PAD].[PADSites] ([PadId])
GO
ALTER TABLE [PAD].[Guardians] CHECK CONSTRAINT [FK_Guardians_PADSites]
GO
ALTER TABLE [PAD].[Guardians]  WITH CHECK ADD  CONSTRAINT [FK_Guardians_Users] FOREIGN KEY([UserId])
REFERENCES [Core].[Users] ([UserId])
GO
ALTER TABLE [PAD].[Guardians] CHECK CONSTRAINT [FK_Guardians_Users]
GO
ALTER TABLE [PAD].[IssueNotes]  WITH CHECK ADD  CONSTRAINT [FK_IssueNotes_Issues] FOREIGN KEY([IssueId])
REFERENCES [PAD].[Issues] ([IssueId])
GO
ALTER TABLE [PAD].[IssueNotes] CHECK CONSTRAINT [FK_IssueNotes_Issues]
GO
ALTER TABLE [PAD].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Answers] FOREIGN KEY([AnswerId])
REFERENCES [PAD].[Answers] ([AnswerId])
GO
ALTER TABLE [PAD].[Issues] CHECK CONSTRAINT [FK_Issues_Answers]
GO
ALTER TABLE [PAD].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_PADSites] FOREIGN KEY([PadId])
REFERENCES [PAD].[PADSites] ([PadId])
GO
ALTER TABLE [PAD].[Issues] CHECK CONSTRAINT [FK_Issues_PADSites]
GO
ALTER TABLE [PAD].[Miscellaneous]  WITH CHECK ADD  CONSTRAINT [FK_Miscellaneous_PADSites] FOREIGN KEY([PadId])
REFERENCES [PAD].[PADSites] ([PadId])
GO
ALTER TABLE [PAD].[Miscellaneous] CHECK CONSTRAINT [FK_Miscellaneous_PADSites]
GO
ALTER TABLE [PAD].[PADSites]  WITH CHECK ADD  CONSTRAINT [FK_PADSites_Cabinets] FOREIGN KEY([Cabinet])
REFERENCES [PAD].[Cabinets] ([CabinetId])
GO
ALTER TABLE [PAD].[PADSites] CHECK CONSTRAINT [FK_PADSites_Cabinets]
GO
ALTER TABLE [PAD].[PADSites]  WITH CHECK ADD  CONSTRAINT [FK_PADSites_Defibrillators] FOREIGN KEY([Defib])
REFERENCES [PAD].[Defibrillators] ([DefibId])
GO
ALTER TABLE [PAD].[PADSites] CHECK CONSTRAINT [FK_PADSites_Defibrillators]
GO
/****** Object:  StoredProcedure [Core].[Navigation_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [Core].[Navigation_List] (
	@NavId int = null
) as

select
	n.NavId,
	n.Name,
	n.Controller,
	n.Action,
	n.Icon,
	n.Active,
	n.ParentId,
	isParent = cast((select case when count(*) > 1 then 1 else 0 end from core.Navigation where ParentId = n.NavId) as bit)
from
	core.Navigation n
where
	n.NavId = ISNULL(@NavId, n.NavId)

GO
/****** Object:  StoredProcedure [Core].[Role_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Core].[Role_List] (
    @UserId int = null
) as

select
    RoleName,
    RoleDescription
from
    Core.Roles

if @UserId is not null

select
    r.RoleName
from
    Core.Roles r
    join Core.UserRoles ur on r.RoleName = ur.RoleName and ur.UserId = @UserId

GO
/****** Object:  StoredProcedure [Core].[User_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Core].[User_List] (
    @UserId int = null,
    @UserName varchar(50) = null,
    @EmailAddress varchar(50) = null,
    @PadId int = null,
    @RoleName varchar(10) = null
) as


select distinct
    u.UserId,
    u.UserName,
    u.Password,
    u.FirstName,
    u.LastName,
    u.EmailAddress,
    u.Telephone,
    u.FullName,
    u.Active
into #Users
from
    Core.Users u
where
    u.UserId = ISNULL(@UserId, u.UserId)
    and u.UserName = ISNULL(@UserName, u.UserName)
    and u.EmailAddress = ISNULL(@EmailAddress, u.EmailAddress)

if @PadId is not null
    select
        UserId
    from
        PAD.Guardians
    where
        PadId = @PadId

if @RoleName is null
    select
        *
    from
        #Users

if @RoleName is not null
    select
        *
    from
        #Users u 
        join Core.UserRoles ur on u.UserId = ur.UserId and ur.RoleName = @RoleName

GO
/****** Object:  StoredProcedure [Core].[User_Login]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Core].[User_Login] (
    @Username varchar(50),
    @Password nvarchar(max) = null
) as

select
    UserId,
    UserName,
    FullName,
    Salt,
    Match = cast(case when @Password = Password then 1 else 0 end as bit)
into #result
from
    Core.Users
where
    UserName = @Username

if (select top 1 Match from #result) = 1
update Core.Users set LastLogon = GETDATE() where UserName = @Username

select * from #result

GO
/****** Object:  StoredProcedure [Core].[User_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Core].[User_Upsert] (
    @UserId int = null,
    @UserName varchar(50),
    @Password nvarchar(max) = null,
    @Salt varchar(max) = null,
    @FirstName varchar(50),
    @LastName varchar(50),
    @EmailAddress varchar(50),
    @Telephone varchar(50) = null,
    @Active bit
) as

if not exists (select * from Core.Users where UserName = @UserName)
begin

    insert into Core.Users (UserName, Password, Salt, FirstName, LastName, EmailAddress, Telephone, Active)
    values (@UserName, @Password, @Salt, @FirstName, @LastName, @EmailAddress, @Telephone, @Active)
    select @UserId = SCOPE_IDENTITY()
    return @UserId

end

else 

begin

    if @Salt is not null and @Password is not null
    begin
        update Core.Users set
            Password = @Password,
            Salt = @Salt
        where
            UserId = @UserId
    end
    
    else 

    begin

    update Core.Users set
        FirstName = @FirstName,
        LastName = @LastName,
        EmailAddress = @EmailAddress,
        Telephone = @Telephone,
        Active = @Active
    where
        UserId = @UserId
    
    return @UserId

    end
end
GO
/****** Object:  StoredProcedure [Core].[UserRole_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Core].[UserRole_List] (
    @UserId int = null,
    @UserName varchar(50) = null
) as

select
    ur.UserId,
    ur.roleName
from
    Core.UserRoles ur
    join Core.Users u on ur.UserId = u.UserId
where
    u.UserId = ISNULL(@UserId, u.UserId)
    and u.UserName = ISNULL(@UserName, u.UserName)

GO
/****** Object:  StoredProcedure [Core].[UserRole_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [Core].[UserRole_Upsert] (
    @UserId int,
    @RoleName varchar(10),
    @AddRemove char(1)
) as

if @AddRemove = 'A'
begin
    insert into Core.UserRoles (UserId, RoleName)
    values (@UserId, @RoleName)
end

if @AddRemove = 'R'
begin
    delete from Core.UserRoles
    where 
        UserId = @UserId
        and RoleName = @RoleName
end
GO
/****** Object:  StoredProcedure [PAD].[Answers_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Answers_List] (
    @CheckId int
) as

select
    a.CheckId,
    q.QuestionId,
    q.Question,
    a.AnswerId,
    a.Answer,
    i.IssueId,
    i.Description,
    i.Severity,
    i.Image,
    i.Resolved
from
    PAD.Questions q
    join PAD.Answers a on q.QuestionId = a.QuestionId
    left join PAD.Issues i on a.AnswerId = i.AnswerId
where
    a.CheckId = @CheckId
    and q.Active = 1

GO
/****** Object:  StoredProcedure [PAD].[Answers_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Answers_Upsert] (
    @CheckId int,
    @QuestionId int,
    @Answer bit,
    @UserId int
) as

declare @AnswerId int

insert into PAD.Answers (CheckId, QuestionId, Answer, UserId)
values (@CheckId, @QuestionId, @Answer, @UserId)
select @AnswerId = SCOPE_IDENTITY()

if @Answer = 0

begin

    declare @PadId int,
            @DefibId int,
            @CabinetId int,
            @IssueType char(1),
            @Now datetime = getdate()

    select @IssueType = Type from PAD.Questions q where QuestionId = @QuestionId
    select @PadId = p.PadId, @DefibId = p.Defib, @CabinetId = p.Cabinet from PAD.PADSites p join PAD.GuardianChecks c on p.PadId = c.PadId and c.CheckId = @CheckId    

    insert into PAD.Issues (AnswerId, PadId, DefibId, CabinetId, ReportedBy, ReportedOn, Resolved)
    select
        @AnswerId,
        @PadId,
        case when @IssueType = 'D' then @DefibId else null end,
        case when @IssueType = 'C' then @CabinetId else null end,
        @UserId,
        @Now,
        0

end
GO
/****** Object:  StoredProcedure [PAD].[Cabinet_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Cabinet_List] (
	@CabinetId int = null,
    @Selected bit = null
) as

select * into #selected from PAD.PADSites where Cabinet is not null

select
	c.CabinetId, 
	c.Name, 
	c.Description, 
	c.Supplier, 
	c.HeartSafeNumber, 
	c.WarrantyExpiry,
    p.PadId,
    p.Location
into
    #cabinets
from
	PAD.Cabinets c
    left join PAD.PADSites p on c.CabinetId = p.Cabinet
where
	c.CabinetId = ISNULL(@CabinetId, c.CabinetId)

if @Selected = 1
    select
        c.*
    from 
        #cabinets c
        join #selected s on c.CabinetId = s.Cabinet

if @Selected = 0
    select
        c.*
    from
        #cabinets c
    where
        c.CabinetId not in (select Cabinet from #selected)

if @Selected is null
    select * from #cabinets

GO
/****** Object:  StoredProcedure [PAD].[Cabinet_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [PAD].[Cabinet_Upsert] (
    @CabinetId int = null,
    @Name varchar(50),
    @Description varchar(100),
    @Supplier varchar(50) = null,
    @HeartSafeNumber int = null,
    @Expiry date = null,
    @UserId int
) as

declare @now datetime = getdate()

if not exists (select * from PAD.Cabinets where CabinetId = @CabinetId)
begin

    insert into PAD.Cabinets (Name, Description, Supplier, HeartSafeNumber, WarrantyExpiry, ModifiedBy, ModifiedOn)
    values (@Name, @Description, @Supplier, @HeartSafeNumber, @Expiry, @UserId, @now)
    select @CabinetId = SCOPE_IDENTITY()
    return @CabinetId

end

else 

begin

    update PAD.Cabinets set
        Name = @Name,
        Description = @Description,
        Supplier = @Supplier,
        HeartSafeNumber = @HeartSafeNumber,
        WarrantyExpiry = @Expiry,
        ModifiedBy = @UserId,
        ModifiedOn = @now
    where
        CabinetId = @CabinetId

end
GO
/****** Object:  StoredProcedure [PAD].[Defib_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Defib_List] (
	@DefibId int = null,
    @Selected bit = null
) as

select * into #Selected from PAD.PADSites where Defib is not null

select
	d.DefibId, 
	d.Name, 
	d.Description, 
	d.Supplier, 
	d.Serial, 
	d.WarrantyExpires, 
	d.BatteryExpiry,
    p.PadId,
    p.Location
into
    #Defibs
from
	PAD.Defibrillators d
    left join PAD.PADSites p on d.DefibId = p.Defib
where
	d.DefibId = ISNULL(@DefibId, d.DefibId)

if @Selected = 1
    select
        d.*
    from
        #Defibs d
        join #Selected s on d.DefibId = s.Defib

if @Selected = 0
    select 
        d.*
    from
        #Defibs d
    where
        d.DefibId not in (select Defib from #Selected)

if @Selected is null
    select * from #Defibs


GO
/****** Object:  StoredProcedure [PAD].[Defib_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [PAD].[Defib_Upsert] (
    @DefibId int = null,
    @Name varchar(50),
    @Description varchar(100),
    @Supplier varchar(50) = null,
    @Serial nvarchar(50) = null,
    @WarrantyExpires date = null,
    @BatteryExpiry date = null,
    @UserId int
) as

declare @now datetime = getdate()

if not exists (select * from PAD.Defibrillators where DefibId = @DefibId)
begin

    insert into PAD.Defibrillators(Name, Description, Supplier, Serial, WarrantyExpires, BatteryExpiry, ModifiedBy, ModifiedOn)
    values (@Name, @Description, @Supplier, @Serial, @WarrantyExpires, @BatteryExpiry, @UserId, @now)
    select @DefibId = SCOPE_IDENTITY()
    return @DefibId

end

else 

begin

    update PAD.Defibrillators set
        Name = @Name,
        Description = @Description,
        Supplier = @Supplier,
        Serial = @Serial,
        WarrantyExpires = @WarrantyExpires,
        BatteryExpiry = @BatteryExpiry,
        ModifiedBy = @UserId,
        ModifiedOn = @now
    where
        DefibId = @DefibId

end
GO
/****** Object:  StoredProcedure [PAD].[Equipment_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [PAD].[Equipment_List] (
	@PadID int = null
) as

declare @CabinetId int,
		@DefibId int

create table #equipment (
	PadId int,
	CabinetId int,
	DefibId int,
	Name varchar(50),
	Description varchar(100),
	Supplier varchar(50),
	Expiry datetime,
	MinorIssues int,
	MajorIssues int
)

insert into #equipment (CabinetId, Name, Description, Supplier, Expiry, MinorIssues, MajorIssues)
select c.CabinetId, 'Cabinet', c.Description, c.Supplier, c.WarrantyExpiry,
(select count(*) from PAD.Issues i where i.CabinetId = c.CabinetId and i.Severity > 1),
(select count(*) from PAD.Issues i where i.CabinetId = c.CabinetId and i.Severity = 1)
from PAD.Cabinets c

insert into #equipment (DefibId, Name, Description, Supplier, Expiry, MinorIssues, MajorIssues)
select d.DefibId, 'Defibrillator', d.Description, d.Supplier, d.WarrantyExpires,
(select count(*) from PAD.Issues i where i.DefibId = d.DefibId and i.Severity > 1),
(select count(*) from PAD.Issues i where i.DefibId = d.DefibId and i.Severity = 1)
from PAD.Defibrillators d 

insert into #equipment (PadId, Name, Description, Expiry, MinorIssues, MajorIssues)
select p.PadId, 'Pads', 'Defibrillator Pads', p.PadsExpiry, 0, 0
from PAD.PADSites p 

insert into #equipment (DefibId, Name, Description, Expiry, MinorIssues, MajorIssues)
select d.DefibId, 'Battery', 'Defibrillator Battery', d.BatteryExpiry, 0, 0
from PAD.Defibrillators d

select
	PadId = isnull(e.PadId, isnull(pc.PadId,pd.PadId)),
	e.CabinetId,
	e.DefibId,
	e.Name,
	e.Description,
	e.Supplier,
	e.Expiry,
	e.MinorIssues,
	e.MajorIssues
into
	#eq
from 
	#equipment e
	left join PAD.PADSites pc on e.CabinetId = pc.Cabinet
	left join PAD.PADSites pd on e.DefibId = pd.Defib


select
	*
from 
	#eq
where
	isnull(PadId, 0) = isnull(@PadID, isnull(PadId, 0))
order by
	Expiry


GO
/****** Object:  StoredProcedure [PAD].[GuardianCheck_Issues]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[GuardianCheck_Issues] (@PadId int, @Date datetime)
as

begin

    create table #issues (IssueName varchar(50))

    declare @sql nvarchar(max) = ''
    select @sql = @sql + ' insert into #Issues (IssueName) select ''' + c.name + ''' from PAD.GuardianChecks g where g.padid = ' + cast(@PadId as varchar(5)) + ' and g.date = ''' + cast(@Date as varchar(20)) + ''' and ' + c.name + ' = 0;'
	from 
		sys.columns c
		join sys.tables t on c.object_id = t.object_id
	where
		t.name = 'GuardianChecks'
		and c.system_type_id = 104

	exec (@sql)

	select
		IssueName,
		IssueQuestion = case IssueName
			when 'CabinetOpenLock' then 'Does the cabinet open and lock correctly?'
			when 'CabinetBatteriesOk' then 'Are the lock batteries ok?'
			when 'CabinetLightWork' then 'Are the cabinet lights working?'
			when 'nothingTouchingHeater' then 'Have you ensured that nothing is touching the cabinet heater?'
			when 'AEDOk' then 'Is the AED in operating mode?'
			when 'AEDSilent' then 'Is the AED silent?'
		end
	from 
		#issues

end

GO
/****** Object:  StoredProcedure [PAD].[GuardianCheck_Late]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[GuardianCheck_Late] (
    @Late bit
) as

declare @today datetime = getdate();

with lastchecks as (
    select
        p.PadId,
        LastCheck = cast('2018-06-14' as date)--max(p.Completed)
    from
        PAD.GuardianChecks p
    group by
        p.PadId
)

select
    p.PadId,
    p.Location,
    l.LastCheck,
    Late = cast(case 
        when DATEDIFF(WEEK, isnull(l.LastCheck, '1900-01-01'), @today) > 2 then 1
        else 0
    end as bit)
into
    #Results
from
    PAD.PADSites p
    left join lastchecks l on p.PadId = l.PadId

select
    *
from
    #Results r
where
    r.Late = ISNULL(@Late, r.Late)

GO
/****** Object:  StoredProcedure [PAD].[GuardianCheck_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[GuardianCheck_List] ( 
    @CheckId int = null,
	@PadId int = null,
	@Date date = null
) as

select
    g.CheckId,
	g.PadId, 
    p.Location,
	g.Date, 
	g.UserId,
	Guardian = u.FullName,
    g.Completed,
    g.Notes,
    Issues = isnull((select count(*) from pad.Answers where CheckId = g.CheckId and Answer = 0),0)
from
	PAD.GuardianChecks g
	join Core.Users u on g.UserId = u.UserId
    join PAD.PADSites p on g.PadId = p.PadId
where
    g.CheckId = ISNULL(@CheckId, g.CheckId)
	and g.PadId = ISNULL(@PadId, g.PadId)
	and g.Date = ISNULL(@Date, g.Date)
order by
    g.Date desc

GO
/****** Object:  StoredProcedure [PAD].[GuardianCheck_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[GuardianCheck_Upsert] (
    @CheckId int = null,
	@PadId int,
	@Date date = null,
	@UserId int,
    @Complete bit,
    @Notes varchar(max) = null
) as

declare @now datetime = getdate()

if not exists (select * from PAD.GuardianChecks g where g.PadId = @PadId and g.Date = @Date)
begin

	insert into PAD.GuardianChecks (PadId, Date, UserId)
	values (@PadId, cast(@now as date), @UserId)
	select @CheckId = SCOPE_IDENTITY()
	return @CheckId

end

else

begin

    update PAD.GuardianChecks set
      Notes = @Notes
    where
        CheckId = @CheckId

	if @Complete = 1
    begin
        update PAD.GuardianChecks set
            Completed = @now
        where
            CheckId = @CheckId
    end

	return @CheckId
    

end
GO
/****** Object:  StoredProcedure [PAD].[Guardians_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [PAD].[Guardians_Upsert] (
    @PadId int,
    @UserId int,
    @AddRemove char(1)
) as

if @AddRemove = 'A'
begin
    insert into PAD.Guardians (PadId, UserId)
    values (@PadId, @UserId)
end

if @AddRemove = 'R'
begin
    delete from PAD.Guardians
    where
        PadId = @PadId
        and UserId = @UserId
end
    
GO
/****** Object:  StoredProcedure [PAD].[IssueNotes_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[IssueNotes_List] (
    @IssueId int,
    @NoteId int = null
) as

select
    i.NoteId,
    i.IssueId,
    NoteBy = u.FullName,
    i.NoteOn,
    i.Note
from
    PAD.IssueNotes i
    join Core.Users u on i.NoteBy = u.UserId
where
    i.IssueId = @IssueId
    and i.NoteId = ISNULL(@NoteId, i.NoteId)
    and i.Active = 1
order by
    i.NoteOn desc

GO
/****** Object:  StoredProcedure [PAD].[IssueNotes_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[IssueNotes_Upsert] (
    @IssueId int,
    @NoteId int = null,
    @UserId int,
    @Note varchar(max)
) as

declare @now datetime = getdate()

if not exists (select * from PAD.IssueNotes where NoteId = @NoteId)
begin
    insert into PAD.IssueNotes (IssueId, NoteBy, NoteOn, Note, Active)
    values (@IssueId, @UserId, @now, @Note, 1)
    select @NoteId = SCOPE_IDENTITY()
    return @NoteId
end

else 

begin
    update PAD.IssueNotes set
        Active = 0
    where
        NoteId = @NoteId
end
GO
/****** Object:  StoredProcedure [PAD].[Issues_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Issues_List] (
    @IssueId int = null,
    @CheckId int = null,
    @Resolved bit = null,
    @PadId int = null,
    @DefibId int = null,
    @CabinetId int = null
) as

select distinct
	i.IssueId, 
	i.PadId, 
	PadSite = p.Location,
    a.AnswerId,
    a.CheckId,
    q.Question,
	i.DefibId, 
    i.Image,
	Defib = d.Name,
	i.CabinetId, 
	Cabinet = c.Name,
	i.Severity, 
	i.Description, 
	ReportedBy = u.FullName, 
	i.ReportedOn,
	i.Resolved
from 
	PAD.Issues i
    left join PAD.Answers a on i.AnswerId = a.AnswerId and a.CheckId = isnull(@CheckId, a.CheckId)
    left join PAD.Questions q on a.QuestionId = q.QuestionId 
	left join PAD.PADSites p on i.PadId = p.PadId
	left join PAD.Defibrillators d on i.DefibId = d.DefibId
	left join PAD.Cabinets c on i.CabinetId = c.CabinetId
	left join core.Users u on i.ReportedBy = u.UserId
where
    i.IssueId = ISNULL(@IssueId, i.IssueId)
    and isnull(a.CheckId, 0) = ISNULL(@CheckId, isnull(a.CheckId,0))
	and isnull(i.PadId,0) = ISNULL(@PadId, isnull(i.PadId,0))
	and isnull(i.DefibId,0) = ISNULL(@DefibId, isnull(i.DefibId,0))
	and isnull(i.CabinetId,0) = ISNULL(@CabinetId, isnull(i.CabinetId,0))
    and i.Resolved = ISNULL(@Resolved, i.Resolved)

GO
/****** Object:  StoredProcedure [PAD].[Issues_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Issues_Upsert] (
    @IssueId int = null,
    @PadId int = null,
    @DefibId int = null,
    @CabinetId int = null,
    @Severity int,
    @Description varchar(max),
    @Image varchar(max),
    @UserId int,
    @Resolved bit
) as

declare @now datetime = getdate()

if @IssueId is null
begin

    insert into PAD.Issues (PadId, DefibId, CabinetId, Severity, Description, Image, ReportedBy, ReportedOn, Resolved)
    values (@PadId, @DefibId, @CabinetId, @Severity, @Description, @Image, @UserId, @now, 0)
    select @IssueId = SCOPE_IDENTITY()
    return @IssueId

end

else 

begin

    update PAD.Issues set
        Severity = @Severity,
        Description = @Description,
        Image = @Image,
        Resolved = @Resolved
    where
        IssueId = @IssueId
    
    return @IssueId

end
GO
/****** Object:  StoredProcedure [PAD].[PadSite_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[PadSite_List] (
	@PadId int = null
) as

with lastchecks as (
    select
        p.PadId,
        LastCheck = max(p.Completed)
    from
        PAD.GuardianChecks p
    group by
        p.PadId
)

select
	p.PadId,
	p.Location,
	p.Address,
	p.Description,
	c.CabinetId,
	Cabinet = c.Name,
	d.DefibId,
	Defib = d.Name,
	p.Owner,
	p.OwnerTel,
	p.OwnerEmail,
	p.InstallDate,
	p.Funding,
	p.Amount,
	Insurance = isnull(p.Insurance, 'None'),
    l.LastCheck,
    p.Map,
    p.PadsExpiry
from
	PAD.PADSites p
	join PAD.Cabinets c on p.Cabinet = c.CabinetId
	join PAD.Defibrillators d on p.Defib = d.DefibId
    left join lastchecks l on p.PadId = l.PadId
where
	p.PadId = ISNULL(@PadId, p.PadId)

GO
/****** Object:  StoredProcedure [PAD].[PadSite_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[PadSite_Upsert] (
    @PadId int = null,
    @Location varchar(50),
    @Address varchar(max) = null,
    @Description varchar(max) = null,
    @Cabinet int = null,
    @Defib int = null,
    @Owner varchar(50) = null,
    @OwnerTel varchar(12) = null,
    @OwnerEmail varchar(50) = null,
    @InstallDate date = null,
    @Funding varchar(100) = null,
    @Amount decimal(18,2) = null,
    @Insurance varchar(50) = null,
    @PadsExpiry date = null,
    @Map nvarchar(max) = null
) as

if not exists (select * from PAD.PADSites where PadId = @PadId)
begin
    insert into PAD.PADSites(Location, Address, Description, Cabinet, Defib, Owner, OwnerTel, OwnerEmail, InstallDate, Funding, Amount, Insurance, PadsExpiry, Map)
    values (@Location, @Address, @Description, @Cabinet, @Defib, @Owner, @OwnerTel, @OwnerEmail, @InstallDate, @Funding, @Amount, @Insurance, @PadsExpiry, @Map)
    select @PadId = SCOPE_IDENTITY()
    return @PadId
end

else 

begin
    update PAD.PADSites set
        Location = @Location,
        Address = @Address,
        Description = @Description,
        Cabinet = @Cabinet,
        Defib = @Defib,
        Owner = @Owner,
        OwnerTel = @OwnerTel,
        OwnerEmail = @OwnerEmail,
        InstallDate = @InstallDate,
        Funding = @Funding,
        Amount = @Amount,
        Insurance = @Insurance,
        PadsExpiry = @PadsExpiry,
        Map = @Map
    where
        PadId = @PadId
end
GO
/****** Object:  StoredProcedure [PAD].[Questions_List]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [PAD].[Questions_List] (
    @QuestionId int = null,
    @Active bit = null
) as

select
	q.QuestionId,
	q.Question,
    q.Type,
    TypeName = case q.Type
        when 'T' then 'Training'
        when 'C' then 'Cabinet'
        when 'D' then 'Defibrillator'
    end,
    q.Active,
    q.QuestionOrder
from 
	PAD.Questions q
where
    q.Active = ISNULL(@Active, q.Active)
    and q.QuestionId = ISNULL(@QuestionId, q.QuestionId)
order by
    ISNULL(q.QuestionOrder, 999 + q.QuestionId)

GO
/****** Object:  StoredProcedure [PAD].[Questions_Upsert]    Script Date: 22/08/2018 14:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [PAD].[Questions_Upsert](
    @QuestionId int = null,
    @Question varchar(1000),
    @Type char(1),
    @Active bit,
    @QuestionOrder int = null
) as

if not exists (select * from PAD.Questions where QuestionId = @QuestionId)
begin
    insert into PAD.Questions (Question, Type, Active, QuestionOrder)
    values (@Question, @Type, @Active, @QuestionOrder)
    select @QuestionId = SCOPE_IDENTITY()
    return @QuestionId
end

else 

begin
    update PAD.Questions set
        Question = @Question,
        Type = @Type,
        Active = @Active,
        QuestionOrder = @QuestionOrder
    where
        QuestionId = @QuestionId
end
GO
