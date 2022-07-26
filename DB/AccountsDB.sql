USE [master]
GO
/****** Object:  Database [AccountsDB]    Script Date: 7/19/2022 5:57:59 PM ******/
CREATE DATABASE [AccountsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AccountsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountsDB] SET  MULTI_USER 
GO
ALTER DATABASE [AccountsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AccountsDB] SET QUERY_STORE = OFF
GO
USE [AccountsDB]
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Role] [nchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[DeletedBy] [nchar](50) NULL,
	[UID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tbl_account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_permissions]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_permissions](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[Pname] [nchar](50) NULL,
	[Pdesc] [nchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL,
 CONSTRAINT [PK_tbl_permissions] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nchar](20) NULL,
	[Permissions] [int] NULL,
	[UID] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL,
 CONSTRAINT [PK_tbl_roles] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_account] ON 

INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (55, N'John                                              ', N'iamjohn                                           ', N'John                                              ', N'Doe                                               ', N'john.doe@yahoo.com                                ', N'Developer           ', CAST(N'2022-07-07T21:53:15.317' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'0b33deb6-74f7-45a4-9b2a-6eaea5a20db3')
INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (74, N'peter                                             ', N'peter                                             ', N'Peter                                             ', N'Pan                                               ', N'peter.pan@rocketnet.com                           ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'a3a45001-0132-4989-a2c9-630a03dc7541')
INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (78, N'iop                                               ', N'iop                                               ', N'iop                                               ', N'iop                                               ', N'iop                                               ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'e3e6dde7-8e30-4dd0-9240-8cf5be30c571')
SET IDENTITY_INSERT [dbo].[tbl_account] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_permissions] ON 

INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (21, N'6f8f9d6a-5c43-46a8-a701-26e7153dda5d', N'Read                                              ', N'Read data                                         ', CAST(N'2022-07-06T18:18:21.717' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (22, N'7606d74b-8472-4a82-b7d4-74d33b641954', N'Modify                                            ', N'Modify all available data                         ', CAST(N'2022-07-06T18:20:24.757' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (25, N'8af9e708-0d00-4cd0-bcbc-3edb79e26d34', N'Write                                             ', N'Write file                                        ', CAST(N'2022-07-06T21:30:13.720' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (27, N'09c12b2d-8dde-4fab-b9d3-6edf2cb04d3e', N'Download                                          ', N'Downlaod file                                     ', CAST(N'2022-07-07T18:51:23.347' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (29, N'c205d2c1-6b11-45ff-a0db-2de4758f1b6f', N'Read and Write                                    ', N'Read and Write Access                             ', CAST(N'2022-07-07T21:58:25.030' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_roles] ON 

INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (1, N'Downloader          ', 27, N'57121a27-9e6d-4826-9e35-615072a0834c', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (3, N'HR                  ', 5, N'bc9b8b56-730c-4fb9-9c46-732e44382a78', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (4, N'HR                  ', 15, N'7a4c1bcb-0c0f-4648-8cab-4d175500dbdc', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (5, N'HR                  ', 19, N'b1833a7e-e7f5-4656-b959-d2870e64c14e', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (6, N'HR                  ', 20, N'5ae51888-c8f9-420a-b7c5-99601f33e79a', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (7, N'HR                  ', 21, N'b915a504-0c04-4246-9d5d-1d53732b380d', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (8, N'Manager             ', 22, N'56683a7d-1ddf-4365-a587-0efb38f2765a', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (9, N'Manager             ', 25, N'5d47add8-7836-48a6-930e-b1ab2dcc44dd', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (21, N'Employee            ', 20, N'1bb8e91c-4a1f-46f0-b3db-1b87757a7fdd', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (22, N'Employee            ', 21, N'5569cd70-ae37-4c9c-a081-3fe57b3107a3', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (23, N'Employee            ', 22, N'1f5684d2-f088-496d-b648-6b02b21d6be5', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (24, N'Employee            ', 25, N'd3d4e7b7-8e48-4efe-a24a-0bca091897e4', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (34, N'Admin               ', 21, N'ecba74fa-f373-448f-85bf-394c28649614', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (35, N'Admin               ', 22, N'1ed4081d-8c00-417c-b228-d102cedf6b47', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (36, N'Admin               ', 25, N'f1742004-af03-4202-aa6c-beeaac127d48', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (37, N'Admin               ', 27, N'3372c6bb-5d02-4c4c-a4c0-2686c89013ec', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RID], [RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (38, N'Developer           ', 25, N'0a390698-ed88-4d1a-9cb9-6b801d857b06', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_roles] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeletePermission]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePermission]
	@UID uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;
	delete tbl_permissions where UID=@UID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteRole]
	@RoleName nchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	delete tbl_roles where RoleName=@RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
	@AccountID int
AS
BEGIN
	SET NOCOUNT ON;
	delete tbl_account where AccountID=@AccountID
END
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAccounts]
AS
BEGIN
	SET NOCOUNT ON;
	select * from tbl_account
END
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentUser]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCurrentUser]
	@UID uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	select AccountID,FirstName,LastName,[Role],[UID] from tbl_account where [UID]=@UID
END
GO
/****** Object:  StoredProcedure [dbo].[GetPermission]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPermission]
AS
BEGIN
	SET NOCOUNT ON;
	select * from tbl_permissions
END
GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRole]
AS
BEGIN
	SET NOCOUNT ON;
	select r2.RoleName,
	stuff((
		select ',' + trim(p.Pdesc) from tbl_roles r
		left join tbl_permissions p on r.Permissions=p.PID
		where r.Rolename=r2.RoleName
		FOR XML PATH('')
	),1,1,'') Permission
from tbl_roles r2 group by r2.RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPermission]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertPermission]
	@Permission nchar(50),
	@Pdesc nchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	insert into tbl_permissions (UID,Pname,Pdesc,CreatedDate)
	values(newid(),@Permission,@pdesc,getdate())
END
GO
/****** Object:  StoredProcedure [dbo].[insertRole]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[insertRole]
	@Rolename nchar(20),
	@Permissions int
AS
BEGIN
	SET NOCOUNT ON;
	insert into tbl_roles (RoleName,[Permissions],UID)
	values(@Rolename,@Permissions,newid())
END
GO
/****** Object:  StoredProcedure [dbo].[proc_signup]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[proc_signup]
	@username nchar(50),
	@password nchar(50),
	@FirstName nchar(50),
	@LastName nchar(50),
	@Email nchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	insert into tbl_account (Username,[Password],FirstName,LastName,Email,UID)
	values(@username,@password,@FirstName,@LastName,@Email,newID())
END
GO
/****** Object:  StoredProcedure [dbo].[SignIn]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SignIn]
	@Username nchar(50),
	@Password nchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	select [UID] from tbl_account where Username=@Username and [Password]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserRole]    Script Date: 7/19/2022 5:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserRole]
	@Role nchar(20),
	@AccountID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE tbl_account SET Role=@Role where AccountID=@AccountID
END
GO
USE [master]
GO
ALTER DATABASE [AccountsDB] SET  READ_WRITE 
GO
