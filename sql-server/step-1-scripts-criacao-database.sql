USE [master]
GO
/****** Object:  Database [FinBank]    Script Date: 20/07/2023 10:40:37 ******/
CREATE DATABASE [FinBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinBank', FILENAME = N'C:\FinBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinBank_log', FILENAME = N'C:\FinBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FinBank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinBank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinBank] SET  MULTI_USER 
GO
ALTER DATABASE [FinBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinBank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinBank] SET QUERY_STORE = OFF
GO
USE [FinBank]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/07/2023 10:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[nome] [varchar](250) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
	[uf] [varchar](2) NOT NULL,
	[celular] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamentos]    Script Date: 20/07/2023 10:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamentos](
	[financiamento_id] [int] IDENTITY(1,1) NOT NULL,
	[cpf] [varchar](11) NULL,
	[tipo_financiamento_id] [int] NULL,
	[valor_total] [decimal](12, 2) NULL,
	[data_ultimo_vencimento] [date] NULL,
 CONSTRAINT [PK__Financia__EC80ECACE0FDB7E6] PRIMARY KEY CLUSTERED 
(
	[financiamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcelas]    Script Date: 20/07/2023 10:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcelas](
	[parcela_id] [int] IDENTITY(1,1) NOT NULL,
	[financiamento_id] [int] NULL,
	[numero_parcela] [int] NULL,
	[valor_parcela] [decimal](10, 2) NULL,
	[data_vencimento] [date] NULL,
	[data_pagamento] [date] NULL,
 CONSTRAINT [PK__Parcelas__075083DC58273D74] PRIMARY KEY CLUSTERED 
(
	[parcela_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposFinanciamento]    Script Date: 20/07/2023 10:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposFinanciamento](
	[tipo_financiamento_id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
 CONSTRAINT [PK__TiposFin__7F6AC52B77FE15A6] PRIMARY KEY CLUSTERED 
(
	[tipo_financiamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([nome], [cpf], [uf], [celular]) VALUES (N'Sarah Ketilin da Silva', N'07886726065', N'RJ', N'91983475255')
INSERT [dbo].[Clientes] ([nome], [cpf], [uf], [celular]) VALUES (N'Daniel Lopes Conceicao', N'19435224059', N'SP', N'84981916765')
INSERT [dbo].[Clientes] ([nome], [cpf], [uf], [celular]) VALUES (N'Paulo Correa da Silva', N'21819632075', N'RO', N'11995337263')
INSERT [dbo].[Clientes] ([nome], [cpf], [uf], [celular]) VALUES (N'Camila Rincao de Arruda Correa', N'26271109004', N'SP', N'92980021131')
SET IDENTITY_INSERT [dbo].[Financiamentos] ON 

INSERT [dbo].[Financiamentos] ([financiamento_id], [cpf], [tipo_financiamento_id], [valor_total], [data_ultimo_vencimento]) VALUES (1, N'07886726065', 1, CAST(150000.00 AS Decimal(12, 2)), CAST(N'2023-01-20' AS Date))
INSERT [dbo].[Financiamentos] ([financiamento_id], [cpf], [tipo_financiamento_id], [valor_total], [data_ultimo_vencimento]) VALUES (2, N'07886726065', 3, CAST(30000.00 AS Decimal(12, 2)), CAST(N'2027-01-20' AS Date))
INSERT [dbo].[Financiamentos] ([financiamento_id], [cpf], [tipo_financiamento_id], [valor_total], [data_ultimo_vencimento]) VALUES (3, N'19435224059', 2, CAST(22500.00 AS Decimal(12, 2)), CAST(N'2024-12-15' AS Date))
INSERT [dbo].[Financiamentos] ([financiamento_id], [cpf], [tipo_financiamento_id], [valor_total], [data_ultimo_vencimento]) VALUES (4, N'21819632075', 3, CAST(43200.00 AS Decimal(12, 2)), CAST(N'2027-06-14' AS Date))
INSERT [dbo].[Financiamentos] ([financiamento_id], [cpf], [tipo_financiamento_id], [valor_total], [data_ultimo_vencimento]) VALUES (5, N'26271109004', 1, CAST(10800.00 AS Decimal(12, 2)), CAST(N'2024-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Financiamentos] OFF
SET IDENTITY_INSERT [dbo].[Parcelas] ON 

INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (26, 1, 1, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-02-20' AS Date), CAST(N'2021-02-12' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (27, 1, 2, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-03-20' AS Date), CAST(N'2021-03-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (28, 1, 3, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-04-20' AS Date), CAST(N'2021-04-11' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (29, 1, 4, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-05-20' AS Date), CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (30, 1, 5, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-06-20' AS Date), CAST(N'2021-06-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (31, 1, 6, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-07-20' AS Date), CAST(N'2021-08-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (32, 1, 7, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-08-20' AS Date), CAST(N'2021-08-20' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (33, 1, 8, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-09-20' AS Date), CAST(N'2021-09-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (34, 1, 9, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-10-20' AS Date), CAST(N'2021-10-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (35, 1, 10, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-11-20' AS Date), CAST(N'2021-11-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (36, 1, 11, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2021-12-20' AS Date), CAST(N'2021-12-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (37, 1, 12, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-01-20' AS Date), CAST(N'2022-01-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (38, 1, 13, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-02-20' AS Date), CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (39, 1, 14, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-03-20' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (40, 1, 15, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-04-20' AS Date), CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (41, 1, 16, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-05-20' AS Date), CAST(N'2022-05-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (42, 1, 17, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-06-20' AS Date), CAST(N'2022-06-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (43, 1, 18, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (44, 1, 19, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-08-20' AS Date), CAST(N'2022-08-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (45, 1, 20, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-09-20' AS Date), CAST(N'2022-09-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (46, 1, 21, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-10-20' AS Date), CAST(N'2022-10-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (47, 1, 22, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-11-20' AS Date), CAST(N'2022-11-18' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (48, 1, 23, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2022-12-20' AS Date), CAST(N'2022-12-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (49, 1, 24, CAST(6250.00 AS Decimal(10, 2)), CAST(N'2023-01-20' AS Date), CAST(N'2023-01-11' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (50, 2, 1, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (51, 2, 2, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (52, 2, 3, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-08-15' AS Date), CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (53, 2, 4, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), CAST(N'2023-09-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (54, 2, 5, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-10-15' AS Date), CAST(N'2023-10-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (55, 2, 6, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-11-15' AS Date), CAST(N'2023-11-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (56, 2, 7, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2023-12-15' AS Date), CAST(N'2023-12-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (57, 2, 8, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2024-01-15' AS Date), CAST(N'2024-01-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (58, 2, 9, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date), CAST(N'2024-02-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (59, 2, 10, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (60, 2, 11, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2024-04-15' AS Date), CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (61, 2, 12, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2024-05-15' AS Date), CAST(N'2024-05-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (62, 3, 1, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (63, 3, 2, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (64, 3, 3, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-08-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (65, 3, 4, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (66, 3, 5, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-10-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (67, 3, 6, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-11-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (68, 3, 7, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2023-12-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (69, 3, 8, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-01-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (70, 3, 9, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (71, 3, 10, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-03-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (72, 3, 11, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-04-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (73, 3, 12, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-05-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (74, 3, 13, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (75, 3, 14, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-07-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (76, 3, 15, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (77, 3, 16, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (78, 3, 17, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-10-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (79, 3, 18, CAST(1250.00 AS Decimal(10, 2)), CAST(N'2024-11-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (80, 4, 1, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-06-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (81, 4, 2, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-07-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (82, 4, 3, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (83, 4, 4, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-09-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (84, 4, 5, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-10-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (85, 4, 6, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-11-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (86, 4, 7, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2022-12-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (87, 4, 8, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-01-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (88, 4, 9, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (89, 4, 10, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (90, 4, 11, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-04-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (91, 4, 12, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-05-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (92, 4, 13, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (93, 4, 14, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (94, 4, 15, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-08-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (95, 4, 16, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (96, 4, 17, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-10-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (97, 4, 18, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-11-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (98, 4, 19, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2023-12-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (99, 4, 20, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-01-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (100, 4, 21, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (101, 4, 22, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-03-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (102, 4, 23, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-04-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (103, 4, 24, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-05-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (104, 5, 1, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-01-15' AS Date), CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (105, 5, 2, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-02-15' AS Date), CAST(N'2023-02-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (106, 5, 3, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-03-15' AS Date), CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (107, 5, 4, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-04-15' AS Date), CAST(N'2023-04-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (108, 5, 5, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-05-15' AS Date), CAST(N'2023-05-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (109, 5, 6, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (110, 5, 7, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (111, 5, 8, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-08-15' AS Date), CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (112, 5, 9, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (113, 5, 10, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-10-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (114, 5, 11, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-11-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([parcela_id], [financiamento_id], [numero_parcela], [valor_parcela], [data_vencimento], [data_pagamento]) VALUES (115, 5, 12, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-12-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Parcelas] OFF
SET IDENTITY_INSERT [dbo].[TiposFinanciamento] ON 

INSERT [dbo].[TiposFinanciamento] ([tipo_financiamento_id], [nome]) VALUES (1, N'Empréstimo CDC')
INSERT [dbo].[TiposFinanciamento] ([tipo_financiamento_id], [nome]) VALUES (2, N'Financiamento Imobiliário')
INSERT [dbo].[TiposFinanciamento] ([tipo_financiamento_id], [nome]) VALUES (3, N'Financiamento de Veículo')
SET IDENTITY_INSERT [dbo].[TiposFinanciamento] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__D836E71F79302C2B]    Script Date: 20/07/2023 10:40:37 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [UQ__Clientes__D836E71F79302C2B] UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Financiamentos]  WITH CHECK ADD  CONSTRAINT [FK__Financiam__tipo___4316F928] FOREIGN KEY([tipo_financiamento_id])
REFERENCES [dbo].[TiposFinanciamento] ([tipo_financiamento_id])
GO
ALTER TABLE [dbo].[Financiamentos] CHECK CONSTRAINT [FK__Financiam__tipo___4316F928]
GO
ALTER TABLE [dbo].[Financiamentos]  WITH CHECK ADD  CONSTRAINT [FK__Financiamen__cpf__4222D4EF] FOREIGN KEY([cpf])
REFERENCES [dbo].[Clientes] ([cpf])
GO
ALTER TABLE [dbo].[Financiamentos] CHECK CONSTRAINT [FK__Financiamen__cpf__4222D4EF]
GO
ALTER TABLE [dbo].[Parcelas]  WITH CHECK ADD  CONSTRAINT [FK__Parcelas__financ__45F365D3] FOREIGN KEY([financiamento_id])
REFERENCES [dbo].[Financiamentos] ([financiamento_id])
GO
ALTER TABLE [dbo].[Parcelas] CHECK CONSTRAINT [FK__Parcelas__financ__45F365D3]
GO
USE [master]
GO
ALTER DATABASE [FinBank] SET  READ_WRITE 
GO
