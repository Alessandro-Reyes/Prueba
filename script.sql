USE [master]
GO
/****** Object:  Database [Deportes]    Script Date: 09/11/2018 21:52:12 ******/
CREATE DATABASE [Deportes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Deportes', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Deportes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Deportes_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Deportes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Deportes] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deportes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deportes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deportes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deportes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deportes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deportes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deportes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Deportes] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Deportes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deportes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deportes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deportes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deportes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deportes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deportes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deportes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deportes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Deportes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deportes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deportes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deportes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deportes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deportes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deportes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deportes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Deportes] SET  MULTI_USER 
GO
ALTER DATABASE [Deportes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deportes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deportes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deportes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Deportes]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen](
	[Id_Almacen] [int] IDENTITY(1,1) NOT NULL,
	[NombreAlmacen] [varchar](50) NOT NULL,
	[FechaEntradaProducto] [date] NOT NULL,
	[FechaSalidaProducto] [date] NOT NULL,
	[Id_Productos] [int] NOT NULL,
 CONSTRAINT [PK_Almacen] PRIMARY KEY CLUSTERED 
(
	[Id_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dui] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompraProv]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraProv](
	[Id_Comprov] [int] IDENTITY(1,1) NOT NULL,
	[Id_Productos] [int] NOT NULL,
	[PrecioTotalCompra] [int] NOT NULL,
	[FechaCompra] [date] NOT NULL,
 CONSTRAINT [PK_Id_Comprov] PRIMARY KEY CLUSTERED 
(
	[Id_Comprov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionProv]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionProv](
	[Id_Productos] [int] NOT NULL,
	[Cantidad_dep] [int] NOT NULL,
	[Producto_dep] [int] NOT NULL,
	[Id_DevolucionProv] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[FechaDevolucion] [date] NOT NULL,
 CONSTRAINT [PK_Id_DevolucionProv] PRIMARY KEY CLUSTERED 
(
	[Id_DevolucionProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Productos] [int] IDENTITY(1,1) NOT NULL,
	[TipoProducto] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[Proveedor] [varchar](50) NOT NULL,
	[Existencias] [int] NOT NULL,
 CONSTRAINT [Pk_Id_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[Id_TipoTrans] [int] IDENTITY(1,1) NOT NULL,
	[TipoTrans] [char](1) NOT NULL,
 CONSTRAINT [PK_Id_TipoTrans] PRIMARY KEY CLUSTERED 
(
	[Id_TipoTrans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[Id_Trans] [int] IDENTITY(1,1) NOT NULL,
	[Id_Ventas] [int] NOT NULL,
	[Id_Productos] [int] NOT NULL,
	[Id_DevolucionProv] [int] NOT NULL,
	[Id_Comprov] [int] NOT NULL,
	[Id_TipoTrans] [int] NOT NULL,
 CONSTRAINT [Pk_Id_Trans] PRIMARY KEY CLUSTERED 
(
	[Id_Trans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 09/11/2018 21:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id_Ventas] [int] IDENTITY(1,1) NOT NULL,
	[Id_Productos] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaVentas] [money] NOT NULL,
 CONSTRAINT [Pk_Id_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id_Ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Productos] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Productos]
GO
ALTER TABLE [dbo].[CompraProv]  WITH CHECK ADD  CONSTRAINT [FK_Id_Produ] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[CompraProv] CHECK CONSTRAINT [FK_Id_Produ]
GO
ALTER TABLE [dbo].[DevolucionProv]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProv_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[DevolucionProv] CHECK CONSTRAINT [FK_DevolucionProv_Cliente]
GO
ALTER TABLE [dbo].[DevolucionProv]  WITH CHECK ADD  CONSTRAINT [FK_Id_Product] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[DevolucionProv] CHECK CONSTRAINT [FK_Id_Product]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Id_CompraProv] FOREIGN KEY([Id_Comprov])
REFERENCES [dbo].[CompraProv] ([Id_Comprov])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Id_CompraProv]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Id_DevolucionProv] FOREIGN KEY([Id_DevolucionProv])
REFERENCES [dbo].[DevolucionProv] ([Id_DevolucionProv])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Id_DevolucionProv]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [Fk_Id_Productos] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [Fk_Id_Productos]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Id_TipoTrans] FOREIGN KEY([Id_TipoTrans])
REFERENCES [dbo].[TipoTransaccion] ([Id_TipoTrans])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Id_TipoTrans]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [Fk_Id_Ventas] FOREIGN KEY([Id_Ventas])
REFERENCES [dbo].[Ventas] ([Id_Ventas])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [Fk_Id_Ventas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [Fk_Id_Produc] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [Fk_Id_Produc]
GO
ALTER TABLE [dbo].[TipoTransaccion]  WITH CHECK ADD  CONSTRAINT [CK_TipoTrans] CHECK  (([TipoTrans]='D' OR [TipoTrans]='C' OR [TipoTrans]='V'))
GO
ALTER TABLE [dbo].[TipoTransaccion] CHECK CONSTRAINT [CK_TipoTrans]
GO
USE [master]
GO
ALTER DATABASE [Deportes] SET  READ_WRITE 
GO
