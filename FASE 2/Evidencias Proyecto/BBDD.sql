USE [master]
GO
/****** Object:  Database [DB_Capstone]    Script Date: 08/10/2024 09:44:56 PM ******/
CREATE DATABASE [DB_Capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_Capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_Capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_Capstone] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Capstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_Capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Capstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Capstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Capstone] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Capstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Capstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_Capstone] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Capstone] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Capstone]
GO
/****** Object:  Table [dbo].[Examen]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examen](
	[IdExamen] [int] IDENTITY(1,1) NOT NULL,
	[NombreExamen] [varchar](200) NULL,
	[Fecha] [date] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[NombreReceta] [varchar](200) NULL,
	[Fecha] [date] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_Usuario]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarExamen]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarExamen]
    @IdUsuario INT,
    @NombreExamen VARCHAR(200),
    @Fecha DATE
AS
BEGIN
    INSERT INTO Examen (NombreExamen, Fecha, IdUsuario)
    VALUES (@NombreExamen, @Fecha, @IdUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarReceta]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarReceta]
    @IdUsuario INT,
    @NombreReceta VARCHAR(200),
    @Fecha DATE
AS
BEGIN
    INSERT INTO Receta (NombreReceta, Fecha, IdUsuario)
    VALUES (@NombreReceta, @Fecha, @IdUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_IniciarSesion]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IniciarSesion]
    @Correo NVARCHAR(100),
    @Clave NVARCHAR(100)
AS
BEGIN
    SELECT IdUsuario, Correo FROM Usuarios
    WHERE Correo = @Correo AND Clave = @Clave;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerExamenesPorUsuario]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerExamenesPorUsuario]
    @IdUsuario INT
AS
BEGIN
    SELECT IdExamen, NombreExamen, Fecha
    FROM Examen
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerRecetasPorUsuario]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerRecetasPorUsuario]
    @IdUsuario INT
AS
BEGIN
    SELECT IdReceta, NombreReceta, Fecha
    FROM Receta
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarUsuario]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_RegistrarUsuario](
@Correo varchar (100),
@Clave varchar (100),
@Registrado bit output,
@Mensaje varchar(100) output
)
as
begin
	if (not exists(select * from Usuario where Correo = @Correo))
	begin 
		insert into Usuario(Correo,Clave) values(@Correo,@Clave)
		set @Registrado = 1
		set @Mensaje = 'Usuario Registrado'
	end
	else
	begin
		set @Registrado = 0
		set @Mensaje = 'Correo ya existe'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 08/10/2024 09:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ValidarUsuario](
@Correo varchar(100),
@Clave varchar(500)
)
as 
begin
	if(exists(select * from Usuario where Correo = @Correo and Clave = @Clave))
		select IdUsuario from Usuario where Correo =@Correo and Clave = @Clave
	else
		select '0'
end
GO
USE [master]
GO
ALTER DATABASE [DB_Capstone] SET  READ_WRITE 
GO
