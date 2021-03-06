USE [master]
GO
/****** Object:  Database [fresh_supermarket]    Script Date: 2019/4/16 16:24:20 ******/
CREATE DATABASE [fresh_supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fresh_supermarket', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fresh_supermarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fresh_supermarket_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fresh_supermarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [fresh_supermarket] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fresh_supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fresh_supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fresh_supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fresh_supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fresh_supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fresh_supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [fresh_supermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fresh_supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fresh_supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fresh_supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fresh_supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fresh_supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fresh_supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fresh_supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fresh_supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fresh_supermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fresh_supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fresh_supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fresh_supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fresh_supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fresh_supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fresh_supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fresh_supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fresh_supermarket] SET RECOVERY FULL 
GO
ALTER DATABASE [fresh_supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [fresh_supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fresh_supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fresh_supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fresh_supermarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fresh_supermarket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'fresh_supermarket', N'ON'
GO
ALTER DATABASE [fresh_supermarket] SET QUERY_STORE = OFF
GO
USE [fresh_supermarket]
GO
/****** Object:  Table [dbo].[addressinfo]    Script Date: 2019/4/16 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addressinfo](
	[addId] [varchar](200) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[addname] [varchar](50) NULL,
	[addr] [varchar](200) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [pk_address] PRIMARY KEY CLUSTERED 
(
	[addId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartId] [varchar](50) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[freshId] [varchar](50) NOT NULL,
	[counts] [varchar](50) NOT NULL,
	[fee] [numeric](6, 2) NOT NULL,
 CONSTRAINT [pk_cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[empId] [varchar](50) NOT NULL,
	[empname] [varchar](50) NULL,
	[hiredate] [date] NULL,
	[sale_sum] [varchar](50) NULL,
	[wages] [varchar](50) NULL,
 CONSTRAINT [pk_emp] PRIMARY KEY CLUSTERED 
(
	[empId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fresh]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fresh](
	[freshId] [varchar](50) NOT NULL,
	[typeId] [varchar](50) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[image] [varchar](100) NOT NULL,
	[introduct] [varchar](max) NULL,
	[production] [varchar](100) NULL,
	[new_price] [numeric](6, 2) NULL,
	[price] [numeric](6, 2) NULL,
	[onsale_date] [date] NULL,
	[production_date] [date] NULL,
	[expiration_day] [varchar](20) NULL,
	[num] [varchar](50) NULL,
 CONSTRAINT [pk_fresh] PRIMARY KEY CLUSTERED 
(
	[freshId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [varchar](50) NOT NULL,
	[freshId] [varchar](50) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[addId] [varchar](200) NULL,
	[fee] [numeric](6, 2) NULL,
	[num] [numeric](6, 2) NULL,
	[orderState] [varchar](200) NULL,
	[time] [varchar](50) NULL,
 CONSTRAINT [pk_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[typeId] [varchar](50) NOT NULL,
	[typename] [varchar](200) NOT NULL,
 CONSTRAINT [pk_freshtype] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2019/4/16 16:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userId] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[lastdate] [date] NULL,
	[paypassword] [varchar](50) NULL,
	[money] [varchar](50) NULL,
 CONSTRAINT [pk_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310001admin', N'admin', N'lj', N'安徽省宿州市', N'1882627481')
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310001guest', N'guest', N'jm', N'上海市徐汇区', N'123456789')
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310002admin', N'admin', N'ssx', N'河南省信阳市', N'1234567890')
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310002guest', N'guest', N'ljmm', N'上海市奉贤区', N'123456789')
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310003admin', N'admin', N'jxx', N'河北省沧州市', N'111111334')
INSERT [dbo].[addressinfo] ([addId], [userId], [addname], [addr], [phone]) VALUES (N'20190310004admin', N'admin', N'lmm', N'南京市', N'123456789')
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890001 
', N'admin', N'201904150013 
', N'3
', CAST(6.54 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890002 
', N'admin', N'201904150014 
', N'4
', CAST(7.52 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890003 
', N'admin', N'201904150015 
', N'5
', CAST(19.90 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890004 
', N'admin', N'201904150016 
', N'6', CAST(18.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890005 
', N'admin', N'201904150017 
', N'7', CAST(20.16 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890006 
', N'admin', N'201904150018 
', N'8', CAST(120.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890007 
', N'admin', N'201904150019 
', N'9', CAST(124.20 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890008 
', N'admin', N'201904150020 
', N'10
', CAST(295.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890009 
', N'guest', N'201904150021 
', N'11', CAST(786.50 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890010 
', N'guest', N'201904150022 
', N'12
', CAST(828.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890011 
', N'guest', N'201904150023 
', N'13', CAST(91.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890012 
', N'csl', N'201904150024 
', N'14', CAST(490.00 AS Numeric(6, 2)))
INSERT [dbo].[cart] ([cartId], [userId], [freshId], [counts], [fee]) VALUES (N'201904157890013 
', N'csl', N'201904150025 
', N'15', CAST(264.00 AS Numeric(6, 2)))
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'111', N'李明', CAST(N'2015-03-25' AS Date), N'100', N'3000')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'222', N'沈金', CAST(N'2017-02-21' AS Date), N'87', N'2800')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'333', N'陈星', CAST(N'2015-03-25' AS Date), N'120', N'3200')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'444', N'王军', CAST(N'2013-02-11' AS Date), N'150', N'3500')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'555', N'石秦', CAST(N'2018-12-10' AS Date), N'95', N'2900')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'666', N'张三', CAST(N'2019-01-13' AS Date), N'70', N'2600')
INSERT [dbo].[employee] ([empId], [empname], [hiredate], [sale_sum], [wages]) VALUES (N'777', N'李四', CAST(N'2018-05-29' AS Date), N'83', N'2700')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150001 
', N'01', N'菠萝
', N'../img/0000000000000000000000012019014150001.jpg
', N'云南菠萝，鲜美多汁，新鲜采摘发货，肉厚鲜嫩，酸甜可口，阴凉避光处保存
', N'云南
', CAST(2.99 AS Numeric(6, 2)), CAST(15.18 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'5
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150002 
', N'01', N'橘子
', N'../img/0000000000000000000000012019014150002.jpg
', N'四川青见橘子，饱满多汁，果肉入口香甜，果香浓郁，颜色鲜明，风味浓郁，坚持自然熟，不催熟不打蜡
', N'四川
', CAST(4.98 AS Numeric(6, 2)), CAST(8.90 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'5
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150003 
', N'01', N'芒果
', N'../img/0000000000000000000000012019014150003.jpg
', N'海南贵妃芒果，皮薄肉厚，爆甜多汁，细腻滑嫩，核小甜蜜，果型饱满，果香浓郁，冷藏贮存
', N'海南
', CAST(4.98 AS Numeric(6, 2)), CAST(18.80 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150004 
', N'01', N'猕猴桃
', N'../img/0000000000000000000000012019014150004.jpg
', N'汁水充沛，酸甜可口，香甜美味，果肉丰厚，味浓鲜美，绿心果
', N'陕西
', CAST(9.98 AS Numeric(6, 2)), CAST(17.80 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'5
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150005 
', N'01', N'苹果
', N'../img/0000000000000000000000012019014150005.jpg
', N'红富士苹果，皮薄肉厚，肉汁细腻，甜脆爽口，老少皆宜。
', N'陕西
', CAST(4.98 AS Numeric(6, 2)), CAST(7.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'21
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150006 
', N'01', N'提子
', N'../img/0000000000000000000000012019014150006.jpg
', N'云南青提葡萄新鲜水果阳光玫瑰提子无籽香印大葡萄，口口清甜，脆嫩多汁，粒大皮薄，无核清甜，冷藏保存
', N'云南
', CAST(19.00 AS Numeric(6, 2)), CAST(31.30 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'30
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150007 
', N'01', N'西瓜
', N'../img/0000000000000000000000012019014150007.jpg
', N'庄客越南黑美人西瓜，新甜，汁水多，皮薄，个头大，脆爽，含有丰富地维生素C，葡萄糖，矿物质等，低温冷藏
', N'越南
', CAST(3.35 AS Numeric(6, 2)), CAST(4.70 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150008 
', N'01', N'柚子
', N'../img/0000000000000000000000012019014150008.jpg
', N'泰国青柚进口白心柚子水果，香甜爽口，甜蜜多汁，肉嫩爽口，果香浓郁，香甜多汁
', N'泰国
', CAST(3.20 AS Numeric(6, 2)), CAST(4.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150009 
', N'02', N'大葱
', N'../img/0000000000000000000000012019014150009.jpg
', N'山东潍坊大葱酱脆甜净，无公害，无污染，绿色食品，优质大葱
', N'山东
', CAST(2.55 AS Numeric(6, 2)), CAST(3.20 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'5
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150010 
', N'02', N'胡萝卜
', N'../img/0000000000000000000000012019014150010.jpg
', N'陕西大荔胡萝卜，坚持古法种植，胡萝卜素高于普通萝卜，更香更脆，营养丰富，秋冬季节地滋补效果好
', N'陕西
', CAST(1.69 AS Numeric(6, 2)), CAST(1.99 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'15
', N'200')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150011 
', N'02', N'黄瓜
', N'../img/0000000000000000000000012019014150011.jpg
', N'有机黄瓜，脆爽多汁，老少皆宜，无农药，无防腐剂。
', N'山东
', CAST(23.00 AS Numeric(6, 2)), CAST(25.20 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150012 
', N'02', N'青椒
', N'../img/0000000000000000000000012019014150012.jpg
', N'新鲜辣妹子辣椒 农家蔬菜新鲜青椒 绿尖椒现摘现发薄皮够辣，辣劲十足，香辣可口，自然生长，身形匀称，冷藏保存，颜色诱人
', N'山东
', CAST(9.97 AS Numeric(6, 2)), CAST(15.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'30
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150013 
', N'02', N'生姜
', N'../img/0000000000000000000000012019014150013.jpg
', N'新鲜采挖，够大够味，肉质紧实辛辣有味姜味浓郁，大姜味道更香，价值更高
', N'云南
', CAST(2.18 AS Numeric(6, 2)), CAST(9.90 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'15
', N'200
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150014 
', N'02', N'土豆
', N'../img/0000000000000000000000012019014150014.jpg
', N'红皮黄心小土豆，鸡蛋大小农家种植，自然成熟，不打农药，大小均匀，新鲜现挖，软糯可口，宜冷藏保存，室温超过十天会发芽
', N'云南
', CAST(1.88 AS Numeric(6, 2)), CAST(3.30 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'60
', N'200
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150015 
', N'02', N'娃娃菜
', N'../img/0000000000000000000000012019014150015.jpg
', N'云南甜脆黄心娃娃菜，新鲜采挖，香甜可口，农家自种，绿色健康，个头饱满
', N'云南
', CAST(3.98 AS Numeric(6, 2)), CAST(6.58 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'10
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150016 
', N'02', N'西红柿
', N'../img/0000000000000000000000012019014150016.jpg
', N'新疆番茄，新鲜营养，原汁原味，自然成熟，酸甜多汁，饱满红润够新鲜，沙瓤多汁够美味
', N'新疆
', CAST(3.00 AS Numeric(6, 2)), CAST(4.70 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150017 
', N'02', N'芋头
', N'../img/0000000000000000000000012019014150017.jpg
', N'正宗荔浦桂林芋头，粉，糯，香，新鲜现挖，个头大，营养丰富，风味特殊，是制作美味的上等食材
', N'广西
', CAST(2.88 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150018 
', N'03', N'巴沙鱼
', N'../img/0000000000000000000000012019014150018.jpg
', N'产自越南的巴沙鱼，选自鱼中段最为鲜美的鱼肉，肉质细腻，个体肥美，营养丰富，储存温度在-18℃
', N'越南
', CAST(15.00 AS Numeric(6, 2)), CAST(20.80 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150019 
', N'03', N'带鱼
', N'../img/0000000000000000000000012019014150019.jpg
', N'产自东海的带鱼，无污染水域，味道鲜美，营养丰富，刺少肉厚，肉质饱满，鲜而不腥，储存温度在-18℃
', N'东海
', CAST(13.80 AS Numeric(6, 2)), CAST(29.80 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150020 
', N'03', N'基围虾
', N'../img/0000000000000000000000012019014150020.jpg
', N'新鲜速冻基围虾，海捕大虾，虾肉紧实鲜嫩，营养丰富，虾身如玉，壳薄肉多-，18℃冷冻保存
', N'山东
', CAST(29.50 AS Numeric(6, 2)), CAST(32.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'50
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150021 
', N'03', N'螃蟹
', N'../img/0000000000000000000000012019014150021.jpg
', N'湖之鼎大闸蟹，新鲜，物美价廉，蟹黄超多，质量很好
', N'江苏
', CAST(71.50 AS Numeric(6, 2)), CAST(90.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'7
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150022 
', N'03', N'皮皮虾
', N'../img/0000000000000000000000012019014150022.jpg
', N'鲜活皮皮虾，个大，新鲜，肉质紧，新鲜饱满带膏，肉质紧实，熟冻锁鲜，好吃美味
', N'山东
', CAST(69.00 AS Numeric(6, 2)), CAST(198.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'30
', N'1000
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150023 
', N'04', N'鸡肉
', N'../img/0000000000000000000000012019014150023.jpg
', N'新鲜鸡肉，营养丰富，肉质细嫩，甜美
', N'新鲜鸡肉，营养丰富，肉质细嫩，甜美
', CAST(7.00 AS Numeric(6, 2)), CAST(8.90 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150024 
', N'04', N'牛肉
', N'../img/0000000000000000000000012019014150024.jpg
', N'进口牛肉，原切原味，烹饪随意，新鲜美味，筋肉分明，肉质鲜嫩有嚼头，入口爽嫩飘香。-18℃下贮藏
', N'澳大利亚
', CAST(35.00 AS Numeric(6, 2)), CAST(40.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'50
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150025 
', N'04', N'鸭肉
', N'../img/0000000000000000000000012019014150025.jpg
', N'六和冷冻鸭肉，肉质细嫩，肥厚紧实，营养丰富，鲜嫩可口，高蛋白低脂肪，-18℃以下冷冻保存
', N'山东
', CAST(17.60 AS Numeric(6, 2)), CAST(21.30 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'50
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150026 
', N'04', N'猪肉
', N'../img/0000000000000000000000012019014150026.jpg
', N'双汇生鲜猪肉，-18℃冷冻保存，肉质细腻柔软，营养价值高，质地柔软有弹性，汁液流失少，口感好，滋味鲜美，有利于人体消化吸收
', N'河南
', CAST(32.00 AS Numeric(6, 2)), CAST(40.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'300
', N'50
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150027 
', N'05', N'红酒
', N'../img/0000000000000000000000012019014150027.jpg
', N'中粮长城 窖酿解百纳红酒 国产干红葡萄酒750ml，醇厚圆润，酒体丰满，酒精度12.5%vol，色泽呈宝石红色，酒品类型为干型，避免阳光直射，干燥通风处卧放或倒放为宜
', N'河北
', CAST(24.80 AS Numeric(6, 2)), CAST(35.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'3650
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150028 
', N'05', N'汇源桃汁
', N'../img/0000000000000000000000012019014150028.jpg
', N'汇源桃汁，鲜水果，不添加，无糖无色素无防腐剂，无菌冷灌装，保留更多营养。常温贮存在干燥处，避免阳光直射
', N'浙江
', CAST(12.80 AS Numeric(6, 2)), CAST(15.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150029 
', N'05', N'可乐
', N'../img/0000000000000000000000012019014150029.jpg
', N'可口可乐零度无糖，禁止加热或0℃一下冷冻，避免阳光直晒及高温
', N'浙江
', CAST(2.50 AS Numeric(6, 2)), CAST(3.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150030 
', N'05', N'美汁源果粒橙
', N'../img/0000000000000000000000012019014150030.jpg
', N'美汁源果粒橙 橙汁饮料 1.25L/瓶 可口可乐出品，含有真正的果肉，喝一口，饱满多汁的口感随之而来，避免阳光直晒及高温，饮用前摇匀，开启后需冷藏并尽快饮用
', N'浙江
', CAST(8.50 AS Numeric(6, 2)), CAST(9.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150031 
', N'05', N'啤酒
', N'../img/0000000000000000000000012019014150031.jpg
', N'青岛经典啤酒，麦汁浓度10°P，酒精度4.0%vol及以上，选用优质大麦酿酒，好评如潮
', N'山东
', CAST(4.54 AS Numeric(6, 2)), CAST(5.83 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150032 
', N'05', N'味全酸奶
', N'../img/0000000000000000000000012019014150032.jpg
', N'精选欧洲专业菌种，活菌发酵，添加膳食纤维，交融新西兰进口乳粉，方便携带，随时随地地照顾肠胃。味全乳酸菌，守护肠道健康环境，帮助肠道运动。
', N'江苏
', CAST(3.31 AS Numeric(6, 2)), CAST(5.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'180
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150033 
', N'05', N'雪碧
', N'../img/0000000000000000000000012019014150033.jpg
', N'可口可乐雪碧，柠檬味汽水，禁止加热或0℃一下冷冻，避免阳光直晒及高温
', N'上海
', CAST(3.00 AS Numeric(6, 2)), CAST(3.50 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'270
', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150034 
', N'06', N'低筋面粉
', N'../img/0000000000000000000000012019014150034.jpg
', N'500g蛋糕曲奇饼干低筋小麦面粉，粉质细腻，麦香浓郁，适合各季节点心蛋糕。贮存条件阴凉干燥通风防久压
', N'浙江
', CAST(4.16 AS Numeric(6, 2)), CAST(6.50 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'270
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150035 
', N'06', N'橄榄油
', N'../img/0000000000000000000000012019014150035.jpg
', N'特级初榨橄榄油，酸度小于0.5%，传统手工采摘，物理冷压榨，主要用于烹饪、煎炸、凉拌、食用，常温避光保存
', N'西班牙
', CAST(49.90 AS Numeric(6, 2)), CAST(55.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'730
', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150036 
', N'06', N'蚝油
', N'../img/0000000000000000000000012019014150036.jpg
', N'蚝油510g，蚝味浓郁，腌肉火锅调味品调料蚝油，浓浓海鲜味，做菜都是鲜，炒蘸拌烤样样都行，阴凉处保存，开封后盖好并需冷藏
', N'广东
', CAST(8.90 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'730
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150037 
', N'06', N'花生油
', N'../img/0000000000000000000000012019014150037.jpg
', N'5S压榨花生油，原料精挑细选，5S物理压榨，品质保障，大桶6.38L，密封阴凉，干燥避光处保存
', N'山东
', CAST(169.90 AS Numeric(6, 2)), CAST(180.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'540
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150038 
', N'06', N'柬埔寨香米
', N'../img/0000000000000000000000012019014150038.jpg
', N'爱普沙柬埔寨香米5kg，黏性低，口感较硬，煮成米饭后，饭香浓郁，米色纯白，香味诱人，置于阴凉干燥处保存
', N'柬埔寨
', CAST(49.90 AS Numeric(6, 2)), CAST(50.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'730
', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150039 
', N'06', N'金龙鱼玉米油
', N'../img/0000000000000000000000012019014150039.jpg
', N'金龙鱼纯正玉米油4L，食用油，营养丰富，非转基因黄金比例调和油，油色透亮少油烟、口味清淡，适合贮存在阴凉及干燥的地方
', N'新加坡
', CAST(39.80 AS Numeric(6, 2)), CAST(45.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'540', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150040 
', N'06', N'面包糠
', N'../img/0000000000000000000000012019014150040.jpg
', N'金黄色面包糠家用小包装油炸香酥肯德基脆皮香蕉糖鸡排炸鸡裹粉屑，新鲜面包制作 炸鸡腿鸡排 香蕉 香酥脆软
', N'江苏
', CAST(7.00 AS Numeric(6, 2)), CAST(9.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150041 
', N'06', N'泰国香米
', N'../img/0000000000000000000000012019014150041.jpg
', N'泰国香米10Kg，一年一季，只出上品香米，古法农耕，用心培育好泰米，劲道弹牙，回味甘甜，温润洁白，油光艳丽，置于阴凉干燥处保存
', N'泰国
', CAST(129.90 AS Numeric(6, 2)), CAST(135.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'730', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150042 
', N'06', N'豌豆粉
', N'../img/0000000000000000000000012019014150042.jpg
', N'新良豌豆粉 凉粉 四川特产家用原料 凉粉粉自制专用粉豌豆淀粉1kg，优选豌豆 粉质细腻润滑 制作简单
', N'四川
', CAST(16.80 AS Numeric(6, 2)), CAST(33.80 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'730
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150043 
', N'06', N'小苏打
', N'../img/0000000000000000000000012019014150043.jpg
', N'500g食用苏打粉，更白，更细，更优惠，贮存在阴凉干燥处
', N'山东
', CAST(3.95 AS Numeric(6, 2)), CAST(6.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150044 
', N'06', N'非转基因大豆油
', N'../img/0000000000000000000000012019014150044.jpg
', N'金龙鱼精炼一级大豆油，原料精工细选，品质卫生少油烟，营养丰富更安全，煎炒煮炸凉拌皆宜，适合贮存在阴凉干燥的地方
', N'新加坡
', CAST(59.90 AS Numeric(6, 2)), CAST(70.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'540', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150045 
', N'07', N'饼干
', N'../img/0000000000000000000000012019014150045.jpg
', N'散装小饼干，美味之旅，来自上海，用心选好料，还原好味道。
', N'上海
', CAST(16.20 AS Numeric(6, 2)), CAST(17.50 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150046 
', N'07', N'果冻
', N'../img/0000000000000000000000012019014150046.jpg
', N'喜之郎果冻，Q弹爽口，老少皆宜，甜度适中，天天好心情
', N'江苏
', CAST(5.60 AS Numeric(6, 2)), CAST(7.10 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150047 
', N'07', N'开心果
', N'../img/0000000000000000000000012019014150047.jpg
', N'三只松鼠开心果225g，自然本色，饱满翠绿吧，粒粒香醇，轻度烘焙，吃出清新原动力
', N'安徽
', CAST(36.90 AS Numeric(6, 2)), CAST(140.00 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'240', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150048 
', N'07', N'薯片
', N'../img/0000000000000000000000012019014150048.jpg
', N'乐事薯片多口味400g，严选土豆，真薯原切，够薄够脆，多种口味任你选择
', N'浙江
', CAST(6.30 AS Numeric(6, 2)), CAST(7.50 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100')
INSERT [dbo].[fresh] ([freshId], [typeId], [name], [image], [introduct], [production], [new_price], [price], [onsale_date], [production_date], [expiration_day], [num]) VALUES (N'201904150049 
L', N'07', N'糖果
', N'../img/0000000000000000000000012019014150049.jpg', N'散装小糖果，甜而不腻，给你甜美之旅，甜蜜每天好心情！
', N'广东
', CAST(8.90 AS Numeric(6, 2)), CAST(6.70 AS Numeric(6, 2)), CAST(N'2019-04-15' AS Date), CAST(N'2019-04-14' AS Date), N'365
', N'100
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150001 
', N'201904150001 
', N'admin', N'20190310001admin', CAST(29.90 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), N'已发货
', N'2019-04-15 13:15
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150002 
', N'201904150036 
', N'admin', N'20190310002admin', CAST(99.60 AS Numeric(6, 2)), CAST(20.00 AS Numeric(6, 2)), N'已收货
', N'2019-04-16 13:16
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150003 
', N'201904150003 
', N'admin', N'20190310003admin', CAST(24.90 AS Numeric(6, 2)), CAST(5.00 AS Numeric(6, 2)), N'已发货
', N'2019-04-15 13:17
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150004 
', N'201904150004 
', N'admin', N'20190310004admin', CAST(99.80 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), N'待发货
', N'2019-04-15 13:18
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150005 
', N'201904150005 
', N'admin', N'20190310001guest', CAST(39.84 AS Numeric(6, 2)), CAST(8.00 AS Numeric(6, 2)), N'未付款
', N'2019-04-15 13:19
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150006 
', N'201904150006 
', N'guest', N'20190310002guest', CAST(190.00 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), N'已收货
', N'2019-04-15 13:20
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150007 
', N'201904150010 
', N'guest', N'20190310001admin', CAST(50.25 AS Numeric(6, 2)), CAST(15.00 AS Numeric(6, 2)), N'已发货
', N'2019-04-15 13:21
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150008 
', N'201904150045 
', N'admin', N'20190310002admin', CAST(64.00 AS Numeric(6, 2)), CAST(20.00 AS Numeric(6, 2)), N'待发货
', N'2019-04-15 13:22
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150009 
', N'201904150009 
', N'guest', N'20190310003admin', CAST(38.25 AS Numeric(6, 2)), CAST(15.00 AS Numeric(6, 2)), N'未付款
', N'2019-04-15 13:23
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150010 
', N'201904150010 
', N'admin', N'20190310004admin', CAST(19.90 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), N'已发货
', N'2019-04-15 13:24
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150011 
', N'201904150011 
', N'csl', N'20190310001guest', CAST(184.00 AS Numeric(6, 2)), CAST(8.00 AS Numeric(6, 2)), N'已收货
', N'2019-04-15 13:25
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150012 
', N'201904150012 
', N'csl', N'20190310002guest', CAST(179.46 AS Numeric(6, 2)), CAST(18.00 AS Numeric(6, 2)), N'已发货
', N'2019-04-15 13:26
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150013 
', N'201904150013 
', N'csl', N'20190310001admin', CAST(10.90 AS Numeric(6, 2)), CAST(5.00 AS Numeric(6, 2)), N'待发货
', N'2019-04-15 13:27
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150014 
', N'201904150014 
', N'csl', N'20190310004admin', CAST(9.40 AS Numeric(6, 2)), CAST(5.00 AS Numeric(6, 2)), N'未付款
', N'2019-04-15 13:28
')
INSERT [dbo].[order] ([orderId], [freshId], [userId], [addId], [fee], [num], [orderState], [time]) VALUES (N'201912304150015 
', N'201904150015 
', N'admin', N'20190310003admin', CAST(39.80 AS Numeric(6, 2)), CAST(10.00 AS Numeric(6, 2)), N'待收货
', N'2019-04-15 13:29
')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'01', N'水果')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'02', N'蔬菜')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'03', N'海鲜')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'04', N'畜禽')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'05', N'饮品')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'06', N'粮油')
INSERT [dbo].[type] ([typeId], [typename]) VALUES (N'07', N'零食')
INSERT [dbo].[user] ([userId], [password], [email], [lastdate], [paypassword], [money]) VALUES (N'admin', N'admin', N'admin@qq.com', CAST(N'2019-04-14' AS Date), N'admin', N'752')
INSERT [dbo].[user] ([userId], [password], [email], [lastdate], [paypassword], [money]) VALUES (N'csl', N'123', N'csl@qq.com', CAST(N'2019-04-12' AS Date), N'csl', N'200')
INSERT [dbo].[user] ([userId], [password], [email], [lastdate], [paypassword], [money]) VALUES (N'guest', N'guest', N'guest@qq.com', CAST(N'2019-04-14' AS Date), N'guest', N'26')
ALTER TABLE [dbo].[addressinfo]  WITH CHECK ADD  CONSTRAINT [fk_add_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[addressinfo] CHECK CONSTRAINT [fk_add_user]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_fresh] FOREIGN KEY([freshId])
REFERENCES [dbo].[fresh] ([freshId])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [fk_cart_fresh]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [fk_cart_user]
GO
ALTER TABLE [dbo].[fresh]  WITH CHECK ADD  CONSTRAINT [fk_fresh_type] FOREIGN KEY([typeId])
REFERENCES [dbo].[type] ([typeId])
GO
ALTER TABLE [dbo].[fresh] CHECK CONSTRAINT [fk_fresh_type]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [fk_order_add] FOREIGN KEY([addId])
REFERENCES [dbo].[addressinfo] ([addId])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [fk_order_add]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [fk_order_fresh] FOREIGN KEY([freshId])
REFERENCES [dbo].[fresh] ([freshId])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [fk_order_fresh]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [fk_order_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [fk_order_user]
GO
USE [master]
GO
ALTER DATABASE [fresh_supermarket] SET  READ_WRITE 
GO
