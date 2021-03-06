USE [master]
GO
/****** Object:  Database [Stoktakibi]    Script Date: 16.6.2022 02:40:56 ******/
CREATE DATABASE [Stoktakibi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stoktakibi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Stoktakibi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Stoktakibi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Stoktakibi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Stoktakibi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stoktakibi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stoktakibi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stoktakibi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stoktakibi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stoktakibi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stoktakibi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stoktakibi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stoktakibi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stoktakibi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stoktakibi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stoktakibi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stoktakibi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stoktakibi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stoktakibi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stoktakibi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stoktakibi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stoktakibi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stoktakibi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stoktakibi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stoktakibi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stoktakibi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stoktakibi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stoktakibi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stoktakibi] SET RECOVERY FULL 
GO
ALTER DATABASE [Stoktakibi] SET  MULTI_USER 
GO
ALTER DATABASE [Stoktakibi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stoktakibi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stoktakibi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stoktakibi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Stoktakibi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Stoktakibi] SET QUERY_STORE = OFF
GO
USE [Stoktakibi]
GO
/****** Object:  User [HP_\RÜKNA]    Script Date: 16.6.2022 02:40:57 ******/
CREATE USER [HP_\RÜKNA] FOR LOGIN [HP_\RÜKNA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [HP_\RÜKNA]
GO
/****** Object:  Table [dbo].[tblkategoriler]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkategoriler](
	[kategoriid] [int] IDENTITY(1,1) NOT NULL,
	[kategoriad] [varchar](50) NULL,
 CONSTRAINT [PK_tblkategoriler] PRIMARY KEY CLUSTERED 
(
	[kategoriid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblkullanici]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkullanici](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciadi] [varchar](50) NULL,
	[sifre] [varchar](50) NULL,
 CONSTRAINT [PK_tblkullanici] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblmusteriler]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmusteriler](
	[musteriid] [int] IDENTITY(1,1) NOT NULL,
	[musteriad] [varchar](50) NULL,
	[musterisoyad] [varchar](50) NULL,
 CONSTRAINT [PK_tblmusteriler] PRIMARY KEY CLUSTERED 
(
	[musteriid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblsatislar]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblsatislar](
	[satisid] [int] IDENTITY(1,1) NOT NULL,
	[urunid] [int] NULL,
	[musteriid] [int] NULL,
	[adet] [int] NULL,
	[fiyat] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblsatislar] PRIMARY KEY CLUSTERED 
(
	[satisid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblurunler]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblurunler](
	[urunid] [int] IDENTITY(1,1) NOT NULL,
	[urunad] [varchar](50) NULL,
	[marka] [varchar](50) NULL,
	[kategoriid] [int] NULL,
	[fiyat] [decimal](18, 0) NULL,
	[stok] [int] NULL,
 CONSTRAINT [PK_tblurun] PRIMARY KEY CLUSTERED 
(
	[urunid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblkategoriler] ON 

INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (1, N'Beyaz Eşyalar')
INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (2, N'Küçük Ev Aletleri')
INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (3, N'Bilgisayar')
INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (4, N'PC Ürünleri')
INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (3005, N'Telefon')
INSERT [dbo].[tblkategoriler] ([kategoriid], [kategoriad]) VALUES (3006, N'Telefon Ekipmanları')
SET IDENTITY_INSERT [dbo].[tblkategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[tblkullanici] ON 

INSERT [dbo].[tblkullanici] ([id], [kullaniciadi], [sifre]) VALUES (1, N'Rükna', N'1234')
SET IDENTITY_INSERT [dbo].[tblkullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[tblmusteriler] ON 

INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (1, N'Emel', N'Çınar')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2, N'Ali', N'Yıldız')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (3, N'Mehmet', N'Öztürk')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2009, N'İrem', N'Sevimli')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2010, N'Ahmet', N'Say')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2011, N'Deniz', N'Taş')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2012, N'Şule', N'Er')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2013, N'Nihal', N'Öz')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2014, N'Zeynep', N'Köse')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2015, N'Rükna', N'Kavraş')
INSERT [dbo].[tblmusteriler] ([musteriid], [musteriad], [musterisoyad]) VALUES (2016, N'Ayşenur', N'Uğuz')
SET IDENTITY_INSERT [dbo].[tblmusteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[tblsatislar] ON 

INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (1, 1, 1, 2, CAST(2500 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2, 2, 2, 1, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2004, 4, 1, 1, CAST(8500 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2006, 3, 3, 1, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2007, 4, 2009, 1, CAST(7000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2008, 5, 2010, 1, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2009, 6, 2011, 2, CAST(8000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2010, 7, 2012, 1, CAST(4250 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2011, 8, 2013, 3, CAST(15000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2012, 9, 2014, 2, CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2013, 7, 2015, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[tblsatislar] ([satisid], [urunid], [musteriid], [adet], [fiyat]) VALUES (2014, 5, 3, 1, CAST(4 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblsatislar] OFF
GO
SET IDENTITY_INSERT [dbo].[tblurunler] ON 

INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (1, N'Çamaşır Makinesi', N'Arçelik', 1, CAST(9000 AS Decimal(18, 0)), 15)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (2, N'Bulaşık Makinesi', N'Arçelik', 1, CAST(8500 AS Decimal(18, 0)), 10)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3, N'Su Isıtıcı', N'Vestel', 2, CAST(350 AS Decimal(18, 0)), 2)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (4, N'Ütü', N'Tefal', 2, CAST(1000 AS Decimal(18, 0)), 5)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (5, N'Buzdolabı', N'Regal', 1, CAST(2500 AS Decimal(18, 0)), 6)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (6, N'Laptop Nirvana', N'Toshiba', 3, CAST(3540 AS Decimal(18, 0)), 7)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (7, N'Laptop A5', N'Monster', 3, CAST(6500 AS Decimal(18, 0)), 8)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (8, N'HDD 250GB', N'Toshiba', 4, CAST(2500 AS Decimal(18, 0)), 9)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (9, N'SDD 250GB', N'Kingston', 4, CAST(2000 AS Decimal(18, 0)), 6)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3010, N'Yazıcı', N'Epson', 4, CAST(1500 AS Decimal(18, 0)), 7)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3012, N'Galaxy S22 128 GB', N'Samsung ', 3005, CAST(15000 AS Decimal(18, 0)), 10)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3013, N'Galaxy A32 128 GB', N'Samsung ', 3005, CAST(5000 AS Decimal(18, 0)), 15)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3014, N'iPhone 11 128 GB', N'Apple', 3005, CAST(15500 AS Decimal(18, 0)), 12)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3015, N'iPhone 13 Pro Max 128 GB', N'Apple', 3005, CAST(35000 AS Decimal(18, 0)), 10)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3016, N'Nova 9 SE 128 GB ', N'Huawei', 3005, CAST(6500 AS Decimal(18, 0)), 20)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3017, N'Reno 5 Lite 128 Gb ', N'Oppo', 3005, CAST(6000 AS Decimal(18, 0)), 9)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3018, N'Alumicable Micro USB Şarj Kablosu ', N'TTEC', 3006, CAST(60 AS Decimal(18, 0)), 15)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3019, N'Galaxy Buds2 Kablosuz Bluetooth Kulak İçi Kulaklık', N'Samsung ', 3006, CAST(300 AS Decimal(18, 0)), 25)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3020, N'EO-B3300 Level U2 Bluetooth Kulak İçi Kulaklık', N'Samsung ', 3006, CAST(350 AS Decimal(18, 0)), 15)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3021, N'12000mAh LED Taşınabilir Şarj Cihazı', N'SBS', 3006, CAST(200 AS Decimal(18, 0)), 10)
INSERT [dbo].[tblurunler] ([urunid], [urunad], [marka], [kategoriid], [fiyat], [stok]) VALUES (3027, N'10000 mah 15W Taşınabilir Şarj Cihazı', N'BELKIN ', 3006, CAST(250 AS Decimal(18, 0)), 10)
SET IDENTITY_INSERT [dbo].[tblurunler] OFF
GO
ALTER TABLE [dbo].[tblsatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblsatislar_tblmusteriler] FOREIGN KEY([musteriid])
REFERENCES [dbo].[tblmusteriler] ([musteriid])
GO
ALTER TABLE [dbo].[tblsatislar] CHECK CONSTRAINT [FK_tblsatislar_tblmusteriler]
GO
ALTER TABLE [dbo].[tblsatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblsatislar_tblurunler] FOREIGN KEY([urunid])
REFERENCES [dbo].[tblurunler] ([urunid])
GO
ALTER TABLE [dbo].[tblsatislar] CHECK CONSTRAINT [FK_tblsatislar_tblurunler]
GO
ALTER TABLE [dbo].[tblurunler]  WITH CHECK ADD  CONSTRAINT [FK_tblurunler_tblkategoriler] FOREIGN KEY([kategoriid])
REFERENCES [dbo].[tblkategoriler] ([kategoriid])
GO
ALTER TABLE [dbo].[tblurunler] CHECK CONSTRAINT [FK_tblurunler_tblkategoriler]
GO
/****** Object:  StoredProcedure [dbo].[kategoriekle]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kategoriekle]
@kategoriid int,
@kategoriad varchar(50)
as
if @kategoriid=0
insert into tblkategoriler(kategoriad) values (@kategoriad)
else
update tblkategoriler
set
kategoriad=@kategoriad
where kategoriid=@kategoriid
GO
/****** Object:  StoredProcedure [dbo].[kategorilistele]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kategorilistele]
as begin 
select*from  tblkategoriler
end
GO
/****** Object:  StoredProcedure [dbo].[kategorisilno]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kategorisilno]
@kategoriid int
as  
delete from  tblkategoriler where kategoriid=@kategoriid
GO
/****** Object:  StoredProcedure [dbo].[kategorisirala]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kategorisirala]
@kategoriid int
as  
select*from  tblkategoriler where kategoriid=@kategoriid
GO
/****** Object:  StoredProcedure [dbo].[musteriekle]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[musteriekle]
@musteriid int,
@musteriad varchar(50),
@musterisoyad varchar(50)
as
if @musteriid=0
insert into tblmusteriler(musteriad,musterisoyad) values (@musteriad,@musterisoyad)
else
update tblmusteriler
set
musteriad=@musteriad,
musterisoyad=@musterisoyad
where musteriid=@musteriid
GO
/****** Object:  StoredProcedure [dbo].[musterilistele]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[musterilistele]
as begin 
select*from  tblmusteriler
end
GO
/****** Object:  StoredProcedure [dbo].[musterisilno]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[musterisilno]
@musteriid int
as  
delete from  tblmusteriler where musteriid=@musteriid
GO
/****** Object:  StoredProcedure [dbo].[musterisirala]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[musterisirala]
@musteriid int
as  
select*from  tblmusteriler where musteriid=@musteriid
GO
/****** Object:  StoredProcedure [dbo].[satisekle]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[satisekle]
@satisid int,
@urunid int,
@musteriid int,
@adet int,
@fiyat decimal(18,0)
as
if @satisid=0
insert into tblsatislar(urunid,musteriid,adet,fiyat) values (@urunid,@musteriid,@adet,@fiyat)
else
update tblsatislar
set
urunid=@urunid,
musteriid=@musteriid,
adet=@adet,
fiyat=@fiyat
where satisid=@satisid
GO
/****** Object:  StoredProcedure [dbo].[satislistele]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[satislistele]
as begin 
select*from  tblsatislar
end
GO
/****** Object:  StoredProcedure [dbo].[satissilno]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[satissilno]
@satisid int
as  
delete from  tblsatislar where satisid=@satisid
GO
/****** Object:  StoredProcedure [dbo].[satissirala]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[satissirala]
@satisid int
as  
select*from  tblsatislar where satisid=@satisid
GO
/****** Object:  StoredProcedure [dbo].[urunekle]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[urunekle]
@urunid int,
@urunad varchar(50),
@marka varchar(50),
@kategoriid int,
@fiyat decimal(18,0),
@stok int
as
if @urunid=0
insert into tblurunler(urunad,marka,kategoriid,fiyat,stok) values (@urunad,@marka,@kategoriid,@fiyat,@stok)
else
update tblurunler
set
urunad=@urunad,
marka=@marka,
kategoriid=@kategoriid,
fiyat=@fiyat,
stok=@stok
where urunid=@urunid
GO
/****** Object:  StoredProcedure [dbo].[urunlistele]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[urunlistele]
as begin 
select*from  tblurunler
end
GO
/****** Object:  StoredProcedure [dbo].[urunsilno]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[urunsilno]
@urunid int
as  
delete from  tblurunler where urunid=@urunid
GO
/****** Object:  StoredProcedure [dbo].[urunsirala]    Script Date: 16.6.2022 02:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[urunsirala]
@urunid int
as  
select*from  tblurunler where urunid=@urunid
GO
USE [master]
GO
ALTER DATABASE [Stoktakibi] SET  READ_WRITE 
GO
