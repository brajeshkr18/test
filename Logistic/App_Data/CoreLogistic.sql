USE [master]
GO
/****** Object:  Database [CoreLogistic]    Script Date: 31-May-17 9:08:31 AM ******/
CREATE DATABASE [CoreLogistic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoreLogistic_data', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CoreLogistic_data.mdf' , SIZE = 3392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CoreLogistic_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CoreLogistic_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CoreLogistic] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoreLogistic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoreLogistic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoreLogistic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoreLogistic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoreLogistic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoreLogistic] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoreLogistic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoreLogistic] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CoreLogistic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoreLogistic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoreLogistic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoreLogistic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoreLogistic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoreLogistic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoreLogistic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoreLogistic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoreLogistic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoreLogistic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoreLogistic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoreLogistic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoreLogistic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoreLogistic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoreLogistic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoreLogistic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoreLogistic] SET RECOVERY FULL 
GO
ALTER DATABASE [CoreLogistic] SET  MULTI_USER 
GO
ALTER DATABASE [CoreLogistic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoreLogistic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoreLogistic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoreLogistic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CoreLogistic]
GO
/****** Object:  StoredProcedure [dbo].[checkClient]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkClient]
(
@Mobile varchar(50),
@Email varchar(50)
)
as
declare @check int
set @check =(select COUNT (*) from Core_client where Mobile=@Mobile or Email=@Email)
if @check = 0
begin
return 1
end
else
begin
return 0
end

GO
/****** Object:  StoredProcedure [dbo].[checkEmpAppraisal]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkEmpAppraisal]
(
@EmployeeId int,
@ManagerId int,
@From datetime,
@To datetime
)
as
declare @check int
set @check =(select COUNT (*) from 
Core_Employee_Appraisal where EmployeeId=@EmployeeId 
and ManagerId=@ManagerId and date  between @From and 
@To)
if @check = 0
begin
return 1
end
else
begin
return 0
end
GO
/****** Object:  StoredProcedure [dbo].[checkEmployee]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[checkEmployee]
(
@Mobile varchar(50),
@Email varchar(50)
)
as
declare @check int
set @check =(select COUNT (*) from Core_Employee where  Mobile=@Mobile or Email=@Email)
if @check = 0
begin
return 1
end
else
begin
return 0
end



GO
/****** Object:  StoredProcedure [dbo].[checkPartner]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[checkPartner]
(
@Mobile varchar(50),
@Email varchar(50)
)
as
declare @check int
set @check =(select COUNT (*) from Core_Partner where  Mobile=@Mobile or Email=@Email)
if @check = 0
begin
return 1
end
else
begin
return 0
end



GO
/****** Object:  Table [dbo].[Core_Appraisal]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Appraisal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NULL,
	[From_date] [datetime] NULL,
	[To_date] [datetime] NULL,
 CONSTRAINT [PK_Core_Appraisal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Ask_for_Vehicle]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Ask_for_Vehicle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestNo] [varchar](50) NULL,
	[FromState] [varchar](50) NULL,
	[ToState] [varchar](50) NULL,
	[VehicleTypeId] [int] NULL,
	[Tops] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Freight] [varchar](50) NULL,
	[Comments] [varchar](max) NULL,
	[status] [varchar](50) NULL,
	[date] [datetime] NULL,
	[PartnerId] [int] NULL,
	[Circle] [varchar](100) NULL,
 CONSTRAINT [PK_Core_Ask_for_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_client]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Password] [varchar](50) NULL,
	[role] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
 CONSTRAINT [PK_Core_client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Consignment]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Consignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConsignementID] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[SRNNo] [varchar](50) NULL,
	[ConsignerId] [int] NULL,
	[Address1] [varchar](max) NULL,
	[Contact1] [varchar](50) NULL,
	[ConsigneeName] [varchar](50) NULL,
	[Address2] [varchar](max) NULL,
	[Contact2] [varchar](50) NULL,
	[LR] [varchar](50) NULL,
	[MaterialType] [varchar](50) NULL,
	[Remark] [varchar](max) NULL,
	[WayBill1] [varchar](50) NULL,
	[WayBill2] [varchar](50) NULL,
	[WayBill3] [varchar](50) NULL,
	[WayBill4] [varchar](50) NULL,
	[DateofLoading] [varchar](50) NULL,
	[DateofDeliver] [varchar](50) NULL,
	[FreightAmount] [decimal](18, 2) NULL,
	[AdvanceFreight] [decimal](18, 2) NULL,
	[Loading] [decimal](18, 2) NULL,
	[Unloading] [decimal](18, 2) NULL,
	[Others] [decimal](18, 2) NULL,
	[ExtraAmount] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[ContactNo1] [varchar](50) NULL,
	[ContactNo2] [varchar](50) NULL,
	[ContactNo3] [varchar](50) NULL,
	[ContactNo4] [varchar](50) NULL,
	[ContactNo5] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Circle] [varchar](100) NULL,
	[VehicleNo] [varchar](50) NULL,
	[VehicleTypeId] [int] NULL,
	[Weight] [varchar](50) NULL,
	[MINno] [varchar](50) NULL,
	[OGPno] [varchar](50) NULL,
	[Blank1] [varchar](max) NULL,
	[Blank2] [varchar](max) NULL,
 CONSTRAINT [PK_Core_Consignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_DeliveryPerforma]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_DeliveryPerforma](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConsignementId] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[Consigner_Name] [varchar](50) NULL,
	[address] [varchar](max) NULL,
	[Consignee_Name_Id] [varchar](50) NULL,
	[contactNo1] [varchar](50) NULL,
	[Delivery_Time] [varchar](50) NULL,
	[Receivers_Name] [varchar](50) NULL,
	[ContactNo2] [varchar](50) NULL,
	[Delivery_Remark] [varchar](max) NULL,
	[Any_Extra_Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Core_DeliveryPerforma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Employee]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Password] [varchar](50) NULL,
	[role] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[levels] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[Load_request_role] [varchar](50) NULL,
	[Vehicle_request_role] [varchar](50) NULL,
	[ask_for_vehicle_role] [varchar](50) NULL,
	[Consignement_role] [varchar](50) NULL,
	[Bill_role] [varchar](50) NULL,
	[Delivery_Performa_role] [varchar](50) NULL,
 CONSTRAINT [PK_Core_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Employee_Appraisal]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Employee_Appraisal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating1] [nchar](10) NULL,
	[Remark1] [varchar](max) NULL,
	[Rating2] [nchar](10) NULL,
	[Remark2] [varchar](max) NULL,
	[Rating3] [nchar](10) NULL,
	[Remark3] [varchar](max) NULL,
	[Rating4] [nchar](10) NULL,
	[Remark4] [varchar](max) NULL,
	[Rating5] [nchar](10) NULL,
	[Remark5] [varchar](max) NULL,
	[EmployeeId] [int] NULL,
	[date] [datetime] NULL,
	[ManagerId] [int] NULL,
	[type] [varchar](50) NULL,
	[Other] [varchar](max) NULL,
	[File_path] [varchar](max) NULL,
	[AppraisalId] [int] NULL,
 CONSTRAINT [PK_Core_Employee_Appraisal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Employee_Circle]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Employee_Circle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CircleName] [varchar](100) NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Core_Employee_Circle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Employee_Dept]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Employee_Dept](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Departement] [varchar](100) NULL,
	[SubDivision] [varchar](100) NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Core_Employee_Dept] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Invoice]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_date] [datetime] NULL,
	[SRNNo] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[ConsignerId] [int] NULL,
	[InvoicePeriod] [varchar](50) NULL,
	[InvoiceAmount] [decimal](18, 2) NULL,
	[Status] [varchar](50) NULL,
	[PartnerId] [int] NULL,
	[DateOfReview] [varchar](50) NULL,
	[RejectionRemark] [varchar](max) NULL,
 CONSTRAINT [PK_Core_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_LoadRequest]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_LoadRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromState] [varchar](50) NULL,
	[ToState] [varchar](50) NULL,
	[VehicleTypeId] [int] NULL,
	[Tops] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Freight] [varchar](50) NULL,
	[Comments] [varchar](max) NULL,
	[status] [varchar](50) NULL,
	[date] [datetime] NULL,
	[ClientId] [int] NULL,
	[Circle] [varchar](100) NULL,
	[postBy] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
 CONSTRAINT [PK_Core_LoadRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_login]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Core_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_NewsLetterSubscription]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_NewsLetterSubscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Core_NewsLetterSubscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Partner]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Core_Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Password] [varchar](50) NULL,
	[role] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[Core_Partner] ADD [Core_client] [varchar](50) NULL
ALTER TABLE [dbo].[Core_Partner] ADD [UserId] [varchar](50) NULL
 CONSTRAINT [PK_Core_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_states]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_states](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](50) NULL,
 CONSTRAINT [PK_Core_states] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_VehicleRequest]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Core_VehicleRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromState] [varchar](50) NULL,
	[ToState] [varchar](50) NULL,
	[VehicleTypeId] [int] NULL,
	[Tops] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Freight] [varchar](50) NULL,
	[Comments] [varchar](max) NULL,
	[status] [varchar](50) NULL,
	[date] [datetime] NULL,
	[PartnerId] [int] NULL,
	[Circle] [varchar](100) NULL,
	[postBy] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
 CONSTRAINT [PK_Core_VehicleRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_VehicleType]    Script Date: 31-May-17 9:08:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Core_VehicleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Core_VehicleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Appraisal] ON 

GO
INSERT [dbo].[Core_Appraisal] ([Id], [Title], [From_date], [To_date]) VALUES (1010, N'first quater', CAST(0x0000A74800000000 AS DateTime), CAST(0x0000A76600000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Core_Appraisal] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_client] ON 

GO
INSERT [dbo].[Core_client] ([Id], [ClientName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [UserId]) VALUES (8, N'Client1', N'9988776655', N'Client1@gmail.com', N'Delhi', N'Delhi', N'Delhi', N'123', N'Active', N'Cli001')
GO
SET IDENTITY_INSERT [dbo].[Core_client] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Consignment] ON 

GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (9, N'CL/000001', N'04/06/2017', N'12345', 1008, N'asdf', N'9911106594', N'1234', N'vbn', N'9911106594', N'12345', N'sdfgh', N'werh', N'23456', N'34567', N'34567', N'', N'04/21/2017', N'04/27/2017', CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'', N'', N'', N'', N'Pending', N'National Capital Territory of Delhi', N'12345', 1016, N'6.5Ton', N'123', N'123', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1003, N'CL/000002', N'04/27/2017', N'1234567890', 2008, N'qwertyuiop', N'9871425202', N'123456678', N'sdfgkl', N'9911106594', N'9911106594', N'9911106594', N'test', N'9911106594', N'9911106594', N'9911106594', N'9911106594', N'05/02/2017', N'05/04/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'09911106594', N'09911106594', N'09911106594', N'09911106594', N'Pending', N'National Capital Territory of Delhi', N'12345', 1020, N'7.5Ton', N'12345', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1004, N'CL/000003', N'04/01/2017', N'12345', 2008, N'qwertyu', N'9871425202', N'asdfghj', N'asdfgh', N'9871425202', N'456', N'3456', N'34tyui', N'', N'', N'', N'', N'04/29/2017', N'04/30/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9871425202', N'9871425202', N'9871425202', N'9871425202', N'', N'Pending', N'National Capital Territory of Delhi', N'12345', 1005, N'4Ton', N'234', N'12345', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1005, N'CL/000004', N'05/06/2017', N'1234567890', 2008, N'delhi', N'9911106594', N'1233334', N'asdfghjk', N'9911106594', N'223456789', N'asdfghjk', N'qwertyui', N'12345', N'1234', N'1234', N'1234', N'05/04/2017', N'05/06/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'09911106594', N'09911106594', N'09911106594', N'09911106594', N'Pending', N'National Capital Territory of Delhi', N'123', 1004, N'2.5Ton', N'23456', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1006, N'CL/000005', N'04/06/2017', N'1234', 1008, N'Any Address', N'9693747689', N'101', N'Gaziabad', N'9693747689', N'23432', N'0012', N'9876', N'23223', N'2323', N'657', N'', N'04/01/2017', N'04/27/2017', CAST(123.00 AS Decimal(18, 2)), CAST(876.00 AS Decimal(18, 2)), CAST(32.00 AS Decimal(18, 2)), CAST(32.00 AS Decimal(18, 2)), CAST(330.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(2734.00 AS Decimal(18, 2)), N'9911106594', N'9693747689', N'', N'', N'', N'Pending', N'Madhya Pradesh', N'', 1017, N'100Kg to 500Kg', N'naus', N'2232', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1007, N'CL/000006', N'04/12/2017', N'23456', 2008, N'sdfgm', N'9911106594', N'2345', N'sdfghj', N'9911106594', N'9911106594', N'9911106594', N'', N'9911106594', N'9911106594', N'9911106594', N'9911106594', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'09911106594', N'09911106594', N'09911106594', N'09911106594', N'Pending', N'National Capital Territory of Delhi', N'2345', 1008, N'5Ton', N'', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Core_Consignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_DeliveryPerforma] ON 

GO
INSERT [dbo].[Core_DeliveryPerforma] ([Id], [ConsignementId], [date], [Consigner_Name], [address], [Consignee_Name_Id], [contactNo1], [Delivery_Time], [Receivers_Name], [ContactNo2], [Delivery_Remark], [Any_Extra_Amount]) VALUES (1, N'CL/000001', N'', N'', N'asdf', N'1234', N'', N'1:15 PM', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Core_DeliveryPerforma] ([Id], [ConsignementId], [date], [Consigner_Name], [address], [Consignee_Name_Id], [contactNo1], [Delivery_Time], [Receivers_Name], [ContactNo2], [Delivery_Remark], [Any_Extra_Amount]) VALUES (2, N'1', N'', N'', N'', N'', N'', N'1:00 AM', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Core_DeliveryPerforma] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee] ON 

GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1034, N'Manish sharma', N'9911106594', N'manish@webx24.com', N'delhi', N'Delhi', N'delhi', N'9911106594', N'Active', N'Executive ', N'11', N'manish123', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1035, N'maher', N'9911106592', N'maher@gmail.com', N'delhi', N'Delhi', N'abc', N'9911106594', N'Active', N'Manager', N'10', N'maher123', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1036, N'Employee', N'9234567891', N'Employee@gmail.com', N'delhi', N'delhi', N'delhi', N'123', N'Active', N'Executive ', N'11', N'emp001', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1037, N'Manager', N'9334567890', N'Manager@gmail.com', N'delhi', N'delhi', N'delhi', N'123', N'Active', N'Manager', N'10', N'mag001', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1038, N'Dhirendra Sharma', N'9815372294', N'dhirendersharma18@gmail.com', N'Chandigarh', N'Chandigarh', N'', N'9815372294', N'Active', N'Sr. Executive', N'1', N'CLPL/ 2105', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1039, N'Naveen kumar gautam', N'7309999973', N'naveen.gautam28@gmail.com', N'Lucknow', N'Uttar Pradesh', N'', N'7309999973', N'Active', N'Executive ', N'1', N'CLPL/ 2121', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1040, N'Suman Bharti', N'8699565871', N'aman.sharma@corelogistic.com', N'Mohali', N'Punjab', N'', N'8699565871', N'Active', N'Executive ', N'1', N'CLPL/ 2323', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1041, N'WAGHMODE SOPAN BALU', N'9552927766', N'sopanwaghmode@gmail.com', N'Pune', N'Maharashtra', N'', N'9552927766', N'Active', N'Manager', N'1', N'CLPL/ 690', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1042, N'Aadil Raza', N'9829088001', N'aadil@corelogistic.com', N'Jaipur', N'Rajasthan', N'', N'9829088001', N'Active', N'CEO', N'1', N'CLPL/006', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1043, N'BHUPENDER SINGH', N'9784591333', N'bhupender@corelogistic.com', N'Jaipur', N'Rajasthan', N'', N'9784591333', N'Active', N'SR. Manager', N'1', N'CLPL/017', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1044, N'Rizwan Ali', N'9784035333', N'rizwanalisabri@gmail.com', N'Jaipur', N'Rajasthan', N'', N'9784035333', N'Active', N'Executive ', N'1', N'CLPL/018', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1045, N'Saurabh Pant', N'8980011401', N'saurabh72.pant@gmail.com', N'Gujrat', N'Ahmedabad', N'', N'8980011401', N'Active', N'SR. Manager', N'1', N'CLPL/030', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1046, N'VINOD KUMAR', N'9878116722', N'verma.vinod22@gmail.com', N'Chandigarh', N'Chandigarh', N'', N'9878116722', N'Active', N'Manager', N'1', N'CLPL/039', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1047, N'Gaurav Parasar', N'9872838822', N'hr@corelogistic.com', N'Chandigarh', N'Chandigarh', N'', N'9872838822', N'Active', N'SR. Manager', N'1', N'CLPL/050', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
SET IDENTITY_INSERT [dbo].[Core_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Appraisal] ON 

GO
INSERT [dbo].[Core_Employee_Appraisal] ([Id], [Rating1], [Remark1], [Rating2], [Remark2], [Rating3], [Remark3], [Rating4], [Remark4], [Rating5], [Remark5], [EmployeeId], [date], [ManagerId], [type], [Other], [File_path], [AppraisalId]) VALUES (24, N'4         ', N'hi', N'5         ', N'hi', N'5         ', N'ghjk', N'5         ', N'fghjn', N'5         ', N'fghjk', 1034, CAST(0x0000A76301267D8C AS DateTime), 0, N'Executive ', N'', N'~/Files/na.pdf', 1010)
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Appraisal] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Circle] ON 

GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1224, N'National Capital Territory of Delhi', 1034)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1225, N'National Capital Territory of Delhi', 1035)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1226, N'National Capital Territory of Delhi', 1036)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1227, N'National Capital Territory of Delhi', 1037)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1228, N'Chandigarh', 1038)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1229, N'Uttar Pradesh', 1039)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1230, N'Maharashtra', 1041)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1231, N'', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1232, N'Andaman and Nicobar Islands', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1233, N'Andhra Pradesh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1234, N'Arunachal Pradesh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1235, N'Assam', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1236, N'Bihar', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1237, N'Chandigarh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1238, N'Chhattisgarh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1239, N'Dadra and Nagar Haveli', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1240, N'Daman and Diu', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1241, N'National Capital Territory of Delhi', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1242, N'Goa', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1243, N'Gujarat', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1244, N'Haryana', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1245, N'Himachal Pradesh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1246, N'Jammu and Kashmir', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1247, N'Jharkhand', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1248, N'Karnataka', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1249, N'Kerala', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1250, N'Lakshadweep', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1251, N'Madhya Pradesh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1252, N'Maharashtra', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1253, N'Manipur', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1254, N'Meghalaya', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1255, N'Mizoram', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1256, N'Nagaland', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1257, N'Odisha', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1258, N'Puducherry', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1259, N'Punjab', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1260, N'Rajasthan', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1261, N'Sikkim', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1262, N'Tamil Nadu', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1263, N'Telangana', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1264, N'Tripura', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1265, N'Uttar Pradesh', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1266, N'Uttarakhand', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1267, N'West Bengal', 1042)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1268, N'Rajasthan', 1043)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1269, N'Rajasthan', 1044)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1270, N'Gujarat', 1045)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1271, N'Chandigarh', 1046)
GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1272, N'Chandigarh', 1047)
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Circle] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Dept] ON 

GO
INSERT [dbo].[Core_Employee_Dept] ([Id], [Departement], [SubDivision], [EmployeeId]) VALUES (6, N'Warehouse Operation - Capex', N'Over All Operations', 1034)
GO
INSERT [dbo].[Core_Employee_Dept] ([Id], [Departement], [SubDivision], [EmployeeId]) VALUES (7, N'Warehouse Operation - Capex', N'Over All Operations', 1035)
GO
INSERT [dbo].[Core_Employee_Dept] ([Id], [Departement], [SubDivision], [EmployeeId]) VALUES (8, N'Warehouse Operation - Capex', N'Over All Operations', 1036)
GO
INSERT [dbo].[Core_Employee_Dept] ([Id], [Departement], [SubDivision], [EmployeeId]) VALUES (9, N'Warehouse Operation - Capex', N'Over All Operations', 1037)
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Dept] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_LoadRequest] ON 

GO
INSERT [dbo].[Core_LoadRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [ClientId], [Circle], [postBy], [Name], [Mobile]) VALUES (2, N'Delhi', N'Mumbai', 1020, N'Covered', N'6.5Ton', N'1000', N'100 books to mumbai', N'Dead', CAST(0x0000A75401001E11 AS DateTime), 8, N'National Capital Territory of Delhi', N'Web Site', N'manish', N'9911106594')
GO
SET IDENTITY_INSERT [dbo].[Core_LoadRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_login] ON 

GO
INSERT [dbo].[Core_login] ([id], [email], [password], [role]) VALUES (1, N'admin', N'admin@123', N'1')
GO
SET IDENTITY_INSERT [dbo].[Core_login] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Partner] ON 

GO
INSERT [dbo].[Core_Partner] ([Id], [PartnerName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Core_client], [UserId]) VALUES (7, N'Partner', N'9977886655', N'Partner@gmail.com', N'Delhi', N'Delhi', N'Delhi', N'123', N'Active', NULL, N'par001')
GO
SET IDENTITY_INSERT [dbo].[Core_Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_states] ON 

GO
INSERT [dbo].[Core_states] ([Id], [stateName]) VALUES (1008, N'SHIVAM')
GO
INSERT [dbo].[Core_states] ([Id], [stateName]) VALUES (2008, N'vodafone')
GO
SET IDENTITY_INSERT [dbo].[Core_states] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleRequest] ON 

GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (2, N'manish', N'manish', 1006, N'Open', N'2Ton', N'', N'asas', N'Pending', CAST(0x0000A764013FF1A4 AS DateTime), 0, N'National Capital Territory of Delhi', N'Web Site', N'ass', N'9911106594')
GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (3, N'shimla', N'chandigarh', 1010, N'Covered', N'2Ton', N'1000', N'hi', N'Pending', CAST(0x0000A764013FF1A4 AS DateTime), 0, N'Himachal Pradesh', N'Web Site', N'dev', N'7831905500')
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleType] ON 

GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1002, N'3 Wheeler')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1003, N'Ace')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1004, N'Tata 407')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1005, N'Pick Up')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1006, N'Canter 14 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1007, N'Canter 17 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1008, N'Canter 19 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1009, N'Truck - 6 Wheeler - 9 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1010, N'Truck - 10 Wheeler - 16 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1011, N'Truck - 12 Wheeler - 21 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1012, N'Truck - 14 Wheeler - 24 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1013, N'Trailer 20 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1014, N'Trailer 22 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1015, N'Trailer 24 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1016, N'Trailer 27 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1017, N'Trailer 40 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1018, N'Container 20 Feet - Single Axle')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1019, N'Container 32 Feet - Single Axle')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1020, N'Container 32 Feet - Multi Axle')
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleType] OFF
GO
ALTER TABLE [dbo].[Core_Ask_for_Vehicle] ADD  CONSTRAINT [DF_Core_Ask_for_Vehicle_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_Consignment] ADD  CONSTRAINT [DF_Core_Consignment_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Core_DeliveryPerforma] ADD  CONSTRAINT [DF_Core_DeliveryPerforma_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_Employee_Appraisal] ADD  CONSTRAINT [DF_Core_Employee_Appraisal_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_Invoice] ADD  CONSTRAINT [DF_Core_Invoice_Invoice_date]  DEFAULT (getdate()) FOR [Invoice_date]
GO
ALTER TABLE [dbo].[Core_Invoice] ADD  CONSTRAINT [DF_Core_Invoice_DateOfReview]  DEFAULT (getdate()) FOR [DateOfReview]
GO
ALTER TABLE [dbo].[Core_LoadRequest] ADD  CONSTRAINT [DF_Core_LoadRequest_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_VehicleRequest] ADD  CONSTRAINT [DF_Core_VehicleRequest_date]  DEFAULT (getdate()) FOR [date]
GO
USE [master]
GO
ALTER DATABASE [CoreLogistic] SET  READ_WRITE 
GO
