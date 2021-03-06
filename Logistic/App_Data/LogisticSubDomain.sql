USE [master]
GO
/****** Object:  Database [LogisticSubDomain]    Script Date: 31-May-17 9:04:53 AM ******/
CREATE DATABASE [LogisticSubDomain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogisticSubDomain_data', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LogisticSubDomain_data.mdf' , SIZE = 3392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LogisticSubDomain_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LogisticSubDomain_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LogisticSubDomain] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogisticSubDomain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogisticSubDomain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LogisticSubDomain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogisticSubDomain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogisticSubDomain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LogisticSubDomain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogisticSubDomain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET RECOVERY FULL 
GO
ALTER DATABASE [LogisticSubDomain] SET  MULTI_USER 
GO
ALTER DATABASE [LogisticSubDomain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogisticSubDomain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogisticSubDomain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogisticSubDomain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LogisticSubDomain]
GO
/****** Object:  StoredProcedure [dbo].[checkClient]    Script Date: 31-May-17 9:04:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[checkEmpAppraisal]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[checkEmployee]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[checkPartner]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getConsingmentbyid]    Script Date: 31-May-17 9:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getConsingmentbyid]
(
@ID varchar(150)
)
as

begin
Select * from Core_Consignment left outer join Core_DeliveryPerforma on
 Core_DeliveryPerforma.ConsignementId=Core_Consignment.ConsignementID left outer join Core_states
 on Core_states.Id=Core_Consignment.ConsignerId where Core_Consignment.ConsignementID=@ID
end




GO
/****** Object:  Table [dbo].[Core_Appraisal]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Ask_for_Vehicle]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_client]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Consignment]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_DeliveryPerforma]    Script Date: 31-May-17 9:04:55 AM ******/
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
	[status] [varchar](max) NULL,
 CONSTRAINT [PK_Core_DeliveryPerforma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Core_Employee]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Employee_Appraisal]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Employee_Circle]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Employee_Dept]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Invoice]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_LoadRequest]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_login]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_NewsLetterSubscription]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_Partner]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_states]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_VehicleRequest]    Script Date: 31-May-17 9:04:55 AM ******/
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
/****** Object:  Table [dbo].[Core_VehicleType]    Script Date: 31-May-17 9:04:55 AM ******/
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
INSERT [dbo].[Core_Appraisal] ([Id], [Title], [From_date], [To_date]) VALUES (2, N'FIRST QUATER', CAST(0x0000A76500000000 AS DateTime), CAST(0x0000A78400000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Core_Appraisal] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Ask_for_Vehicle] ON 

GO
INSERT [dbo].[Core_Ask_for_Vehicle] ([Id], [RequestNo], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle]) VALUES (2, N'RQ/000001', N'pune', N'mumbai', 9, N'Covered', N'1090', N'1980', N'testinggggg', N'Pending', CAST(0x0000A76501318488 AS DateTime), 1, N'National Capital Territory of Delhi')
GO
INSERT [dbo].[Core_Ask_for_Vehicle] ([Id], [RequestNo], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle]) VALUES (1002, N'RQ/000002', N'Anmol', N'basdgh', 16, N'Covered', N'123', N'2345', N'Test', N'Pending', CAST(0x0000A771001049BA AS DateTime), 1, N'Haryana')
GO
INSERT [dbo].[Core_Ask_for_Vehicle] ([Id], [RequestNo], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle]) VALUES (2002, N'RQ/000003', N'delhi', N'munbai', 6, N'Covered', N'1000', N'2000', N'yets', N'Pending', CAST(0x0000A77A00A91B41 AS DateTime), 1, N'National Capital Territory of Delhi')
GO
SET IDENTITY_INSERT [dbo].[Core_Ask_for_Vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_client] ON 

GO
INSERT [dbo].[Core_client] ([Id], [ClientName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [UserId]) VALUES (1, N'Client1', N'9988776655', N'Client1@gmail.com', N'Delhi', N'Delhi', N'Delhi', N'123', N'Active', N'Cli001')
GO
SET IDENTITY_INSERT [dbo].[Core_client] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Consignment] ON 

GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (3, N'CL/000001', N'06/09/2017', N'123', 2, N'delhi', N'9911106594', N'1234567', N'delhi1', N'9911106594', N'1234', N'wooden', N'teat', N'', N'', N'', N'9911106594', N'05/29/2017', N'06/08/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'9911106594', N'9911106594', N'09911106594', N'09911106594', N'Delivered', N'National Capital Territory of Delhi', N'7878', 19, N'7.5Ton', N'123', N'234', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (5, N'CL/000002', N'05/25/2017', N'45', 3, N'ssss', N'9911106594', N'121212', N'de', N'9911106594', N'9911106594', N'9911106594', N'', N'9911106594', N'9911106594', N'9911106594', N'9911106594', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9911106594', N'9911106594', N'9911106594', N'09911106594', N'09911106594', N'Delivered', N'National Capital Territory of Delhi', N'232', 0, N'9Ton', N'', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (6, N'CL/000003', N'05/07/2017', N'857263', 1, N'NewDelhi', N'9911106594', N'0292', N'NewDelhi', N'9911106594', N'983474', N'73464', N'ksjdu', N'', N'', N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'', N'', N'', N'', N'', N'Pending', N'National Capital Territory of Delhi', N'1029', 9, N'10Kg to 50Kg', N'', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (7, N'CL/000004', N'05/01/2017', N'', 3, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'', N'', N'', N'', N'', N'Pending', N'National Capital Territory of Delhi', N'', 18, N'Less than 250 Grams', N'', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (8, N'CL/000005', N'05/11/2017', N'12345690', 3, N'dddd', N'7840070002', N'manish', N'del', N'9911106594', N'233', N'wooden', N'test', N'', N'', N'', N'', N'05/12/2017', N'05/25/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'7840070002', N'', N'', N'', N'', N'Pending', N'National Capital Territory of Delhi', N'12345678', 18, N'4Ton', N'3457', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (1012, N'CL/000006', N'05/02/2017', N'011824', 3, N'NewDelhi', N'9911106594', N'Manish', N'NewDelhi', N'9911106594', N'1922', N'0293', N'ccdxvxc', N'7364', N'7473', N'9278', N'834', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9910753655', N'9693747689', N'9910753655', N'9693747689', N'', N'Pending', N'Lakshadweep', N'', 4, N'5Ton', N'', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (2008, N'CL/000007', N'05/17/2017', N'112', 3, N'delhi', N'9911106594', N'121212', N'A-1, Carriapa Marg, Gate No 2,Sainik Farms', N'9911106594', N'12', N'wooden', N'test', N'100', N'', N'', N'', N'05/15/2017', N'05/29/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'9871425202', N'', N'', N'', N'', N'Delivered', N'National Capital Territory of Delhi', N'', 5, N'6.5Ton', N'323', N'', N'', N'')
GO
INSERT [dbo].[Core_Consignment] ([Id], [ConsignementID], [Date], [SRNNo], [ConsignerId], [Address1], [Contact1], [ConsigneeName], [Address2], [Contact2], [LR], [MaterialType], [Remark], [WayBill1], [WayBill2], [WayBill3], [WayBill4], [DateofLoading], [DateofDeliver], [FreightAmount], [AdvanceFreight], [Loading], [Unloading], [Others], [ExtraAmount], [TotalAmount], [ContactNo1], [ContactNo2], [ContactNo3], [ContactNo4], [ContactNo5], [Status], [Circle], [VehicleNo], [VehicleTypeId], [Weight], [MINno], [OGPno], [Blank1], [Blank2]) VALUES (2009, N'CL/000008', N'05/16/2017', N'1213', 3, N'sss', N'9911106594', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'05/30/2017', N'05/30/2017', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'', N'', N'', N'', N'', N'Pending', N'National Capital Territory of Delhi', N'', 17, N'250 to 500 Grams', N'', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Core_Consignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_DeliveryPerforma] ON 

GO
INSERT [dbo].[Core_DeliveryPerforma] ([Id], [ConsignementId], [date], [Consigner_Name], [address], [Consignee_Name_Id], [contactNo1], [Delivery_Time], [Receivers_Name], [ContactNo2], [Delivery_Remark], [Any_Extra_Amount], [status]) VALUES (1, N'CL/000002', N'05/25/2017', N'Manish', N'ssss', N'121212', N'9911105694', N'12:45 AM', N'brajesh', N'9911105694', N'', CAST(0.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[Core_DeliveryPerforma] ([Id], [ConsignementId], [date], [Consigner_Name], [address], [Consignee_Name_Id], [contactNo1], [Delivery_Time], [Receivers_Name], [ContactNo2], [Delivery_Remark], [Any_Extra_Amount], [status]) VALUES (2, N'CL/000001', N'06/09/2017', N'test', N'abc', N'1234567', N'9911106594', N'10:00 AM', N'dfhk', N'9911106594', N'dgnm', CAST(0.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[Core_DeliveryPerforma] ([Id], [ConsignementId], [date], [Consigner_Name], [address], [Consignee_Name_Id], [contactNo1], [Delivery_Time], [Receivers_Name], [ContactNo2], [Delivery_Remark], [Any_Extra_Amount], [status]) VALUES (1002, N'CL/000007', N'05/17/2017', N'Manish', N'delhi', N'121212', N'9871425202', N'10:30 AM', N'manish', N'9871425202', N'tets', CAST(0.00 AS Decimal(18, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Core_DeliveryPerforma] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee] ON 

GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (1, N'Manish sharma', N'9911106594', N'manish@webx24.com', N'delhi', N'Delhi', N'delhi', N'9911106594', N'Active', N'Executive ', N'11', N'manish123', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (2, N'maher', N'9911106592', N'maher@gmail.com', N'delhi', N'Delhi', N'abc', N'9911106594', N'Active', N'Manager', N'10', N'maher123', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (3, N'Employee', N'9234567891', N'Employee@gmail.com', N'delhi', N'delhi', N'delhi', N'123', N'Active', N'Executive ', N'11', N'emp001', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
INSERT [dbo].[Core_Employee] ([Id], [EmployeeName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Designation], [levels], [UserId], [Load_request_role], [Vehicle_request_role], [ask_for_vehicle_role], [Consignement_role], [Bill_role], [Delivery_Performa_role]) VALUES (4, N'Manager', N'9334567890', N'Manager@gmail.com', N'delhi', N'delhi', N'delhi', N'123', N'Active', N'Manager', N'10', N'mag001', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes', N'Yes')
GO
SET IDENTITY_INSERT [dbo].[Core_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Circle] ON 

GO
INSERT [dbo].[Core_Employee_Circle] ([Id], [CircleName], [EmployeeId]) VALUES (1, N'National Capital Territory of Delhi', 1)
GO
SET IDENTITY_INSERT [dbo].[Core_Employee_Circle] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_LoadRequest] ON 

GO
INSERT [dbo].[Core_LoadRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [ClientId], [Circle], [postBy], [Name], [Mobile]) VALUES (1, N'delhi', N'mumbai', 4, N'Covered', N'4Ton', N'10000', N'test', N'Pending', CAST(0x0000A777011158E8 AS DateTime), 0, N'National Capital Territory of Delhi', N'Web Site', N'mak', N'9871425202')
GO
INSERT [dbo].[Core_LoadRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [ClientId], [Circle], [postBy], [Name], [Mobile]) VALUES (2, N'mumabi', N'delhi', 6, N'Open', N'500 to 999 Grams', N'klqs', N'tets', N'Pending', CAST(0x0000A77A00A8BA47 AS DateTime), 0, N'National Capital Territory of Delhi', N'Web Site', N'manish', N'7827264746')
GO
SET IDENTITY_INSERT [dbo].[Core_LoadRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_login] ON 

GO
INSERT [dbo].[Core_login] ([id], [email], [password], [role]) VALUES (1, N'admin', N'admin@123', N'1')
GO
SET IDENTITY_INSERT [dbo].[Core_login] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_NewsLetterSubscription] ON 

GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (1, N'brajeshkr18@gmail.com', 1)
GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (3, N'brajeshkr18@gmail.com', 1)
GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (4, N'anmchaudhary@gmail.com', 1)
GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (6, N'manish@webx24.com', 1)
GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (1022, N'manish@webx24.com', 1)
GO
INSERT [dbo].[Core_NewsLetterSubscription] ([Id], [Email], [IsActive]) VALUES (1023, N'manishsharma520@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Core_NewsLetterSubscription] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_Partner] ON 

GO
INSERT [dbo].[Core_Partner] ([Id], [PartnerName], [Mobile], [Email], [City], [State], [Address], [Password], [role], [Core_client], [UserId]) VALUES (1, N'Partner', N'9977886655', N'Partner@gmail.com', N'Delhi', N'Delhi', N'Delhi', N'123', N'Active', NULL, N'par001')
GO
SET IDENTITY_INSERT [dbo].[Core_Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_states] ON 

GO
INSERT [dbo].[Core_states] ([Id], [stateName]) VALUES (1, N'brajesh')
GO
INSERT [dbo].[Core_states] ([Id], [stateName]) VALUES (2, N'test')
GO
INSERT [dbo].[Core_states] ([Id], [stateName]) VALUES (3, N'Manish')
GO
SET IDENTITY_INSERT [dbo].[Core_states] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleRequest] ON 

GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (1, N'hsdjds,', N'sdksdnhks,', 19, N'Covered', N'Less than 250 Grams', N'213', N'sdfs', N'Pending', CAST(0x0000A76C013A1782 AS DateTime), 0, N'Assam', N'Web Site', N'maNA', N'9911106594')
GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (2, N'delhi', N'mumbai', 19, N'Covered', N'500 to 999 Grams', N'234567', N'fghjk', N'Pending', CAST(0x0000A77301763213 AS DateTime), 0, N'National Capital Territory of Delhi', N'Web Site', N'manish', N'9911106594')
GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (1002, N'mumabi', N'delhi', 2, N'Covered', N'6.5Ton', N'1000', N'testing', N'Pending', NULL, 0, N'National Capital Territory of Delhi', N'Web Site', N'manish', N'9911106594')
GO
INSERT [dbo].[Core_VehicleRequest] ([Id], [FromState], [ToState], [VehicleTypeId], [Tops], [Weight], [Freight], [Comments], [status], [date], [PartnerId], [Circle], [postBy], [Name], [Mobile]) VALUES (1003, N'mumabi', N'delhi', 6, N'Covered', N'6.5Ton', N'1234567', N'tets', N'Pending', CAST(0x0000A77A00A89A1F AS DateTime), 0, N'National Capital Territory of Delhi', N'Web Site', N'mm', N'9911106594')
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleType] ON 

GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (1, N'3 Wheeler')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (2, N'Ace')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (3, N'Tata 407')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (4, N'Pick Up')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (5, N'Canter 14 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (6, N'Canter 17 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (7, N'Canter 19 Feet')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (8, N'Truck - 6 Wheeler - 9 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (9, N'Truck - 10 Wheeler - 16 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (10, N'Truck - 12 Wheeler - 21 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (11, N'Truck - 14 Wheeler - 24 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (12, N'Trailer 20 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (13, N'Trailer 22 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (14, N'Trailer 24 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (15, N'Trailer 27 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (16, N'Trailer 40 Tons')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (17, N'Container 20 Feet - Single Axle')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (18, N'Container 32 Feet - Single Axle')
GO
INSERT [dbo].[Core_VehicleType] ([Id], [Type]) VALUES (19, N'Container 32 Feet - Multi Axle')
GO
SET IDENTITY_INSERT [dbo].[Core_VehicleType] OFF
GO
ALTER TABLE [dbo].[Core_Ask_for_Vehicle] ADD  CONSTRAINT [DF_Core_Ask_for_Vehicle_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_Employee_Appraisal] ADD  CONSTRAINT [DF_Core_Employee_Appraisal_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Core_Invoice] ADD  CONSTRAINT [DF_Core_Invoice_Invoice_date]  DEFAULT (getdate()) FOR [Invoice_date]
GO
ALTER TABLE [dbo].[Core_LoadRequest] ADD  CONSTRAINT [DF_Core_LoadRequest_date]  DEFAULT (getdate()) FOR [date]
GO
USE [master]
GO
ALTER DATABASE [LogisticSubDomain] SET  READ_WRITE 
GO
