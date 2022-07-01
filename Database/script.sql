USE [master]
GO
/****** Object:  Database [LION]    Script Date: 3/12/2022 12:42:09 PM ******/
CREATE DATABASE [LION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PNJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PNJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PNJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PNJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LION] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LION] SET ARITHABORT OFF 
GO
ALTER DATABASE [LION] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LION] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LION] SET RECOVERY FULL 
GO
ALTER DATABASE [LION] SET  MULTI_USER 
GO
ALTER DATABASE [LION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LION] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LION', N'ON'
GO
ALTER DATABASE [LION] SET QUERY_STORE = OFF
GO
USE [LION]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [varchar](50) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[img] [varchar](100) NULL,
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[payment] [float] NULL,
	[colour] [char](10) NULL,
	[size] [nchar](10) NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[address] [nvarchar](100) NULL,
	[phone] [bigint] NULL,
	[fullname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[discount] [float] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_OrderDetails_1] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[shipDate] [date] NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[payment] [float] NULL,
	[shipping] [float] NULL,
	[total] [float] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[image] [varchar](50) NULL,
	[price] [float] NULL,
	[description] [text] NULL,
	[supplier] [nvarchar](10) NULL,
	[categoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 3/12/2022 12:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[storageID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[colour] [char](10) NOT NULL,
	[num_left] [int] NULL,
	[inDate] [date] NULL,
	[size] [nchar](10) NULL,
 CONSTRAINT [PK_storage] PRIMARY KEY CLUSTERED 
(
	[storageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [username], [password], [role], [email]) VALUES (1, N'user', N'123456', N'user', N'helloworld123@gmail.com')
INSERT [dbo].[Account] ([accountID], [username], [password], [role], [email]) VALUES (9, N'user2', N'123456', N'user', N'alo@gmail.com')
INSERT [dbo].[Account] ([accountID], [username], [password], [role], [email]) VALUES (10, N'admin', N'123456', N'admin', N'alo12345@gmail.com')
INSERT [dbo].[Account] ([accountID], [username], [password], [role], [email]) VALUES (11, N'user1', N'123456', N'user', N'alo@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([img], [cartID], [accountID], [productID], [quantity], [price], [payment], [colour], [size]) VALUES (N'hello', 1, 9, 2, 10, 1200, 200, N'blue      ', N'XL        ')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'shirt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'shoes')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'jewel')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [accountID], [address], [phone], [fullname]) VALUES (1, 1, N'Hai Ba Trung', 888100105, N'Mai Thị Viện')
INSERT [dbo].[Customer] ([customerID], [accountID], [address], [phone], [fullname]) VALUES (2, 9, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([customerID], [accountID], [address], [phone], [fullname]) VALUES (3, 11, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (6, 2, 0, 1260, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (9, 5, 0, 900, 20, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (10, 3, 0, 400, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (11, 2, 0, 1200, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (12, 4, 0, 500, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (13, 2, 0, 1200, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (14, 2, 0, 1200, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (15, 5, 0, 900, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (16, 4, 0, 500, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (17, 3, 0, 400, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (18, 5, 0, 900, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (19, 3, 0, 400, 1, 0)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [discount], [price], [quantity], [total]) VALUES (20, 13, 0, 400, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (6, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 3, 1260, 12.6, 1272.6, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (7, CAST(N'2001-11-03' AS Date), CAST(N'2001-11-03' AS Date), 1, 3, 20, 20, 40, N'delivery')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (8, CAST(N'2001-11-03' AS Date), CAST(N'2001-11-03' AS Date), 1, 3, 20, 20, 40, N'delivery')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (9, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 5, 18000, 90, 18090, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (10, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 3, 400, 2, 402, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (11, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 2, 1200, 6, 1206, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (12, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 4, 500, 2.5, 502.5, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (13, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 2, 1200, 6, 1206, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (14, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 2, 1200, 6, 1206, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (15, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-10' AS Date), 1, 5, 900, 4.5, 904.5, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (16, CAST(N'2022-03-06' AS Date), CAST(N'2022-03-11' AS Date), 1, 4, 500, 2.5, 502.5, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (17, CAST(N'2022-03-07' AS Date), CAST(N'2022-03-12' AS Date), 1, 3, 400, 2, 402, N'delivered')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (18, CAST(N'2022-03-07' AS Date), CAST(N'2022-03-11' AS Date), 1, 5, 900, 4.5, 904.5, N'delivered')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (19, CAST(N'2022-03-11' AS Date), CAST(N'2022-03-11' AS Date), 1, 3, 400, 2, 402, N'delivered')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [accountID], [productID], [payment], [shipping], [total], [status]) VALUES (20, CAST(N'2022-03-11' AS Date), CAST(N'2022-03-11' AS Date), 1, 13, 400, 2, 402, N'delivered')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (2, N'shirt-1', N'shirt-1.jpg', 1200, N'nice ', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (3, N'shirt-2', N'shirt-2.jpeg', 400, N'bad', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (4, N'shirt-3', N'shirt-3.jfif', 500, N'bada', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (5, N'shirt-4', N'shirt-4.jpg', 900, N'nice', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (6, N'shoes-1', N'shoes-1.jpeg', 400, N'bad', N'china', 2)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (7, N'shoes-2', N'shoes-2.jpg', 300, N'nice', N'china', 2)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (8, N'shoes-4', N'shoes-4.jpg', 450, N'Very good', N'vietnam', 2)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (9, N'jwe-1', N'jew-1.png', 5000, N'Very good', N'china', 3)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (10, N'jew-2', N'jew-2.jpg', 4000, N'Very good', N'hungary', 3)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (11, N'jew-3', N'jew-3.jpg', 4600, N'Very good', N'Portual', 3)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (12, N'jew-4', N'jew-4.webp', 3400, N'Very good', N'China', 3)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (13, N'shirt-5', N'shirt-5.jpg', 400, N'very good', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (14, N'shirt-6', N'shirt-6.png', 500, N'Very good', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (15, N'shirt-7', N'shirt-7.webp', 5000, N'perfect', N'china', 1)
INSERT [dbo].[Product] ([productID], [productName], [image], [price], [description], [supplier], [categoryID]) VALUES (16, N'shoes-5', N'shoes-5.jpg', 700, N'very nice', N'China', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Storage] ON 

INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (2, 2, N'blue      ', 207, CAST(N'2022-03-08' AS Date), N'XXL       ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (3, 3, N'red       ', 96, CAST(N'2001-11-03' AS Date), N'XL        ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (4, 4, N'blue      ', 98, CAST(N'2001-11-03' AS Date), N'XXL       ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (5, 5, N'blue      ', 78, CAST(N'2001-11-03' AS Date), N'XL        ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (6, 2, N'blue      ', 98, CAST(N'2001-11-03' AS Date), N'XL        ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (7, 3, N'red       ', 100, CAST(N'2001-11-03' AS Date), N'M         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (10, 13, N'blue      ', 99, CAST(N'2001-11-03' AS Date), N'M         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (11, 14, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'M         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (12, 15, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'M         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (14, 6, N'blue      ', 100, CAST(N'2001-11-03' AS Date), NULL)
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (15, 7, N'blue      ', 100, CAST(N'2001-11-03' AS Date), NULL)
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (19, 8, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'a         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (20, 9, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'a         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (21, 10, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'a         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (22, 11, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'a         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (23, 12, N'blue      ', 100, CAST(N'2001-11-03' AS Date), N'a         ')
INSERT [dbo].[Storage] ([storageID], [productID], [colour], [num_left], [inDate], [size]) VALUES (24, 16, N'red       ', 100, CAST(N'2001-11-03' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Storage] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ID]    Script Date: 3/12/2022 12:42:09 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UC_ID] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Product]
GO
USE [master]
GO
ALTER DATABASE [LION] SET  READ_WRITE 
GO
