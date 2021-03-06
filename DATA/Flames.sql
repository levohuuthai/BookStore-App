USE [Flames]
GO
ALTER TABLE [dbo].[TaiKhoan] DROP CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[Sach] DROP CONSTRAINT [FK_Sach_LoaiSach]
GO
ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[DungCuHocTap] DROP CONSTRAINT [FK_DungCuHocTap_LoaiDungCuHocTap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach] DROP CONSTRAINT [FK_ChiTietHoaDonSach_Sach]
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach] DROP CONSTRAINT [FK_ChiTietHoaDonSach_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT] DROP CONSTRAINT [FK_ChiTietHoaDonDungCuHT_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT] DROP CONSTRAINT [FK_ChiTietHoaDonDungCuHT_DungCuHocTap]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiKhoan]') AND type in (N'U'))
DROP TABLE [dbo].[TaiKhoan]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sach]') AND type in (N'U'))
DROP TABLE [dbo].[Sach]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type in (N'U'))
DROP TABLE [dbo].[NhanVien]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiSach]') AND type in (N'U'))
DROP TABLE [dbo].[LoaiSach]
GO
/****** Object:  Table [dbo].[LoaiDungCuHocTap]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiDungCuHocTap]') AND type in (N'U'))
DROP TABLE [dbo].[LoaiDungCuHocTap]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang]') AND type in (N'U'))
DROP TABLE [dbo].[KhachHang]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDon]') AND type in (N'U'))
DROP TABLE [dbo].[HoaDon]
GO
/****** Object:  Table [dbo].[DungCuHocTap]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DungCuHocTap]') AND type in (N'U'))
DROP TABLE [dbo].[DungCuHocTap]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonSach]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDonSach]') AND type in (N'U'))
DROP TABLE [dbo].[ChiTietHoaDonSach]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonDungCuHT]    Script Date: 12/21/2021 6:34:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDonDungCuHT]') AND type in (N'U'))
DROP TABLE [dbo].[ChiTietHoaDonDungCuHT]
GO
USE [master]
GO
/****** Object:  Database [Flames]    Script Date: 12/21/2021 6:34:44 PM ******/
DROP DATABASE [Flames]
GO
/****** Object:  Database [Flames]    Script Date: 12/21/2021 6:34:44 PM ******/
CREATE DATABASE [Flames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyFlames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THAILE\MSSQL\DATA\Flames1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyFlames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THAILE\MSSQL\DATA\Flames1_log.log' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Flames] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Flames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Flames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Flames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Flames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Flames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Flames] SET ARITHABORT OFF 
GO
ALTER DATABASE [Flames] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Flames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Flames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Flames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Flames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Flames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Flames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Flames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Flames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Flames] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Flames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Flames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Flames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Flames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Flames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Flames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Flames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Flames] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Flames] SET  MULTI_USER 
GO
ALTER DATABASE [Flames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Flames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Flames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Flames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Flames] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Flames', N'ON'
GO
ALTER DATABASE [Flames] SET QUERY_STORE = OFF
GO
USE [Flames]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonDungCuHT]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonDungCuHT](
	[maDCHT] [nvarchar](50) NOT NULL,
	[soLuong] [int] NULL,
	[thanhTien] [money] NULL,
	[maHoaDon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDonDungCuHT] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maDCHT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonSach]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonSach](
	[maSach] [nvarchar](50) NOT NULL,
	[soLuong] [int] NULL,
	[thanhTien] [money] NULL,
	[maHoaDon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDonSach] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DungCuHocTap]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DungCuHocTap](
	[maSanPham] [nvarchar](50) NOT NULL,
	[tenSanPham] [nvarchar](100) NOT NULL,
	[donGia] [money] NOT NULL,
	[nhaCungCap] [nvarchar](100) NOT NULL,
	[soLuong] [int] NOT NULL,
	[hinhAnh] [nvarchar](50) NULL,
	[thuongHieu] [nvarchar](100) NOT NULL,
	[xuatXu] [nvarchar](50) NOT NULL,
	[chatLieu] [nvarchar](50) NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[loaiSanPham] [nvarchar](50) NOT NULL,
	[maLoaiDungCuHocTap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DungCuHocTap] PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [nvarchar](50) NOT NULL,
	[ngayLapHoaDon] [datetime] NOT NULL,
	[tongTien] [money] NOT NULL,
	[maKhachHang] [nvarchar](50) NOT NULL,
	[maNhanVien] [nvarchar](50) NOT NULL,
	[tongSoLuong] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [nvarchar](50) NOT NULL,
	[tenKhachHang] [nvarchar](100) NOT NULL,
	[soDienThoai] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDungCuHocTap]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDungCuHocTap](
	[maLoaiDungCuHocTap] [nvarchar](50) NOT NULL,
	[tenLoaiDungCuHocTap] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LoaiDungCuHocTap] PRIMARY KEY CLUSTERED 
(
	[maLoaiDungCuHocTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[maLoaiSach] [nvarchar](50) NOT NULL,
	[tenLoaiSach] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LoaiSach] PRIMARY KEY CLUSTERED 
(
	[maLoaiSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanVien] [nvarchar](50) NOT NULL,
	[tenNhanVien] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](50) NOT NULL,
	[gioiTinh] [nvarchar](50) NOT NULL,
	[chucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[maSanPham] [nvarchar](50) NOT NULL,
	[tenSanPham] [nvarchar](100) NOT NULL,
	[donGia] [money] NOT NULL,
	[nhaCungCap] [nvarchar](100) NOT NULL,
	[soLuong] [int] NOT NULL,
	[tacGia] [nvarchar](50) NOT NULL,
	[namXuatBan] [int] NOT NULL,
	[nhaXuatBan] [nvarchar](100) NOT NULL,
	[hinhAnh] [nvarchar](50) NULL,
	[soTrang] [int] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[loaiSanPham] [nvarchar](50) NOT NULL,
	[maLoaiSach] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/21/2021 6:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[tenTaiKhoan] [nvarchar](50) NOT NULL,
	[matKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[tenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0004', 2, 31000.0000, N'HD0011')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0004', 4, 62000.0000, N'HD0015')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0005', 2, 16000.0000, N'HD0020')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0005', 2, 16000.0000, N'HD0021')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0006', 2, 36000.0000, N'HD0024')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0006', 2, 36000.0000, N'HD0025')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0010', 1, 6500.0000, N'HD0026')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0001', 2, 7000.0000, N'HD0057')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0003', 1, 6000.0000, N'HD0059')
INSERT [dbo].[ChiTietHoaDonDungCuHT] ([maDCHT], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPDCHT0001', 2, 7000.0000, N'HD008')
GO
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 2, 126000.0000, N'HD001')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0005', 3, 264000.0000, N'HD0010')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0018', 1, 21000.0000, N'HD0011')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0021', 1, 12000.0000, N'HD0012')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0023', 1, 18000.0000, N'HD0012')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0010', 2, 160000.0000, N'HD0013')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0035', 2, 20000.0000, N'HD0014')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0050', 1, 12000.0000, N'HD0015')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0045', 1, 350000.0000, N'HD0016')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0056', 2, 340000.0000, N'HD0017')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0061', 2, 34000.0000, N'HD0018')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0019', 1, 20000.0000, N'HD0019')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0048', 3, 594000.0000, N'HD002')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0017', 1, 111000.0000, N'HD0020')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0017', 1, 111000.0000, N'HD0021')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0045', 2, 700000.0000, N'HD0022')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0046', 3, 285000.0000, N'HD0023')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0050', 1, 12000.0000, N'HD0026')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0004', 3, 90000.0000, N'HD0027')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0002', 1, 48000.0000, N'HD0028')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 2, 77400.0000, N'HD0029')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0005', 1, 88000.0000, N'HD003')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 1, 38700.0000, N'HD0030')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 1, 38700.0000, N'HD0031')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 1, 38700.0000, N'HD0032')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0045', 1, 350000.0000, N'HD0033')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0034')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0035')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0036')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0037')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0038')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0039')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0008', 4, 220000.0000, N'HD004')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0040')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0041')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 1, 38700.0000, N'HD0042')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 2, 126000.0000, N'HD0043')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0006', 1, 90000.0000, N'HD0044')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0005', 1, 88000.0000, N'HD0045')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0046')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0047')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 2, 126000.0000, N'HD0048')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0049')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD005')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0050')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0048', 1, 198000.0000, N'HD0050')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0051')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0047', 1, 139000.0000, N'HD0052')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0048', 1, 198000.0000, N'HD0052')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0047', 1, 139000.0000, N'HD0053')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0048', 1, 198000.0000, N'HD0053')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0004', 2, 60000.0000, N'HD0054')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0001', 1, 63000.0000, N'HD0055')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0054', 2, 77400.0000, N'HD0056')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0045', 1, 350000.0000, N'HD0057')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0044', 2, 780000.0000, N'HD0058')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0005', 4, 352000.0000, N'HD0059')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0007', 4, 140000.0000, N'HD006')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0005', 2, 176000.0000, N'HD0060')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0009', 1, 76000.0000, N'HD0061')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0010', 1, 80000.0000, N'HD0061')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0021', 3, 36000.0000, N'HD0062')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0018', 7, 147000.0000, N'HD0063')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0012', 2, 258000.0000, N'HD007')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0035', 1, 10000.0000, N'HD008')
INSERT [dbo].[ChiTietHoaDonSach] ([maSach], [soLuong], [thanhTien], [maHoaDon]) VALUES (N'SPS0006', 3, 270000.0000, N'HD009')
GO
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0001', N'Bút Bi 0.5mm Stacom BP1025 - Mực Đỏ', 3500.0000, N'Cty Văn Phòng Sáng Tạo (Stacom)', 11, N'img\\butbimucdo.jpg', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0002', N'Bút Bi Bấm Cello Glyder XS - Mực Đen', 6500.0000, N'Cty Sao Thăng Long', 326, N'img\\butbibamCello.jpg', N'Cello', N'Ấn Độ', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0003', N'Bút Chì Gỗ 2B Princess - ClassMate PC01-PR - Màu Hồng', 6000.0000, N'Cty VPP Trung Kiên', 38, N'img\\butchi2bVang.jpg', N'ClassMate', N'Việt Nam', N'Gỗ', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0004', N'Bút Bi Bấm 3 Ngòi Hình Thú - Con Lười', 15500.0000, N'Cty TM Hạnh Thuận', 98, N'img\\butbibamConluoi.jpg', N'OEM', N'Trung Quốc', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0005', N'Bút Dạ Quang G-Star GS-045 - Màu Vàng', 8000.0000, N'Cty TM Hạnh Thuận', 24, N'img\\butDaQuangVang.jpg', N'Gstar', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0006', N'Bút Dạ Quang Schneider Job 1502 - Màu Đỏ', 18000.0000, N'Schneider Schreibgeräte GmbH', 387, N'img\\butDaQuang1502Do.jpg', N'Schneider', N'Đức', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0007', N'Thước Maped Start 30cm 146109', 15000.0000, N'Văn Phòng Phẩm Maped', 104, N'img\\thuocmapped.jpg', N'Maped', N'Pháp', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0002')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0008', N'Thước Thẳng 50cm WinQ T-50', 21500.0000, N'Công Ty TNHH Sản Xuất Thương Mại Qui Lực Long An', 89, N'img\\thuocthangT50.jpg', N'WinQ', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0002')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0009', N'Bộ 2 Cây Thước Parabol WinQ QL-02 - Màu Xanh', 9000.0000, N'Công Ty TNHH Sản Xuất Thương Mại Qui Lực Long An', 48, N'img\\parabolQL02.jpg', N'WinQ', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0002')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0010', N'Thước Eke Lớn No-6', 6500.0000, N'	Công Ty TNHH Sản Xuất Thương Mại Qui Lực Long An', 139, N'img\\ekeNo6.jpg', N'WinQ', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0002')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0011', N'Vỉ 4 Bút Bi Nhiều Màu  Stacom - VBP1035-C- Mực Xanh Tặng Kèm Ngẫu Nhiên 1 Bút Chì Hoặc 1 Bút Bi', 13000.0000, N'Cty Văn Phòng Sáng Tạo (Stacom)', 17, N'img\\vi4but.jpg', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0012', N'Gôm Tẩy Doraemon Campus ER-DOR-30 - Màu Xanh Dương', 9000.0000, N'Kokuyo', 575, N'img\\GomERO30.jpg', N'Campus', N'Việt Nam', N'Cao su', 1, N'Dụng cụ học tập', N'LDCHT0003')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0013', N'Gôm Tẩy Iwako Hình Xe Máy - Màu Vàng', 15000.0000, N'Cty Fabico', 24, N'img\\gomIwako.jpg', N'iwako', N'Nhật Bản', N'Cao su', 1, N'Dụng cụ học tập ', N'LDCHT0003')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0014', N'Gôm Mono - Tombow PE-01AB', 15500.0000, N'Công Ty TNHH Thai Seng Việt Nam', 119, N'img\\gomMono.jpg', N'Tombow', N'Nhật Bản', N'Cao su', 1, N'Dụng cụ học tập', N'LDCHT0003')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0015', N'Bộ Compa Kèm Bút Chì Kim - Deli-G20002 - Màu Xanh', 35500.0000, N'Cty Hoàng Bách Nguyên', 222, N'img\\CompaDeliXanh.jpg', N'Deli', N'Trung Quốc', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0004')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0016', N'Bộ Compa Kèm Bút Chì Gỗ - Maped 199111', 32000.0000, N'Văn Phòng Phẩm Maped', 101, N'img\\compaMapped.jpg', N'Maped', N'Pháp', N'Nhựa, Kim loại', 1, N'Dụng cụ học tập', N'LDCHT0004')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0017', N'Bóp Viết Vải TGA 7294 - Màu Đen', 90000.0000, N'Cty TM Hạnh Thuận', 335, N'img\\bopvietTGA.jpg', N'BoShiTu', N'Trung Quốc', N'Vải', 1, N'Dụng cụ học tập', N'LDCHT0005')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0018', N'Vở Class Biệt Đội Nhí - 5 Ô Ly 96 Trang - Hồng Hà 0437 - Mẫu 4', 9000.0000, N'Cty VPP Hồng Hà', 2, N'img\\voBietDoiNhi.jpg', N'Hồng Hà', N'Việt Nam', N'Giấy', 1, N'Dụng cụ học tập', N'LDCHT0006')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0019', N'Vở Học Sinh 4 Ô Ly 100 Trang ĐL 100g/m2 - Elephant FI614522 - Hình Ếch', 13500.0000, N'Cty Fabico', 0, N'img\\voElephant.jpg', N'Crabit Notebuck', N'Thái Lan', N'Giấy', 0, N'Dụng cụ học tập', N'LDCHT0006')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0020', N'Vở Kẻ Ngang 80 Trang - Crabit Notebuck 1113 - Giraffe', 11500.0000, N'Crabit Kidbooks', 0, N'img\\vokengangcrabit.jpg', N'Crabit Notebuck', N'Việt Nam', N'Giấy', 1, N'Dụng cụ học tập', N'LDCHT0006')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0021', N'Bóp Viết Vải - BoShiTu TGA 7295 - Màu Xanh Xám', 99000.0000, N'Cty TM Hạnh Thuận', 2, N'img\\bopvietboshitu.jpg', N'Stacom', N'Trung Quốc', N'Vải', 1, N'Dụng cụ học tập', N'LDCHT0005')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0022', N'Bút Bic 4 Màu - Thân Bút Xanh Lá', 11000.0000, N'Cty TM Hạnh Thuận', 111, N'img\\9900000037284-mau2-_1_.jpg', N'OEM', N'Trung Quốc', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0023', N'Bộ Compa Kèm Ngòi Chì Gstar GS-04 - Màu Tím', 13500.0000, N'Nhà Xuất Bản Kim Đồng', 245, N'img\\compaGstarTim.jpg', N'Gstar', N'Việt Nam', N'Nhựa, Kim loại', 1, N'Dụng cụ học tập', N'LDCHT0004')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0024', N'Bộ Compa Kèm Bút Chì Gỗ - Gstar GS-02 - Màu Hồng', 19000.0000, N'Cty TM Hạnh Thuận', 155, N'img\\8936122450824-mau1_1.jpg', N'Gstar', N'Việt Nam', N'Nhựa, Kim loại', 1, N'Dụng cụ học tập', N'LDCHT0004')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0025', N'Bộ 4 Thước Dẻo 18 cm - XiaoQingWa TY-1058 - Màu Hồng', 32000.0000, N'Cty Văn Phòng Sáng Tạo (Stacom)', 28, N'img\\bo4thuocdeo.jpg', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0026', N'Thước Nhôm Baojing BJ-3103 - Màu Bạc', 19000.0000, N'Cty Văn Phòng Sáng Tạo (Stacom)', 25, N'img\\thuocnhombaoji.jpg', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0027', N'Bút chì bấm', 80000.0000, N'NXB Trẻ', 35, N'img\\chuacohinhanh.png', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0001')
INSERT [dbo].[DungCuHocTap] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [hinhAnh], [thuongHieu], [xuatXu], [chatLieu], [tinhTrang], [loaiSanPham], [maLoaiDungCuHocTap]) VALUES (N'SPDCHT0028', N'Thước kẻ', 30000.0000, N'Nhà Xuất Bản Kim Đồng', 150, N'img\\chuacohinhanh.png', N'Stacom', N'Việt Nam', N'Nhựa', 1, N'Dụng cụ học tập', N'LDCHT0002')
GO
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD001', CAST(N'2021-01-26T21:07:12.183' AS DateTime), 126000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0010', CAST(N'2021-01-06T21:56:34.843' AS DateTime), 264000.0000, N'KH018', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0011', CAST(N'2021-02-27T22:01:13.597' AS DateTime), 52000.0000, N'KH017', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0012', CAST(N'2021-02-22T22:07:05.503' AS DateTime), 30000.0000, N'KH020', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0013', CAST(N'2021-01-25T22:08:52.047' AS DateTime), 160000.0000, N'KH016', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0014', CAST(N'2021-03-26T22:21:53.970' AS DateTime), 20000.0000, N'KH001', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0015', CAST(N'2021-03-20T22:27:09.907' AS DateTime), 74000.0000, N'KH002', N'NV001', 5)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0016', CAST(N'2021-11-26T22:36:14.810' AS DateTime), 350000.0000, N'KH009', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0017', CAST(N'2021-04-16T22:37:21.193' AS DateTime), 340000.0000, N'KH005', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0018', CAST(N'2021-05-26T22:40:42.870' AS DateTime), 34000.0000, N'KH005', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0019', CAST(N'2021-04-20T22:43:42.743' AS DateTime), 20000.0000, N'KH010', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD002', CAST(N'2021-06-18T21:07:55.973' AS DateTime), 594000.0000, N'KH006', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0020', CAST(N'2021-07-11T22:50:00.497' AS DateTime), 127000.0000, N'KH011', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0021', CAST(N'2021-08-02T22:50:27.297' AS DateTime), 127000.0000, N'KH011', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0022', CAST(N'2021-05-12T22:58:31.337' AS DateTime), 700000.0000, N'KH014', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0023', CAST(N'2021-09-30T23:03:42.970' AS DateTime), 285000.0000, N'KH011', N'NV002', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0024', CAST(N'2021-10-01T23:04:26.323' AS DateTime), 36000.0000, N'KH011', N'NV002', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0025', CAST(N'2021-11-30T23:05:12.513' AS DateTime), 36000.0000, N'KH011', N'NV002', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0026', CAST(N'2021-12-12T23:07:21.340' AS DateTime), 18500.0000, N'KH011', N'NV002', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0027', CAST(N'2021-01-07T20:35:17.943' AS DateTime), 90000.0000, N'KH008', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0028', CAST(N'2021-02-14T20:38:43.070' AS DateTime), 48000.0000, N'KH007', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0029', CAST(N'2021-03-03T11:11:39.333' AS DateTime), 77400.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD003', CAST(N'2021-04-08T21:12:31.227' AS DateTime), 88000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0030', CAST(N'2021-05-28T11:13:44.520' AS DateTime), 38700.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0031', CAST(N'2021-06-01T11:47:39.160' AS DateTime), 38700.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0032', CAST(N'2021-07-20T11:51:53.983' AS DateTime), 38700.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0033', CAST(N'2021-08-10T12:00:58.890' AS DateTime), 350000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0034', CAST(N'2021-09-09T12:11:28.747' AS DateTime), 63000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0035', CAST(N'2021-10-10T14:18:44.497' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0036', CAST(N'2021-11-28T14:24:49.537' AS DateTime), 63000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0037', CAST(N'2021-12-18T14:28:50.973' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0038', CAST(N'2020-11-28T14:32:14.223' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0039', CAST(N'2020-01-27T14:42:32.863' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD004', CAST(N'2021-11-26T21:18:00.540' AS DateTime), 220000.0000, N'KH008', N'NV001', 4)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0040', CAST(N'2021-01-28T14:47:14.817' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0041', CAST(N'2021-02-28T14:49:23.047' AS DateTime), 63000.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0042', CAST(N'2021-03-28T14:51:59.440' AS DateTime), 38700.0000, N'KH006', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0043', CAST(N'2021-12-01T18:39:41.593' AS DateTime), 126000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0044', CAST(N'2021-12-01T19:09:14.197' AS DateTime), 90000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0045', CAST(N'2021-12-03T09:04:10.673' AS DateTime), 88000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0046', CAST(N'2021-12-03T09:29:52.067' AS DateTime), 63000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0047', CAST(N'2020-12-03T16:57:47.597' AS DateTime), 63000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0048', CAST(N'2021-12-03T17:18:55.087' AS DateTime), 126000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0049', CAST(N'2020-12-07T17:22:03.970' AS DateTime), 63000.0000, N'KH007', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD005', CAST(N'2021-11-26T21:26:55.837' AS DateTime), 63000.0000, N'KH007', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0050', CAST(N'2021-12-06T17:21:15.917' AS DateTime), 261000.0000, N'KH006', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0051', CAST(N'2020-11-06T17:23:37.327' AS DateTime), 63000.0000, N'KH008', N'NV001', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0052', CAST(N'2020-12-06T23:07:51.173' AS DateTime), 337000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0053', CAST(N'2021-06-06T23:10:19.037' AS DateTime), 337000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0054', CAST(N'2020-12-06T23:38:50.807' AS DateTime), 60000.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0055', CAST(N'2021-12-07T17:54:26.787' AS DateTime), 63000.0000, N'KH008', N'NV002', 1)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0056', CAST(N'2021-12-20T21:31:48.377' AS DateTime), 77400.0000, N'KH008', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0057', CAST(N'2021-12-20T21:32:59.987' AS DateTime), 357000.0000, N'KH009', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0058', CAST(N'2021-12-20T21:35:38.043' AS DateTime), 780000.0000, N'KH011', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0059', CAST(N'2021-12-20T21:38:48.290' AS DateTime), 358000.0000, N'KH012', N'NV001', 5)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD006', CAST(N'2021-09-27T21:29:29.657' AS DateTime), 140000.0000, N'KH008', N'NV001', 4)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0060', CAST(N'2021-12-20T21:42:06.957' AS DateTime), 176000.0000, N'KH018', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0061', CAST(N'2021-12-20T21:43:42.000' AS DateTime), 156000.0000, N'KH019', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0062', CAST(N'2021-12-20T21:45:11.060' AS DateTime), 36000.0000, N'KH020', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD0063', CAST(N'2021-12-20T22:28:36.800' AS DateTime), 147000.0000, N'KH008', N'NV001', 7)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD007', CAST(N'2021-09-26T21:42:23.523' AS DateTime), 258000.0000, N'KH007', N'NV001', 2)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD008', CAST(N'2021-10-26T21:46:09.593' AS DateTime), 17000.0000, N'KH005', N'NV001', 3)
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayLapHoaDon], [tongTien], [maKhachHang], [maNhanVien], [tongSoLuong]) VALUES (N'HD009', CAST(N'2021-11-26T21:48:36.597' AS DateTime), 270000.0000, N'KH011', N'NV001', 3)
GO
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH001', N'Trịnh Gia Phúc', N'0961814312', N'Phường 1, Quận 1')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH002', N'Đinh Quang Huy', N'0704965849', N'Phường 4, Gò Vấp')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH003', N'Nguyễn Thị Bích Hoa', N'0704918126', N'Phường 3, Tân Bình')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH004', N'Trần Thị Trúc Ly', N'0705230134', N'Phường 12, Quận Bình Thạnh')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH005', N'Lê Quang Kiệt', N'0705230134', N'Phường 7, Quận 12')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH006', N'Phùng Trọng Nghĩa', N'0789695482', N'Phường 7, Quận Tân Bình')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH007', N'Phan Thu Thủy', N'0335726133', N'Phường 5, Quận 3')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH008', N'Đỗ Thành An', N'0974006652', N'Phường 10, Quận 12')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH009', N'Võ Nguyễn Mỹ Nhi', N'0705532147', N'Gò Vấp,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH010', N'Trịnh Thị Kim Tiền', N'0706054990', N'Quận 5,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH011', N'Ngô Thị Thu Hà', N'0706081398', N'Quận 7,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH012', N'Lê Thị Thu Hương', N'0706139471', N'Quận 4,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH013', N'Lê Anh Tuần', N'0706155502', N'Gò Vấp,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH014', N'Phạm Ngọc Cảnh', N'0706230654', N'Thủ Đức,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH015', N'Lê Đức Hoà', N'0877209220', N'Quận 1,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH016', N'Trần Việt Cường', N'0877209547', N'Gò Vấp,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH017', N'Lê Thị Thuý Diễm', N'0877210940', N'Tân Bình,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH018', N'Đỗ Thị Trà My', N'0877213656', N'Tân Phú,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH019', N'Nguyễn Thanh Tùng', N'0877216265', N'Gò Vấp,TPHCM')
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [soDienThoai], [diaChi]) VALUES (N'KH020', N'Đặng Thị Tú Uyên', N'0877216992', N'Quận 2,TPHCM')
GO
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0001', N'Bút')
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0002', N'Thước')
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0003', N'Gôm - Tẩy')
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0004', N'Compa')
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0005', N'Hộp Bút')
INSERT [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap], [tenLoaiDungCuHocTap]) VALUES (N'LDCHT0006', N'Tập - Vở')
GO
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0001', N'Văn Học')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0002', N'Kinh Tế')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0003', N'Tâm Lý')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0004', N'Sách Thiếu Nhi')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0005', N'Sách Giáo Khoa')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0006', N'Ngoại Ngữ')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0007', N'Khoa Học - Kỹ Thuật')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0008', N'Dạy Nấu Ăn')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0009', N'Âm Nhạc - Mỹ Thuật - Thời Trang')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS0010', N'Báo - Tạp Chí')
GO
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV001', N'Đỗ Thị Tường Vi', N'dothituongviplic@gmail.com', N'Tân Bình, TPHCM', N'0327750154', N'Nữ', N'Chủ Cửa Hàng')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV002', N'Lê Võ Hữu Thái', N'thai@gmail.com', N'Gò Vấp, TPHCM', N'0967650473', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV003', N'Nguyễn Thành Luân', N'luan@gmail.com', N'Quận 12,TPHCM', N'0973241753', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV004', N'Đoàn Hữu Phúc', N'phuc@gmail.com', N'Quận 1, TPHCM', N'0973853942', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV005', N'Huỳnh Võ Hoàng Yến', N'yen@gmail.com', N'Quận 1,TPHCM', N'0961266760', N'Nữ', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV006', N'Nguyễn Trúc Vy', N'vynguyen@gmail.com', N'Củ Chi, TPHCM', N'0961461514', N'Nữ', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV007', N'Trần Anh Dũng', N'dungtran@gmail.com', N'Quận 1,TPHCM', N'0961489437', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV008', N'Nguyễn Gia Phát', N'phatgia@gmail.com', N'Phú Nhuận,TPHCM', N'0961492540', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV009', N'Lê Đức Trung', N'trung@gmail.com', N'Quận 6, TPHCM', N'0961647370', N'Nam', N'Nhân Viên')
INSERT [dbo].[NhanVien] ([maNhanVien], [tenNhanVien], [email], [diaChi], [soDienThoai], [gioiTinh], [chucVu]) VALUES (N'NV010', N'Nguyễn Hoàng Nhi', N'nhinhi@gmail.com', N'Gò Vấp, TPHCM', N'0961694223', N'Nữ', N'Nhân Viên')
GO
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0001', N'Kính Vạn Hoa - 14 - Lang Thang Trong Rừng - Kho Báu Dưới Hồ - Gia Sư (Tái Bản 2019)', 63000.0000, N'Nhà Xuất Bản Kim Đồng', 121, N'Nguyễn Nhật Ánh', 2000, N'NXB Văn Học', N'img\\kinh-van-hoa.jpg', 200, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0002', N'Thơ Hàn Mặc Tử - Văn Học Trong Nhà Trường  ', 48000.0000, N'Nhà Xuất Bản Kim Đồng', 125, N'Hàn Mặc Tử', 2021, N'NXB Văn Học', N'img\\tho-han-mac-tu.jpg', 180, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0003', N'Khéo Ăn Khéo Nói Sẽ Có Được Thiên Hạ (Tái Bản 2018)', 260000.0000, N'Nhà Xuất Bản Kim Đồng', 72, N'Trác Nhã', 2018, N'NXB Văn Học', N'img\\keo-an-noi.jpg', 406, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0004', N'Nhật Ký Trong Tù (Tái Bản 2020)', 30000.0000, N'Cty Văn Hóa Khang Việt', 80, N'Hồ Chí Minh', 2018, N'NXB Dân Trí', N'img\\nhat-ky-trong-tu.jpg', 121, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0005', N'Truyện Thúy Kiều', 88000.0000, N'Cty Văn Hóa Minh Lâm', 32, N'Nguyễn Du', 2021, N'NXB Hồng Đức', N'img\\truyen-kieu.jpg', 230, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0006', N'Phơi Cơn Mưa Lên Chiều', 90000.0000, N'NGUYỄN NGỌC HẠNH', 19, N'Nguyễn Ngọc Hạnh', 2018, N'NXB Hội Nhà Văn', N'img\\phoi-len-con-mua-chieu.jpg', 140, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0007', N'Văn Học Trong Nhà Trường: Thơ Xuân Quỳnh', 35000.0000, N'Nhà Xuất Bản Kim Đồng', 240, N'Xuân Quỳnh', 2019, N'NXB Kim Đồng', N'img\\van-hoc-trong-nha-truong.jpg', 120, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0008', N'Xuân Quỳnh - Một Nửa Cuộc Đời Tôi', 55000.0000, N'Nhà Xuất Bản Kim Đồng', 29, N'Đông Mai', 2018, N'NXB Kim Đồng', N'img\\mot-nua-cuoc-doi-toi.jpg', 164, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0009', N'Nhật Ký Đặng Thùy Trâm (Tái Bản 2018)', 76000.0000, N'Nhã Nam', 32, N'Đặng Thuỳ Trâm', 2018, N'NXB Hội Nhà Văn', N'img\\nhat-ky-dang-thuy-tram.jpg', 290, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0010', N'Nhà Lãnh Đạo Không Chức Danh', 80000.0000, N'NXB Trẻ', 167, N'Robin Sharma', 2018, N'NXB Trẻ', N'img\\nha-lanh-dao.jpg', 270, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0011', N'Một Đời Quản Trị (Tái Bản 2019)', 170000.0000, N'NXB Trẻ', 115, N'Phan Văn Trường', 2019, N'NXB Trẻ', N'img\\mot-doi-quan-tri.jpg', 492, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0012', N'KPI - Công Cụ Quản Lý Nhân Sự Hiệu Quả', 129000.0000, N'1980 Books', 101, N'Ryuichiro Nakao', 2018, N'NXB Kinh Tế Quốc Dân', N'img\\KPI.jpg', 350, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0013', N'Đừng Làm Nhân Viên Nổi Khùng', 79000.0000, N'ZenBooks', 11, N'James Adonis', 2017, N'NXB Đà Nẵng', N'img\\dung_lam_nhan_vien_noi_khung.jpg', 218, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0014', N'Vận Dụng Khoa Nhân Tướng Học Trong Ứng Xử Và Quản Lý (Tái Bản 2019)', 128000.0000, N'Cty Văn Hóa Văn Lang', 144, N'Việt Chương', 2019, N'NXB Hồng Đức', N'img\\van-dung-nhan-tuong-hoc.jpg', 336, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0015', N'Thấu Hiểu Tiếp Thị Từ A Đến Z - 80 Khái Niệm Nhà Quản Lý Cần Biết (Tái Bản 2020)', 115000.0000, N'NXB Trẻ', 55, N'Philip Kotler', 2020, N'NXB Trẻ', N'img\\thau-hieu-tiep-thi.jpg', 298, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0016', N'Đột Phá Tư Duy Thương Hiệu', 120000.0000, N'Saigon Books', 25, N'Jeff Rosenblum, Jordan Berg', 2018, N'NXB Lao Động', N'img\\dot-pha-tu-duy-thuong-hieu.jpg', 280, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0017', N'Quảng Cáo Tự Nhiên', 111000.0000, N'Hải Đăng', 247, N'Dale Lovell', 2018, N'NXB Lao Động', N'img\\quang-cao-tu-nhien-front.jpg', 210, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0018', N'Nhà Có 5 Nàng Dâu - Tập 1', 21000.0000, N'Nhà Xuất Bản Kim Đồng', 4, N'Negi Haruba', 2021, N'NXB Văn Học', N'img\\ncnnd1db.jpg', 192, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0019', N'Thám Tử Lừng Danh Conan - Tập 93 (Tái Bản 2019)', 20000.0000, N'Nhà Xuất Bản Kim Đồng', 110, N'Gosho Aoyama', 2019, N'NXB Kim Đồng', N'img\\conan93.jpg', 184, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0020', N'Trạng Quỷnh Tập 252 - Đánh Con Quan', 12000.0000, N'Nhà Xuất Bản Kim Đồng', 100, N'Kim Khánh', 2020, N'NXB Văn Học', N'img\\trangquynh252.jpg', 120, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0021', N'Trạng Quỷnh Tập 409 - Thím Mắm Chủ Nợ', 12000.0000, N'CÔNG TY TNHH IN ẤN-DV-TM SIÊU TỐC', 50, N'Kim Khánh', 2020, N'NXB Đồng Nai', N'img\\trangquynh409.jpg', 120, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0022', N'Truyện Tranh Trạng Quỷnh - Tập 304: Vì Phải Đền Ơn', 12000.0000, N'CÔNG TY TNHH IN ẤN-DV-TM SIÊU TỐC', 25, N'Kim Khánh', 2020, N'NXB Đồng Nai', N'img\\trangquynh304.jpg', 120, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0023', N'Doraemon Truyện Dài - Tập 1 - Chú Khủng Long Của Nobita (Tái Bản 2019)', 18000.0000, N'Nhà Xuất Bản Kim Đồng', 54, N'Fujiko F Fujio, Mugiwara Shintaro', 2019, N'NXB Văn Học', N'img\\doraemon1.jpg', 192, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0024', N'Giải Thích Ngữ Pháp Tiếng Anh (Bài Tập & Đáp Án) (Tái Bản 2019)', 220000.0000, N'Nhà Xuất Bản Kim Đồng', 1, N'Mai Lan Hương, Hà Thanh Uyên', 2019, N'NXB Văn Học', N'img\\ngoaingu1.jpg', 536, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0025', N'Hướng Dẫn Sử Dụng Ngữ Pháp Tiếng Anh', 179000.0000, N'MCBooks', 55, N'The Windy', 2020, N'NXB Hồng Đức', N'img\\nn2.jpg', 288, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0026', N'Sổ Tay Tiếng Anh Lớp 11 (2021)', 28000.0000, N'Nhà Xuất Bản Kim Đồng', 1, N'Mai Lan Hương, Hà Thanh Uyên', 2021, N'NXB Văn Học', N'img\\nn3.jpg', 80, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0027', N'Trên Đường Băng (Tái Bản 2017)', 80000.0000, N'Nhà Xuất Bản Kim Đồng', 32, N'Tony Buổi Sáng', 2018, N'NXB Văn Học', N'img\\tamly2.jpg', 248, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0028', N'Thay Đổi Cuộc Sống Với Nhân Số Học', 248000.0000, N'FIRST NEWS', 25, N'Lê Đỗ Quỳnh Hương', 2020, N'NXB Tổng Hợp TPHCM', N'img\\tamly1.jpg', 255, 1, N'Sách ', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0029', N'Tiếng Anh 3 - Tập 1 - Sách Học Sinh (2021)', 30000.0000, N'Nhà xuất bản Giáo Dục', 209, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\tienganh3.jpg', 79, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0030', N'Vật Lí 10 (2021)', 17000.0000, N'Nhà Xuất Bản Kim Đồng', 23, N'Bộ Giáo Dục Và Đào Tạo
 ', 2021, N'NXB Văn Học', N'img\\vatly10.jpg', 228, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0031', N'Hóa Học 10 (2021)', 14000.0000, N'Nhà xuất bản Giáo Dục', 210, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\hoa10.jpg', 172, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0032', N'Lịch Sử 10 (2021)', 15000.0000, N'Nhà Xuất Bản Kim Đồng', 95, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Văn Học', N'img\\lichsu10.jpg', 204, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0033', N'Đại Số 10 (2021)', 10000.0000, N'Nhà xuất bản Giáo Dục', 210, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\daiso10.jpg', 172, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0034', N'Hình Học 10 (2021)', 6000.0000, N'Nhà xuất bản Giáo Dục', 0, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\hinhhoc10.jpg', 104, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0035', N'Ngữ Văn 10 - Tập 1 (2021)', 10000.0000, N'Nhà xuất bản Giáo Dục', 207, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\nguvan10.jpg', 176, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0036', N'Sinh Học 10 (2021)', 11000.0000, N'Nhà xuất bản Giáo Dục', 210, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\sinhhoc10.jpg', 132, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0037', N'Tự Học Tiếng Thái Cho Người Mới Bắt Đầu', 76000.0000, N'NXB Hồng Đức', 120, N'Trịnh Thế Thắng', 2020, N'Cty Văn Hóa Nhân Văn', N'img\\tuhoctiengthai.jpg', 273, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0038', N'Tự Học Tiếng Trung Cấp Tốc Trong Kinh Doanh - Bán Hàng', 108000.0000, N'NXB Hồng Đức', 123, N'The Zhishi', 2019, N'NXB Hồng Đức', N'img\\tuhoctiengtrung.jpg', 314, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0039', N'30 Phút Tự Học Giao Tiếp Tiếng Trung Mỗi Ngày', 109000.0000, N'NXB Hồng Đức', 120, N'The Zhishi', 2019, N'NXB Hồng Đức', N'img\\30phutgiaotiep.jpg', 260, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0040', N'Học Nhanh Nhớ Lâu 1500 Từ Vựng Tiếng Trung Thông Dụng', 168000.0000, N'NXB Hồng Đức', 120, N'The Zhishi', 2019, N'NXB Hồng Đức', N'img\\hocnhanhnholau.jpg', 236, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0041', N'Ai Hiểu Khách Hàng Người Ấy Bán Được Hàng (Tái Bản 2021)', 105000.0000, N'Minh Long', 120, N'Lí Kiện Lâm', 2021, N'NXB Thanh Niên', N'img\\aihieukhachhang.jpg', 263, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0042', N'Tâm Lý Học - Khái Lược Những Tư Tưởng Lớn', 390000.0000, N'Đông A', 122, N'DK', 2019, N'NXB Dân Trí', N'img\\tamlyhoc.jpg', 352, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0043', N'Triết Học - Khái Lược Những Tư Tưởng Lớn', 390000.0000, N'Đông A', 145, N'DK', 2019, N'NXB Dân Trí', N'img\\triethoc.jpg', 352, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0044', N'Kinh Tế Học - Khái Lược Những Tư Tưởng Lớn', 390000.0000, N'Đông A', 283, N'DK', 2019, N'NXB Dân Trí', N'img\\kinhtehoc.jpg', 352, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0045', N'Sang Chấn Tâm Lý - Hiểu Để Chữa Lành', 350000.0000, N'Saigon Books', 142, N'Bessel Van Der Kolk, M.D', 2020, N'NXB Thế Giới', N'img\\sangchan.jpg', 572, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0046', N'Tìm Lại Cái Tôi Đã Mất, Cứu Vãn Cuộc Đời Không Vui Vẻ (Bìa Cứng)', 95000.0000, N'Minh Long', 155, N'Trình Chí Lương', 2018, N'NXB Văn Học', N'img\\timlaicaitoi.jpg', 248, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0047', N'Não Bộ Tuổi Teen', 139000.0000, N'Tân Việt', 216, N'Amy Allis Nutt', 2019, N'NXB Dân Trí', N'img\\naobotuoiteen.jpg', 342, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0048', N'Tâm Lý Học Trong Nháy Mắt - Tâm Lý Học Tổ Chức - Công Nghiệp (Tập 6)', 198000.0000, N'CÔNG TY TNHH SÁCH & TRUYỀN THÔNG VIỆT NAM', 248, N'Nhóm Ezpsychology', 2017, N'NXB Thanh Niên', N'img\\tamlyhoctrongnhaymat.jpg', 500, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0049', N'Kiính ha', 22222.0000, N'Nhà Xuất Bản Kim Đồng', 135, N'sđ', 2021, N'NXB Văn Học 1', N'img\\chuacohinhanh.png', 222, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0050', N'VBT Tiếng Việt 1/1 (Chân Trời Sáng Tạo) (2021)', 12000.0000, N'Nhà xuất bản Giáo Dục', 2, N'Bùi Mạnh Hùng', 2021, N'NXB Giáo Dục Việt Nam', N'img\\voBTTV1.jpg', 98, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0051', N'Tiếng Việt 4 - Tập 2 (2021)', 14000.0000, N'Nhà xuất bản Giáo Dục', 22, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\tiengviet4.jpg', 172, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0052', N'Khéo Ăn Khéo Nói Sẽ Có Được Thiên Hạ (Tái Bản 2021)', 660000.0000, N'Nhà Xuất Bản Kim Đồng', 0, N'Trác Nhã', 2018, N'NXB Văn Học', N'img\\keo-an-noi.jpg', 406, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0053', N'Kính Vạn Hoa - 14 - Lang Thang Trong Rừng - Kho Báu Dưới Hồ - Gia Sư (Tái Bản 2021)', 63000.0000, N'Nhà Xuất Bản Kim Đồng', 1, N'Nguyễn Nhật Ánh', 2000, N'NXB Văn Học', N'img\\kinh-van-hoa.jpg', 200, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0054', N'Nhật Ký Trong Tù', 38700.0000, N'NXB Chính Trị Quốc Gia', 12, N'Hồ Chí Minh', 2018, N'NXB Chính Trị Quốc Gia Sự Thật', N'img\\nhat-ky-trong-tu-2.jpg', 80, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0055', N'Hồ Chí Minh - Nhật Ký Trong Tù', 40000.0000, N'Minh Long', 20, N'Hồ Chí Minh', 2015, N'NXB Văn Học', N'img\\nhat-ky-trong-tu3.jpg', 80, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0056', N'Một Đời Quản Trị (Tái Bản 2021)', 170000.0000, N'NXB Trẻ', 185, N'Phan Văn Trường', 2019, N'NXB Trẻ', N'img\\mot-doi-quan-tri.png', 492, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0057', N'Truyện Thúy Kiều - Đoạn Trường Tân Thanh (Tái Bản 2021)', 90000.0000, N'Cty Văn Hóa Minh Lâm', 100, N'Nguyễn Du', 2021, N'NXB Hồng Đức', N'img\\truyen-kieu.jpg', 230, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0058', N'Một Đời Quản Trị (Tái Bản 2018)', 170000.0000, N'NXB Trẻ', 167, N'Phan Văn Trường', 2019, N'NXB Trẻ', N'img\\mot-doi-quan-tri.jpg', 492, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0059', N'Vận Dụng Khoa Nhân Tướng Học Trong Ứng Xử Và Quản Lý (Tái Bản 2021)', 128000.0000, N'Cty Văn Hóa Văn Lang', 146, N'Việt Chương', 2019, N'NXB Hồng Đức', N'img\\van-dung-nhan-tuong-hoc.jpg', 336, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0060', N'Thám Tử Lừng Danh Conan - Tập 93 (Tái Bản 2021)', 20000.0000, N'Nhà Xuất Bản Kim Đồng', 1, N'Gosho Aoyama', 2019, N'NXB Kim Đồng', N'img\\conan93.jpg', 184, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0061', N'Vật Lí 10 (2018)', 17000.0000, N'Nhà Xuất Bản Kim Đồng', 20, N'Bộ Giáo Dục Và Đào Tạo
 ', 2021, N'NXB Văn Học', N'img\\vatly10.jpg', 228, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0062', N'Hóa Học 10 (2018)', 14000.0000, N'Nhà xuất bản Giáo Dục', 210, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\hoa10.jpg', 172, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0063', N'Lịch Sử 10 (2018)', 15000.0000, N'Nhà Xuất Bản Kim Đồng', 210, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Văn Học', N'img\\lichsu10.jpg', 204, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0064', N'Ai Hiểu Khách Hàng Người Ấy Bán Được Hàng (Tái Bản 2017)', 105000.0000, N'Minh Long', 120, N'Lí Kiện Lâm', 2021, N'NXB Thanh Niên', N'img\\aihieukhachhang.jpg', 263, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0065', N'Trạng Quỷnh Tập 409 - Thím Mắm Chủ Nợ (Tái Bản 2020)', 12000.0000, N'CÔNG TY TNHH IN ẤN-DV-TM SIÊU TỐC', 2, N'Kim Khánh', 2020, N'NXB Đồng Nai', N'img\\trangquynh409.jpg', 120, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0066', N'Giải Thích Ngữ Pháp Tiếng Anh (Bài Tập & Đáp Án) (Tái Bản 2021)', 220000.0000, N'Nhà Xuất Bản Kim Đồng', 33, N'Mai Lan Hương, Hà Thanh Uyên', 2019, N'NXB Văn Học', N'img\\ngoaingu1.jpg', 536, 1, N'Sách', N'LS0006')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0067', N'Tiếng Việt 4 - Tập 2 (2019)', 14000.0000, N'Nhà xuất bản Giáo Dục', 15, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\tiengviet4.jpg', 172, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0068', N'VBT Tiếng Việt 1/1 (Chân Trời Sáng Tạo) (Tái bản 2019)', 12000.0000, N'Nhà xuất bản Giáo Dục', 4, N'Bùi Mạnh Hùng', 2021, N'NXB Giáo Dục Việt Nam', N'img\\voBTTV1.jpg', 98, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0069', N'Tâm Lý Học Trong Nháy Mắt - Tâm Lý Học Tổ Chức - Công Nghiệp (Tập 5)', 1980002.0000, N'CÔNG TY TNHH SÁCH & TRUYỀN THÔNG VIỆT NAM', 258, N'Nhóm Ezpsychology', 2017, N'NXB Thanh Niên', N'img\\tamlyhoctrongnhaymat5.jpg', 500, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0070', N'Giáo Trình Kỹ Thuật Lập Trình C Căn Bản & Nâng Cao', 108000.0000, N'Huy Hoang Bookstore', 20, N'PGS. TS Phạm Văn Ất, TS. Đỗ Văn Tuấn', 2017, N'NXB Thông Tin Và Truyền Thông', N'img\\khoahoc1.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0071', N'Lập Trình ToT Với Arduino - Esp8266 Và Xbee', 127000.0000, N'Cty Thương mại STK', 20, N'TS Nguyễn Tất Bảo Thiện , KS Phạm Quang Huy', 2017, N'NXB Thanh Niên', N'img\\khoahoc2.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0072', N'Stem - Tớ Là Lập Trình Viên Tương Lai', 44000.0000, N'Nhà Sách Minh Thắng', 20, N'Anna Claybourne', 2020, N'NXB Phụ Nữ Việt Nam', N'img\\khoahoc3.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0073', N'Hành Trang Lập Trình - Những Kỹ Năng Lập Trình Viên Chuyên Nghiệp Cần Có', 143000.0000, N'CÔNG TY TNHH SÁCH & TRUYỀN THÔNG VIỆT', 20, N'Vũ Công Tấn Tài', 2017, N'NXB Thanh Niên', N'img\\khoahoc4.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0074', N'Lập Trình Hệ Thống Thương Mại Điện Tử', 170000.0000, N'Cty Thương mại STK', 20, N'Phạm Quang Huy, Phạm Quang Hiển, Trần Tường Thụy', 2017, N'NXB Thanh Niên', N'img\\khoahoc5.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0075', N'Gián Điệp Mạng', 183000.0000, N'Alpha Books', 20, N'Clifford Stoll', 2017, N'NXB Công Thương', N'img\\khoahoc6.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0076', N'Giáo Trình Thực Hành Excel - Dùng Cho Các Phiên Bản 2019 - 2016 - 2013', 108000.0000, N'Cty Thương mại STK', 20, N'Phạm Quang Huy, Phạm Phương Hoa', 2020, N'NXB Thanh Niên', N'img\\khoahoc7.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0077', N'Giáo Trình Thực Hành Coreldraw X7, X8, X9 Và 2020', 142000.0000, N'Cty Thương mại STK', 33, N'Phạm Quang Hiển, Phạm Quang Huy', 2020, N'NXB Thanh Niên', N'img\\khoahoc9.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0078', N'Tự Học Photoshop CC - Toàn Tập (Tái Bản Bổ Sung Lần 2)', 127000.0000, N'Cty Thương mại STK', 33, N'Phạm Quang Hiển, Phạm Quang Huy', 2020, N'NXB Thanh Niên', N'img\\khoahoc8.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0079', N'Tự Học Photoshop CC - Toàn Tập (Tái Bản Lần 1)', 127000.0000, N'Cty Thương mại STK', 20, N'Phạm Quang Hiển, Phạm Quang Huy', 2020, N'NXB Thanh Niên', N'img\\khoahoc8.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0080', N'Nhật Ký Học Làm Bánh (Tái Bản 2018)', 84000.0000, N'Nhã Nam', 20, N'Linh Trang', 2018, N'NXB Hồng Đức', N'img\\daynauan1.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0081', N'50 Thực Đơn Nấu Ăn Gia Đình', 30000.0000, N'Cty Văn Hóa Việt Thư', 66, N'Cẩm tuyết', 2018, N'NXB Hồng Đức', N'img\\daynauan2.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0082', N'500 Món Chay Thanh Tịnh - Tập 16', 28000.0000, N'Cty Văn Hóa Việt Thư', 20, N'Nguyễn Dzoãn Cẩm Vân', 2018, N'NXB Hồng Đức', N'img\\daynauan3.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0083', N'Về Nhà Ăn Cơm - 45 Công Thức Thuần Chay Cho Mâm Cơm Nhà Bạn (Tái Bản 2021)', 84000.0000, N'AZ Việt Nam', 20, N'Đức Nguyễn', 2018, N'NXB Thế Giới', N'img\\daynauan4.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0084', N'Về Nhà Ăn Cơm - 45 Công Thức Thuần Chay Cho Mâm Cơm Nhà Bạn (Tái Bản 2018)', 84000.0000, N'AZ Việt Nam', 20, N'Đức Nguyễn', 2018, N'NXB Thế Giới', N'img\\daynauan4.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0085', N'Món Ăn Thuần Việt (Tái Bản 2018)', 32000.0000, N'Phụ Nữ', 63, N'Nguyễn Thị Diệu Thảo', 2018, N'NXB Phụ Nữ', N'img\\daynauan5.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0086', N'Thực Đơn Cơm Gia Đình 3 Món Miền Trung (Tái Bản)', 21000.0000, N'Cty Văn Hóa Việt Thư', 87, N'Linh Trang', 2018, N'NXB Văn Hoá Thông Tin', N'img\\daynauan6.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0087', N'Món Ăn Bổ Dưỡng Cho Vợ Chồng Trẻ', 22000.0000, N'Cty Văn Hóa Việt Thư', 56, N'Linh Trang', 2018, N'NXB Văn Hoá Thông Tin', N'img\\daynauan7.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0088', N'Món Ngon Đãi Khách', 24000.0000, N'Cty Văn Hóa Việt Thư', 20, N'Mai Oanh', 2018, N'NXB Hồng Đức', N'img\\daynauan8.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0089', N'Món Ngon Ngày Lễ Tết', 84000.0000, N'Cty Văn Hóa Việt Thư', 20, N'Mai Oanh', 2018, N'NXB Hồng Đức', N'img\\daynauan9.jpg', 220, 1, N'Sách', N'LS0008')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0090', N'Trịnh Công Sơn - Tôi Là Ai, Là Ai (Tái Bản 2018)', 157000.0000, N'NXB Trẻ', 19, N'Trịnh Công Sơn', 2017, N'NXB Trẻ', N'img\\amnhac1.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0091', N'Những Bóng Hồng Trong Âm Nhạc', 108000.0000, N'Trương Văn Khoa', 20, N'	Trương Văn Khoa', 2020, N'NXB Hội Nhà Văn Việt Nam', N'img\\amnhac2.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0092', N'Mĩ Nữ Hoa - Nghệ Thuật Vẽ Màu Nước Cổ Trang', 157000.0000, N'Nhà Xuất Bản Kim Đồng', 20, N'YAYA', 2017, N'NXB Kim Đồng', N'img\\amnhac3.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0093', N'Bách Khoa Toàn Thư Thực Hành Hội Họa', 157000.0000, N'Cty Văn Hóa Văn Lang', 44, N'Trịnh Công Sơn', 2017, N'NXB Thanh Hóa', N'img\\amnhac4.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0094', N'BTS Biểu Tượng K-pop', 157000.0000, N'AZ Việt Nam', 44, N'Adrian Besley', 2017, N'NXB Trẻ', N'img\\amnhac5.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0095', N'Lắng Nghe Giai Điệu Bolero', 157000.0000, N'NXB Trẻ', 8, N'Vũ Đức Sao Biển', 2017, N'NXB Trẻ', N'img\\amnhac6.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0096', N'Ban Nhạc Phượng Hoàng - The Beatles Của Sài Gòn', 77000.0000, N'Công ty TNHH Domino Books', 11, N'Nhiều Tác Giả', 2017, N'NXB Hội Nhà Văn', N'img\\amnhac7.jpg', 220, 1, N'Sách', N'LS0009')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0097', N'Hoa Học Trò Số 1367 - Phiên Bản Kỷ Niệm 30 Năm', 20000.0000, N'BÁO TIỀN PHONG', 344, N'Nhiều Tác Giả', 2019, N'Báo Sinh Viên Việt Nam - Hoa Học Trò', N'img\\tapchi1.jpg', 220, 1, N'Sách', N'LS0010')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0098', N'Hoa Học Trò Số 1345 - Tặng Kèm Fanbook Những Couple K-Pop', 27000.0000, N'BÁO TIỀN PHONG', 13, N'Nhiều Tác Giả', 2019, N'Báo Sinh Viên Việt Nam - Hoa Học Trò', N'img\\tapchi4.jpg', 220, 1, N'Sách', N'LS0010')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0099', N'Hoa Học Trò Số 1356 - Tặng Kèm Fanbook Soft Boy: Những Chàng Trai Ngọt Ngào + 2 Mega Poster Jimin ', 20000.0000, N'BÁO TIỀN PHONG', 14, N'Nhiều Tác Giả', 2019, N'Báo Sinh Viên Việt Nam - Hoa Học Trò', N'img\\tapchi3.jpg', 220, 1, N'Sách', N'LS0010')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0100', N'Hoa Học Trò Số 1351 - Tặng Kèm Photobook Cỡ Lớn Đẹp Như Một Giấc Mơ', 27000.0000, N'BÁO TIỀN PHONG', 17, N'Nhiều Tác Giả', 2019, N'Báo Sinh Viên Việt Nam - Hoa Học Trò', N'img\\tapchi2.jpg', 220, 1, N'Sách', N'LS0010')
GO
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0101', N'Giáo Trình Kỹ Thuật Lập Trình C Căn Bản & Nâng Cao (Tái Bản Lần 2)', 108000.0000, N'Huy Hoang Bookstore', 18, N'PGS. TS Phạm Văn Ất, TS. Đỗ Văn Tuấn', 2017, N'NXB Thông Tin Và Truyền Thông', N'img\\khoahoc1.jpg', 430, 1, N'Sách', N'LS0007')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0102', N'Mối chúa', 82000.0000, N'Nhã Nam', 10, N'Tạ Duy Anh', 2021, N'NXB Hội Nhà Văn', N'img\\sachmoichua.jpg', 102, 0, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0103', N'Người Giàu Có Nhất Thành Babylon', 78000.0000, N'FIRST NEWS', 10, N'George S Clason', 2021, N'NXB Tổng Hợp TPHCM', N'img\\nguoigiaucobabylon.jpg', 214, 1, N'Sách', N'LS0002')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0104', N'Đời Ngắn Đừng Ngủ Dài (Tái Bản 2018)', 75000.0000, N'NXB Trẻ', 20, N'Robin Sharma', 2018, N'NXB Trẻ', N'img\\doinguoinganngui.jpg', 228, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0105', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ (Bìa Mềm) (Tái Bản 2018)', 80000.0000, N'NXB Trẻ', 35, N'Nguyễn Nhật Ánh', 2018, N'NXB Trẻ', N'img\\chuacohinhanh.png', 208, 1, N'Sách', N'LS0001')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0106', N'Mob Psycho 100 - Tập 6', 30000.0000, N'Nhà Xuất Bản Kim Đồng', 150, N'ONE', 2000, N'NXB Kim Đồng', N'img\\chuacohinhanh.png', 209, 1, N'Sách', N'LS0004')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0107', N'Tôi quyết định sống cho chính tôi (Tái Bản 2020)', 70000.0000, N'AZ Việt Nam', 182, N'Kim Suhyun', 2021, N'NXB Thanh Niên', N'img\\chuacohinhanh.png', 208, 1, N'Sách', N'LS0003')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0108', N'Hình Học 12 (2021)', 6000.0000, N'Nhà xuất bản Giáo Dục', 150, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\chuacohinhanh.png', 209, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0109', N'Giáo Dục Công Dân 11 (2021)', 7000.0000, N'Nhà xuất bản Giáo Dục', 100, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\chuacohinhanh.png', 180, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0110', N'Địa Lí 11 (2021)', 10000.0000, N'Nhà xuất bản Giáo Dục', 100, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\chuacohinhanh.png', 130, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0111', N'Sinh Học 11 (2021)', 16000.0000, N'Nhà xuất bản Giáo Dục', 100, N'Bộ Giáo Dục Và Đào Tạo', 2021, N'NXB Giáo Dục Việt Nam', N'img\\chuacohinhanh.png', 180, 1, N'Sách', N'LS0005')
INSERT [dbo].[Sach] ([maSanPham], [tenSanPham], [donGia], [nhaCungCap], [soLuong], [tacGia], [namXuatBan], [nhaXuatBan], [hinhAnh], [soTrang], [tinhTrang], [loaiSanPham], [maLoaiSach]) VALUES (N'SPS0112', N'2223', 222.0000, N'Nhà Xuất Bản Kim Đồng', 22222222, N'222222', 2021, N'NXB Văn Học', N'img\\hocnhanhnholau.jpg', 22, 1, N'Sách', N'LS0001')
GO
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV001', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV002', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV003', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV004', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV005', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV006', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV007', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV009', N'ex3n1TjOLtEqWw5xPZJU')
INSERT [dbo].[TaiKhoan] ([tenTaiKhoan], [matKhau]) VALUES (N'NV010', N'ex3n1TjOLtEqWw5xPZJU')
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonDungCuHT_DungCuHocTap] FOREIGN KEY([maDCHT])
REFERENCES [dbo].[DungCuHocTap] ([maSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT] CHECK CONSTRAINT [FK_ChiTietHoaDonDungCuHT_DungCuHocTap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonDungCuHT_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonDungCuHT] CHECK CONSTRAINT [FK_ChiTietHoaDonDungCuHT_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonSach_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach] CHECK CONSTRAINT [FK_ChiTietHoaDonSach_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonSach_Sach] FOREIGN KEY([maSach])
REFERENCES [dbo].[Sach] ([maSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonSach] CHECK CONSTRAINT [FK_ChiTietHoaDonSach_Sach]
GO
ALTER TABLE [dbo].[DungCuHocTap]  WITH CHECK ADD  CONSTRAINT [FK_DungCuHocTap_LoaiDungCuHocTap] FOREIGN KEY([maLoaiDungCuHocTap])
REFERENCES [dbo].[LoaiDungCuHocTap] ([maLoaiDungCuHocTap])
GO
ALTER TABLE [dbo].[DungCuHocTap] CHECK CONSTRAINT [FK_DungCuHocTap_LoaiDungCuHocTap]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LoaiSach] FOREIGN KEY([maLoaiSach])
REFERENCES [dbo].[LoaiSach] ([maLoaiSach])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_LoaiSach]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([tenTaiKhoan])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [Flames] SET  READ_WRITE 
GO
