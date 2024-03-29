/****** Object:  Database [CustoFarm]    Script Date: 10/31/2021 10:34:21 PM ******/
CREATE DATABASE [CustoFarm]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [CustoFarm] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [CustoFarm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustoFarm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustoFarm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustoFarm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustoFarm] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustoFarm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustoFarm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustoFarm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustoFarm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustoFarm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustoFarm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustoFarm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustoFarm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustoFarm] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CustoFarm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustoFarm] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CustoFarm] SET  MULTI_USER 
GO
ALTER DATABASE [CustoFarm] SET ENCRYPTION ON
GO
ALTER DATABASE [CustoFarm] SET QUERY_STORE = ON
GO
ALTER DATABASE [CustoFarm] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[DetailID] [int] IDENTITY(100,1) NOT NULL,
	[DetailOrderID] [int] NOT NULL,
	[DetailProductID] [int] NOT NULL,
	[DetailName] [varchar](20) NULL,
	[DetailPrice] [float] NOT NULL,
	[DetailSKU] [varchar](50) NULL,
	[DetailQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OrderID] [int] IDENTITY(10,1) NOT NULL,
	[OrderUserID] [int] NOT NULL,
	[OrderAmount] [int] NOT NULL,
	[OrderShipName] [varchar](100) NULL,
	[OrderShipAddress] [varchar](100) NULL,
	[OrderShipAddress2] [varchar](100) NULL,
	[OrderCity] [varchar](50) NULL,
	[OrderState] [varchar](50) NULL,
	[OrderZip] [varchar](20) NULL,
	[OrderCountry] [varchar](50) NULL,
	[OrderPhone] [varchar](20) NULL,
	[OrderFax] [varchar](20) NULL,
	[OrderShipping] [float] NULL,
	[OrderTax] [float] NOT NULL,
	[OrderEmail] [varchar](100) NULL,
	[OrderDate] [timestamp] NOT NULL,
	[OrderShipped] [tinyint] NOT NULL,
	[OrderTrackingNumber] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productcategories]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productcategories](
	[CategoryID] [int] IDENTITY(1000,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoptions]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoptions](
	[ProductOptionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[OptionID] [int] NOT NULL,
	[OptionPriceIncrement] [int] NULL,
	[OptionGroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductOptionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSKU] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[ProductPrice] [float] NOT NULL,
	[ProductWeight] [float] NOT NULL,
	[ProductCartDesc] [varchar](250) NULL,
	[ProductShortDesc] [varchar](1000) NULL,
	[ProductLongDesc] [text] NULL,
	[ProductThumb] [varchar](100) NULL,
	[ProductImage] [varchar](100) NULL,
	[ProductCategoryID] [int] NULL,
	[ProductUpdateDate] [timestamp] NOT NULL,
	[ProductStock] [float] NULL,
	[ProductLive] [tinyint] NULL,
	[ProductUnlimited] [tinyint] NULL,
	[ProductLocation] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/31/2021 10:34:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [int] IDENTITY(10000,1) NOT NULL,
	[Email] [varchar](500) NULL,
	[Password] [varchar](500) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[City] [varchar](90) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](12) NULL,
	[EmailVerified] [tinyint] NULL,
	[VerificationCode] [varchar](20) NULL,
	[IP] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[productcategories] ON 

INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1000, N'Running')
INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1001, N'Walking')
INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1002, N'HIking')
INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1003, N'Track and Trail')
INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1004, N'Short Sleave')
INSERT [dbo].[productcategories] ([CategoryID], [CategoryName]) VALUES (1005, N'Long Sleave')
SET IDENTITY_INSERT [dbo].[productcategories] OFF
GO
SET IDENTITY_INSERT [dbo].[productoptions] ON 

INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (1, 1, 1, 0, 1)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (2, 1, 2, 0, 1)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (3, 1, 3, 0, 1)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (4, 1, 4, 0, 2)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (5, 1, 5, 0, 2)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (6, 1, 6, 0, 2)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (7, 1, 7, 2, 2)
INSERT [dbo].[productoptions] ([ProductOptionID], [ProductID], [OptionID], [OptionPriceIncrement], [OptionGroupID]) VALUES (8, 1, 8, 2, 2)
SET IDENTITY_INSERT [dbo].[productoptions] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([ProductID], [ProductSKU], [ProductName], [ProductPrice], [ProductWeight], [ProductCartDesc], [ProductShortDesc], [ProductLongDesc], [ProductThumb], [ProductImage], [ProductCategoryID], [ProductStock], [ProductLive], [ProductUnlimited], [ProductLocation]) VALUES (1, N'newprod', N'Banana', 12, 0.5, N'yellow banana healthy', N'at cheap price', N'yellow banana healthy', NULL, NULL, NULL, NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[users] OFF 

INSERT [dbo].[users] ( 100, N'zeeshanbge@gmail.com', N'93374262', N'Zeeshan', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'8888924956', NULL)
INSERT [dbo].[users] ([UserID], [UserEmail], [UserPassword], [UserFirstName], [UserLastName], [UserCity], [UserState], [UserZip], [UserEmailVerified], [UserVerificationCode], [UserIP], [UserPhone], [UserRegistrationDate]) VALUES (2, N'zeeshanbge3@gmail.com', N'93374262', N'Zeeshan2', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'8888924955', NULL)
INSERT [dbo].[users] ([UserID], [UserEmail], [UserPassword], [UserFirstName], [UserLastName], [UserCity], [UserState], [UserZip], [UserEmailVerified], [UserVerificationCode], [UserIP], [UserPhone], [UserRegistrationDate]) VALUES (3, N'zeeshan@gmail.com', N'1234', N'zeeshanbge', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'23423', CAST(N'2021-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[users] ([UserID], [UserEmail], [UserPassword], [UserFirstName], [UserLastName], [UserCity], [UserState], [UserZip], [UserEmailVerified], [UserVerificationCode], [UserIP], [UserPhone], [UserRegistrationDate]) VALUES (4, N'shirke@gmail.com', N'12342', N'pratham', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'8882323', CAST(N'2021-10-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('0') FOR [OrderShipped]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (NULL) FOR [ProductStock]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('0') FOR [ProductLive]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('1') FOR [ProductUnlimited]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('0') FOR [UserEmailVerified]
GO
/****** Object:  StoredProcedure [dbo].[getProduct]    Script Date: 10/31/2021 10:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================

CREATE PROCEDURE [dbo].[getProduct]
(
    -- Add the parameters for the stored procedure here
  @id int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	SELECT [ProductID]
      ,[ProductSKU]
      ,[ProductName]
      ,[ProductPrice]
      ,[ProductWeight]
      ,[ProductCartDesc]
      ,[ProductShortDesc]
      ,[ProductLongDesc]
      ,[ProductThumb]
      ,[ProductImage]
      ,[ProductCategoryID]
      ,[ProductUpdateDate]
      ,[ProductStock]
      ,[ProductLive]
      ,[ProductUnlimited]
      ,[ProductLocation]
  FROM [dbo].[products] 
  where [ProductID] = @id
END
GO
ALTER DATABASE [CustoFarm] SET  READ_WRITE 
GO
