USE [master]
GO
/****** Object:  Database [Project6Ecommerce]    Script Date: 9/11/2024 12:06:47 PM ******/
CREATE DATABASE [Project6Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project6Ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project6Ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project6Ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project6Ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project6Ecommerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project6Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project6Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project6Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project6Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project6Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project6Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [Project6Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Project6Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project6Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project6Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project6Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project6Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project6Ecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project6Ecommerce', N'ON'
GO
ALTER DATABASE [Project6Ecommerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project6Ecommerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project6Ecommerce]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [varchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[passwordHash] [varbinary](max) NULL,
	[passwordSalt] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Item]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Item](
	[Cart_Item_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_Item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[Message] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[SenderName] [nvarchar](255) NULL,
	[ReceiverName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[status] [int] NULL,
	[date] [date] NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[sub] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[sent_date] [date] NULL,
	[admin_response] [nvarchar](max) NULL,
	[response_date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copons]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copons](
	[copon_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[amount] [decimal](10, 2) NULL,
	[date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[copon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Item]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item](
	[Order_Item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[copon_id] [int] NULL,
	[status] [nvarchar](max) NULL,
	[transaction_id] [nvarchar](max) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NULL,
	[category_id] [int] NULL,
	[color] [nvarchar](max) NULL,
	[flower_color_id] [int] NULL,
	[price_with_discount] [decimal](10, 2) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/11/2024 12:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [varchar](max) NULL,
	[phone_number] [varchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[passwordHash] [varbinary](max) NULL,
	[passwordSalt] [varbinary](max) NULL,
	[address] [nvarchar](max) NULL,
	[points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [name], [email], [img], [password], [passwordHash], [passwordSalt]) VALUES (1, N'Admin User', N'admin@example.com', N'admin.png', N'adminPass123', NULL, NULL)
INSERT [dbo].[Admin] ([admin_id], [name], [email], [img], [password], [passwordHash], [passwordSalt]) VALUES (2, N'ADMIN', N'admin1@gmailcom', NULL, N'ADMIN', 0x5BC6FDE794E3927017BF6EC0978950890BA70FB75C54F66A42E664B6F83249D697A67AE9B6246D23A897436C48C886F13AA2CA031681568D9AFAFE8A7744434F, 0xFBB4EF8C49892F9BB2A1C827E39AD78F2B39C553ECAD5C9A4932ECEE908D3A08C643BC659AD90C857CAFD676EDF5ED56A2F79B6776370B4AA094B6EE8142812198C97D240C1D7B0BDD5EEF52371D12217F4392110F01CE4F713B233213149AD500828E888E4E41CEEFC5EC92611DA1E5B034C72EA6709899D88B2953894B85F9)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart_Item] ON 

INSERT [dbo].[Cart_Item] ([Cart_Item_id], [product_id], [user_id], [quantity]) VALUES (51, 24, 23, 1)
SET IDENTITY_INSERT [dbo].[Cart_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name], [image], [description]) VALUES (2, N'Hand-Tied Bouquets', N'Hand-Tied Bouquets.png', N'is a beautiful and thoughtfully arranged collection of fresh flowers, carefully selected and tied together by hand.')
INSERT [dbo].[Category] ([category_id], [name], [image], [description]) VALUES (3, N'Flowers in Vases', N'Flowers in Vases.png', N'are a timeless and sophisticated way to display fresh blooms, offering a polished and elegant look for any setting.')
INSERT [dbo].[Category] ([category_id], [name], [image], [description]) VALUES (4, N'Single Bloom', N'Single Bloom.png', N' is a minimalist yet striking floral arrangement that features a single, carefully chosen flower as the centerpiece.')
INSERT [dbo].[Category] ([category_id], [name], [image], [description]) VALUES (6, N'Plants', N'Plants.png', N'are a wonderful way to bring life, greenery, and a touch of nature into any indoor or outdoor space. ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] ON 

INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (5, 21, 0, N'test
', CAST(N'2024-09-11T09:25:57.653' AS DateTime), N'null', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (6, 0, 21, N'hello', CAST(N'2024-09-11T09:26:35.497' AS DateTime), N'Admin', N'null')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (7, 21, 0, N'hh', CAST(N'2024-09-11T09:26:42.213' AS DateTime), N'null', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (8, 0, 21, N'dd', CAST(N'2024-09-11T09:26:51.657' AS DateTime), N'Admin', N'null')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (9, 21, 0, N'jjj', CAST(N'2024-09-11T09:29:07.043' AS DateTime), N'null', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (10, 0, 21, N'hi', CAST(N'2024-09-11T09:29:19.237' AS DateTime), N'Admin', N'null')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (11, 22, 0, N'bbasas', CAST(N'2024-09-11T09:34:43.347' AS DateTime), N'ayah aldomi', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (12, 22, 0, N'test', CAST(N'2024-09-11T09:43:32.623' AS DateTime), N'undefined', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (13, 0, 22, N'tt', CAST(N'2024-09-11T09:44:13.093' AS DateTime), N'Admin', N'undefined')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (14, 22, 0, N'hhh', CAST(N'2024-09-11T09:47:01.567' AS DateTime), N'ayah aldomi', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (15, 23, 0, N'aa
', CAST(N'2024-09-11T10:13:46.780' AS DateTime), N'ayah aldomi', N'Admin')
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [Message], [Timestamp], [SenderName], [ReceiverName]) VALUES (16, 0, 22, N'HI', CAST(N'2024-09-11T10:14:41.277' AS DateTime), N'Admin', N'ayah aldomi')
SET IDENTITY_INSERT [dbo].[ChatMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [user_id], [product_id], [comment], [status], [date], [rating]) VALUES (21, 5, 25, N'HELLO', 1, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Comment] ([comment_id], [user_id], [product_id], [comment], [status], [date], [rating]) VALUES (28, 23, 22, NULL, 1, CAST(N'2024-09-11' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (1, N'Customer 1', N'customer1@example.com', N'Order Inquiry', N'I have a question about my order.', CAST(N'2024-09-05' AS Date), N'We will respond shortly.', CAST(N'2024-09-06' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (2, N'Customer 2', N'customer2@example.com', N'Payment Issue', N'I encountered an issue with payment.', CAST(N'2024-09-05' AS Date), N'Payment confirmed.', CAST(N'2024-09-06' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (3, N'Customer 3', N'customer3@example.com', N'Product Inquiry', N'Is the product available?', CAST(N'2024-09-07' AS Date), N'Yes, it is available.', CAST(N'2024-09-08' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (4, N'Customer 4', N'customer4@example.com', N'Shipping Issue', N'When will my product be shipped?', CAST(N'2024-09-07' AS Date), N'Shipped today.', CAST(N'2024-09-08' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (5, N'Customer 5', N'customer5@example.com', N'Product Inquiry', N'Are there more colors available?', CAST(N'2024-09-09' AS Date), N'Yes, we have multiple colors.', CAST(N'2024-09-10' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (6, N'Ms. Gerard Stehr', N'weam1@example.com', N'test', N'last test', CAST(N'2024-09-09' AS Date), N'hello thank you ', CAST(N'2024-09-09' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (7, N'Ms. Gerard Stehr', N'ayah@gmail.com', N'hhh', N'hello', CAST(N'2024-09-10' AS Date), N'thank you', CAST(N'2024-09-10' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (8, N'Ayah', N'weam1@example.com', N'gg', N'rrr', CAST(N'2024-09-11' AS Date), N'yes', CAST(N'2024-09-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Copons] ON 

INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (2, N'FALL15', CAST(15.00 AS Decimal(10, 2)), CAST(N'2024-09-15' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (3, N'rrr', CAST(5.00 AS Decimal(10, 2)), CAST(N'2024-09-20' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (4, N'ggs', CAST(2.00 AS Decimal(10, 2)), CAST(N'2024-09-25' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (5, N'last test', CAST(1.00 AS Decimal(10, 2)), CAST(N'2024-09-18' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (6, N'tt', CAST(2.00 AS Decimal(10, 2)), CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (7, N'kill me plz', CAST(5.00 AS Decimal(10, 2)), CAST(N'2024-09-18' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (8, N'ayah', CAST(6.00 AS Decimal(10, 2)), CAST(N'2024-09-19' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Copons] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Item] ON 

INSERT [dbo].[Order_Item] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (34, 34, 22, 1)
SET IDENTITY_INSERT [dbo].[Order_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (2, 1, CAST(80.00 AS Decimal(10, 2)), 2, N'Pending', N'TX002', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (4, 2, CAST(120.00 AS Decimal(10, 2)), 2, N'Pending', N'TX004', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (6, 3, CAST(170.00 AS Decimal(10, 2)), 2, N'Pending', N'TX006', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (8, 4, CAST(200.00 AS Decimal(10, 2)), 2, N'Pending', N'TX008', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (10, 5, CAST(250.00 AS Decimal(10, 2)), 2, N'Pending', N'TX010', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (21, NULL, NULL, NULL, N'Completed', N'123456789', NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [amount], [copon_id], [status], [transaction_id], [Date]) VALUES (34, 23, CAST(55.00 AS Decimal(10, 2)), NULL, N'Completed', N'123456789', CAST(N'2024-09-11' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (22, N'Hand-Tied White Roses', N'A beautiful hand-tied bouquet of white roses', N'hand_tied_white_roses.jpg', CAST(50.00 AS Decimal(10, 2)), 2, N'White', 2, CAST(45.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (23, N'Hand-Tied Pink Roses', N'A beautiful hand-tied bouquet of pink roses', N'hand_tied_pink_roses.jpg', CAST(50.00 AS Decimal(10, 2)), 2, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (24, N'Hand-Tied Red Lilies', N'Elegant hand-tied red lilies', N'hand_tied_red_lilies.jpg', CAST(60.00 AS Decimal(10, 2)), 2, N'Red', 1, CAST(55.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (25, N'Hand-Tied White Lilies', N'Elegant hand-tied white lilies', N'hand_tied_white_lilies.jpg', CAST(60.00 AS Decimal(10, 2)), 2, N'White', 2, CAST(55.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (26, N'Hand-Tied Pink Lilies', N'Elegant hand-tied pink lilies', N'hand_tied_pink_lilies.jpg', CAST(60.00 AS Decimal(10, 2)), 2, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (27, N'Hand-Tied Red Tulips', N'Delicate hand-tied red tulips', N'hand_tied_red_tulips.jpg', CAST(45.00 AS Decimal(10, 2)), 2, N'Red', 1, CAST(42.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (28, N'Hand-Tied White Tulips', N'Delicate hand-tied white tulips', N'hand_tied_white_tulips.jpg', CAST(45.00 AS Decimal(10, 2)), 2, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (29, N'Hand-Tied Pink Tulips', N'Delicate hand-tied pink tulips', N'hand_tied_pink_tulips.jpg', CAST(45.00 AS Decimal(10, 2)), 2, N'Pink', 3, CAST(42.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (30, N'Hand-Tied Red Carnations', N'A hand-tied bouquet of red carnations', N'hand_tied_red_carnations.jpg', CAST(40.00 AS Decimal(10, 2)), 2, N'Red', 1, CAST(35.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (31, N'Hand-Tied White Carnations', N'A hand-tied bouquet of white carnations', N'hand_tied_white_carnations.jpg', CAST(40.00 AS Decimal(10, 2)), 2, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (32, N'Hand-Tied Pink Carnations', N'A hand-tied bouquet of pink carnations', N'hand_tied_pink_carnations.jpg', CAST(40.00 AS Decimal(10, 2)), 2, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (33, N'Hand-Tied Red Gerberas', N'A hand-tied bouquet of red gerberas', N'hand_tied_red_gerberas.jpg', CAST(55.00 AS Decimal(10, 2)), 2, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (34, N'Hand-Tied White Gerberas', N'A hand-tied bouquet of white gerberas', N'hand_tied_white_gerberas.jpg', CAST(55.00 AS Decimal(10, 2)), 2, N'White', 2, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (35, N'Hand-Tied Pink Gerberas', N'A hand-tied bouquet of pink gerberas', N'hand_tied_pink_gerberas.jpg', CAST(55.00 AS Decimal(10, 2)), 2, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (36, N'Vase Red Roses', N'A stunning vase of red roses', N'vase_red_roses.jpg', CAST(60.00 AS Decimal(10, 2)), 3, N'Red', 1, CAST(55.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (37, N'Vase White Roses', N'A stunning vase of white roses', N'vase_white_roses.jpg', CAST(60.00 AS Decimal(10, 2)), 3, N'White', 2, CAST(55.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (38, N'Vase Pink Roses', N'A stunning vase of pink roses', N'vase_pink_roses.jpg', CAST(60.00 AS Decimal(10, 2)), 3, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (39, N'Vase Red Lilies', N'A decorative vase of red lilies', N'vase_red_lilies.jpg', CAST(70.00 AS Decimal(10, 2)), 3, N'Red', 1, CAST(65.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (40, N'Vase White Lilies', N'A decorative vase of white lilies', N'vase_white_lilies.jpg', CAST(70.00 AS Decimal(10, 2)), 3, N'White', 2, CAST(65.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (41, N'Vase Pink Lilies', N'A decorative vase of pink lilies', N'vase_pink_lilies.jpg', CAST(70.00 AS Decimal(10, 2)), 3, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (42, N'Vase Red Tulips', N'A vase of red tulips', N'vase_red_tulips.jpg', CAST(50.00 AS Decimal(10, 2)), 3, N'Red', 1, CAST(48.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (43, N'Vase White Tulips', N'A vase of white tulips', N'vase_white_tulips.jpg', CAST(50.00 AS Decimal(10, 2)), 3, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (44, N'Vase Pink Tulips', N'A vase of pink tulips', N'vase_pink_tulips.jpg', CAST(50.00 AS Decimal(10, 2)), 3, N'Pink', 3, CAST(48.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (45, N'Vase Red Carnations', N'A vase of red carnations', N'vase_red_carnations.jpg', CAST(45.00 AS Decimal(10, 2)), 3, N'Red', 1, CAST(42.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (46, N'Vase White Carnations', N'A vase of white carnations', N'vase_white_carnations.jpg', CAST(45.00 AS Decimal(10, 2)), 3, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (47, N'Vase Pink Carnations', N'A vase of pink carnations', N'vase_pink_carnations.jpg', CAST(45.00 AS Decimal(10, 2)), 3, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (48, N'Vase Red Gerberas', N'A vase of red gerberas', N'vase_red_gerberas.jpg', CAST(65.00 AS Decimal(10, 2)), 3, N'Red', 1, CAST(60.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (49, N'Vase White Gerberas', N'A vase of white gerberas', N'vase_white_gerberas.jpg', CAST(65.00 AS Decimal(10, 2)), 3, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (50, N'Vase Pink Gerberas', N'A vase of pink gerberas', N'vase_pink_gerberas.jpg', CAST(65.00 AS Decimal(10, 2)), 3, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (51, N'Single Red Rose', N'A single red rose', N'single_red_rose.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (52, N'Single White Rose', N'A single white rose', N'single_white_rose.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (53, N'Single Pink Rose', N'A single pink rose', N'single_pink_rose.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'Pink', 3, CAST(9.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (54, N'Single Red Lily', N'A single red lily', N'single_red_lily.jpg', CAST(12.00 AS Decimal(10, 2)), 4, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (55, N'Single White Lily', N'A single white lily', N'single_white_lily.jpg', CAST(12.00 AS Decimal(10, 2)), 4, N'White', 2, CAST(11.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (56, N'Single Pink Lily', N'A single pink lily', N'single_pink_lily.jpg', CAST(12.00 AS Decimal(10, 2)), 4, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (57, N'Single Red Tulip', N'A single red tulip', N'single_red_tulip.jpg', CAST(8.00 AS Decimal(10, 2)), 4, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (58, N'Single White Tulip', N'A single white tulip', N'single_white_tulip.jpg', CAST(8.00 AS Decimal(10, 2)), 4, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (59, N'Single Pink Tulip', N'A single pink tulip', N'single_pink_tulip.jpg', CAST(8.00 AS Decimal(10, 2)), 4, N'Pink', 3, CAST(7.50 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (60, N'Single Red Gerbera', N'A single red gerbera', N'single_red_gerbera.jpg', CAST(15.00 AS Decimal(10, 2)), 4, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (61, N'Single White Gerbera', N'A single white gerbera', N'single_white_gerbera.jpg', CAST(15.00 AS Decimal(10, 2)), 4, N'White', 2, CAST(14.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (62, N'Single Pink Gerbera', N'A single pink gerbera', N'single_pink_gerbera.jpg', CAST(15.00 AS Decimal(10, 2)), 4, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (63, N'Single Red Carnation', N'A single red carnation', N'single_red_carnation.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (64, N'Single White Carnation', N'A single white carnation', N'single_white_carnation.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'White', 2, CAST(9.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (65, N'Single Pink Carnation', N'A single pink carnation', N'single_pink_carnation.jpg', CAST(10.00 AS Decimal(10, 2)), 4, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (66, N'Red Bonsai Tree', N'A small red bonsai tree', N'red_bonsai_tree.jpg', CAST(45.00 AS Decimal(10, 2)), 6, N'Red', 1, CAST(42.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (67, N'White Bonsai Tree', N'A small white bonsai tree', N'white_bonsai_tree.jpg', CAST(45.00 AS Decimal(10, 2)), 6, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (68, N'Pink Bonsai Tree', N'A small pink bonsai tree', N'pink_bonsai_tree.jpg', CAST(45.00 AS Decimal(10, 2)), 6, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (69, N'Red Aloe Vera', N'Red aloe vera plant in a pot', N'red_aloe_vera.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (70, N'White Aloe Vera', N'White aloe vera plant in a pot', N'white_aloe_vera.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (71, N'Pink Aloe Vera', N'Pink aloe vera plant in a pot', N'pink_aloe_vera.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (72, N'Red Cactus', N'A red cactus plant in a pot', N'red_cactus.jpg', CAST(25.00 AS Decimal(10, 2)), 6, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (73, N'White Cactus', N'A white cactus plant in a pot', N'white_cactus.jpg', CAST(25.00 AS Decimal(10, 2)), 6, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (74, N'Pink Cactus', N'A pink cactus plant in a pot', N'pink_cactus.jpg', CAST(25.00 AS Decimal(10, 2)), 6, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (75, N'Red Peace Lily', N'A red peace lily plant', N'red_peace_lily.jpg', CAST(35.00 AS Decimal(10, 2)), 6, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (76, N'White Peace Lily', N'A white peace lily plant', N'white_peace_lily.jpg', CAST(35.00 AS Decimal(10, 2)), 6, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (77, N'Pink Peace Lily', N'A pink peace lily plant', N'pink_peace_lily.jpg', CAST(35.00 AS Decimal(10, 2)), 6, N'Pink', 3, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (78, N'Red Spider Plant', N'A red spider plant in a pot', N'red_spider_plant.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'Red', 1, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (79, N'White Spider Plant', N'A white spider plant in a pot', N'white_spider_plant.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'White', 2, NULL, NULL)
INSERT [dbo].[Products] ([product_id], [name], [description], [image], [price], [category_id], [color], [flower_color_id], [price_with_discount], [Date]) VALUES (80, N'Pink Spider Plant', N'A pink spider plant in a pot', N'pink_spider_plant.jpg', CAST(30.00 AS Decimal(10, 2)), 6, N'Pink', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (1, N'Alice Smith', N'alice@example.com', N'123-456-7890', N'alice.png', N'password123', NULL, NULL, N'123 Flower Lane', 10)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (2, N'Bob Johnson', N'bob@example.com', N'987-654-3210', N'bob.png', N'password123', NULL, NULL, N'456 Rose Street', 20)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (3, N'Charlie Davis', N'charlie@example.com', N'456-789-1234', N'charlie.png', N'password123', NULL, NULL, N'789 Tulip Ave', 30)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (4, N'Diana Clark', N'diana@example.com', N'321-654-9870', N'diana.png', N'password123', NULL, NULL, N'101 Daisy Road', 15)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (5, N'Eve Lewis', N'eve@example.com', N'654-321-7890', N'eve.png', N'password123', NULL, NULL, N'202 Sunflower Blvd', 25)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (7, N'dd', N'bassambanyali@gmail.com', NULL, NULL, N'053712', 0x88A006FD37C72F8F40F7D0E1C08579D4B76384FDC53C6A69938C93A7A5C168E07B4BF0DE4E8593C4CDF4896D757A3AC4B4B48107E579DB9FB0213BF11D3AFCC8, 0x67E17F6170BB0381361F940ADD68C9BAB8FA5D6AD74F0E2AD5C64E1335BFD324E5AA07F7DDCF64732400C50010E3A6F49147CE49E9A6CF4F7C165CCAF3A4D50346471AFBDB1747C2778592700CA0F973B0FCB192DA2C8BF4D407D6834BBCC0CC9F9961483920DF75618A6CD7313DFE1A1740A6FB65614060C2A66F6FBD7EBD81, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points]) VALUES (23, N'ayah aldomi', N'ayahaldomi@gmail.com', N'0799747813', N'https://lh3.googleusercontent.com/a/ACg8ocK4E02-uEQK9TaaHvj4pbmpbUaqLKWGTYUIxBq3iHicsZeNrA=s96-c', N'222', 0x2C435850F4694E41B70592B56F169B23198F438CADAEBE46B5511E0E9328C98B70AF828DABEB41C39FEB9790C91BC10CCB25576BADB89FD457DD7108F8E71BDD, 0xBA3AE17491736DAB6B903D390B5D32DA6D2BACD14562FF2D7BF661EE96A4CFB5032A5FD1920BBCD57EC71216EFEF799A0006DFE497E86673EA00E5E87016D69789ED3C9B3EDBAFB19759A45A799DDE941719F3754172597051FFDBA6F28265D92D4DFFC2052C07B1B74E9C437D578F238DAEC3F21A7E5385660E8FF7130A6597, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ChatMessages] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([copon_id])
REFERENCES [dbo].[Copons] ([copon_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Project6Ecommerce] SET  READ_WRITE 
GO
