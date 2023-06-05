USE [master]
GO
/****** Object:  Database [QuanLyQuanCaPhe]    Script Date: 3/22/2023 4:02:20 PM ******/
CREATE DATABASE [QuanLyQuanCaPhe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCaPhe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCaPhe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanCaPhe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCaPhe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCaPhe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanCaPhe', N'ON'
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET QUERY_STORE = OFF
GO
USE [QuanLyQuanCaPhe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'staff', N'staff', N'1', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'tuanthanh', N'tuanthanh', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (28, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-10' AS Date), 2, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (29, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-10' AS Date), 5, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (30, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-10' AS Date), 7, 1, 0, 170000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (31, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-10' AS Date), 1, 1, 10, 108000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (32, CAST(N'2023-03-10' AS Date), NULL, 1, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (33, CAST(N'2023-03-10' AS Date), NULL, 2, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (34, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-10' AS Date), 3, 1, 10, 324000)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (51, 28, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (52, 29, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (53, 30, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (54, 30, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (55, 31, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (56, 32, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (57, 33, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 34, 1, 3)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Mực khô', 1, 120000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Ngao hấp sả', 1, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Cá Ngừ đại dương', 1, 500000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'Vịt om sấu', 2, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Gà úp lu', 2, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Trâu gác bếp', 2, 300000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Ngan cháy tỏi', 2, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'Thỏ rừng nướng than hoa', 3, 300000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'Tiết canh dê núi', 3, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'Nai xào xả ớt', 3, 350000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (13, N'Ốc hấp xả', 1, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'Tôm lột hấp bia', 1, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'7 up', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Coca-cola', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Bò húc', 4, 150000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Rượu nếp', 4, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (19, N'Rượu cần', 4, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (20, N'Bia 333', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (21, N'Nước cam Mirinda', 4, 10000)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Hải sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Nông sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Lâm sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Nước')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 1', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 2', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 12', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (13, N'Bàn 13', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (14, N'Bàn 14', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (15, N'Bàn 15', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (16, N'Bàn 16', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (17, N'Bàn 17', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (18, N'Bàn 18', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (19, N'Bàn 19', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (20, N'Bàn 20', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Customer') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Bảng chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_TableFood] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_TableFood]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUsername]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[USP_GetAccountByUsername] 
@username nvarchar(100)
as
begin 
	select *from account where username = @username
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getlistbillbydate]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[usp_getlistbillbydate]
	 @checkIn date, @checkOut date
 as
 begin
	select t.name as [Tên bàn],b.totalprice as [Tổng tiền],DateCheckIn as [Ngày vào],DateCheckOut as [Ngày ra],discount as [Giảm giá] from Bill as b, TableFood as t,
	BillInfo as bi, Food as f
	where DateCheckIn >= '20230301' and DateCheckOut <= '20230330' and b.status =1
	 and t.id = b.idTable and bi.idBill = b.id and bi.idFood = f.id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetTableList]
 as select * from TableFood
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBill]
 @idTable int 
 as
 begin
	insert Bill(DateCheckIn,DateCheckOut,idTable,status,discount)
	values(GETDATE(),null,@idTable,0,0)
 end
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertBillInfo]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_InsertBillInfo]
	@idBill int, @idFood int, @count int
as
Begin 
	declare @isExistBillInfo int
	declare @foodCount int =1
	select @isExistBillInfo = id, @foodCount= b.count from BillInfo as b where idBill = @idBill and idFood= @idFood
	if(@isExistBillInfo >0)
	Begin 
		declare @newCount int = @foodCount + @count
		if(@newCount >0)
			update BillInfo set count = @foodCount + @count
		else
			delete BillInfo where idBill= @idBill and idFood=@idFood
	end
	else
		begin
			insert BillInfo(idBill,idFood,count)
			values (@idBill,@idFood,@count)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Login]
@username nvarchar(100),
@password nvarchar(100)
as
begin
	select * from account where username = @username and password = @password
end 
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAccount]    Script Date: 3/22/2023 4:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_UpdateAccount]
@username nvarchar(100), @displayname nvarchar(100), @password nvarchar(100), @newpassword nvarchar(100)
as
begin
	declare @isRightPass int =0
	select @isRightPass = count(*) from Account where UserName =@username and Password = @password
	if(@isRightPass =1)
	begin
		if(@newpassword = null or @newpassword ='')
		begin
			update Account set DisplayName =@displayname where UserName =@username
		end
		else
			update Account set DisplayName =@displayname, Password= @newpassword where UserName =@username 
	end

end
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  READ_WRITE 
GO

 CREATE proc [dbo].[usp_getlistbillbydateandpage]
	 @checkIn date, @checkOut date, @page int
 as
 begin
	declare @pageRows int = 10
	declare @selectRows int = @pageRows * @page
	declare @exceptRows int = (@page - 1) * @pageRows

	;with BillShow as( select t.name as [Tên bàn],b.totalprice as [Tổng tiền],DateCheckIn as [Ngày vào],DateCheckOut as [Ngày ra],discount as [Giảm giá] from Bill as b, TableFood as t,
	BillInfo as bi, Food as f
	where DateCheckIn >= '2023-03-10' and DateCheckOut <= '2023-03-30' and b.status =1
	 and t.id = b.idTable and bi.idBill = b.id and bi.idFood = f.id)
	 select top (@selectRows) * from BillShow
	 except
	 select top (@exceptRows) * from BillShow

end
GO

exec dbo.usp_getlistbillbydateandpage @checkin = '2023-03-10',
	@checkout = '2023-03-30',
	@page = 0